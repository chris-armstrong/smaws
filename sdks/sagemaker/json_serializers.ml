open Smaws_Lib.Json.SerializeHelpers
open Types

let ai_resource_identifier_to_yojson = string_to_yojson

let ai_benchmark_inference_component_to_yojson (x : ai_benchmark_inference_component) =
  assoc_to_yojson [ ("Identifier", Some (ai_resource_identifier_to_yojson x.identifier)) ]

let ai_benchmark_inference_component_list_to_yojson tree =
  list_to_yojson ai_benchmark_inference_component_to_yojson tree

let string__to_yojson = string_to_yojson

let ai_benchmark_endpoint_to_yojson (x : ai_benchmark_endpoint) =
  assoc_to_yojson
    [
      ("Identifier", Some (ai_resource_identifier_to_yojson x.identifier));
      ("TargetContainerHostname", option_to_yojson string__to_yojson x.target_container_hostname);
      ( "InferenceComponents",
        option_to_yojson ai_benchmark_inference_component_list_to_yojson x.inference_components );
    ]

let ai_benchmark_job_arn_to_yojson = string_to_yojson

let ai_benchmark_job_status_to_yojson (x : ai_benchmark_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let ai_entity_name_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let ai_benchmark_job_summary_to_yojson (x : ai_benchmark_job_summary) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
      ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn));
      ("AIBenchmarkJobStatus", Some (ai_benchmark_job_status_to_yojson x.ai_benchmark_job_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("AIWorkloadConfigName", option_to_yojson ai_entity_name_to_yojson x.ai_workload_config_name);
    ]

let ai_benchmark_job_summary_list_to_yojson tree =
  list_to_yojson ai_benchmark_job_summary_to_yojson tree

let subnet_id_to_yojson = string_to_yojson
let subnets_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let vpc_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (vpc_security_group_ids_to_yojson x.security_group_ids));
      ("Subnets", Some (subnets_to_yojson x.subnets));
    ]

let ai_benchmark_network_config_to_yojson (x : ai_benchmark_network_config) =
  assoc_to_yojson [ ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config) ]

let ai_mlflow_run_name_to_yojson = string_to_yojson
let ai_mlflow_experiment_name_to_yojson = string_to_yojson
let ai_mlflow_resource_arn_to_yojson = string_to_yojson

let ai_mlflow_config_to_yojson (x : ai_mlflow_config) =
  assoc_to_yojson
    [
      ("MlflowResourceArn", Some (ai_mlflow_resource_arn_to_yojson x.mlflow_resource_arn));
      ( "MlflowExperimentName",
        option_to_yojson ai_mlflow_experiment_name_to_yojson x.mlflow_experiment_name );
      ("MlflowRunName", option_to_yojson ai_mlflow_run_name_to_yojson x.mlflow_run_name);
    ]

let s3_uri_to_yojson = string_to_yojson

let ai_benchmark_output_config_to_yojson (x : ai_benchmark_output_config) =
  assoc_to_yojson
    [
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
    ]

let ai_cloud_watch_logs_to_yojson (x : ai_cloud_watch_logs) =
  assoc_to_yojson
    [
      ("LogGroupArn", option_to_yojson string__to_yojson x.log_group_arn);
      ("LogStreamName", option_to_yojson string__to_yojson x.log_stream_name);
    ]

let ai_cloud_watch_logs_list_to_yojson tree = list_to_yojson ai_cloud_watch_logs_to_yojson tree

let ai_benchmark_output_result_to_yojson (x : ai_benchmark_output_result) =
  assoc_to_yojson
    [
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("CloudWatchLogs", option_to_yojson ai_cloud_watch_logs_list_to_yojson x.cloud_watch_logs);
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
    ]

let ai_benchmark_target_to_yojson (x : ai_benchmark_target) =
  match x with
  | Endpoint arg -> assoc_to_yojson [ ("Endpoint", Some (ai_benchmark_endpoint_to_yojson arg)) ]

let ai_ml_reservation_arn_to_yojson = string_to_yojson
let ai_ml_reservation_arn_list_to_yojson tree = list_to_yojson ai_ml_reservation_arn_to_yojson tree

let ai_capacity_reservation_preference_to_yojson (x : ai_capacity_reservation_preference) =
  match x with CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"

let ai_capacity_reservation_config_to_yojson (x : ai_capacity_reservation_config) =
  assoc_to_yojson
    [
      ( "CapacityReservationPreference",
        option_to_yojson ai_capacity_reservation_preference_to_yojson
          x.capacity_reservation_preference );
      ( "MlReservationArns",
        option_to_yojson ai_ml_reservation_arn_list_to_yojson x.ml_reservation_arns );
    ]

let ai_channel_name_to_yojson = string_to_yojson

let ai_workload_s3_data_source_to_yojson (x : ai_workload_s3_data_source) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let ai_workload_data_source_to_yojson (x : ai_workload_data_source) =
  assoc_to_yojson
    [ ("S3DataSource", option_to_yojson ai_workload_s3_data_source_to_yojson x.s3_data_source) ]

let ai_workload_input_data_config_to_yojson (x : ai_workload_input_data_config) =
  assoc_to_yojson
    [
      ("ChannelName", Some (ai_channel_name_to_yojson x.channel_name));
      ("DataSource", Some (ai_workload_data_source_to_yojson x.data_source));
    ]

let ai_workload_input_data_config_list_to_yojson tree =
  list_to_yojson ai_workload_input_data_config_to_yojson tree

let ai_dataset_config_to_yojson (x : ai_dataset_config) =
  match x with
  | InputDataConfig arg ->
      assoc_to_yojson
        [ ("InputDataConfig", Some (ai_workload_input_data_config_list_to_yojson arg)) ]

let ai_inference_specification_name_to_yojson = string_to_yojson

let ai_model_source_s3_to_yojson (x : ai_model_source_s3) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let ai_model_source_to_yojson (x : ai_model_source) =
  match x with S3 arg -> assoc_to_yojson [ ("S3", Some (ai_model_source_s3_to_yojson arg)) ]

let ai_recommendation_performance_metric_to_yojson (x : ai_recommendation_performance_metric) =
  assoc_to_yojson
    [
      ("Metric", Some (string__to_yojson x.metric));
      ("Stat", option_to_yojson string__to_yojson x.stat);
      ("Value", Some (string__to_yojson x.value));
      ("Unit", option_to_yojson string__to_yojson x.unit_);
    ]

let expected_performance_list_to_yojson tree =
  list_to_yojson ai_recommendation_performance_metric_to_yojson tree

let environment_value_to_yojson = string_to_yojson
let environment_key_to_yojson = string_to_yojson

let environment_map_to_yojson tree =
  map_to_yojson environment_key_to_yojson environment_value_to_yojson tree

let ai_recommendation_copy_count_per_instance_to_yojson = int_to_yojson
let ai_recommendation_instance_count_to_yojson = int_to_yojson

let ai_recommendation_instance_type_to_yojson (x : ai_recommendation_instance_type) =
  match x with
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"

let ai_recommendation_deployment_s3_channel_to_yojson (x : ai_recommendation_deployment_s3_channel)
    =
  assoc_to_yojson
    [
      ("ChannelName", option_to_yojson ai_channel_name_to_yojson x.channel_name);
      ("Uri", option_to_yojson s3_uri_to_yojson x.uri);
    ]

let ai_recommendation_deployment_s3_channel_list_to_yojson tree =
  list_to_yojson ai_recommendation_deployment_s3_channel_to_yojson tree

let ai_recommendation_deployment_configuration_to_yojson
    (x : ai_recommendation_deployment_configuration) =
  assoc_to_yojson
    [
      ("S3", option_to_yojson ai_recommendation_deployment_s3_channel_list_to_yojson x.s3);
      ("ImageUri", option_to_yojson string__to_yojson x.image_uri);
      ("InstanceType", option_to_yojson ai_recommendation_instance_type_to_yojson x.instance_type);
      ("InstanceCount", option_to_yojson ai_recommendation_instance_count_to_yojson x.instance_count);
      ( "CopyCountPerInstance",
        option_to_yojson ai_recommendation_copy_count_per_instance_to_yojson
          x.copy_count_per_instance );
      ("EnvironmentVariables", option_to_yojson environment_map_to_yojson x.environment_variables);
    ]

let ai_recommendation_instance_detail_to_yojson (x : ai_recommendation_instance_detail) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson ai_recommendation_instance_type_to_yojson x.instance_type);
      ("InstanceCount", option_to_yojson ai_recommendation_instance_count_to_yojson x.instance_count);
      ( "CopyCountPerInstance",
        option_to_yojson ai_recommendation_copy_count_per_instance_to_yojson
          x.copy_count_per_instance );
    ]

let ai_recommendation_instance_detail_list_to_yojson tree =
  list_to_yojson ai_recommendation_instance_detail_to_yojson tree

let model_package_arn_to_yojson = string_to_yojson

let ai_recommendation_model_details_to_yojson (x : ai_recommendation_model_details) =
  assoc_to_yojson
    [
      ("ModelPackageArn", option_to_yojson model_package_arn_to_yojson x.model_package_arn);
      ( "InferenceSpecificationName",
        option_to_yojson ai_inference_specification_name_to_yojson x.inference_specification_name );
      ( "InstanceDetails",
        option_to_yojson ai_recommendation_instance_detail_list_to_yojson x.instance_details );
    ]

let ai_recommendation_optimization_config_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let ai_recommendation_optimization_type_to_yojson (x : ai_recommendation_optimization_type) =
  match x with
  | SPECULATIVE_DECODING -> `String "SpeculativeDecoding"
  | KERNEL_TUNING -> `String "KernelTuning"

let ai_recommendation_optimization_detail_to_yojson (x : ai_recommendation_optimization_detail) =
  assoc_to_yojson
    [
      ("OptimizationType", Some (ai_recommendation_optimization_type_to_yojson x.optimization_type));
      ( "OptimizationConfig",
        option_to_yojson ai_recommendation_optimization_config_map_to_yojson x.optimization_config
      );
    ]

let ai_recommendation_optimization_detail_list_to_yojson tree =
  list_to_yojson ai_recommendation_optimization_detail_to_yojson tree

let ai_recommendation_to_yojson (x : ai_recommendation) =
  assoc_to_yojson
    [
      ("RecommendationDescription", option_to_yojson string__to_yojson x.recommendation_description);
      ( "OptimizationDetails",
        option_to_yojson ai_recommendation_optimization_detail_list_to_yojson x.optimization_details
      );
      ("ModelDetails", option_to_yojson ai_recommendation_model_details_to_yojson x.model_details);
      ( "DeploymentConfiguration",
        option_to_yojson ai_recommendation_deployment_configuration_to_yojson
          x.deployment_configuration );
      ("AIBenchmarkJobArn", option_to_yojson ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn);
      ( "ExpectedPerformance",
        option_to_yojson expected_performance_list_to_yojson x.expected_performance );
    ]

let ai_recommendation_allow_optimization_to_yojson = bool_to_yojson

let ai_recommendation_instance_type_list_to_yojson tree =
  list_to_yojson ai_recommendation_instance_type_to_yojson tree

let ai_recommendation_compute_spec_to_yojson (x : ai_recommendation_compute_spec) =
  assoc_to_yojson
    [
      ( "InstanceTypes",
        option_to_yojson ai_recommendation_instance_type_list_to_yojson x.instance_types );
      ( "CapacityReservationConfig",
        option_to_yojson ai_capacity_reservation_config_to_yojson x.capacity_reservation_config );
    ]

let ai_recommendation_metric_to_yojson (x : ai_recommendation_metric) =
  match x with
  | TTFT_MS -> `String "ttft-ms"
  | THROUGHPUT -> `String "throughput"
  | COST -> `String "cost"

let ai_recommendation_constraint_to_yojson (x : ai_recommendation_constraint) =
  assoc_to_yojson [ ("Metric", Some (ai_recommendation_metric_to_yojson x.metric)) ]

let ai_recommendation_constraint_list_to_yojson tree =
  list_to_yojson ai_recommendation_constraint_to_yojson tree

let ai_recommendation_inference_framework_to_yojson (x : ai_recommendation_inference_framework) =
  match x with LMI -> `String "LMI" | VLLM -> `String "VLLM"

let ai_recommendation_inference_specification_to_yojson
    (x : ai_recommendation_inference_specification) =
  assoc_to_yojson
    [ ("Framework", option_to_yojson ai_recommendation_inference_framework_to_yojson x.framework) ]

let ai_recommendation_job_arn_to_yojson = string_to_yojson

let ai_recommendation_job_status_to_yojson (x : ai_recommendation_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let ai_recommendation_job_summary_to_yojson (x : ai_recommendation_job_summary) =
  assoc_to_yojson
    [
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
      ( "AIRecommendationJobStatus",
        Some (ai_recommendation_job_status_to_yojson x.ai_recommendation_job_status) );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let ai_recommendation_job_summary_list_to_yojson tree =
  list_to_yojson ai_recommendation_job_summary_to_yojson tree

let ai_recommendation_list_to_yojson tree = list_to_yojson ai_recommendation_to_yojson tree

let ai_recommendation_output_config_to_yojson (x : ai_recommendation_output_config) =
  assoc_to_yojson
    [
      ("S3OutputLocation", option_to_yojson s3_uri_to_yojson x.s3_output_location);
      ( "ModelPackageGroupIdentifier",
        option_to_yojson ai_resource_identifier_to_yojson x.model_package_group_identifier );
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
    ]

let ai_recommendation_output_result_to_yojson (x : ai_recommendation_output_result) =
  assoc_to_yojson
    [
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ( "ModelPackageGroupIdentifier",
        option_to_yojson ai_resource_identifier_to_yojson x.model_package_group_identifier );
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
    ]

let ai_recommendation_performance_target_to_yojson (x : ai_recommendation_performance_target) =
  assoc_to_yojson
    [ ("Constraints", Some (ai_recommendation_constraint_list_to_yojson x.constraints)) ]

let ai_workload_config_arn_to_yojson = string_to_yojson

let ai_workload_config_summary_to_yojson (x : ai_workload_config_summary) =
  assoc_to_yojson
    [
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
      ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let ai_workload_config_summary_list_to_yojson tree =
  list_to_yojson ai_workload_config_summary_to_yojson tree

let workload_spec_to_yojson (x : workload_spec) =
  match x with Inline arg -> assoc_to_yojson [ ("Inline", Some (string__to_yojson arg)) ]

let ai_workload_configs_to_yojson (x : ai_workload_configs) =
  assoc_to_yojson [ ("WorkloadSpec", Some (workload_spec_to_yojson x.workload_spec)) ]

let integer_to_yojson = int_to_yojson

let mig_profile_type_to_yojson (x : mig_profile_type) =
  match x with
  | MIG_1G_5GB -> `String "mig-1g.5gb"
  | MIG_1G_10GB -> `String "mig-1g.10gb"
  | MIG_1G_18GB -> `String "mig-1g.18gb"
  | MIG_1G_20GB -> `String "mig-1g.20gb"
  | MIG_1G_23GB -> `String "mig-1g.23gb"
  | MIG_1G_35GB -> `String "mig-1g.35gb"
  | MIG_1G_45GB -> `String "mig-1g.45gb"
  | MIG_1G_47GB -> `String "mig-1g.47gb"
  | MIG_2G_10GB -> `String "mig-2g.10gb"
  | MIG_2G_20GB -> `String "mig-2g.20gb"
  | MIG_2G_35GB -> `String "mig-2g.35gb"
  | MIG_2G_45GB -> `String "mig-2g.45gb"
  | MIG_2G_47GB -> `String "mig-2g.47gb"
  | MIG_3G_20GB -> `String "mig-3g.20gb"
  | MIG_3G_40GB -> `String "mig-3g.40gb"
  | MIG_3G_71GB -> `String "mig-3g.71gb"
  | MIG_3G_90GB -> `String "mig-3g.90gb"
  | MIG_3G_93GB -> `String "mig-3g.93gb"
  | MIG_4G_20GB -> `String "mig-4g.20gb"
  | MIG_4G_40GB -> `String "mig-4g.40gb"
  | MIG_4G_71GB -> `String "mig-4g.71gb"
  | MIG_4G_90GB -> `String "mig-4g.90gb"
  | MIG_4G_93GB -> `String "mig-4g.93gb"
  | MIG_7G_40GB -> `String "mig-7g.40gb"
  | MIG_7G_80GB -> `String "mig-7g.80gb"
  | MIG_7G_141GB -> `String "mig-7g.141gb"
  | MIG_7G_180GB -> `String "mig-7g.180gb"
  | MIG_7G_186GB -> `String "mig-7g.186gb"

let accelerator_partition_config_to_yojson (x : accelerator_partition_config) =
  assoc_to_yojson
    [
      ("Type", Some (mig_profile_type_to_yojson x.type_));
      ("Count", Some (integer_to_yojson x.count));
    ]

let memory_in_gi_b_amount_to_yojson = float_to_yojson
let v_cpu_amount_to_yojson = float_to_yojson
let accelerators_amount_to_yojson = int_to_yojson
let instance_count_to_yojson = int_to_yojson

let cluster_instance_type_to_yojson (x : cluster_instance_type) =
  match x with
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_12XLARGE -> `String "ml.c5.12xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_24XLARGE -> `String "ml.c5.24xlarge"
  | ML_C5N_LARGE -> `String "ml.c5n.large"
  | ML_C5N_2XLARGE -> `String "ml.c5n.2xlarge"
  | ML_C5N_4XLARGE -> `String "ml.c5n.4xlarge"
  | ML_C5N_9XLARGE -> `String "ml.c5n.9xlarge"
  | ML_C5N_18XLARGE -> `String "ml.c5n.18xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_8XLARGE -> `String "ml.m5.8xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_16XLARGE -> `String "ml.m5.16xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_GR6_4XLARGE -> `String "ml.gr6.4xlarge"
  | ML_GR6_8XLARGE -> `String "ml.gr6.8xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_TRN2_3XLARGE -> `String "ml.trn2.3xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_I3EN_LARGE -> `String "ml.i3en.large"
  | ML_I3EN_XLARGE -> `String "ml.i3en.xlarge"
  | ML_I3EN_2XLARGE -> `String "ml.i3en.2xlarge"
  | ML_I3EN_3XLARGE -> `String "ml.i3en.3xlarge"
  | ML_I3EN_6XLARGE -> `String "ml.i3en.6xlarge"
  | ML_I3EN_12XLARGE -> `String "ml.i3en.12xlarge"
  | ML_I3EN_24XLARGE -> `String "ml.i3en.24xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"

let compute_quota_resource_config_to_yojson (x : compute_quota_resource_config) =
  assoc_to_yojson
    [
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
      ("Count", option_to_yojson instance_count_to_yojson x.count);
      ("Accelerators", option_to_yojson accelerators_amount_to_yojson x.accelerators);
      ("VCpu", option_to_yojson v_cpu_amount_to_yojson x.v_cpu);
      ("MemoryInGiB", option_to_yojson memory_in_gi_b_amount_to_yojson x.memory_in_gi_b);
      ( "AcceleratorPartition",
        option_to_yojson accelerator_partition_config_to_yojson x.accelerator_partition );
    ]

let absolute_borrow_limit_resource_list_to_yojson tree =
  list_to_yojson compute_quota_resource_config_to_yojson tree

let accept_to_yojson = string_to_yojson
let accept_eula_to_yojson = bool_to_yojson

let account_default_status_to_yojson (x : account_default_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let account_id_to_yojson = string_to_yojson
let action_arn_to_yojson = string_to_yojson
let string256_to_yojson = string_to_yojson
let source_uri_to_yojson = string_to_yojson

let action_source_to_yojson (x : action_source) =
  assoc_to_yojson
    [
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("SourceId", option_to_yojson string256_to_yojson x.source_id);
    ]

let action_status_to_yojson (x : action_status) =
  match x with
  | UNKNOWN -> `String "Unknown"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let string64_to_yojson = string_to_yojson
let experiment_entity_name_to_yojson = string_to_yojson

let action_summary_to_yojson (x : action_summary) =
  assoc_to_yojson
    [
      ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn);
      ("ActionName", option_to_yojson experiment_entity_name_to_yojson x.action_name);
      ("Source", option_to_yojson action_source_to_yojson x.source);
      ("ActionType", option_to_yojson string64_to_yojson x.action_type);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let action_summaries_to_yojson tree = list_to_yojson action_summary_to_yojson tree

let activation_state_to_yojson (x : activation_state) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let active_cluster_operation_count_to_yojson = int_to_yojson

let active_cluster_operation_name_to_yojson (x : active_cluster_operation_name) =
  match x with SCALING -> `String "Scaling"

let active_operations_to_yojson tree =
  map_to_yojson active_cluster_operation_name_to_yojson active_cluster_operation_count_to_yojson
    tree

let failure_reason_to_yojson = string_to_yojson

let resource_not_found_to_yojson (x : resource_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let resource_limit_exceeded_to_yojson (x : resource_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let association_entity_arn_to_yojson = string_to_yojson

let add_association_response_to_yojson (x : add_association_response) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
    ]

let association_edge_type_to_yojson (x : association_edge_type) =
  match x with
  | CONTRIBUTED_TO -> `String "ContributedTo"
  | ASSOCIATED_WITH -> `String "AssociatedWith"
  | DERIVED_FROM -> `String "DerivedFrom"
  | PRODUCED -> `String "Produced"
  | SAME_AS -> `String "SameAs"

let add_association_request_to_yojson (x : add_association_request) =
  assoc_to_yojson
    [
      ("SourceArn", Some (association_entity_arn_to_yojson x.source_arn));
      ("DestinationArn", Some (association_entity_arn_to_yojson x.destination_arn));
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
    ]

let cluster_instance_types_to_yojson tree = list_to_yojson cluster_instance_type_to_yojson tree
let cluster_availability_zone_to_yojson = string_to_yojson

let cluster_availability_zones_to_yojson tree =
  list_to_yojson cluster_availability_zone_to_yojson tree

let batch_add_increment_count_to_yojson = int_to_yojson
let cluster_instance_group_name_to_yojson = string_to_yojson

let add_cluster_node_specification_to_yojson (x : add_cluster_node_specification) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ( "IncrementTargetCountBy",
        Some (batch_add_increment_count_to_yojson x.increment_target_count_by) );
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
    ]

let add_cluster_node_specification_list_to_yojson tree =
  list_to_yojson add_cluster_node_specification_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_output_to_yojson (x : add_tags_output) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let resource_arn_to_yojson = string_to_yojson

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let code_repository_name_or_url_to_yojson = string_to_yojson

let additional_code_repository_names_or_urls_to_yojson tree =
  list_to_yojson code_repository_name_or_url_to_yojson tree

let efa_enis_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let additional_enis_to_yojson (x : additional_enis) =
  assoc_to_yojson [ ("EfaEnis", option_to_yojson efa_enis_to_yojson x.efa_enis) ]

let response_mime_type_to_yojson = string_to_yojson
let response_mime_types_to_yojson tree = list_to_yojson response_mime_type_to_yojson tree
let content_type_to_yojson = string_to_yojson
let content_types_to_yojson tree = list_to_yojson content_type_to_yojson tree

let production_variant_instance_type_to_yojson (x : production_variant_instance_type) =
  match x with
  | ML_T2_MEDIUM -> `String "ml.t2.medium"
  | ML_T2_LARGE -> `String "ml.t2.large"
  | ML_T2_XLARGE -> `String "ml.t2.xlarge"
  | ML_T2_2XLARGE -> `String "ml.t2.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_C4_LARGE -> `String "ml.c4.large"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5D_LARGE -> `String "ml.c5d.large"
  | ML_C5D_XLARGE -> `String "ml.c5d.xlarge"
  | ML_C5D_2XLARGE -> `String "ml.c5d.2xlarge"
  | ML_C5D_4XLARGE -> `String "ml.c5d.4xlarge"
  | ML_C5D_9XLARGE -> `String "ml.c5d.9xlarge"
  | ML_C5D_18XLARGE -> `String "ml.c5d.18xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_INF1_XLARGE -> `String "ml.inf1.xlarge"
  | ML_INF1_2XLARGE -> `String "ml.inf1.2xlarge"
  | ML_INF1_6XLARGE -> `String "ml.inf1.6xlarge"
  | ML_INF1_24XLARGE -> `String "ml.inf1.24xlarge"
  | ML_DL1_24XLARGE -> `String "ml.dl1.24xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_R8G_MEDIUM -> `String "ml.r8g.medium"
  | ML_R8G_LARGE -> `String "ml.r8g.large"
  | ML_R8G_XLARGE -> `String "ml.r8g.xlarge"
  | ML_R8G_2XLARGE -> `String "ml.r8g.2xlarge"
  | ML_R8G_4XLARGE -> `String "ml.r8g.4xlarge"
  | ML_R8G_8XLARGE -> `String "ml.r8g.8xlarge"
  | ML_R8G_12XLARGE -> `String "ml.r8g.12xlarge"
  | ML_R8G_16XLARGE -> `String "ml.r8g.16xlarge"
  | ML_R8G_24XLARGE -> `String "ml.r8g.24xlarge"
  | ML_R8G_48XLARGE -> `String "ml.r8g.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_C7G_LARGE -> `String "ml.c7g.large"
  | ML_C7G_XLARGE -> `String "ml.c7g.xlarge"
  | ML_C7G_2XLARGE -> `String "ml.c7g.2xlarge"
  | ML_C7G_4XLARGE -> `String "ml.c7g.4xlarge"
  | ML_C7G_8XLARGE -> `String "ml.c7g.8xlarge"
  | ML_C7G_12XLARGE -> `String "ml.c7g.12xlarge"
  | ML_C7G_16XLARGE -> `String "ml.c7g.16xlarge"
  | ML_M6G_LARGE -> `String "ml.m6g.large"
  | ML_M6G_XLARGE -> `String "ml.m6g.xlarge"
  | ML_M6G_2XLARGE -> `String "ml.m6g.2xlarge"
  | ML_M6G_4XLARGE -> `String "ml.m6g.4xlarge"
  | ML_M6G_8XLARGE -> `String "ml.m6g.8xlarge"
  | ML_M6G_12XLARGE -> `String "ml.m6g.12xlarge"
  | ML_M6G_16XLARGE -> `String "ml.m6g.16xlarge"
  | ML_M6GD_LARGE -> `String "ml.m6gd.large"
  | ML_M6GD_XLARGE -> `String "ml.m6gd.xlarge"
  | ML_M6GD_2XLARGE -> `String "ml.m6gd.2xlarge"
  | ML_M6GD_4XLARGE -> `String "ml.m6gd.4xlarge"
  | ML_M6GD_8XLARGE -> `String "ml.m6gd.8xlarge"
  | ML_M6GD_12XLARGE -> `String "ml.m6gd.12xlarge"
  | ML_M6GD_16XLARGE -> `String "ml.m6gd.16xlarge"
  | ML_C6G_LARGE -> `String "ml.c6g.large"
  | ML_C6G_XLARGE -> `String "ml.c6g.xlarge"
  | ML_C6G_2XLARGE -> `String "ml.c6g.2xlarge"
  | ML_C6G_4XLARGE -> `String "ml.c6g.4xlarge"
  | ML_C6G_8XLARGE -> `String "ml.c6g.8xlarge"
  | ML_C6G_12XLARGE -> `String "ml.c6g.12xlarge"
  | ML_C6G_16XLARGE -> `String "ml.c6g.16xlarge"
  | ML_C6GD_LARGE -> `String "ml.c6gd.large"
  | ML_C6GD_XLARGE -> `String "ml.c6gd.xlarge"
  | ML_C6GD_2XLARGE -> `String "ml.c6gd.2xlarge"
  | ML_C6GD_4XLARGE -> `String "ml.c6gd.4xlarge"
  | ML_C6GD_8XLARGE -> `String "ml.c6gd.8xlarge"
  | ML_C6GD_12XLARGE -> `String "ml.c6gd.12xlarge"
  | ML_C6GD_16XLARGE -> `String "ml.c6gd.16xlarge"
  | ML_C6GN_LARGE -> `String "ml.c6gn.large"
  | ML_C6GN_XLARGE -> `String "ml.c6gn.xlarge"
  | ML_C6GN_2XLARGE -> `String "ml.c6gn.2xlarge"
  | ML_C6GN_4XLARGE -> `String "ml.c6gn.4xlarge"
  | ML_C6GN_8XLARGE -> `String "ml.c6gn.8xlarge"
  | ML_C6GN_12XLARGE -> `String "ml.c6gn.12xlarge"
  | ML_C6GN_16XLARGE -> `String "ml.c6gn.16xlarge"
  | ML_R6G_LARGE -> `String "ml.r6g.large"
  | ML_R6G_XLARGE -> `String "ml.r6g.xlarge"
  | ML_R6G_2XLARGE -> `String "ml.r6g.2xlarge"
  | ML_R6G_4XLARGE -> `String "ml.r6g.4xlarge"
  | ML_R6G_8XLARGE -> `String "ml.r6g.8xlarge"
  | ML_R6G_12XLARGE -> `String "ml.r6g.12xlarge"
  | ML_R6G_16XLARGE -> `String "ml.r6g.16xlarge"
  | ML_R6GD_LARGE -> `String "ml.r6gd.large"
  | ML_R6GD_XLARGE -> `String "ml.r6gd.xlarge"
  | ML_R6GD_2XLARGE -> `String "ml.r6gd.2xlarge"
  | ML_R6GD_4XLARGE -> `String "ml.r6gd.4xlarge"
  | ML_R6GD_8XLARGE -> `String "ml.r6gd.8xlarge"
  | ML_R6GD_12XLARGE -> `String "ml.r6gd.12xlarge"
  | ML_R6GD_16XLARGE -> `String "ml.r6gd.16xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_C8G_MEDIUM -> `String "ml.c8g.medium"
  | ML_C8G_LARGE -> `String "ml.c8g.large"
  | ML_C8G_XLARGE -> `String "ml.c8g.xlarge"
  | ML_C8G_2XLARGE -> `String "ml.c8g.2xlarge"
  | ML_C8G_4XLARGE -> `String "ml.c8g.4xlarge"
  | ML_C8G_8XLARGE -> `String "ml.c8g.8xlarge"
  | ML_C8G_12XLARGE -> `String "ml.c8g.12xlarge"
  | ML_C8G_16XLARGE -> `String "ml.c8g.16xlarge"
  | ML_C8G_24XLARGE -> `String "ml.c8g.24xlarge"
  | ML_C8G_48XLARGE -> `String "ml.c8g.48xlarge"
  | ML_R7GD_MEDIUM -> `String "ml.r7gd.medium"
  | ML_R7GD_LARGE -> `String "ml.r7gd.large"
  | ML_R7GD_XLARGE -> `String "ml.r7gd.xlarge"
  | ML_R7GD_2XLARGE -> `String "ml.r7gd.2xlarge"
  | ML_R7GD_4XLARGE -> `String "ml.r7gd.4xlarge"
  | ML_R7GD_8XLARGE -> `String "ml.r7gd.8xlarge"
  | ML_R7GD_12XLARGE -> `String "ml.r7gd.12xlarge"
  | ML_R7GD_16XLARGE -> `String "ml.r7gd.16xlarge"
  | ML_M8G_MEDIUM -> `String "ml.m8g.medium"
  | ML_M8G_LARGE -> `String "ml.m8g.large"
  | ML_M8G_XLARGE -> `String "ml.m8g.xlarge"
  | ML_M8G_2XLARGE -> `String "ml.m8g.2xlarge"
  | ML_M8G_4XLARGE -> `String "ml.m8g.4xlarge"
  | ML_M8G_8XLARGE -> `String "ml.m8g.8xlarge"
  | ML_M8G_12XLARGE -> `String "ml.m8g.12xlarge"
  | ML_M8G_16XLARGE -> `String "ml.m8g.16xlarge"
  | ML_M8G_24XLARGE -> `String "ml.m8g.24xlarge"
  | ML_M8G_48XLARGE -> `String "ml.m8g.48xlarge"
  | ML_C6IN_LARGE -> `String "ml.c6in.large"
  | ML_C6IN_XLARGE -> `String "ml.c6in.xlarge"
  | ML_C6IN_2XLARGE -> `String "ml.c6in.2xlarge"
  | ML_C6IN_4XLARGE -> `String "ml.c6in.4xlarge"
  | ML_C6IN_8XLARGE -> `String "ml.c6in.8xlarge"
  | ML_C6IN_12XLARGE -> `String "ml.c6in.12xlarge"
  | ML_C6IN_16XLARGE -> `String "ml.c6in.16xlarge"
  | ML_C6IN_24XLARGE -> `String "ml.c6in.24xlarge"
  | ML_C6IN_32XLARGE -> `String "ml.c6in.32xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"

let realtime_inference_instance_types_to_yojson tree =
  list_to_yojson production_variant_instance_type_to_yojson tree

let transform_instance_type_to_yojson (x : transform_instance_type) =
  match x with
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"

let transform_instance_types_to_yojson tree = list_to_yojson transform_instance_type_to_yojson tree
let recipe_name_to_yojson = string_to_yojson
let hub_content_version_to_yojson = string_to_yojson
let hub_content_name_to_yojson = string_to_yojson

let base_model_to_yojson (x : base_model) =
  assoc_to_yojson
    [
      ("HubContentName", option_to_yojson hub_content_name_to_yojson x.hub_content_name);
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("RecipeName", option_to_yojson recipe_name_to_yojson x.recipe_name);
    ]

let boolean__to_yojson = bool_to_yojson

let compression_type_to_yojson (x : compression_type) =
  match x with NONE -> `String "None" | GZIP -> `String "Gzip"

let additional_s3_data_source_data_type_to_yojson (x : additional_s3_data_source_data_type) =
  match x with S3OBJECT -> `String "S3Object" | S3PREFIX -> `String "S3Prefix"

let additional_s3_data_source_to_yojson (x : additional_s3_data_source) =
  assoc_to_yojson
    [
      ("S3DataType", Some (additional_s3_data_source_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("ETag", option_to_yojson string__to_yojson x.e_tag);
    ]

let s3_model_uri_to_yojson = string_to_yojson
let hub_content_arn_to_yojson = string_to_yojson

let inference_hub_access_config_to_yojson (x : inference_hub_access_config) =
  assoc_to_yojson [ ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn)) ]

let model_access_config_to_yojson (x : model_access_config) =
  assoc_to_yojson [ ("AcceptEula", Some (accept_eula_to_yojson x.accept_eula)) ]

let model_compression_type_to_yojson (x : model_compression_type) =
  match x with None_ -> `String "None" | Gzip -> `String "Gzip"

let s3_model_data_type_to_yojson (x : s3_model_data_type) =
  match x with S3Prefix -> `String "S3Prefix" | S3Object -> `String "S3Object"

let s3_model_data_source_to_yojson (x : s3_model_data_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_model_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (s3_model_data_type_to_yojson x.s3_data_type));
      ("CompressionType", Some (model_compression_type_to_yojson x.compression_type));
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
      ("HubAccessConfig", option_to_yojson inference_hub_access_config_to_yojson x.hub_access_config);
      ("ManifestS3Uri", option_to_yojson s3_model_uri_to_yojson x.manifest_s3_uri);
      ("ETag", option_to_yojson string__to_yojson x.e_tag);
      ("ManifestEtag", option_to_yojson string__to_yojson x.manifest_etag);
    ]

let additional_model_channel_name_to_yojson = string_to_yojson

let additional_model_data_source_to_yojson (x : additional_model_data_source) =
  assoc_to_yojson
    [
      ("ChannelName", Some (additional_model_channel_name_to_yojson x.channel_name));
      ("S3DataSource", Some (s3_model_data_source_to_yojson x.s3_data_source));
    ]

let additional_model_data_sources_to_yojson tree =
  list_to_yojson additional_model_data_source_to_yojson tree

let model_package_framework_version_to_yojson = string_to_yojson
let data_input_config_to_yojson = string_to_yojson

let model_input_to_yojson (x : model_input) =
  assoc_to_yojson [ ("DataInputConfig", Some (data_input_config_to_yojson x.data_input_config)) ]

let product_id_to_yojson = string_to_yojson

let model_data_source_to_yojson (x : model_data_source) =
  assoc_to_yojson
    [ ("S3DataSource", option_to_yojson s3_model_data_source_to_yojson x.s3_data_source) ]

let url_to_yojson = string_to_yojson
let image_digest_to_yojson = string_to_yojson
let container_image_to_yojson = string_to_yojson
let container_hostname_to_yojson = string_to_yojson

let model_package_container_definition_to_yojson (x : model_package_container_definition) =
  assoc_to_yojson
    [
      ("ContainerHostname", option_to_yojson container_hostname_to_yojson x.container_hostname);
      ("Image", option_to_yojson container_image_to_yojson x.image);
      ("ImageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ModelInput", option_to_yojson model_input_to_yojson x.model_input);
      ("Framework", option_to_yojson string__to_yojson x.framework);
      ( "FrameworkVersion",
        option_to_yojson model_package_framework_version_to_yojson x.framework_version );
      ("NearestModelName", option_to_yojson string__to_yojson x.nearest_model_name);
      ( "AdditionalModelDataSources",
        option_to_yojson additional_model_data_sources_to_yojson x.additional_model_data_sources );
      ( "AdditionalS3DataSource",
        option_to_yojson additional_s3_data_source_to_yojson x.additional_s3_data_source );
      ("ModelDataETag", option_to_yojson string__to_yojson x.model_data_e_tag);
      ("IsCheckpoint", option_to_yojson boolean__to_yojson x.is_checkpoint);
      ("BaseModel", option_to_yojson base_model_to_yojson x.base_model);
    ]

let model_package_container_definition_list_to_yojson tree =
  list_to_yojson model_package_container_definition_to_yojson tree

let entity_description_to_yojson = string_to_yojson
let entity_name_to_yojson = string_to_yojson

let additional_inference_specification_definition_to_yojson
    (x : additional_inference_specification_definition) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Containers", Some (model_package_container_definition_list_to_yojson x.containers));
      ( "SupportedTransformInstanceTypes",
        option_to_yojson transform_instance_types_to_yojson x.supported_transform_instance_types );
      ( "SupportedRealtimeInferenceInstanceTypes",
        option_to_yojson realtime_inference_instance_types_to_yojson
          x.supported_realtime_inference_instance_types );
      ("SupportedContentTypes", option_to_yojson content_types_to_yojson x.supported_content_types);
      ( "SupportedResponseMIMETypes",
        option_to_yojson response_mime_types_to_yojson x.supported_response_mime_types );
    ]

let additional_inference_specifications_to_yojson tree =
  list_to_yojson additional_inference_specification_definition_to_yojson tree

let long_to_yojson = long_to_yojson
let edge_version_to_yojson = string_to_yojson

let agent_version_to_yojson (x : agent_version) =
  assoc_to_yojson
    [
      ("Version", Some (edge_version_to_yojson x.version));
      ("AgentCount", Some (long_to_yojson x.agent_count));
    ]

let agent_versions_to_yojson tree = list_to_yojson agent_version_to_yojson tree

let aggregation_transformation_value_to_yojson (x : aggregation_transformation_value) =
  match x with
  | Sum -> `String "sum"
  | Avg -> `String "avg"
  | First -> `String "first"
  | Min -> `String "min"
  | Max -> `String "max"

let transformation_attribute_name_to_yojson = string_to_yojson

let aggregation_transformations_to_yojson tree =
  map_to_yojson transformation_attribute_name_to_yojson aggregation_transformation_value_to_yojson
    tree

let alarm_name_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson [ ("AlarmName", option_to_yojson alarm_name_to_yojson x.alarm_name) ]

let alarm_details_to_yojson (x : alarm_details) =
  assoc_to_yojson [ ("AlarmName", Some (alarm_name_to_yojson x.alarm_name)) ]

let alarm_list_to_yojson tree = list_to_yojson alarm_to_yojson tree
let algorithm_arn_to_yojson = string_to_yojson
let algorithm_image_to_yojson = string_to_yojson

let algorithm_sort_by_to_yojson (x : algorithm_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let training_repository_credentials_provider_arn_to_yojson = string_to_yojson

let training_repository_auth_config_to_yojson (x : training_repository_auth_config) =
  assoc_to_yojson
    [
      ( "TrainingRepositoryCredentialsProviderArn",
        Some
          (training_repository_credentials_provider_arn_to_yojson
             x.training_repository_credentials_provider_arn) );
    ]

let training_repository_access_mode_to_yojson (x : training_repository_access_mode) =
  match x with PLATFORM -> `String "Platform" | VPC -> `String "Vpc"

let training_image_config_to_yojson (x : training_image_config) =
  assoc_to_yojson
    [
      ( "TrainingRepositoryAccessMode",
        Some (training_repository_access_mode_to_yojson x.training_repository_access_mode) );
      ( "TrainingRepositoryAuthConfig",
        option_to_yojson training_repository_auth_config_to_yojson x.training_repository_auth_config
      );
    ]

let training_container_argument_to_yojson = string_to_yojson

let training_container_arguments_to_yojson tree =
  list_to_yojson training_container_argument_to_yojson tree

let training_container_entrypoint_string_to_yojson = string_to_yojson

let training_container_entrypoint_to_yojson tree =
  list_to_yojson training_container_entrypoint_string_to_yojson tree

let metric_regex_to_yojson = string_to_yojson
let metric_name_to_yojson = string_to_yojson

let metric_definition_to_yojson (x : metric_definition) =
  assoc_to_yojson
    [
      ("Name", Some (metric_name_to_yojson x.name)); ("Regex", Some (metric_regex_to_yojson x.regex));
    ]

let metric_definition_list_to_yojson tree = list_to_yojson metric_definition_to_yojson tree

let training_input_mode_to_yojson (x : training_input_mode) =
  match x with PIPE -> `String "Pipe" | FILE -> `String "File" | FASTFILE -> `String "FastFile"

let arn_or_name_to_yojson = string_to_yojson

let algorithm_specification_to_yojson (x : algorithm_specification) =
  assoc_to_yojson
    [
      ("TrainingImage", option_to_yojson algorithm_image_to_yojson x.training_image);
      ("AlgorithmName", option_to_yojson arn_or_name_to_yojson x.algorithm_name);
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
      ( "EnableSageMakerMetricsTimeSeries",
        option_to_yojson boolean__to_yojson x.enable_sage_maker_metrics_time_series );
      ( "ContainerEntrypoint",
        option_to_yojson training_container_entrypoint_to_yojson x.container_entrypoint );
      ( "ContainerArguments",
        option_to_yojson training_container_arguments_to_yojson x.container_arguments );
      ( "TrainingImageConfig",
        option_to_yojson training_image_config_to_yojson x.training_image_config );
    ]

let algorithm_status_to_yojson (x : algorithm_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"

let detailed_algorithm_status_to_yojson (x : detailed_algorithm_status) =
  match x with
  | NOT_STARTED -> `String "NotStarted"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"

let algorithm_status_item_to_yojson (x : algorithm_status_item) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Status", Some (detailed_algorithm_status_to_yojson x.status));
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
    ]

let algorithm_status_item_list_to_yojson tree = list_to_yojson algorithm_status_item_to_yojson tree

let algorithm_status_details_to_yojson (x : algorithm_status_details) =
  assoc_to_yojson
    [
      ( "ValidationStatuses",
        option_to_yojson algorithm_status_item_list_to_yojson x.validation_statuses );
      ( "ImageScanStatuses",
        option_to_yojson algorithm_status_item_list_to_yojson x.image_scan_statuses );
    ]

let creation_time_to_yojson = timestamp_epoch_seconds_to_yojson

let algorithm_summary_to_yojson (x : algorithm_summary) =
  assoc_to_yojson
    [
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
      ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("AlgorithmStatus", Some (algorithm_status_to_yojson x.algorithm_status));
    ]

let algorithm_summary_list_to_yojson tree = list_to_yojson algorithm_summary_to_yojson tree
let transform_ami_version_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson
let transform_instance_count_to_yojson = int_to_yojson

let transform_resources_to_yojson (x : transform_resources) =
  assoc_to_yojson
    [
      ("InstanceType", Some (transform_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (transform_instance_count_to_yojson x.instance_count));
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "TransformAmiVersion",
        option_to_yojson transform_ami_version_to_yojson x.transform_ami_version );
    ]

let assembly_type_to_yojson (x : assembly_type) =
  match x with NONE -> `String "None" | LINE -> `String "Line"

let transform_output_to_yojson (x : transform_output) =
  assoc_to_yojson
    [
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("Accept", option_to_yojson accept_to_yojson x.accept);
      ("AssembleWith", option_to_yojson assembly_type_to_yojson x.assemble_with);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let split_type_to_yojson (x : split_type) =
  match x with
  | NONE -> `String "None"
  | LINE -> `String "Line"
  | RECORDIO -> `String "RecordIO"
  | TFRECORD -> `String "TFRecord"

let s3_data_type_to_yojson (x : s3_data_type) =
  match x with
  | MANIFEST_FILE -> `String "ManifestFile"
  | S3_PREFIX -> `String "S3Prefix"
  | AUGMENTED_MANIFEST_FILE -> `String "AugmentedManifestFile"
  | CONVERSE -> `String "Converse"

let transform_s3_data_source_to_yojson (x : transform_s3_data_source) =
  assoc_to_yojson
    [
      ("S3DataType", Some (s3_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let transform_data_source_to_yojson (x : transform_data_source) =
  assoc_to_yojson [ ("S3DataSource", Some (transform_s3_data_source_to_yojson x.s3_data_source)) ]

let transform_input_to_yojson (x : transform_input) =
  assoc_to_yojson
    [
      ("DataSource", Some (transform_data_source_to_yojson x.data_source));
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("SplitType", option_to_yojson split_type_to_yojson x.split_type);
    ]

let transform_environment_value_to_yojson = string_to_yojson
let transform_environment_key_to_yojson = string_to_yojson

let transform_environment_map_to_yojson tree =
  map_to_yojson transform_environment_key_to_yojson transform_environment_value_to_yojson tree

let batch_strategy_to_yojson (x : batch_strategy) =
  match x with MULTI_RECORD -> `String "MultiRecord" | SINGLE_RECORD -> `String "SingleRecord"

let max_payload_in_m_b_to_yojson = int_to_yojson
let max_concurrent_transforms_to_yojson = int_to_yojson

let transform_job_definition_to_yojson (x : transform_job_definition) =
  assoc_to_yojson
    [
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("TransformOutput", Some (transform_output_to_yojson x.transform_output));
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
    ]

let max_pending_time_in_seconds_to_yojson = int_to_yojson
let max_wait_time_in_seconds_to_yojson = int_to_yojson
let max_runtime_in_seconds_to_yojson = int_to_yojson

let stopping_condition_to_yojson (x : stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        option_to_yojson max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds );
      ( "MaxWaitTimeInSeconds",
        option_to_yojson max_wait_time_in_seconds_to_yojson x.max_wait_time_in_seconds );
      ( "MaxPendingTimeInSeconds",
        option_to_yojson max_pending_time_in_seconds_to_yojson x.max_pending_time_in_seconds );
    ]

let training_instance_count_to_yojson = int_to_yojson

let placement_specification_to_yojson (x : placement_specification) =
  assoc_to_yojson
    [
      ("UltraServerId", option_to_yojson string256_to_yojson x.ultra_server_id);
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
    ]

let placement_specifications_to_yojson tree = list_to_yojson placement_specification_to_yojson tree

let instance_placement_config_to_yojson (x : instance_placement_config) =
  assoc_to_yojson
    [
      ("EnableMultipleJobs", option_to_yojson boolean__to_yojson x.enable_multiple_jobs);
      ( "PlacementSpecifications",
        option_to_yojson placement_specifications_to_yojson x.placement_specifications );
    ]

let training_plan_arn_to_yojson = string_to_yojson
let instance_group_name_to_yojson = string_to_yojson

let training_instance_type_to_yojson (x : training_instance_type) =
  match x with
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5N_XLARGE -> `String "ml.c5n.xlarge"
  | ML_C5N_2XLARGE -> `String "ml.c5n.2xlarge"
  | ML_C5N_4XLARGE -> `String "ml.c5n.4xlarge"
  | ML_C5N_9XLARGE -> `String "ml.c5n.9xlarge"
  | ML_C5N_18XLARGE -> `String "ml.c5n.18xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_8XLARGE -> `String "ml.r5d.8xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"

let instance_group_to_yojson (x : instance_group) =
  assoc_to_yojson
    [
      ("InstanceType", Some (training_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
      ("InstanceGroupName", Some (instance_group_name_to_yojson x.instance_group_name));
    ]

let instance_groups_to_yojson tree = list_to_yojson instance_group_to_yojson tree
let keep_alive_period_in_seconds_to_yojson = int_to_yojson
let optional_volume_size_in_g_b_to_yojson = int_to_yojson

let resource_config_to_yojson (x : resource_config) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson training_instance_type_to_yojson x.instance_type);
      ("InstanceCount", option_to_yojson training_instance_count_to_yojson x.instance_count);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "KeepAlivePeriodInSeconds",
        option_to_yojson keep_alive_period_in_seconds_to_yojson x.keep_alive_period_in_seconds );
      ("InstanceGroups", option_to_yojson instance_groups_to_yojson x.instance_groups);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ( "InstancePlacementConfig",
        option_to_yojson instance_placement_config_to_yojson x.instance_placement_config );
    ]

let output_compression_type_to_yojson (x : output_compression_type) =
  match x with GZIP -> `String "GZIP" | NONE -> `String "NONE"

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("CompressionType", option_to_yojson output_compression_type_to_yojson x.compression_type);
    ]

let seed_to_yojson = long_to_yojson

let shuffle_config_to_yojson (x : shuffle_config) =
  assoc_to_yojson [ ("Seed", Some (seed_to_yojson x.seed)) ]

let record_wrapper_to_yojson (x : record_wrapper) =
  match x with NONE -> `String "None" | RECORDIO -> `String "RecordIO"

let hub_data_set_arn_to_yojson = string_to_yojson

let dataset_source_to_yojson (x : dataset_source) =
  assoc_to_yojson [ ("DatasetArn", Some (hub_data_set_arn_to_yojson x.dataset_arn)) ]

let directory_path_to_yojson = string_to_yojson

let file_system_type_to_yojson (x : file_system_type) =
  match x with EFS -> `String "EFS" | FSXLUSTRE -> `String "FSxLustre"

let file_system_access_mode_to_yojson (x : file_system_access_mode) =
  match x with RW -> `String "rw" | RO -> `String "ro"

let file_system_id_to_yojson = string_to_yojson

let file_system_data_source_to_yojson (x : file_system_data_source) =
  assoc_to_yojson
    [
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ("FileSystemAccessMode", Some (file_system_access_mode_to_yojson x.file_system_access_mode));
      ("FileSystemType", Some (file_system_type_to_yojson x.file_system_type));
      ("DirectoryPath", Some (directory_path_to_yojson x.directory_path));
    ]

let hub_access_config_to_yojson (x : hub_access_config) =
  assoc_to_yojson [ ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn)) ]

let instance_group_names_to_yojson tree = list_to_yojson instance_group_name_to_yojson tree
let attribute_name_to_yojson = string_to_yojson
let attribute_names_to_yojson tree = list_to_yojson attribute_name_to_yojson tree

let s3_data_distribution_to_yojson (x : s3_data_distribution) =
  match x with
  | FULLY_REPLICATED -> `String "FullyReplicated"
  | SHARDED_BY_S3_KEY -> `String "ShardedByS3Key"

let s3_data_source_to_yojson (x : s3_data_source) =
  assoc_to_yojson
    [
      ("S3DataType", Some (s3_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ( "S3DataDistributionType",
        option_to_yojson s3_data_distribution_to_yojson x.s3_data_distribution_type );
      ("AttributeNames", option_to_yojson attribute_names_to_yojson x.attribute_names);
      ("InstanceGroupNames", option_to_yojson instance_group_names_to_yojson x.instance_group_names);
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
      ("HubAccessConfig", option_to_yojson hub_access_config_to_yojson x.hub_access_config);
    ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("S3DataSource", option_to_yojson s3_data_source_to_yojson x.s3_data_source);
      ( "FileSystemDataSource",
        option_to_yojson file_system_data_source_to_yojson x.file_system_data_source );
      ("DatasetSource", option_to_yojson dataset_source_to_yojson x.dataset_source);
    ]

let channel_name_to_yojson = string_to_yojson

let channel_to_yojson (x : channel) =
  assoc_to_yojson
    [
      ("ChannelName", Some (channel_name_to_yojson x.channel_name));
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("RecordWrapperType", option_to_yojson record_wrapper_to_yojson x.record_wrapper_type);
      ("InputMode", option_to_yojson training_input_mode_to_yojson x.input_mode);
      ("ShuffleConfig", option_to_yojson shuffle_config_to_yojson x.shuffle_config);
    ]

let input_data_config_to_yojson tree = list_to_yojson channel_to_yojson tree
let hyper_parameter_value_to_yojson = string_to_yojson
let hyper_parameter_key_to_yojson = string_to_yojson

let hyper_parameters_to_yojson tree =
  map_to_yojson hyper_parameter_key_to_yojson hyper_parameter_value_to_yojson tree

let training_job_definition_to_yojson (x : training_job_definition) =
  assoc_to_yojson
    [
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("ResourceConfig", Some (resource_config_to_yojson x.resource_config));
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
    ]

let algorithm_validation_profile_to_yojson (x : algorithm_validation_profile) =
  assoc_to_yojson
    [
      ("ProfileName", Some (entity_name_to_yojson x.profile_name));
      ("TrainingJobDefinition", Some (training_job_definition_to_yojson x.training_job_definition));
      ( "TransformJobDefinition",
        option_to_yojson transform_job_definition_to_yojson x.transform_job_definition );
    ]

let algorithm_validation_profiles_to_yojson tree =
  list_to_yojson algorithm_validation_profile_to_yojson tree

let role_arn_to_yojson = string_to_yojson

let algorithm_validation_specification_to_yojson (x : algorithm_validation_specification) =
  assoc_to_yojson
    [
      ("ValidationRole", Some (role_arn_to_yojson x.validation_role));
      ("ValidationProfiles", Some (algorithm_validation_profiles_to_yojson x.validation_profiles));
    ]

let q_profile_arn_to_yojson = string_to_yojson

let feature_status_to_yojson (x : feature_status) =
  match x with Enabled -> `String "ENABLED" | Disabled -> `String "DISABLED"

let amazon_q_settings_to_yojson (x : amazon_q_settings) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ("QProfileArn", option_to_yojson q_profile_arn_to_yojson x.q_profile_arn);
    ]

let lambda_function_arn_to_yojson = string_to_yojson

let annotation_consolidation_config_to_yojson (x : annotation_consolidation_config) =
  assoc_to_yojson
    [
      ( "AnnotationConsolidationLambdaArn",
        Some (lambda_function_arn_to_yojson x.annotation_consolidation_lambda_arn) );
    ]

let app_arn_to_yojson = string_to_yojson
let studio_resource_spec_training_plan_arn_to_yojson = string_to_yojson
let studio_lifecycle_config_arn_to_yojson = string_to_yojson

let app_instance_type_to_yojson (x : app_instance_type) =
  match x with
  | SYSTEM -> `String "system"
  | ML_T3_MICRO -> `String "ml.t3.micro"
  | ML_T3_SMALL -> `String "ml.t3.small"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_8XLARGE -> `String "ml.m5.8xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_16XLARGE -> `String "ml.m5.16xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_8XLARGE -> `String "ml.m5d.8xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_16XLARGE -> `String "ml.m5d.16xlarge"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_12XLARGE -> `String "ml.c5.12xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_24XLARGE -> `String "ml.c5.24xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_GEOSPATIAL_INTERACTIVE -> `String "ml.geospatial.interactive"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_M6ID_LARGE -> `String "ml.m6id.large"
  | ML_M6ID_XLARGE -> `String "ml.m6id.xlarge"
  | ML_M6ID_2XLARGE -> `String "ml.m6id.2xlarge"
  | ML_M6ID_4XLARGE -> `String "ml.m6id.4xlarge"
  | ML_M6ID_8XLARGE -> `String "ml.m6id.8xlarge"
  | ML_M6ID_12XLARGE -> `String "ml.m6id.12xlarge"
  | ML_M6ID_16XLARGE -> `String "ml.m6id.16xlarge"
  | ML_M6ID_24XLARGE -> `String "ml.m6id.24xlarge"
  | ML_M6ID_32XLARGE -> `String "ml.m6id.32xlarge"
  | ML_C6ID_LARGE -> `String "ml.c6id.large"
  | ML_C6ID_XLARGE -> `String "ml.c6id.xlarge"
  | ML_C6ID_2XLARGE -> `String "ml.c6id.2xlarge"
  | ML_C6ID_4XLARGE -> `String "ml.c6id.4xlarge"
  | ML_C6ID_8XLARGE -> `String "ml.c6id.8xlarge"
  | ML_C6ID_12XLARGE -> `String "ml.c6id.12xlarge"
  | ML_C6ID_16XLARGE -> `String "ml.c6id.16xlarge"
  | ML_C6ID_24XLARGE -> `String "ml.c6id.24xlarge"
  | ML_C6ID_32XLARGE -> `String "ml.c6id.32xlarge"
  | ML_R6ID_LARGE -> `String "ml.r6id.large"
  | ML_R6ID_XLARGE -> `String "ml.r6id.xlarge"
  | ML_R6ID_2XLARGE -> `String "ml.r6id.2xlarge"
  | ML_R6ID_4XLARGE -> `String "ml.r6id.4xlarge"
  | ML_R6ID_8XLARGE -> `String "ml.r6id.8xlarge"
  | ML_R6ID_12XLARGE -> `String "ml.r6id.12xlarge"
  | ML_R6ID_16XLARGE -> `String "ml.r6id.16xlarge"
  | ML_R6ID_24XLARGE -> `String "ml.r6id.24xlarge"
  | ML_R6ID_32XLARGE -> `String "ml.r6id.32xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"

let image_version_alias_to_yojson = string_to_yojson
let image_version_arn_to_yojson = string_to_yojson
let image_arn_to_yojson = string_to_yojson

let resource_spec_to_yojson (x : resource_spec) =
  assoc_to_yojson
    [
      ("SageMakerImageArn", option_to_yojson image_arn_to_yojson x.sage_maker_image_arn);
      ( "SageMakerImageVersionArn",
        option_to_yojson image_version_arn_to_yojson x.sage_maker_image_version_arn );
      ( "SageMakerImageVersionAlias",
        option_to_yojson image_version_alias_to_yojson x.sage_maker_image_version_alias );
      ("InstanceType", option_to_yojson app_instance_type_to_yojson x.instance_type);
      ( "LifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.lifecycle_config_arn );
      ( "TrainingPlanArn",
        option_to_yojson studio_resource_spec_training_plan_arn_to_yojson x.training_plan_arn );
    ]

let app_status_to_yojson (x : app_status) =
  match x with
  | Deleted -> `String "Deleted"
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"
  | InService -> `String "InService"
  | Pending -> `String "Pending"

let app_name_to_yojson = string_to_yojson

let app_type_to_yojson (x : app_type) =
  match x with
  | JupyterServer -> `String "JupyterServer"
  | KernelGateway -> `String "KernelGateway"
  | DetailedProfiler -> `String "DetailedProfiler"
  | TensorBoard -> `String "TensorBoard"
  | CodeEditor -> `String "CodeEditor"
  | JupyterLab -> `String "JupyterLab"
  | RStudioServerPro -> `String "RStudioServerPro"
  | RSessionGateway -> `String "RSessionGateway"
  | Canvas -> `String "Canvas"

let space_name_to_yojson = string_to_yojson
let user_profile_name_to_yojson = string_to_yojson
let domain_id_to_yojson = string_to_yojson

let app_details_to_yojson (x : app_details) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ("AppName", option_to_yojson app_name_to_yojson x.app_name);
      ("Status", option_to_yojson app_status_to_yojson x.status);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
    ]

let app_image_config_arn_to_yojson = string_to_yojson
let non_empty_string256_to_yojson = string_to_yojson

let custom_image_container_environment_variables_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string256_to_yojson tree

let custom_image_container_entrypoint_to_yojson tree =
  list_to_yojson non_empty_string256_to_yojson tree

let non_empty_string64_to_yojson = string_to_yojson

let custom_image_container_arguments_to_yojson tree =
  list_to_yojson non_empty_string64_to_yojson tree

let container_config_to_yojson (x : container_config) =
  assoc_to_yojson
    [
      ( "ContainerArguments",
        option_to_yojson custom_image_container_arguments_to_yojson x.container_arguments );
      ( "ContainerEntrypoint",
        option_to_yojson custom_image_container_entrypoint_to_yojson x.container_entrypoint );
      ( "ContainerEnvironmentVariables",
        option_to_yojson custom_image_container_environment_variables_to_yojson
          x.container_environment_variables );
    ]

let default_gid_to_yojson = int_to_yojson
let default_uid_to_yojson = int_to_yojson
let mount_path_to_yojson = string_to_yojson

let file_system_config_to_yojson (x : file_system_config) =
  assoc_to_yojson
    [
      ("MountPath", option_to_yojson mount_path_to_yojson x.mount_path);
      ("DefaultUid", option_to_yojson default_uid_to_yojson x.default_uid);
      ("DefaultGid", option_to_yojson default_gid_to_yojson x.default_gid);
    ]

let code_editor_app_image_config_to_yojson (x : code_editor_app_image_config) =
  assoc_to_yojson
    [
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
      ("ContainerConfig", option_to_yojson container_config_to_yojson x.container_config);
    ]

let jupyter_lab_app_image_config_to_yojson (x : jupyter_lab_app_image_config) =
  assoc_to_yojson
    [
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
      ("ContainerConfig", option_to_yojson container_config_to_yojson x.container_config);
    ]

let kernel_display_name_to_yojson = string_to_yojson
let kernel_name_to_yojson = string_to_yojson

let kernel_spec_to_yojson (x : kernel_spec) =
  assoc_to_yojson
    [
      ("Name", Some (kernel_name_to_yojson x.name));
      ("DisplayName", option_to_yojson kernel_display_name_to_yojson x.display_name);
    ]

let kernel_specs_to_yojson tree = list_to_yojson kernel_spec_to_yojson tree

let kernel_gateway_image_config_to_yojson (x : kernel_gateway_image_config) =
  assoc_to_yojson
    [
      ("KernelSpecs", Some (kernel_specs_to_yojson x.kernel_specs));
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
    ]

let app_image_config_name_to_yojson = string_to_yojson

let app_image_config_details_to_yojson (x : app_image_config_details) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
      ( "AppImageConfigName",
        option_to_yojson app_image_config_name_to_yojson x.app_image_config_name );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
    ]

let app_image_config_list_to_yojson tree = list_to_yojson app_image_config_details_to_yojson tree

let app_image_config_sort_key_to_yojson (x : app_image_config_sort_key) =
  match x with
  | CreationTime -> `String "CreationTime"
  | LastModifiedTime -> `String "LastModifiedTime"
  | Name -> `String "Name"

let idle_timeout_in_minutes_to_yojson = int_to_yojson

let lifecycle_management_to_yojson (x : lifecycle_management) =
  match x with Enabled -> `String "ENABLED" | Disabled -> `String "DISABLED"

let idle_settings_to_yojson (x : idle_settings) =
  assoc_to_yojson
    [
      ("LifecycleManagement", option_to_yojson lifecycle_management_to_yojson x.lifecycle_management);
      ( "IdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.idle_timeout_in_minutes );
      ( "MinIdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.min_idle_timeout_in_minutes );
      ( "MaxIdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.max_idle_timeout_in_minutes );
    ]

let app_lifecycle_management_to_yojson (x : app_lifecycle_management) =
  assoc_to_yojson [ ("IdleSettings", option_to_yojson idle_settings_to_yojson x.idle_settings) ]

let app_list_to_yojson tree = list_to_yojson app_details_to_yojson tree
let app_managed_to_yojson = bool_to_yojson

let app_network_access_type_to_yojson (x : app_network_access_type) =
  match x with PublicInternetOnly -> `String "PublicInternetOnly" | VpcOnly -> `String "VpcOnly"

let app_security_group_management_to_yojson (x : app_security_group_management) =
  match x with Service -> `String "Service" | Customer -> `String "Customer"

let app_sort_key_to_yojson (x : app_sort_key) =
  match x with CreationTime -> `String "CreationTime"

let container_argument_to_yojson = string_to_yojson
let container_arguments_to_yojson tree = list_to_yojson container_argument_to_yojson tree
let container_entrypoint_string_to_yojson = string_to_yojson
let container_entrypoint_to_yojson tree = list_to_yojson container_entrypoint_string_to_yojson tree
let image_uri_to_yojson = string_to_yojson

let app_specification_to_yojson (x : app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ("ContainerArguments", option_to_yojson container_arguments_to_yojson x.container_arguments);
    ]

let approval_description_to_yojson = string_to_yojson
let artifact_arn_to_yojson = string_to_yojson
let artifact_digest_to_yojson = string_to_yojson
let artifact_property_value_to_yojson = string_to_yojson
let string_parameter_value_to_yojson = string_to_yojson

let artifact_properties_to_yojson tree =
  map_to_yojson string_parameter_value_to_yojson artifact_property_value_to_yojson tree

let artifact_source_id_type_to_yojson (x : artifact_source_id_type) =
  match x with
  | MD5_HASH -> `String "MD5Hash"
  | S3_ETAG -> `String "S3ETag"
  | S3_VERSION -> `String "S3Version"
  | CUSTOM -> `String "Custom"

let artifact_source_type_to_yojson (x : artifact_source_type) =
  assoc_to_yojson
    [
      ("SourceIdType", Some (artifact_source_id_type_to_yojson x.source_id_type));
      ("Value", Some (string256_to_yojson x.value));
    ]

let artifact_source_types_to_yojson tree = list_to_yojson artifact_source_type_to_yojson tree

let artifact_source_to_yojson (x : artifact_source) =
  assoc_to_yojson
    [
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
      ("SourceTypes", option_to_yojson artifact_source_types_to_yojson x.source_types);
    ]

let artifact_summary_to_yojson (x : artifact_summary) =
  assoc_to_yojson
    [
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let artifact_summaries_to_yojson tree = list_to_yojson artifact_summary_to_yojson tree
let group_name_pattern_to_yojson = string_to_yojson
let assigned_group_patterns_list_to_yojson tree = list_to_yojson group_name_pattern_to_yojson tree
let trial_arn_to_yojson = string_to_yojson
let trial_component_arn_to_yojson = string_to_yojson

let associate_trial_component_response_to_yojson (x : associate_trial_component_response) =
  assoc_to_yojson
    [
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
    ]

let associate_trial_component_request_to_yojson (x : associate_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
    ]

let string2048_to_yojson = string_to_yojson

let association_info_to_yojson (x : association_info) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string2048_to_yojson x.source_arn));
      ("DestinationArn", Some (string2048_to_yojson x.destination_arn));
    ]

let association_info_list_to_yojson tree = list_to_yojson association_info_to_yojson tree

let iam_identity_to_yojson (x : iam_identity) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("PrincipalId", option_to_yojson string__to_yojson x.principal_id);
      ("SourceIdentity", option_to_yojson string__to_yojson x.source_identity);
    ]

let user_context_to_yojson (x : user_context) =
  assoc_to_yojson
    [
      ("UserProfileArn", option_to_yojson string__to_yojson x.user_profile_arn);
      ("UserProfileName", option_to_yojson string__to_yojson x.user_profile_name);
      ("DomainId", option_to_yojson string__to_yojson x.domain_id);
      ("IamIdentity", option_to_yojson iam_identity_to_yojson x.iam_identity);
    ]

let association_summary_to_yojson (x : association_summary) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("DestinationType", option_to_yojson string256_to_yojson x.destination_type);
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("SourceName", option_to_yojson experiment_entity_name_to_yojson x.source_name);
      ("DestinationName", option_to_yojson experiment_entity_name_to_yojson x.destination_name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
    ]

let association_summaries_to_yojson tree = list_to_yojson association_summary_to_yojson tree
let assumable_role_arns_to_yojson tree = list_to_yojson role_arn_to_yojson tree
let max_concurrent_invocations_per_instance_to_yojson = int_to_yojson

let async_inference_client_config_to_yojson (x : async_inference_client_config) =
  assoc_to_yojson
    [
      ( "MaxConcurrentInvocationsPerInstance",
        option_to_yojson max_concurrent_invocations_per_instance_to_yojson
          x.max_concurrent_invocations_per_instance );
    ]

let destination_s3_uri_to_yojson = string_to_yojson

let async_notification_topic_types_to_yojson (x : async_notification_topic_types) =
  match x with
  | SUCCESS_NOTIFICATION_TOPIC -> `String "SUCCESS_NOTIFICATION_TOPIC"
  | ERROR_NOTIFICATION_TOPIC -> `String "ERROR_NOTIFICATION_TOPIC"

let async_notification_topic_type_list_to_yojson tree =
  list_to_yojson async_notification_topic_types_to_yojson tree

let sns_topic_arn_to_yojson = string_to_yojson

let async_inference_notification_config_to_yojson (x : async_inference_notification_config) =
  assoc_to_yojson
    [
      ("SuccessTopic", option_to_yojson sns_topic_arn_to_yojson x.success_topic);
      ("ErrorTopic", option_to_yojson sns_topic_arn_to_yojson x.error_topic);
      ( "IncludeInferenceResponseIn",
        option_to_yojson async_notification_topic_type_list_to_yojson
          x.include_inference_response_in );
    ]

let async_inference_output_config_to_yojson (x : async_inference_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputPath", option_to_yojson destination_s3_uri_to_yojson x.s3_output_path);
      ( "NotificationConfig",
        option_to_yojson async_inference_notification_config_to_yojson x.notification_config );
      ("S3FailurePath", option_to_yojson destination_s3_uri_to_yojson x.s3_failure_path);
    ]

let async_inference_config_to_yojson (x : async_inference_config) =
  assoc_to_yojson
    [
      ("ClientConfig", option_to_yojson async_inference_client_config_to_yojson x.client_config);
      ("OutputConfig", Some (async_inference_output_config_to_yojson x.output_config));
    ]

let athena_catalog_to_yojson = string_to_yojson
let athena_database_to_yojson = string_to_yojson

let athena_result_compression_type_to_yojson (x : athena_result_compression_type) =
  match x with GZIP -> `String "GZIP" | SNAPPY -> `String "SNAPPY" | ZLIB -> `String "ZLIB"

let athena_result_format_to_yojson (x : athena_result_format) =
  match x with
  | PARQUET -> `String "PARQUET"
  | ORC -> `String "ORC"
  | AVRO -> `String "AVRO"
  | JSON -> `String "JSON"
  | TEXTFILE -> `String "TEXTFILE"

let athena_work_group_to_yojson = string_to_yojson
let athena_query_string_to_yojson = string_to_yojson

let athena_dataset_definition_to_yojson (x : athena_dataset_definition) =
  assoc_to_yojson
    [
      ("Catalog", Some (athena_catalog_to_yojson x.catalog));
      ("Database", Some (athena_database_to_yojson x.database));
      ("QueryString", Some (athena_query_string_to_yojson x.query_string));
      ("WorkGroup", option_to_yojson athena_work_group_to_yojson x.work_group);
      ("OutputS3Uri", Some (s3_uri_to_yojson x.output_s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputFormat", Some (athena_result_format_to_yojson x.output_format));
      ( "OutputCompression",
        option_to_yojson athena_result_compression_type_to_yojson x.output_compression );
    ]

let volume_device_name_to_yojson = string_to_yojson

let volume_attachment_status_to_yojson (x : volume_attachment_status) =
  match x with
  | ATTACHING -> `String "attaching"
  | ATTACHED -> `String "attached"
  | DETACHING -> `String "detaching"
  | DETACHED -> `String "detached"
  | BUSY -> `String "busy"

let volume_id_to_yojson = string_to_yojson
let cluster_node_id_to_yojson = string_to_yojson
let cluster_arn_to_yojson = string_to_yojson

let attach_cluster_node_volume_response_to_yojson (x : attach_cluster_node_volume_response) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("AttachTime", Some (timestamp_to_yojson x.attach_time));
      ("Status", Some (volume_attachment_status_to_yojson x.status));
      ("DeviceName", Some (volume_device_name_to_yojson x.device_name));
    ]

let attach_cluster_node_volume_request_to_yojson (x : attach_cluster_node_volume_request) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
    ]

let auth_mode_to_yojson (x : auth_mode) = match x with SSO -> `String "SSO" | IAM -> `String "IAM"
let authentication_request_extra_params_value_to_yojson = string_to_yojson
let authentication_request_extra_params_key_to_yojson = string_to_yojson

let authentication_request_extra_params_to_yojson tree =
  map_to_yojson authentication_request_extra_params_key_to_yojson
    authentication_request_extra_params_value_to_yojson tree

let local_path_to_yojson = string_to_yojson
let long_s3_uri_to_yojson = string_to_yojson

let authorized_url_to_yojson (x : authorized_url) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson long_s3_uri_to_yojson x.url);
      ("LocalPath", option_to_yojson local_path_to_yojson x.local_path);
    ]

let authorized_url_configs_to_yojson tree = list_to_yojson authorized_url_to_yojson tree
let auto_generate_endpoint_name_to_yojson = bool_to_yojson

let auto_ml_algorithm_to_yojson (x : auto_ml_algorithm) =
  match x with
  | XGBOOST -> `String "xgboost"
  | LINEAR_LEARNER -> `String "linear-learner"
  | MLP -> `String "mlp"
  | LIGHTGBM -> `String "lightgbm"
  | CATBOOST -> `String "catboost"
  | RANDOMFOREST -> `String "randomforest"
  | EXTRA_TREES -> `String "extra-trees"
  | NN_TORCH -> `String "nn-torch"
  | FASTAI -> `String "fastai"
  | CNN_QR -> `String "cnn-qr"
  | DEEPAR -> `String "deepar"
  | PROPHET -> `String "prophet"
  | NPTS -> `String "npts"
  | ARIMA -> `String "arima"
  | ETS -> `String "ets"

let auto_ml_algorithms_to_yojson tree = list_to_yojson auto_ml_algorithm_to_yojson tree

let auto_ml_algorithm_config_to_yojson (x : auto_ml_algorithm_config) =
  assoc_to_yojson [ ("AutoMLAlgorithms", Some (auto_ml_algorithms_to_yojson x.auto_ml_algorithms)) ]

let auto_ml_algorithms_config_to_yojson tree =
  list_to_yojson auto_ml_algorithm_config_to_yojson tree

let auto_ml_container_definition_to_yojson (x : auto_ml_container_definition) =
  assoc_to_yojson
    [
      ("Image", Some (container_image_to_yojson x.image));
      ("ModelDataUrl", Some (url_to_yojson x.model_data_url));
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
    ]

let auto_ml_container_definitions_to_yojson tree =
  list_to_yojson auto_ml_container_definition_to_yojson tree

let auto_ml_processing_unit_to_yojson (x : auto_ml_processing_unit) =
  match x with CPU -> `String "CPU" | GPU -> `String "GPU"

let auto_ml_inference_container_definitions_to_yojson tree =
  map_to_yojson auto_ml_processing_unit_to_yojson auto_ml_container_definitions_to_yojson tree

let metric_set_source_to_yojson (x : metric_set_source) =
  match x with
  | TRAIN -> `String "Train"
  | VALIDATION -> `String "Validation"
  | TEST -> `String "Test"

let float__to_yojson = float_to_yojson

let auto_ml_metric_extended_enum_to_yojson (x : auto_ml_metric_extended_enum) =
  match x with
  | ACCURACY -> `String "Accuracy"
  | MSE -> `String "MSE"
  | F1 -> `String "F1"
  | F1_MACRO -> `String "F1macro"
  | AUC -> `String "AUC"
  | RMSE -> `String "RMSE"
  | MAE -> `String "MAE"
  | R2 -> `String "R2"
  | BALANCED_ACCURACY -> `String "BalancedAccuracy"
  | PRECISION -> `String "Precision"
  | PRECISION_MACRO -> `String "PrecisionMacro"
  | RECALL -> `String "Recall"
  | RECALL_MACRO -> `String "RecallMacro"
  | LogLoss -> `String "LogLoss"
  | INFERENCE_LATENCY -> `String "InferenceLatency"
  | MAPE -> `String "MAPE"
  | MASE -> `String "MASE"
  | WAPE -> `String "WAPE"
  | AVERAGE_WEIGHTED_QUANTILE_LOSS -> `String "AverageWeightedQuantileLoss"
  | ROUGE1 -> `String "Rouge1"
  | ROUGE2 -> `String "Rouge2"
  | ROUGEL -> `String "RougeL"
  | ROUGEL_SUM -> `String "RougeLSum"
  | PERPLEXITY -> `String "Perplexity"
  | VALIDATION_LOSS -> `String "ValidationLoss"
  | TRAINING_LOSS -> `String "TrainingLoss"

let auto_ml_metric_enum_to_yojson (x : auto_ml_metric_enum) =
  match x with
  | ACCURACY -> `String "Accuracy"
  | MSE -> `String "MSE"
  | F1 -> `String "F1"
  | F1_MACRO -> `String "F1macro"
  | AUC -> `String "AUC"
  | RMSE -> `String "RMSE"
  | BALANCED_ACCURACY -> `String "BalancedAccuracy"
  | R2 -> `String "R2"
  | RECALL -> `String "Recall"
  | RECALL_MACRO -> `String "RecallMacro"
  | PRECISION -> `String "Precision"
  | PRECISION_MACRO -> `String "PrecisionMacro"
  | MAE -> `String "MAE"
  | MAPE -> `String "MAPE"
  | MASE -> `String "MASE"
  | WAPE -> `String "WAPE"
  | AVERAGE_WEIGHTED_QUANTILE_LOSS -> `String "AverageWeightedQuantileLoss"

let metric_datum_to_yojson (x : metric_datum) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson auto_ml_metric_enum_to_yojson x.metric_name);
      ( "StandardMetricName",
        option_to_yojson auto_ml_metric_extended_enum_to_yojson x.standard_metric_name );
      ("Value", option_to_yojson float__to_yojson x.value);
      ("Set", option_to_yojson metric_set_source_to_yojson x.set);
    ]

let metric_data_list_to_yojson tree = list_to_yojson metric_datum_to_yojson tree
let backtest_results_location_to_yojson = string_to_yojson
let model_insights_location_to_yojson = string_to_yojson
let explainability_location_to_yojson = string_to_yojson

let candidate_artifact_locations_to_yojson (x : candidate_artifact_locations) =
  assoc_to_yojson
    [
      ("Explainability", Some (explainability_location_to_yojson x.explainability));
      ("ModelInsights", option_to_yojson model_insights_location_to_yojson x.model_insights);
      ("BacktestResults", option_to_yojson backtest_results_location_to_yojson x.backtest_results);
    ]

let candidate_properties_to_yojson (x : candidate_properties) =
  assoc_to_yojson
    [
      ( "CandidateArtifactLocations",
        option_to_yojson candidate_artifact_locations_to_yojson x.candidate_artifact_locations );
      ("CandidateMetrics", option_to_yojson metric_data_list_to_yojson x.candidate_metrics);
    ]

let auto_ml_failure_reason_to_yojson = string_to_yojson

let candidate_status_to_yojson (x : candidate_status) =
  match x with
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"

let candidate_step_name_to_yojson = string_to_yojson
let candidate_step_arn_to_yojson = string_to_yojson

let candidate_step_type_to_yojson (x : candidate_step_type) =
  match x with
  | TRAINING -> `String "AWS::SageMaker::TrainingJob"
  | TRANSFORM -> `String "AWS::SageMaker::TransformJob"
  | PROCESSING -> `String "AWS::SageMaker::ProcessingJob"

let auto_ml_candidate_step_to_yojson (x : auto_ml_candidate_step) =
  assoc_to_yojson
    [
      ("CandidateStepType", Some (candidate_step_type_to_yojson x.candidate_step_type));
      ("CandidateStepArn", Some (candidate_step_arn_to_yojson x.candidate_step_arn));
      ("CandidateStepName", Some (candidate_step_name_to_yojson x.candidate_step_name));
    ]

let candidate_steps_to_yojson tree = list_to_yojson auto_ml_candidate_step_to_yojson tree

let objective_status_to_yojson (x : objective_status) =
  match x with
  | Succeeded -> `String "Succeeded"
  | Pending -> `String "Pending"
  | Failed -> `String "Failed"

let metric_value_to_yojson = float_to_yojson

let auto_ml_job_objective_type_to_yojson (x : auto_ml_job_objective_type) =
  match x with MAXIMIZE -> `String "Maximize" | MINIMIZE -> `String "Minimize"

let final_auto_ml_job_objective_metric_to_yojson (x : final_auto_ml_job_objective_metric) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson auto_ml_job_objective_type_to_yojson x.type_);
      ("MetricName", Some (auto_ml_metric_enum_to_yojson x.metric_name));
      ("Value", Some (metric_value_to_yojson x.value));
      ("StandardMetricName", option_to_yojson auto_ml_metric_enum_to_yojson x.standard_metric_name);
    ]

let candidate_name_to_yojson = string_to_yojson

let auto_ml_candidate_to_yojson (x : auto_ml_candidate) =
  assoc_to_yojson
    [
      ("CandidateName", Some (candidate_name_to_yojson x.candidate_name));
      ( "FinalAutoMLJobObjectiveMetric",
        option_to_yojson final_auto_ml_job_objective_metric_to_yojson
          x.final_auto_ml_job_objective_metric );
      ("ObjectiveStatus", Some (objective_status_to_yojson x.objective_status));
      ("CandidateSteps", Some (candidate_steps_to_yojson x.candidate_steps));
      ("CandidateStatus", Some (candidate_status_to_yojson x.candidate_status));
      ( "InferenceContainers",
        option_to_yojson auto_ml_container_definitions_to_yojson x.inference_containers );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ("CandidateProperties", option_to_yojson candidate_properties_to_yojson x.candidate_properties);
      ( "InferenceContainerDefinitions",
        option_to_yojson auto_ml_inference_container_definitions_to_yojson
          x.inference_container_definitions );
    ]

let auto_ml_candidate_generation_config_to_yojson (x : auto_ml_candidate_generation_config) =
  assoc_to_yojson
    [
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
      ("AlgorithmsConfig", option_to_yojson auto_ml_algorithms_config_to_yojson x.algorithms_config);
    ]

let auto_ml_candidates_to_yojson tree = list_to_yojson auto_ml_candidate_to_yojson tree
let sample_weight_attribute_name_to_yojson = string_to_yojson

let auto_ml_channel_type_to_yojson (x : auto_ml_channel_type) =
  match x with TRAINING -> `String "training" | VALIDATION -> `String "validation"

let target_attribute_name_to_yojson = string_to_yojson

let auto_mls3_data_type_to_yojson (x : auto_mls3_data_type) =
  match x with
  | MANIFEST_FILE -> `String "ManifestFile"
  | S3_PREFIX -> `String "S3Prefix"
  | AUGMENTED_MANIFEST_FILE -> `String "AugmentedManifestFile"

let auto_mls3_data_source_to_yojson (x : auto_mls3_data_source) =
  assoc_to_yojson
    [
      ("S3DataType", Some (auto_mls3_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let auto_ml_data_source_to_yojson (x : auto_ml_data_source) =
  assoc_to_yojson [ ("S3DataSource", Some (auto_mls3_data_source_to_yojson x.s3_data_source)) ]

let auto_ml_channel_to_yojson (x : auto_ml_channel) =
  assoc_to_yojson
    [
      ("DataSource", option_to_yojson auto_ml_data_source_to_yojson x.data_source);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("ChannelType", option_to_yojson auto_ml_channel_type_to_yojson x.channel_type);
      ( "SampleWeightAttributeName",
        option_to_yojson sample_weight_attribute_name_to_yojson x.sample_weight_attribute_name );
    ]

let emr_serverless_compute_config_to_yojson (x : emr_serverless_compute_config) =
  assoc_to_yojson [ ("ExecutionRoleARN", Some (role_arn_to_yojson x.execution_role_ar_n)) ]

let auto_ml_compute_config_to_yojson (x : auto_ml_compute_config) =
  assoc_to_yojson
    [
      ( "EmrServerlessComputeConfig",
        option_to_yojson emr_serverless_compute_config_to_yojson x.emr_serverless_compute_config );
    ]

let validation_fraction_to_yojson = float_to_yojson

let auto_ml_data_split_config_to_yojson (x : auto_ml_data_split_config) =
  assoc_to_yojson
    [ ("ValidationFraction", option_to_yojson validation_fraction_to_yojson x.validation_fraction) ]

let auto_ml_input_data_config_to_yojson tree = list_to_yojson auto_ml_channel_to_yojson tree
let auto_ml_job_arn_to_yojson = string_to_yojson
let data_exploration_notebook_location_to_yojson = string_to_yojson
let candidate_definition_notebook_location_to_yojson = string_to_yojson

let auto_ml_job_artifacts_to_yojson (x : auto_ml_job_artifacts) =
  assoc_to_yojson
    [
      ( "CandidateDefinitionNotebookLocation",
        option_to_yojson candidate_definition_notebook_location_to_yojson
          x.candidate_definition_notebook_location );
      ( "DataExplorationNotebookLocation",
        option_to_yojson data_exploration_notebook_location_to_yojson
          x.data_exploration_notebook_location );
    ]

let auto_ml_job_channel_to_yojson (x : auto_ml_job_channel) =
  assoc_to_yojson
    [
      ("ChannelType", option_to_yojson auto_ml_channel_type_to_yojson x.channel_type);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("DataSource", option_to_yojson auto_ml_data_source_to_yojson x.data_source);
    ]

let max_auto_ml_job_runtime_in_seconds_to_yojson = int_to_yojson
let max_runtime_per_training_job_in_seconds_to_yojson = int_to_yojson
let max_candidates_to_yojson = int_to_yojson

let auto_ml_job_completion_criteria_to_yojson (x : auto_ml_job_completion_criteria) =
  assoc_to_yojson
    [
      ("MaxCandidates", option_to_yojson max_candidates_to_yojson x.max_candidates);
      ( "MaxRuntimePerTrainingJobInSeconds",
        option_to_yojson max_runtime_per_training_job_in_seconds_to_yojson
          x.max_runtime_per_training_job_in_seconds );
      ( "MaxAutoMLJobRuntimeInSeconds",
        option_to_yojson max_auto_ml_job_runtime_in_seconds_to_yojson
          x.max_auto_ml_job_runtime_in_seconds );
    ]

let auto_ml_mode_to_yojson (x : auto_ml_mode) =
  match x with
  | AUTO -> `String "AUTO"
  | ENSEMBLING -> `String "ENSEMBLING"
  | HYPERPARAMETER_TUNING -> `String "HYPERPARAMETER_TUNING"

let auto_ml_security_config_to_yojson (x : auto_ml_security_config) =
  assoc_to_yojson
    [
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let auto_ml_job_config_to_yojson (x : auto_ml_job_config) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ( "CandidateGenerationConfig",
        option_to_yojson auto_ml_candidate_generation_config_to_yojson x.candidate_generation_config
      );
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ("Mode", option_to_yojson auto_ml_mode_to_yojson x.mode);
    ]

let auto_ml_job_input_data_config_to_yojson tree = list_to_yojson auto_ml_job_channel_to_yojson tree
let auto_ml_job_name_to_yojson = string_to_yojson

let auto_ml_job_objective_to_yojson (x : auto_ml_job_objective) =
  assoc_to_yojson [ ("MetricName", Some (auto_ml_metric_enum_to_yojson x.metric_name)) ]

let auto_ml_job_secondary_status_to_yojson (x : auto_ml_job_secondary_status) =
  match x with
  | STARTING -> `String "Starting"
  | MAX_CANDIDATES_REACHED -> `String "MaxCandidatesReached"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | MAX_AUTO_ML_JOB_RUNTIME_REACHED -> `String "MaxAutoMLJobRuntimeReached"
  | STOPPING -> `String "Stopping"
  | CANDIDATE_DEFINITIONS_GENERATED -> `String "CandidateDefinitionsGenerated"
  | COMPLETED -> `String "Completed"
  | EXPLAINABILITY_ERROR -> `String "ExplainabilityError"
  | DEPLOYING_MODEL -> `String "DeployingModel"
  | MODEL_DEPLOYMENT_ERROR -> `String "ModelDeploymentError"
  | GENERATING_MODEL_INSIGHTS_REPORT -> `String "GeneratingModelInsightsReport"
  | MODEL_INSIGHTS_ERROR -> `String "ModelInsightsError"
  | ANALYZING_DATA -> `String "AnalyzingData"
  | FEATURE_ENGINEERING -> `String "FeatureEngineering"
  | MODEL_TUNING -> `String "ModelTuning"
  | GENERATING_EXPLAINABILITY_REPORT -> `String "GeneratingExplainabilityReport"
  | TRAINING_MODELS -> `String "TrainingModels"
  | PRE_TRAINING -> `String "PreTraining"

let auto_ml_job_status_to_yojson (x : auto_ml_job_status) =
  match x with
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"

let auto_ml_job_step_metadata_to_yojson (x : auto_ml_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson auto_ml_job_arn_to_yojson x.arn) ]

let auto_ml_partial_failure_reason_to_yojson (x : auto_ml_partial_failure_reason) =
  assoc_to_yojson
    [
      ( "PartialFailureMessage",
        option_to_yojson auto_ml_failure_reason_to_yojson x.partial_failure_message );
    ]

let auto_ml_partial_failure_reasons_to_yojson tree =
  list_to_yojson auto_ml_partial_failure_reason_to_yojson tree

let auto_ml_job_summary_to_yojson (x : auto_ml_job_summary) =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
    ]

let auto_ml_job_summaries_to_yojson tree = list_to_yojson auto_ml_job_summary_to_yojson tree
let auto_ml_max_results_to_yojson = int_to_yojson
let auto_ml_max_results_for_trials_to_yojson = int_to_yojson
let auto_ml_name_contains_to_yojson = string_to_yojson

let auto_ml_output_data_config_to_yojson (x : auto_ml_output_data_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
    ]

let text_generation_hyper_parameter_value_to_yojson = string_to_yojson
let text_generation_hyper_parameter_key_to_yojson = string_to_yojson

let text_generation_hyper_parameters_to_yojson tree =
  map_to_yojson text_generation_hyper_parameter_key_to_yojson
    text_generation_hyper_parameter_value_to_yojson tree

let base_model_name_to_yojson = string_to_yojson

let text_generation_job_config_to_yojson (x : text_generation_job_config) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name);
      ( "TextGenerationHyperParameters",
        option_to_yojson text_generation_hyper_parameters_to_yojson
          x.text_generation_hyper_parameters );
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
    ]

let problem_type_to_yojson (x : problem_type) =
  match x with
  | BINARY_CLASSIFICATION -> `String "BinaryClassification"
  | MULTICLASS_CLASSIFICATION -> `String "MulticlassClassification"
  | REGRESSION -> `String "Regression"

let generate_candidate_definitions_only_to_yojson = bool_to_yojson

let candidate_generation_config_to_yojson (x : candidate_generation_config) =
  assoc_to_yojson
    [
      ("AlgorithmsConfig", option_to_yojson auto_ml_algorithms_config_to_yojson x.algorithms_config);
    ]

let tabular_job_config_to_yojson (x : tabular_job_config) =
  assoc_to_yojson
    [
      ( "CandidateGenerationConfig",
        option_to_yojson candidate_generation_config_to_yojson x.candidate_generation_config );
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
      ("Mode", option_to_yojson auto_ml_mode_to_yojson x.mode);
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
      ( "SampleWeightAttributeName",
        option_to_yojson sample_weight_attribute_name_to_yojson x.sample_weight_attribute_name );
    ]

let country_code_to_yojson = string_to_yojson

let holiday_config_attributes_to_yojson (x : holiday_config_attributes) =
  assoc_to_yojson [ ("CountryCode", option_to_yojson country_code_to_yojson x.country_code) ]

let holiday_config_to_yojson tree = list_to_yojson holiday_config_attributes_to_yojson tree
let grouping_attribute_name_to_yojson = string_to_yojson
let grouping_attribute_names_to_yojson tree = list_to_yojson grouping_attribute_name_to_yojson tree
let item_identifier_attribute_name_to_yojson = string_to_yojson
let timestamp_attribute_name_to_yojson = string_to_yojson

let time_series_config_to_yojson (x : time_series_config) =
  assoc_to_yojson
    [
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
      ( "TimestampAttributeName",
        Some (timestamp_attribute_name_to_yojson x.timestamp_attribute_name) );
      ( "ItemIdentifierAttributeName",
        Some (item_identifier_attribute_name_to_yojson x.item_identifier_attribute_name) );
      ( "GroupingAttributeNames",
        option_to_yojson grouping_attribute_names_to_yojson x.grouping_attribute_names );
    ]

let filling_transformation_value_to_yojson = string_to_yojson

let filling_type_to_yojson (x : filling_type) =
  match x with
  | Frontfill -> `String "frontfill"
  | Middlefill -> `String "middlefill"
  | Backfill -> `String "backfill"
  | Futurefill -> `String "futurefill"
  | FrontfillValue -> `String "frontfill_value"
  | MiddlefillValue -> `String "middlefill_value"
  | BackfillValue -> `String "backfill_value"
  | FuturefillValue -> `String "futurefill_value"

let filling_transformation_map_to_yojson tree =
  map_to_yojson filling_type_to_yojson filling_transformation_value_to_yojson tree

let filling_transformations_to_yojson tree =
  map_to_yojson transformation_attribute_name_to_yojson filling_transformation_map_to_yojson tree

let time_series_transformations_to_yojson (x : time_series_transformations) =
  assoc_to_yojson
    [
      ("Filling", option_to_yojson filling_transformations_to_yojson x.filling);
      ("Aggregation", option_to_yojson aggregation_transformations_to_yojson x.aggregation);
    ]

let forecast_quantile_to_yojson = string_to_yojson
let forecast_quantiles_to_yojson tree = list_to_yojson forecast_quantile_to_yojson tree
let forecast_horizon_to_yojson = int_to_yojson
let forecast_frequency_to_yojson = string_to_yojson

let time_series_forecasting_job_config_to_yojson (x : time_series_forecasting_job_config) =
  assoc_to_yojson
    [
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("ForecastFrequency", Some (forecast_frequency_to_yojson x.forecast_frequency));
      ("ForecastHorizon", Some (forecast_horizon_to_yojson x.forecast_horizon));
      ("ForecastQuantiles", option_to_yojson forecast_quantiles_to_yojson x.forecast_quantiles);
      ("Transformations", option_to_yojson time_series_transformations_to_yojson x.transformations);
      ("TimeSeriesConfig", Some (time_series_config_to_yojson x.time_series_config));
      ("HolidayConfig", option_to_yojson holiday_config_to_yojson x.holiday_config);
      ( "CandidateGenerationConfig",
        option_to_yojson candidate_generation_config_to_yojson x.candidate_generation_config );
    ]

let target_label_column_to_yojson = string_to_yojson
let content_column_to_yojson = string_to_yojson

let text_classification_job_config_to_yojson (x : text_classification_job_config) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("ContentColumn", Some (content_column_to_yojson x.content_column));
      ("TargetLabelColumn", Some (target_label_column_to_yojson x.target_label_column));
    ]

let image_classification_job_config_to_yojson (x : image_classification_job_config) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let auto_ml_problem_type_config_to_yojson (x : auto_ml_problem_type_config) =
  match x with
  | ImageClassificationJobConfig arg ->
      assoc_to_yojson
        [ ("ImageClassificationJobConfig", Some (image_classification_job_config_to_yojson arg)) ]
  | TextClassificationJobConfig arg ->
      assoc_to_yojson
        [ ("TextClassificationJobConfig", Some (text_classification_job_config_to_yojson arg)) ]
  | TimeSeriesForecastingJobConfig arg ->
      assoc_to_yojson
        [
          ("TimeSeriesForecastingJobConfig", Some (time_series_forecasting_job_config_to_yojson arg));
        ]
  | TabularJobConfig arg ->
      assoc_to_yojson [ ("TabularJobConfig", Some (tabular_job_config_to_yojson arg)) ]
  | TextGenerationJobConfig arg ->
      assoc_to_yojson
        [ ("TextGenerationJobConfig", Some (text_generation_job_config_to_yojson arg)) ]

let auto_ml_problem_type_config_name_to_yojson (x : auto_ml_problem_type_config_name) =
  match x with
  | IMAGE_CLASSIFICATION -> `String "ImageClassification"
  | TEXT_CLASSIFICATION -> `String "TextClassification"
  | TIMESERIES_FORECASTING -> `String "TimeSeriesForecasting"
  | TABULAR -> `String "Tabular"
  | TEXT_GENERATION -> `String "TextGeneration"

let text_generation_resolved_attributes_to_yojson (x : text_generation_resolved_attributes) =
  assoc_to_yojson
    [ ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name) ]

let tabular_resolved_attributes_to_yojson (x : tabular_resolved_attributes) =
  assoc_to_yojson [ ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type) ]

let auto_ml_problem_type_resolved_attributes_to_yojson
    (x : auto_ml_problem_type_resolved_attributes) =
  match x with
  | TabularResolvedAttributes arg ->
      assoc_to_yojson
        [ ("TabularResolvedAttributes", Some (tabular_resolved_attributes_to_yojson arg)) ]
  | TextGenerationResolvedAttributes arg ->
      assoc_to_yojson
        [
          ( "TextGenerationResolvedAttributes",
            Some (text_generation_resolved_attributes_to_yojson arg) );
        ]

let auto_ml_resolved_attributes_to_yojson (x : auto_ml_resolved_attributes) =
  assoc_to_yojson
    [
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ( "AutoMLProblemTypeResolvedAttributes",
        option_to_yojson auto_ml_problem_type_resolved_attributes_to_yojson
          x.auto_ml_problem_type_resolved_attributes );
    ]

let auto_ml_sort_by_to_yojson (x : auto_ml_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let auto_ml_sort_order_to_yojson (x : auto_ml_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let auto_mount_home_ef_s_to_yojson (x : auto_mount_home_ef_s) =
  match x with
  | ENABLED -> `String "Enabled"
  | DISABLED -> `String "Disabled"
  | DEFAULT_AS_DOMAIN -> `String "DefaultAsDomain"

let parameter_value_to_yojson = string_to_yojson
let parameter_key_to_yojson = string_to_yojson

let auto_parameter_to_yojson (x : auto_parameter) =
  assoc_to_yojson
    [
      ("Name", Some (parameter_key_to_yojson x.name));
      ("ValueHint", Some (parameter_value_to_yojson x.value_hint));
    ]

let auto_parameters_to_yojson tree = list_to_yojson auto_parameter_to_yojson tree
let auto_rollback_alarms_to_yojson tree = list_to_yojson alarm_details_to_yojson tree

let auto_rollback_config_to_yojson (x : auto_rollback_config) =
  assoc_to_yojson [ ("Alarms", option_to_yojson alarm_list_to_yojson x.alarms) ]

let autotune_mode_to_yojson (x : autotune_mode) = match x with ENABLED -> `String "Enabled"

let autotune_to_yojson (x : autotune) =
  assoc_to_yojson [ ("Mode", Some (autotune_mode_to_yojson x.mode)) ]

let availability_zone_to_yojson = string_to_yojson

let availability_zone_balance_enforcement_mode_to_yojson
    (x : availability_zone_balance_enforcement_mode) =
  match x with PERMISSIVE -> `String "PERMISSIVE"

let availability_zone_balance_max_imbalance_to_yojson = int_to_yojson
let availability_zone_id_to_yojson = string_to_yojson
let available_instance_count_to_yojson = int_to_yojson
let available_spare_instance_count_to_yojson = int_to_yojson
let string1024_to_yojson = string_to_yojson
let release_notes_list_to_yojson tree = list_to_yojson string1024_to_yojson tree
let major_minor_version_to_yojson = string_to_yojson

let available_upgrade_to_yojson (x : available_upgrade) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson major_minor_version_to_yojson x.version);
      ("ReleaseNotes", option_to_yojson release_notes_list_to_yojson x.release_notes);
    ]

let aws_managed_human_loop_request_source_to_yojson (x : aws_managed_human_loop_request_source) =
  match x with
  | REKOGNITION_DETECT_MODERATION_LABELS_IMAGE_V3 ->
      `String "AWS/Rekognition/DetectModerationLabels/Image/V3"
  | TEXTRACT_ANALYZE_DOCUMENT_FORMS_V1 -> `String "AWS/Textract/AnalyzeDocument/Forms/V1"

let batch_add_failure_count_to_yojson = int_to_yojson

let batch_add_cluster_nodes_error_code_to_yojson (x : batch_add_cluster_nodes_error_code) =
  match x with
  | INSTANCE_GROUP_NOT_FOUND -> `String "InstanceGroupNotFound"
  | INVALID_INSTANCE_GROUP_STATUS -> `String "InvalidInstanceGroupStatus"
  | INCOMPATIBLE_AVAILABILITY_ZONES -> `String "IncompatibleAvailabilityZones"
  | INCOMPATIBLE_INSTANCE_TYPES -> `String "IncompatibleInstanceTypes"

let batch_add_cluster_nodes_error_to_yojson (x : batch_add_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (instance_group_name_to_yojson x.instance_group_name));
      ("ErrorCode", Some (batch_add_cluster_nodes_error_code_to_yojson x.error_code));
      ("FailedCount", Some (batch_add_failure_count_to_yojson x.failed_count));
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let batch_add_cluster_nodes_error_list_to_yojson tree =
  list_to_yojson batch_add_cluster_nodes_error_to_yojson tree

let cluster_instance_status_to_yojson (x : cluster_instance_status) =
  match x with
  | RUNNING -> `String "Running"
  | FAILURE -> `String "Failure"
  | PENDING -> `String "Pending"
  | SHUTTING_DOWN -> `String "ShuttingDown"
  | SYSTEM_UPDATING -> `String "SystemUpdating"
  | DEEP_HEALTH_CHECK_IN_PROGRESS -> `String "DeepHealthCheckInProgress"
  | NOT_FOUND -> `String "NotFound"

let cluster_node_logical_id_to_yojson = string_to_yojson

let node_addition_result_to_yojson (x : node_addition_result) =
  assoc_to_yojson
    [
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("Status", Some (cluster_instance_status_to_yojson x.status));
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
    ]

let node_addition_result_list_to_yojson tree = list_to_yojson node_addition_result_to_yojson tree

let batch_add_cluster_nodes_response_to_yojson (x : batch_add_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("Successful", Some (node_addition_result_list_to_yojson x.successful));
      ("Failed", Some (batch_add_cluster_nodes_error_list_to_yojson x.failed));
    ]

let cluster_name_or_arn_to_yojson = string_to_yojson

let batch_add_cluster_nodes_request_to_yojson (x : batch_add_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ( "ClientToken",
        Some (string__to_yojson (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ())))
      );
      ("NodesToAdd", Some (add_cluster_node_specification_list_to_yojson x.nodes_to_add));
    ]

let batch_data_capture_config_to_yojson (x : batch_data_capture_config) =
  assoc_to_yojson
    [
      ("DestinationS3Uri", Some (s3_uri_to_yojson x.destination_s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("GenerateInferenceId", option_to_yojson boolean__to_yojson x.generate_inference_id);
    ]

let batch_delete_cluster_nodes_error_code_to_yojson (x : batch_delete_cluster_nodes_error_code) =
  match x with
  | NODE_ID_NOT_FOUND -> `String "NodeIdNotFound"
  | INVALID_NODE_STATUS -> `String "InvalidNodeStatus"
  | NODE_ID_IN_USE -> `String "NodeIdInUse"

let batch_delete_cluster_node_logical_ids_error_to_yojson
    (x : batch_delete_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("Code", Some (batch_delete_cluster_nodes_error_code_to_yojson x.code));
      ("Message", Some (string__to_yojson x.message));
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
    ]

let batch_delete_cluster_node_logical_ids_error_list_to_yojson tree =
  list_to_yojson batch_delete_cluster_node_logical_ids_error_to_yojson tree

let cluster_node_logical_id_list_to_yojson tree =
  list_to_yojson cluster_node_logical_id_to_yojson tree

let cluster_node_ids_to_yojson tree = list_to_yojson cluster_node_id_to_yojson tree

let batch_delete_cluster_nodes_error_to_yojson (x : batch_delete_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("Code", Some (batch_delete_cluster_nodes_error_code_to_yojson x.code));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
    ]

let batch_delete_cluster_nodes_error_list_to_yojson tree =
  list_to_yojson batch_delete_cluster_nodes_error_to_yojson tree

let batch_delete_cluster_nodes_response_to_yojson (x : batch_delete_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("Failed", option_to_yojson batch_delete_cluster_nodes_error_list_to_yojson x.failed);
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_delete_cluster_node_logical_ids_error_list_to_yojson
          x.failed_node_logical_ids );
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
    ]

let batch_delete_cluster_nodes_request_to_yojson (x : batch_delete_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
    ]

let batch_describe_model_package_error_to_yojson (x : batch_describe_model_package_error) =
  assoc_to_yojson
    [
      ("ErrorCode", Some (string__to_yojson x.error_code));
      ("ErrorResponse", Some (string__to_yojson x.error_response));
    ]

let batch_describe_model_package_error_map_to_yojson tree =
  map_to_yojson model_package_arn_to_yojson batch_describe_model_package_error_to_yojson tree

let model_package_registration_type_to_yojson (x : model_package_registration_type) =
  match x with LOGGED -> `String "Logged" | REGISTERED -> `String "Registered"

let model_approval_status_to_yojson (x : model_approval_status) =
  match x with
  | APPROVED -> `String "Approved"
  | REJECTED -> `String "Rejected"
  | PENDING_MANUAL_APPROVAL -> `String "PendingManualApproval"

let model_package_status_to_yojson (x : model_package_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"

let inference_specification_to_yojson (x : inference_specification) =
  assoc_to_yojson
    [
      ("Containers", Some (model_package_container_definition_list_to_yojson x.containers));
      ( "SupportedTransformInstanceTypes",
        option_to_yojson transform_instance_types_to_yojson x.supported_transform_instance_types );
      ( "SupportedRealtimeInferenceInstanceTypes",
        option_to_yojson realtime_inference_instance_types_to_yojson
          x.supported_realtime_inference_instance_types );
      ("SupportedContentTypes", option_to_yojson content_types_to_yojson x.supported_content_types);
      ( "SupportedResponseMIMETypes",
        option_to_yojson response_mime_types_to_yojson x.supported_response_mime_types );
    ]

let model_package_version_to_yojson = int_to_yojson

let batch_describe_model_package_summary_to_yojson (x : batch_describe_model_package_summary) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("InferenceSpecification", Some (inference_specification_to_yojson x.inference_specification));
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
    ]

let model_package_summaries_to_yojson tree =
  map_to_yojson model_package_arn_to_yojson batch_describe_model_package_summary_to_yojson tree

let batch_describe_model_package_output_to_yojson (x : batch_describe_model_package_output) =
  assoc_to_yojson
    [
      ( "ModelPackageSummaries",
        option_to_yojson model_package_summaries_to_yojson x.model_package_summaries );
      ( "BatchDescribeModelPackageErrorMap",
        option_to_yojson batch_describe_model_package_error_map_to_yojson
          x.batch_describe_model_package_error_map );
    ]

let model_package_arn_list_to_yojson tree = list_to_yojson model_package_arn_to_yojson tree

let batch_describe_model_package_input_to_yojson (x : batch_describe_model_package_input) =
  assoc_to_yojson
    [ ("ModelPackageArnList", Some (model_package_arn_list_to_yojson x.model_package_arn_list)) ]

let batch_reboot_cluster_nodes_error_code_to_yojson (x : batch_reboot_cluster_nodes_error_code) =
  match x with
  | INSTANCE_ID_NOT_FOUND -> `String "InstanceIdNotFound"
  | INVALID_INSTANCE_STATUS -> `String "InvalidInstanceStatus"
  | INSTANCE_ID_IN_USE -> `String "InstanceIdInUse"
  | INTERNAL_SERVER_ERROR -> `String "InternalServerError"

let batch_reboot_cluster_node_logical_ids_error_to_yojson
    (x : batch_reboot_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
      ("ErrorCode", Some (batch_reboot_cluster_nodes_error_code_to_yojson x.error_code));
      ("Message", Some (string__to_yojson x.message));
    ]

let batch_reboot_cluster_node_logical_ids_errors_to_yojson tree =
  list_to_yojson batch_reboot_cluster_node_logical_ids_error_to_yojson tree

let batch_reboot_cluster_nodes_error_to_yojson (x : batch_reboot_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ErrorCode", Some (batch_reboot_cluster_nodes_error_code_to_yojson x.error_code));
      ("Message", Some (string__to_yojson x.message));
    ]

let batch_reboot_cluster_nodes_errors_to_yojson tree =
  list_to_yojson batch_reboot_cluster_nodes_error_to_yojson tree

let batch_reboot_cluster_nodes_response_to_yojson (x : batch_reboot_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
      ("Failed", option_to_yojson batch_reboot_cluster_nodes_errors_to_yojson x.failed);
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_reboot_cluster_node_logical_ids_errors_to_yojson
          x.failed_node_logical_ids );
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
    ]

let batch_reboot_cluster_nodes_request_to_yojson (x : batch_reboot_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
    ]

let batch_replace_cluster_nodes_error_code_to_yojson (x : batch_replace_cluster_nodes_error_code) =
  match x with
  | INSTANCE_ID_NOT_FOUND -> `String "InstanceIdNotFound"
  | INVALID_INSTANCE_STATUS -> `String "InvalidInstanceStatus"
  | INSTANCE_ID_IN_USE -> `String "InstanceIdInUse"
  | INTERNAL_SERVER_ERROR -> `String "InternalServerError"

let batch_replace_cluster_node_logical_ids_error_to_yojson
    (x : batch_replace_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
      ("ErrorCode", Some (batch_replace_cluster_nodes_error_code_to_yojson x.error_code));
      ("Message", Some (string__to_yojson x.message));
    ]

let batch_replace_cluster_node_logical_ids_errors_to_yojson tree =
  list_to_yojson batch_replace_cluster_node_logical_ids_error_to_yojson tree

let batch_replace_cluster_nodes_error_to_yojson (x : batch_replace_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ErrorCode", Some (batch_replace_cluster_nodes_error_code_to_yojson x.error_code));
      ("Message", Some (string__to_yojson x.message));
    ]

let batch_replace_cluster_nodes_errors_to_yojson tree =
  list_to_yojson batch_replace_cluster_nodes_error_to_yojson tree

let batch_replace_cluster_nodes_response_to_yojson (x : batch_replace_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
      ("Failed", option_to_yojson batch_replace_cluster_nodes_errors_to_yojson x.failed);
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_replace_cluster_node_logical_ids_errors_to_yojson
          x.failed_node_logical_ids );
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
    ]

let batch_replace_cluster_nodes_request_to_yojson (x : batch_replace_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
    ]

let exclude_features_attribute_to_yojson = string_to_yojson
let monitoring_time_offset_string_to_yojson = string_to_yojson
let probability_threshold_attribute_to_yojson = double_to_yojson

let processing_s3_data_distribution_type_to_yojson (x : processing_s3_data_distribution_type) =
  match x with
  | FULLYREPLICATED -> `String "FullyReplicated"
  | SHARDEDBYS3KEY -> `String "ShardedByS3Key"

let processing_s3_input_mode_to_yojson (x : processing_s3_input_mode) =
  match x with PIPE -> `String "Pipe" | FILE -> `String "File"

let processing_local_path_to_yojson = string_to_yojson
let monitoring_parquet_dataset_format_to_yojson = unit_to_yojson

let monitoring_json_dataset_format_to_yojson (x : monitoring_json_dataset_format) =
  assoc_to_yojson [ ("Line", option_to_yojson boolean__to_yojson x.line) ]

let monitoring_csv_dataset_format_to_yojson (x : monitoring_csv_dataset_format) =
  assoc_to_yojson [ ("Header", option_to_yojson boolean__to_yojson x.header) ]

let monitoring_dataset_format_to_yojson (x : monitoring_dataset_format) =
  assoc_to_yojson
    [
      ("Csv", option_to_yojson monitoring_csv_dataset_format_to_yojson x.csv);
      ("Json", option_to_yojson monitoring_json_dataset_format_to_yojson x.json);
      ("Parquet", option_to_yojson monitoring_parquet_dataset_format_to_yojson x.parquet);
    ]

let batch_transform_input_to_yojson (x : batch_transform_input) =
  assoc_to_yojson
    [
      ( "DataCapturedDestinationS3Uri",
        Some (destination_s3_uri_to_yojson x.data_captured_destination_s3_uri) );
      ("DatasetFormat", Some (monitoring_dataset_format_to_yojson x.dataset_format));
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ("FeaturesAttribute", option_to_yojson string__to_yojson x.features_attribute);
      ("InferenceAttribute", option_to_yojson string__to_yojson x.inference_attribute);
      ("ProbabilityAttribute", option_to_yojson string__to_yojson x.probability_attribute);
      ( "ProbabilityThresholdAttribute",
        option_to_yojson probability_threshold_attribute_to_yojson x.probability_threshold_attribute
      );
      ( "StartTimeOffset",
        option_to_yojson monitoring_time_offset_string_to_yojson x.start_time_offset );
      ("EndTimeOffset", option_to_yojson monitoring_time_offset_string_to_yojson x.end_time_offset);
      ( "ExcludeFeaturesAttribute",
        option_to_yojson exclude_features_attribute_to_yojson x.exclude_features_attribute );
    ]

let bedrock_custom_model_deployment_metadata_to_yojson
    (x : bedrock_custom_model_deployment_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_custom_model_metadata_to_yojson (x : bedrock_custom_model_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_model_import_metadata_to_yojson (x : bedrock_model_import_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_provisioned_model_throughput_metadata_to_yojson
    (x : bedrock_provisioned_model_throughput_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let max_number_of_training_jobs_not_improving_to_yojson = int_to_yojson

let best_objective_not_improving_to_yojson (x : best_objective_not_improving) =
  assoc_to_yojson
    [
      ( "MaxNumberOfTrainingJobsNotImproving",
        option_to_yojson max_number_of_training_jobs_not_improving_to_yojson
          x.max_number_of_training_jobs_not_improving );
    ]

let content_digest_to_yojson = string_to_yojson

let metrics_source_to_yojson (x : metrics_source) =
  assoc_to_yojson
    [
      ("ContentType", Some (content_type_to_yojson x.content_type));
      ("ContentDigest", option_to_yojson content_digest_to_yojson x.content_digest);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let bias_to_yojson (x : bias) =
  assoc_to_yojson
    [
      ("Report", option_to_yojson metrics_source_to_yojson x.report);
      ("PreTrainingReport", option_to_yojson metrics_source_to_yojson x.pre_training_report);
      ("PostTrainingReport", option_to_yojson metrics_source_to_yojson x.post_training_report);
    ]

let billable_time_in_seconds_to_yojson = int_to_yojson
let billable_token_count_to_yojson = long_to_yojson
let blocked_reason_to_yojson = string_to_yojson
let maximum_execution_timeout_in_seconds_to_yojson = int_to_yojson
let termination_wait_in_seconds_to_yojson = int_to_yojson
let capacity_size_value_to_yojson = int_to_yojson

let capacity_size_type_to_yojson (x : capacity_size_type) =
  match x with
  | INSTANCE_COUNT -> `String "INSTANCE_COUNT"
  | CAPACITY_PERCENT -> `String "CAPACITY_PERCENT"

let capacity_size_to_yojson (x : capacity_size) =
  assoc_to_yojson
    [
      ("Type", Some (capacity_size_type_to_yojson x.type_));
      ("Value", Some (capacity_size_value_to_yojson x.value));
    ]

let wait_interval_in_seconds_to_yojson = int_to_yojson

let traffic_routing_config_type_to_yojson (x : traffic_routing_config_type) =
  match x with
  | ALL_AT_ONCE -> `String "ALL_AT_ONCE"
  | CANARY -> `String "CANARY"
  | LINEAR -> `String "LINEAR"

let traffic_routing_config_to_yojson (x : traffic_routing_config) =
  assoc_to_yojson
    [
      ("Type", Some (traffic_routing_config_type_to_yojson x.type_));
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ("CanarySize", option_to_yojson capacity_size_to_yojson x.canary_size);
      ("LinearStepSize", option_to_yojson capacity_size_to_yojson x.linear_step_size);
    ]

let blue_green_update_policy_to_yojson (x : blue_green_update_policy) =
  assoc_to_yojson
    [
      ( "TrafficRoutingConfiguration",
        Some (traffic_routing_config_to_yojson x.traffic_routing_configuration) );
      ( "TerminationWaitInSeconds",
        option_to_yojson termination_wait_in_seconds_to_yojson x.termination_wait_in_seconds );
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
    ]

let boolean_operator_to_yojson (x : boolean_operator) =
  match x with AND -> `String "And" | OR -> `String "Or"

let borrow_limit_to_yojson = int_to_yojson
let branch_to_yojson = string_to_yojson
let bucket_name_to_yojson = string_to_yojson
let pipeline_execution_arn_to_yojson = string_to_yojson

let cache_hit_result_to_yojson (x : cache_hit_result) =
  assoc_to_yojson
    [
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
    ]

let output_parameter_to_yojson (x : output_parameter) =
  assoc_to_yojson
    [ ("Name", Some (string256_to_yojson x.name)); ("Value", Some (string1024_to_yojson x.value)) ]

let output_parameter_list_to_yojson tree = list_to_yojson output_parameter_to_yojson tree
let callback_token_to_yojson = string_to_yojson

let callback_step_metadata_to_yojson (x : callback_step_metadata) =
  assoc_to_yojson
    [
      ("CallbackToken", option_to_yojson callback_token_to_yojson x.callback_token);
      ("SqsQueueUrl", option_to_yojson string256_to_yojson x.sqs_queue_url);
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
    ]

let candidate_sort_by_to_yojson (x : candidate_sort_by) =
  match x with
  | CreationTime -> `String "CreationTime"
  | Status -> `String "Status"
  | FinalObjectiveMetricValue -> `String "FinalObjectiveMetricValue"

let emr_serverless_settings_to_yojson (x : emr_serverless_settings) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("Status", option_to_yojson feature_status_to_yojson x.status);
    ]

let generative_ai_settings_to_yojson (x : generative_ai_settings) =
  assoc_to_yojson
    [ ("AmazonBedrockRoleArn", option_to_yojson role_arn_to_yojson x.amazon_bedrock_role_arn) ]

let kendra_settings_to_yojson (x : kendra_settings) =
  assoc_to_yojson [ ("Status", option_to_yojson feature_status_to_yojson x.status) ]

let direct_deploy_settings_to_yojson (x : direct_deploy_settings) =
  assoc_to_yojson [ ("Status", option_to_yojson feature_status_to_yojson x.status) ]

let secret_arn_to_yojson = string_to_yojson

let data_source_name_to_yojson (x : data_source_name) =
  match x with SalesforceGenie -> `String "SalesforceGenie" | Snowflake -> `String "Snowflake"

let identity_provider_o_auth_setting_to_yojson (x : identity_provider_o_auth_setting) =
  assoc_to_yojson
    [
      ("DataSourceName", option_to_yojson data_source_name_to_yojson x.data_source_name);
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
    ]

let identity_provider_o_auth_settings_to_yojson tree =
  list_to_yojson identity_provider_o_auth_setting_to_yojson tree

let workspace_settings_to_yojson (x : workspace_settings) =
  assoc_to_yojson
    [
      ("S3ArtifactPath", option_to_yojson s3_uri_to_yojson x.s3_artifact_path);
      ("S3KmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_kms_key_id);
    ]

let model_register_settings_to_yojson (x : model_register_settings) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ( "CrossAccountModelRegisterRoleArn",
        option_to_yojson role_arn_to_yojson x.cross_account_model_register_role_arn );
    ]

let time_series_forecasting_settings_to_yojson (x : time_series_forecasting_settings) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ("AmazonForecastRoleArn", option_to_yojson role_arn_to_yojson x.amazon_forecast_role_arn);
    ]

let canvas_app_settings_to_yojson (x : canvas_app_settings) =
  assoc_to_yojson
    [
      ( "TimeSeriesForecastingSettings",
        option_to_yojson time_series_forecasting_settings_to_yojson
          x.time_series_forecasting_settings );
      ( "ModelRegisterSettings",
        option_to_yojson model_register_settings_to_yojson x.model_register_settings );
      ("WorkspaceSettings", option_to_yojson workspace_settings_to_yojson x.workspace_settings);
      ( "IdentityProviderOAuthSettings",
        option_to_yojson identity_provider_o_auth_settings_to_yojson
          x.identity_provider_o_auth_settings );
      ( "DirectDeploySettings",
        option_to_yojson direct_deploy_settings_to_yojson x.direct_deploy_settings );
      ("KendraSettings", option_to_yojson kendra_settings_to_yojson x.kendra_settings);
      ( "GenerativeAiSettings",
        option_to_yojson generative_ai_settings_to_yojson x.generative_ai_settings );
      ( "EmrServerlessSettings",
        option_to_yojson emr_serverless_settings_to_yojson x.emr_serverless_settings );
    ]

let capacity_reservation_type_to_yojson (x : capacity_reservation_type) =
  match x with ODCR -> `String "ODCR" | CRG -> `String "CRG"

let capacity_reservation_to_yojson (x : capacity_reservation) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Type", option_to_yojson capacity_reservation_type_to_yojson x.type_);
    ]

let capacity_reservation_preference_to_yojson (x : capacity_reservation_preference) =
  match x with CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"

let node_unavailability_value_to_yojson = int_to_yojson

let node_unavailability_type_to_yojson (x : node_unavailability_type) =
  match x with
  | INSTANCE_COUNT -> `String "INSTANCE_COUNT"
  | CAPACITY_PERCENTAGE -> `String "CAPACITY_PERCENTAGE"

let capacity_size_config_to_yojson (x : capacity_size_config) =
  assoc_to_yojson
    [
      ("Type", Some (node_unavailability_type_to_yojson x.type_));
      ("Value", Some (node_unavailability_value_to_yojson x.value));
    ]

let capacity_unit_to_yojson = int_to_yojson
let json_content_type_to_yojson = string_to_yojson
let json_content_types_to_yojson tree = list_to_yojson json_content_type_to_yojson tree
let csv_content_type_to_yojson = string_to_yojson
let csv_content_types_to_yojson tree = list_to_yojson csv_content_type_to_yojson tree

let capture_content_type_header_to_yojson (x : capture_content_type_header) =
  assoc_to_yojson
    [
      ("CsvContentTypes", option_to_yojson csv_content_types_to_yojson x.csv_content_types);
      ("JsonContentTypes", option_to_yojson json_content_types_to_yojson x.json_content_types);
    ]

let capture_mode_to_yojson (x : capture_mode) =
  match x with
  | INPUT -> `String "Input"
  | OUTPUT -> `String "Output"
  | INPUT_AND_OUTPUT -> `String "InputAndOutput"

let capture_option_to_yojson (x : capture_option) =
  assoc_to_yojson [ ("CaptureMode", Some (capture_mode_to_yojson x.capture_mode)) ]

let capture_option_list_to_yojson tree = list_to_yojson capture_option_to_yojson tree

let capture_status_to_yojson (x : capture_status) =
  match x with STARTED -> `String "Started" | STOPPED -> `String "Stopped"

let catalog_to_yojson = string_to_yojson
let string128_to_yojson = string_to_yojson
let categorical_parameter_range_values_to_yojson tree = list_to_yojson string128_to_yojson tree

let categorical_parameter_to_yojson (x : categorical_parameter) =
  assoc_to_yojson
    [
      ("Name", Some (string64_to_yojson x.name));
      ("Value", Some (categorical_parameter_range_values_to_yojson x.value));
    ]

let parameter_values_to_yojson tree = list_to_yojson parameter_value_to_yojson tree

let categorical_parameter_range_to_yojson (x : categorical_parameter_range) =
  assoc_to_yojson
    [
      ("Name", Some (parameter_key_to_yojson x.name));
      ("Values", Some (parameter_values_to_yojson x.values));
    ]

let categorical_parameter_range_specification_to_yojson
    (x : categorical_parameter_range_specification) =
  assoc_to_yojson [ ("Values", Some (parameter_values_to_yojson x.values)) ]

let categorical_parameter_ranges_to_yojson tree =
  list_to_yojson categorical_parameter_range_to_yojson tree

let categorical_parameters_to_yojson tree = list_to_yojson categorical_parameter_to_yojson tree
let cents_to_yojson = int_to_yojson
let certify_for_marketplace_to_yojson = bool_to_yojson
let cfn_stack_parameter_value_to_yojson = string_to_yojson
let cfn_stack_parameter_key_to_yojson = string_to_yojson

let cfn_stack_create_parameter_to_yojson (x : cfn_stack_create_parameter) =
  assoc_to_yojson
    [
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
    ]

let cfn_stack_create_parameters_to_yojson tree =
  list_to_yojson cfn_stack_create_parameter_to_yojson tree

let cfn_template_ur_l_to_yojson = string_to_yojson
let cfn_template_name_to_yojson = string_to_yojson

let cfn_create_template_provider_to_yojson (x : cfn_create_template_provider) =
  assoc_to_yojson
    [
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("RoleARN", option_to_yojson role_arn_to_yojson x.role_ar_n);
      ("Parameters", option_to_yojson cfn_stack_create_parameters_to_yojson x.parameters);
    ]

let cfn_stack_status_message_to_yojson = string_to_yojson
let cfn_stack_id_to_yojson = string_to_yojson
let cfn_stack_name_to_yojson = string_to_yojson

let cfn_stack_detail_to_yojson (x : cfn_stack_detail) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson cfn_stack_name_to_yojson x.name);
      ("Id", option_to_yojson cfn_stack_id_to_yojson x.id);
      ("StatusMessage", Some (cfn_stack_status_message_to_yojson x.status_message));
    ]

let cfn_stack_parameter_to_yojson (x : cfn_stack_parameter) =
  assoc_to_yojson
    [
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
    ]

let cfn_stack_parameters_to_yojson tree = list_to_yojson cfn_stack_parameter_to_yojson tree

let cfn_stack_update_parameter_to_yojson (x : cfn_stack_update_parameter) =
  assoc_to_yojson
    [
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
    ]

let cfn_stack_update_parameters_to_yojson tree =
  list_to_yojson cfn_stack_update_parameter_to_yojson tree

let cfn_template_provider_detail_to_yojson (x : cfn_template_provider_detail) =
  assoc_to_yojson
    [
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("RoleARN", option_to_yojson role_arn_to_yojson x.role_ar_n);
      ("Parameters", option_to_yojson cfn_stack_parameters_to_yojson x.parameters);
      ("StackDetail", option_to_yojson cfn_stack_detail_to_yojson x.stack_detail);
    ]

let cfn_update_template_provider_to_yojson (x : cfn_update_template_provider) =
  assoc_to_yojson
    [
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("Parameters", option_to_yojson cfn_stack_update_parameters_to_yojson x.parameters);
    ]

let input_modes_to_yojson tree = list_to_yojson training_input_mode_to_yojson tree
let compression_types_to_yojson tree = list_to_yojson compression_type_to_yojson tree

let channel_specification_to_yojson (x : channel_specification) =
  assoc_to_yojson
    [
      ("Name", Some (channel_name_to_yojson x.name));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("IsRequired", option_to_yojson boolean__to_yojson x.is_required);
      ("SupportedContentTypes", Some (content_types_to_yojson x.supported_content_types));
      ( "SupportedCompressionTypes",
        option_to_yojson compression_types_to_yojson x.supported_compression_types );
      ("SupportedInputModes", Some (input_modes_to_yojson x.supported_input_modes));
    ]

let channel_specifications_to_yojson tree = list_to_yojson channel_specification_to_yojson tree

let checkpoint_config_to_yojson (x : checkpoint_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
    ]

let cidr_to_yojson = string_to_yojson
let cidrs_to_yojson tree = list_to_yojson cidr_to_yojson tree

let clarify_check_step_metadata_to_yojson (x : clarify_check_step_metadata) =
  assoc_to_yojson
    [
      ("CheckType", option_to_yojson string256_to_yojson x.check_type);
      ( "BaselineUsedForDriftCheckConstraints",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_constraints );
      ( "CalculatedBaselineConstraints",
        option_to_yojson string1024_to_yojson x.calculated_baseline_constraints );
      ("ModelPackageGroupName", option_to_yojson string256_to_yojson x.model_package_group_name);
      ("ViolationReport", option_to_yojson string1024_to_yojson x.violation_report);
      ("CheckJobArn", option_to_yojson string256_to_yojson x.check_job_arn);
      ("SkipCheck", option_to_yojson boolean__to_yojson x.skip_check);
      ("RegisterNewBaseline", option_to_yojson boolean__to_yojson x.register_new_baseline);
    ]

let clarify_content_template_to_yojson = string_to_yojson
let clarify_enable_explanations_to_yojson = string_to_yojson

let clarify_text_granularity_to_yojson (x : clarify_text_granularity) =
  match x with
  | TOKEN -> `String "token"
  | SENTENCE -> `String "sentence"
  | PARAGRAPH -> `String "paragraph"

let clarify_text_language_to_yojson (x : clarify_text_language) =
  match x with
  | AFRIKAANS -> `String "af"
  | ALBANIAN -> `String "sq"
  | ARABIC -> `String "ar"
  | ARMENIAN -> `String "hy"
  | BASQUE -> `String "eu"
  | BENGALI -> `String "bn"
  | BULGARIAN -> `String "bg"
  | CATALAN -> `String "ca"
  | CHINESE -> `String "zh"
  | CROATIAN -> `String "hr"
  | CZECH -> `String "cs"
  | DANISH -> `String "da"
  | DUTCH -> `String "nl"
  | ENGLISH -> `String "en"
  | ESTONIAN -> `String "et"
  | FINNISH -> `String "fi"
  | FRENCH -> `String "fr"
  | GERMAN -> `String "de"
  | GREEK -> `String "el"
  | GUJARATI -> `String "gu"
  | HEBREW -> `String "he"
  | HINDI -> `String "hi"
  | HUNGARIAN -> `String "hu"
  | ICELANDIC -> `String "is"
  | INDONESIAN -> `String "id"
  | IRISH -> `String "ga"
  | ITALIAN -> `String "it"
  | KANNADA -> `String "kn"
  | KYRGYZ -> `String "ky"
  | LATVIAN -> `String "lv"
  | LITHUANIAN -> `String "lt"
  | LUXEMBOURGISH -> `String "lb"
  | MACEDONIAN -> `String "mk"
  | MALAYALAM -> `String "ml"
  | MARATHI -> `String "mr"
  | NEPALI -> `String "ne"
  | NORWEGIAN_BOKMAL -> `String "nb"
  | PERSIAN -> `String "fa"
  | POLISH -> `String "pl"
  | PORTUGUESE -> `String "pt"
  | ROMANIAN -> `String "ro"
  | RUSSIAN -> `String "ru"
  | SANSKRIT -> `String "sa"
  | SERBIAN -> `String "sr"
  | SETSWANA -> `String "tn"
  | SINHALA -> `String "si"
  | SLOVAK -> `String "sk"
  | SLOVENIAN -> `String "sl"
  | SPANISH -> `String "es"
  | SWEDISH -> `String "sv"
  | TAGALOG -> `String "tl"
  | TAMIL -> `String "ta"
  | TATAR -> `String "tt"
  | TELUGU -> `String "te"
  | TURKISH -> `String "tr"
  | UKRAINIAN -> `String "uk"
  | URDU -> `String "ur"
  | YORUBA -> `String "yo"
  | LIGURIAN -> `String "lij"
  | MULTI_LANGUAGE -> `String "xx"

let clarify_text_config_to_yojson (x : clarify_text_config) =
  assoc_to_yojson
    [
      ("Language", Some (clarify_text_language_to_yojson x.language));
      ("Granularity", Some (clarify_text_granularity_to_yojson x.granularity));
    ]

let clarify_shap_seed_to_yojson = int_to_yojson
let clarify_shap_use_logit_to_yojson = bool_to_yojson
let clarify_shap_number_of_samples_to_yojson = int_to_yojson
let clarify_shap_baseline_to_yojson = string_to_yojson
let clarify_mime_type_to_yojson = string_to_yojson

let clarify_shap_baseline_config_to_yojson (x : clarify_shap_baseline_config) =
  assoc_to_yojson
    [
      ("MimeType", option_to_yojson clarify_mime_type_to_yojson x.mime_type);
      ("ShapBaseline", option_to_yojson clarify_shap_baseline_to_yojson x.shap_baseline);
      ("ShapBaselineUri", option_to_yojson url_to_yojson x.shap_baseline_uri);
    ]

let clarify_shap_config_to_yojson (x : clarify_shap_config) =
  assoc_to_yojson
    [
      ("ShapBaselineConfig", Some (clarify_shap_baseline_config_to_yojson x.shap_baseline_config));
      ( "NumberOfSamples",
        option_to_yojson clarify_shap_number_of_samples_to_yojson x.number_of_samples );
      ("UseLogit", option_to_yojson clarify_shap_use_logit_to_yojson x.use_logit);
      ("Seed", option_to_yojson clarify_shap_seed_to_yojson x.seed);
      ("TextConfig", option_to_yojson clarify_text_config_to_yojson x.text_config);
    ]

let clarify_feature_type_to_yojson (x : clarify_feature_type) =
  match x with
  | NUMERICAL -> `String "numerical"
  | CATEGORICAL -> `String "categorical"
  | TEXT -> `String "text"

let clarify_feature_types_to_yojson tree = list_to_yojson clarify_feature_type_to_yojson tree
let clarify_header_to_yojson = string_to_yojson
let clarify_feature_headers_to_yojson tree = list_to_yojson clarify_header_to_yojson tree
let clarify_label_headers_to_yojson tree = list_to_yojson clarify_header_to_yojson tree
let clarify_label_attribute_to_yojson = string_to_yojson
let clarify_probability_attribute_to_yojson = string_to_yojson
let clarify_label_index_to_yojson = int_to_yojson
let clarify_probability_index_to_yojson = int_to_yojson
let clarify_max_payload_in_m_b_to_yojson = int_to_yojson
let clarify_max_record_count_to_yojson = int_to_yojson
let clarify_features_attribute_to_yojson = string_to_yojson

let clarify_inference_config_to_yojson (x : clarify_inference_config) =
  assoc_to_yojson
    [
      ( "FeaturesAttribute",
        option_to_yojson clarify_features_attribute_to_yojson x.features_attribute );
      ("ContentTemplate", option_to_yojson clarify_content_template_to_yojson x.content_template);
      ("MaxRecordCount", option_to_yojson clarify_max_record_count_to_yojson x.max_record_count);
      ("MaxPayloadInMB", option_to_yojson clarify_max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("ProbabilityIndex", option_to_yojson clarify_probability_index_to_yojson x.probability_index);
      ("LabelIndex", option_to_yojson clarify_label_index_to_yojson x.label_index);
      ( "ProbabilityAttribute",
        option_to_yojson clarify_probability_attribute_to_yojson x.probability_attribute );
      ("LabelAttribute", option_to_yojson clarify_label_attribute_to_yojson x.label_attribute);
      ("LabelHeaders", option_to_yojson clarify_label_headers_to_yojson x.label_headers);
      ("FeatureHeaders", option_to_yojson clarify_feature_headers_to_yojson x.feature_headers);
      ("FeatureTypes", option_to_yojson clarify_feature_types_to_yojson x.feature_types);
    ]

let clarify_explainer_config_to_yojson (x : clarify_explainer_config) =
  assoc_to_yojson
    [
      ( "EnableExplanations",
        option_to_yojson clarify_enable_explanations_to_yojson x.enable_explanations );
      ("InferenceConfig", option_to_yojson clarify_inference_config_to_yojson x.inference_config);
      ("ShapConfig", Some (clarify_shap_config_to_yojson x.shap_config));
    ]

let client_id_to_yojson = string_to_yojson
let client_secret_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson
let wait_time_interval_in_seconds_to_yojson = int_to_yojson

let rolling_deployment_policy_to_yojson (x : rolling_deployment_policy) =
  assoc_to_yojson
    [
      ("MaximumBatchSize", Some (capacity_size_config_to_yojson x.maximum_batch_size));
      ( "RollbackMaximumBatchSize",
        option_to_yojson capacity_size_config_to_yojson x.rollback_maximum_batch_size );
    ]

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ( "RollingUpdatePolicy",
        option_to_yojson rolling_deployment_policy_to_yojson x.rolling_update_policy );
      ( "WaitIntervalInSeconds",
        option_to_yojson wait_time_interval_in_seconds_to_yojson x.wait_interval_in_seconds );
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_alarms_to_yojson x.auto_rollback_configuration );
    ]

let cluster_patch_schedule_to_yojson (x : cluster_patch_schedule) =
  assoc_to_yojson [ ("NextPatchDate", option_to_yojson timestamp_to_yojson x.next_patch_date) ]

let cluster_patching_strategy_to_yojson (x : cluster_patching_strategy) =
  match x with WHEN_IDLE -> `String "WhenIdle" | WHEN_ALL_IDLE -> `String "WhenAllIdle"

let cluster_auto_patch_config_to_yojson (x : cluster_auto_patch_config) =
  assoc_to_yojson
    [
      ("PatchingStrategy", Some (cluster_patching_strategy_to_yojson x.patching_strategy));
      ("PatchSchedule", option_to_yojson cluster_patch_schedule_to_yojson x.patch_schedule);
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
    ]

let cluster_patch_schedule_details_to_yojson (x : cluster_patch_schedule_details) =
  assoc_to_yojson [ ("NextPatchDate", option_to_yojson timestamp_to_yojson x.next_patch_date) ]

let cluster_auto_patch_config_details_to_yojson (x : cluster_auto_patch_config_details) =
  assoc_to_yojson
    [
      ("PatchingStrategy", option_to_yojson cluster_patching_strategy_to_yojson x.patching_strategy);
      ( "CurrentPatchSchedule",
        option_to_yojson cluster_patch_schedule_details_to_yojson x.current_patch_schedule );
      ( "DesiredPatchSchedule",
        option_to_yojson cluster_patch_schedule_details_to_yojson x.desired_patch_schedule );
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
    ]

let cluster_auto_scaler_type_to_yojson (x : cluster_auto_scaler_type) =
  match x with KARPENTER -> `String "Karpenter"

let cluster_auto_scaling_mode_to_yojson (x : cluster_auto_scaling_mode) =
  match x with ENABLE -> `String "Enable" | DISABLE -> `String "Disable"

let cluster_auto_scaling_config_to_yojson (x : cluster_auto_scaling_config) =
  assoc_to_yojson
    [
      ("Mode", Some (cluster_auto_scaling_mode_to_yojson x.mode));
      ("AutoScalerType", option_to_yojson cluster_auto_scaler_type_to_yojson x.auto_scaler_type);
    ]

let cluster_auto_scaling_status_to_yojson (x : cluster_auto_scaling_status) =
  match x with
  | INSERVICE -> `String "InService"
  | FAILED -> `String "Failed"
  | CREATING -> `String "Creating"
  | DELETING -> `String "Deleting"

let cluster_auto_scaling_config_output_to_yojson (x : cluster_auto_scaling_config_output) =
  assoc_to_yojson
    [
      ("Mode", Some (cluster_auto_scaling_mode_to_yojson x.mode));
      ("AutoScalerType", option_to_yojson cluster_auto_scaler_type_to_yojson x.auto_scaler_type);
      ("Status", Some (cluster_auto_scaling_status_to_yojson x.status));
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let cluster_availability_zone_id_to_yojson = string_to_yojson
let cluster_on_demand_options_to_yojson = unit_to_yojson
let cluster_spot_options_to_yojson = unit_to_yojson

let cluster_capacity_requirements_to_yojson (x : cluster_capacity_requirements) =
  assoc_to_yojson
    [
      ("Spot", option_to_yojson cluster_spot_options_to_yojson x.spot);
      ("OnDemand", option_to_yojson cluster_on_demand_options_to_yojson x.on_demand);
    ]

let cluster_capacity_type_to_yojson (x : cluster_capacity_type) =
  match x with SPOT -> `String "Spot" | ON_DEMAND -> `String "OnDemand"

let cluster_config_mode_to_yojson (x : cluster_config_mode) =
  match x with ENABLE -> `String "Enable" | DISABLE -> `String "Disable"

let cluster_dns_name_to_yojson = string_to_yojson
let cluster_ebs_volume_size_in_g_b_to_yojson = int_to_yojson

let cluster_ebs_volume_config_to_yojson (x : cluster_ebs_volume_config) =
  assoc_to_yojson
    [
      ( "VolumeSizeInGB",
        option_to_yojson cluster_ebs_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("RootVolume", option_to_yojson boolean__to_yojson x.root_volume);
    ]

let cluster_event_level_to_yojson (x : cluster_event_level) =
  match x with INFO -> `String "Info" | WARN -> `String "Warn" | ERROR -> `String "Error"

let instance_requirements_eni_configuration_to_yojson (x : instance_requirements_eni_configuration)
    =
  assoc_to_yojson
    [
      ( "CustomerEni",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_eni );
      ("AdditionalEnis", option_to_yojson additional_enis_to_yojson x.additional_enis);
    ]

let instance_requirements_eni_configurations_to_yojson tree =
  list_to_yojson instance_requirements_eni_configuration_to_yojson tree

let instance_metadata_to_yojson (x : instance_metadata) =
  assoc_to_yojson
    [
      ( "CustomerEni",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_eni );
      ("AdditionalEnis", option_to_yojson additional_enis_to_yojson x.additional_enis);
      ( "InstanceRequirementsEniConfigurations",
        option_to_yojson instance_requirements_eni_configurations_to_yojson
          x.instance_requirements_eni_configurations );
      ("CapacityReservation", option_to_yojson capacity_reservation_to_yojson x.capacity_reservation);
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "LcsExecutionState",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lcs_execution_state );
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
    ]

let target_count_to_yojson = int_to_yojson

let instance_group_scaling_metadata_to_yojson (x : instance_group_scaling_metadata) =
  assoc_to_yojson
    [
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ("TargetCount", option_to_yojson target_count_to_yojson x.target_count);
      ("MinCount", option_to_yojson instance_count_to_yojson x.min_count);
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let instance_group_metadata_to_yojson (x : instance_group_metadata) =
  assoc_to_yojson
    [
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "AvailabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ("CapacityReservation", option_to_yojson capacity_reservation_to_yojson x.capacity_reservation);
      ( "SubnetId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subnet_id );
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "AmiOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ami_override );
    ]

let eks_role_access_entries_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let cluster_metadata_to_yojson (x : cluster_metadata) =
  assoc_to_yojson
    [
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "EksRoleAccessEntries",
        option_to_yojson eks_role_access_entries_to_yojson x.eks_role_access_entries );
      ( "SlrAccessEntry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.slr_access_entry
      );
    ]

let event_metadata_to_yojson (x : event_metadata) =
  match x with
  | Cluster arg -> assoc_to_yojson [ ("Cluster", Some (cluster_metadata_to_yojson arg)) ]
  | InstanceGroup arg ->
      assoc_to_yojson [ ("InstanceGroup", Some (instance_group_metadata_to_yojson arg)) ]
  | InstanceGroupScaling arg ->
      assoc_to_yojson
        [ ("InstanceGroupScaling", Some (instance_group_scaling_metadata_to_yojson arg)) ]
  | Instance arg -> assoc_to_yojson [ ("Instance", Some (instance_metadata_to_yojson arg)) ]

let event_details_to_yojson (x : event_details) =
  assoc_to_yojson [ ("EventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata) ]

let cluster_event_resource_type_to_yojson (x : cluster_event_resource_type) =
  match x with
  | CLUSTER -> `String "Cluster"
  | INSTANCE_GROUP -> `String "InstanceGroup"
  | INSTANCE -> `String "Instance"

let cluster_name_to_yojson = string_to_yojson
let event_id_to_yojson = string_to_yojson

let cluster_event_detail_to_yojson (x : cluster_event_detail) =
  assoc_to_yojson
    [
      ("EventId", Some (event_id_to_yojson x.event_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ("ResourceType", Some (cluster_event_resource_type_to_yojson x.resource_type));
      ("EventTime", Some (timestamp_to_yojson x.event_time));
      ("EventDetails", option_to_yojson event_details_to_yojson x.event_details);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("EventLevel", option_to_yojson cluster_event_level_to_yojson x.event_level);
    ]

let cluster_event_max_results_to_yojson = int_to_yojson

let cluster_event_summary_to_yojson (x : cluster_event_summary) =
  assoc_to_yojson
    [
      ("EventId", Some (event_id_to_yojson x.event_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ("ResourceType", Some (cluster_event_resource_type_to_yojson x.resource_type));
      ("EventTime", Some (timestamp_to_yojson x.event_time));
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("EventLevel", option_to_yojson cluster_event_level_to_yojson x.event_level);
    ]

let cluster_event_summaries_to_yojson tree = list_to_yojson cluster_event_summary_to_yojson tree

let cluster_f_sx_lustre_deletion_policy_to_yojson (x : cluster_f_sx_lustre_deletion_policy) =
  match x with DELETE_IF_NOT_USED -> `String "DeleteIfNotUsed" | KEEP -> `String "Keep"

let cluster_fsx_mount_path_to_yojson = string_to_yojson
let cluster_mount_name_to_yojson = string_to_yojson

let cluster_fsx_lustre_config_to_yojson (x : cluster_fsx_lustre_config) =
  assoc_to_yojson
    [
      ("DnsName", Some (cluster_dns_name_to_yojson x.dns_name));
      ("MountName", Some (cluster_mount_name_to_yojson x.mount_name));
      ("MountPath", option_to_yojson cluster_fsx_mount_path_to_yojson x.mount_path);
    ]

let cluster_fsx_open_zfs_config_to_yojson (x : cluster_fsx_open_zfs_config) =
  assoc_to_yojson
    [
      ("DnsName", Some (cluster_dns_name_to_yojson x.dns_name));
      ("MountPath", option_to_yojson cluster_fsx_mount_path_to_yojson x.mount_path);
    ]

let cluster_image_version_status_to_yojson (x : cluster_image_version_status) =
  match x with
  | UP_TO_DATE -> `String "UpToDate"
  | UPDATE_AVAILABLE -> `String "UpdateAvailable"
  | SECURITY_UPDATE_REQUIRED -> `String "SecurityUpdateRequired"
  | END_OF_LIFE -> `String "EndOfLife"

let cluster_instance_count_to_yojson = int_to_yojson

let cluster_interface_type_to_yojson (x : cluster_interface_type) =
  match x with EFA -> `String "efa" | EFA_ONLY -> `String "efa-only"

let cluster_network_interface_details_to_yojson (x : cluster_network_interface_details) =
  assoc_to_yojson
    [ ("InterfaceType", option_to_yojson cluster_interface_type_to_yojson x.interface_type) ]

let cluster_partition_name_to_yojson = string_to_yojson
let cluster_partition_names_to_yojson tree = list_to_yojson cluster_partition_name_to_yojson tree

let cluster_slurm_node_type_to_yojson (x : cluster_slurm_node_type) =
  match x with
  | CONTROLLER -> `String "Controller"
  | LOGIN -> `String "Login"
  | COMPUTE -> `String "Compute"

let cluster_slurm_config_details_to_yojson (x : cluster_slurm_config_details) =
  assoc_to_yojson
    [
      ("NodeType", Some (cluster_slurm_node_type_to_yojson x.node_type));
      ("PartitionNames", option_to_yojson cluster_partition_names_to_yojson x.partition_names);
    ]

let software_update_status_to_yojson (x : software_update_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | ROLLBACK_COMPLETE -> `String "RollbackComplete"

let cluster_kubernetes_taint_effect_to_yojson (x : cluster_kubernetes_taint_effect) =
  match x with
  | NO_SCHEDULE -> `String "NoSchedule"
  | PREFER_NO_SCHEDULE -> `String "PreferNoSchedule"
  | NO_EXECUTE -> `String "NoExecute"

let cluster_kubernetes_taint_value_to_yojson = string_to_yojson
let cluster_kubernetes_taint_key_to_yojson = string_to_yojson

let cluster_kubernetes_taint_to_yojson (x : cluster_kubernetes_taint) =
  assoc_to_yojson
    [
      ("Key", Some (cluster_kubernetes_taint_key_to_yojson x.key));
      ("Value", option_to_yojson cluster_kubernetes_taint_value_to_yojson x.value);
      ("Effect", Some (cluster_kubernetes_taint_effect_to_yojson x.effect_));
    ]

let cluster_kubernetes_taints_to_yojson tree =
  list_to_yojson cluster_kubernetes_taint_to_yojson tree

let cluster_kubernetes_label_value_to_yojson = string_to_yojson
let cluster_kubernetes_label_key_to_yojson = string_to_yojson

let cluster_kubernetes_labels_to_yojson tree =
  map_to_yojson cluster_kubernetes_label_key_to_yojson cluster_kubernetes_label_value_to_yojson tree

let cluster_kubernetes_config_details_to_yojson (x : cluster_kubernetes_config_details) =
  assoc_to_yojson
    [
      ("CurrentLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.current_labels);
      ("DesiredLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.desired_labels);
      ("CurrentTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.current_taints);
      ("DesiredTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.desired_taints);
    ]

let image_release_version_to_yojson = string_to_yojson
let image_id_to_yojson = string_to_yojson
let cron_schedule_expression_to_yojson = string_to_yojson

let scheduled_update_config_to_yojson (x : scheduled_update_config) =
  assoc_to_yojson
    [
      ("ScheduleExpression", Some (cron_schedule_expression_to_yojson x.schedule_expression));
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
    ]

let instance_group_training_plan_status_to_yojson = string_to_yojson

let instance_group_status_to_yojson (x : instance_group_status) =
  match x with
  | INSERVICE -> `String "InService"
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | FAILED -> `String "Failed"
  | DEGRADED -> `String "Degraded"
  | SYSTEMUPDATING -> `String "SystemUpdating"
  | DELETING -> `String "Deleting"

let deep_health_check_type_to_yojson (x : deep_health_check_type) =
  match x with
  | INSTANCE_STRESS -> `String "InstanceStress"
  | INSTANCE_CONNECTIVITY -> `String "InstanceConnectivity"

let on_start_deep_health_checks_to_yojson tree =
  list_to_yojson deep_health_check_type_to_yojson tree

let cluster_instance_storage_config_to_yojson (x : cluster_instance_storage_config) =
  match x with
  | EbsVolumeConfig arg ->
      assoc_to_yojson [ ("EbsVolumeConfig", Some (cluster_ebs_volume_config_to_yojson arg)) ]
  | FsxLustreConfig arg ->
      assoc_to_yojson [ ("FsxLustreConfig", Some (cluster_fsx_lustre_config_to_yojson arg)) ]
  | FsxOpenZfsConfig arg ->
      assoc_to_yojson [ ("FsxOpenZfsConfig", Some (cluster_fsx_open_zfs_config_to_yojson arg)) ]

let cluster_instance_storage_configs_to_yojson tree =
  list_to_yojson cluster_instance_storage_config_to_yojson tree

let cluster_threads_per_core_to_yojson = int_to_yojson
let cluster_life_cycle_config_file_name_to_yojson = string_to_yojson

let cluster_life_cycle_config_to_yojson (x : cluster_life_cycle_config) =
  assoc_to_yojson
    [
      ("SourceS3Uri", option_to_yojson s3_uri_to_yojson x.source_s3_uri);
      ("OnCreate", option_to_yojson cluster_life_cycle_config_file_name_to_yojson x.on_create);
      ( "OnInitComplete",
        option_to_yojson cluster_life_cycle_config_file_name_to_yojson x.on_init_complete );
    ]

let cluster_non_negative_instance_count_to_yojson = int_to_yojson

let cluster_instance_type_detail_to_yojson (x : cluster_instance_type_detail) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
    ]

let cluster_instance_type_details_to_yojson tree =
  list_to_yojson cluster_instance_type_detail_to_yojson tree

let cluster_instance_requirement_details_to_yojson (x : cluster_instance_requirement_details) =
  assoc_to_yojson
    [
      ( "CurrentInstanceTypes",
        option_to_yojson cluster_instance_types_to_yojson x.current_instance_types );
      ( "DesiredInstanceTypes",
        option_to_yojson cluster_instance_types_to_yojson x.desired_instance_types );
    ]

let cluster_instance_group_details_to_yojson (x : cluster_instance_group_details) =
  assoc_to_yojson
    [
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
      ("TargetCount", option_to_yojson cluster_instance_count_to_yojson x.target_count);
      ("MinCount", option_to_yojson cluster_instance_count_to_yojson x.min_count);
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "InstanceRequirements",
        option_to_yojson cluster_instance_requirement_details_to_yojson x.instance_requirements );
      ( "InstanceTypeDetails",
        option_to_yojson cluster_instance_type_details_to_yojson x.instance_type_details );
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ( "TrainingPlanStatus",
        option_to_yojson instance_group_training_plan_status_to_yojson x.training_plan_status );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ( "AutoPatchConfig",
        option_to_yojson cluster_auto_patch_config_details_to_yojson x.auto_patch_config );
      ("CurrentImageId", option_to_yojson image_id_to_yojson x.current_image_id);
      ("DesiredImageId", option_to_yojson image_id_to_yojson x.desired_image_id);
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ( "DesiredImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.desired_image_release_version );
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ("ActiveOperations", option_to_yojson active_operations_to_yojson x.active_operations);
      ( "KubernetesConfig",
        option_to_yojson cluster_kubernetes_config_details_to_yojson x.kubernetes_config );
      ( "CapacityRequirements",
        option_to_yojson cluster_capacity_requirements_to_yojson x.capacity_requirements );
      ("TargetStateCount", option_to_yojson cluster_instance_count_to_yojson x.target_state_count);
      ( "SoftwareUpdateStatus",
        option_to_yojson software_update_status_to_yojson x.software_update_status );
      ( "ActiveSoftwareUpdateConfig",
        option_to_yojson deployment_configuration_to_yojson x.active_software_update_config );
      ("SlurmConfig", option_to_yojson cluster_slurm_config_details_to_yojson x.slurm_config);
      ( "NetworkInterface",
        option_to_yojson cluster_network_interface_details_to_yojson x.network_interface );
    ]

let cluster_instance_group_details_list_to_yojson tree =
  list_to_yojson cluster_instance_group_details_to_yojson tree

let cluster_network_interface_to_yojson (x : cluster_network_interface) =
  assoc_to_yojson
    [ ("InterfaceType", option_to_yojson cluster_interface_type_to_yojson x.interface_type) ]

let cluster_slurm_config_to_yojson (x : cluster_slurm_config) =
  assoc_to_yojson
    [
      ("NodeType", Some (cluster_slurm_node_type_to_yojson x.node_type));
      ("PartitionNames", option_to_yojson cluster_partition_names_to_yojson x.partition_names);
    ]

let cluster_kubernetes_config_to_yojson (x : cluster_kubernetes_config) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson cluster_kubernetes_labels_to_yojson x.labels);
      ("Taints", option_to_yojson cluster_kubernetes_taints_to_yojson x.taints);
    ]

let cluster_instance_requirements_to_yojson (x : cluster_instance_requirements) =
  assoc_to_yojson [ ("InstanceTypes", Some (cluster_instance_types_to_yojson x.instance_types)) ]

let cluster_instance_group_specification_to_yojson (x : cluster_instance_group_specification) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (cluster_instance_count_to_yojson x.instance_count));
      ("MinInstanceCount", option_to_yojson cluster_instance_count_to_yojson x.min_instance_count);
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "InstanceRequirements",
        option_to_yojson cluster_instance_requirements_to_yojson x.instance_requirements );
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ("ExecutionRole", Some (role_arn_to_yojson x.execution_role));
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ("AutoPatchConfig", option_to_yojson cluster_auto_patch_config_to_yojson x.auto_patch_config);
      ( "ImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.image_release_version );
      ("KubernetesConfig", option_to_yojson cluster_kubernetes_config_to_yojson x.kubernetes_config);
      ("SlurmConfig", option_to_yojson cluster_slurm_config_to_yojson x.slurm_config);
      ( "CapacityRequirements",
        option_to_yojson cluster_capacity_requirements_to_yojson x.capacity_requirements );
      ("NetworkInterface", option_to_yojson cluster_network_interface_to_yojson x.network_interface);
    ]

let cluster_instance_group_specifications_to_yojson tree =
  list_to_yojson cluster_instance_group_specification_to_yojson tree

let cluster_instance_groups_to_delete_to_yojson tree =
  list_to_yojson cluster_instance_group_name_to_yojson tree

let cluster_instance_memory_allocation_percentage_to_yojson = int_to_yojson

let cluster_instance_placement_to_yojson (x : cluster_instance_placement) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson cluster_availability_zone_to_yojson x.availability_zone);
      ( "AvailabilityZoneId",
        option_to_yojson cluster_availability_zone_id_to_yojson x.availability_zone_id );
    ]

let cluster_instance_status_details_to_yojson (x : cluster_instance_status_details) =
  assoc_to_yojson
    [
      ("Status", Some (cluster_instance_status_to_yojson x.status));
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let cluster_kubernetes_config_node_details_to_yojson (x : cluster_kubernetes_config_node_details) =
  assoc_to_yojson
    [
      ("CurrentLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.current_labels);
      ("DesiredLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.desired_labels);
      ("CurrentTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.current_taints);
      ("DesiredTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.desired_taints);
    ]

let ultra_server_info_to_yojson (x : ultra_server_info) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("Type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
    ]

let cluster_private_dns_hostname_to_yojson = string_to_yojson
let cluster_private_primary_ipv6_to_yojson = string_to_yojson
let cluster_private_primary_ip_to_yojson = string_to_yojson

let cluster_node_details_to_yojson (x : cluster_node_details) =
  assoc_to_yojson
    [
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
      ( "InstanceStatus",
        option_to_yojson cluster_instance_status_details_to_yojson x.instance_status );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ("LaunchTime", option_to_yojson timestamp_to_yojson x.launch_time);
      ("LastSoftwareUpdateTime", option_to_yojson timestamp_to_yojson x.last_software_update_time);
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ( "PrivatePrimaryIp",
        option_to_yojson cluster_private_primary_ip_to_yojson x.private_primary_ip );
      ( "PrivatePrimaryIpv6",
        option_to_yojson cluster_private_primary_ipv6_to_yojson x.private_primary_ipv6 );
      ( "PrivateDnsHostname",
        option_to_yojson cluster_private_dns_hostname_to_yojson x.private_dns_hostname );
      ("Placement", option_to_yojson cluster_instance_placement_to_yojson x.placement);
      ("CurrentImageId", option_to_yojson image_id_to_yojson x.current_image_id);
      ("DesiredImageId", option_to_yojson image_id_to_yojson x.desired_image_id);
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ( "DesiredImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.desired_image_release_version );
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ("UltraServerInfo", option_to_yojson ultra_server_info_to_yojson x.ultra_server_info);
      ( "KubernetesConfig",
        option_to_yojson cluster_kubernetes_config_node_details_to_yojson x.kubernetes_config );
      ("CapacityType", option_to_yojson cluster_capacity_type_to_yojson x.capacity_type);
      ( "NetworkInterface",
        option_to_yojson cluster_network_interface_details_to_yojson x.network_interface );
    ]

let cluster_node_provisioning_mode_to_yojson (x : cluster_node_provisioning_mode) =
  match x with CONTINUOUS -> `String "Continuous"

let cluster_node_recovery_to_yojson (x : cluster_node_recovery) =
  match x with AUTOMATIC -> `String "Automatic" | NONE -> `String "None"

let cluster_node_summary_to_yojson (x : cluster_node_summary) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("InstanceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id));
      ( "NodeLogicalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.node_logical_id
      );
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
      ("LaunchTime", Some (timestamp_to_yojson x.launch_time));
      ("LastSoftwareUpdateTime", option_to_yojson timestamp_to_yojson x.last_software_update_time);
      ("InstanceStatus", Some (cluster_instance_status_details_to_yojson x.instance_status));
      ("UltraServerInfo", option_to_yojson ultra_server_info_to_yojson x.ultra_server_info);
      ( "PrivateDnsHostname",
        option_to_yojson cluster_private_dns_hostname_to_yojson x.private_dns_hostname );
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
    ]

let cluster_node_summaries_to_yojson tree = list_to_yojson cluster_node_summary_to_yojson tree

let cluster_slurm_config_strategy_to_yojson (x : cluster_slurm_config_strategy) =
  match x with
  | OVERWRITE -> `String "Overwrite"
  | MANAGED -> `String "Managed"
  | MERGE -> `String "Merge"

let cluster_orchestrator_slurm_config_to_yojson (x : cluster_orchestrator_slurm_config) =
  assoc_to_yojson
    [
      ( "SlurmConfigStrategy",
        option_to_yojson cluster_slurm_config_strategy_to_yojson x.slurm_config_strategy );
    ]

let eks_cluster_arn_to_yojson = string_to_yojson

let cluster_orchestrator_eks_config_to_yojson (x : cluster_orchestrator_eks_config) =
  assoc_to_yojson [ ("ClusterArn", Some (eks_cluster_arn_to_yojson x.cluster_arn)) ]

let cluster_orchestrator_to_yojson (x : cluster_orchestrator) =
  assoc_to_yojson
    [
      ("Eks", option_to_yojson cluster_orchestrator_eks_config_to_yojson x.eks);
      ("Slurm", option_to_yojson cluster_orchestrator_slurm_config_to_yojson x.slurm);
    ]

let f_sx_lustre_per_unit_storage_throughput_to_yojson = int_to_yojson
let f_sx_lustre_size_in_gi_b_to_yojson = int_to_yojson

let f_sx_lustre_config_to_yojson (x : f_sx_lustre_config) =
  assoc_to_yojson
    [
      ("SizeInGiB", Some (f_sx_lustre_size_in_gi_b_to_yojson x.size_in_gi_b));
      ( "PerUnitStorageThroughput",
        Some (f_sx_lustre_per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput) );
    ]

let environment_config_details_to_yojson (x : environment_config_details) =
  assoc_to_yojson
    [
      ("FSxLustreConfig", option_to_yojson f_sx_lustre_config_to_yojson x.f_sx_lustre_config);
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
    ]

let cluster_restricted_instance_group_details_to_yojson
    (x : cluster_restricted_instance_group_details) =
  assoc_to_yojson
    [
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
      ("TargetCount", option_to_yojson cluster_instance_count_to_yojson x.target_count);
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ( "TrainingPlanStatus",
        option_to_yojson instance_group_training_plan_status_to_yojson x.training_plan_status );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ( "EnvironmentConfig",
        option_to_yojson environment_config_details_to_yojson x.environment_config );
    ]

let cluster_restricted_instance_group_details_list_to_yojson tree =
  list_to_yojson cluster_restricted_instance_group_details_to_yojson tree

let environment_config_to_yojson (x : environment_config) =
  assoc_to_yojson
    [ ("FSxLustreConfig", option_to_yojson f_sx_lustre_config_to_yojson x.f_sx_lustre_config) ]

let cluster_restricted_instance_group_specification_to_yojson
    (x : cluster_restricted_instance_group_specification) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (cluster_instance_count_to_yojson x.instance_count));
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
      ("ExecutionRole", Some (role_arn_to_yojson x.execution_role));
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("EnvironmentConfig", option_to_yojson environment_config_to_yojson x.environment_config);
    ]

let cluster_restricted_instance_group_specifications_to_yojson tree =
  list_to_yojson cluster_restricted_instance_group_specification_to_yojson tree

let cluster_shared_environment_config_to_yojson (x : cluster_shared_environment_config) =
  assoc_to_yojson
    [
      ( "FSxLustreDeletionPolicy",
        Some (cluster_f_sx_lustre_deletion_policy_to_yojson x.f_sx_lustre_deletion_policy) );
      ("FSxLustreConfig", Some (f_sx_lustre_config_to_yojson x.f_sx_lustre_config));
    ]

let cluster_restricted_instance_groups_config_to_yojson
    (x : cluster_restricted_instance_groups_config) =
  assoc_to_yojson
    [
      ( "SharedEnvironmentConfig",
        Some (cluster_shared_environment_config_to_yojson x.shared_environment_config) );
    ]

let cluster_shared_environment_config_details_to_yojson
    (x : cluster_shared_environment_config_details) =
  assoc_to_yojson
    [
      ( "CurrentFSxLustreConfig",
        option_to_yojson f_sx_lustre_config_to_yojson x.current_f_sx_lustre_config );
      ( "DesiredFSxLustreConfig",
        option_to_yojson f_sx_lustre_config_to_yojson x.desired_f_sx_lustre_config );
      ( "CurrentFSxLustreDeletionPolicy",
        option_to_yojson cluster_f_sx_lustre_deletion_policy_to_yojson
          x.current_f_sx_lustre_deletion_policy );
      ( "DesiredFSxLustreDeletionPolicy",
        option_to_yojson cluster_f_sx_lustre_deletion_policy_to_yojson
          x.desired_f_sx_lustre_deletion_policy );
    ]

let cluster_restricted_instance_groups_config_output_to_yojson
    (x : cluster_restricted_instance_groups_config_output) =
  assoc_to_yojson
    [
      ( "SharedEnvironmentConfig",
        Some (cluster_shared_environment_config_details_to_yojson x.shared_environment_config) );
    ]

let cluster_scheduler_config_arn_to_yojson = string_to_yojson
let cluster_scheduler_config_id_to_yojson = string_to_yojson

let scheduler_resource_status_to_yojson (x : scheduler_resource_status) =
  match x with
  | CREATING -> `String "Creating"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATE_ROLLBACK_FAILED -> `String "CreateRollbackFailed"
  | CREATED -> `String "Created"
  | UPDATING -> `String "Updating"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATE_ROLLBACK_FAILED -> `String "UpdateRollbackFailed"
  | UPDATED -> `String "Updated"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETE_ROLLBACK_FAILED -> `String "DeleteRollbackFailed"
  | DELETED -> `String "Deleted"

let cluster_scheduler_config_summary_to_yojson (x : cluster_scheduler_config_summary) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ( "ClusterSchedulerConfigVersion",
        option_to_yojson integer_to_yojson x.cluster_scheduler_config_version );
      ("Name", Some (entity_name_to_yojson x.name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
    ]

let cluster_scheduler_config_summary_list_to_yojson tree =
  list_to_yojson cluster_scheduler_config_summary_to_yojson tree

let cluster_scheduler_priority_class_name_to_yojson = string_to_yojson

let cluster_sort_by_to_yojson (x : cluster_sort_by) =
  match x with CREATION_TIME -> `String "CREATION_TIME" | NAME -> `String "NAME"

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | CREATING -> `String "Creating"
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | INSERVICE -> `String "InService"
  | ROLLINGBACK -> `String "RollingBack"
  | SYSTEMUPDATING -> `String "SystemUpdating"
  | UPDATING -> `String "Updating"

let training_plan_arns_to_yojson tree = list_to_yojson training_plan_arn_to_yojson tree

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ClusterStatus", Some (cluster_status_to_yojson x.cluster_status));
      ("TrainingPlanArns", option_to_yojson training_plan_arns_to_yojson x.training_plan_arns);
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
    ]

let cluster_summaries_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree

let cluster_tiered_storage_config_to_yojson (x : cluster_tiered_storage_config) =
  assoc_to_yojson
    [
      ("Mode", Some (cluster_config_mode_to_yojson x.mode));
      ( "InstanceMemoryAllocationPercentage",
        option_to_yojson cluster_instance_memory_allocation_percentage_to_yojson
          x.instance_memory_allocation_percentage );
    ]

let lifecycle_config_arns_to_yojson tree = list_to_yojson studio_lifecycle_config_arn_to_yojson tree
let image_version_number_to_yojson = int_to_yojson
let image_name_to_yojson = string_to_yojson

let custom_image_to_yojson (x : custom_image) =
  assoc_to_yojson
    [
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("ImageVersionNumber", option_to_yojson image_version_number_to_yojson x.image_version_number);
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
    ]

let custom_images_to_yojson tree = list_to_yojson custom_image_to_yojson tree

let code_editor_app_settings_to_yojson (x : code_editor_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ( "AppLifecycleManagement",
        option_to_yojson app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
    ]

let repository_url_to_yojson = string_to_yojson

let code_repository_to_yojson (x : code_repository) =
  assoc_to_yojson [ ("RepositoryUrl", Some (repository_url_to_yojson x.repository_url)) ]

let code_repositories_to_yojson tree = list_to_yojson code_repository_to_yojson tree
let code_repository_arn_to_yojson = string_to_yojson
let code_repository_contains_to_yojson = string_to_yojson
let code_repository_name_contains_to_yojson = string_to_yojson

let code_repository_sort_by_to_yojson (x : code_repository_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"

let code_repository_sort_order_to_yojson (x : code_repository_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let git_config_url_to_yojson = string_to_yojson

let git_config_to_yojson (x : git_config) =
  assoc_to_yojson
    [
      ("RepositoryUrl", Some (git_config_url_to_yojson x.repository_url));
      ("Branch", option_to_yojson branch_to_yojson x.branch);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
    ]

let last_modified_time_to_yojson = timestamp_epoch_seconds_to_yojson

let code_repository_summary_to_yojson (x : code_repository_summary) =
  assoc_to_yojson
    [
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
      ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("GitConfig", option_to_yojson git_config_to_yojson x.git_config);
    ]

let code_repository_summary_list_to_yojson tree =
  list_to_yojson code_repository_summary_to_yojson tree

let cognito_user_pool_to_yojson = string_to_yojson

let cognito_config_to_yojson (x : cognito_config) =
  assoc_to_yojson
    [
      ("UserPool", Some (cognito_user_pool_to_yojson x.user_pool));
      ("ClientId", Some (client_id_to_yojson x.client_id));
    ]

let cognito_user_group_to_yojson = string_to_yojson

let cognito_member_definition_to_yojson (x : cognito_member_definition) =
  assoc_to_yojson
    [
      ("UserPool", Some (cognito_user_pool_to_yojson x.user_pool));
      ("UserGroup", Some (cognito_user_group_to_yojson x.user_group));
      ("ClientId", Some (client_id_to_yojson x.client_id));
    ]

let dimension_to_yojson = int_to_yojson

let vector_config_to_yojson (x : vector_config) =
  assoc_to_yojson [ ("Dimension", Some (dimension_to_yojson x.dimension)) ]

let collection_config_to_yojson (x : collection_config) =
  match x with
  | VectorConfig arg -> assoc_to_yojson [ ("VectorConfig", Some (vector_config_to_yojson arg)) ]

let config_value_to_yojson = string_to_yojson
let config_key_to_yojson = string_to_yojson

let collection_parameters_to_yojson tree =
  map_to_yojson config_key_to_yojson config_value_to_yojson tree

let collection_name_to_yojson = string_to_yojson

let collection_configuration_to_yojson (x : collection_configuration) =
  assoc_to_yojson
    [
      ("CollectionName", option_to_yojson collection_name_to_yojson x.collection_name);
      ( "CollectionParameters",
        option_to_yojson collection_parameters_to_yojson x.collection_parameters );
    ]

let collection_configurations_to_yojson tree =
  list_to_yojson collection_configuration_to_yojson tree

let collection_type_to_yojson (x : collection_type) =
  match x with LIST -> `String "List" | SET -> `String "Set" | VECTOR -> `String "Vector"

let compilation_job_arn_to_yojson = string_to_yojson

let compilation_job_status_to_yojson (x : compilation_job_status) =
  match x with
  | INPROGRESS -> `String "INPROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STARTING -> `String "STARTING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let target_platform_accelerator_to_yojson (x : target_platform_accelerator) =
  match x with
  | INTEL_GRAPHICS -> `String "INTEL_GRAPHICS"
  | MALI -> `String "MALI"
  | NVIDIA -> `String "NVIDIA"
  | NNA -> `String "NNA"

let target_platform_arch_to_yojson (x : target_platform_arch) =
  match x with
  | X86_64 -> `String "X86_64"
  | X86 -> `String "X86"
  | ARM64 -> `String "ARM64"
  | ARM_EABI -> `String "ARM_EABI"
  | ARM_EABIHF -> `String "ARM_EABIHF"

let target_platform_os_to_yojson (x : target_platform_os) =
  match x with ANDROID -> `String "ANDROID" | LINUX -> `String "LINUX"

let target_device_to_yojson (x : target_device) =
  match x with
  | LAMBDA -> `String "lambda"
  | ML_M4 -> `String "ml_m4"
  | ML_M5 -> `String "ml_m5"
  | ML_M6G -> `String "ml_m6g"
  | ML_C4 -> `String "ml_c4"
  | ML_C5 -> `String "ml_c5"
  | ML_C6G -> `String "ml_c6g"
  | ML_P2 -> `String "ml_p2"
  | ML_P3 -> `String "ml_p3"
  | ML_G4DN -> `String "ml_g4dn"
  | ML_INF1 -> `String "ml_inf1"
  | ML_INF2 -> `String "ml_inf2"
  | ML_TRN1 -> `String "ml_trn1"
  | ML_EIA2 -> `String "ml_eia2"
  | JETSON_TX1 -> `String "jetson_tx1"
  | JETSON_TX2 -> `String "jetson_tx2"
  | JETSON_NANO -> `String "jetson_nano"
  | JETSON_XAVIER -> `String "jetson_xavier"
  | RASP3B -> `String "rasp3b"
  | RASP4B -> `String "rasp4b"
  | IMX8QM -> `String "imx8qm"
  | DEEPLENS -> `String "deeplens"
  | RK3399 -> `String "rk3399"
  | RK3288 -> `String "rk3288"
  | AISAGE -> `String "aisage"
  | SBE_C -> `String "sbe_c"
  | QCS605 -> `String "qcs605"
  | QCS603 -> `String "qcs603"
  | SITARA_AM57X -> `String "sitara_am57x"
  | AMBA_CV2 -> `String "amba_cv2"
  | AMBA_CV22 -> `String "amba_cv22"
  | AMBA_CV25 -> `String "amba_cv25"
  | X86_WIN32 -> `String "x86_win32"
  | X86_WIN64 -> `String "x86_win64"
  | COREML -> `String "coreml"
  | JACINTO_TDA4VM -> `String "jacinto_tda4vm"
  | IMX8MPLUS -> `String "imx8mplus"

let compilation_job_summary_to_yojson (x : compilation_job_summary) =
  assoc_to_yojson
    [
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
      ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CompilationStartTime", option_to_yojson timestamp_to_yojson x.compilation_start_time);
      ("CompilationEndTime", option_to_yojson timestamp_to_yojson x.compilation_end_time);
      ( "CompilationTargetDevice",
        option_to_yojson target_device_to_yojson x.compilation_target_device );
      ( "CompilationTargetPlatformOs",
        option_to_yojson target_platform_os_to_yojson x.compilation_target_platform_os );
      ( "CompilationTargetPlatformArch",
        option_to_yojson target_platform_arch_to_yojson x.compilation_target_platform_arch );
      ( "CompilationTargetPlatformAccelerator",
        option_to_yojson target_platform_accelerator_to_yojson
          x.compilation_target_platform_accelerator );
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CompilationJobStatus", Some (compilation_job_status_to_yojson x.compilation_job_status));
    ]

let compilation_job_summaries_to_yojson tree = list_to_yojson compilation_job_summary_to_yojson tree
let compiler_options_to_yojson = string_to_yojson

let complete_on_convergence_to_yojson (x : complete_on_convergence) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let compute_quota_arn_to_yojson = string_to_yojson

let preempt_team_tasks_to_yojson (x : preempt_team_tasks) =
  match x with NEVER -> `String "Never" | LOWERPRIORITY -> `String "LowerPriority"

let resource_sharing_strategy_to_yojson (x : resource_sharing_strategy) =
  match x with
  | LEND -> `String "Lend"
  | DONTLEND -> `String "DontLend"
  | LENDANDBORROW -> `String "LendAndBorrow"

let resource_sharing_config_to_yojson (x : resource_sharing_config) =
  assoc_to_yojson
    [
      ("Strategy", Some (resource_sharing_strategy_to_yojson x.strategy));
      ("BorrowLimit", option_to_yojson borrow_limit_to_yojson x.borrow_limit);
      ( "AbsoluteBorrowLimits",
        option_to_yojson absolute_borrow_limit_resource_list_to_yojson x.absolute_borrow_limits );
    ]

let compute_quota_resource_config_list_to_yojson tree =
  list_to_yojson compute_quota_resource_config_to_yojson tree

let compute_quota_config_to_yojson (x : compute_quota_config) =
  assoc_to_yojson
    [
      ( "ComputeQuotaResources",
        option_to_yojson compute_quota_resource_config_list_to_yojson x.compute_quota_resources );
      ( "ResourceSharingConfig",
        option_to_yojson resource_sharing_config_to_yojson x.resource_sharing_config );
      ("PreemptTeamTasks", option_to_yojson preempt_team_tasks_to_yojson x.preempt_team_tasks);
    ]

let compute_quota_id_to_yojson = string_to_yojson
let fair_share_weight_to_yojson = int_to_yojson
let compute_quota_target_team_name_to_yojson = string_to_yojson

let compute_quota_target_to_yojson (x : compute_quota_target) =
  assoc_to_yojson
    [
      ("TeamName", Some (compute_quota_target_team_name_to_yojson x.team_name));
      ("FairShareWeight", option_to_yojson fair_share_weight_to_yojson x.fair_share_weight);
    ]

let compute_quota_summary_to_yojson (x : compute_quota_summary) =
  assoc_to_yojson
    [
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("Name", Some (entity_name_to_yojson x.name));
      ("ComputeQuotaVersion", option_to_yojson integer_to_yojson x.compute_quota_version);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let compute_quota_summary_list_to_yojson tree = list_to_yojson compute_quota_summary_to_yojson tree

let condition_outcome_to_yojson (x : condition_outcome) =
  match x with TRUE -> `String "True" | FALSE -> `String "False"

let condition_step_metadata_to_yojson (x : condition_step_metadata) =
  assoc_to_yojson [ ("Outcome", option_to_yojson condition_outcome_to_yojson x.outcome) ]

let configured_spare_instance_count_to_yojson = int_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let metric_publish_frequency_in_seconds_to_yojson (x : metric_publish_frequency_in_seconds) =
  match x with
  | FREQ_10_S -> `Int 10
  | FREQ_30_S -> `Int 30
  | FREQ_60_S -> `Int 60
  | FREQ_120_S -> `Int 120
  | FREQ_180_S -> `Int 180
  | FREQ_240_S -> `Int 240
  | FREQ_300_S -> `Int 300

let metrics_endpoint_path_to_yojson = string_to_yojson

let metrics_endpoint_to_yojson (x : metrics_endpoint) =
  assoc_to_yojson
    [
      ("MetricsEndpointPath", Some (metrics_endpoint_path_to_yojson x.metrics_endpoint_path));
      ( "MetricPublishFrequencyInSeconds",
        option_to_yojson metric_publish_frequency_in_seconds_to_yojson
          x.metric_publish_frequency_in_seconds );
    ]

let metrics_endpoint_list_to_yojson tree = list_to_yojson metrics_endpoint_to_yojson tree

let container_metrics_config_to_yojson (x : container_metrics_config) =
  assoc_to_yojson
    [ ("MetricsEndpoints", option_to_yojson metrics_endpoint_list_to_yojson x.metrics_endpoints) ]

let model_cache_setting_to_yojson (x : model_cache_setting) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let multi_model_config_to_yojson (x : multi_model_config) =
  assoc_to_yojson
    [ ("ModelCacheSetting", option_to_yojson model_cache_setting_to_yojson x.model_cache_setting) ]

let inference_specification_name_to_yojson = string_to_yojson
let versioned_arn_or_name_to_yojson = string_to_yojson

let container_mode_to_yojson (x : container_mode) =
  match x with SINGLE_MODEL -> `String "SingleModel" | MULTI_MODEL -> `String "MultiModel"

let repository_credentials_provider_arn_to_yojson = string_to_yojson

let repository_auth_config_to_yojson (x : repository_auth_config) =
  assoc_to_yojson
    [
      ( "RepositoryCredentialsProviderArn",
        Some (repository_credentials_provider_arn_to_yojson x.repository_credentials_provider_arn)
      );
    ]

let repository_access_mode_to_yojson (x : repository_access_mode) =
  match x with PLATFORM -> `String "Platform" | VPC -> `String "Vpc"

let image_config_to_yojson (x : image_config) =
  assoc_to_yojson
    [
      ("RepositoryAccessMode", Some (repository_access_mode_to_yojson x.repository_access_mode));
      ( "RepositoryAuthConfig",
        option_to_yojson repository_auth_config_to_yojson x.repository_auth_config );
    ]

let container_definition_to_yojson (x : container_definition) =
  assoc_to_yojson
    [
      ("ContainerHostname", option_to_yojson container_hostname_to_yojson x.container_hostname);
      ("Image", option_to_yojson container_image_to_yojson x.image);
      ("ImageConfig", option_to_yojson image_config_to_yojson x.image_config);
      ("Mode", option_to_yojson container_mode_to_yojson x.mode);
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ( "AdditionalModelDataSources",
        option_to_yojson additional_model_data_sources_to_yojson x.additional_model_data_sources );
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ModelPackageName", option_to_yojson versioned_arn_or_name_to_yojson x.model_package_name);
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
      ("MultiModelConfig", option_to_yojson multi_model_config_to_yojson x.multi_model_config);
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
    ]

let container_definition_list_to_yojson tree = list_to_yojson container_definition_to_yojson tree

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree
let context_arn_to_yojson = string_to_yojson
let context_name_to_yojson = string_to_yojson
let context_name_or_arn_to_yojson = string_to_yojson

let context_source_to_yojson (x : context_source) =
  assoc_to_yojson
    [
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("SourceId", option_to_yojson string256_to_yojson x.source_id);
    ]

let context_summary_to_yojson (x : context_summary) =
  assoc_to_yojson
    [
      ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn);
      ("ContextName", option_to_yojson context_name_to_yojson x.context_name);
      ("Source", option_to_yojson context_source_to_yojson x.source);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let context_summaries_to_yojson tree = list_to_yojson context_summary_to_yojson tree

let hyper_parameter_scaling_type_to_yojson (x : hyper_parameter_scaling_type) =
  match x with
  | AUTO -> `String "Auto"
  | LINEAR -> `String "Linear"
  | LOGARITHMIC -> `String "Logarithmic"
  | REVERSE_LOGARITHMIC -> `String "ReverseLogarithmic"

let continuous_parameter_range_to_yojson (x : continuous_parameter_range) =
  assoc_to_yojson
    [
      ("Name", Some (parameter_key_to_yojson x.name));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("ScalingType", option_to_yojson hyper_parameter_scaling_type_to_yojson x.scaling_type);
    ]

let continuous_parameter_range_specification_to_yojson
    (x : continuous_parameter_range_specification) =
  assoc_to_yojson
    [
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
    ]

let continuous_parameter_ranges_to_yojson tree =
  list_to_yojson continuous_parameter_range_to_yojson tree

let convergence_detected_to_yojson (x : convergence_detected) =
  assoc_to_yojson
    [
      ( "CompleteOnConvergence",
        option_to_yojson complete_on_convergence_to_yojson x.complete_on_convergence );
    ]

let resource_in_use_to_yojson (x : resource_in_use) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let create_ai_benchmark_job_response_to_yojson (x : create_ai_benchmark_job_response) =
  assoc_to_yojson
    [ ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn)) ]

let create_ai_benchmark_job_request_to_yojson (x : create_ai_benchmark_job_request) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
      ("BenchmarkTarget", Some (ai_benchmark_target_to_yojson x.benchmark_target));
      ("OutputConfig", Some (ai_benchmark_output_config_to_yojson x.output_config));
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson ai_benchmark_network_config_to_yojson x.network_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ai_recommendation_job_response_to_yojson (x : create_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
    ]

let create_ai_recommendation_job_request_to_yojson (x : create_ai_recommendation_job_request) =
  assoc_to_yojson
    [
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
      ("ModelSource", Some (ai_model_source_to_yojson x.model_source));
      ("OutputConfig", Some (ai_recommendation_output_config_to_yojson x.output_config));
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ( "PerformanceTarget",
        Some (ai_recommendation_performance_target_to_yojson x.performance_target) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "InferenceSpecification",
        option_to_yojson ai_recommendation_inference_specification_to_yojson
          x.inference_specification );
      ( "OptimizeModel",
        option_to_yojson ai_recommendation_allow_optimization_to_yojson x.optimize_model );
      ("ComputeSpec", option_to_yojson ai_recommendation_compute_spec_to_yojson x.compute_spec);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ai_workload_config_response_to_yojson (x : create_ai_workload_config_response) =
  assoc_to_yojson
    [ ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn)) ]

let create_ai_workload_config_request_to_yojson (x : create_ai_workload_config_request) =
  assoc_to_yojson
    [
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
      ("DatasetConfig", option_to_yojson ai_dataset_config_to_yojson x.dataset_config);
      ("AIWorkloadConfigs", option_to_yojson ai_workload_configs_to_yojson x.ai_workload_configs);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_action_response_to_yojson (x : create_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let metadata_property_value_to_yojson = string_to_yojson

let metadata_properties_to_yojson (x : metadata_properties) =
  assoc_to_yojson
    [
      ("CommitId", option_to_yojson metadata_property_value_to_yojson x.commit_id);
      ("Repository", option_to_yojson metadata_property_value_to_yojson x.repository);
      ("GeneratedBy", option_to_yojson metadata_property_value_to_yojson x.generated_by);
      ("ProjectId", option_to_yojson metadata_property_value_to_yojson x.project_id);
    ]

let lineage_entity_parameters_to_yojson tree =
  map_to_yojson string_parameter_value_to_yojson string_parameter_value_to_yojson tree

let experiment_description_to_yojson = string_to_yojson

let create_action_request_to_yojson (x : create_action_request) =
  assoc_to_yojson
    [
      ("ActionName", Some (experiment_entity_name_to_yojson x.action_name));
      ("Source", Some (action_source_to_yojson x.source));
      ("ActionType", Some (string256_to_yojson x.action_type));
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_algorithm_output_to_yojson (x : create_algorithm_output) =
  assoc_to_yojson [ ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn)) ]

let hyper_parameter_tuning_job_objective_type_to_yojson
    (x : hyper_parameter_tuning_job_objective_type) =
  match x with MAXIMIZE -> `String "Maximize" | MINIMIZE -> `String "Minimize"

let hyper_parameter_tuning_job_objective_to_yojson (x : hyper_parameter_tuning_job_objective) =
  assoc_to_yojson
    [
      ("Type", Some (hyper_parameter_tuning_job_objective_type_to_yojson x.type_));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
    ]

let hyper_parameter_tuning_job_objectives_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_job_objective_to_yojson tree

let training_instance_types_to_yojson tree = list_to_yojson training_instance_type_to_yojson tree

let integer_parameter_range_specification_to_yojson (x : integer_parameter_range_specification) =
  assoc_to_yojson
    [
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
    ]

let parameter_range_to_yojson (x : parameter_range) =
  assoc_to_yojson
    [
      ( "IntegerParameterRangeSpecification",
        option_to_yojson integer_parameter_range_specification_to_yojson
          x.integer_parameter_range_specification );
      ( "ContinuousParameterRangeSpecification",
        option_to_yojson continuous_parameter_range_specification_to_yojson
          x.continuous_parameter_range_specification );
      ( "CategoricalParameterRangeSpecification",
        option_to_yojson categorical_parameter_range_specification_to_yojson
          x.categorical_parameter_range_specification );
    ]

let parameter_type_to_yojson (x : parameter_type) =
  match x with
  | INTEGER -> `String "Integer"
  | CONTINUOUS -> `String "Continuous"
  | CATEGORICAL -> `String "Categorical"
  | FREE_TEXT -> `String "FreeText"

let parameter_name_to_yojson = string_to_yojson

let hyper_parameter_specification_to_yojson (x : hyper_parameter_specification) =
  assoc_to_yojson
    [
      ("Name", Some (parameter_name_to_yojson x.name));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Type", Some (parameter_type_to_yojson x.type_));
      ("Range", option_to_yojson parameter_range_to_yojson x.range);
      ("IsTunable", option_to_yojson boolean__to_yojson x.is_tunable);
      ("IsRequired", option_to_yojson boolean__to_yojson x.is_required);
      ("DefaultValue", option_to_yojson hyper_parameter_value_to_yojson x.default_value);
    ]

let hyper_parameter_specifications_to_yojson tree =
  list_to_yojson hyper_parameter_specification_to_yojson tree

let training_specification_to_yojson (x : training_specification) =
  assoc_to_yojson
    [
      ("TrainingImage", Some (container_image_to_yojson x.training_image));
      ("TrainingImageDigest", option_to_yojson image_digest_to_yojson x.training_image_digest);
      ( "SupportedHyperParameters",
        option_to_yojson hyper_parameter_specifications_to_yojson x.supported_hyper_parameters );
      ( "SupportedTrainingInstanceTypes",
        Some (training_instance_types_to_yojson x.supported_training_instance_types) );
      ( "SupportsDistributedTraining",
        option_to_yojson boolean__to_yojson x.supports_distributed_training );
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
      ("TrainingChannels", Some (channel_specifications_to_yojson x.training_channels));
      ( "SupportedTuningJobObjectiveMetrics",
        option_to_yojson hyper_parameter_tuning_job_objectives_to_yojson
          x.supported_tuning_job_objective_metrics );
      ( "AdditionalS3DataSource",
        option_to_yojson additional_s3_data_source_to_yojson x.additional_s3_data_source );
    ]

let create_algorithm_input_to_yojson (x : create_algorithm_input) =
  assoc_to_yojson
    [
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("TrainingSpecification", Some (training_specification_to_yojson x.training_specification));
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "ValidationSpecification",
        option_to_yojson algorithm_validation_specification_to_yojson x.validation_specification );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_app_response_to_yojson (x : create_app_response) =
  assoc_to_yojson [ ("AppArn", option_to_yojson app_arn_to_yojson x.app_arn) ]

let create_app_request_to_yojson (x : create_app_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("AppName", Some (app_name_to_yojson x.app_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
      ("RecoveryMode", option_to_yojson boolean__to_yojson x.recovery_mode);
    ]

let create_app_image_config_response_to_yojson (x : create_app_image_config_response) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let create_app_image_config_request_to_yojson (x : create_app_image_config_request) =
  assoc_to_yojson
    [
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
    ]

let create_artifact_response_to_yojson (x : create_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let create_artifact_request_to_yojson (x : create_artifact_request) =
  assoc_to_yojson
    [
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
      ("Source", Some (artifact_source_to_yojson x.source));
      ("ArtifactType", Some (string256_to_yojson x.artifact_type));
      ("Properties", option_to_yojson artifact_properties_to_yojson x.properties);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_auto_ml_job_response_to_yojson (x : create_auto_ml_job_response) =
  assoc_to_yojson [ ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn)) ]

let endpoint_name_to_yojson = string_to_yojson

let model_deploy_config_to_yojson (x : model_deploy_config) =
  assoc_to_yojson
    [
      ( "AutoGenerateEndpointName",
        option_to_yojson auto_generate_endpoint_name_to_yojson x.auto_generate_endpoint_name );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let create_auto_ml_job_request_to_yojson (x : create_auto_ml_job_request) =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ("InputDataConfig", Some (auto_ml_input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("AutoMLJobConfig", option_to_yojson auto_ml_job_config_to_yojson x.auto_ml_job_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
    ]

let create_auto_ml_job_v2_response_to_yojson (x : create_auto_ml_job_v2_response) =
  assoc_to_yojson [ ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn)) ]

let create_auto_ml_job_v2_request_to_yojson (x : create_auto_ml_job_v2_request) =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ( "AutoMLJobInputDataConfig",
        Some (auto_ml_job_input_data_config_to_yojson x.auto_ml_job_input_data_config) );
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ( "AutoMLProblemTypeConfig",
        Some (auto_ml_problem_type_config_to_yojson x.auto_ml_problem_type_config) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ( "AutoMLComputeConfig",
        option_to_yojson auto_ml_compute_config_to_yojson x.auto_ml_compute_config );
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ( "InstanceGroups",
        option_to_yojson cluster_instance_group_specifications_to_yojson x.instance_groups );
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_specifications_to_yojson
          x.restricted_instance_groups );
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_to_yojson
          x.restricted_instance_groups_config );
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_to_yojson x.auto_scaling);
    ]

let create_cluster_scheduler_config_response_to_yojson
    (x : create_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
    ]

let idle_resource_sharing_to_yojson (x : idle_resource_sharing) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let fair_share_to_yojson (x : fair_share) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let priority_weight_to_yojson = int_to_yojson

let priority_class_to_yojson (x : priority_class) =
  assoc_to_yojson
    [
      ("Name", Some (cluster_scheduler_priority_class_name_to_yojson x.name));
      ("Weight", Some (priority_weight_to_yojson x.weight));
    ]

let priority_class_list_to_yojson tree = list_to_yojson priority_class_to_yojson tree

let scheduler_config_to_yojson (x : scheduler_config) =
  assoc_to_yojson
    [
      ("PriorityClasses", option_to_yojson priority_class_list_to_yojson x.priority_classes);
      ("FairShare", option_to_yojson fair_share_to_yojson x.fair_share);
      ( "IdleResourceSharing",
        option_to_yojson idle_resource_sharing_to_yojson x.idle_resource_sharing );
    ]

let create_cluster_scheduler_config_request_to_yojson (x : create_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("SchedulerConfig", Some (scheduler_config_to_yojson x.scheduler_config));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_code_repository_output_to_yojson (x : create_code_repository_output) =
  assoc_to_yojson
    [ ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn)) ]

let create_code_repository_input_to_yojson (x : create_code_repository_input) =
  assoc_to_yojson
    [
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
      ("GitConfig", Some (git_config_to_yojson x.git_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_compilation_job_response_to_yojson (x : create_compilation_job_response) =
  assoc_to_yojson
    [ ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn)) ]

let neo_vpc_subnet_id_to_yojson = string_to_yojson
let neo_vpc_subnets_to_yojson tree = list_to_yojson neo_vpc_subnet_id_to_yojson tree
let neo_vpc_security_group_id_to_yojson = string_to_yojson

let neo_vpc_security_group_ids_to_yojson tree =
  list_to_yojson neo_vpc_security_group_id_to_yojson tree

let neo_vpc_config_to_yojson (x : neo_vpc_config) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (neo_vpc_security_group_ids_to_yojson x.security_group_ids));
      ("Subnets", Some (neo_vpc_subnets_to_yojson x.subnets));
    ]

let target_platform_to_yojson (x : target_platform) =
  assoc_to_yojson
    [
      ("Os", Some (target_platform_os_to_yojson x.os));
      ("Arch", Some (target_platform_arch_to_yojson x.arch));
      ("Accelerator", option_to_yojson target_platform_accelerator_to_yojson x.accelerator);
    ]

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("TargetDevice", option_to_yojson target_device_to_yojson x.target_device);
      ("TargetPlatform", option_to_yojson target_platform_to_yojson x.target_platform);
      ("CompilerOptions", option_to_yojson compiler_options_to_yojson x.compiler_options);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let framework_version_to_yojson = string_to_yojson

let framework_to_yojson (x : framework) =
  match x with
  | TENSORFLOW -> `String "TENSORFLOW"
  | KERAS -> `String "KERAS"
  | MXNET -> `String "MXNET"
  | ONNX -> `String "ONNX"
  | PYTORCH -> `String "PYTORCH"
  | XGBOOST -> `String "XGBOOST"
  | TFLITE -> `String "TFLITE"
  | DARKNET -> `String "DARKNET"
  | SKLEARN -> `String "SKLEARN"

let input_config_to_yojson (x : input_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("DataInputConfig", option_to_yojson data_input_config_to_yojson x.data_input_config);
      ("Framework", Some (framework_to_yojson x.framework));
      ("FrameworkVersion", option_to_yojson framework_version_to_yojson x.framework_version);
    ]

let create_compilation_job_request_to_yojson (x : create_compilation_job_request) =
  assoc_to_yojson
    [
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("InputConfig", option_to_yojson input_config_to_yojson x.input_config);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("VpcConfig", option_to_yojson neo_vpc_config_to_yojson x.vpc_config);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_compute_quota_response_to_yojson (x : create_compute_quota_response) =
  assoc_to_yojson
    [
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
    ]

let create_compute_quota_request_to_yojson (x : create_compute_quota_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("ComputeQuotaConfig", Some (compute_quota_config_to_yojson x.compute_quota_config));
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_context_response_to_yojson (x : create_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let create_context_request_to_yojson (x : create_context_request) =
  assoc_to_yojson
    [
      ("ContextName", Some (context_name_to_yojson x.context_name));
      ("Source", Some (context_source_to_yojson x.source));
      ("ContextType", Some (string256_to_yojson x.context_type));
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let monitoring_job_definition_arn_to_yojson = string_to_yojson

let create_data_quality_job_definition_response_to_yojson
    (x : create_data_quality_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let monitoring_max_runtime_in_seconds_to_yojson = int_to_yojson

let monitoring_stopping_condition_to_yojson (x : monitoring_stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        Some (monitoring_max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds) );
    ]

let monitoring_network_config_to_yojson (x : monitoring_network_config) =
  assoc_to_yojson
    [
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let processing_volume_size_in_g_b_to_yojson = int_to_yojson

let processing_instance_type_to_yojson (x : processing_instance_type) =
  match x with
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_8XLARGE -> `String "ml.r5d.8xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"

let processing_instance_count_to_yojson = int_to_yojson

let monitoring_cluster_config_to_yojson (x : monitoring_cluster_config) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (processing_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (processing_instance_type_to_yojson x.instance_type));
      ("VolumeSizeInGB", Some (processing_volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
    ]

let monitoring_resources_to_yojson (x : monitoring_resources) =
  assoc_to_yojson [ ("ClusterConfig", Some (monitoring_cluster_config_to_yojson x.cluster_config)) ]

let processing_s3_upload_mode_to_yojson (x : processing_s3_upload_mode) =
  match x with CONTINUOUS -> `String "Continuous" | END_OF_JOB -> `String "EndOfJob"

let monitoring_s3_uri_to_yojson = string_to_yojson

let monitoring_s3_output_to_yojson (x : monitoring_s3_output) =
  assoc_to_yojson
    [
      ("S3Uri", Some (monitoring_s3_uri_to_yojson x.s3_uri));
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("S3UploadMode", option_to_yojson processing_s3_upload_mode_to_yojson x.s3_upload_mode);
    ]

let monitoring_output_to_yojson (x : monitoring_output) =
  assoc_to_yojson [ ("S3Output", Some (monitoring_s3_output_to_yojson x.s3_output)) ]

let monitoring_outputs_to_yojson tree = list_to_yojson monitoring_output_to_yojson tree

let monitoring_output_config_to_yojson (x : monitoring_output_config) =
  assoc_to_yojson
    [
      ("MonitoringOutputs", Some (monitoring_outputs_to_yojson x.monitoring_outputs));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let endpoint_input_to_yojson (x : endpoint_input) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ("FeaturesAttribute", option_to_yojson string__to_yojson x.features_attribute);
      ("InferenceAttribute", option_to_yojson string__to_yojson x.inference_attribute);
      ("ProbabilityAttribute", option_to_yojson string__to_yojson x.probability_attribute);
      ( "ProbabilityThresholdAttribute",
        option_to_yojson probability_threshold_attribute_to_yojson x.probability_threshold_attribute
      );
      ( "StartTimeOffset",
        option_to_yojson monitoring_time_offset_string_to_yojson x.start_time_offset );
      ("EndTimeOffset", option_to_yojson monitoring_time_offset_string_to_yojson x.end_time_offset);
      ( "ExcludeFeaturesAttribute",
        option_to_yojson exclude_features_attribute_to_yojson x.exclude_features_attribute );
    ]

let data_quality_job_input_to_yojson (x : data_quality_job_input) =
  assoc_to_yojson
    [
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
    ]

let processing_environment_value_to_yojson = string_to_yojson
let processing_environment_key_to_yojson = string_to_yojson

let monitoring_environment_map_to_yojson tree =
  map_to_yojson processing_environment_key_to_yojson processing_environment_value_to_yojson tree

let monitoring_container_arguments_to_yojson tree = list_to_yojson container_argument_to_yojson tree

let data_quality_app_specification_to_yojson (x : data_quality_app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
    ]

let monitoring_statistics_resource_to_yojson (x : monitoring_statistics_resource) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let monitoring_constraints_resource_to_yojson (x : monitoring_constraints_resource) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let processing_job_name_to_yojson = string_to_yojson

let data_quality_baseline_config_to_yojson (x : data_quality_baseline_config) =
  assoc_to_yojson
    [
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ( "StatisticsResource",
        option_to_yojson monitoring_statistics_resource_to_yojson x.statistics_resource );
    ]

let monitoring_job_definition_name_to_yojson = string_to_yojson

let create_data_quality_job_definition_request_to_yojson
    (x : create_data_quality_job_definition_request) =
  assoc_to_yojson
    [
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ( "DataQualityBaselineConfig",
        option_to_yojson data_quality_baseline_config_to_yojson x.data_quality_baseline_config );
      ( "DataQualityAppSpecification",
        Some (data_quality_app_specification_to_yojson x.data_quality_app_specification) );
      ("DataQualityJobInput", Some (data_quality_job_input_to_yojson x.data_quality_job_input));
      ( "DataQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.data_quality_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let enable_iot_role_alias_to_yojson = bool_to_yojson

let edge_preset_deployment_type_to_yojson (x : edge_preset_deployment_type) =
  match x with GreengrassV2Component -> `String "GreengrassV2Component"

let edge_output_config_to_yojson (x : edge_output_config) =
  assoc_to_yojson
    [
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "PresetDeploymentType",
        option_to_yojson edge_preset_deployment_type_to_yojson x.preset_deployment_type );
      ("PresetDeploymentConfig", option_to_yojson string__to_yojson x.preset_deployment_config);
    ]

let device_fleet_description_to_yojson = string_to_yojson

let create_device_fleet_request_to_yojson (x : create_device_fleet_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EnableIotRoleAlias",
        option_to_yojson enable_iot_role_alias_to_yojson x.enable_iot_role_alias );
    ]

let domain_arn_to_yojson = string_to_yojson

let create_domain_response_to_yojson (x : create_domain_response) =
  assoc_to_yojson
    [
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("Url", option_to_yojson string1024_to_yojson x.url);
    ]

let s3_schema_uri_to_yojson = string_to_yojson

let s3_file_system_config_to_yojson (x : s3_file_system_config) =
  assoc_to_yojson
    [
      ("MountPath", option_to_yojson string1024_to_yojson x.mount_path);
      ("S3Uri", Some (s3_schema_uri_to_yojson x.s3_uri));
    ]

let file_system_path_to_yojson = string_to_yojson

let f_sx_lustre_file_system_config_to_yojson (x : f_sx_lustre_file_system_config) =
  assoc_to_yojson
    [
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ("FileSystemPath", option_to_yojson file_system_path_to_yojson x.file_system_path);
    ]

let efs_file_system_config_to_yojson (x : efs_file_system_config) =
  assoc_to_yojson
    [
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ("FileSystemPath", option_to_yojson file_system_path_to_yojson x.file_system_path);
    ]

let custom_file_system_config_to_yojson (x : custom_file_system_config) =
  match x with
  | EFSFileSystemConfig arg ->
      assoc_to_yojson [ ("EFSFileSystemConfig", Some (efs_file_system_config_to_yojson arg)) ]
  | FSxLustreFileSystemConfig arg ->
      assoc_to_yojson
        [ ("FSxLustreFileSystemConfig", Some (f_sx_lustre_file_system_config_to_yojson arg)) ]
  | S3FileSystemConfig arg ->
      assoc_to_yojson [ ("S3FileSystemConfig", Some (s3_file_system_config_to_yojson arg)) ]

let custom_file_system_configs_to_yojson tree =
  list_to_yojson custom_file_system_config_to_yojson tree

let gid_to_yojson = long_to_yojson
let uid_to_yojson = long_to_yojson

let custom_posix_user_config_to_yojson (x : custom_posix_user_config) =
  assoc_to_yojson [ ("Uid", Some (uid_to_yojson x.uid)); ("Gid", Some (gid_to_yojson x.gid)) ]

let space_ebs_volume_size_in_gb_to_yojson = int_to_yojson

let default_ebs_storage_settings_to_yojson (x : default_ebs_storage_settings) =
  assoc_to_yojson
    [
      ( "DefaultEbsVolumeSizeInGb",
        Some (space_ebs_volume_size_in_gb_to_yojson x.default_ebs_volume_size_in_gb) );
      ( "MaximumEbsVolumeSizeInGb",
        Some (space_ebs_volume_size_in_gb_to_yojson x.maximum_ebs_volume_size_in_gb) );
    ]

let default_space_storage_settings_to_yojson (x : default_space_storage_settings) =
  assoc_to_yojson
    [
      ( "DefaultEbsStorageSettings",
        option_to_yojson default_ebs_storage_settings_to_yojson x.default_ebs_storage_settings );
    ]

let execution_role_arns_to_yojson tree = list_to_yojson role_arn_to_yojson tree

let emr_settings_to_yojson (x : emr_settings) =
  assoc_to_yojson
    [
      ("AssumableRoleArns", option_to_yojson assumable_role_arns_to_yojson x.assumable_role_arns);
      ("ExecutionRoleArns", option_to_yojson execution_role_arns_to_yojson x.execution_role_arns);
    ]

let jupyter_lab_app_settings_to_yojson (x : jupyter_lab_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
      ( "AppLifecycleManagement",
        option_to_yojson app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ("EmrSettings", option_to_yojson emr_settings_to_yojson x.emr_settings);
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
    ]

let kernel_gateway_app_settings_to_yojson (x : kernel_gateway_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
    ]

let jupyter_server_app_settings_to_yojson (x : jupyter_server_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
    ]

let default_space_settings_to_yojson (x : default_space_settings) =
  assoc_to_yojson
    [
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "JupyterLabAppSettings",
        option_to_yojson jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ( "SpaceStorageSettings",
        option_to_yojson default_space_storage_settings_to_yojson x.space_storage_settings );
      ( "CustomPosixUserConfig",
        option_to_yojson custom_posix_user_config_to_yojson x.custom_posix_user_config );
      ( "CustomFileSystemConfigs",
        option_to_yojson custom_file_system_configs_to_yojson x.custom_file_system_configs );
    ]

let tag_propagation_to_yojson (x : tag_propagation) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let home_efs_file_system_creation_to_yojson (x : home_efs_file_system_creation) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let vpc_id_to_yojson = string_to_yojson

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with IPV4 -> `String "ipv4" | DUALSTACK -> `String "dualstack"

let single_sign_on_application_arn_to_yojson = string_to_yojson
let unified_studio_environment_id_to_yojson = string_to_yojson
let unified_studio_project_id_to_yojson = string_to_yojson
let unified_studio_domain_id_to_yojson = string_to_yojson
let region_name_to_yojson = string_to_yojson

let unified_studio_settings_to_yojson (x : unified_studio_settings) =
  assoc_to_yojson
    [
      ("StudioWebPortalAccess", option_to_yojson feature_status_to_yojson x.studio_web_portal_access);
      ("DomainAccountId", option_to_yojson account_id_to_yojson x.domain_account_id);
      ("DomainRegion", option_to_yojson region_name_to_yojson x.domain_region);
      ("DomainId", option_to_yojson unified_studio_domain_id_to_yojson x.domain_id);
      ("ProjectId", option_to_yojson unified_studio_project_id_to_yojson x.project_id);
      ("EnvironmentId", option_to_yojson unified_studio_environment_id_to_yojson x.environment_id);
      ("ProjectS3Path", option_to_yojson s3_uri_to_yojson x.project_s3_path);
      ( "SingleSignOnApplicationArn",
        option_to_yojson single_sign_on_application_arn_to_yojson x.single_sign_on_application_arn
      );
    ]

let vpc_only_trusted_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree

let docker_settings_to_yojson (x : docker_settings) =
  assoc_to_yojson
    [
      ("EnableDockerAccess", option_to_yojson feature_status_to_yojson x.enable_docker_access);
      ( "VpcOnlyTrustedAccounts",
        option_to_yojson vpc_only_trusted_accounts_to_yojson x.vpc_only_trusted_accounts );
      ("RootlessDocker", option_to_yojson feature_status_to_yojson x.rootless_docker);
    ]

let trusted_identity_propagation_settings_to_yojson (x : trusted_identity_propagation_settings) =
  assoc_to_yojson [ ("Status", Some (feature_status_to_yojson x.status)) ]

let execution_role_identity_config_to_yojson (x : execution_role_identity_config) =
  match x with USER_PROFILE_NAME -> `String "USER_PROFILE_NAME" | DISABLED -> `String "DISABLED"

let r_studio_server_pro_domain_settings_to_yojson (x : r_studio_server_pro_domain_settings) =
  assoc_to_yojson
    [
      ("DomainExecutionRoleArn", Some (role_arn_to_yojson x.domain_execution_role_arn));
      ("RStudioConnectUrl", option_to_yojson string__to_yojson x.r_studio_connect_url);
      ("RStudioPackageManagerUrl", option_to_yojson string__to_yojson x.r_studio_package_manager_url);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let domain_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let domain_settings_to_yojson (x : domain_settings) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", option_to_yojson domain_security_group_ids_to_yojson x.security_group_ids);
      ( "RStudioServerProDomainSettings",
        option_to_yojson r_studio_server_pro_domain_settings_to_yojson
          x.r_studio_server_pro_domain_settings );
      ( "ExecutionRoleIdentityConfig",
        option_to_yojson execution_role_identity_config_to_yojson x.execution_role_identity_config
      );
      ( "TrustedIdentityPropagationSettings",
        option_to_yojson trusted_identity_propagation_settings_to_yojson
          x.trusted_identity_propagation_settings );
      ("DockerSettings", option_to_yojson docker_settings_to_yojson x.docker_settings);
      ("AmazonQSettings", option_to_yojson amazon_q_settings_to_yojson x.amazon_q_settings);
      ( "UnifiedStudioSettings",
        option_to_yojson unified_studio_settings_to_yojson x.unified_studio_settings );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let execution_role_session_name_mode_to_yojson (x : execution_role_session_name_mode) =
  match x with Static -> `String "STATIC" | UserIdentity -> `String "USER_IDENTITY"

let image_version_alias_pattern_to_yojson = string_to_yojson
let version_aliases_list_to_yojson tree = list_to_yojson image_version_alias_pattern_to_yojson tree

let sage_maker_image_name_to_yojson (x : sage_maker_image_name) =
  match x with Sagemaker_distribution -> `String "sagemaker_distribution"

let hidden_sage_maker_image_to_yojson (x : hidden_sage_maker_image) =
  assoc_to_yojson
    [
      ( "SageMakerImageName",
        option_to_yojson sage_maker_image_name_to_yojson x.sage_maker_image_name );
      ("VersionAliases", option_to_yojson version_aliases_list_to_yojson x.version_aliases);
    ]

let hidden_sage_maker_image_version_aliases_list_to_yojson tree =
  list_to_yojson hidden_sage_maker_image_to_yojson tree

let hidden_instance_types_list_to_yojson tree = list_to_yojson app_instance_type_to_yojson tree
let hidden_app_types_list_to_yojson tree = list_to_yojson app_type_to_yojson tree

let ml_tools_to_yojson (x : ml_tools) =
  match x with
  | DATA_WRANGLER -> `String "DataWrangler"
  | FEATURE_STORE -> `String "FeatureStore"
  | EMR_CLUSTERS -> `String "EmrClusters"
  | AUTO_ML -> `String "AutoMl"
  | EXPERIMENTS -> `String "Experiments"
  | TRAINING -> `String "Training"
  | MODEL_EVALUATION -> `String "ModelEvaluation"
  | PIPELINES -> `String "Pipelines"
  | MODELS -> `String "Models"
  | JUMP_START -> `String "JumpStart"
  | INFERENCE_RECOMMENDER -> `String "InferenceRecommender"
  | ENDPOINTS -> `String "Endpoints"
  | PROJECTS -> `String "Projects"
  | INFERENCE_OPTIMIZATION -> `String "InferenceOptimization"
  | PERFORMANCE_EVALUATION -> `String "PerformanceEvaluation"
  | LAKERA_GUARD -> `String "LakeraGuard"
  | COMET -> `String "Comet"
  | DEEPCHECKS_LLM_EVALUATION -> `String "DeepchecksLLMEvaluation"
  | FIDDLER -> `String "Fiddler"
  | HYPER_POD_CLUSTERS -> `String "HyperPodClusters"
  | RUNNING_INSTANCES -> `String "RunningInstances"
  | DATASETS -> `String "Datasets"
  | EVALUATORS -> `String "Evaluators"

let hidden_ml_tools_list_to_yojson tree = list_to_yojson ml_tools_to_yojson tree

let studio_web_portal_settings_to_yojson (x : studio_web_portal_settings) =
  assoc_to_yojson
    [
      ("HiddenMlTools", option_to_yojson hidden_ml_tools_list_to_yojson x.hidden_ml_tools);
      ("HiddenAppTypes", option_to_yojson hidden_app_types_list_to_yojson x.hidden_app_types);
      ( "HiddenInstanceTypes",
        option_to_yojson hidden_instance_types_list_to_yojson x.hidden_instance_types );
      ( "HiddenSageMakerImageVersionAliases",
        option_to_yojson hidden_sage_maker_image_version_aliases_list_to_yojson
          x.hidden_sage_maker_image_version_aliases );
      ( "ExecutionRoleSessionNameMode",
        option_to_yojson execution_role_session_name_mode_to_yojson
          x.execution_role_session_name_mode );
    ]

let studio_web_portal_to_yojson (x : studio_web_portal) =
  match x with Enabled -> `String "ENABLED" | Disabled -> `String "DISABLED"

let landing_uri_to_yojson = string_to_yojson

let r_session_app_settings_to_yojson (x : r_session_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
    ]

let r_studio_server_pro_user_group_to_yojson (x : r_studio_server_pro_user_group) =
  match x with Admin -> `String "R_STUDIO_ADMIN" | User -> `String "R_STUDIO_USER"

let r_studio_server_pro_access_status_to_yojson (x : r_studio_server_pro_access_status) =
  match x with Enabled -> `String "ENABLED" | Disabled -> `String "DISABLED"

let r_studio_server_pro_app_settings_to_yojson (x : r_studio_server_pro_app_settings) =
  assoc_to_yojson
    [
      ("AccessStatus", option_to_yojson r_studio_server_pro_access_status_to_yojson x.access_status);
      ("UserGroup", option_to_yojson r_studio_server_pro_user_group_to_yojson x.user_group);
    ]

let tensor_board_app_settings_to_yojson (x : tensor_board_app_settings) =
  assoc_to_yojson
    [ ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec) ]

let notebook_output_option_to_yojson (x : notebook_output_option) =
  match x with Allowed -> `String "Allowed" | Disabled -> `String "Disabled"

let sharing_settings_to_yojson (x : sharing_settings) =
  assoc_to_yojson
    [
      ( "NotebookOutputOption",
        option_to_yojson notebook_output_option_to_yojson x.notebook_output_option );
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("S3KmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_kms_key_id);
    ]

let user_settings_to_yojson (x : user_settings) =
  assoc_to_yojson
    [
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ("SharingSettings", option_to_yojson sharing_settings_to_yojson x.sharing_settings);
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "TensorBoardAppSettings",
        option_to_yojson tensor_board_app_settings_to_yojson x.tensor_board_app_settings );
      ( "RStudioServerProAppSettings",
        option_to_yojson r_studio_server_pro_app_settings_to_yojson
          x.r_studio_server_pro_app_settings );
      ( "RSessionAppSettings",
        option_to_yojson r_session_app_settings_to_yojson x.r_session_app_settings );
      ("CanvasAppSettings", option_to_yojson canvas_app_settings_to_yojson x.canvas_app_settings);
      ( "CodeEditorAppSettings",
        option_to_yojson code_editor_app_settings_to_yojson x.code_editor_app_settings );
      ( "JupyterLabAppSettings",
        option_to_yojson jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ( "SpaceStorageSettings",
        option_to_yojson default_space_storage_settings_to_yojson x.space_storage_settings );
      ("DefaultLandingUri", option_to_yojson landing_uri_to_yojson x.default_landing_uri);
      ("StudioWebPortal", option_to_yojson studio_web_portal_to_yojson x.studio_web_portal);
      ( "CustomPosixUserConfig",
        option_to_yojson custom_posix_user_config_to_yojson x.custom_posix_user_config );
      ( "CustomFileSystemConfigs",
        option_to_yojson custom_file_system_configs_to_yojson x.custom_file_system_configs );
      ( "StudioWebPortalSettings",
        option_to_yojson studio_web_portal_settings_to_yojson x.studio_web_portal_settings );
      ("AutoMountHomeEFS", option_to_yojson auto_mount_home_ef_s_to_yojson x.auto_mount_home_ef_s);
    ]

let domain_name_to_yojson = string_to_yojson

let create_domain_request_to_yojson (x : create_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AuthMode", Some (auth_mode_to_yojson x.auth_mode));
      ("DefaultUserSettings", Some (user_settings_to_yojson x.default_user_settings));
      ("DomainSettings", option_to_yojson domain_settings_to_yojson x.domain_settings);
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ( "HomeEfsFileSystemKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.home_efs_file_system_kms_key_id );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
    ]

let edge_deployment_plan_arn_to_yojson = string_to_yojson

let create_edge_deployment_plan_response_to_yojson (x : create_edge_deployment_plan_response) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
    ]

let failure_handling_policy_to_yojson (x : failure_handling_policy) =
  match x with
  | RollbackOnFailure -> `String "ROLLBACK_ON_FAILURE"
  | DoNothing -> `String "DO_NOTHING"

let edge_deployment_config_to_yojson (x : edge_deployment_config) =
  assoc_to_yojson
    [
      ("FailureHandlingPolicy", Some (failure_handling_policy_to_yojson x.failure_handling_policy));
    ]

let device_name_to_yojson = string_to_yojson
let device_names_to_yojson tree = list_to_yojson device_name_to_yojson tree
let percentage_to_yojson = int_to_yojson

let device_subset_type_to_yojson (x : device_subset_type) =
  match x with
  | Percentage -> `String "PERCENTAGE"
  | Selection -> `String "SELECTION"
  | NameContains -> `String "NAMECONTAINS"

let device_selection_config_to_yojson (x : device_selection_config) =
  assoc_to_yojson
    [
      ("DeviceSubsetType", Some (device_subset_type_to_yojson x.device_subset_type));
      ("Percentage", option_to_yojson percentage_to_yojson x.percentage);
      ("DeviceNames", option_to_yojson device_names_to_yojson x.device_names);
      ("DeviceNameContains", option_to_yojson device_name_to_yojson x.device_name_contains);
    ]

let deployment_stage_to_yojson (x : deployment_stage) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("DeviceSelectionConfig", Some (device_selection_config_to_yojson x.device_selection_config));
      ("DeploymentConfig", option_to_yojson edge_deployment_config_to_yojson x.deployment_config);
    ]

let deployment_stages_to_yojson tree = list_to_yojson deployment_stage_to_yojson tree

let edge_deployment_model_config_to_yojson (x : edge_deployment_model_config) =
  assoc_to_yojson
    [
      ("ModelHandle", Some (entity_name_to_yojson x.model_handle));
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
    ]

let edge_deployment_model_configs_to_yojson tree =
  list_to_yojson edge_deployment_model_config_to_yojson tree

let create_edge_deployment_plan_request_to_yojson (x : create_edge_deployment_plan_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("ModelConfigs", Some (edge_deployment_model_configs_to_yojson x.model_configs));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("Stages", option_to_yojson deployment_stages_to_yojson x.stages);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_edge_deployment_stage_request_to_yojson (x : create_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("Stages", Some (deployment_stages_to_yojson x.stages));
    ]

let create_edge_packaging_job_request_to_yojson (x : create_edge_packaging_job_request) =
  assoc_to_yojson
    [
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
      ("ModelName", Some (entity_name_to_yojson x.model_name));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("ResourceKey", option_to_yojson kms_key_id_to_yojson x.resource_key);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let endpoint_arn_to_yojson = string_to_yojson

let create_endpoint_output_to_yojson (x : create_endpoint_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let rolling_update_policy_to_yojson (x : rolling_update_policy) =
  assoc_to_yojson
    [
      ("MaximumBatchSize", Some (capacity_size_to_yojson x.maximum_batch_size));
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
      ( "RollbackMaximumBatchSize",
        option_to_yojson capacity_size_to_yojson x.rollback_maximum_batch_size );
    ]

let deployment_config_to_yojson (x : deployment_config) =
  assoc_to_yojson
    [
      ( "BlueGreenUpdatePolicy",
        option_to_yojson blue_green_update_policy_to_yojson x.blue_green_update_policy );
      ( "RollingUpdatePolicy",
        option_to_yojson rolling_update_policy_to_yojson x.rolling_update_policy );
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_config_to_yojson x.auto_rollback_configuration );
    ]

let endpoint_config_name_to_yojson = string_to_yojson

let create_endpoint_input_to_yojson (x : create_endpoint_input) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("DeploymentConfig", option_to_yojson deployment_config_to_yojson x.deployment_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let endpoint_config_arn_to_yojson = string_to_yojson

let create_endpoint_config_output_to_yojson (x : create_endpoint_config_output) =
  assoc_to_yojson
    [ ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn)) ]

let enable_detailed_observability_to_yojson = bool_to_yojson
let enable_enhanced_metrics_to_yojson = bool_to_yojson

let metrics_config_to_yojson (x : metrics_config) =
  assoc_to_yojson
    [
      ( "EnableEnhancedMetrics",
        option_to_yojson enable_enhanced_metrics_to_yojson x.enable_enhanced_metrics );
      ( "EnableDetailedObservability",
        option_to_yojson enable_detailed_observability_to_yojson x.enable_detailed_observability );
      ( "MetricPublishFrequencyInSeconds",
        option_to_yojson metric_publish_frequency_in_seconds_to_yojson
          x.metric_publish_frequency_in_seconds );
    ]

let ml_reservation_arn_to_yojson = string_to_yojson

let production_variant_capacity_reservation_config_to_yojson
    (x : production_variant_capacity_reservation_config) =
  assoc_to_yojson
    [
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.capacity_reservation_preference
      );
      ("MlReservationArn", option_to_yojson ml_reservation_arn_to_yojson x.ml_reservation_arn);
    ]

let production_variant_inference_ami_version_to_yojson
    (x : production_variant_inference_ami_version) =
  match x with
  | AL2_GPU_2 -> `String "al2-ami-sagemaker-inference-gpu-2"
  | AL2_GPU_2_1 -> `String "al2-ami-sagemaker-inference-gpu-2-1"
  | AL2_GPU_3_1 -> `String "al2-ami-sagemaker-inference-gpu-3-1"
  | AL2_NEURON_2 -> `String "al2-ami-sagemaker-inference-neuron-2"
  | AL2023_GPU_4_1 -> `String "al2023-ami-sagemaker-inference-gpu-4-1"

let routing_strategy_to_yojson (x : routing_strategy) =
  match x with
  | LEAST_OUTSTANDING_REQUESTS -> `String "LEAST_OUTSTANDING_REQUESTS"
  | RANDOM -> `String "RANDOM"

let production_variant_routing_config_to_yojson (x : production_variant_routing_config) =
  assoc_to_yojson [ ("RoutingStrategy", Some (routing_strategy_to_yojson x.routing_strategy)) ]

let managed_instance_scaling_cooldown_in_minutes_to_yojson = int_to_yojson
let managed_instance_scaling_maximum_step_size_to_yojson = int_to_yojson

let managed_instance_scaling_scale_in_strategy_to_yojson
    (x : managed_instance_scaling_scale_in_strategy) =
  match x with IDLE_RELEASE -> `String "IDLE_RELEASE" | CONSOLIDATION -> `String "CONSOLIDATION"

let production_variant_managed_instance_scaling_scale_in_policy_to_yojson
    (x : production_variant_managed_instance_scaling_scale_in_policy) =
  assoc_to_yojson
    [
      ("Strategy", Some (managed_instance_scaling_scale_in_strategy_to_yojson x.strategy));
      ( "MaximumStepSize",
        option_to_yojson managed_instance_scaling_maximum_step_size_to_yojson x.maximum_step_size );
      ( "CooldownInMinutes",
        option_to_yojson managed_instance_scaling_cooldown_in_minutes_to_yojson
          x.cooldown_in_minutes );
    ]

let managed_instance_scaling_max_instance_count_to_yojson = int_to_yojson
let managed_instance_scaling_min_instance_count_to_yojson = int_to_yojson

let managed_instance_scaling_status_to_yojson (x : managed_instance_scaling_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let production_variant_managed_instance_scaling_to_yojson
    (x : production_variant_managed_instance_scaling) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson managed_instance_scaling_status_to_yojson x.status);
      ( "MinInstanceCount",
        option_to_yojson managed_instance_scaling_min_instance_count_to_yojson x.min_instance_count
      );
      ( "MaxInstanceCount",
        option_to_yojson managed_instance_scaling_max_instance_count_to_yojson x.max_instance_count
      );
      ( "ScaleInPolicy",
        option_to_yojson production_variant_managed_instance_scaling_scale_in_policy_to_yojson
          x.scale_in_policy );
    ]

let production_variant_ssm_access_to_yojson = bool_to_yojson
let production_variant_container_startup_health_check_timeout_in_seconds_to_yojson = int_to_yojson
let production_variant_model_data_download_timeout_in_seconds_to_yojson = int_to_yojson
let production_variant_volume_size_in_g_b_to_yojson = int_to_yojson
let serverless_provisioned_concurrency_to_yojson = int_to_yojson
let serverless_max_concurrency_to_yojson = int_to_yojson
let serverless_memory_size_in_m_b_to_yojson = int_to_yojson

let production_variant_serverless_config_to_yojson (x : production_variant_serverless_config) =
  assoc_to_yojson
    [
      ("MemorySizeInMB", Some (serverless_memory_size_in_m_b_to_yojson x.memory_size_in_m_b));
      ("MaxConcurrency", Some (serverless_max_concurrency_to_yojson x.max_concurrency));
      ( "ProvisionedConcurrency",
        option_to_yojson serverless_provisioned_concurrency_to_yojson x.provisioned_concurrency );
    ]

let production_variant_core_dump_config_to_yojson (x : production_variant_core_dump_config) =
  assoc_to_yojson
    [
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let production_variant_accelerator_type_to_yojson (x : production_variant_accelerator_type) =
  match x with
  | ML_EIA1_MEDIUM -> `String "ml.eia1.medium"
  | ML_EIA1_LARGE -> `String "ml.eia1.large"
  | ML_EIA1_XLARGE -> `String "ml.eia1.xlarge"
  | ML_EIA2_MEDIUM -> `String "ml.eia2.medium"
  | ML_EIA2_LARGE -> `String "ml.eia2.large"
  | ML_EIA2_XLARGE -> `String "ml.eia2.xlarge"

let variant_weight_to_yojson = float_to_yojson
let variant_instance_provision_timeout_in_seconds_to_yojson = int_to_yojson
let instance_pool_priority_to_yojson = int_to_yojson
let model_name_to_yojson = string_to_yojson

let instance_pool_to_yojson (x : instance_pool) =
  assoc_to_yojson
    [
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("ModelNameOverride", option_to_yojson model_name_to_yojson x.model_name_override);
      ("Priority", Some (instance_pool_priority_to_yojson x.priority));
    ]

let instance_pool_list_to_yojson tree = list_to_yojson instance_pool_to_yojson tree
let initial_task_count_to_yojson = int_to_yojson
let variant_name_to_yojson = string_to_yojson

let production_variant_to_yojson (x : production_variant) =
  assoc_to_yojson
    [
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "InitialInstanceCount",
        option_to_yojson initial_task_count_to_yojson x.initial_instance_count );
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("InstancePools", option_to_yojson instance_pool_list_to_yojson x.instance_pools);
      ( "VariantInstanceProvisionTimeoutInSeconds",
        option_to_yojson variant_instance_provision_timeout_in_seconds_to_yojson
          x.variant_instance_provision_timeout_in_seconds );
      ("InitialVariantWeight", option_to_yojson variant_weight_to_yojson x.initial_variant_weight);
      ( "AcceleratorType",
        option_to_yojson production_variant_accelerator_type_to_yojson x.accelerator_type );
      ( "CoreDumpConfig",
        option_to_yojson production_variant_core_dump_config_to_yojson x.core_dump_config );
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
      ( "VolumeSizeInGB",
        option_to_yojson production_variant_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "ModelDataDownloadTimeoutInSeconds",
        option_to_yojson production_variant_model_data_download_timeout_in_seconds_to_yojson
          x.model_data_download_timeout_in_seconds );
      ( "ContainerStartupHealthCheckTimeoutInSeconds",
        option_to_yojson
          production_variant_container_startup_health_check_timeout_in_seconds_to_yojson
          x.container_startup_health_check_timeout_in_seconds );
      ( "EnableSSMAccess",
        option_to_yojson production_variant_ssm_access_to_yojson x.enable_ssm_access );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
      ( "InferenceAmiVersion",
        option_to_yojson production_variant_inference_ami_version_to_yojson x.inference_ami_version
      );
      ( "CapacityReservationConfig",
        option_to_yojson production_variant_capacity_reservation_config_to_yojson
          x.capacity_reservation_config );
    ]

let production_variant_list_to_yojson tree = list_to_yojson production_variant_to_yojson tree

let explainer_config_to_yojson (x : explainer_config) =
  assoc_to_yojson
    [
      ( "ClarifyExplainerConfig",
        option_to_yojson clarify_explainer_config_to_yojson x.clarify_explainer_config );
    ]

let sampling_percentage_to_yojson = int_to_yojson
let enable_capture_to_yojson = bool_to_yojson

let data_capture_config_to_yojson (x : data_capture_config) =
  assoc_to_yojson
    [
      ("EnableCapture", option_to_yojson enable_capture_to_yojson x.enable_capture);
      ( "InitialSamplingPercentage",
        Some (sampling_percentage_to_yojson x.initial_sampling_percentage) );
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("CaptureOptions", Some (capture_option_list_to_yojson x.capture_options));
      ( "CaptureContentTypeHeader",
        option_to_yojson capture_content_type_header_to_yojson x.capture_content_type_header );
    ]

let create_endpoint_config_input_to_yojson (x : create_endpoint_config_input) =
  assoc_to_yojson
    [
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("ProductionVariants", Some (production_variant_list_to_yojson x.production_variants));
      ("DataCaptureConfig", option_to_yojson data_capture_config_to_yojson x.data_capture_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_list_to_yojson x.shadow_production_variants );
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
    ]

let experiment_arn_to_yojson = string_to_yojson

let create_experiment_response_to_yojson (x : create_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let create_experiment_request_to_yojson (x : create_experiment_request) =
  assoc_to_yojson
    [
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let feature_group_arn_to_yojson = string_to_yojson

let create_feature_group_response_to_yojson (x : create_feature_group_response) =
  assoc_to_yojson [ ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn)) ]

let description_to_yojson = string_to_yojson

let throughput_mode_to_yojson (x : throughput_mode) =
  match x with ON_DEMAND -> `String "OnDemand" | PROVISIONED -> `String "Provisioned"

let throughput_config_to_yojson (x : throughput_config) =
  assoc_to_yojson
    [
      ("ThroughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
    ]

let table_format_to_yojson (x : table_format) =
  match x with
  | DEFAULT -> `String "Default"
  | GLUE -> `String "Glue"
  | ICEBERG -> `String "Iceberg"

let database_to_yojson = string_to_yojson
let table_name_to_yojson = string_to_yojson

let data_catalog_config_to_yojson (x : data_catalog_config) =
  assoc_to_yojson
    [
      ("TableName", Some (table_name_to_yojson x.table_name));
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Database", Some (database_to_yojson x.database));
    ]

let s3_storage_config_to_yojson (x : s3_storage_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("ResolvedOutputS3Uri", option_to_yojson s3_uri_to_yojson x.resolved_output_s3_uri);
    ]

let offline_store_config_to_yojson (x : offline_store_config) =
  assoc_to_yojson
    [
      ("S3StorageConfig", Some (s3_storage_config_to_yojson x.s3_storage_config));
      ("DisableGlueTableCreation", option_to_yojson boolean__to_yojson x.disable_glue_table_creation);
      ("DataCatalogConfig", option_to_yojson data_catalog_config_to_yojson x.data_catalog_config);
      ("TableFormat", option_to_yojson table_format_to_yojson x.table_format);
    ]

let storage_type_to_yojson (x : storage_type) =
  match x with STANDARD -> `String "Standard" | IN_MEMORY -> `String "InMemory"

let ttl_duration_value_to_yojson = int_to_yojson

let ttl_duration_unit_to_yojson (x : ttl_duration_unit) =
  match x with
  | SECONDS -> `String "Seconds"
  | MINUTES -> `String "Minutes"
  | HOURS -> `String "Hours"
  | DAYS -> `String "Days"
  | WEEKS -> `String "Weeks"

let ttl_duration_to_yojson (x : ttl_duration) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson ttl_duration_unit_to_yojson x.unit_);
      ("Value", option_to_yojson ttl_duration_value_to_yojson x.value);
    ]

let online_store_security_config_to_yojson (x : online_store_security_config) =
  assoc_to_yojson [ ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id) ]

let online_store_config_to_yojson (x : online_store_config) =
  assoc_to_yojson
    [
      ("SecurityConfig", option_to_yojson online_store_security_config_to_yojson x.security_config);
      ("EnableOnlineStore", option_to_yojson boolean__to_yojson x.enable_online_store);
      ("TtlDuration", option_to_yojson ttl_duration_to_yojson x.ttl_duration);
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
    ]

let feature_type_to_yojson (x : feature_type) =
  match x with
  | INTEGRAL -> `String "Integral"
  | FRACTIONAL -> `String "Fractional"
  | STRING -> `String "String"

let feature_name_to_yojson = string_to_yojson

let feature_definition_to_yojson (x : feature_definition) =
  assoc_to_yojson
    [
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("FeatureType", Some (feature_type_to_yojson x.feature_type));
      ("CollectionType", option_to_yojson collection_type_to_yojson x.collection_type);
      ("CollectionConfig", option_to_yojson collection_config_to_yojson x.collection_config);
    ]

let feature_definitions_to_yojson tree = list_to_yojson feature_definition_to_yojson tree
let feature_group_name_to_yojson = string_to_yojson

let create_feature_group_request_to_yojson (x : create_feature_group_request) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("RecordIdentifierFeatureName", Some (feature_name_to_yojson x.record_identifier_feature_name));
      ("EventTimeFeatureName", Some (feature_name_to_yojson x.event_time_feature_name));
      ("FeatureDefinitions", Some (feature_definitions_to_yojson x.feature_definitions));
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ("ThroughputConfig", option_to_yojson throughput_config_to_yojson x.throughput_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let flow_definition_arn_to_yojson = string_to_yojson

let create_flow_definition_response_to_yojson (x : create_flow_definition_response) =
  assoc_to_yojson
    [ ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn)) ]

let flow_definition_output_config_to_yojson (x : flow_definition_output_config) =
  assoc_to_yojson
    [
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let tenth_fractions_of_a_cent_to_yojson = int_to_yojson
let dollars_to_yojson = int_to_yojson

let us_d_to_yojson (x : us_d) =
  assoc_to_yojson
    [
      ("Dollars", option_to_yojson dollars_to_yojson x.dollars);
      ("Cents", option_to_yojson cents_to_yojson x.cents);
      ( "TenthFractionsOfACent",
        option_to_yojson tenth_fractions_of_a_cent_to_yojson x.tenth_fractions_of_a_cent );
    ]

let public_workforce_task_price_to_yojson (x : public_workforce_task_price) =
  assoc_to_yojson [ ("AmountInUsd", option_to_yojson us_d_to_yojson x.amount_in_usd) ]

let flow_definition_task_keyword_to_yojson = string_to_yojson

let flow_definition_task_keywords_to_yojson tree =
  list_to_yojson flow_definition_task_keyword_to_yojson tree

let flow_definition_task_time_limit_in_seconds_to_yojson = int_to_yojson
let flow_definition_task_availability_lifetime_in_seconds_to_yojson = int_to_yojson
let flow_definition_task_count_to_yojson = int_to_yojson
let flow_definition_task_description_to_yojson = string_to_yojson
let flow_definition_task_title_to_yojson = string_to_yojson
let human_task_ui_arn_to_yojson = string_to_yojson
let workteam_arn_to_yojson = string_to_yojson

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
      ("TaskTitle", Some (flow_definition_task_title_to_yojson x.task_title));
      ("TaskDescription", Some (flow_definition_task_description_to_yojson x.task_description));
      ("TaskCount", Some (flow_definition_task_count_to_yojson x.task_count));
      ( "TaskAvailabilityLifetimeInSeconds",
        option_to_yojson flow_definition_task_availability_lifetime_in_seconds_to_yojson
          x.task_availability_lifetime_in_seconds );
      ( "TaskTimeLimitInSeconds",
        option_to_yojson flow_definition_task_time_limit_in_seconds_to_yojson
          x.task_time_limit_in_seconds );
      ("TaskKeywords", option_to_yojson flow_definition_task_keywords_to_yojson x.task_keywords);
      ( "PublicWorkforceTaskPrice",
        option_to_yojson public_workforce_task_price_to_yojson x.public_workforce_task_price );
    ]

let human_loop_activation_conditions_to_yojson = string_to_yojson

let human_loop_activation_conditions_config_to_yojson (x : human_loop_activation_conditions_config)
    =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditions",
        Some (human_loop_activation_conditions_to_yojson x.human_loop_activation_conditions) );
    ]

let human_loop_activation_config_to_yojson (x : human_loop_activation_config) =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditionsConfig",
        Some
          (human_loop_activation_conditions_config_to_yojson
             x.human_loop_activation_conditions_config) );
    ]

let human_loop_request_source_to_yojson (x : human_loop_request_source) =
  assoc_to_yojson
    [
      ( "AwsManagedHumanLoopRequestSource",
        Some
          (aws_managed_human_loop_request_source_to_yojson x.aws_managed_human_loop_request_source)
      );
    ]

let flow_definition_name_to_yojson = string_to_yojson

let create_flow_definition_request_to_yojson (x : create_flow_definition_request) =
  assoc_to_yojson
    [
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
      ( "HumanLoopRequestSource",
        option_to_yojson human_loop_request_source_to_yojson x.human_loop_request_source );
      ( "HumanLoopActivationConfig",
        option_to_yojson human_loop_activation_config_to_yojson x.human_loop_activation_config );
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("OutputConfig", Some (flow_definition_output_config_to_yojson x.output_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let hub_arn_to_yojson = string_to_yojson

let create_hub_response_to_yojson (x : create_hub_response) =
  assoc_to_yojson [ ("HubArn", Some (hub_arn_to_yojson x.hub_arn)) ]

let s3_output_path_to_yojson = string_to_yojson

let hub_s3_storage_config_to_yojson (x : hub_s3_storage_config) =
  assoc_to_yojson [ ("S3OutputPath", option_to_yojson s3_output_path_to_yojson x.s3_output_path) ]

let hub_search_keyword_to_yojson = string_to_yojson
let hub_search_keyword_list_to_yojson tree = list_to_yojson hub_search_keyword_to_yojson tree
let hub_display_name_to_yojson = string_to_yojson
let hub_description_to_yojson = string_to_yojson
let hub_name_to_yojson = string_to_yojson

let create_hub_request_to_yojson (x : create_hub_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_to_yojson x.hub_name));
      ("HubDescription", Some (hub_description_to_yojson x.hub_description));
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("S3StorageConfig", option_to_yojson hub_s3_storage_config_to_yojson x.s3_storage_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let next_token_to_yojson = string_to_yojson

let create_hub_content_presigned_urls_response_to_yojson
    (x : create_hub_content_presigned_urls_response) =
  assoc_to_yojson
    [
      ("AuthorizedUrlConfigs", Some (authorized_url_configs_to_yojson x.authorized_url_configs));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let presigned_url_access_config_to_yojson (x : presigned_url_access_config) =
  assoc_to_yojson
    [
      ("AcceptEula", option_to_yojson boolean__to_yojson x.accept_eula);
      ("ExpectedS3Url", option_to_yojson s3_model_uri_to_yojson x.expected_s3_url);
    ]

let hub_content_type_to_yojson (x : hub_content_type) =
  match x with
  | MODEL -> `String "Model"
  | NOTEBOOK -> `String "Notebook"
  | MODEL_REFERENCE -> `String "ModelReference"
  | DATA_SET -> `String "DataSet"
  | JSON_DOC -> `String "JsonDoc"

let hub_name_or_arn_to_yojson = string_to_yojson

let create_hub_content_presigned_urls_request_to_yojson
    (x : create_hub_content_presigned_urls_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("AccessConfig", option_to_yojson presigned_url_access_config_to_yojson x.access_config);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let create_hub_content_reference_response_to_yojson (x : create_hub_content_reference_response) =
  assoc_to_yojson
    [
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
    ]

let sage_maker_public_hub_content_arn_to_yojson = string_to_yojson

let create_hub_content_reference_request_to_yojson (x : create_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ( "SageMakerPublicHubContentArn",
        Some (sage_maker_public_hub_content_arn_to_yojson x.sage_maker_public_hub_content_arn) );
      ("HubContentName", option_to_yojson hub_content_name_to_yojson x.hub_content_name);
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_human_task_ui_response_to_yojson (x : create_human_task_ui_response) =
  assoc_to_yojson [ ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn)) ]

let template_content_to_yojson = string_to_yojson

let ui_template_to_yojson (x : ui_template) =
  assoc_to_yojson [ ("Content", Some (template_content_to_yojson x.content)) ]

let human_task_ui_name_to_yojson = string_to_yojson

let create_human_task_ui_request_to_yojson (x : create_human_task_ui_request) =
  assoc_to_yojson
    [
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
      ("UiTemplate", Some (ui_template_to_yojson x.ui_template));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let hyper_parameter_tuning_job_arn_to_yojson = string_to_yojson

let create_hyper_parameter_tuning_job_response_to_yojson
    (x : create_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
    ]

let hyper_parameter_tuning_job_warm_start_type_to_yojson
    (x : hyper_parameter_tuning_job_warm_start_type) =
  match x with
  | IDENTICAL_DATA_AND_ALGORITHM -> `String "IdenticalDataAndAlgorithm"
  | TRANSFER_LEARNING -> `String "TransferLearning"

let hyper_parameter_tuning_job_name_to_yojson = string_to_yojson

let parent_hyper_parameter_tuning_job_to_yojson (x : parent_hyper_parameter_tuning_job) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name
      );
    ]

let parent_hyper_parameter_tuning_jobs_to_yojson tree =
  list_to_yojson parent_hyper_parameter_tuning_job_to_yojson tree

let hyper_parameter_tuning_job_warm_start_config_to_yojson
    (x : hyper_parameter_tuning_job_warm_start_config) =
  assoc_to_yojson
    [
      ( "ParentHyperParameterTuningJobs",
        Some (parent_hyper_parameter_tuning_jobs_to_yojson x.parent_hyper_parameter_tuning_jobs) );
      ( "WarmStartType",
        Some (hyper_parameter_tuning_job_warm_start_type_to_yojson x.warm_start_type) );
    ]

let hyper_parameter_training_job_environment_value_to_yojson = string_to_yojson
let hyper_parameter_training_job_environment_key_to_yojson = string_to_yojson

let hyper_parameter_training_job_environment_map_to_yojson tree =
  map_to_yojson hyper_parameter_training_job_environment_key_to_yojson
    hyper_parameter_training_job_environment_value_to_yojson tree

let maximum_retry_attempts_to_yojson = int_to_yojson

let retry_strategy_to_yojson (x : retry_strategy) =
  assoc_to_yojson
    [ ("MaximumRetryAttempts", Some (maximum_retry_attempts_to_yojson x.maximum_retry_attempts)) ]

let volume_size_in_g_b_to_yojson = int_to_yojson

let hyper_parameter_tuning_instance_config_to_yojson (x : hyper_parameter_tuning_instance_config) =
  assoc_to_yojson
    [
      ("InstanceType", Some (training_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
      ("VolumeSizeInGB", Some (volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
    ]

let hyper_parameter_tuning_instance_configs_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_instance_config_to_yojson tree

let hyper_parameter_tuning_allocation_strategy_to_yojson
    (x : hyper_parameter_tuning_allocation_strategy) =
  match x with PRIORITIZED -> `String "Prioritized"

let hyper_parameter_tuning_resource_config_to_yojson (x : hyper_parameter_tuning_resource_config) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson training_instance_type_to_yojson x.instance_type);
      ("InstanceCount", option_to_yojson training_instance_count_to_yojson x.instance_count);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "AllocationStrategy",
        option_to_yojson hyper_parameter_tuning_allocation_strategy_to_yojson x.allocation_strategy
      );
      ( "InstanceConfigs",
        option_to_yojson hyper_parameter_tuning_instance_configs_to_yojson x.instance_configs );
    ]

let hyper_parameter_algorithm_specification_to_yojson (x : hyper_parameter_algorithm_specification)
    =
  assoc_to_yojson
    [
      ("TrainingImage", option_to_yojson algorithm_image_to_yojson x.training_image);
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
      ("AlgorithmName", option_to_yojson arn_or_name_to_yojson x.algorithm_name);
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
    ]

let integer_parameter_range_to_yojson (x : integer_parameter_range) =
  assoc_to_yojson
    [
      ("Name", Some (parameter_key_to_yojson x.name));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("ScalingType", option_to_yojson hyper_parameter_scaling_type_to_yojson x.scaling_type);
    ]

let integer_parameter_ranges_to_yojson tree = list_to_yojson integer_parameter_range_to_yojson tree

let parameter_ranges_to_yojson (x : parameter_ranges) =
  assoc_to_yojson
    [
      ( "IntegerParameterRanges",
        option_to_yojson integer_parameter_ranges_to_yojson x.integer_parameter_ranges );
      ( "ContinuousParameterRanges",
        option_to_yojson continuous_parameter_ranges_to_yojson x.continuous_parameter_ranges );
      ( "CategoricalParameterRanges",
        option_to_yojson categorical_parameter_ranges_to_yojson x.categorical_parameter_ranges );
      ("AutoParameters", option_to_yojson auto_parameters_to_yojson x.auto_parameters);
    ]

let hyper_parameter_training_job_definition_name_to_yojson = string_to_yojson

let hyper_parameter_training_job_definition_to_yojson (x : hyper_parameter_training_job_definition)
    =
  assoc_to_yojson
    [
      ( "DefinitionName",
        option_to_yojson hyper_parameter_training_job_definition_name_to_yojson x.definition_name );
      ( "TuningObjective",
        option_to_yojson hyper_parameter_tuning_job_objective_to_yojson x.tuning_objective );
      ("HyperParameterRanges", option_to_yojson parameter_ranges_to_yojson x.hyper_parameter_ranges);
      ( "StaticHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.static_hyper_parameters );
      ( "AlgorithmSpecification",
        Some (hyper_parameter_algorithm_specification_to_yojson x.algorithm_specification) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ( "HyperParameterTuningResourceConfig",
        option_to_yojson hyper_parameter_tuning_resource_config_to_yojson
          x.hyper_parameter_tuning_resource_config );
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ( "Environment",
        option_to_yojson hyper_parameter_training_job_environment_map_to_yojson x.environment );
    ]

let hyper_parameter_training_job_definitions_to_yojson tree =
  list_to_yojson hyper_parameter_training_job_definition_to_yojson tree

let random_seed_to_yojson = int_to_yojson
let target_objective_metric_value_to_yojson = float_to_yojson

let tuning_job_completion_criteria_to_yojson (x : tuning_job_completion_criteria) =
  assoc_to_yojson
    [
      ( "TargetObjectiveMetricValue",
        option_to_yojson target_objective_metric_value_to_yojson x.target_objective_metric_value );
      ( "BestObjectiveNotImproving",
        option_to_yojson best_objective_not_improving_to_yojson x.best_objective_not_improving );
      ("ConvergenceDetected", option_to_yojson convergence_detected_to_yojson x.convergence_detected);
    ]

let training_job_early_stopping_type_to_yojson (x : training_job_early_stopping_type) =
  match x with OFF -> `String "Off" | AUTO -> `String "Auto"

let hyper_parameter_tuning_max_runtime_in_seconds_to_yojson = int_to_yojson
let max_parallel_training_jobs_to_yojson = int_to_yojson
let max_number_of_training_jobs_to_yojson = int_to_yojson

let resource_limits_to_yojson (x : resource_limits) =
  assoc_to_yojson
    [
      ( "MaxNumberOfTrainingJobs",
        option_to_yojson max_number_of_training_jobs_to_yojson x.max_number_of_training_jobs );
      ( "MaxParallelTrainingJobs",
        Some (max_parallel_training_jobs_to_yojson x.max_parallel_training_jobs) );
      ( "MaxRuntimeInSeconds",
        option_to_yojson hyper_parameter_tuning_max_runtime_in_seconds_to_yojson
          x.max_runtime_in_seconds );
    ]

let hyperband_strategy_max_resource_to_yojson = int_to_yojson
let hyperband_strategy_min_resource_to_yojson = int_to_yojson

let hyperband_strategy_config_to_yojson (x : hyperband_strategy_config) =
  assoc_to_yojson
    [
      ("MinResource", option_to_yojson hyperband_strategy_min_resource_to_yojson x.min_resource);
      ("MaxResource", option_to_yojson hyperband_strategy_max_resource_to_yojson x.max_resource);
    ]

let hyper_parameter_tuning_job_strategy_config_to_yojson
    (x : hyper_parameter_tuning_job_strategy_config) =
  assoc_to_yojson
    [
      ( "HyperbandStrategyConfig",
        option_to_yojson hyperband_strategy_config_to_yojson x.hyperband_strategy_config );
    ]

let hyper_parameter_tuning_job_strategy_type_to_yojson
    (x : hyper_parameter_tuning_job_strategy_type) =
  match x with
  | BAYESIAN -> `String "Bayesian"
  | RANDOM -> `String "Random"
  | HYPERBAND -> `String "Hyperband"
  | GRID -> `String "Grid"

let hyper_parameter_tuning_job_config_to_yojson (x : hyper_parameter_tuning_job_config) =
  assoc_to_yojson
    [
      ("Strategy", Some (hyper_parameter_tuning_job_strategy_type_to_yojson x.strategy));
      ( "StrategyConfig",
        option_to_yojson hyper_parameter_tuning_job_strategy_config_to_yojson x.strategy_config );
      ( "HyperParameterTuningJobObjective",
        option_to_yojson hyper_parameter_tuning_job_objective_to_yojson
          x.hyper_parameter_tuning_job_objective );
      ("ResourceLimits", Some (resource_limits_to_yojson x.resource_limits));
      ("ParameterRanges", option_to_yojson parameter_ranges_to_yojson x.parameter_ranges);
      ( "TrainingJobEarlyStoppingType",
        option_to_yojson training_job_early_stopping_type_to_yojson
          x.training_job_early_stopping_type );
      ( "TuningJobCompletionCriteria",
        option_to_yojson tuning_job_completion_criteria_to_yojson x.tuning_job_completion_criteria
      );
      ("RandomSeed", option_to_yojson random_seed_to_yojson x.random_seed);
    ]

let create_hyper_parameter_tuning_job_request_to_yojson
    (x : create_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
      ( "HyperParameterTuningJobConfig",
        Some (hyper_parameter_tuning_job_config_to_yojson x.hyper_parameter_tuning_job_config) );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Autotune", option_to_yojson autotune_to_yojson x.autotune);
    ]

let create_image_response_to_yojson (x : create_image_response) =
  assoc_to_yojson [ ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn) ]

let image_display_name_to_yojson = string_to_yojson
let image_description_to_yojson = string_to_yojson

let create_image_request_to_yojson (x : create_image_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_image_version_response_to_yojson (x : create_image_version_response) =
  assoc_to_yojson
    [ ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn) ]

let release_notes_to_yojson = string_to_yojson
let horovod_to_yojson = bool_to_yojson
let processor_to_yojson (x : processor) = match x with CPU -> `String "CPU" | GPU -> `String "GPU"
let programming_lang_to_yojson = string_to_yojson
let ml_framework_to_yojson = string_to_yojson

let job_type_to_yojson (x : job_type) =
  match x with
  | TRAINING -> `String "TRAINING"
  | INFERENCE -> `String "INFERENCE"
  | NOTEBOOK_KERNEL -> `String "NOTEBOOK_KERNEL"

let vendor_guidance_to_yojson (x : vendor_guidance) =
  match x with
  | NOT_PROVIDED -> `String "NOT_PROVIDED"
  | STABLE -> `String "STABLE"
  | TO_BE_ARCHIVED -> `String "TO_BE_ARCHIVED"
  | ARCHIVED -> `String "ARCHIVED"

let sage_maker_image_version_alias_to_yojson = string_to_yojson

let sage_maker_image_version_aliases_to_yojson tree =
  list_to_yojson sage_maker_image_version_alias_to_yojson tree

let image_base_image_to_yojson = string_to_yojson

let create_image_version_request_to_yojson (x : create_image_version_request) =
  assoc_to_yojson
    [
      ("BaseImage", Some (image_base_image_to_yojson x.base_image));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("Aliases", option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases);
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
    ]

let inference_component_arn_to_yojson = string_to_yojson

let create_inference_component_output_to_yojson (x : create_inference_component_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let inference_component_copy_count_to_yojson = int_to_yojson

let inference_component_runtime_config_to_yojson (x : inference_component_runtime_config) =
  assoc_to_yojson [ ("CopyCount", Some (inference_component_copy_count_to_yojson x.copy_count)) ]

let inference_component_availability_zone_balance_to_yojson
    (x : inference_component_availability_zone_balance) =
  assoc_to_yojson
    [
      ( "EnforcementMode",
        Some (availability_zone_balance_enforcement_mode_to_yojson x.enforcement_mode) );
      ( "MaxImbalance",
        option_to_yojson availability_zone_balance_max_imbalance_to_yojson x.max_imbalance );
    ]

let inference_component_placement_strategy_to_yojson (x : inference_component_placement_strategy) =
  match x with SPREAD -> `String "SPREAD" | BINPACK -> `String "BINPACK"

let inference_component_scheduling_config_to_yojson (x : inference_component_scheduling_config) =
  assoc_to_yojson
    [
      ( "PlacementStrategy",
        Some (inference_component_placement_strategy_to_yojson x.placement_strategy) );
      ( "AvailabilityZoneBalance",
        option_to_yojson inference_component_availability_zone_balance_to_yojson
          x.availability_zone_balance );
    ]

let enable_caching_to_yojson = bool_to_yojson

let inference_component_data_cache_config_to_yojson (x : inference_component_data_cache_config) =
  assoc_to_yojson [ ("EnableCaching", Some (enable_caching_to_yojson x.enable_caching)) ]

let inference_component_name_to_yojson = string_to_yojson
let memory_in_mb_to_yojson = int_to_yojson
let number_of_accelerator_devices_to_yojson = float_to_yojson
let number_of_cpu_cores_to_yojson = float_to_yojson

let inference_component_compute_resource_requirements_to_yojson
    (x : inference_component_compute_resource_requirements) =
  assoc_to_yojson
    [
      ( "NumberOfCpuCoresRequired",
        option_to_yojson number_of_cpu_cores_to_yojson x.number_of_cpu_cores_required );
      ( "NumberOfAcceleratorDevicesRequired",
        option_to_yojson number_of_accelerator_devices_to_yojson
          x.number_of_accelerator_devices_required );
      ("MinMemoryRequiredInMb", Some (memory_in_mb_to_yojson x.min_memory_required_in_mb));
      ("MaxMemoryRequiredInMb", option_to_yojson memory_in_mb_to_yojson x.max_memory_required_in_mb);
    ]

let inference_component_startup_parameters_to_yojson (x : inference_component_startup_parameters) =
  assoc_to_yojson
    [
      ( "ModelDataDownloadTimeoutInSeconds",
        option_to_yojson production_variant_model_data_download_timeout_in_seconds_to_yojson
          x.model_data_download_timeout_in_seconds );
      ( "ContainerStartupHealthCheckTimeoutInSeconds",
        option_to_yojson
          production_variant_container_startup_health_check_timeout_in_seconds_to_yojson
          x.container_startup_health_check_timeout_in_seconds );
    ]

let inference_component_container_specification_to_yojson
    (x : inference_component_container_specification) =
  assoc_to_yojson
    [
      ("Image", option_to_yojson container_image_to_yojson x.image);
      ("ArtifactUrl", option_to_yojson url_to_yojson x.artifact_url);
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
    ]

let inference_component_specification_to_yojson (x : inference_component_specification) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "Container",
        option_to_yojson inference_component_container_specification_to_yojson x.container );
      ( "StartupParameters",
        option_to_yojson inference_component_startup_parameters_to_yojson x.startup_parameters );
      ( "ComputeResourceRequirements",
        option_to_yojson inference_component_compute_resource_requirements_to_yojson
          x.compute_resource_requirements );
      ( "BaseInferenceComponentName",
        option_to_yojson inference_component_name_to_yojson x.base_inference_component_name );
      ( "DataCacheConfig",
        option_to_yojson inference_component_data_cache_config_to_yojson x.data_cache_config );
      ( "SchedulingConfig",
        option_to_yojson inference_component_scheduling_config_to_yojson x.scheduling_config );
    ]

let inference_component_specification_list_to_yojson tree =
  list_to_yojson inference_component_specification_to_yojson tree

let create_inference_component_input_to_yojson (x : create_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("VariantName", option_to_yojson variant_name_to_yojson x.variant_name);
      ("Specification", option_to_yojson inference_component_specification_to_yojson x.specification);
      ( "Specifications",
        option_to_yojson inference_component_specification_list_to_yojson x.specifications );
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_to_yojson x.runtime_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let inference_experiment_arn_to_yojson = string_to_yojson

let create_inference_experiment_response_to_yojson (x : create_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let model_variant_name_to_yojson = string_to_yojson

let shadow_model_variant_config_to_yojson (x : shadow_model_variant_config) =
  assoc_to_yojson
    [
      ("ShadowModelVariantName", Some (model_variant_name_to_yojson x.shadow_model_variant_name));
      ("SamplingPercentage", Some (percentage_to_yojson x.sampling_percentage));
    ]

let shadow_model_variant_config_list_to_yojson tree =
  list_to_yojson shadow_model_variant_config_to_yojson tree

let shadow_mode_config_to_yojson (x : shadow_mode_config) =
  assoc_to_yojson
    [
      ("SourceModelVariantName", Some (model_variant_name_to_yojson x.source_model_variant_name));
      ( "ShadowModelVariants",
        Some (shadow_model_variant_config_list_to_yojson x.shadow_model_variants) );
    ]

let inference_experiment_data_storage_config_to_yojson
    (x : inference_experiment_data_storage_config) =
  assoc_to_yojson
    [
      ("Destination", Some (destination_s3_uri_to_yojson x.destination));
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
      ("ContentType", option_to_yojson capture_content_type_header_to_yojson x.content_type);
    ]

let task_count_to_yojson = int_to_yojson

let real_time_inference_config_to_yojson (x : real_time_inference_config) =
  assoc_to_yojson
    [
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (task_count_to_yojson x.instance_count));
    ]

let model_infrastructure_type_to_yojson (x : model_infrastructure_type) =
  match x with REAL_TIME_INFERENCE -> `String "RealTimeInference"

let model_infrastructure_config_to_yojson (x : model_infrastructure_config) =
  assoc_to_yojson
    [
      ("InfrastructureType", Some (model_infrastructure_type_to_yojson x.infrastructure_type));
      ( "RealTimeInferenceConfig",
        Some (real_time_inference_config_to_yojson x.real_time_inference_config) );
    ]

let model_variant_config_to_yojson (x : model_variant_config) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("VariantName", Some (model_variant_name_to_yojson x.variant_name));
      ("InfrastructureConfig", Some (model_infrastructure_config_to_yojson x.infrastructure_config));
    ]

let model_variant_config_list_to_yojson tree = list_to_yojson model_variant_config_to_yojson tree
let inference_experiment_description_to_yojson = string_to_yojson

let inference_experiment_schedule_to_yojson (x : inference_experiment_schedule) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let inference_experiment_type_to_yojson (x : inference_experiment_type) =
  match x with SHADOW_MODE -> `String "ShadowMode"

let inference_experiment_name_to_yojson = string_to_yojson

let create_inference_experiment_request_to_yojson (x : create_inference_experiment_request) =
  assoc_to_yojson
    [
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("ModelVariants", Some (model_variant_config_list_to_yojson x.model_variants));
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ShadowModeConfig", Some (shadow_mode_config_to_yojson x.shadow_mode_config));
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let recommendation_job_arn_to_yojson = string_to_yojson

let create_inference_recommendations_job_response_to_yojson
    (x : create_inference_recommendations_job_response) =
  assoc_to_yojson [ ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn)) ]

let recommendation_job_compiled_output_config_to_yojson
    (x : recommendation_job_compiled_output_config) =
  assoc_to_yojson [ ("S3OutputUri", option_to_yojson s3_uri_to_yojson x.s3_output_uri) ]

let recommendation_job_output_config_to_yojson (x : recommendation_job_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "CompiledOutputConfig",
        option_to_yojson recommendation_job_compiled_output_config_to_yojson
          x.compiled_output_config );
    ]

let flat_invocations_to_yojson (x : flat_invocations) =
  match x with CONTINUE -> `String "Continue" | STOP -> `String "Stop"

let model_latency_threshold_to_yojson (x : model_latency_threshold) =
  assoc_to_yojson
    [
      ("Percentile", option_to_yojson string64_to_yojson x.percentile);
      ("ValueInMilliseconds", option_to_yojson integer_to_yojson x.value_in_milliseconds);
    ]

let model_latency_thresholds_to_yojson tree = list_to_yojson model_latency_threshold_to_yojson tree

let recommendation_job_stopping_conditions_to_yojson (x : recommendation_job_stopping_conditions) =
  assoc_to_yojson
    [
      ("MaxInvocations", option_to_yojson integer_to_yojson x.max_invocations);
      ( "ModelLatencyThresholds",
        option_to_yojson model_latency_thresholds_to_yojson x.model_latency_thresholds );
      ("FlatInvocations", option_to_yojson flat_invocations_to_yojson x.flat_invocations);
    ]

let recommendation_job_description_to_yojson = string_to_yojson
let recommendation_job_vpc_subnet_id_to_yojson = string_to_yojson

let recommendation_job_vpc_subnets_to_yojson tree =
  list_to_yojson recommendation_job_vpc_subnet_id_to_yojson tree

let recommendation_job_vpc_security_group_id_to_yojson = string_to_yojson

let recommendation_job_vpc_security_group_ids_to_yojson tree =
  list_to_yojson recommendation_job_vpc_security_group_id_to_yojson tree

let recommendation_job_vpc_config_to_yojson (x : recommendation_job_vpc_config) =
  assoc_to_yojson
    [
      ( "SecurityGroupIds",
        Some (recommendation_job_vpc_security_group_ids_to_yojson x.security_group_ids) );
      ("Subnets", Some (recommendation_job_vpc_subnets_to_yojson x.subnets));
    ]

let endpoint_info_to_yojson (x : endpoint_info) =
  assoc_to_yojson [ ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name) ]

let endpoints_to_yojson tree = list_to_yojson endpoint_info_to_yojson tree
let recommendation_job_supported_response_mime_type_to_yojson = string_to_yojson

let recommendation_job_supported_response_mime_types_to_yojson tree =
  list_to_yojson recommendation_job_supported_response_mime_type_to_yojson tree

let recommendation_job_data_input_config_to_yojson = string_to_yojson

let recommendation_job_supported_endpoint_type_to_yojson
    (x : recommendation_job_supported_endpoint_type) =
  match x with REALTIME -> `String "RealTime" | SERVERLESS -> `String "Serverless"

let recommendation_job_supported_instance_types_to_yojson tree =
  list_to_yojson string__to_yojson tree

let recommendation_job_supported_content_type_to_yojson = string_to_yojson

let recommendation_job_supported_content_types_to_yojson tree =
  list_to_yojson recommendation_job_supported_content_type_to_yojson tree

let recommendation_job_payload_config_to_yojson (x : recommendation_job_payload_config) =
  assoc_to_yojson
    [
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
      ( "SupportedContentTypes",
        option_to_yojson recommendation_job_supported_content_types_to_yojson
          x.supported_content_types );
    ]

let recommendation_job_framework_version_to_yojson = string_to_yojson

let recommendation_job_container_config_to_yojson (x : recommendation_job_container_config) =
  assoc_to_yojson
    [
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("Framework", option_to_yojson string__to_yojson x.framework);
      ( "FrameworkVersion",
        option_to_yojson recommendation_job_framework_version_to_yojson x.framework_version );
      ( "PayloadConfig",
        option_to_yojson recommendation_job_payload_config_to_yojson x.payload_config );
      ("NearestModelName", option_to_yojson string__to_yojson x.nearest_model_name);
      ( "SupportedInstanceTypes",
        option_to_yojson recommendation_job_supported_instance_types_to_yojson
          x.supported_instance_types );
      ( "SupportedEndpointType",
        option_to_yojson recommendation_job_supported_endpoint_type_to_yojson
          x.supported_endpoint_type );
      ( "DataInputConfig",
        option_to_yojson recommendation_job_data_input_config_to_yojson x.data_input_config );
      ( "SupportedResponseMIMETypes",
        option_to_yojson recommendation_job_supported_response_mime_types_to_yojson
          x.supported_response_mime_types );
    ]

let environment_parameter_ranges_to_yojson (x : environment_parameter_ranges) =
  assoc_to_yojson
    [
      ( "CategoricalParameterRanges",
        option_to_yojson categorical_parameters_to_yojson x.categorical_parameter_ranges );
    ]

let endpoint_input_configuration_to_yojson (x : endpoint_input_configuration) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
      ( "EnvironmentParameterRanges",
        option_to_yojson environment_parameter_ranges_to_yojson x.environment_parameter_ranges );
    ]

let endpoint_input_configurations_to_yojson tree =
  list_to_yojson endpoint_input_configuration_to_yojson tree

let max_parallel_of_tests_to_yojson = int_to_yojson
let max_number_of_tests_to_yojson = int_to_yojson

let recommendation_job_resource_limit_to_yojson (x : recommendation_job_resource_limit) =
  assoc_to_yojson
    [
      ("MaxNumberOfTests", option_to_yojson max_number_of_tests_to_yojson x.max_number_of_tests);
      ( "MaxParallelOfTests",
        option_to_yojson max_parallel_of_tests_to_yojson x.max_parallel_of_tests );
    ]

let users_per_step_to_yojson = int_to_yojson
let number_of_steps_to_yojson = int_to_yojson
let traffic_duration_in_seconds_to_yojson = int_to_yojson

let stairs_to_yojson (x : stairs) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson traffic_duration_in_seconds_to_yojson x.duration_in_seconds );
      ("NumberOfSteps", option_to_yojson number_of_steps_to_yojson x.number_of_steps);
      ("UsersPerStep", option_to_yojson users_per_step_to_yojson x.users_per_step);
    ]

let spawn_rate_to_yojson = int_to_yojson
let initial_number_of_users_to_yojson = int_to_yojson

let phase_to_yojson (x : phase) =
  assoc_to_yojson
    [
      ( "InitialNumberOfUsers",
        option_to_yojson initial_number_of_users_to_yojson x.initial_number_of_users );
      ("SpawnRate", option_to_yojson spawn_rate_to_yojson x.spawn_rate);
      ( "DurationInSeconds",
        option_to_yojson traffic_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let phases_to_yojson tree = list_to_yojson phase_to_yojson tree

let traffic_type_to_yojson (x : traffic_type) =
  match x with PHASES -> `String "PHASES" | STAIRS -> `String "STAIRS"

let traffic_pattern_to_yojson (x : traffic_pattern) =
  assoc_to_yojson
    [
      ("TrafficType", option_to_yojson traffic_type_to_yojson x.traffic_type);
      ("Phases", option_to_yojson phases_to_yojson x.phases);
      ("Stairs", option_to_yojson stairs_to_yojson x.stairs);
    ]

let job_duration_in_seconds_to_yojson = int_to_yojson

let recommendation_job_input_config_to_yojson (x : recommendation_job_input_config) =
  assoc_to_yojson
    [
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "JobDurationInSeconds",
        option_to_yojson job_duration_in_seconds_to_yojson x.job_duration_in_seconds );
      ("TrafficPattern", option_to_yojson traffic_pattern_to_yojson x.traffic_pattern);
      ( "ResourceLimit",
        option_to_yojson recommendation_job_resource_limit_to_yojson x.resource_limit );
      ( "EndpointConfigurations",
        option_to_yojson endpoint_input_configurations_to_yojson x.endpoint_configurations );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ContainerConfig",
        option_to_yojson recommendation_job_container_config_to_yojson x.container_config );
      ("Endpoints", option_to_yojson endpoints_to_yojson x.endpoints);
      ("VpcConfig", option_to_yojson recommendation_job_vpc_config_to_yojson x.vpc_config);
    ]

let recommendation_job_type_to_yojson (x : recommendation_job_type) =
  match x with DEFAULT -> `String "Default" | ADVANCED -> `String "Advanced"

let recommendation_job_name_to_yojson = string_to_yojson

let create_inference_recommendations_job_request_to_yojson
    (x : create_inference_recommendations_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("InputConfig", Some (recommendation_job_input_config_to_yojson x.input_config));
      ("JobDescription", option_to_yojson recommendation_job_description_to_yojson x.job_description);
      ( "StoppingConditions",
        option_to_yojson recommendation_job_stopping_conditions_to_yojson x.stopping_conditions );
      ("OutputConfig", option_to_yojson recommendation_job_output_config_to_yojson x.output_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let job_arn_to_yojson = string_to_yojson

let create_job_response_to_yojson (x : create_job_response) =
  assoc_to_yojson [ ("JobArn", Some (job_arn_to_yojson x.job_arn)) ]

let job_config_document_to_yojson = string_to_yojson
let job_schema_version_to_yojson = string_to_yojson

let job_category_to_yojson (x : job_category) =
  match x with
  | AGENT_RFT -> `String "AgentRFT"
  | AGENT_RFT_EVALUATION -> `String "AgentRFTEvaluation"

let job_name_to_yojson = string_to_yojson

let create_job_request_to_yojson (x : create_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobConfigDocument", Some (job_config_document_to_yojson x.job_config_document));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let labeling_job_arn_to_yojson = string_to_yojson

let create_labeling_job_response_to_yojson (x : create_labeling_job_response) =
  assoc_to_yojson [ ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn)) ]

let max_concurrent_task_count_to_yojson = int_to_yojson
let task_availability_lifetime_in_seconds_to_yojson = int_to_yojson
let task_time_limit_in_seconds_to_yojson = int_to_yojson
let number_of_human_workers_per_data_object_to_yojson = int_to_yojson
let task_description_to_yojson = string_to_yojson
let task_title_to_yojson = string_to_yojson
let task_keyword_to_yojson = string_to_yojson
let task_keywords_to_yojson tree = list_to_yojson task_keyword_to_yojson tree

let ui_config_to_yojson (x : ui_config) =
  assoc_to_yojson
    [
      ("UiTemplateS3Uri", option_to_yojson s3_uri_to_yojson x.ui_template_s3_uri);
      ("HumanTaskUiArn", option_to_yojson human_task_ui_arn_to_yojson x.human_task_ui_arn);
    ]

let human_task_config_to_yojson (x : human_task_config) =
  assoc_to_yojson
    [
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("UiConfig", Some (ui_config_to_yojson x.ui_config));
      ( "PreHumanTaskLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.pre_human_task_lambda_arn );
      ("TaskKeywords", option_to_yojson task_keywords_to_yojson x.task_keywords);
      ("TaskTitle", Some (task_title_to_yojson x.task_title));
      ("TaskDescription", Some (task_description_to_yojson x.task_description));
      ( "NumberOfHumanWorkersPerDataObject",
        Some
          (number_of_human_workers_per_data_object_to_yojson
             x.number_of_human_workers_per_data_object) );
      ( "TaskTimeLimitInSeconds",
        Some (task_time_limit_in_seconds_to_yojson x.task_time_limit_in_seconds) );
      ( "TaskAvailabilityLifetimeInSeconds",
        option_to_yojson task_availability_lifetime_in_seconds_to_yojson
          x.task_availability_lifetime_in_seconds );
      ( "MaxConcurrentTaskCount",
        option_to_yojson max_concurrent_task_count_to_yojson x.max_concurrent_task_count );
      ( "AnnotationConsolidationConfig",
        option_to_yojson annotation_consolidation_config_to_yojson x.annotation_consolidation_config
      );
      ( "PublicWorkforceTaskPrice",
        option_to_yojson public_workforce_task_price_to_yojson x.public_workforce_task_price );
    ]

let labeling_job_resource_config_to_yojson (x : labeling_job_resource_config) =
  assoc_to_yojson
    [
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let model_arn_to_yojson = string_to_yojson
let labeling_job_algorithm_specification_arn_to_yojson = string_to_yojson

let labeling_job_algorithms_config_to_yojson (x : labeling_job_algorithms_config) =
  assoc_to_yojson
    [
      ( "LabelingJobAlgorithmSpecificationArn",
        Some
          (labeling_job_algorithm_specification_arn_to_yojson
             x.labeling_job_algorithm_specification_arn) );
      ( "InitialActiveLearningModelArn",
        option_to_yojson model_arn_to_yojson x.initial_active_learning_model_arn );
      ( "LabelingJobResourceConfig",
        option_to_yojson labeling_job_resource_config_to_yojson x.labeling_job_resource_config );
    ]

let max_percentage_of_input_dataset_labeled_to_yojson = int_to_yojson
let max_human_labeled_object_count_to_yojson = int_to_yojson

let labeling_job_stopping_conditions_to_yojson (x : labeling_job_stopping_conditions) =
  assoc_to_yojson
    [
      ( "MaxHumanLabeledObjectCount",
        option_to_yojson max_human_labeled_object_count_to_yojson x.max_human_labeled_object_count
      );
      ( "MaxPercentageOfInputDatasetLabeled",
        option_to_yojson max_percentage_of_input_dataset_labeled_to_yojson
          x.max_percentage_of_input_dataset_labeled );
    ]

let labeling_job_output_config_to_yojson (x : labeling_job_output_config) =
  assoc_to_yojson
    [
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("SnsTopicArn", option_to_yojson sns_topic_arn_to_yojson x.sns_topic_arn);
    ]

let labeling_job_data_attributes_to_yojson (x : labeling_job_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let labeling_job_sns_data_source_to_yojson (x : labeling_job_sns_data_source) =
  assoc_to_yojson [ ("SnsTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn)) ]

let labeling_job_s3_data_source_to_yojson (x : labeling_job_s3_data_source) =
  assoc_to_yojson [ ("ManifestS3Uri", Some (s3_uri_to_yojson x.manifest_s3_uri)) ]

let labeling_job_data_source_to_yojson (x : labeling_job_data_source) =
  assoc_to_yojson
    [
      ("S3DataSource", option_to_yojson labeling_job_s3_data_source_to_yojson x.s3_data_source);
      ("SnsDataSource", option_to_yojson labeling_job_sns_data_source_to_yojson x.sns_data_source);
    ]

let labeling_job_input_config_to_yojson (x : labeling_job_input_config) =
  assoc_to_yojson
    [
      ("DataSource", Some (labeling_job_data_source_to_yojson x.data_source));
      ("DataAttributes", option_to_yojson labeling_job_data_attributes_to_yojson x.data_attributes);
    ]

let label_attribute_name_to_yojson = string_to_yojson
let labeling_job_name_to_yojson = string_to_yojson

let create_labeling_job_request_to_yojson (x : create_labeling_job_request) =
  assoc_to_yojson
    [
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
      ("LabelAttributeName", Some (label_attribute_name_to_yojson x.label_attribute_name));
      ("InputConfig", Some (labeling_job_input_config_to_yojson x.input_config));
      ("OutputConfig", Some (labeling_job_output_config_to_yojson x.output_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("LabelCategoryConfigS3Uri", option_to_yojson s3_uri_to_yojson x.label_category_config_s3_uri);
      ( "StoppingConditions",
        option_to_yojson labeling_job_stopping_conditions_to_yojson x.stopping_conditions );
      ( "LabelingJobAlgorithmsConfig",
        option_to_yojson labeling_job_algorithms_config_to_yojson x.labeling_job_algorithms_config
      );
      ("HumanTaskConfig", Some (human_task_config_to_yojson x.human_task_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let mlflow_app_arn_to_yojson = string_to_yojson

let create_mlflow_app_response_to_yojson (x : create_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let default_domain_id_list_to_yojson tree = list_to_yojson domain_id_to_yojson tree
let weekly_maintenance_window_start_to_yojson = string_to_yojson

let model_registration_mode_to_yojson (x : model_registration_mode) =
  match x with
  | AUTO_MODEL_REGISTRATION_ENABLED -> `String "AutoModelRegistrationEnabled"
  | AUTO_MODEL_REGISTRATION_DISABLED -> `String "AutoModelRegistrationDisabled"

let mlflow_app_name_to_yojson = string_to_yojson

let create_mlflow_app_request_to_yojson (x : create_mlflow_app_request) =
  assoc_to_yojson
    [
      ("Name", Some (mlflow_app_name_to_yojson x.name));
      ("ArtifactStoreUri", Some (s3_uri_to_yojson x.artifact_store_uri));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let tracking_server_arn_to_yojson = string_to_yojson

let create_mlflow_tracking_server_response_to_yojson (x : create_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let mlflow_version_to_yojson = string_to_yojson

let tracking_server_size_to_yojson (x : tracking_server_size) =
  match x with S -> `String "Small" | M -> `String "Medium" | L -> `String "Large"

let tracking_server_name_to_yojson = string_to_yojson

let create_mlflow_tracking_server_request_to_yojson (x : create_mlflow_tracking_server_request) =
  assoc_to_yojson
    [
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
      ("ArtifactStoreUri", Some (s3_uri_to_yojson x.artifact_store_uri));
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
    ]

let create_model_output_to_yojson (x : create_model_output) =
  assoc_to_yojson [ ("ModelArn", Some (model_arn_to_yojson x.model_arn)) ]

let inference_execution_mode_to_yojson (x : inference_execution_mode) =
  match x with SERIAL -> `String "Serial" | DIRECT -> `String "Direct"

let inference_execution_config_to_yojson (x : inference_execution_config) =
  assoc_to_yojson [ ("Mode", Some (inference_execution_mode_to_yojson x.mode)) ]

let create_model_input_to_yojson (x : create_model_input) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
    ]

let create_model_bias_job_definition_response_to_yojson
    (x : create_model_bias_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let monitoring_ground_truth_s3_input_to_yojson (x : monitoring_ground_truth_s3_input) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson monitoring_s3_uri_to_yojson x.s3_uri) ]

let model_bias_job_input_to_yojson (x : model_bias_job_input) =
  assoc_to_yojson
    [
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ( "GroundTruthS3Input",
        Some (monitoring_ground_truth_s3_input_to_yojson x.ground_truth_s3_input) );
    ]

let model_bias_app_specification_to_yojson (x : model_bias_app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ConfigUri", Some (s3_uri_to_yojson x.config_uri));
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
    ]

let model_bias_baseline_config_to_yojson (x : model_bias_baseline_config) =
  assoc_to_yojson
    [
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
    ]

let create_model_bias_job_definition_request_to_yojson
    (x : create_model_bias_job_definition_request) =
  assoc_to_yojson
    [
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ( "ModelBiasBaselineConfig",
        option_to_yojson model_bias_baseline_config_to_yojson x.model_bias_baseline_config );
      ( "ModelBiasAppSpecification",
        Some (model_bias_app_specification_to_yojson x.model_bias_app_specification) );
      ("ModelBiasJobInput", Some (model_bias_job_input_to_yojson x.model_bias_job_input));
      ( "ModelBiasJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_bias_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let model_card_arn_to_yojson = string_to_yojson

let create_model_card_response_to_yojson (x : create_model_card_response) =
  assoc_to_yojson [ ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn)) ]

let model_card_status_to_yojson (x : model_card_status) =
  match x with
  | DRAFT -> `String "Draft"
  | PENDINGREVIEW -> `String "PendingReview"
  | APPROVED -> `String "Approved"
  | ARCHIVED -> `String "Archived"

let model_card_content_to_yojson = string_to_yojson

let model_card_security_config_to_yojson (x : model_card_security_config) =
  assoc_to_yojson [ ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id) ]

let create_model_card_request_to_yojson (x : create_model_card_request) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("Content", Some (model_card_content_to_yojson x.content));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let model_card_export_job_arn_to_yojson = string_to_yojson

let create_model_card_export_job_response_to_yojson (x : create_model_card_export_job_response) =
  assoc_to_yojson
    [
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
    ]

let model_card_export_output_config_to_yojson (x : model_card_export_output_config) =
  assoc_to_yojson [ ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path)) ]

let model_card_name_or_arn_to_yojson = string_to_yojson

let create_model_card_export_job_request_to_yojson (x : create_model_card_export_job_request) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
      ("OutputConfig", Some (model_card_export_output_config_to_yojson x.output_config));
    ]

let create_model_explainability_job_definition_response_to_yojson
    (x : create_model_explainability_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let model_explainability_job_input_to_yojson (x : model_explainability_job_input) =
  assoc_to_yojson
    [
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
    ]

let model_explainability_app_specification_to_yojson (x : model_explainability_app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ConfigUri", Some (s3_uri_to_yojson x.config_uri));
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
    ]

let model_explainability_baseline_config_to_yojson (x : model_explainability_baseline_config) =
  assoc_to_yojson
    [
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
    ]

let create_model_explainability_job_definition_request_to_yojson
    (x : create_model_explainability_job_definition_request) =
  assoc_to_yojson
    [
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ( "ModelExplainabilityBaselineConfig",
        option_to_yojson model_explainability_baseline_config_to_yojson
          x.model_explainability_baseline_config );
      ( "ModelExplainabilityAppSpecification",
        Some
          (model_explainability_app_specification_to_yojson x.model_explainability_app_specification)
      );
      ( "ModelExplainabilityJobInput",
        Some (model_explainability_job_input_to_yojson x.model_explainability_job_input) );
      ( "ModelExplainabilityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_explainability_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_model_package_output_to_yojson (x : create_model_package_output) =
  assoc_to_yojson [ ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn)) ]

let managed_storage_type_to_yojson (x : managed_storage_type) =
  match x with RESTRICTED -> `String "Restricted"

let stage_description_to_yojson = string_to_yojson

let model_life_cycle_to_yojson (x : model_life_cycle) =
  assoc_to_yojson
    [
      ("Stage", Some (entity_name_to_yojson x.stage));
      ("StageStatus", Some (entity_name_to_yojson x.stage_status));
      ("StageDescription", option_to_yojson stage_description_to_yojson x.stage_description);
    ]

let model_package_model_card_to_yojson (x : model_package_model_card) =
  assoc_to_yojson
    [
      ("ModelCardContent", option_to_yojson model_card_content_to_yojson x.model_card_content);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
    ]

let model_package_security_config_to_yojson (x : model_package_security_config) =
  assoc_to_yojson [ ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id)) ]

let model_package_source_uri_to_yojson = string_to_yojson

let skip_model_validation_to_yojson (x : skip_model_validation) =
  match x with ALL -> `String "All" | NONE -> `String "None"

let drift_check_model_data_quality_to_yojson (x : drift_check_model_data_quality) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
    ]

let drift_check_model_quality_to_yojson (x : drift_check_model_quality) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
    ]

let file_source_to_yojson (x : file_source) =
  assoc_to_yojson
    [
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("ContentDigest", option_to_yojson content_digest_to_yojson x.content_digest);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let drift_check_explainability_to_yojson (x : drift_check_explainability) =
  assoc_to_yojson
    [
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
      ("ConfigFile", option_to_yojson file_source_to_yojson x.config_file);
    ]

let drift_check_bias_to_yojson (x : drift_check_bias) =
  assoc_to_yojson
    [
      ("ConfigFile", option_to_yojson file_source_to_yojson x.config_file);
      ( "PreTrainingConstraints",
        option_to_yojson metrics_source_to_yojson x.pre_training_constraints );
      ( "PostTrainingConstraints",
        option_to_yojson metrics_source_to_yojson x.post_training_constraints );
    ]

let drift_check_baselines_to_yojson (x : drift_check_baselines) =
  assoc_to_yojson
    [
      ("Bias", option_to_yojson drift_check_bias_to_yojson x.bias);
      ("Explainability", option_to_yojson drift_check_explainability_to_yojson x.explainability);
      ("ModelQuality", option_to_yojson drift_check_model_quality_to_yojson x.model_quality);
      ( "ModelDataQuality",
        option_to_yojson drift_check_model_data_quality_to_yojson x.model_data_quality );
    ]

let customer_metadata_value_to_yojson = string_to_yojson
let customer_metadata_key_to_yojson = string_to_yojson

let customer_metadata_map_to_yojson tree =
  map_to_yojson customer_metadata_key_to_yojson customer_metadata_value_to_yojson tree

let explainability_to_yojson (x : explainability) =
  assoc_to_yojson [ ("Report", option_to_yojson metrics_source_to_yojson x.report) ]

let model_data_quality_to_yojson (x : model_data_quality) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
    ]

let model_quality_to_yojson (x : model_quality) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
    ]

let model_metrics_to_yojson (x : model_metrics) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ("ModelDataQuality", option_to_yojson model_data_quality_to_yojson x.model_data_quality);
      ("Bias", option_to_yojson bias_to_yojson x.bias);
      ("Explainability", option_to_yojson explainability_to_yojson x.explainability);
    ]

let source_algorithm_to_yojson (x : source_algorithm) =
  assoc_to_yojson
    [
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ("ModelDataETag", option_to_yojson string__to_yojson x.model_data_e_tag);
      ("AlgorithmName", Some (arn_or_name_to_yojson x.algorithm_name));
    ]

let source_algorithm_list_to_yojson tree = list_to_yojson source_algorithm_to_yojson tree

let source_algorithm_specification_to_yojson (x : source_algorithm_specification) =
  assoc_to_yojson
    [ ("SourceAlgorithms", Some (source_algorithm_list_to_yojson x.source_algorithms)) ]

let model_package_validation_profile_to_yojson (x : model_package_validation_profile) =
  assoc_to_yojson
    [
      ("ProfileName", Some (entity_name_to_yojson x.profile_name));
      ( "TransformJobDefinition",
        Some (transform_job_definition_to_yojson x.transform_job_definition) );
    ]

let model_package_validation_profiles_to_yojson tree =
  list_to_yojson model_package_validation_profile_to_yojson tree

let model_package_validation_specification_to_yojson (x : model_package_validation_specification) =
  assoc_to_yojson
    [
      ("ValidationRole", Some (role_arn_to_yojson x.validation_role));
      ( "ValidationProfiles",
        Some (model_package_validation_profiles_to_yojson x.validation_profiles) );
    ]

let create_model_package_input_to_yojson (x : create_model_package_input) =
  assoc_to_yojson
    [
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
      ("ModelPackageGroupName", option_to_yojson arn_or_name_to_yojson x.model_package_group_name);
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
    ]

let model_package_group_arn_to_yojson = string_to_yojson

let create_model_package_group_output_to_yojson (x : create_model_package_group_output) =
  assoc_to_yojson
    [ ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn)) ]

let managed_configuration_to_yojson (x : managed_configuration) =
  assoc_to_yojson
    [
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
    ]

let create_model_package_group_input_to_yojson (x : create_model_package_group_input) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
    ]

let create_model_quality_job_definition_response_to_yojson
    (x : create_model_quality_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let model_quality_job_input_to_yojson (x : model_quality_job_input) =
  assoc_to_yojson
    [
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ( "GroundTruthS3Input",
        Some (monitoring_ground_truth_s3_input_to_yojson x.ground_truth_s3_input) );
    ]

let monitoring_problem_type_to_yojson (x : monitoring_problem_type) =
  match x with
  | BINARY_CLASSIFICATION -> `String "BinaryClassification"
  | MULTICLASS_CLASSIFICATION -> `String "MulticlassClassification"
  | REGRESSION -> `String "Regression"

let model_quality_app_specification_to_yojson (x : model_quality_app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
      ("ProblemType", option_to_yojson monitoring_problem_type_to_yojson x.problem_type);
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
    ]

let model_quality_baseline_config_to_yojson (x : model_quality_baseline_config) =
  assoc_to_yojson
    [
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
    ]

let create_model_quality_job_definition_request_to_yojson
    (x : create_model_quality_job_definition_request) =
  assoc_to_yojson
    [
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ( "ModelQualityBaselineConfig",
        option_to_yojson model_quality_baseline_config_to_yojson x.model_quality_baseline_config );
      ( "ModelQualityAppSpecification",
        Some (model_quality_app_specification_to_yojson x.model_quality_app_specification) );
      ("ModelQualityJobInput", Some (model_quality_job_input_to_yojson x.model_quality_job_input));
      ( "ModelQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_quality_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let monitoring_schedule_arn_to_yojson = string_to_yojson

let create_monitoring_schedule_response_to_yojson (x : create_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let monitoring_type_to_yojson (x : monitoring_type) =
  match x with
  | DATA_QUALITY -> `String "DataQuality"
  | MODEL_QUALITY -> `String "ModelQuality"
  | MODEL_BIAS -> `String "ModelBias"
  | MODEL_EXPLAINABILITY -> `String "ModelExplainability"

let network_config_to_yojson (x : network_config) =
  assoc_to_yojson
    [
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let monitoring_app_specification_to_yojson (x : monitoring_app_specification) =
  assoc_to_yojson
    [
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
    ]

let monitoring_input_to_yojson (x : monitoring_input) =
  assoc_to_yojson
    [
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
    ]

let monitoring_inputs_to_yojson tree = list_to_yojson monitoring_input_to_yojson tree

let monitoring_baseline_config_to_yojson (x : monitoring_baseline_config) =
  assoc_to_yojson
    [
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ( "StatisticsResource",
        option_to_yojson monitoring_statistics_resource_to_yojson x.statistics_resource );
    ]

let monitoring_job_definition_to_yojson (x : monitoring_job_definition) =
  assoc_to_yojson
    [
      ("BaselineConfig", option_to_yojson monitoring_baseline_config_to_yojson x.baseline_config);
      ("MonitoringInputs", Some (monitoring_inputs_to_yojson x.monitoring_inputs));
      ( "MonitoringOutputConfig",
        Some (monitoring_output_config_to_yojson x.monitoring_output_config) );
      ("MonitoringResources", Some (monitoring_resources_to_yojson x.monitoring_resources));
      ( "MonitoringAppSpecification",
        Some (monitoring_app_specification_to_yojson x.monitoring_app_specification) );
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
    ]

let schedule_expression_to_yojson = string_to_yojson

let schedule_config_to_yojson (x : schedule_config) =
  assoc_to_yojson
    [
      ("ScheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
      ("DataAnalysisStartTime", option_to_yojson string__to_yojson x.data_analysis_start_time);
      ("DataAnalysisEndTime", option_to_yojson string__to_yojson x.data_analysis_end_time);
    ]

let monitoring_schedule_config_to_yojson (x : monitoring_schedule_config) =
  assoc_to_yojson
    [
      ("ScheduleConfig", option_to_yojson schedule_config_to_yojson x.schedule_config);
      ( "MonitoringJobDefinition",
        option_to_yojson monitoring_job_definition_to_yojson x.monitoring_job_definition );
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
    ]

let monitoring_schedule_name_to_yojson = string_to_yojson

let create_monitoring_schedule_request_to_yojson (x : create_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let notebook_instance_arn_to_yojson = string_to_yojson

let create_notebook_instance_output_to_yojson (x : create_notebook_instance_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceArn",
        option_to_yojson notebook_instance_arn_to_yojson x.notebook_instance_arn );
    ]

let minimum_instance_metadata_service_version_to_yojson = string_to_yojson

let instance_metadata_service_configuration_to_yojson (x : instance_metadata_service_configuration)
    =
  assoc_to_yojson
    [
      ( "MinimumInstanceMetadataServiceVersion",
        Some
          (minimum_instance_metadata_service_version_to_yojson
             x.minimum_instance_metadata_service_version) );
    ]

let platform_identifier_to_yojson = string_to_yojson

let root_access_to_yojson (x : root_access) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let notebook_instance_accelerator_type_to_yojson (x : notebook_instance_accelerator_type) =
  match x with
  | ML_EIA1_MEDIUM -> `String "ml.eia1.medium"
  | ML_EIA1_LARGE -> `String "ml.eia1.large"
  | ML_EIA1_XLARGE -> `String "ml.eia1.xlarge"
  | ML_EIA2_MEDIUM -> `String "ml.eia2.medium"
  | ML_EIA2_LARGE -> `String "ml.eia2.large"
  | ML_EIA2_XLARGE -> `String "ml.eia2.xlarge"

let notebook_instance_accelerator_types_to_yojson tree =
  list_to_yojson notebook_instance_accelerator_type_to_yojson tree

let notebook_instance_volume_size_in_g_b_to_yojson = int_to_yojson

let direct_internet_access_to_yojson (x : direct_internet_access) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let notebook_instance_lifecycle_config_name_to_yojson = string_to_yojson

let instance_type_to_yojson (x : instance_type) =
  match x with
  | ML_T2_MEDIUM -> `String "ml.t2.medium"
  | ML_T2_LARGE -> `String "ml.t2.large"
  | ML_T2_XLARGE -> `String "ml.t2.xlarge"
  | ML_T2_2XLARGE -> `String "ml.t2.2xlarge"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_8XLARGE -> `String "ml.m5d.8xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_16XLARGE -> `String "ml.m5d.16xlarge"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5D_XLARGE -> `String "ml.c5d.xlarge"
  | ML_C5D_2XLARGE -> `String "ml.c5d.2xlarge"
  | ML_C5D_4XLARGE -> `String "ml.c5d.4xlarge"
  | ML_C5D_9XLARGE -> `String "ml.c5d.9xlarge"
  | ML_C5D_18XLARGE -> `String "ml.c5d.18xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_INF1_XLARGE -> `String "ml.inf1.xlarge"
  | ML_INF1_2XLARGE -> `String "ml.inf1.2xlarge"
  | ML_INF1_6XLARGE -> `String "ml.inf1.6xlarge"
  | ML_INF1_24XLARGE -> `String "ml.inf1.24xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_M6ID_LARGE -> `String "ml.m6id.large"
  | ML_M6ID_XLARGE -> `String "ml.m6id.xlarge"
  | ML_M6ID_2XLARGE -> `String "ml.m6id.2xlarge"
  | ML_M6ID_4XLARGE -> `String "ml.m6id.4xlarge"
  | ML_M6ID_8XLARGE -> `String "ml.m6id.8xlarge"
  | ML_M6ID_12XLARGE -> `String "ml.m6id.12xlarge"
  | ML_M6ID_16XLARGE -> `String "ml.m6id.16xlarge"
  | ML_M6ID_24XLARGE -> `String "ml.m6id.24xlarge"
  | ML_M6ID_32XLARGE -> `String "ml.m6id.32xlarge"
  | ML_C6ID_LARGE -> `String "ml.c6id.large"
  | ML_C6ID_XLARGE -> `String "ml.c6id.xlarge"
  | ML_C6ID_2XLARGE -> `String "ml.c6id.2xlarge"
  | ML_C6ID_4XLARGE -> `String "ml.c6id.4xlarge"
  | ML_C6ID_8XLARGE -> `String "ml.c6id.8xlarge"
  | ML_C6ID_12XLARGE -> `String "ml.c6id.12xlarge"
  | ML_C6ID_16XLARGE -> `String "ml.c6id.16xlarge"
  | ML_C6ID_24XLARGE -> `String "ml.c6id.24xlarge"
  | ML_C6ID_32XLARGE -> `String "ml.c6id.32xlarge"
  | ML_R6ID_LARGE -> `String "ml.r6id.large"
  | ML_R6ID_XLARGE -> `String "ml.r6id.xlarge"
  | ML_R6ID_2XLARGE -> `String "ml.r6id.2xlarge"
  | ML_R6ID_4XLARGE -> `String "ml.r6id.4xlarge"
  | ML_R6ID_8XLARGE -> `String "ml.r6id.8xlarge"
  | ML_R6ID_12XLARGE -> `String "ml.r6id.12xlarge"
  | ML_R6ID_16XLARGE -> `String "ml.r6id.16xlarge"
  | ML_R6ID_24XLARGE -> `String "ml.r6id.24xlarge"
  | ML_R6ID_32XLARGE -> `String "ml.r6id.32xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"

let notebook_instance_name_to_yojson = string_to_yojson

let create_notebook_instance_input_to_yojson (x : create_notebook_instance_input) =
  assoc_to_yojson
    [
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "LifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson x.lifecycle_config_name
      );
      ( "DirectInternetAccess",
        option_to_yojson direct_internet_access_to_yojson x.direct_internet_access );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
    ]

let notebook_instance_lifecycle_config_arn_to_yojson = string_to_yojson

let create_notebook_instance_lifecycle_config_output_to_yojson
    (x : create_notebook_instance_lifecycle_config_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigArn",
        option_to_yojson notebook_instance_lifecycle_config_arn_to_yojson
          x.notebook_instance_lifecycle_config_arn );
    ]

let notebook_instance_lifecycle_config_content_to_yojson = string_to_yojson

let notebook_instance_lifecycle_hook_to_yojson (x : notebook_instance_lifecycle_hook) =
  assoc_to_yojson
    [ ("Content", option_to_yojson notebook_instance_lifecycle_config_content_to_yojson x.content) ]

let notebook_instance_lifecycle_config_list_to_yojson tree =
  list_to_yojson notebook_instance_lifecycle_hook_to_yojson tree

let create_notebook_instance_lifecycle_config_input_to_yojson
    (x : create_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let optimization_job_arn_to_yojson = string_to_yojson

let create_optimization_job_response_to_yojson (x : create_optimization_job_response) =
  assoc_to_yojson
    [ ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn)) ]

let optimization_vpc_subnet_id_to_yojson = string_to_yojson

let optimization_vpc_subnets_to_yojson tree =
  list_to_yojson optimization_vpc_subnet_id_to_yojson tree

let optimization_vpc_security_group_id_to_yojson = string_to_yojson

let optimization_vpc_security_group_ids_to_yojson tree =
  list_to_yojson optimization_vpc_security_group_id_to_yojson tree

let optimization_vpc_config_to_yojson (x : optimization_vpc_config) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (optimization_vpc_security_group_ids_to_yojson x.security_group_ids));
      ("Subnets", Some (optimization_vpc_subnets_to_yojson x.subnets));
    ]

let optimization_sage_maker_model_to_yojson (x : optimization_sage_maker_model) =
  assoc_to_yojson [ ("ModelName", option_to_yojson model_name_to_yojson x.model_name) ]

let optimization_job_output_config_to_yojson (x : optimization_job_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("SageMakerModel", option_to_yojson optimization_sage_maker_model_to_yojson x.sage_maker_model);
    ]

let model_speculative_decoding_s3_data_type_to_yojson (x : model_speculative_decoding_s3_data_type)
    =
  match x with S3Prefix -> `String "S3Prefix" | ManifestFile -> `String "ManifestFile"

let model_speculative_decoding_training_data_source_to_yojson
    (x : model_speculative_decoding_training_data_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (model_speculative_decoding_s3_data_type_to_yojson x.s3_data_type));
    ]

let model_speculative_decoding_technique_to_yojson (x : model_speculative_decoding_technique) =
  match x with EAGLE -> `String "EAGLE"

let model_speculative_decoding_config_to_yojson (x : model_speculative_decoding_config) =
  assoc_to_yojson
    [
      ("Technique", Some (model_speculative_decoding_technique_to_yojson x.technique));
      ( "TrainingDataSource",
        option_to_yojson model_speculative_decoding_training_data_source_to_yojson
          x.training_data_source );
    ]

let optimization_job_environment_variables_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string256_to_yojson tree

let optimization_container_image_to_yojson = string_to_yojson

let model_sharding_config_to_yojson (x : model_sharding_config) =
  assoc_to_yojson
    [
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
    ]

let model_compilation_config_to_yojson (x : model_compilation_config) =
  assoc_to_yojson
    [
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
    ]

let model_quantization_config_to_yojson (x : model_quantization_config) =
  assoc_to_yojson
    [
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
    ]

let optimization_config_to_yojson (x : optimization_config) =
  match x with
  | ModelQuantizationConfig arg ->
      assoc_to_yojson
        [ ("ModelQuantizationConfig", Some (model_quantization_config_to_yojson arg)) ]
  | ModelCompilationConfig arg ->
      assoc_to_yojson [ ("ModelCompilationConfig", Some (model_compilation_config_to_yojson arg)) ]
  | ModelShardingConfig arg ->
      assoc_to_yojson [ ("ModelShardingConfig", Some (model_sharding_config_to_yojson arg)) ]
  | ModelSpeculativeDecodingConfig arg ->
      assoc_to_yojson
        [
          ("ModelSpeculativeDecodingConfig", Some (model_speculative_decoding_config_to_yojson arg));
        ]

let optimization_configs_to_yojson tree = list_to_yojson optimization_config_to_yojson tree
let optimization_job_max_instance_count_to_yojson = int_to_yojson

let optimization_job_deployment_instance_type_to_yojson
    (x : optimization_job_deployment_instance_type) =
  match x with
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"

let optimization_model_accept_eula_to_yojson = bool_to_yojson

let optimization_model_access_config_to_yojson (x : optimization_model_access_config) =
  assoc_to_yojson [ ("AcceptEula", Some (optimization_model_accept_eula_to_yojson x.accept_eula)) ]

let optimization_job_model_source_s3_to_yojson (x : optimization_job_model_source_s3) =
  assoc_to_yojson
    [
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ( "ModelAccessConfig",
        option_to_yojson optimization_model_access_config_to_yojson x.model_access_config );
    ]

let optimization_job_model_source_to_yojson (x : optimization_job_model_source) =
  assoc_to_yojson
    [
      ("S3", option_to_yojson optimization_job_model_source_s3_to_yojson x.s3);
      ("SageMakerModel", option_to_yojson optimization_sage_maker_model_to_yojson x.sage_maker_model);
    ]

let create_optimization_job_request_to_yojson (x : create_optimization_job_request) =
  assoc_to_yojson
    [
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ModelSource", Some (optimization_job_model_source_to_yojson x.model_source));
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ( "OptimizationEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.optimization_environment
      );
      ("OptimizationConfigs", Some (optimization_configs_to_yojson x.optimization_configs));
      ("OutputConfig", Some (optimization_job_output_config_to_yojson x.output_config));
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson optimization_vpc_config_to_yojson x.vpc_config);
    ]

let partner_app_arn_to_yojson = string_to_yojson

let create_partner_app_response_to_yojson (x : create_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let partner_app_auth_type_to_yojson (x : partner_app_auth_type) =
  match x with IAM -> `String "IAM"

let group_patterns_list_to_yojson tree = list_to_yojson group_name_pattern_to_yojson tree

let role_group_assignment_to_yojson (x : role_group_assignment) =
  assoc_to_yojson
    [
      ("RoleName", Some (non_empty_string256_to_yojson x.role_name));
      ("GroupPatterns", Some (group_patterns_list_to_yojson x.group_patterns));
    ]

let role_group_assignments_list_to_yojson tree = list_to_yojson role_group_assignment_to_yojson tree

let partner_app_arguments_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string1024_to_yojson tree

let partner_app_admin_user_list_to_yojson tree = list_to_yojson non_empty_string256_to_yojson tree

let partner_app_config_to_yojson (x : partner_app_config) =
  assoc_to_yojson
    [
      ("AdminUsers", option_to_yojson partner_app_admin_user_list_to_yojson x.admin_users);
      ("Arguments", option_to_yojson partner_app_arguments_to_yojson x.arguments);
      ( "AssignedGroupPatterns",
        option_to_yojson assigned_group_patterns_list_to_yojson x.assigned_group_patterns );
      ( "RoleGroupAssignments",
        option_to_yojson role_group_assignments_list_to_yojson x.role_group_assignments );
    ]

let weekly_schedule_time_format_to_yojson = string_to_yojson

let partner_app_maintenance_config_to_yojson (x : partner_app_maintenance_config) =
  assoc_to_yojson
    [
      ( "MaintenanceWindowStart",
        option_to_yojson weekly_schedule_time_format_to_yojson x.maintenance_window_start );
    ]

let partner_app_type_to_yojson (x : partner_app_type) =
  match x with
  | LAKERA_GUARD -> `String "lakera-guard"
  | COMET -> `String "comet"
  | DEEPCHECKS_LLM_EVALUATION -> `String "deepchecks-llm-evaluation"
  | FIDDLER -> `String "fiddler"

let partner_app_name_to_yojson = string_to_yojson

let create_partner_app_request_to_yojson (x : create_partner_app_request) =
  assoc_to_yojson
    [
      ("Name", Some (partner_app_name_to_yojson x.name));
      ("Type", Some (partner_app_type_to_yojson x.type_));
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("Tier", Some (non_empty_string64_to_yojson x.tier));
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ("AuthType", Some (partner_app_auth_type_to_yojson x.auth_type));
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_partner_app_presigned_url_response_to_yojson
    (x : create_partner_app_presigned_url_response) =
  assoc_to_yojson [ ("Url", option_to_yojson string2048_to_yojson x.url) ]

let session_expiration_duration_in_seconds_to_yojson = int_to_yojson
let expires_in_seconds_to_yojson = int_to_yojson

let create_partner_app_presigned_url_request_to_yojson
    (x : create_partner_app_presigned_url_request) =
  assoc_to_yojson
    [
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
    ]

let pipeline_arn_to_yojson = string_to_yojson

let create_pipeline_response_to_yojson (x : create_pipeline_response) =
  assoc_to_yojson [ ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn) ]

let max_parallel_execution_steps_to_yojson = int_to_yojson

let parallelism_configuration_to_yojson (x : parallelism_configuration) =
  assoc_to_yojson
    [
      ( "MaxParallelExecutionSteps",
        Some (max_parallel_execution_steps_to_yojson x.max_parallel_execution_steps) );
    ]

let idempotency_token_to_yojson = string_to_yojson
let pipeline_description_to_yojson = string_to_yojson
let version_id_to_yojson = string_to_yojson
let key_to_yojson = string_to_yojson

let pipeline_definition_s3_location_to_yojson (x : pipeline_definition_s3_location) =
  assoc_to_yojson
    [
      ("Bucket", Some (bucket_name_to_yojson x.bucket));
      ("ObjectKey", Some (key_to_yojson x.object_key));
      ("VersionId", option_to_yojson version_id_to_yojson x.version_id);
    ]

let pipeline_definition_to_yojson = string_to_yojson
let pipeline_name_to_yojson = string_to_yojson

let create_pipeline_request_to_yojson (x : create_pipeline_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ( "PipelineDefinitionS3Location",
        option_to_yojson pipeline_definition_s3_location_to_yojson x.pipeline_definition_s3_location
      );
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
    ]

let presigned_domain_url_to_yojson = string_to_yojson

let create_presigned_domain_url_response_to_yojson (x : create_presigned_domain_url_response) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson presigned_domain_url_to_yojson x.authorized_url) ]

let create_presigned_domain_url_request_to_yojson (x : create_presigned_domain_url_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("LandingUri", option_to_yojson landing_uri_to_yojson x.landing_uri);
    ]

let mlflow_app_url_to_yojson = string_to_yojson

let create_presigned_mlflow_app_url_response_to_yojson
    (x : create_presigned_mlflow_app_url_response) =
  assoc_to_yojson [ ("AuthorizedUrl", option_to_yojson mlflow_app_url_to_yojson x.authorized_url) ]

let create_presigned_mlflow_app_url_request_to_yojson (x : create_presigned_mlflow_app_url_request)
    =
  assoc_to_yojson
    [
      ("Arn", Some (mlflow_app_arn_to_yojson x.arn));
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
    ]

let tracking_server_url_to_yojson = string_to_yojson

let create_presigned_mlflow_tracking_server_url_response_to_yojson
    (x : create_presigned_mlflow_tracking_server_url_response) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson tracking_server_url_to_yojson x.authorized_url) ]

let create_presigned_mlflow_tracking_server_url_request_to_yojson
    (x : create_presigned_mlflow_tracking_server_url_request) =
  assoc_to_yojson
    [
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
    ]

let notebook_instance_url_to_yojson = string_to_yojson

let create_presigned_notebook_instance_url_output_to_yojson
    (x : create_presigned_notebook_instance_url_output) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson notebook_instance_url_to_yojson x.authorized_url) ]

let create_presigned_notebook_instance_url_input_to_yojson
    (x : create_presigned_notebook_instance_url_input) =
  assoc_to_yojson
    [
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
    ]

let processing_job_arn_to_yojson = string_to_yojson

let create_processing_job_response_to_yojson (x : create_processing_job_response) =
  assoc_to_yojson [ ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn)) ]

let experiment_config_to_yojson (x : experiment_config) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ( "TrialComponentDisplayName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_display_name );
      ("RunName", option_to_yojson experiment_entity_name_to_yojson x.run_name);
    ]

let processing_environment_map_to_yojson tree =
  map_to_yojson processing_environment_key_to_yojson processing_environment_value_to_yojson tree

let processing_max_runtime_in_seconds_to_yojson = int_to_yojson

let processing_stopping_condition_to_yojson (x : processing_stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        Some (processing_max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds) );
    ]

let processing_cluster_config_to_yojson (x : processing_cluster_config) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (processing_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (processing_instance_type_to_yojson x.instance_type));
      ("VolumeSizeInGB", Some (processing_volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
    ]

let processing_resources_to_yojson (x : processing_resources) =
  assoc_to_yojson [ ("ClusterConfig", Some (processing_cluster_config_to_yojson x.cluster_config)) ]

let processing_feature_store_output_to_yojson (x : processing_feature_store_output) =
  assoc_to_yojson [ ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name)) ]

let processing_s3_output_to_yojson (x : processing_s3_output) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ("S3UploadMode", Some (processing_s3_upload_mode_to_yojson x.s3_upload_mode));
    ]

let processing_output_to_yojson (x : processing_output) =
  assoc_to_yojson
    [
      ("OutputName", Some (string__to_yojson x.output_name));
      ("S3Output", option_to_yojson processing_s3_output_to_yojson x.s3_output);
      ( "FeatureStoreOutput",
        option_to_yojson processing_feature_store_output_to_yojson x.feature_store_output );
      ("AppManaged", option_to_yojson app_managed_to_yojson x.app_managed);
    ]

let processing_outputs_to_yojson tree = list_to_yojson processing_output_to_yojson tree

let processing_output_config_to_yojson (x : processing_output_config) =
  assoc_to_yojson
    [
      ("Outputs", Some (processing_outputs_to_yojson x.outputs));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let input_mode_to_yojson (x : input_mode) =
  match x with PIPE -> `String "Pipe" | FILE -> `String "File"

let data_distribution_type_to_yojson (x : data_distribution_type) =
  match x with
  | FULLYREPLICATED -> `String "FullyReplicated"
  | SHARDEDBYS3KEY -> `String "ShardedByS3Key"

let redshift_result_compression_type_to_yojson (x : redshift_result_compression_type) =
  match x with
  | NONE -> `String "None"
  | GZIP -> `String "GZIP"
  | BZIP2 -> `String "BZIP2"
  | ZSTD -> `String "ZSTD"
  | SNAPPY -> `String "SNAPPY"

let redshift_result_format_to_yojson (x : redshift_result_format) =
  match x with PARQUET -> `String "PARQUET" | CSV -> `String "CSV"

let redshift_query_string_to_yojson = string_to_yojson
let redshift_user_name_to_yojson = string_to_yojson
let redshift_database_to_yojson = string_to_yojson
let redshift_cluster_id_to_yojson = string_to_yojson

let redshift_dataset_definition_to_yojson (x : redshift_dataset_definition) =
  assoc_to_yojson
    [
      ("ClusterId", Some (redshift_cluster_id_to_yojson x.cluster_id));
      ("Database", Some (redshift_database_to_yojson x.database));
      ("DbUser", Some (redshift_user_name_to_yojson x.db_user));
      ("QueryString", Some (redshift_query_string_to_yojson x.query_string));
      ("ClusterRoleArn", Some (role_arn_to_yojson x.cluster_role_arn));
      ("OutputS3Uri", Some (s3_uri_to_yojson x.output_s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputFormat", Some (redshift_result_format_to_yojson x.output_format));
      ( "OutputCompression",
        option_to_yojson redshift_result_compression_type_to_yojson x.output_compression );
    ]

let dataset_definition_to_yojson (x : dataset_definition) =
  assoc_to_yojson
    [
      ( "AthenaDatasetDefinition",
        option_to_yojson athena_dataset_definition_to_yojson x.athena_dataset_definition );
      ( "RedshiftDatasetDefinition",
        option_to_yojson redshift_dataset_definition_to_yojson x.redshift_dataset_definition );
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ( "DataDistributionType",
        option_to_yojson data_distribution_type_to_yojson x.data_distribution_type );
      ("InputMode", option_to_yojson input_mode_to_yojson x.input_mode);
    ]

let processing_s3_compression_type_to_yojson (x : processing_s3_compression_type) =
  match x with NONE -> `String "None" | GZIP -> `String "Gzip"

let processing_s3_data_type_to_yojson (x : processing_s3_data_type) =
  match x with MANIFEST_FILE -> `String "ManifestFile" | S3_PREFIX -> `String "S3Prefix"

let processing_s3_input_to_yojson (x : processing_s3_input) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ("S3DataType", Some (processing_s3_data_type_to_yojson x.s3_data_type));
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ( "S3CompressionType",
        option_to_yojson processing_s3_compression_type_to_yojson x.s3_compression_type );
    ]

let processing_input_to_yojson (x : processing_input) =
  assoc_to_yojson
    [
      ("InputName", Some (string__to_yojson x.input_name));
      ("AppManaged", option_to_yojson app_managed_to_yojson x.app_managed);
      ("S3Input", option_to_yojson processing_s3_input_to_yojson x.s3_input);
      ("DatasetDefinition", option_to_yojson dataset_definition_to_yojson x.dataset_definition);
    ]

let processing_inputs_to_yojson tree = list_to_yojson processing_input_to_yojson tree

let create_processing_job_request_to_yojson (x : create_processing_job_request) =
  assoc_to_yojson
    [
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
      ("ProcessingResources", Some (processing_resources_to_yojson x.processing_resources));
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("AppSpecification", Some (app_specification_to_yojson x.app_specification));
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
    ]

let project_id_to_yojson = string_to_yojson
let project_arn_to_yojson = string_to_yojson

let create_project_output_to_yojson (x : create_project_output) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("ProjectId", Some (project_id_to_yojson x.project_id));
    ]

let create_template_provider_to_yojson (x : create_template_provider) =
  assoc_to_yojson
    [
      ( "CfnTemplateProvider",
        option_to_yojson cfn_create_template_provider_to_yojson x.cfn_template_provider );
    ]

let create_template_provider_list_to_yojson tree =
  list_to_yojson create_template_provider_to_yojson tree

let provisioning_parameter_value_to_yojson = string_to_yojson
let provisioning_parameter_key_to_yojson = string_to_yojson

let provisioning_parameter_to_yojson (x : provisioning_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson provisioning_parameter_key_to_yojson x.key);
      ("Value", option_to_yojson provisioning_parameter_value_to_yojson x.value);
    ]

let provisioning_parameters_to_yojson tree = list_to_yojson provisioning_parameter_to_yojson tree
let service_catalog_entity_id_to_yojson = string_to_yojson

let service_catalog_provisioning_details_to_yojson (x : service_catalog_provisioning_details) =
  assoc_to_yojson
    [
      ("ProductId", Some (service_catalog_entity_id_to_yojson x.product_id));
      ( "ProvisioningArtifactId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioning_artifact_id );
      ("PathId", option_to_yojson service_catalog_entity_id_to_yojson x.path_id);
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
    ]

let project_entity_name_to_yojson = string_to_yojson

let create_project_input_to_yojson (x : create_project_input) =
  assoc_to_yojson
    [
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TemplateProviders",
        option_to_yojson create_template_provider_list_to_yojson x.template_providers );
    ]

let space_arn_to_yojson = string_to_yojson

let create_space_response_to_yojson (x : create_space_response) =
  assoc_to_yojson [ ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn) ]

let sharing_type_to_yojson (x : sharing_type) =
  match x with Private -> `String "Private" | Shared -> `String "Shared"

let space_sharing_settings_to_yojson (x : space_sharing_settings) =
  assoc_to_yojson [ ("SharingType", Some (sharing_type_to_yojson x.sharing_type)) ]

let ownership_settings_to_yojson (x : ownership_settings) =
  assoc_to_yojson
    [ ("OwnerUserProfileName", Some (user_profile_name_to_yojson x.owner_user_profile_name)) ]

let s3_file_system_to_yojson (x : s3_file_system) =
  assoc_to_yojson [ ("S3Uri", Some (s3_schema_uri_to_yojson x.s3_uri)) ]

let f_sx_lustre_file_system_to_yojson (x : f_sx_lustre_file_system) =
  assoc_to_yojson [ ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id)) ]

let efs_file_system_to_yojson (x : efs_file_system) =
  assoc_to_yojson [ ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id)) ]

let custom_file_system_to_yojson (x : custom_file_system) =
  match x with
  | EFSFileSystem arg -> assoc_to_yojson [ ("EFSFileSystem", Some (efs_file_system_to_yojson arg)) ]
  | FSxLustreFileSystem arg ->
      assoc_to_yojson [ ("FSxLustreFileSystem", Some (f_sx_lustre_file_system_to_yojson arg)) ]
  | S3FileSystem arg -> assoc_to_yojson [ ("S3FileSystem", Some (s3_file_system_to_yojson arg)) ]

let custom_file_systems_to_yojson tree = list_to_yojson custom_file_system_to_yojson tree

let ebs_storage_settings_to_yojson (x : ebs_storage_settings) =
  assoc_to_yojson
    [ ("EbsVolumeSizeInGb", Some (space_ebs_volume_size_in_gb_to_yojson x.ebs_volume_size_in_gb)) ]

let space_storage_settings_to_yojson (x : space_storage_settings) =
  assoc_to_yojson
    [
      ("EbsStorageSettings", option_to_yojson ebs_storage_settings_to_yojson x.ebs_storage_settings);
    ]

let space_idle_settings_to_yojson (x : space_idle_settings) =
  assoc_to_yojson
    [
      ( "IdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.idle_timeout_in_minutes );
    ]

let space_app_lifecycle_management_to_yojson (x : space_app_lifecycle_management) =
  assoc_to_yojson
    [ ("IdleSettings", option_to_yojson space_idle_settings_to_yojson x.idle_settings) ]

let space_jupyter_lab_app_settings_to_yojson (x : space_jupyter_lab_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
      ( "AppLifecycleManagement",
        option_to_yojson space_app_lifecycle_management_to_yojson x.app_lifecycle_management );
    ]

let space_code_editor_app_settings_to_yojson (x : space_code_editor_app_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ( "AppLifecycleManagement",
        option_to_yojson space_app_lifecycle_management_to_yojson x.app_lifecycle_management );
    ]

let space_settings_to_yojson (x : space_settings) =
  assoc_to_yojson
    [
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "CodeEditorAppSettings",
        option_to_yojson space_code_editor_app_settings_to_yojson x.code_editor_app_settings );
      ( "JupyterLabAppSettings",
        option_to_yojson space_jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ( "SpaceStorageSettings",
        option_to_yojson space_storage_settings_to_yojson x.space_storage_settings );
      ("SpaceManagedResources", option_to_yojson feature_status_to_yojson x.space_managed_resources);
      ("CustomFileSystems", option_to_yojson custom_file_systems_to_yojson x.custom_file_systems);
      ("RemoteAccess", option_to_yojson feature_status_to_yojson x.remote_access);
    ]

let create_space_request_to_yojson (x : create_space_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("OwnershipSettings", option_to_yojson ownership_settings_to_yojson x.ownership_settings);
      ( "SpaceSharingSettings",
        option_to_yojson space_sharing_settings_to_yojson x.space_sharing_settings );
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
    ]

let create_studio_lifecycle_config_response_to_yojson (x : create_studio_lifecycle_config_response)
    =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
    ]

let studio_lifecycle_config_app_type_to_yojson (x : studio_lifecycle_config_app_type) =
  match x with
  | JupyterServer -> `String "JupyterServer"
  | KernelGateway -> `String "KernelGateway"
  | CodeEditor -> `String "CodeEditor"
  | JupyterLab -> `String "JupyterLab"

let studio_lifecycle_config_content_to_yojson = string_to_yojson
let studio_lifecycle_config_name_to_yojson = string_to_yojson

let create_studio_lifecycle_config_request_to_yojson (x : create_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
      ( "StudioLifecycleConfigContent",
        Some (studio_lifecycle_config_content_to_yojson x.studio_lifecycle_config_content) );
      ( "StudioLifecycleConfigAppType",
        Some (studio_lifecycle_config_app_type_to_yojson x.studio_lifecycle_config_app_type) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let training_job_arn_to_yojson = string_to_yojson

let create_training_job_response_to_yojson (x : create_training_job_response) =
  assoc_to_yojson [ ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn)) ]

let model_package_config_to_yojson (x : model_package_config) =
  assoc_to_yojson
    [
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
      ( "SourceModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.source_model_package_arn );
    ]

let mlflow_run_name_to_yojson = string_to_yojson
let mlflow_experiment_name_to_yojson = string_to_yojson
let ml_flow_resource_arn_to_yojson = string_to_yojson

let mlflow_config_to_yojson (x : mlflow_config) =
  assoc_to_yojson
    [
      ("MlflowResourceArn", Some (ml_flow_resource_arn_to_yojson x.mlflow_resource_arn));
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_name_to_yojson x.mlflow_experiment_name );
      ("MlflowRunName", option_to_yojson mlflow_run_name_to_yojson x.mlflow_run_name);
    ]

let evaluator_arn_to_yojson = string_to_yojson

let evaluation_type_to_yojson (x : evaluation_type) =
  match x with
  | LLMAJ_EVALUATION -> `String "LLMAJEvaluation"
  | CUSTOM_SCORER_EVALUATION -> `String "CustomScorerEvaluation"
  | BENCHMARK_EVALUATION -> `String "BenchmarkEvaluation"

let peft_to_yojson (x : peft) = match x with LORA -> `String "LORA"

let customization_technique_to_yojson (x : customization_technique) =
  match x with
  | SFT -> `String "SFT"
  | DPO -> `String "DPO"
  | RLVR -> `String "RLVR"
  | RLAIF -> `String "RLAIF"

let serverless_job_type_to_yojson (x : serverless_job_type) =
  match x with FINE_TUNING -> `String "FineTuning" | EVALUATION -> `String "Evaluation"

let serverless_job_base_model_arn_to_yojson = string_to_yojson

let serverless_job_config_to_yojson (x : serverless_job_config) =
  assoc_to_yojson
    [
      ("BaseModelArn", Some (serverless_job_base_model_arn_to_yojson x.base_model_arn));
      ("AcceptEula", option_to_yojson accept_eula_to_yojson x.accept_eula);
      ("JobType", Some (serverless_job_type_to_yojson x.job_type));
      ( "CustomizationTechnique",
        option_to_yojson customization_technique_to_yojson x.customization_technique );
      ("Peft", option_to_yojson peft_to_yojson x.peft);
      ("EvaluationType", option_to_yojson evaluation_type_to_yojson x.evaluation_type);
      ("EvaluatorArn", option_to_yojson evaluator_arn_to_yojson x.evaluator_arn);
    ]

let enable_session_tag_chaining_to_yojson = bool_to_yojson

let session_chaining_config_to_yojson (x : session_chaining_config) =
  assoc_to_yojson
    [
      ( "EnableSessionTagChaining",
        option_to_yojson enable_session_tag_chaining_to_yojson x.enable_session_tag_chaining );
    ]

let enable_infra_check_to_yojson = bool_to_yojson

let infra_check_config_to_yojson (x : infra_check_config) =
  assoc_to_yojson
    [ ("EnableInfraCheck", option_to_yojson enable_infra_check_to_yojson x.enable_infra_check) ]

let enable_remote_debug_to_yojson = bool_to_yojson

let remote_debug_config_to_yojson (x : remote_debug_config) =
  assoc_to_yojson
    [ ("EnableRemoteDebug", option_to_yojson enable_remote_debug_to_yojson x.enable_remote_debug) ]

let training_environment_value_to_yojson = string_to_yojson
let training_environment_key_to_yojson = string_to_yojson

let training_environment_map_to_yojson tree =
  map_to_yojson training_environment_key_to_yojson training_environment_value_to_yojson tree

let rule_parameters_to_yojson tree = map_to_yojson config_key_to_yojson config_value_to_yojson tree
let rule_configuration_name_to_yojson = string_to_yojson

let profiler_rule_configuration_to_yojson (x : profiler_rule_configuration) =
  assoc_to_yojson
    [
      ("RuleConfigurationName", Some (rule_configuration_name_to_yojson x.rule_configuration_name));
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("RuleEvaluatorImage", Some (algorithm_image_to_yojson x.rule_evaluator_image));
      ("InstanceType", option_to_yojson processing_instance_type_to_yojson x.instance_type);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("RuleParameters", option_to_yojson rule_parameters_to_yojson x.rule_parameters);
    ]

let profiler_rule_configurations_to_yojson tree =
  list_to_yojson profiler_rule_configuration_to_yojson tree

let disable_profiler_to_yojson = bool_to_yojson

let profiling_parameters_to_yojson tree =
  map_to_yojson config_key_to_yojson config_value_to_yojson tree

let profiling_interval_in_milliseconds_to_yojson = long_to_yojson

let profiler_config_to_yojson (x : profiler_config) =
  assoc_to_yojson
    [
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ( "ProfilingIntervalInMilliseconds",
        option_to_yojson profiling_interval_in_milliseconds_to_yojson
          x.profiling_interval_in_milliseconds );
      ("ProfilingParameters", option_to_yojson profiling_parameters_to_yojson x.profiling_parameters);
      ("DisableProfiler", option_to_yojson disable_profiler_to_yojson x.disable_profiler);
    ]

let tensor_board_output_config_to_yojson (x : tensor_board_output_config) =
  assoc_to_yojson
    [
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
    ]

let debug_rule_configuration_to_yojson (x : debug_rule_configuration) =
  assoc_to_yojson
    [
      ("RuleConfigurationName", Some (rule_configuration_name_to_yojson x.rule_configuration_name));
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("RuleEvaluatorImage", Some (algorithm_image_to_yojson x.rule_evaluator_image));
      ("InstanceType", option_to_yojson processing_instance_type_to_yojson x.instance_type);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("RuleParameters", option_to_yojson rule_parameters_to_yojson x.rule_parameters);
    ]

let debug_rule_configurations_to_yojson tree =
  list_to_yojson debug_rule_configuration_to_yojson tree

let hook_parameters_to_yojson tree = map_to_yojson config_key_to_yojson config_value_to_yojson tree

let debug_hook_config_to_yojson (x : debug_hook_config) =
  assoc_to_yojson
    [
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("HookParameters", option_to_yojson hook_parameters_to_yojson x.hook_parameters);
      ( "CollectionConfigurations",
        option_to_yojson collection_configurations_to_yojson x.collection_configurations );
    ]

let training_job_name_to_yojson = string_to_yojson

let create_training_job_request_to_yojson (x : create_training_job_request) =
  assoc_to_yojson
    [
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("StoppingCondition", option_to_yojson stopping_condition_to_yojson x.stopping_condition);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("RemoteDebugConfig", option_to_yojson remote_debug_config_to_yojson x.remote_debug_config);
      ("InfraCheckConfig", option_to_yojson infra_check_config_to_yojson x.infra_check_config);
      ( "SessionChainingConfig",
        option_to_yojson session_chaining_config_to_yojson x.session_chaining_config );
      ( "ServerlessJobConfig",
        option_to_yojson serverless_job_config_to_yojson x.serverless_job_config );
      ("MlflowConfig", option_to_yojson mlflow_config_to_yojson x.mlflow_config);
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
    ]

let create_training_plan_response_to_yojson (x : create_training_plan_response) =
  assoc_to_yojson [ ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn)) ]

let spare_instance_count_per_ultra_server_to_yojson = int_to_yojson
let training_plan_offering_id_to_yojson = string_to_yojson
let training_plan_name_to_yojson = string_to_yojson

let create_training_plan_request_to_yojson (x : create_training_plan_request) =
  assoc_to_yojson
    [
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
      ( "TrainingPlanOfferingId",
        Some (training_plan_offering_id_to_yojson x.training_plan_offering_id) );
      ( "SpareInstanceCountPerUltraServer",
        option_to_yojson spare_instance_count_per_ultra_server_to_yojson
          x.spare_instance_count_per_ultra_server );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let transform_job_arn_to_yojson = string_to_yojson

let create_transform_job_response_to_yojson (x : create_transform_job_response) =
  assoc_to_yojson [ ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn)) ]

let join_source_to_yojson (x : join_source) =
  match x with INPUT -> `String "Input" | NONE -> `String "None"

let json_path_to_yojson = string_to_yojson

let data_processing_to_yojson (x : data_processing) =
  assoc_to_yojson
    [
      ("InputFilter", option_to_yojson json_path_to_yojson x.input_filter);
      ("OutputFilter", option_to_yojson json_path_to_yojson x.output_filter);
      ("JoinSource", option_to_yojson join_source_to_yojson x.join_source);
    ]

let invocations_max_retries_to_yojson = int_to_yojson
let invocations_timeout_in_seconds_to_yojson = int_to_yojson

let model_client_config_to_yojson (x : model_client_config) =
  assoc_to_yojson
    [
      ( "InvocationsTimeoutInSeconds",
        option_to_yojson invocations_timeout_in_seconds_to_yojson x.invocations_timeout_in_seconds
      );
      ( "InvocationsMaxRetries",
        option_to_yojson invocations_max_retries_to_yojson x.invocations_max_retries );
    ]

let transform_job_name_to_yojson = string_to_yojson

let create_transform_job_request_to_yojson (x : create_transform_job_request) =
  assoc_to_yojson
    [
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("TransformOutput", Some (transform_output_to_yojson x.transform_output));
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
    ]

let create_trial_response_to_yojson (x : create_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let create_trial_request_to_yojson (x : create_trial_request) =
  assoc_to_yojson
    [
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_trial_component_response_to_yojson (x : create_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let trial_component_artifact_value_to_yojson = string_to_yojson
let media_type_to_yojson = string_to_yojson

let trial_component_artifact_to_yojson (x : trial_component_artifact) =
  assoc_to_yojson
    [
      ("MediaType", option_to_yojson media_type_to_yojson x.media_type);
      ("Value", Some (trial_component_artifact_value_to_yojson x.value));
    ]

let trial_component_key128_to_yojson = string_to_yojson

let trial_component_artifacts_to_yojson tree =
  map_to_yojson trial_component_key128_to_yojson trial_component_artifact_to_yojson tree

let double_parameter_value_to_yojson = double_to_yojson

let trial_component_parameter_value_to_yojson (x : trial_component_parameter_value) =
  match x with
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (string_parameter_value_to_yojson arg)) ]
  | NumberValue arg ->
      assoc_to_yojson [ ("NumberValue", Some (double_parameter_value_to_yojson arg)) ]

let trial_component_key320_to_yojson = string_to_yojson

let trial_component_parameters_to_yojson tree =
  map_to_yojson trial_component_key320_to_yojson trial_component_parameter_value_to_yojson tree

let trial_component_status_message_to_yojson = string_to_yojson

let trial_component_primary_status_to_yojson (x : trial_component_primary_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let trial_component_status_to_yojson (x : trial_component_status) =
  assoc_to_yojson
    [
      ("PrimaryStatus", option_to_yojson trial_component_primary_status_to_yojson x.primary_status);
      ("Message", option_to_yojson trial_component_status_message_to_yojson x.message);
    ]

let create_trial_component_request_to_yojson (x : create_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let user_profile_arn_to_yojson = string_to_yojson

let create_user_profile_response_to_yojson (x : create_user_profile_response) =
  assoc_to_yojson
    [ ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn) ]

let single_sign_on_user_identifier_to_yojson = string_to_yojson

let create_user_profile_request_to_yojson (x : create_user_profile_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ( "SingleSignOnUserIdentifier",
        option_to_yojson single_sign_on_user_identifier_to_yojson x.single_sign_on_user_identifier
      );
      ("SingleSignOnUserValue", option_to_yojson string256_to_yojson x.single_sign_on_user_value);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
    ]

let workforce_arn_to_yojson = string_to_yojson

let create_workforce_response_to_yojson (x : create_workforce_response) =
  assoc_to_yojson [ ("WorkforceArn", Some (workforce_arn_to_yojson x.workforce_arn)) ]

let workforce_ip_address_type_to_yojson (x : workforce_ip_address_type) =
  match x with Ipv4 -> `String "ipv4" | Dualstack -> `String "dualstack"

let workforce_subnet_id_to_yojson = string_to_yojson
let workforce_subnets_to_yojson tree = list_to_yojson workforce_subnet_id_to_yojson tree
let workforce_security_group_id_to_yojson = string_to_yojson

let workforce_security_group_ids_to_yojson tree =
  list_to_yojson workforce_security_group_id_to_yojson tree

let workforce_vpc_id_to_yojson = string_to_yojson

let workforce_vpc_config_request_to_yojson (x : workforce_vpc_config_request) =
  assoc_to_yojson
    [
      ("VpcId", option_to_yojson workforce_vpc_id_to_yojson x.vpc_id);
      ( "SecurityGroupIds",
        option_to_yojson workforce_security_group_ids_to_yojson x.security_group_ids );
      ("Subnets", option_to_yojson workforce_subnets_to_yojson x.subnets);
    ]

let workforce_name_to_yojson = string_to_yojson

let source_ip_config_to_yojson (x : source_ip_config) =
  assoc_to_yojson [ ("Cidrs", Some (cidrs_to_yojson x.cidrs)) ]

let scope_to_yojson = string_to_yojson
let oidc_endpoint_to_yojson = string_to_yojson

let oidc_config_to_yojson (x : oidc_config) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_to_yojson x.client_id));
      ("ClientSecret", Some (client_secret_to_yojson x.client_secret));
      ("Issuer", Some (oidc_endpoint_to_yojson x.issuer));
      ("AuthorizationEndpoint", Some (oidc_endpoint_to_yojson x.authorization_endpoint));
      ("TokenEndpoint", Some (oidc_endpoint_to_yojson x.token_endpoint));
      ("UserInfoEndpoint", Some (oidc_endpoint_to_yojson x.user_info_endpoint));
      ("LogoutEndpoint", Some (oidc_endpoint_to_yojson x.logout_endpoint));
      ("JwksUri", Some (oidc_endpoint_to_yojson x.jwks_uri));
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ( "AuthenticationRequestExtraParams",
        option_to_yojson authentication_request_extra_params_to_yojson
          x.authentication_request_extra_params );
    ]

let create_workforce_request_to_yojson (x : create_workforce_request) =
  assoc_to_yojson
    [
      ("CognitoConfig", option_to_yojson cognito_config_to_yojson x.cognito_config);
      ("OidcConfig", option_to_yojson oidc_config_to_yojson x.oidc_config);
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_request_to_yojson x.workforce_vpc_config );
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
    ]

let create_workteam_response_to_yojson (x : create_workteam_response) =
  assoc_to_yojson [ ("WorkteamArn", option_to_yojson workteam_arn_to_yojson x.workteam_arn) ]

let enabled_or_disabled_to_yojson (x : enabled_or_disabled) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let iam_policy_constraints_to_yojson (x : iam_policy_constraints) =
  assoc_to_yojson
    [
      ("SourceIp", option_to_yojson enabled_or_disabled_to_yojson x.source_ip);
      ("VpcSourceIp", option_to_yojson enabled_or_disabled_to_yojson x.vpc_source_ip);
    ]

let s3_presign_to_yojson (x : s3_presign) =
  assoc_to_yojson
    [
      ( "IamPolicyConstraints",
        option_to_yojson iam_policy_constraints_to_yojson x.iam_policy_constraints );
    ]

let worker_access_configuration_to_yojson (x : worker_access_configuration) =
  assoc_to_yojson [ ("S3Presign", option_to_yojson s3_presign_to_yojson x.s3_presign) ]

let notification_topic_arn_to_yojson = string_to_yojson

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson
    [
      ( "NotificationTopicArn",
        option_to_yojson notification_topic_arn_to_yojson x.notification_topic_arn );
    ]

let string200_to_yojson = string_to_yojson
let group_to_yojson = string_to_yojson
let groups_to_yojson tree = list_to_yojson group_to_yojson tree

let oidc_member_definition_to_yojson (x : oidc_member_definition) =
  assoc_to_yojson [ ("Groups", option_to_yojson groups_to_yojson x.groups) ]

let member_definition_to_yojson (x : member_definition) =
  assoc_to_yojson
    [
      ( "CognitoMemberDefinition",
        option_to_yojson cognito_member_definition_to_yojson x.cognito_member_definition );
      ( "OidcMemberDefinition",
        option_to_yojson oidc_member_definition_to_yojson x.oidc_member_definition );
    ]

let member_definitions_to_yojson tree = list_to_yojson member_definition_to_yojson tree
let workteam_name_to_yojson = string_to_yojson

let create_workteam_request_to_yojson (x : create_workteam_request) =
  assoc_to_yojson
    [
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
      ("WorkforceName", option_to_yojson workforce_name_to_yojson x.workforce_name);
      ("MemberDefinitions", Some (member_definitions_to_yojson x.member_definitions));
      ("Description", Some (string200_to_yojson x.description));
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let cross_account_filter_option_to_yojson (x : cross_account_filter_option) =
  match x with SAME_ACCOUNT -> `String "SameAccount" | CROSS_ACCOUNT -> `String "CrossAccount"

let currency_code_to_yojson = string_to_yojson
let customer_metadata_key_list_to_yojson tree = list_to_yojson customer_metadata_key_to_yojson tree

let statistic_to_yojson (x : statistic) =
  match x with
  | AVERAGE -> `String "Average"
  | MINIMUM -> `String "Minimum"
  | MAXIMUM -> `String "Maximum"
  | SAMPLE_COUNT -> `String "SampleCount"
  | SUM -> `String "Sum"

let customized_metric_specification_to_yojson (x : customized_metric_specification) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson string__to_yojson x.metric_name);
      ("Namespace", option_to_yojson string__to_yojson x.namespace);
      ("Statistic", option_to_yojson statistic_to_yojson x.statistic);
    ]

let data_capture_config_summary_to_yojson (x : data_capture_config_summary) =
  assoc_to_yojson
    [
      ("EnableCapture", Some (enable_capture_to_yojson x.enable_capture));
      ("CaptureStatus", Some (capture_status_to_yojson x.capture_status));
      ( "CurrentSamplingPercentage",
        Some (sampling_percentage_to_yojson x.current_sampling_percentage) );
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
      ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
    ]

let status_details_to_yojson = string_to_yojson

let rule_evaluation_status_to_yojson (x : rule_evaluation_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | NO_ISSUES_FOUND -> `String "NoIssuesFound"
  | ISSUES_FOUND -> `String "IssuesFound"
  | ERROR -> `String "Error"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let debug_rule_evaluation_status_to_yojson (x : debug_rule_evaluation_status) =
  assoc_to_yojson
    [
      ( "RuleConfigurationName",
        option_to_yojson rule_configuration_name_to_yojson x.rule_configuration_name );
      ( "RuleEvaluationJobArn",
        option_to_yojson processing_job_arn_to_yojson x.rule_evaluation_job_arn );
      ( "RuleEvaluationStatus",
        option_to_yojson rule_evaluation_status_to_yojson x.rule_evaluation_status );
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let debug_rule_evaluation_statuses_to_yojson tree =
  list_to_yojson debug_rule_evaluation_status_to_yojson tree

let deep_health_checks_to_yojson tree = list_to_yojson deep_health_check_type_to_yojson tree
let instance_ids_to_yojson tree = list_to_yojson cluster_node_id_to_yojson tree

let instance_group_health_check_configuration_to_yojson
    (x : instance_group_health_check_configuration) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("InstanceIds", option_to_yojson instance_ids_to_yojson x.instance_ids);
      ("DeepHealthChecks", Some (deep_health_checks_to_yojson x.deep_health_checks));
    ]

let deep_health_check_configurations_to_yojson tree =
  list_to_yojson instance_group_health_check_configuration_to_yojson tree

let delete_ai_benchmark_job_response_to_yojson (x : delete_ai_benchmark_job_response) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobArn", option_to_yojson ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn);
    ]

let delete_ai_benchmark_job_request_to_yojson (x : delete_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let delete_ai_recommendation_job_response_to_yojson (x : delete_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        option_to_yojson ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn );
    ]

let delete_ai_recommendation_job_request_to_yojson (x : delete_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let delete_ai_workload_config_response_to_yojson (x : delete_ai_workload_config_response) =
  assoc_to_yojson
    [
      ( "AIWorkloadConfigArn",
        option_to_yojson ai_workload_config_arn_to_yojson x.ai_workload_config_arn );
    ]

let delete_ai_workload_config_request_to_yojson (x : delete_ai_workload_config_request) =
  assoc_to_yojson
    [ ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name)) ]

let delete_action_response_to_yojson (x : delete_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let delete_action_request_to_yojson (x : delete_action_request) =
  assoc_to_yojson [ ("ActionName", Some (experiment_entity_name_to_yojson x.action_name)) ]

let delete_algorithm_input_to_yojson (x : delete_algorithm_input) =
  assoc_to_yojson [ ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name)) ]

let delete_app_request_to_yojson (x : delete_app_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("AppName", Some (app_name_to_yojson x.app_name));
    ]

let delete_app_image_config_request_to_yojson (x : delete_app_image_config_request) =
  assoc_to_yojson
    [ ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name)) ]

let delete_artifact_response_to_yojson (x : delete_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let delete_artifact_request_to_yojson (x : delete_artifact_request) =
  assoc_to_yojson
    [
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
    ]

let delete_association_response_to_yojson (x : delete_association_response) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
    ]

let delete_association_request_to_yojson (x : delete_association_request) =
  assoc_to_yojson
    [
      ("SourceArn", Some (association_entity_arn_to_yojson x.source_arn));
      ("DestinationArn", Some (association_entity_arn_to_yojson x.destination_arn));
    ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name)) ]

let delete_cluster_scheduler_config_request_to_yojson (x : delete_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
    ]

let delete_code_repository_input_to_yojson (x : delete_code_repository_input) =
  assoc_to_yojson [ ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name)) ]

let delete_compilation_job_request_to_yojson (x : delete_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let delete_compute_quota_request_to_yojson (x : delete_compute_quota_request) =
  assoc_to_yojson [ ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id)) ]

let delete_context_response_to_yojson (x : delete_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let delete_context_request_to_yojson (x : delete_context_request) =
  assoc_to_yojson [ ("ContextName", Some (context_name_to_yojson x.context_name)) ]

let delete_data_quality_job_definition_request_to_yojson
    (x : delete_data_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_device_fleet_request_to_yojson (x : delete_device_fleet_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let retention_type_to_yojson (x : retention_type) =
  match x with Retain -> `String "Retain" | Delete -> `String "Delete"

let retention_policy_to_yojson (x : retention_policy) =
  assoc_to_yojson
    [ ("HomeEfsFileSystem", option_to_yojson retention_type_to_yojson x.home_efs_file_system) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("RetentionPolicy", option_to_yojson retention_policy_to_yojson x.retention_policy);
    ]

let delete_edge_deployment_plan_request_to_yojson (x : delete_edge_deployment_plan_request) =
  assoc_to_yojson
    [ ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name)) ]

let delete_edge_deployment_stage_request_to_yojson (x : delete_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let delete_endpoint_input_to_yojson (x : delete_endpoint_input) =
  assoc_to_yojson [ ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name)) ]

let delete_endpoint_config_input_to_yojson (x : delete_endpoint_config_input) =
  assoc_to_yojson
    [ ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name)) ]

let delete_experiment_response_to_yojson (x : delete_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let delete_experiment_request_to_yojson (x : delete_experiment_request) =
  assoc_to_yojson [ ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name)) ]

let delete_feature_group_request_to_yojson (x : delete_feature_group_request) =
  assoc_to_yojson [ ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name)) ]

let delete_flow_definition_response_to_yojson = unit_to_yojson

let delete_flow_definition_request_to_yojson (x : delete_flow_definition_request) =
  assoc_to_yojson
    [ ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name)) ]

let delete_hub_request_to_yojson (x : delete_hub_request) =
  assoc_to_yojson [ ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name)) ]

let delete_hub_content_request_to_yojson (x : delete_hub_content_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
    ]

let delete_hub_content_reference_request_to_yojson (x : delete_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
    ]

let delete_human_task_ui_response_to_yojson = unit_to_yojson

let delete_human_task_ui_request_to_yojson (x : delete_human_task_ui_request) =
  assoc_to_yojson [ ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name)) ]

let delete_hyper_parameter_tuning_job_request_to_yojson
    (x : delete_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let delete_image_response_to_yojson = unit_to_yojson

let delete_image_request_to_yojson (x : delete_image_request) =
  assoc_to_yojson [ ("ImageName", Some (image_name_to_yojson x.image_name)) ]

let delete_image_version_response_to_yojson = unit_to_yojson

let delete_image_version_request_to_yojson (x : delete_image_version_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
    ]

let delete_inference_component_input_to_yojson (x : delete_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let delete_inference_experiment_response_to_yojson (x : delete_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let delete_inference_experiment_request_to_yojson (x : delete_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let delete_job_response_to_yojson = unit_to_yojson

let delete_job_request_to_yojson (x : delete_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let delete_mlflow_app_response_to_yojson (x : delete_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let delete_mlflow_app_request_to_yojson (x : delete_mlflow_app_request) =
  assoc_to_yojson [ ("Arn", Some (mlflow_app_arn_to_yojson x.arn)) ]

let delete_mlflow_tracking_server_response_to_yojson (x : delete_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let delete_mlflow_tracking_server_request_to_yojson (x : delete_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let delete_model_input_to_yojson (x : delete_model_input) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_model_bias_job_definition_request_to_yojson
    (x : delete_model_bias_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_model_card_request_to_yojson (x : delete_model_card_request) =
  assoc_to_yojson [ ("ModelCardName", Some (entity_name_to_yojson x.model_card_name)) ]

let delete_model_explainability_job_definition_request_to_yojson
    (x : delete_model_explainability_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_model_package_input_to_yojson (x : delete_model_package_input) =
  assoc_to_yojson
    [ ("ModelPackageName", Some (versioned_arn_or_name_to_yojson x.model_package_name)) ]

let delete_model_package_group_input_to_yojson (x : delete_model_package_group_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (arn_or_name_to_yojson x.model_package_group_name)) ]

let delete_model_package_group_policy_input_to_yojson (x : delete_model_package_group_policy_input)
    =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name)) ]

let delete_model_quality_job_definition_request_to_yojson
    (x : delete_model_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_monitoring_schedule_request_to_yojson (x : delete_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let delete_notebook_instance_input_to_yojson (x : delete_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let delete_notebook_instance_lifecycle_config_input_to_yojson
    (x : delete_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let delete_optimization_job_request_to_yojson (x : delete_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let delete_partner_app_response_to_yojson (x : delete_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let delete_partner_app_request_to_yojson (x : delete_partner_app_request) =
  assoc_to_yojson
    [
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_pipeline_response_to_yojson (x : delete_pipeline_response) =
  assoc_to_yojson [ ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn) ]

let delete_pipeline_request_to_yojson (x : delete_pipeline_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
    ]

let delete_processing_job_request_to_yojson (x : delete_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let delete_project_input_to_yojson (x : delete_project_input) =
  assoc_to_yojson [ ("ProjectName", Some (project_entity_name_to_yojson x.project_name)) ]

let delete_space_request_to_yojson (x : delete_space_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpaceName", Some (space_name_to_yojson x.space_name));
    ]

let delete_studio_lifecycle_config_request_to_yojson (x : delete_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
    ]

let delete_tags_output_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let delete_tags_input_to_yojson (x : delete_tags_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let delete_training_job_request_to_yojson (x : delete_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let delete_trial_response_to_yojson (x : delete_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let delete_trial_request_to_yojson (x : delete_trial_request) =
  assoc_to_yojson [ ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name)) ]

let delete_trial_component_response_to_yojson (x : delete_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let delete_trial_component_request_to_yojson (x : delete_trial_component_request) =
  assoc_to_yojson
    [ ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name)) ]

let delete_user_profile_request_to_yojson (x : delete_user_profile_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
    ]

let delete_workforce_response_to_yojson = unit_to_yojson

let delete_workforce_request_to_yojson (x : delete_workforce_request) =
  assoc_to_yojson [ ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name)) ]

let success_to_yojson = bool_to_yojson

let delete_workteam_response_to_yojson (x : delete_workteam_response) =
  assoc_to_yojson [ ("Success", Some (success_to_yojson x.success)) ]

let delete_workteam_request_to_yojson (x : delete_workteam_request) =
  assoc_to_yojson [ ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name)) ]

let dependency_copy_path_to_yojson = string_to_yojson
let dependency_origin_path_to_yojson = string_to_yojson

let deployed_image_to_yojson (x : deployed_image) =
  assoc_to_yojson
    [
      ("SpecifiedImage", option_to_yojson container_image_to_yojson x.specified_image);
      ("ResolvedImage", option_to_yojson container_image_to_yojson x.resolved_image);
      ("ResolutionTime", option_to_yojson timestamp_to_yojson x.resolution_time);
    ]

let deployed_images_to_yojson tree = list_to_yojson deployed_image_to_yojson tree

let real_time_inference_recommendation_to_yojson (x : real_time_inference_recommendation) =
  assoc_to_yojson
    [
      ("RecommendationId", Some (string__to_yojson x.recommendation_id));
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
    ]

let real_time_inference_recommendations_to_yojson tree =
  list_to_yojson real_time_inference_recommendation_to_yojson tree

let recommendation_status_to_yojson (x : recommendation_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"

let deployment_recommendation_to_yojson (x : deployment_recommendation) =
  assoc_to_yojson
    [
      ("RecommendationStatus", Some (recommendation_status_to_yojson x.recommendation_status));
      ( "RealTimeInferenceRecommendations",
        option_to_yojson real_time_inference_recommendations_to_yojson
          x.real_time_inference_recommendations );
    ]

let deployment_stage_max_results_to_yojson = int_to_yojson

let stage_status_to_yojson (x : stage_status) =
  match x with
  | Creating -> `String "CREATING"
  | ReadyToDeploy -> `String "READYTODEPLOY"
  | Starting -> `String "STARTING"
  | InProgress -> `String "INPROGRESS"
  | Deployed -> `String "DEPLOYED"
  | Failed -> `String "FAILED"
  | Stopping -> `String "STOPPING"
  | Stopped -> `String "STOPPED"

let edge_deployment_status_to_yojson (x : edge_deployment_status) =
  assoc_to_yojson
    [
      ("StageStatus", Some (stage_status_to_yojson x.stage_status));
      ("EdgeDeploymentSuccessInStage", Some (integer_to_yojson x.edge_deployment_success_in_stage));
      ("EdgeDeploymentPendingInStage", Some (integer_to_yojson x.edge_deployment_pending_in_stage));
      ("EdgeDeploymentFailedInStage", Some (integer_to_yojson x.edge_deployment_failed_in_stage));
      ( "EdgeDeploymentStatusMessage",
        option_to_yojson string__to_yojson x.edge_deployment_status_message );
      ( "EdgeDeploymentStageStartTime",
        option_to_yojson timestamp_to_yojson x.edge_deployment_stage_start_time );
    ]

let deployment_stage_status_summary_to_yojson (x : deployment_stage_status_summary) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("DeviceSelectionConfig", Some (device_selection_config_to_yojson x.device_selection_config));
      ("DeploymentConfig", Some (edge_deployment_config_to_yojson x.deployment_config));
      ("DeploymentStatus", Some (edge_deployment_status_to_yojson x.deployment_status));
    ]

let deployment_stage_status_summaries_to_yojson tree =
  list_to_yojson deployment_stage_status_summary_to_yojson tree

let deregister_devices_request_to_yojson (x : deregister_devices_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("DeviceNames", Some (device_names_to_yojson x.device_names));
    ]

let derived_information_to_yojson (x : derived_information) =
  assoc_to_yojson
    [
      ( "DerivedDataInputConfig",
        option_to_yojson data_input_config_to_yojson x.derived_data_input_config );
    ]

let describe_ai_benchmark_job_response_to_yojson (x : describe_ai_benchmark_job_response) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
      ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn));
      ("AIBenchmarkJobStatus", Some (ai_benchmark_job_status_to_yojson x.ai_benchmark_job_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("BenchmarkTarget", Some (ai_benchmark_target_to_yojson x.benchmark_target));
      ("OutputConfig", Some (ai_benchmark_output_result_to_yojson x.output_config));
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson ai_benchmark_network_config_to_yojson x.network_config);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_ai_benchmark_job_request_to_yojson (x : describe_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let describe_ai_recommendation_job_response_to_yojson (x : describe_ai_recommendation_job_response)
    =
  assoc_to_yojson
    [
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
      ( "AIRecommendationJobStatus",
        Some (ai_recommendation_job_status_to_yojson x.ai_recommendation_job_status) );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ModelSource", Some (ai_model_source_to_yojson x.model_source));
      ("OutputConfig", Some (ai_recommendation_output_result_to_yojson x.output_config));
      ( "InferenceSpecification",
        option_to_yojson ai_recommendation_inference_specification_to_yojson
          x.inference_specification );
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ( "OptimizeModel",
        option_to_yojson ai_recommendation_allow_optimization_to_yojson x.optimize_model );
      ( "PerformanceTarget",
        option_to_yojson ai_recommendation_performance_target_to_yojson x.performance_target );
      ("Recommendations", option_to_yojson ai_recommendation_list_to_yojson x.recommendations);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ComputeSpec", option_to_yojson ai_recommendation_compute_spec_to_yojson x.compute_spec);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_ai_recommendation_job_request_to_yojson (x : describe_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let describe_ai_workload_config_response_to_yojson (x : describe_ai_workload_config_response) =
  assoc_to_yojson
    [
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
      ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn));
      ("DatasetConfig", option_to_yojson ai_dataset_config_to_yojson x.dataset_config);
      ("AIWorkloadConfigs", option_to_yojson ai_workload_configs_to_yojson x.ai_workload_configs);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let describe_ai_workload_config_request_to_yojson (x : describe_ai_workload_config_request) =
  assoc_to_yojson
    [ ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name)) ]

let lineage_group_arn_to_yojson = string_to_yojson
let experiment_entity_name_or_arn_to_yojson = string_to_yojson

let describe_action_response_to_yojson (x : describe_action_response) =
  assoc_to_yojson
    [
      ("ActionName", option_to_yojson experiment_entity_name_or_arn_to_yojson x.action_name);
      ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn);
      ("Source", option_to_yojson action_source_to_yojson x.source);
      ("ActionType", option_to_yojson string256_to_yojson x.action_type);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
    ]

let describe_action_request_to_yojson (x : describe_action_request) =
  assoc_to_yojson [ ("ActionName", Some (experiment_entity_name_or_arn_to_yojson x.action_name)) ]

let describe_algorithm_output_to_yojson (x : describe_algorithm_output) =
  assoc_to_yojson
    [
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
      ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("TrainingSpecification", Some (training_specification_to_yojson x.training_specification));
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "ValidationSpecification",
        option_to_yojson algorithm_validation_specification_to_yojson x.validation_specification );
      ("AlgorithmStatus", Some (algorithm_status_to_yojson x.algorithm_status));
      ( "AlgorithmStatusDetails",
        Some (algorithm_status_details_to_yojson x.algorithm_status_details) );
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
    ]

let describe_algorithm_input_to_yojson (x : describe_algorithm_input) =
  assoc_to_yojson [ ("AlgorithmName", Some (arn_or_name_to_yojson x.algorithm_name)) ]

let describe_app_response_to_yojson (x : describe_app_response) =
  assoc_to_yojson
    [
      ("AppArn", option_to_yojson app_arn_to_yojson x.app_arn);
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ("AppName", option_to_yojson app_name_to_yojson x.app_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("Status", option_to_yojson app_status_to_yojson x.status);
      ( "EffectiveTrustedIdentityPropagationStatus",
        option_to_yojson feature_status_to_yojson x.effective_trusted_identity_propagation_status );
      ("RecoveryMode", option_to_yojson boolean__to_yojson x.recovery_mode);
      ( "LastHealthCheckTimestamp",
        option_to_yojson timestamp_to_yojson x.last_health_check_timestamp );
      ( "LastUserActivityTimestamp",
        option_to_yojson timestamp_to_yojson x.last_user_activity_timestamp );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
    ]

let describe_app_request_to_yojson (x : describe_app_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("AppName", Some (app_name_to_yojson x.app_name));
    ]

let describe_app_image_config_response_to_yojson (x : describe_app_image_config_response) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
      ( "AppImageConfigName",
        option_to_yojson app_image_config_name_to_yojson x.app_image_config_name );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
    ]

let describe_app_image_config_request_to_yojson (x : describe_app_image_config_request) =
  assoc_to_yojson
    [ ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name)) ]

let describe_artifact_response_to_yojson (x : describe_artifact_response) =
  assoc_to_yojson
    [
      ("ArtifactName", option_to_yojson experiment_entity_name_or_arn_to_yojson x.artifact_name);
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
    ]

let describe_artifact_request_to_yojson (x : describe_artifact_request) =
  assoc_to_yojson [ ("ArtifactArn", Some (artifact_arn_to_yojson x.artifact_arn)) ]

let model_deploy_result_to_yojson (x : model_deploy_result) =
  assoc_to_yojson [ ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name) ]

let resolved_attributes_to_yojson (x : resolved_attributes) =
  assoc_to_yojson
    [
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let describe_auto_ml_job_response_to_yojson (x : describe_auto_ml_job_response) =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ("InputDataConfig", Some (auto_ml_input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ("AutoMLJobConfig", option_to_yojson auto_ml_job_config_to_yojson x.auto_ml_job_config);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
      ("BestCandidate", option_to_yojson auto_ml_candidate_to_yojson x.best_candidate);
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ( "AutoMLJobArtifacts",
        option_to_yojson auto_ml_job_artifacts_to_yojson x.auto_ml_job_artifacts );
      ("ResolvedAttributes", option_to_yojson resolved_attributes_to_yojson x.resolved_attributes);
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ("ModelDeployResult", option_to_yojson model_deploy_result_to_yojson x.model_deploy_result);
    ]

let describe_auto_ml_job_request_to_yojson (x : describe_auto_ml_job_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let describe_auto_ml_job_v2_response_to_yojson (x : describe_auto_ml_job_v2_response) =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ( "AutoMLJobInputDataConfig",
        Some (auto_ml_job_input_data_config_to_yojson x.auto_ml_job_input_data_config) );
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ( "AutoMLProblemTypeConfig",
        option_to_yojson auto_ml_problem_type_config_to_yojson x.auto_ml_problem_type_config );
      ( "AutoMLProblemTypeConfigName",
        option_to_yojson auto_ml_problem_type_config_name_to_yojson
          x.auto_ml_problem_type_config_name );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
      ("BestCandidate", option_to_yojson auto_ml_candidate_to_yojson x.best_candidate);
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ( "AutoMLJobArtifacts",
        option_to_yojson auto_ml_job_artifacts_to_yojson x.auto_ml_job_artifacts );
      ( "ResolvedAttributes",
        option_to_yojson auto_ml_resolved_attributes_to_yojson x.resolved_attributes );
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ("ModelDeployResult", option_to_yojson model_deploy_result_to_yojson x.model_deploy_result);
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ( "AutoMLComputeConfig",
        option_to_yojson auto_ml_compute_config_to_yojson x.auto_ml_compute_config );
    ]

let describe_auto_ml_job_v2_request_to_yojson (x : describe_auto_ml_job_v2_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let describe_cluster_response_to_yojson (x : describe_cluster_response) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("ClusterName", option_to_yojson cluster_name_to_yojson x.cluster_name);
      ("ClusterStatus", Some (cluster_status_to_yojson x.cluster_status));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("InstanceGroups", Some (cluster_instance_group_details_list_to_yojson x.instance_groups));
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_details_list_to_yojson
          x.restricted_instance_groups );
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_output_to_yojson
          x.restricted_instance_groups_config );
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_output_to_yojson x.auto_scaling);
    ]

let describe_cluster_request_to_yojson (x : describe_cluster_request) =
  assoc_to_yojson [ ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name)) ]

let describe_cluster_event_response_to_yojson (x : describe_cluster_event_response) =
  assoc_to_yojson
    [ ("EventDetails", option_to_yojson cluster_event_detail_to_yojson x.event_details) ]

let describe_cluster_event_request_to_yojson (x : describe_cluster_event_request) =
  assoc_to_yojson
    [
      ("EventId", Some (event_id_to_yojson x.event_id));
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let describe_cluster_node_response_to_yojson (x : describe_cluster_node_response) =
  assoc_to_yojson [ ("NodeDetails", Some (cluster_node_details_to_yojson x.node_details)) ]

let describe_cluster_node_request_to_yojson (x : describe_cluster_node_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("NodeId", option_to_yojson cluster_node_id_to_yojson x.node_id);
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
    ]

let scheduler_config_component_to_yojson (x : scheduler_config_component) =
  match x with
  | PRIORITY_CLASSES -> `String "PriorityClasses"
  | FAIR_SHARE -> `String "FairShare"
  | IDLE_RESOURCE_SHARING -> `String "IdleResourceSharing"

let status_details_map_to_yojson tree =
  map_to_yojson scheduler_config_component_to_yojson scheduler_resource_status_to_yojson tree

let describe_cluster_scheduler_config_response_to_yojson
    (x : describe_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ("Name", Some (entity_name_to_yojson x.name));
      ("ClusterSchedulerConfigVersion", Some (integer_to_yojson x.cluster_scheduler_config_version));
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("StatusDetails", option_to_yojson status_details_map_to_yojson x.status_details);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("SchedulerConfig", option_to_yojson scheduler_config_to_yojson x.scheduler_config);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let describe_cluster_scheduler_config_request_to_yojson
    (x : describe_cluster_scheduler_config_request) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ( "ClusterSchedulerConfigVersion",
        option_to_yojson integer_to_yojson x.cluster_scheduler_config_version );
    ]

let describe_code_repository_output_to_yojson (x : describe_code_repository_output) =
  assoc_to_yojson
    [
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
      ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("GitConfig", option_to_yojson git_config_to_yojson x.git_config);
    ]

let describe_code_repository_input_to_yojson (x : describe_code_repository_input) =
  assoc_to_yojson [ ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name)) ]

let model_digests_to_yojson (x : model_digests) =
  assoc_to_yojson
    [ ("ArtifactDigest", option_to_yojson artifact_digest_to_yojson x.artifact_digest) ]

let model_artifacts_to_yojson (x : model_artifacts) =
  assoc_to_yojson [ ("S3ModelArtifacts", Some (s3_uri_to_yojson x.s3_model_artifacts)) ]

let inference_image_to_yojson = string_to_yojson

let describe_compilation_job_response_to_yojson (x : describe_compilation_job_response) =
  assoc_to_yojson
    [
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
      ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn));
      ("CompilationJobStatus", Some (compilation_job_status_to_yojson x.compilation_job_status));
      ("CompilationStartTime", option_to_yojson timestamp_to_yojson x.compilation_start_time);
      ("CompilationEndTime", option_to_yojson timestamp_to_yojson x.compilation_end_time);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("InferenceImage", option_to_yojson inference_image_to_yojson x.inference_image);
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("FailureReason", Some (failure_reason_to_yojson x.failure_reason));
      ("ModelArtifacts", Some (model_artifacts_to_yojson x.model_artifacts));
      ("ModelDigests", option_to_yojson model_digests_to_yojson x.model_digests);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("InputConfig", Some (input_config_to_yojson x.input_config));
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("VpcConfig", option_to_yojson neo_vpc_config_to_yojson x.vpc_config);
      ("DerivedInformation", option_to_yojson derived_information_to_yojson x.derived_information);
    ]

let describe_compilation_job_request_to_yojson (x : describe_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let describe_compute_quota_response_to_yojson (x : describe_compute_quota_response) =
  assoc_to_yojson
    [
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("Name", Some (entity_name_to_yojson x.name));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("ComputeQuotaVersion", Some (integer_to_yojson x.compute_quota_version));
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let describe_compute_quota_request_to_yojson (x : describe_compute_quota_request) =
  assoc_to_yojson
    [
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("ComputeQuotaVersion", option_to_yojson integer_to_yojson x.compute_quota_version);
    ]

let describe_context_response_to_yojson (x : describe_context_response) =
  assoc_to_yojson
    [
      ("ContextName", option_to_yojson context_name_to_yojson x.context_name);
      ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn);
      ("Source", option_to_yojson context_source_to_yojson x.source);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
    ]

let describe_context_request_to_yojson (x : describe_context_request) =
  assoc_to_yojson [ ("ContextName", Some (context_name_or_arn_to_yojson x.context_name)) ]

let describe_data_quality_job_definition_response_to_yojson
    (x : describe_data_quality_job_definition_response) =
  assoc_to_yojson
    [
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "DataQualityBaselineConfig",
        option_to_yojson data_quality_baseline_config_to_yojson x.data_quality_baseline_config );
      ( "DataQualityAppSpecification",
        Some (data_quality_app_specification_to_yojson x.data_quality_app_specification) );
      ("DataQualityJobInput", Some (data_quality_job_input_to_yojson x.data_quality_job_input));
      ( "DataQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.data_quality_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
    ]

let describe_data_quality_job_definition_request_to_yojson
    (x : describe_data_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let edge_model_to_yojson (x : edge_model) =
  assoc_to_yojson
    [
      ("ModelName", Some (entity_name_to_yojson x.model_name));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("LatestSampleTime", option_to_yojson timestamp_to_yojson x.latest_sample_time);
      ("LatestInference", option_to_yojson timestamp_to_yojson x.latest_inference);
    ]

let edge_models_to_yojson tree = list_to_yojson edge_model_to_yojson tree
let thing_name_to_yojson = string_to_yojson
let device_description_to_yojson = string_to_yojson
let device_arn_to_yojson = string_to_yojson

let describe_device_response_to_yojson (x : describe_device_response) =
  assoc_to_yojson
    [
      ("DeviceArn", option_to_yojson device_arn_to_yojson x.device_arn);
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
      ("RegistrationTime", Some (timestamp_to_yojson x.registration_time));
      ("LatestHeartbeat", option_to_yojson timestamp_to_yojson x.latest_heartbeat);
      ("Models", option_to_yojson edge_models_to_yojson x.models);
      ("MaxModels", option_to_yojson integer_to_yojson x.max_models);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AgentVersion", option_to_yojson edge_version_to_yojson x.agent_version);
    ]

let describe_device_request_to_yojson (x : describe_device_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let iot_role_alias_to_yojson = string_to_yojson
let device_fleet_arn_to_yojson = string_to_yojson

let describe_device_fleet_response_to_yojson (x : describe_device_fleet_response) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("IotRoleAlias", option_to_yojson iot_role_alias_to_yojson x.iot_role_alias);
    ]

let describe_device_fleet_request_to_yojson (x : describe_device_fleet_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let domain_status_to_yojson (x : domain_status) =
  match x with
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"
  | InService -> `String "InService"
  | Pending -> `String "Pending"
  | Updating -> `String "Updating"
  | Update_Failed -> `String "Update_Failed"
  | Delete_Failed -> `String "Delete_Failed"

let resource_id_to_yojson = string_to_yojson

let describe_domain_response_to_yojson (x : describe_domain_response) =
  assoc_to_yojson
    [
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("HomeEfsFileSystemId", option_to_yojson resource_id_to_yojson x.home_efs_file_system_id);
      ( "SingleSignOnManagedApplicationInstanceId",
        option_to_yojson string256_to_yojson x.single_sign_on_managed_application_instance_id );
      ( "SingleSignOnApplicationArn",
        option_to_yojson single_sign_on_application_arn_to_yojson x.single_sign_on_application_arn
      );
      ("Status", option_to_yojson domain_status_to_yojson x.status);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "SecurityGroupIdForDomainBoundary",
        option_to_yojson security_group_id_to_yojson x.security_group_id_for_domain_boundary );
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ("DefaultUserSettings", option_to_yojson user_settings_to_yojson x.default_user_settings);
      ("DomainSettings", option_to_yojson domain_settings_to_yojson x.domain_settings);
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ( "HomeEfsFileSystemKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.home_efs_file_system_kms_key_id );
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ("Url", option_to_yojson string1024_to_yojson x.url);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
    ]

let describe_domain_request_to_yojson (x : describe_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let describe_edge_deployment_plan_response_to_yojson (x : describe_edge_deployment_plan_response) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("ModelConfigs", Some (edge_deployment_model_configs_to_yojson x.model_configs));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("EdgeDeploymentSuccess", option_to_yojson integer_to_yojson x.edge_deployment_success);
      ("EdgeDeploymentPending", option_to_yojson integer_to_yojson x.edge_deployment_pending);
      ("EdgeDeploymentFailed", option_to_yojson integer_to_yojson x.edge_deployment_failed);
      ("Stages", Some (deployment_stage_status_summaries_to_yojson x.stages));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let describe_edge_deployment_plan_request_to_yojson (x : describe_edge_deployment_plan_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson deployment_stage_max_results_to_yojson x.max_results);
    ]

let edge_preset_deployment_status_to_yojson (x : edge_preset_deployment_status) =
  match x with Completed -> `String "COMPLETED" | Failed -> `String "FAILED"

let edge_preset_deployment_artifact_to_yojson = string_to_yojson

let edge_preset_deployment_output_to_yojson (x : edge_preset_deployment_output) =
  assoc_to_yojson
    [
      ("Type", Some (edge_preset_deployment_type_to_yojson x.type_));
      ("Artifact", option_to_yojson edge_preset_deployment_artifact_to_yojson x.artifact);
      ("Status", option_to_yojson edge_preset_deployment_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
    ]

let edge_packaging_job_status_to_yojson (x : edge_packaging_job_status) =
  match x with
  | Starting -> `String "STARTING"
  | InProgress -> `String "INPROGRESS"
  | Completed -> `String "COMPLETED"
  | Failed -> `String "FAILED"
  | Stopping -> `String "STOPPING"
  | Stopped -> `String "STOPPED"

let edge_packaging_job_arn_to_yojson = string_to_yojson

let describe_edge_packaging_job_response_to_yojson (x : describe_edge_packaging_job_response) =
  assoc_to_yojson
    [
      ("EdgePackagingJobArn", Some (edge_packaging_job_arn_to_yojson x.edge_packaging_job_arn));
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ("CompilationJobName", option_to_yojson entity_name_to_yojson x.compilation_job_name);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("ModelVersion", option_to_yojson edge_version_to_yojson x.model_version);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("OutputConfig", option_to_yojson edge_output_config_to_yojson x.output_config);
      ("ResourceKey", option_to_yojson kms_key_id_to_yojson x.resource_key);
      ( "EdgePackagingJobStatus",
        Some (edge_packaging_job_status_to_yojson x.edge_packaging_job_status) );
      ( "EdgePackagingJobStatusMessage",
        option_to_yojson string__to_yojson x.edge_packaging_job_status_message );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ModelArtifact", option_to_yojson s3_uri_to_yojson x.model_artifact);
      ("ModelSignature", option_to_yojson string__to_yojson x.model_signature);
      ( "PresetDeploymentOutput",
        option_to_yojson edge_preset_deployment_output_to_yojson x.preset_deployment_output );
    ]

let describe_edge_packaging_job_request_to_yojson (x : describe_edge_packaging_job_request) =
  assoc_to_yojson
    [ ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name)) ]

let ec2_capacity_reservation_id_to_yojson = string_to_yojson

let ec2_capacity_reservation_to_yojson (x : ec2_capacity_reservation) =
  assoc_to_yojson
    [
      ( "Ec2CapacityReservationId",
        option_to_yojson ec2_capacity_reservation_id_to_yojson x.ec2_capacity_reservation_id );
      ("TotalInstanceCount", option_to_yojson task_count_to_yojson x.total_instance_count);
      ("AvailableInstanceCount", option_to_yojson task_count_to_yojson x.available_instance_count);
      ("UsedByCurrentEndpoint", option_to_yojson task_count_to_yojson x.used_by_current_endpoint);
    ]

let ec2_capacity_reservations_list_to_yojson tree =
  list_to_yojson ec2_capacity_reservation_to_yojson tree

let production_variant_capacity_reservation_summary_to_yojson
    (x : production_variant_capacity_reservation_summary) =
  assoc_to_yojson
    [
      ("MlReservationArn", option_to_yojson ml_reservation_arn_to_yojson x.ml_reservation_arn);
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.capacity_reservation_preference
      );
      ("TotalInstanceCount", option_to_yojson task_count_to_yojson x.total_instance_count);
      ("AvailableInstanceCount", option_to_yojson task_count_to_yojson x.available_instance_count);
      ("UsedByCurrentEndpoint", option_to_yojson task_count_to_yojson x.used_by_current_endpoint);
      ( "Ec2CapacityReservations",
        option_to_yojson ec2_capacity_reservations_list_to_yojson x.ec2_capacity_reservations );
    ]

let variant_status_message_to_yojson = string_to_yojson

let variant_status_to_yojson (x : variant_status) =
  match x with
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | DELETING -> `String "Deleting"
  | ACTIVATING_TRAFFIC -> `String "ActivatingTraffic"
  | BAKING -> `String "Baking"

let production_variant_status_to_yojson (x : production_variant_status) =
  assoc_to_yojson
    [
      ("Status", Some (variant_status_to_yojson x.status));
      ("StatusMessage", option_to_yojson variant_status_message_to_yojson x.status_message);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
    ]

let production_variant_status_list_to_yojson tree =
  list_to_yojson production_variant_status_to_yojson tree

let instance_pool_summary_to_yojson (x : instance_pool_summary) =
  assoc_to_yojson
    [
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("CurrentInstanceCount", Some (task_count_to_yojson x.current_instance_count));
    ]

let instance_pool_summary_list_to_yojson tree = list_to_yojson instance_pool_summary_to_yojson tree

let production_variant_summary_to_yojson (x : production_variant_summary) =
  assoc_to_yojson
    [
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ("DeployedImages", option_to_yojson deployed_images_to_yojson x.deployed_images);
      ("CurrentWeight", option_to_yojson variant_weight_to_yojson x.current_weight);
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("CurrentInstanceCount", option_to_yojson task_count_to_yojson x.current_instance_count);
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ("InstancePools", option_to_yojson instance_pool_summary_list_to_yojson x.instance_pools);
      ("VariantStatus", option_to_yojson production_variant_status_list_to_yojson x.variant_status);
      ( "CurrentServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.current_serverless_config
      );
      ( "DesiredServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.desired_serverless_config
      );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
      ( "CapacityReservationConfig",
        option_to_yojson production_variant_capacity_reservation_summary_to_yojson
          x.capacity_reservation_config );
    ]

let production_variant_summary_list_to_yojson tree =
  list_to_yojson production_variant_summary_to_yojson tree

let pending_production_variant_summary_to_yojson (x : pending_production_variant_summary) =
  assoc_to_yojson
    [
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ("DeployedImages", option_to_yojson deployed_images_to_yojson x.deployed_images);
      ("CurrentWeight", option_to_yojson variant_weight_to_yojson x.current_weight);
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("CurrentInstanceCount", option_to_yojson task_count_to_yojson x.current_instance_count);
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("InstancePools", option_to_yojson instance_pool_summary_list_to_yojson x.instance_pools);
      ( "AcceleratorType",
        option_to_yojson production_variant_accelerator_type_to_yojson x.accelerator_type );
      ("VariantStatus", option_to_yojson production_variant_status_list_to_yojson x.variant_status);
      ( "CurrentServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.current_serverless_config
      );
      ( "DesiredServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.desired_serverless_config
      );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
    ]

let pending_production_variant_summary_list_to_yojson tree =
  list_to_yojson pending_production_variant_summary_to_yojson tree

let pending_deployment_summary_to_yojson (x : pending_deployment_summary) =
  assoc_to_yojson
    [
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ( "ProductionVariants",
        option_to_yojson pending_production_variant_summary_list_to_yojson x.production_variants );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "ShadowProductionVariants",
        option_to_yojson pending_production_variant_summary_list_to_yojson
          x.shadow_production_variants );
    ]

let endpoint_status_to_yojson (x : endpoint_status) =
  match x with
  | OUT_OF_SERVICE -> `String "OutOfService"
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | SYSTEM_UPDATING -> `String "SystemUpdating"
  | ROLLING_BACK -> `String "RollingBack"
  | IN_SERVICE -> `String "InService"
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | UPDATE_ROLLBACK_FAILED -> `String "UpdateRollbackFailed"

let describe_endpoint_output_to_yojson (x : describe_endpoint_output) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointConfigName", option_to_yojson endpoint_config_name_to_yojson x.endpoint_config_name);
      ( "ProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.production_variants );
      ( "DataCaptureConfig",
        option_to_yojson data_capture_config_summary_to_yojson x.data_capture_config );
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("LastDeploymentConfig", option_to_yojson deployment_config_to_yojson x.last_deployment_config);
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ( "PendingDeploymentSummary",
        option_to_yojson pending_deployment_summary_to_yojson x.pending_deployment_summary );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.shadow_production_variants );
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
    ]

let describe_endpoint_input_to_yojson (x : describe_endpoint_input) =
  assoc_to_yojson [ ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name)) ]

let describe_endpoint_config_output_to_yojson (x : describe_endpoint_config_output) =
  assoc_to_yojson
    [
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn));
      ("ProductionVariants", Some (production_variant_list_to_yojson x.production_variants));
      ("DataCaptureConfig", option_to_yojson data_capture_config_to_yojson x.data_capture_config);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_list_to_yojson x.shadow_production_variants );
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
    ]

let describe_endpoint_config_input_to_yojson (x : describe_endpoint_config_input) =
  assoc_to_yojson
    [ ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name)) ]

let source_type_to_yojson = string_to_yojson
let experiment_source_arn_to_yojson = string_to_yojson

let experiment_source_to_yojson (x : experiment_source) =
  assoc_to_yojson
    [
      ("SourceArn", Some (experiment_source_arn_to_yojson x.source_arn));
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let describe_experiment_response_to_yojson (x : describe_experiment_response) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Source", option_to_yojson experiment_source_to_yojson x.source);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let describe_experiment_request_to_yojson (x : describe_experiment_request) =
  assoc_to_yojson [ ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name)) ]

let online_store_total_size_bytes_to_yojson = long_to_yojson

let last_update_status_value_to_yojson (x : last_update_status_value) =
  match x with
  | SUCCESSFUL -> `String "Successful"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"

let last_update_status_to_yojson (x : last_update_status) =
  assoc_to_yojson
    [
      ("Status", Some (last_update_status_value_to_yojson x.status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let offline_store_status_value_to_yojson (x : offline_store_status_value) =
  match x with
  | ACTIVE -> `String "Active"
  | BLOCKED -> `String "Blocked"
  | DISABLED -> `String "Disabled"

let offline_store_status_to_yojson (x : offline_store_status) =
  assoc_to_yojson
    [
      ("Status", Some (offline_store_status_value_to_yojson x.status));
      ("BlockedReason", option_to_yojson blocked_reason_to_yojson x.blocked_reason);
    ]

let feature_group_status_to_yojson (x : feature_group_status) =
  match x with
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | CREATE_FAILED -> `String "CreateFailed"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"

let throughput_config_description_to_yojson (x : throughput_config_description) =
  assoc_to_yojson
    [
      ("ThroughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
    ]

let describe_feature_group_response_to_yojson (x : describe_feature_group_response) =
  assoc_to_yojson
    [
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("RecordIdentifierFeatureName", Some (feature_name_to_yojson x.record_identifier_feature_name));
      ("EventTimeFeatureName", Some (feature_name_to_yojson x.event_time_feature_name));
      ("FeatureDefinitions", Some (feature_definitions_to_yojson x.feature_definitions));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ( "ThroughputConfig",
        option_to_yojson throughput_config_description_to_yojson x.throughput_config );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
      ("LastUpdateStatus", option_to_yojson last_update_status_to_yojson x.last_update_status);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("NextToken", Some (next_token_to_yojson x.next_token));
      ( "OnlineStoreTotalSizeBytes",
        option_to_yojson online_store_total_size_bytes_to_yojson x.online_store_total_size_bytes );
    ]

let feature_group_name_or_arn_to_yojson = string_to_yojson

let describe_feature_group_request_to_yojson (x : describe_feature_group_request) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let feature_parameter_value_to_yojson = string_to_yojson
let feature_parameter_key_to_yojson = string_to_yojson

let feature_parameter_to_yojson (x : feature_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson feature_parameter_key_to_yojson x.key);
      ("Value", option_to_yojson feature_parameter_value_to_yojson x.value);
    ]

let feature_parameters_to_yojson tree = list_to_yojson feature_parameter_to_yojson tree
let feature_description_to_yojson = string_to_yojson

let describe_feature_metadata_response_to_yojson (x : describe_feature_metadata_response) =
  assoc_to_yojson
    [
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("FeatureType", Some (feature_type_to_yojson x.feature_type));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ("Parameters", option_to_yojson feature_parameters_to_yojson x.parameters);
    ]

let describe_feature_metadata_request_to_yojson (x : describe_feature_metadata_request) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
    ]

let flow_definition_status_to_yojson (x : flow_definition_status) =
  match x with
  | INITIALIZING -> `String "Initializing"
  | ACTIVE -> `String "Active"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"

let describe_flow_definition_response_to_yojson (x : describe_flow_definition_response) =
  assoc_to_yojson
    [
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
      ("FlowDefinitionStatus", Some (flow_definition_status_to_yojson x.flow_definition_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "HumanLoopRequestSource",
        option_to_yojson human_loop_request_source_to_yojson x.human_loop_request_source );
      ( "HumanLoopActivationConfig",
        option_to_yojson human_loop_activation_config_to_yojson x.human_loop_activation_config );
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("OutputConfig", Some (flow_definition_output_config_to_yojson x.output_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let describe_flow_definition_request_to_yojson (x : describe_flow_definition_request) =
  assoc_to_yojson
    [ ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name)) ]

let hub_status_to_yojson (x : hub_status) =
  match x with
  | IN_SERVICE -> `String "InService"
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | DELETING -> `String "Deleting"
  | CREATE_FAILED -> `String "CreateFailed"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | DELETE_FAILED -> `String "DeleteFailed"

let describe_hub_response_to_yojson (x : describe_hub_response) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_to_yojson x.hub_name));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("S3StorageConfig", option_to_yojson hub_s3_storage_config_to_yojson x.s3_storage_config);
      ("HubStatus", Some (hub_status_to_yojson x.hub_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
    ]

let describe_hub_request_to_yojson (x : describe_hub_request) =
  assoc_to_yojson [ ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name)) ]

let hub_content_status_to_yojson (x : hub_content_status) =
  match x with
  | AVAILABLE -> `String "Available"
  | IMPORTING -> `String "Importing"
  | DELETING -> `String "Deleting"
  | IMPORT_FAILED -> `String "ImportFailed"
  | DELETE_FAILED -> `String "DeleteFailed"
  | PENDING_IMPORT -> `String "PendingImport"
  | PENDING_DELETE -> `String "PendingDelete"

let hub_content_dependency_to_yojson (x : hub_content_dependency) =
  assoc_to_yojson
    [
      ( "DependencyOriginPath",
        option_to_yojson dependency_origin_path_to_yojson x.dependency_origin_path );
      ("DependencyCopyPath", option_to_yojson dependency_copy_path_to_yojson x.dependency_copy_path);
    ]

let hub_content_dependency_list_to_yojson tree =
  list_to_yojson hub_content_dependency_to_yojson tree

let hub_content_search_keyword_to_yojson = string_to_yojson

let hub_content_search_keyword_list_to_yojson tree =
  list_to_yojson hub_content_search_keyword_to_yojson tree

let hub_content_support_status_to_yojson (x : hub_content_support_status) =
  match x with
  | SUPPORTED -> `String "Supported"
  | DEPRECATED -> `String "Deprecated"
  | RESTRICTED -> `String "Restricted"

let reference_min_version_to_yojson = string_to_yojson
let hub_content_document_to_yojson = string_to_yojson
let hub_content_markdown_to_yojson = string_to_yojson
let hub_content_description_to_yojson = string_to_yojson
let hub_content_display_name_to_yojson = string_to_yojson
let document_schema_version_to_yojson = string_to_yojson

let describe_hub_content_response_to_yojson (x : describe_hub_content_response) =
  assoc_to_yojson
    [
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ("HubName", Some (hub_name_to_yojson x.hub_name));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ("HubContentDocument", Some (hub_content_document_to_yojson x.hub_content_document));
      ( "SageMakerPublicHubContentArn",
        option_to_yojson sage_maker_public_hub_content_arn_to_yojson
          x.sage_maker_public_hub_content_arn );
      ( "ReferenceMinVersion",
        option_to_yojson reference_min_version_to_yojson x.reference_min_version );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ( "HubContentDependencies",
        option_to_yojson hub_content_dependency_list_to_yojson x.hub_content_dependencies );
      ("HubContentStatus", Some (hub_content_status_to_yojson x.hub_content_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let describe_hub_content_request_to_yojson (x : describe_hub_content_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
    ]

let template_content_sha256_to_yojson = string_to_yojson
let template_url_to_yojson = string_to_yojson

let ui_template_info_to_yojson (x : ui_template_info) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson template_url_to_yojson x.url);
      ("ContentSha256", option_to_yojson template_content_sha256_to_yojson x.content_sha256);
    ]

let human_task_ui_status_to_yojson (x : human_task_ui_status) =
  match x with ACTIVE -> `String "Active" | DELETING -> `String "Deleting"

let describe_human_task_ui_response_to_yojson (x : describe_human_task_ui_response) =
  assoc_to_yojson
    [
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
      ("HumanTaskUiStatus", option_to_yojson human_task_ui_status_to_yojson x.human_task_ui_status);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("UiTemplate", Some (ui_template_info_to_yojson x.ui_template));
    ]

let describe_human_task_ui_request_to_yojson (x : describe_human_task_ui_request) =
  assoc_to_yojson [ ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name)) ]

let hyper_parameter_tuning_job_consumed_resources_to_yojson
    (x : hyper_parameter_tuning_job_consumed_resources) =
  assoc_to_yojson [ ("RuntimeInSeconds", option_to_yojson integer_to_yojson x.runtime_in_seconds) ]

let hyper_parameter_tuning_job_completion_details_to_yojson
    (x : hyper_parameter_tuning_job_completion_details) =
  assoc_to_yojson
    [
      ( "NumberOfTrainingJobsObjectiveNotImproving",
        option_to_yojson integer_to_yojson x.number_of_training_jobs_objective_not_improving );
      ("ConvergenceDetectedTime", option_to_yojson timestamp_to_yojson x.convergence_detected_time);
    ]

let final_hyper_parameter_tuning_job_objective_metric_to_yojson
    (x : final_hyper_parameter_tuning_job_objective_metric) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson hyper_parameter_tuning_job_objective_type_to_yojson x.type_);
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("Value", Some (metric_value_to_yojson x.value));
    ]

let training_job_status_to_yojson (x : training_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | DELETING -> `String "Deleting"

let hyper_parameter_training_job_summary_to_yojson (x : hyper_parameter_training_job_summary) =
  assoc_to_yojson
    [
      ( "TrainingJobDefinitionName",
        option_to_yojson hyper_parameter_training_job_definition_name_to_yojson
          x.training_job_definition_name );
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("TuningJobName", option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.tuning_job_name);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("TunedHyperParameters", Some (hyper_parameters_to_yojson x.tuned_hyper_parameters));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "FinalHyperParameterTuningJobObjectiveMetric",
        option_to_yojson final_hyper_parameter_tuning_job_objective_metric_to_yojson
          x.final_hyper_parameter_tuning_job_objective_metric );
      ("ObjectiveStatus", option_to_yojson objective_status_to_yojson x.objective_status);
    ]

let objective_status_counter_to_yojson = int_to_yojson

let objective_status_counters_to_yojson (x : objective_status_counters) =
  assoc_to_yojson
    [
      ("Succeeded", option_to_yojson objective_status_counter_to_yojson x.succeeded);
      ("Pending", option_to_yojson objective_status_counter_to_yojson x.pending);
      ("Failed", option_to_yojson objective_status_counter_to_yojson x.failed);
    ]

let training_job_status_counter_to_yojson = int_to_yojson

let training_job_status_counters_to_yojson (x : training_job_status_counters) =
  assoc_to_yojson
    [
      ("Completed", option_to_yojson training_job_status_counter_to_yojson x.completed);
      ("InProgress", option_to_yojson training_job_status_counter_to_yojson x.in_progress);
      ("RetryableError", option_to_yojson training_job_status_counter_to_yojson x.retryable_error);
      ( "NonRetryableError",
        option_to_yojson training_job_status_counter_to_yojson x.non_retryable_error );
      ("Stopped", option_to_yojson training_job_status_counter_to_yojson x.stopped);
    ]

let hyper_parameter_tuning_job_status_to_yojson (x : hyper_parameter_tuning_job_status) =
  match x with
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"

let describe_hyper_parameter_tuning_job_response_to_yojson
    (x : describe_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
      ( "HyperParameterTuningJobConfig",
        Some (hyper_parameter_tuning_job_config_to_yojson x.hyper_parameter_tuning_job_config) );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "HyperParameterTuningJobStatus",
        Some (hyper_parameter_tuning_job_status_to_yojson x.hyper_parameter_tuning_job_status) );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "TrainingJobStatusCounters",
        Some (training_job_status_counters_to_yojson x.training_job_status_counters) );
      ( "ObjectiveStatusCounters",
        Some (objective_status_counters_to_yojson x.objective_status_counters) );
      ( "BestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.best_training_job );
      ( "OverallBestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.overall_best_training_job
      );
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ("Autotune", option_to_yojson autotune_to_yojson x.autotune);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "TuningJobCompletionDetails",
        option_to_yojson hyper_parameter_tuning_job_completion_details_to_yojson
          x.tuning_job_completion_details );
      ( "ConsumedResources",
        option_to_yojson hyper_parameter_tuning_job_consumed_resources_to_yojson
          x.consumed_resources );
    ]

let describe_hyper_parameter_tuning_job_request_to_yojson
    (x : describe_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let image_status_to_yojson (x : image_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETING -> `String "DELETING"
  | DELETE_FAILED -> `String "DELETE_FAILED"

let describe_image_response_to_yojson (x : describe_image_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn);
      ("ImageName", option_to_yojson image_name_to_yojson x.image_name);
      ("ImageStatus", option_to_yojson image_status_to_yojson x.image_status);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let describe_image_request_to_yojson (x : describe_image_request) =
  assoc_to_yojson [ ("ImageName", Some (image_name_to_yojson x.image_name)) ]

let image_version_status_to_yojson (x : image_version_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | DELETE_FAILED -> `String "DELETE_FAILED"

let image_container_image_to_yojson = string_to_yojson

let describe_image_version_response_to_yojson (x : describe_image_version_response) =
  assoc_to_yojson
    [
      ("BaseImage", option_to_yojson image_base_image_to_yojson x.base_image);
      ("ContainerImage", option_to_yojson image_container_image_to_yojson x.container_image);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn);
      ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn);
      ("ImageVersionStatus", option_to_yojson image_version_status_to_yojson x.image_version_status);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
    ]

let describe_image_version_request_to_yojson (x : describe_image_version_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
    ]

let inference_component_capacity_size_type_to_yojson (x : inference_component_capacity_size_type) =
  match x with COPY_COUNT -> `String "COPY_COUNT" | CAPACITY_PERCENT -> `String "CAPACITY_PERCENT"

let inference_component_capacity_size_to_yojson (x : inference_component_capacity_size) =
  assoc_to_yojson
    [
      ("Type", Some (inference_component_capacity_size_type_to_yojson x.type_));
      ("Value", Some (capacity_size_value_to_yojson x.value));
    ]

let inference_component_rolling_update_policy_to_yojson
    (x : inference_component_rolling_update_policy) =
  assoc_to_yojson
    [
      ("MaximumBatchSize", Some (inference_component_capacity_size_to_yojson x.maximum_batch_size));
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
      ( "RollbackMaximumBatchSize",
        option_to_yojson inference_component_capacity_size_to_yojson x.rollback_maximum_batch_size
      );
    ]

let inference_component_deployment_config_to_yojson (x : inference_component_deployment_config) =
  assoc_to_yojson
    [
      ( "RollingUpdatePolicy",
        Some (inference_component_rolling_update_policy_to_yojson x.rolling_update_policy) );
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_config_to_yojson x.auto_rollback_configuration );
    ]

let inference_component_status_to_yojson (x : inference_component_status) =
  match x with
  | IN_SERVICE -> `String "InService"
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"

let inference_component_placement_status_to_yojson (x : inference_component_placement_status) =
  assoc_to_yojson
    [
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("CurrentCopyCount", Some (inference_component_copy_count_to_yojson x.current_copy_count));
    ]

let inference_component_placement_status_list_to_yojson tree =
  list_to_yojson inference_component_placement_status_to_yojson tree

let inference_component_runtime_config_summary_to_yojson
    (x : inference_component_runtime_config_summary) =
  assoc_to_yojson
    [
      ( "DesiredCopyCount",
        option_to_yojson inference_component_copy_count_to_yojson x.desired_copy_count );
      ( "CurrentCopyCount",
        option_to_yojson inference_component_copy_count_to_yojson x.current_copy_count );
      ( "PlacementStatus",
        option_to_yojson inference_component_placement_status_list_to_yojson x.placement_status );
    ]

let inference_component_data_cache_config_summary_to_yojson
    (x : inference_component_data_cache_config_summary) =
  assoc_to_yojson [ ("EnableCaching", Some (enable_caching_to_yojson x.enable_caching)) ]

let inference_component_container_specification_summary_to_yojson
    (x : inference_component_container_specification_summary) =
  assoc_to_yojson
    [
      ("DeployedImage", option_to_yojson deployed_image_to_yojson x.deployed_image);
      ("ArtifactUrl", option_to_yojson url_to_yojson x.artifact_url);
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
    ]

let inference_component_specification_summary_to_yojson
    (x : inference_component_specification_summary) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "Container",
        option_to_yojson inference_component_container_specification_summary_to_yojson x.container
      );
      ( "StartupParameters",
        option_to_yojson inference_component_startup_parameters_to_yojson x.startup_parameters );
      ( "ComputeResourceRequirements",
        option_to_yojson inference_component_compute_resource_requirements_to_yojson
          x.compute_resource_requirements );
      ( "BaseInferenceComponentName",
        option_to_yojson inference_component_name_to_yojson x.base_inference_component_name );
      ( "DataCacheConfig",
        option_to_yojson inference_component_data_cache_config_summary_to_yojson x.data_cache_config
      );
      ( "SchedulingConfig",
        option_to_yojson inference_component_scheduling_config_to_yojson x.scheduling_config );
    ]

let inference_component_specification_summary_list_to_yojson tree =
  list_to_yojson inference_component_specification_summary_to_yojson tree

let describe_inference_component_output_to_yojson (x : describe_inference_component_output) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("VariantName", option_to_yojson variant_name_to_yojson x.variant_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "Specification",
        option_to_yojson inference_component_specification_summary_to_yojson x.specification );
      ( "Specifications",
        option_to_yojson inference_component_specification_summary_list_to_yojson x.specifications
      );
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_summary_to_yojson x.runtime_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ( "InferenceComponentStatus",
        option_to_yojson inference_component_status_to_yojson x.inference_component_status );
      ( "LastDeploymentConfig",
        option_to_yojson inference_component_deployment_config_to_yojson x.last_deployment_config );
    ]

let describe_inference_component_input_to_yojson (x : describe_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let model_variant_status_to_yojson (x : model_variant_status) =
  match x with
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | IN_SERVICE -> `String "InService"
  | DELETING -> `String "Deleting"
  | DELETED -> `String "Deleted"

let model_variant_config_summary_to_yojson (x : model_variant_config_summary) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("VariantName", Some (model_variant_name_to_yojson x.variant_name));
      ("InfrastructureConfig", Some (model_infrastructure_config_to_yojson x.infrastructure_config));
      ("Status", Some (model_variant_status_to_yojson x.status));
    ]

let model_variant_config_summary_list_to_yojson tree =
  list_to_yojson model_variant_config_summary_to_yojson tree

let endpoint_metadata_to_yojson (x : endpoint_metadata) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointConfigName", option_to_yojson endpoint_config_name_to_yojson x.endpoint_config_name);
      ("EndpointStatus", option_to_yojson endpoint_status_to_yojson x.endpoint_status);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let inference_experiment_status_reason_to_yojson = string_to_yojson

let inference_experiment_status_to_yojson (x : inference_experiment_status) =
  match x with
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | UPDATING -> `String "Updating"
  | RUNNING -> `String "Running"
  | STARTING -> `String "Starting"
  | STOPPING -> `String "Stopping"
  | COMPLETED -> `String "Completed"
  | CANCELLED -> `String "Cancelled"

let describe_inference_experiment_response_to_yojson (x : describe_inference_experiment_response) =
  assoc_to_yojson
    [
      ("Arn", Some (inference_experiment_arn_to_yojson x.arn));
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Status", Some (inference_experiment_status_to_yojson x.status));
      ("StatusReason", option_to_yojson inference_experiment_status_reason_to_yojson x.status_reason);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("EndpointMetadata", Some (endpoint_metadata_to_yojson x.endpoint_metadata));
      ("ModelVariants", Some (model_variant_config_summary_list_to_yojson x.model_variants));
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ShadowModeConfig", option_to_yojson shadow_mode_config_to_yojson x.shadow_mode_config);
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
    ]

let describe_inference_experiment_request_to_yojson (x : describe_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let inference_metrics_to_yojson (x : inference_metrics) =
  assoc_to_yojson
    [
      ("MaxInvocations", Some (integer_to_yojson x.max_invocations));
      ("ModelLatency", Some (integer_to_yojson x.model_latency));
    ]

let endpoint_performance_to_yojson (x : endpoint_performance) =
  assoc_to_yojson
    [
      ("Metrics", Some (inference_metrics_to_yojson x.metrics));
      ("EndpointInfo", Some (endpoint_info_to_yojson x.endpoint_info));
    ]

let endpoint_performances_to_yojson tree = list_to_yojson endpoint_performance_to_yojson tree
let invocation_start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let invocation_end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let recommendation_job_compilation_job_name_to_yojson = string_to_yojson

let environment_parameter_to_yojson (x : environment_parameter) =
  assoc_to_yojson
    [
      ("Key", Some (string__to_yojson x.key));
      ("ValueType", Some (string__to_yojson x.value_type));
      ("Value", Some (string__to_yojson x.value));
    ]

let environment_parameters_to_yojson tree = list_to_yojson environment_parameter_to_yojson tree

let model_configuration_to_yojson (x : model_configuration) =
  assoc_to_yojson
    [
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
      ( "EnvironmentParameters",
        option_to_yojson environment_parameters_to_yojson x.environment_parameters );
      ( "CompilationJobName",
        option_to_yojson recommendation_job_compilation_job_name_to_yojson x.compilation_job_name );
    ]

let initial_instance_count_to_yojson = int_to_yojson

let endpoint_output_configuration_to_yojson (x : endpoint_output_configuration) =
  assoc_to_yojson
    [
      ("EndpointName", Some (string__to_yojson x.endpoint_name));
      ("VariantName", Some (string__to_yojson x.variant_name));
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ( "InitialInstanceCount",
        option_to_yojson initial_instance_count_to_yojson x.initial_instance_count );
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
    ]

let model_setup_time_to_yojson = int_to_yojson
let utilization_metric_to_yojson = float_to_yojson

let recommendation_metrics_to_yojson (x : recommendation_metrics) =
  assoc_to_yojson
    [
      ("CostPerHour", option_to_yojson float__to_yojson x.cost_per_hour);
      ("CostPerInference", option_to_yojson float__to_yojson x.cost_per_inference);
      ("MaxInvocations", option_to_yojson integer_to_yojson x.max_invocations);
      ("ModelLatency", option_to_yojson integer_to_yojson x.model_latency);
      ("CpuUtilization", option_to_yojson utilization_metric_to_yojson x.cpu_utilization);
      ("MemoryUtilization", option_to_yojson utilization_metric_to_yojson x.memory_utilization);
      ("ModelSetupTime", option_to_yojson model_setup_time_to_yojson x.model_setup_time);
    ]

let inference_recommendation_to_yojson (x : inference_recommendation) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ("Metrics", option_to_yojson recommendation_metrics_to_yojson x.metrics);
      ( "EndpointConfiguration",
        Some (endpoint_output_configuration_to_yojson x.endpoint_configuration) );
      ("ModelConfiguration", Some (model_configuration_to_yojson x.model_configuration));
      ("InvocationEndTime", option_to_yojson invocation_end_time_to_yojson x.invocation_end_time);
      ( "InvocationStartTime",
        option_to_yojson invocation_start_time_to_yojson x.invocation_start_time );
    ]

let inference_recommendations_to_yojson tree =
  list_to_yojson inference_recommendation_to_yojson tree

let recommendation_job_status_to_yojson (x : recommendation_job_status) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"

let describe_inference_recommendations_job_response_to_yojson
    (x : describe_inference_recommendations_job_response) =
  assoc_to_yojson
    [
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("JobDescription", option_to_yojson recommendation_job_description_to_yojson x.job_description);
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("InputConfig", Some (recommendation_job_input_config_to_yojson x.input_config));
      ( "StoppingConditions",
        option_to_yojson recommendation_job_stopping_conditions_to_yojson x.stopping_conditions );
      ( "InferenceRecommendations",
        option_to_yojson inference_recommendations_to_yojson x.inference_recommendations );
      ( "EndpointPerformances",
        option_to_yojson endpoint_performances_to_yojson x.endpoint_performances );
    ]

let describe_inference_recommendations_job_request_to_yojson
    (x : describe_inference_recommendations_job_request) =
  assoc_to_yojson [ ("JobName", Some (recommendation_job_name_to_yojson x.job_name)) ]

let job_secondary_status_to_yojson (x : job_secondary_status) =
  match x with
  | STARTING -> `String "Starting"
  | DOWNLOADING -> `String "Downloading"
  | TRAINING -> `String "Training"
  | UPLOADING -> `String "Uploading"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | MAX_RUNTIME_EXCEEDED -> `String "MaxRuntimeExceeded"
  | INTERRUPTED -> `String "Interrupted"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | RESTARTING -> `String "Restarting"
  | PENDING -> `String "Pending"
  | EVALUATING -> `String "Evaluating"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"

let job_secondary_status_transition_to_yojson (x : job_secondary_status_transition) =
  assoc_to_yojson
    [
      ("Status", Some (job_secondary_status_to_yojson x.status));
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
    ]

let job_secondary_status_transitions_to_yojson tree =
  list_to_yojson job_secondary_status_transition_to_yojson tree

let job_status_to_yojson (x : job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"

let describe_job_response_to_yojson (x : describe_job_response) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobArn", Some (job_arn_to_yojson x.job_arn));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobConfigDocument", option_to_yojson job_config_document_to_yojson x.job_config_document);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("SecondaryStatus", Some (job_secondary_status_to_yojson x.secondary_status));
      ( "SecondaryStatusTransitions",
        Some (job_secondary_status_transitions_to_yojson x.secondary_status_transitions) );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_job_request_to_yojson (x : describe_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let describe_job_schema_version_response_to_yojson (x : describe_job_schema_version_response) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobConfigSchema", Some (job_config_document_to_yojson x.job_config_schema));
    ]

let describe_job_schema_version_request_to_yojson (x : describe_job_schema_version_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ( "JobConfigSchemaVersion",
        option_to_yojson job_schema_version_to_yojson x.job_config_schema_version );
    ]

let labeling_job_output_to_yojson (x : labeling_job_output) =
  assoc_to_yojson
    [
      ("OutputDatasetS3Uri", Some (s3_uri_to_yojson x.output_dataset_s3_uri));
      ( "FinalActiveLearningModelArn",
        option_to_yojson model_arn_to_yojson x.final_active_learning_model_arn );
    ]

let job_reference_code_to_yojson = string_to_yojson
let label_counter_to_yojson = int_to_yojson

let label_counters_to_yojson (x : label_counters) =
  assoc_to_yojson
    [
      ("TotalLabeled", option_to_yojson label_counter_to_yojson x.total_labeled);
      ("HumanLabeled", option_to_yojson label_counter_to_yojson x.human_labeled);
      ("MachineLabeled", option_to_yojson label_counter_to_yojson x.machine_labeled);
      ( "FailedNonRetryableError",
        option_to_yojson label_counter_to_yojson x.failed_non_retryable_error );
      ("Unlabeled", option_to_yojson label_counter_to_yojson x.unlabeled);
    ]

let labeling_job_status_to_yojson (x : labeling_job_status) =
  match x with
  | INITIALIZING -> `String "Initializing"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let describe_labeling_job_response_to_yojson (x : describe_labeling_job_response) =
  assoc_to_yojson
    [
      ("LabelingJobStatus", Some (labeling_job_status_to_yojson x.labeling_job_status));
      ("LabelCounters", Some (label_counters_to_yojson x.label_counters));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("JobReferenceCode", Some (job_reference_code_to_yojson x.job_reference_code));
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
      ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn));
      ("LabelAttributeName", option_to_yojson label_attribute_name_to_yojson x.label_attribute_name);
      ("InputConfig", Some (labeling_job_input_config_to_yojson x.input_config));
      ("OutputConfig", Some (labeling_job_output_config_to_yojson x.output_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("LabelCategoryConfigS3Uri", option_to_yojson s3_uri_to_yojson x.label_category_config_s3_uri);
      ( "StoppingConditions",
        option_to_yojson labeling_job_stopping_conditions_to_yojson x.stopping_conditions );
      ( "LabelingJobAlgorithmsConfig",
        option_to_yojson labeling_job_algorithms_config_to_yojson x.labeling_job_algorithms_config
      );
      ("HumanTaskConfig", Some (human_task_config_to_yojson x.human_task_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LabelingJobOutput", option_to_yojson labeling_job_output_to_yojson x.labeling_job_output);
    ]

let describe_labeling_job_request_to_yojson (x : describe_labeling_job_request) =
  assoc_to_yojson [ ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name)) ]

let describe_lineage_group_response_to_yojson (x : describe_lineage_group_response) =
  assoc_to_yojson
    [
      ("LineageGroupName", option_to_yojson experiment_entity_name_to_yojson x.lineage_group_name);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let describe_lineage_group_request_to_yojson (x : describe_lineage_group_request) =
  assoc_to_yojson
    [ ("LineageGroupName", Some (experiment_entity_name_to_yojson x.lineage_group_name)) ]

let maintenance_status_to_yojson (x : maintenance_status) =
  match x with
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"

let mlflow_app_status_to_yojson (x : mlflow_app_status) =
  match x with
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | CREATE_FAILED -> `String "CreateFailed"
  | UPDATING -> `String "Updating"
  | UPDATED -> `String "Updated"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETED -> `String "Deleted"

let describe_mlflow_app_response_to_yojson (x : describe_mlflow_app_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn);
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ("MaintenanceStatus", option_to_yojson maintenance_status_to_yojson x.maintenance_status);
    ]

let describe_mlflow_app_request_to_yojson (x : describe_mlflow_app_request) =
  assoc_to_yojson [ ("Arn", Some (mlflow_app_arn_to_yojson x.arn)) ]

let is_tracking_server_active_to_yojson (x : is_tracking_server_active) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let tracking_server_maintenance_status_to_yojson (x : tracking_server_maintenance_status) =
  match x with
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"

let tracking_server_status_to_yojson (x : tracking_server_status) =
  match x with
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | CREATE_FAILED -> `String "CreateFailed"
  | UPDATING -> `String "Updating"
  | UPDATED -> `String "Updated"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | STOP_FAILED -> `String "StopFailed"
  | STARTING -> `String "Starting"
  | STARTED -> `String "Started"
  | START_FAILED -> `String "StartFailed"
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"

let describe_mlflow_tracking_server_response_to_yojson
    (x : describe_mlflow_tracking_server_response) =
  assoc_to_yojson
    [
      ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn);
      ("TrackingServerName", option_to_yojson tracking_server_name_to_yojson x.tracking_server_name);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ( "TrackingServerMaintenanceStatus",
        option_to_yojson tracking_server_maintenance_status_to_yojson
          x.tracking_server_maintenance_status );
      ("IsActive", option_to_yojson is_tracking_server_active_to_yojson x.is_active);
      ("TrackingServerUrl", option_to_yojson tracking_server_url_to_yojson x.tracking_server_url);
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
    ]

let describe_mlflow_tracking_server_request_to_yojson (x : describe_mlflow_tracking_server_request)
    =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let describe_model_output_to_yojson (x : describe_model_output) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ModelArn", Some (model_arn_to_yojson x.model_arn));
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "DeploymentRecommendation",
        option_to_yojson deployment_recommendation_to_yojson x.deployment_recommendation );
    ]

let describe_model_input_to_yojson (x : describe_model_input) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let describe_model_bias_job_definition_response_to_yojson
    (x : describe_model_bias_job_definition_response) =
  assoc_to_yojson
    [
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "ModelBiasBaselineConfig",
        option_to_yojson model_bias_baseline_config_to_yojson x.model_bias_baseline_config );
      ( "ModelBiasAppSpecification",
        Some (model_bias_app_specification_to_yojson x.model_bias_app_specification) );
      ("ModelBiasJobInput", Some (model_bias_job_input_to_yojson x.model_bias_job_input));
      ( "ModelBiasJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_bias_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
    ]

let describe_model_bias_job_definition_request_to_yojson
    (x : describe_model_bias_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let model_card_processing_status_to_yojson (x : model_card_processing_status) =
  match x with
  | DELETE_INPROGRESS -> `String "DeleteInProgress"
  | DELETE_PENDING -> `String "DeletePending"
  | CONTENT_DELETED -> `String "ContentDeleted"
  | EXPORTJOBS_DELETED -> `String "ExportJobsDeleted"
  | DELETE_COMPLETED -> `String "DeleteCompleted"
  | DELETE_FAILED -> `String "DeleteFailed"

let describe_model_card_response_to_yojson (x : describe_model_card_response) =
  assoc_to_yojson
    [
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("Content", Some (model_card_content_to_yojson x.content));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("CreatedBy", Some (user_context_to_yojson x.created_by));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "ModelCardProcessingStatus",
        option_to_yojson model_card_processing_status_to_yojson x.model_card_processing_status );
    ]

let included_data_to_yojson (x : included_data) =
  match x with ALL_DATA -> `String "AllData" | METADATA_ONLY -> `String "MetadataOnly"

let describe_model_card_request_to_yojson (x : describe_model_card_request) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("IncludedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let model_card_export_artifacts_to_yojson (x : model_card_export_artifacts) =
  assoc_to_yojson [ ("S3ExportArtifacts", Some (s3_uri_to_yojson x.s3_export_artifacts)) ]

let model_card_export_job_status_to_yojson (x : model_card_export_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"

let describe_model_card_export_job_response_to_yojson (x : describe_model_card_export_job_response)
    =
  assoc_to_yojson
    [
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
      ("Status", Some (model_card_export_job_status_to_yojson x.status));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("OutputConfig", Some (model_card_export_output_config_to_yojson x.output_config));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("LastModifiedAt", Some (timestamp_to_yojson x.last_modified_at));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ExportArtifacts", option_to_yojson model_card_export_artifacts_to_yojson x.export_artifacts);
    ]

let describe_model_card_export_job_request_to_yojson (x : describe_model_card_export_job_request) =
  assoc_to_yojson
    [
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
    ]

let describe_model_explainability_job_definition_response_to_yojson
    (x : describe_model_explainability_job_definition_response) =
  assoc_to_yojson
    [
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "ModelExplainabilityBaselineConfig",
        option_to_yojson model_explainability_baseline_config_to_yojson
          x.model_explainability_baseline_config );
      ( "ModelExplainabilityAppSpecification",
        Some
          (model_explainability_app_specification_to_yojson x.model_explainability_app_specification)
      );
      ( "ModelExplainabilityJobInput",
        Some (model_explainability_job_input_to_yojson x.model_explainability_job_input) );
      ( "ModelExplainabilityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_explainability_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
    ]

let describe_model_explainability_job_definition_request_to_yojson
    (x : describe_model_explainability_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let detailed_model_package_status_to_yojson (x : detailed_model_package_status) =
  match x with
  | NOT_STARTED -> `String "NotStarted"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"

let model_package_status_item_to_yojson (x : model_package_status_item) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Status", Some (detailed_model_package_status_to_yojson x.status));
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
    ]

let model_package_status_item_list_to_yojson tree =
  list_to_yojson model_package_status_item_to_yojson tree

let model_package_status_details_to_yojson (x : model_package_status_details) =
  assoc_to_yojson
    [
      ("ValidationStatuses", Some (model_package_status_item_list_to_yojson x.validation_statuses));
      ( "ImageScanStatuses",
        option_to_yojson model_package_status_item_list_to_yojson x.image_scan_statuses );
    ]

let describe_model_package_output_to_yojson (x : describe_model_package_output) =
  assoc_to_yojson
    [
      ("ModelPackageName", Some (entity_name_to_yojson x.model_package_name));
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ( "ModelPackageStatusDetails",
        Some (model_package_status_details_to_yojson x.model_package_status_details) );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("SamplePayloadUrl", option_to_yojson string__to_yojson x.sample_payload_url);
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
    ]

let describe_model_package_input_to_yojson (x : describe_model_package_input) =
  assoc_to_yojson
    [
      ("ModelPackageName", Some (versioned_arn_or_name_to_yojson x.model_package_name));
      ("IncludedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let model_package_group_status_to_yojson (x : model_package_group_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"
  | DELETE_FAILED -> `String "DeleteFailed"

let describe_model_package_group_output_to_yojson (x : describe_model_package_group_output) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CreatedBy", Some (user_context_to_yojson x.created_by));
      ( "ModelPackageGroupStatus",
        Some (model_package_group_status_to_yojson x.model_package_group_status) );
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
    ]

let describe_model_package_group_input_to_yojson (x : describe_model_package_group_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (arn_or_name_to_yojson x.model_package_group_name)) ]

let describe_model_quality_job_definition_response_to_yojson
    (x : describe_model_quality_job_definition_response) =
  assoc_to_yojson
    [
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "ModelQualityBaselineConfig",
        option_to_yojson model_quality_baseline_config_to_yojson x.model_quality_baseline_config );
      ( "ModelQualityAppSpecification",
        Some (model_quality_app_specification_to_yojson x.model_quality_app_specification) );
      ("ModelQualityJobInput", Some (model_quality_job_input_to_yojson x.model_quality_job_input));
      ( "ModelQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_quality_job_output_config) );
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
    ]

let describe_model_quality_job_definition_request_to_yojson
    (x : describe_model_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let execution_status_to_yojson (x : execution_status) =
  match x with
  | PENDING -> `String "Pending"
  | COMPLETED -> `String "Completed"
  | COMPLETED_WITH_VIOLATIONS -> `String "CompletedWithViolations"
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let monitoring_execution_summary_to_yojson (x : monitoring_execution_summary) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("ScheduledTime", Some (timestamp_to_yojson x.scheduled_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("MonitoringExecutionStatus", Some (execution_status_to_yojson x.monitoring_execution_status));
      ("ProcessingJobArn", option_to_yojson processing_job_arn_to_yojson x.processing_job_arn);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
    ]

let schedule_status_to_yojson (x : schedule_status) =
  match x with
  | PENDING -> `String "Pending"
  | FAILED -> `String "Failed"
  | SCHEDULED -> `String "Scheduled"
  | STOPPED -> `String "Stopped"

let describe_monitoring_schedule_response_to_yojson (x : describe_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("MonitoringScheduleStatus", Some (schedule_status_to_yojson x.monitoring_schedule_status));
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
    ]

let describe_monitoring_schedule_request_to_yojson (x : describe_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let network_interface_id_to_yojson = string_to_yojson

let notebook_instance_status_to_yojson (x : notebook_instance_status) =
  match x with
  | Pending -> `String "Pending"
  | InService -> `String "InService"
  | Stopping -> `String "Stopping"
  | Stopped -> `String "Stopped"
  | Failed -> `String "Failed"
  | Deleting -> `String "Deleting"
  | Updating -> `String "Updating"

let describe_notebook_instance_output_to_yojson (x : describe_notebook_instance_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceArn",
        option_to_yojson notebook_instance_arn_to_yojson x.notebook_instance_arn );
      ( "NotebookInstanceName",
        option_to_yojson notebook_instance_name_to_yojson x.notebook_instance_name );
      ( "NotebookInstanceStatus",
        option_to_yojson notebook_instance_status_to_yojson x.notebook_instance_status );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Url", option_to_yojson notebook_instance_url_to_yojson x.url);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ( "DirectInternetAccess",
        option_to_yojson direct_internet_access_to_yojson x.direct_internet_access );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
    ]

let describe_notebook_instance_input_to_yojson (x : describe_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let describe_notebook_instance_lifecycle_config_output_to_yojson
    (x : describe_notebook_instance_lifecycle_config_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigArn",
        option_to_yojson notebook_instance_lifecycle_config_arn_to_yojson
          x.notebook_instance_lifecycle_config_arn );
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
    ]

let describe_notebook_instance_lifecycle_config_input_to_yojson
    (x : describe_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let optimization_output_to_yojson (x : optimization_output) =
  assoc_to_yojson
    [
      ( "RecommendedInferenceImage",
        option_to_yojson optimization_container_image_to_yojson x.recommended_inference_image );
    ]

let optimization_job_status_to_yojson (x : optimization_job_status) =
  match x with
  | INPROGRESS -> `String "INPROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STARTING -> `String "STARTING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let describe_optimization_job_response_to_yojson (x : describe_optimization_job_response) =
  assoc_to_yojson
    [
      ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn));
      ("OptimizationJobStatus", Some (optimization_job_status_to_yojson x.optimization_job_status));
      ("OptimizationStartTime", option_to_yojson timestamp_to_yojson x.optimization_start_time);
      ("OptimizationEndTime", option_to_yojson timestamp_to_yojson x.optimization_end_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
      ("ModelSource", Some (optimization_job_model_source_to_yojson x.model_source));
      ( "OptimizationEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.optimization_environment
      );
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ("OptimizationConfigs", Some (optimization_configs_to_yojson x.optimization_configs));
      ("OutputConfig", Some (optimization_job_output_config_to_yojson x.output_config));
      ("OptimizationOutput", option_to_yojson optimization_output_to_yojson x.optimization_output);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("VpcConfig", option_to_yojson optimization_vpc_config_to_yojson x.vpc_config);
    ]

let describe_optimization_job_request_to_yojson (x : describe_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let error_info_to_yojson (x : error_info) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson non_empty_string64_to_yojson x.code);
      ("Reason", option_to_yojson non_empty_string256_to_yojson x.reason);
    ]

let partner_app_status_to_yojson (x : partner_app_status) =
  match x with
  | CREATING -> `String "Creating"
  | UPDATING -> `String "Updating"
  | DELETING -> `String "Deleting"
  | AVAILABLE -> `String "Available"
  | FAILED -> `String "Failed"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | DELETED -> `String "Deleted"

let describe_partner_app_response_to_yojson (x : describe_partner_app_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn);
      ("Name", option_to_yojson partner_app_name_to_yojson x.name);
      ("Type", option_to_yojson partner_app_type_to_yojson x.type_);
      ("Status", option_to_yojson partner_app_status_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("BaseUrl", option_to_yojson string2048_to_yojson x.base_url);
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("Tier", option_to_yojson non_empty_string64_to_yojson x.tier);
      ("Version", option_to_yojson non_empty_string64_to_yojson x.version);
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ("AuthType", option_to_yojson partner_app_auth_type_to_yojson x.auth_type);
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ("Error", option_to_yojson error_info_to_yojson x.error);
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ("CurrentVersionEolDate", option_to_yojson timestamp_to_yojson x.current_version_eol_date);
      ("AvailableUpgrade", option_to_yojson available_upgrade_to_yojson x.available_upgrade);
    ]

let describe_partner_app_request_to_yojson (x : describe_partner_app_request) =
  assoc_to_yojson
    [
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
      ("IncludeAvailableUpgrade", option_to_yojson boolean__to_yojson x.include_available_upgrade);
    ]

let pipeline_version_description_to_yojson = string_to_yojson
let pipeline_version_name_to_yojson = string_to_yojson

let pipeline_status_to_yojson (x : pipeline_status) =
  match x with ACTIVE -> `String "Active" | DELETING -> `String "Deleting"

let describe_pipeline_response_to_yojson (x : describe_pipeline_response) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineStatus", option_to_yojson pipeline_status_to_yojson x.pipeline_status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastRunTime", option_to_yojson timestamp_to_yojson x.last_run_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
    ]

let pipeline_version_id_to_yojson = long_to_yojson
let pipeline_name_or_arn_to_yojson = string_to_yojson

let describe_pipeline_request_to_yojson (x : describe_pipeline_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
    ]

let describe_pipeline_definition_for_execution_response_to_yojson
    (x : describe_pipeline_definition_for_execution_response) =
  assoc_to_yojson
    [
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let describe_pipeline_definition_for_execution_request_to_yojson
    (x : describe_pipeline_definition_for_execution_request) =
  assoc_to_yojson
    [ ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn)) ]

let mlflow_experiment_entity_name_to_yojson = string_to_yojson
let m_lflow_arn_to_yojson = string_to_yojson

let m_lflow_configuration_to_yojson (x : m_lflow_configuration) =
  assoc_to_yojson
    [
      ("MlflowResourceArn", option_to_yojson m_lflow_arn_to_yojson x.mlflow_resource_arn);
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_entity_name_to_yojson x.mlflow_experiment_name );
    ]

let selected_step_to_yojson (x : selected_step) =
  assoc_to_yojson [ ("StepName", Some (string256_to_yojson x.step_name)) ]

let selected_step_list_to_yojson tree = list_to_yojson selected_step_to_yojson tree

let selective_execution_config_to_yojson (x : selective_execution_config) =
  assoc_to_yojson
    [
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
      ("SelectedSteps", Some (selected_step_list_to_yojson x.selected_steps));
    ]

let pipeline_execution_failure_reason_to_yojson = string_to_yojson

let pipeline_experiment_config_to_yojson (x : pipeline_experiment_config) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
    ]

let pipeline_execution_description_to_yojson = string_to_yojson

let pipeline_execution_status_to_yojson (x : pipeline_execution_status) =
  match x with
  | EXECUTING -> `String "Executing"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"

let pipeline_execution_name_to_yojson = string_to_yojson

let describe_pipeline_execution_response_to_yojson (x : describe_pipeline_execution_response) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExperimentConfig",
        option_to_yojson pipeline_experiment_config_to_yojson x.pipeline_experiment_config );
      ( "FailureReason",
        option_to_yojson pipeline_execution_failure_reason_to_yojson x.failure_reason );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("MLflowConfig", option_to_yojson m_lflow_configuration_to_yojson x.m_lflow_config);
    ]

let describe_pipeline_execution_request_to_yojson (x : describe_pipeline_execution_request) =
  assoc_to_yojson
    [ ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn)) ]

let exit_message_to_yojson = string_to_yojson

let processing_job_status_to_yojson (x : processing_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let describe_processing_job_response_to_yojson (x : describe_processing_job_response) =
  assoc_to_yojson
    [
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
      ("ProcessingResources", Some (processing_resources_to_yojson x.processing_resources));
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("AppSpecification", Some (app_specification_to_yojson x.app_specification));
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn));
      ("ProcessingJobStatus", Some (processing_job_status_to_yojson x.processing_job_status));
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("ProcessingStartTime", option_to_yojson timestamp_to_yojson x.processing_start_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
    ]

let describe_processing_job_request_to_yojson (x : describe_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let template_provider_detail_to_yojson (x : template_provider_detail) =
  assoc_to_yojson
    [
      ( "CfnTemplateProviderDetail",
        option_to_yojson cfn_template_provider_detail_to_yojson x.cfn_template_provider_detail );
    ]

let template_provider_detail_list_to_yojson tree =
  list_to_yojson template_provider_detail_to_yojson tree

let project_status_to_yojson (x : project_status) =
  match x with
  | PENDING -> `String "Pending"
  | CREATE_IN_PROGRESS -> `String "CreateInProgress"
  | CREATE_COMPLETED -> `String "CreateCompleted"
  | CREATE_FAILED -> `String "CreateFailed"
  | DELETE_IN_PROGRESS -> `String "DeleteInProgress"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETE_COMPLETED -> `String "DeleteCompleted"
  | UPDATE_IN_PROGRESS -> `String "UpdateInProgress"
  | UPDATE_COMPLETED -> `String "UpdateCompleted"
  | UPDATE_FAILED -> `String "UpdateFailed"

let provisioned_product_status_message_to_yojson = string_to_yojson

let service_catalog_provisioned_product_details_to_yojson
    (x : service_catalog_provisioned_product_details) =
  assoc_to_yojson
    [
      ( "ProvisionedProductId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioned_product_id );
      ( "ProvisionedProductStatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson
          x.provisioned_product_status_message );
    ]

let describe_project_output_to_yojson (x : describe_project_output) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
      ("ProjectId", Some (project_id_to_yojson x.project_id));
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ( "ServiceCatalogProvisionedProductDetails",
        option_to_yojson service_catalog_provisioned_product_details_to_yojson
          x.service_catalog_provisioned_product_details );
      ("ProjectStatus", Some (project_status_to_yojson x.project_status));
      ( "TemplateProviderDetails",
        option_to_yojson template_provider_detail_list_to_yojson x.template_provider_details );
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let describe_project_input_to_yojson (x : describe_project_input) =
  assoc_to_yojson [ ("ProjectName", Some (project_entity_name_to_yojson x.project_name)) ]

let unhealthy_instance_count_to_yojson = int_to_yojson
let ultra_server_count_to_yojson = int_to_yojson

let reserved_capacity_instance_type_to_yojson (x : reserved_capacity_instance_type) =
  match x with
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"

let ultra_server_type_to_yojson = string_to_yojson

let ultra_server_summary_to_yojson (x : ultra_server_summary) =
  assoc_to_yojson
    [
      ("UltraServerType", Some (ultra_server_type_to_yojson x.ultra_server_type));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
    ]

let in_use_instance_count_to_yojson = int_to_yojson
let total_instance_count_to_yojson = int_to_yojson
let reserved_capacity_duration_minutes_to_yojson = long_to_yojson
let reserved_capacity_duration_hours_to_yojson = long_to_yojson

let reserved_capacity_status_to_yojson (x : reserved_capacity_status) =
  match x with
  | PENDING -> `String "Pending"
  | ACTIVE -> `String "Active"
  | SCHEDULED -> `String "Scheduled"
  | EXPIRED -> `String "Expired"
  | FAILED -> `String "Failed"

let reserved_capacity_type_to_yojson (x : reserved_capacity_type) =
  match x with ULTRASERVER -> `String "UltraServer" | INSTANCE -> `String "Instance"

let reserved_capacity_arn_to_yojson = string_to_yojson

let describe_reserved_capacity_response_to_yojson (x : describe_reserved_capacity_response) =
  assoc_to_yojson
    [
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
      ("Status", option_to_yojson reserved_capacity_status_to_yojson x.status);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ("UltraServerSummary", option_to_yojson ultra_server_summary_to_yojson x.ultra_server_summary);
    ]

let describe_reserved_capacity_request_to_yojson (x : describe_reserved_capacity_request) =
  assoc_to_yojson
    [ ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn)) ]

let space_status_to_yojson (x : space_status) =
  match x with
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"
  | InService -> `String "InService"
  | Pending -> `String "Pending"
  | Updating -> `String "Updating"
  | Update_Failed -> `String "Update_Failed"
  | Delete_Failed -> `String "Delete_Failed"

let efs_uid_to_yojson = string_to_yojson

let describe_space_response_to_yojson (x : describe_space_response) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("HomeEfsFileSystemUid", option_to_yojson efs_uid_to_yojson x.home_efs_file_system_uid);
      ("Status", option_to_yojson space_status_to_yojson x.status);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("OwnershipSettings", option_to_yojson ownership_settings_to_yojson x.ownership_settings);
      ( "SpaceSharingSettings",
        option_to_yojson space_sharing_settings_to_yojson x.space_sharing_settings );
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
      ("Url", option_to_yojson string1024_to_yojson x.url);
    ]

let describe_space_request_to_yojson (x : describe_space_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpaceName", Some (space_name_to_yojson x.space_name));
    ]

let describe_studio_lifecycle_config_response_to_yojson
    (x : describe_studio_lifecycle_config_response) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
      ( "StudioLifecycleConfigName",
        option_to_yojson studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "StudioLifecycleConfigContent",
        option_to_yojson studio_lifecycle_config_content_to_yojson x.studio_lifecycle_config_content
      );
      ( "StudioLifecycleConfigAppType",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson
          x.studio_lifecycle_config_app_type );
    ]

let describe_studio_lifecycle_config_request_to_yojson
    (x : describe_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
    ]

let subscribed_workteam_to_yojson (x : subscribed_workteam) =
  assoc_to_yojson
    [
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("MarketplaceTitle", option_to_yojson string200_to_yojson x.marketplace_title);
      ("SellerName", option_to_yojson string__to_yojson x.seller_name);
      ("MarketplaceDescription", option_to_yojson string200_to_yojson x.marketplace_description);
      ("ListingId", option_to_yojson string__to_yojson x.listing_id);
    ]

let describe_subscribed_workteam_response_to_yojson (x : describe_subscribed_workteam_response) =
  assoc_to_yojson
    [ ("SubscribedWorkteam", Some (subscribed_workteam_to_yojson x.subscribed_workteam)) ]

let describe_subscribed_workteam_request_to_yojson (x : describe_subscribed_workteam_request) =
  assoc_to_yojson [ ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn)) ]

let training_epoch_count_to_yojson = long_to_yojson
let training_epoch_index_to_yojson = long_to_yojson
let training_step_index_to_yojson = long_to_yojson
let total_step_count_per_epoch_to_yojson = long_to_yojson

let training_progress_info_to_yojson (x : training_progress_info) =
  assoc_to_yojson
    [
      ( "TotalStepCountPerEpoch",
        option_to_yojson total_step_count_per_epoch_to_yojson x.total_step_count_per_epoch );
      ("CurrentStep", option_to_yojson training_step_index_to_yojson x.current_step);
      ("CurrentEpoch", option_to_yojson training_epoch_index_to_yojson x.current_epoch);
      ("MaxEpoch", option_to_yojson training_epoch_count_to_yojson x.max_epoch);
    ]

let mlflow_run_id_to_yojson = string_to_yojson
let mlflow_experiment_id_to_yojson = string_to_yojson

let mlflow_details_to_yojson (x : mlflow_details) =
  assoc_to_yojson
    [
      ("MlflowExperimentId", option_to_yojson mlflow_experiment_id_to_yojson x.mlflow_experiment_id);
      ("MlflowRunId", option_to_yojson mlflow_run_id_to_yojson x.mlflow_run_id);
    ]

let profiling_status_to_yojson (x : profiling_status) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let profiler_rule_evaluation_status_to_yojson (x : profiler_rule_evaluation_status) =
  assoc_to_yojson
    [
      ( "RuleConfigurationName",
        option_to_yojson rule_configuration_name_to_yojson x.rule_configuration_name );
      ( "RuleEvaluationJobArn",
        option_to_yojson processing_job_arn_to_yojson x.rule_evaluation_job_arn );
      ( "RuleEvaluationStatus",
        option_to_yojson rule_evaluation_status_to_yojson x.rule_evaluation_status );
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let profiler_rule_evaluation_statuses_to_yojson tree =
  list_to_yojson profiler_rule_evaluation_status_to_yojson tree

let training_time_in_seconds_to_yojson = int_to_yojson

let metric_data_to_yojson (x : metric_data) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("Value", option_to_yojson float__to_yojson x.value);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let final_metric_data_list_to_yojson tree = list_to_yojson metric_data_to_yojson tree
let status_message_to_yojson = string_to_yojson

let secondary_status_to_yojson (x : secondary_status) =
  match x with
  | STARTING -> `String "Starting"
  | LAUNCHING_ML_INSTANCES -> `String "LaunchingMLInstances"
  | PREPARING_TRAINING_STACK -> `String "PreparingTrainingStack"
  | DOWNLOADING -> `String "Downloading"
  | DOWNLOADING_TRAINING_IMAGE -> `String "DownloadingTrainingImage"
  | TRAINING -> `String "Training"
  | UPLOADING -> `String "Uploading"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | MAX_RUNTIME_EXCEEDED -> `String "MaxRuntimeExceeded"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | INTERRUPTED -> `String "Interrupted"
  | MAX_WAIT_TIME_EXCEEDED -> `String "MaxWaitTimeExceeded"
  | UPDATING -> `String "Updating"
  | RESTARTING -> `String "Restarting"
  | PENDING -> `String "Pending"

let secondary_status_transition_to_yojson (x : secondary_status_transition) =
  assoc_to_yojson
    [
      ("Status", Some (secondary_status_to_yojson x.status));
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let secondary_status_transitions_to_yojson tree =
  list_to_yojson secondary_status_transition_to_yojson tree

let resource_retained_billable_time_in_seconds_to_yojson = int_to_yojson

let warm_pool_resource_status_to_yojson (x : warm_pool_resource_status) =
  match x with
  | AVAILABLE -> `String "Available"
  | TERMINATED -> `String "Terminated"
  | REUSED -> `String "Reused"
  | INUSE -> `String "InUse"

let warm_pool_status_to_yojson (x : warm_pool_status) =
  assoc_to_yojson
    [
      ("Status", Some (warm_pool_resource_status_to_yojson x.status));
      ( "ResourceRetainedBillableTimeInSeconds",
        option_to_yojson resource_retained_billable_time_in_seconds_to_yojson
          x.resource_retained_billable_time_in_seconds );
      ("ReusedByJob", option_to_yojson training_job_name_to_yojson x.reused_by_job);
    ]

let describe_training_job_response_to_yojson (x : describe_training_job_response) =
  assoc_to_yojson
    [
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("TuningJobArn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.tuning_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("ModelArtifacts", Some (model_artifacts_to_yojson x.model_artifacts));
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("SecondaryStatus", Some (secondary_status_to_yojson x.secondary_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "SecondaryStatusTransitions",
        option_to_yojson secondary_status_transitions_to_yojson x.secondary_status_transitions );
      ( "FinalMetricDataList",
        option_to_yojson final_metric_data_list_to_yojson x.final_metric_data_list );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "TrainingTimeInSeconds",
        option_to_yojson training_time_in_seconds_to_yojson x.training_time_in_seconds );
      ( "BillableTimeInSeconds",
        option_to_yojson billable_time_in_seconds_to_yojson x.billable_time_in_seconds );
      ("BillableTokenCount", option_to_yojson billable_token_count_to_yojson x.billable_token_count);
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ( "DebugRuleEvaluationStatuses",
        option_to_yojson debug_rule_evaluation_statuses_to_yojson x.debug_rule_evaluation_statuses
      );
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ( "ProfilerRuleEvaluationStatuses",
        option_to_yojson profiler_rule_evaluation_statuses_to_yojson
          x.profiler_rule_evaluation_statuses );
      ("ProfilingStatus", option_to_yojson profiling_status_to_yojson x.profiling_status);
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("RemoteDebugConfig", option_to_yojson remote_debug_config_to_yojson x.remote_debug_config);
      ("InfraCheckConfig", option_to_yojson infra_check_config_to_yojson x.infra_check_config);
      ( "ServerlessJobConfig",
        option_to_yojson serverless_job_config_to_yojson x.serverless_job_config );
      ("MlflowConfig", option_to_yojson mlflow_config_to_yojson x.mlflow_config);
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
      ("MlflowDetails", option_to_yojson mlflow_details_to_yojson x.mlflow_details);
      ("ProgressInfo", option_to_yojson training_progress_info_to_yojson x.progress_info);
      ( "OutputModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.output_model_package_arn );
    ]

let describe_training_job_request_to_yojson (x : describe_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let reserved_capacity_summary_to_yojson (x : reserved_capacity_summary) =
  assoc_to_yojson
    [
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ("Status", Some (reserved_capacity_status_to_yojson x.status));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("AvailabilityZoneId", option_to_yojson availability_zone_id_to_yojson x.availability_zone_id);
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let reserved_capacity_summaries_to_yojson tree =
  list_to_yojson reserved_capacity_summary_to_yojson tree

let sage_maker_resource_name_to_yojson (x : sage_maker_resource_name) =
  match x with
  | TRAINING_JOB -> `String "training-job"
  | HYPERPOD_CLUSTER -> `String "hyperpod-cluster"
  | ENDPOINT -> `String "endpoint"
  | STUDIO_APPS -> `String "studio-apps"

let sage_maker_resource_names_to_yojson tree =
  list_to_yojson sage_maker_resource_name_to_yojson tree

let training_plan_duration_minutes_to_yojson = long_to_yojson
let training_plan_duration_hours_to_yojson = long_to_yojson
let training_plan_status_message_to_yojson = string_to_yojson

let training_plan_status_to_yojson (x : training_plan_status) =
  match x with
  | PENDING -> `String "Pending"
  | ACTIVE -> `String "Active"
  | SCHEDULED -> `String "Scheduled"
  | EXPIRED -> `String "Expired"
  | FAILED -> `String "Failed"

let describe_training_plan_response_to_yojson (x : describe_training_plan_response) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
      ("Status", Some (training_plan_status_to_yojson x.status));
      ("StatusMessage", option_to_yojson training_plan_status_message_to_yojson x.status_message);
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("TotalInstanceCount", option_to_yojson total_instance_count_to_yojson x.total_instance_count);
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ( "TotalUltraServerCount",
        option_to_yojson ultra_server_count_to_yojson x.total_ultra_server_count );
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ( "ReservedCapacitySummaries",
        option_to_yojson reserved_capacity_summaries_to_yojson x.reserved_capacity_summaries );
    ]

let describe_training_plan_request_to_yojson (x : describe_training_plan_request) =
  assoc_to_yojson [ ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name)) ]

let training_plan_extension_duration_hours_to_yojson = int_to_yojson
let training_plan_extension_offering_id_to_yojson = string_to_yojson

let training_plan_extension_to_yojson (x : training_plan_extension) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
      ("ExtendedAt", option_to_yojson timestamp_to_yojson x.extended_at);
      ("StartDate", option_to_yojson timestamp_to_yojson x.start_date);
      ("EndDate", option_to_yojson timestamp_to_yojson x.end_date);
      ("Status", option_to_yojson string256_to_yojson x.status);
      ("PaymentStatus", option_to_yojson string256_to_yojson x.payment_status);
      ("AvailabilityZone", option_to_yojson string256_to_yojson x.availability_zone);
      ("AvailabilityZoneId", option_to_yojson availability_zone_id_to_yojson x.availability_zone_id);
      ( "DurationHours",
        option_to_yojson training_plan_extension_duration_hours_to_yojson x.duration_hours );
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let training_plan_extensions_to_yojson tree = list_to_yojson training_plan_extension_to_yojson tree

let describe_training_plan_extension_history_response_to_yojson
    (x : describe_training_plan_extension_history_response) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensions",
        Some (training_plan_extensions_to_yojson x.training_plan_extensions) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_training_plan_extension_history_request_to_yojson
    (x : describe_training_plan_extension_history_request) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let transform_job_status_to_yojson (x : transform_job_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"

let describe_transform_job_response_to_yojson (x : describe_transform_job_response) =
  assoc_to_yojson
    [
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
      ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn));
      ("TransformJobStatus", Some (transform_job_status_to_yojson x.transform_job_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("TransformOutput", option_to_yojson transform_output_to_yojson x.transform_output);
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TransformStartTime", option_to_yojson timestamp_to_yojson x.transform_start_time);
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
    ]

let describe_transform_job_request_to_yojson (x : describe_transform_job_request) =
  assoc_to_yojson [ ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name)) ]

let trial_source_arn_to_yojson = string_to_yojson

let trial_source_to_yojson (x : trial_source) =
  assoc_to_yojson
    [
      ("SourceArn", Some (trial_source_arn_to_yojson x.source_arn));
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let describe_trial_response_to_yojson (x : describe_trial_response) =
  assoc_to_yojson
    [
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("Source", option_to_yojson trial_source_to_yojson x.source);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
    ]

let describe_trial_request_to_yojson (x : describe_trial_request) =
  assoc_to_yojson [ ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name)) ]

let trial_component_source_arn_to_yojson = string_to_yojson

let trial_component_source_to_yojson (x : trial_component_source) =
  assoc_to_yojson
    [
      ("SourceArn", Some (trial_component_source_arn_to_yojson x.source_arn));
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let trial_component_sources_to_yojson tree = list_to_yojson trial_component_source_to_yojson tree
let optional_double_to_yojson = double_to_yojson
let optional_integer_to_yojson = int_to_yojson

let trial_component_metric_summary_to_yojson (x : trial_component_metric_summary) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("SourceArn", option_to_yojson trial_component_source_arn_to_yojson x.source_arn);
      ("TimeStamp", option_to_yojson timestamp_to_yojson x.time_stamp);
      ("Max", option_to_yojson optional_double_to_yojson x.max);
      ("Min", option_to_yojson optional_double_to_yojson x.min);
      ("Last", option_to_yojson optional_double_to_yojson x.last);
      ("Count", option_to_yojson optional_integer_to_yojson x.count);
      ("Avg", option_to_yojson optional_double_to_yojson x.avg);
      ("StdDev", option_to_yojson optional_double_to_yojson x.std_dev);
    ]

let trial_component_metric_summaries_to_yojson tree =
  list_to_yojson trial_component_metric_summary_to_yojson tree

let describe_trial_component_response_to_yojson (x : describe_trial_component_response) =
  assoc_to_yojson
    [
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Source", option_to_yojson trial_component_source_to_yojson x.source);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Metrics", option_to_yojson trial_component_metric_summaries_to_yojson x.metrics);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("Sources", option_to_yojson trial_component_sources_to_yojson x.sources);
    ]

let describe_trial_component_request_to_yojson (x : describe_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_or_arn_to_yojson x.trial_component_name));
    ]

let user_profile_status_to_yojson (x : user_profile_status) =
  match x with
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"
  | InService -> `String "InService"
  | Pending -> `String "Pending"
  | Updating -> `String "Updating"
  | Update_Failed -> `String "Update_Failed"
  | Delete_Failed -> `String "Delete_Failed"

let describe_user_profile_response_to_yojson (x : describe_user_profile_response) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("HomeEfsFileSystemUid", option_to_yojson efs_uid_to_yojson x.home_efs_file_system_uid);
      ("Status", option_to_yojson user_profile_status_to_yojson x.status);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "SingleSignOnUserIdentifier",
        option_to_yojson single_sign_on_user_identifier_to_yojson x.single_sign_on_user_identifier
      );
      ("SingleSignOnUserValue", option_to_yojson string256_to_yojson x.single_sign_on_user_value);
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
    ]

let describe_user_profile_request_to_yojson (x : describe_user_profile_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
    ]

let workforce_failure_reason_to_yojson = string_to_yojson

let workforce_status_to_yojson (x : workforce_status) =
  match x with
  | INITIALIZING -> `String "Initializing"
  | UPDATING -> `String "Updating"
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | ACTIVE -> `String "Active"

let workforce_vpc_endpoint_id_to_yojson = string_to_yojson

let workforce_vpc_config_response_to_yojson (x : workforce_vpc_config_response) =
  assoc_to_yojson
    [
      ("VpcId", Some (workforce_vpc_id_to_yojson x.vpc_id));
      ("SecurityGroupIds", Some (workforce_security_group_ids_to_yojson x.security_group_ids));
      ("Subnets", Some (workforce_subnets_to_yojson x.subnets));
      ("VpcEndpointId", option_to_yojson workforce_vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
    ]

let oidc_config_for_response_to_yojson (x : oidc_config_for_response) =
  assoc_to_yojson
    [
      ("ClientId", option_to_yojson client_id_to_yojson x.client_id);
      ("Issuer", option_to_yojson oidc_endpoint_to_yojson x.issuer);
      ("AuthorizationEndpoint", option_to_yojson oidc_endpoint_to_yojson x.authorization_endpoint);
      ("TokenEndpoint", option_to_yojson oidc_endpoint_to_yojson x.token_endpoint);
      ("UserInfoEndpoint", option_to_yojson oidc_endpoint_to_yojson x.user_info_endpoint);
      ("LogoutEndpoint", option_to_yojson oidc_endpoint_to_yojson x.logout_endpoint);
      ("JwksUri", option_to_yojson oidc_endpoint_to_yojson x.jwks_uri);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ( "AuthenticationRequestExtraParams",
        option_to_yojson authentication_request_extra_params_to_yojson
          x.authentication_request_extra_params );
    ]

let workforce_to_yojson (x : workforce) =
  assoc_to_yojson
    [
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
      ("WorkforceArn", Some (workforce_arn_to_yojson x.workforce_arn));
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("SubDomain", option_to_yojson string__to_yojson x.sub_domain);
      ("CognitoConfig", option_to_yojson cognito_config_to_yojson x.cognito_config);
      ("OidcConfig", option_to_yojson oidc_config_for_response_to_yojson x.oidc_config);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_response_to_yojson x.workforce_vpc_config );
      ("Status", option_to_yojson workforce_status_to_yojson x.status);
      ("FailureReason", option_to_yojson workforce_failure_reason_to_yojson x.failure_reason);
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
    ]

let describe_workforce_response_to_yojson (x : describe_workforce_response) =
  assoc_to_yojson [ ("Workforce", Some (workforce_to_yojson x.workforce)) ]

let describe_workforce_request_to_yojson (x : describe_workforce_request) =
  assoc_to_yojson [ ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name)) ]

let product_listings_to_yojson tree = list_to_yojson string__to_yojson tree

let workteam_to_yojson (x : workteam) =
  assoc_to_yojson
    [
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
      ("MemberDefinitions", Some (member_definitions_to_yojson x.member_definitions));
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("WorkforceArn", option_to_yojson workforce_arn_to_yojson x.workforce_arn);
      ("ProductListingIds", option_to_yojson product_listings_to_yojson x.product_listing_ids);
      ("Description", Some (string200_to_yojson x.description));
      ("SubDomain", option_to_yojson string__to_yojson x.sub_domain);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
    ]

let describe_workteam_response_to_yojson (x : describe_workteam_response) =
  assoc_to_yojson [ ("Workteam", Some (workteam_to_yojson x.workteam)) ]

let describe_workteam_request_to_yojson (x : describe_workteam_request) =
  assoc_to_yojson [ ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name)) ]

let production_variant_serverless_update_config_to_yojson
    (x : production_variant_serverless_update_config) =
  assoc_to_yojson
    [
      ("MaxConcurrency", option_to_yojson serverless_max_concurrency_to_yojson x.max_concurrency);
      ( "ProvisionedConcurrency",
        option_to_yojson serverless_provisioned_concurrency_to_yojson x.provisioned_concurrency );
    ]

let desired_weight_and_capacity_to_yojson (x : desired_weight_and_capacity) =
  assoc_to_yojson
    [
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ( "ServerlessUpdateConfig",
        option_to_yojson production_variant_serverless_update_config_to_yojson
          x.serverless_update_config );
    ]

let desired_weight_and_capacity_list_to_yojson tree =
  list_to_yojson desired_weight_and_capacity_to_yojson tree

let detach_cluster_node_volume_response_to_yojson (x : detach_cluster_node_volume_response) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("AttachTime", Some (timestamp_to_yojson x.attach_time));
      ("Status", Some (volume_attachment_status_to_yojson x.status));
      ("DeviceName", Some (volume_device_name_to_yojson x.device_name));
    ]

let detach_cluster_node_volume_request_to_yojson (x : detach_cluster_node_volume_request) =
  assoc_to_yojson
    [
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
    ]

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("DeviceName", Some (device_name_to_yojson x.device_name));
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
    ]

let device_deployment_status_to_yojson (x : device_deployment_status) =
  match x with
  | ReadyToDeploy -> `String "READYTODEPLOY"
  | InProgress -> `String "INPROGRESS"
  | Deployed -> `String "DEPLOYED"
  | Failed -> `String "FAILED"
  | Stopping -> `String "STOPPING"
  | Stopped -> `String "STOPPED"

let device_deployment_summary_to_yojson (x : device_deployment_summary) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("DeployedStageName", option_to_yojson entity_name_to_yojson x.deployed_stage_name);
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
      ("DeviceName", Some (device_name_to_yojson x.device_name));
      ("DeviceArn", Some (device_arn_to_yojson x.device_arn));
      ( "DeviceDeploymentStatus",
        option_to_yojson device_deployment_status_to_yojson x.device_deployment_status );
      ( "DeviceDeploymentStatusMessage",
        option_to_yojson string__to_yojson x.device_deployment_status_message );
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeploymentStartTime", option_to_yojson timestamp_to_yojson x.deployment_start_time);
    ]

let device_deployment_summaries_to_yojson tree =
  list_to_yojson device_deployment_summary_to_yojson tree

let device_fleet_summary_to_yojson (x : device_fleet_summary) =
  assoc_to_yojson
    [
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let device_fleet_summaries_to_yojson tree = list_to_yojson device_fleet_summary_to_yojson tree

let device_stats_to_yojson (x : device_stats) =
  assoc_to_yojson
    [
      ("ConnectedDeviceCount", Some (long_to_yojson x.connected_device_count));
      ("RegisteredDeviceCount", Some (long_to_yojson x.registered_device_count));
    ]

let edge_model_summary_to_yojson (x : edge_model_summary) =
  assoc_to_yojson
    [
      ("ModelName", Some (entity_name_to_yojson x.model_name));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
    ]

let edge_model_summaries_to_yojson tree = list_to_yojson edge_model_summary_to_yojson tree

let device_summary_to_yojson (x : device_summary) =
  assoc_to_yojson
    [
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
      ("DeviceArn", Some (device_arn_to_yojson x.device_arn));
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
      ("RegistrationTime", option_to_yojson timestamp_to_yojson x.registration_time);
      ("LatestHeartbeat", option_to_yojson timestamp_to_yojson x.latest_heartbeat);
      ("Models", option_to_yojson edge_model_summaries_to_yojson x.models);
      ("AgentVersion", option_to_yojson edge_version_to_yojson x.agent_version);
    ]

let device_summaries_to_yojson tree = list_to_yojson device_summary_to_yojson tree
let devices_to_yojson tree = list_to_yojson device_to_yojson tree

let direction_to_yojson (x : direction) =
  match x with
  | BOTH -> `String "Both"
  | ASCENDANTS -> `String "Ascendants"
  | DESCENDANTS -> `String "Descendants"

let disable_sagemaker_servicecatalog_portfolio_output_to_yojson = unit_to_yojson
let disable_sagemaker_servicecatalog_portfolio_input_to_yojson = unit_to_yojson
let disassociate_additional_code_repositories_to_yojson = bool_to_yojson
let disassociate_default_code_repository_to_yojson = bool_to_yojson
let disassociate_notebook_instance_accelerator_types_to_yojson = bool_to_yojson
let disassociate_notebook_instance_lifecycle_config_to_yojson = bool_to_yojson

let disassociate_trial_component_response_to_yojson (x : disassociate_trial_component_response) =
  assoc_to_yojson
    [
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
    ]

let disassociate_trial_component_request_to_yojson (x : disassociate_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
    ]

let domain_details_to_yojson (x : domain_details) =
  assoc_to_yojson
    [
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Status", option_to_yojson domain_status_to_yojson x.status);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("Url", option_to_yojson string1024_to_yojson x.url);
    ]

let domain_list_to_yojson tree = list_to_yojson domain_details_to_yojson tree

let r_studio_server_pro_domain_settings_for_update_to_yojson
    (x : r_studio_server_pro_domain_settings_for_update) =
  assoc_to_yojson
    [
      ("DomainExecutionRoleArn", Some (role_arn_to_yojson x.domain_execution_role_arn));
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("RStudioConnectUrl", option_to_yojson string__to_yojson x.r_studio_connect_url);
      ("RStudioPackageManagerUrl", option_to_yojson string__to_yojson x.r_studio_package_manager_url);
    ]

let domain_settings_for_update_to_yojson (x : domain_settings_for_update) =
  assoc_to_yojson
    [
      ( "RStudioServerProDomainSettingsForUpdate",
        option_to_yojson r_studio_server_pro_domain_settings_for_update_to_yojson
          x.r_studio_server_pro_domain_settings_for_update );
      ( "ExecutionRoleIdentityConfig",
        option_to_yojson execution_role_identity_config_to_yojson x.execution_role_identity_config
      );
      ("SecurityGroupIds", option_to_yojson domain_security_group_ids_to_yojson x.security_group_ids);
      ( "TrustedIdentityPropagationSettings",
        option_to_yojson trusted_identity_propagation_settings_to_yojson
          x.trusted_identity_propagation_settings );
      ("DockerSettings", option_to_yojson docker_settings_to_yojson x.docker_settings);
      ("AmazonQSettings", option_to_yojson amazon_q_settings_to_yojson x.amazon_q_settings);
      ( "UnifiedStudioSettings",
        option_to_yojson unified_studio_settings_to_yojson x.unified_studio_settings );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let double_to_yojson = double_to_yojson

let predefined_metric_specification_to_yojson (x : predefined_metric_specification) =
  assoc_to_yojson
    [ ("PredefinedMetricType", option_to_yojson string__to_yojson x.predefined_metric_type) ]

let metric_specification_to_yojson (x : metric_specification) =
  match x with
  | Predefined arg ->
      assoc_to_yojson [ ("Predefined", Some (predefined_metric_specification_to_yojson arg)) ]
  | Customized arg ->
      assoc_to_yojson [ ("Customized", Some (customized_metric_specification_to_yojson arg)) ]

let target_tracking_scaling_policy_configuration_to_yojson
    (x : target_tracking_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("MetricSpecification", option_to_yojson metric_specification_to_yojson x.metric_specification);
      ("TargetValue", option_to_yojson double_to_yojson x.target_value);
    ]

let scaling_policy_to_yojson (x : scaling_policy) =
  match x with
  | TargetTracking arg ->
      assoc_to_yojson
        [ ("TargetTracking", Some (target_tracking_scaling_policy_configuration_to_yojson arg)) ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let dynamic_scaling_configuration_to_yojson (x : dynamic_scaling_configuration) =
  assoc_to_yojson
    [
      ("MinCapacity", option_to_yojson integer_to_yojson x.min_capacity);
      ("MaxCapacity", option_to_yojson integer_to_yojson x.max_capacity);
      ("ScaleInCooldown", option_to_yojson integer_to_yojson x.scale_in_cooldown);
      ("ScaleOutCooldown", option_to_yojson integer_to_yojson x.scale_out_cooldown);
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
    ]

let emr_step_metadata_to_yojson (x : emr_step_metadata) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson string256_to_yojson x.cluster_id);
      ("StepId", option_to_yojson string256_to_yojson x.step_id);
      ("StepName", option_to_yojson string256_to_yojson x.step_name);
      ("LogFilePath", option_to_yojson string1024_to_yojson x.log_file_path);
    ]

let edge_to_yojson (x : edge) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
    ]

let edge_deployment_plan_summary_to_yojson (x : edge_deployment_plan_summary) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("EdgeDeploymentSuccess", Some (integer_to_yojson x.edge_deployment_success));
      ("EdgeDeploymentPending", Some (integer_to_yojson x.edge_deployment_pending));
      ("EdgeDeploymentFailed", Some (integer_to_yojson x.edge_deployment_failed));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let edge_deployment_plan_summaries_to_yojson tree =
  list_to_yojson edge_deployment_plan_summary_to_yojson tree

let edge_model_stat_to_yojson (x : edge_model_stat) =
  assoc_to_yojson
    [
      ("ModelName", Some (entity_name_to_yojson x.model_name));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("OfflineDeviceCount", Some (long_to_yojson x.offline_device_count));
      ("ConnectedDeviceCount", Some (long_to_yojson x.connected_device_count));
      ("ActiveDeviceCount", Some (long_to_yojson x.active_device_count));
      ("SamplingDeviceCount", Some (long_to_yojson x.sampling_device_count));
    ]

let edge_model_stats_to_yojson tree = list_to_yojson edge_model_stat_to_yojson tree

let edge_packaging_job_summary_to_yojson (x : edge_packaging_job_summary) =
  assoc_to_yojson
    [
      ("EdgePackagingJobArn", Some (edge_packaging_job_arn_to_yojson x.edge_packaging_job_arn));
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ( "EdgePackagingJobStatus",
        Some (edge_packaging_job_status_to_yojson x.edge_packaging_job_status) );
      ("CompilationJobName", option_to_yojson entity_name_to_yojson x.compilation_job_name);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("ModelVersion", option_to_yojson edge_version_to_yojson x.model_version);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let edge_packaging_job_summaries_to_yojson tree =
  list_to_yojson edge_packaging_job_summary_to_yojson tree

let edges_to_yojson tree = list_to_yojson edge_to_yojson tree
let enable_sagemaker_servicecatalog_portfolio_output_to_yojson = unit_to_yojson
let enable_sagemaker_servicecatalog_portfolio_input_to_yojson = unit_to_yojson

let monitoring_schedule_to_yojson (x : monitoring_schedule) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ( "MonitoringScheduleStatus",
        option_to_yojson schedule_status_to_yojson x.monitoring_schedule_status );
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "MonitoringScheduleConfig",
        option_to_yojson monitoring_schedule_config_to_yojson x.monitoring_schedule_config );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let monitoring_schedule_list_to_yojson tree = list_to_yojson monitoring_schedule_to_yojson tree

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ( "ProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.production_variants );
      ( "DataCaptureConfig",
        option_to_yojson data_capture_config_summary_to_yojson x.data_capture_config );
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ( "MonitoringSchedules",
        option_to_yojson monitoring_schedule_list_to_yojson x.monitoring_schedules );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.shadow_production_variants );
    ]

let endpoint_config_name_contains_to_yojson = string_to_yojson

let endpoint_config_sort_key_to_yojson (x : endpoint_config_sort_key) =
  match x with Name -> `String "Name" | CreationTime -> `String "CreationTime"

let endpoint_config_step_metadata_to_yojson (x : endpoint_config_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson endpoint_config_arn_to_yojson x.arn) ]

let endpoint_config_summary_to_yojson (x : endpoint_config_summary) =
  assoc_to_yojson
    [
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let endpoint_config_summary_list_to_yojson tree =
  list_to_yojson endpoint_config_summary_to_yojson tree

let endpoint_name_contains_to_yojson = string_to_yojson

let endpoint_sort_key_to_yojson (x : endpoint_sort_key) =
  match x with
  | Name -> `String "Name"
  | CreationTime -> `String "CreationTime"
  | Status -> `String "Status"

let endpoint_step_metadata_to_yojson (x : endpoint_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson endpoint_arn_to_yojson x.arn) ]

let endpoint_summary_to_yojson (x : endpoint_summary) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
    ]

let endpoint_summary_list_to_yojson tree = list_to_yojson endpoint_summary_to_yojson tree
let event_sort_by_to_yojson (x : event_sort_by) = match x with EVENT_TIME -> `String "EventTime"

let experiment_to_yojson (x : experiment) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Source", option_to_yojson experiment_source_to_yojson x.source);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let experiment_summary_to_yojson (x : experiment_summary) =
  assoc_to_yojson
    [
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentSource", option_to_yojson experiment_source_to_yojson x.experiment_source);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let experiment_summaries_to_yojson tree = list_to_yojson experiment_summary_to_yojson tree

let extend_training_plan_response_to_yojson (x : extend_training_plan_response) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensions",
        Some (training_plan_extensions_to_yojson x.training_plan_extensions) );
    ]

let extend_training_plan_request_to_yojson (x : extend_training_plan_request) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
    ]

let string3072_to_yojson = string_to_yojson

let fail_step_metadata_to_yojson (x : fail_step_metadata) =
  assoc_to_yojson [ ("ErrorMessage", option_to_yojson string3072_to_yojson x.error_message) ]

let feature_additions_to_yojson tree = list_to_yojson feature_definition_to_yojson tree

let feature_group_to_yojson (x : feature_group) =
  assoc_to_yojson
    [
      ("FeatureGroupArn", option_to_yojson feature_group_arn_to_yojson x.feature_group_arn);
      ("FeatureGroupName", option_to_yojson feature_group_name_to_yojson x.feature_group_name);
      ( "RecordIdentifierFeatureName",
        option_to_yojson feature_name_to_yojson x.record_identifier_feature_name );
      ("EventTimeFeatureName", option_to_yojson feature_name_to_yojson x.event_time_feature_name);
      ("FeatureDefinitions", option_to_yojson feature_definitions_to_yojson x.feature_definitions);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
      ("LastUpdateStatus", option_to_yojson last_update_status_to_yojson x.last_update_status);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let feature_group_max_results_to_yojson = int_to_yojson
let feature_group_name_contains_to_yojson = string_to_yojson

let feature_group_sort_by_to_yojson (x : feature_group_sort_by) =
  match x with
  | NAME -> `String "Name"
  | FEATURE_GROUP_STATUS -> `String "FeatureGroupStatus"
  | OFFLINE_STORE_STATUS -> `String "OfflineStoreStatus"
  | CREATION_TIME -> `String "CreationTime"

let feature_group_sort_order_to_yojson (x : feature_group_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let feature_group_summary_to_yojson (x : feature_group_summary) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
    ]

let feature_group_summaries_to_yojson tree = list_to_yojson feature_group_summary_to_yojson tree

let feature_metadata_to_yojson (x : feature_metadata) =
  assoc_to_yojson
    [
      ("FeatureGroupArn", option_to_yojson feature_group_arn_to_yojson x.feature_group_arn);
      ("FeatureGroupName", option_to_yojson feature_group_name_to_yojson x.feature_group_name);
      ("FeatureName", option_to_yojson feature_name_to_yojson x.feature_name);
      ("FeatureType", option_to_yojson feature_type_to_yojson x.feature_type);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ("Parameters", option_to_yojson feature_parameters_to_yojson x.parameters);
    ]

let feature_parameter_additions_to_yojson tree = list_to_yojson feature_parameter_to_yojson tree
let feature_parameter_removals_to_yojson tree = list_to_yojson feature_parameter_key_to_yojson tree
let filter_value_to_yojson = string_to_yojson

let operator_to_yojson (x : operator) =
  match x with
  | EQUALS -> `String "Equals"
  | NOT_EQUALS -> `String "NotEquals"
  | GREATER_THAN -> `String "GreaterThan"
  | GREATER_THAN_OR_EQUAL_TO -> `String "GreaterThanOrEqualTo"
  | LESS_THAN -> `String "LessThan"
  | LESS_THAN_OR_EQUAL_TO -> `String "LessThanOrEqualTo"
  | CONTAINS -> `String "Contains"
  | EXISTS -> `String "Exists"
  | NOT_EXISTS -> `String "NotExists"
  | IN -> `String "In"

let resource_property_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", Some (resource_property_name_to_yojson x.name));
      ("Operator", option_to_yojson operator_to_yojson x.operator);
      ("Value", option_to_yojson filter_value_to_yojson x.value);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let flow_definition_summary_to_yojson (x : flow_definition_summary) =
  assoc_to_yojson
    [
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("FlowDefinitionStatus", Some (flow_definition_status_to_yojson x.flow_definition_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let flow_definition_summaries_to_yojson tree = list_to_yojson flow_definition_summary_to_yojson tree

let get_device_fleet_report_response_to_yojson (x : get_device_fleet_report_response) =
  assoc_to_yojson
    [
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("OutputConfig", option_to_yojson edge_output_config_to_yojson x.output_config);
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("ReportGenerated", option_to_yojson timestamp_to_yojson x.report_generated);
      ("DeviceStats", option_to_yojson device_stats_to_yojson x.device_stats);
      ("AgentVersions", option_to_yojson agent_versions_to_yojson x.agent_versions);
      ("ModelStats", option_to_yojson edge_model_stats_to_yojson x.model_stats);
    ]

let get_device_fleet_report_request_to_yojson (x : get_device_fleet_report_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let resource_policy_string_to_yojson = string_to_yojson

let get_lineage_group_policy_response_to_yojson (x : get_lineage_group_policy_response) =
  assoc_to_yojson
    [
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("ResourcePolicy", option_to_yojson resource_policy_string_to_yojson x.resource_policy);
    ]

let lineage_group_name_or_arn_to_yojson = string_to_yojson

let get_lineage_group_policy_request_to_yojson (x : get_lineage_group_policy_request) =
  assoc_to_yojson
    [ ("LineageGroupName", Some (lineage_group_name_or_arn_to_yojson x.lineage_group_name)) ]

let policy_string_to_yojson = string_to_yojson

let get_model_package_group_policy_output_to_yojson (x : get_model_package_group_policy_output) =
  assoc_to_yojson [ ("ResourcePolicy", Some (policy_string_to_yojson x.resource_policy)) ]

let get_model_package_group_policy_input_to_yojson (x : get_model_package_group_policy_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name)) ]

let sagemaker_servicecatalog_status_to_yojson (x : sagemaker_servicecatalog_status) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let get_sagemaker_servicecatalog_portfolio_status_output_to_yojson
    (x : get_sagemaker_servicecatalog_portfolio_status_output) =
  assoc_to_yojson
    [ ("Status", option_to_yojson sagemaker_servicecatalog_status_to_yojson x.status) ]

let get_sagemaker_servicecatalog_portfolio_status_input_to_yojson = unit_to_yojson

let scaling_policy_metric_to_yojson (x : scaling_policy_metric) =
  assoc_to_yojson
    [
      ("InvocationsPerInstance", option_to_yojson integer_to_yojson x.invocations_per_instance);
      ("ModelLatency", option_to_yojson integer_to_yojson x.model_latency);
    ]

let scaling_policy_objective_to_yojson (x : scaling_policy_objective) =
  assoc_to_yojson
    [
      ("MinInvocationsPerMinute", option_to_yojson integer_to_yojson x.min_invocations_per_minute);
      ("MaxInvocationsPerMinute", option_to_yojson integer_to_yojson x.max_invocations_per_minute);
    ]

let utilization_percentage_per_core_to_yojson = int_to_yojson

let get_scaling_configuration_recommendation_response_to_yojson
    (x : get_scaling_configuration_recommendation_response) =
  assoc_to_yojson
    [
      ( "InferenceRecommendationsJobName",
        option_to_yojson recommendation_job_name_to_yojson x.inference_recommendations_job_name );
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "TargetCpuUtilizationPerCore",
        option_to_yojson utilization_percentage_per_core_to_yojson x.target_cpu_utilization_per_core
      );
      ( "ScalingPolicyObjective",
        option_to_yojson scaling_policy_objective_to_yojson x.scaling_policy_objective );
      ("Metric", option_to_yojson scaling_policy_metric_to_yojson x.metric);
      ( "DynamicScalingConfiguration",
        option_to_yojson dynamic_scaling_configuration_to_yojson x.dynamic_scaling_configuration );
    ]

let get_scaling_configuration_recommendation_request_to_yojson
    (x : get_scaling_configuration_recommendation_request) =
  assoc_to_yojson
    [
      ( "InferenceRecommendationsJobName",
        Some (recommendation_job_name_to_yojson x.inference_recommendations_job_name) );
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "TargetCpuUtilizationPerCore",
        option_to_yojson utilization_percentage_per_core_to_yojson x.target_cpu_utilization_per_core
      );
      ( "ScalingPolicyObjective",
        option_to_yojson scaling_policy_objective_to_yojson x.scaling_policy_objective );
    ]

let property_name_suggestion_to_yojson (x : property_name_suggestion) =
  assoc_to_yojson
    [ ("PropertyName", option_to_yojson resource_property_name_to_yojson x.property_name) ]

let property_name_suggestion_list_to_yojson tree =
  list_to_yojson property_name_suggestion_to_yojson tree

let get_search_suggestions_response_to_yojson (x : get_search_suggestions_response) =
  assoc_to_yojson
    [
      ( "PropertyNameSuggestions",
        option_to_yojson property_name_suggestion_list_to_yojson x.property_name_suggestions );
    ]

let property_name_hint_to_yojson = string_to_yojson

let property_name_query_to_yojson (x : property_name_query) =
  assoc_to_yojson [ ("PropertyNameHint", Some (property_name_hint_to_yojson x.property_name_hint)) ]

let suggestion_query_to_yojson (x : suggestion_query) =
  assoc_to_yojson
    [ ("PropertyNameQuery", option_to_yojson property_name_query_to_yojson x.property_name_query) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | TRAINING_JOB -> `String "TrainingJob"
  | EXPERIMENT -> `String "Experiment"
  | EXPERIMENT_TRIAL -> `String "ExperimentTrial"
  | EXPERIMENT_TRIAL_COMPONENT -> `String "ExperimentTrialComponent"
  | ENDPOINT -> `String "Endpoint"
  | MODEL -> `String "Model"
  | MODEL_PACKAGE -> `String "ModelPackage"
  | MODEL_PACKAGE_GROUP -> `String "ModelPackageGroup"
  | PIPELINE -> `String "Pipeline"
  | PIPELINE_EXECUTION -> `String "PipelineExecution"
  | FEATURE_GROUP -> `String "FeatureGroup"
  | FEATURE_METADATA -> `String "FeatureMetadata"
  | IMAGE -> `String "Image"
  | IMAGE_VERSION -> `String "ImageVersion"
  | PROJECT -> `String "Project"
  | HYPER_PARAMETER_TUNING_JOB -> `String "HyperParameterTuningJob"
  | MODEL_CARD -> `String "ModelCard"
  | PIPELINE_VERSION -> `String "PipelineVersion"
  | JOB -> `String "Job"

let get_search_suggestions_request_to_yojson (x : get_search_suggestions_request) =
  assoc_to_yojson
    [
      ("Resource", Some (resource_type_to_yojson x.resource));
      ("SuggestionQuery", option_to_yojson suggestion_query_to_yojson x.suggestion_query);
    ]

let git_config_for_update_to_yojson (x : git_config_for_update) =
  assoc_to_yojson [ ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn) ]

let hub_content_info_to_yojson (x : hub_content_info) =
  assoc_to_yojson
    [
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ( "SageMakerPublicHubContentArn",
        option_to_yojson sage_maker_public_hub_content_arn_to_yojson
          x.sage_maker_public_hub_content_arn );
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("HubContentStatus", Some (hub_content_status_to_yojson x.hub_content_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("OriginalCreationTime", option_to_yojson timestamp_to_yojson x.original_creation_time);
    ]

let hub_content_info_list_to_yojson tree = list_to_yojson hub_content_info_to_yojson tree

let hub_content_sort_by_to_yojson (x : hub_content_sort_by) =
  match x with
  | HUB_CONTENT_NAME -> `String "HubContentName"
  | CREATION_TIME -> `String "CreationTime"
  | HUB_CONTENT_STATUS -> `String "HubContentStatus"

let hub_info_to_yojson (x : hub_info) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_to_yojson x.hub_name));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("HubStatus", Some (hub_status_to_yojson x.hub_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
    ]

let hub_info_list_to_yojson tree = list_to_yojson hub_info_to_yojson tree

let hub_sort_by_to_yojson (x : hub_sort_by) =
  match x with
  | HUB_NAME -> `String "HubName"
  | CREATION_TIME -> `String "CreationTime"
  | HUB_STATUS -> `String "HubStatus"
  | ACCOUNT_ID_OWNER -> `String "AccountIdOwner"

let human_task_ui_summary_to_yojson (x : human_task_ui_summary) =
  assoc_to_yojson
    [
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let human_task_ui_summaries_to_yojson tree = list_to_yojson human_task_ui_summary_to_yojson tree

let hyper_parameter_training_job_summaries_to_yojson tree =
  list_to_yojson hyper_parameter_training_job_summary_to_yojson tree

let hyper_parameter_tuning_job_search_entity_to_yojson
    (x : hyper_parameter_tuning_job_search_entity) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name
      );
      ( "HyperParameterTuningJobArn",
        option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn
      );
      ( "HyperParameterTuningJobConfig",
        option_to_yojson hyper_parameter_tuning_job_config_to_yojson
          x.hyper_parameter_tuning_job_config );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "HyperParameterTuningJobStatus",
        option_to_yojson hyper_parameter_tuning_job_status_to_yojson
          x.hyper_parameter_tuning_job_status );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "TrainingJobStatusCounters",
        option_to_yojson training_job_status_counters_to_yojson x.training_job_status_counters );
      ( "ObjectiveStatusCounters",
        option_to_yojson objective_status_counters_to_yojson x.objective_status_counters );
      ( "BestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.best_training_job );
      ( "OverallBestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.overall_best_training_job
      );
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "TuningJobCompletionDetails",
        option_to_yojson hyper_parameter_tuning_job_completion_details_to_yojson
          x.tuning_job_completion_details );
      ( "ConsumedResources",
        option_to_yojson hyper_parameter_tuning_job_consumed_resources_to_yojson
          x.consumed_resources );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let hyper_parameter_tuning_job_sort_by_options_to_yojson
    (x : hyper_parameter_tuning_job_sort_by_options) =
  match x with
  | Name -> `String "Name"
  | Status -> `String "Status"
  | CreationTime -> `String "CreationTime"

let hyper_parameter_tuning_job_summary_to_yojson (x : hyper_parameter_tuning_job_summary) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
      ( "HyperParameterTuningJobStatus",
        Some (hyper_parameter_tuning_job_status_to_yojson x.hyper_parameter_tuning_job_status) );
      ("Strategy", Some (hyper_parameter_tuning_job_strategy_type_to_yojson x.strategy));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "TrainingJobStatusCounters",
        Some (training_job_status_counters_to_yojson x.training_job_status_counters) );
      ( "ObjectiveStatusCounters",
        Some (objective_status_counters_to_yojson x.objective_status_counters) );
      ("ResourceLimits", option_to_yojson resource_limits_to_yojson x.resource_limits);
    ]

let hyper_parameter_tuning_job_summaries_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_job_summary_to_yojson tree

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ImageArn", Some (image_arn_to_yojson x.image_arn));
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("ImageStatus", Some (image_status_to_yojson x.image_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
    ]

let image_delete_property_to_yojson = string_to_yojson
let image_delete_property_list_to_yojson tree = list_to_yojson image_delete_property_to_yojson tree
let image_name_contains_to_yojson = string_to_yojson

let image_sort_by_to_yojson (x : image_sort_by) =
  match x with
  | CREATION_TIME -> `String "CREATION_TIME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | IMAGE_NAME -> `String "IMAGE_NAME"

let image_sort_order_to_yojson (x : image_sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let image_version_to_yojson (x : image_version) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ImageArn", Some (image_arn_to_yojson x.image_arn));
      ("ImageVersionArn", Some (image_version_arn_to_yojson x.image_version_arn));
      ("ImageVersionStatus", Some (image_version_status_to_yojson x.image_version_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("Version", Some (image_version_number_to_yojson x.version));
    ]

let image_version_sort_by_to_yojson (x : image_version_sort_by) =
  match x with
  | CREATION_TIME -> `String "CREATION_TIME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | VERSION -> `String "VERSION"

let image_version_sort_order_to_yojson (x : image_version_sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let image_versions_to_yojson tree = list_to_yojson image_version_to_yojson tree
let images_to_yojson tree = list_to_yojson image_to_yojson tree

let import_hub_content_response_to_yojson (x : import_hub_content_response) =
  assoc_to_yojson
    [
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
    ]

let import_hub_content_request_to_yojson (x : import_hub_content_request) =
  assoc_to_yojson
    [
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ("HubContentDocument", Some (hub_content_document_to_yojson x.hub_content_document));
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let include_node_logical_ids_boolean_to_yojson = bool_to_yojson

let inference_component_metadata_to_yojson (x : inference_component_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string2048_to_yojson x.arn) ]

let inference_component_name_contains_to_yojson = string_to_yojson

let inference_component_sort_key_to_yojson (x : inference_component_sort_key) =
  match x with
  | Name -> `String "Name"
  | CreationTime -> `String "CreationTime"
  | Status -> `String "Status"

let inference_component_summary_to_yojson (x : inference_component_summary) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ( "InferenceComponentStatus",
        option_to_yojson inference_component_status_to_yojson x.inference_component_status );
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
    ]

let inference_component_summary_list_to_yojson tree =
  list_to_yojson inference_component_summary_to_yojson tree

let inference_experiment_summary_to_yojson (x : inference_experiment_summary) =
  assoc_to_yojson
    [
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Status", Some (inference_experiment_status_to_yojson x.status));
      ("StatusReason", option_to_yojson inference_experiment_status_reason_to_yojson x.status_reason);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let inference_experiment_list_to_yojson tree =
  list_to_yojson inference_experiment_summary_to_yojson tree

let inference_experiment_stop_desired_state_to_yojson (x : inference_experiment_stop_desired_state)
    =
  match x with COMPLETED -> `String "Completed" | CANCELLED -> `String "Cancelled"

let inference_recommendations_job_to_yojson (x : inference_recommendations_job) =
  assoc_to_yojson
    [
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("JobDescription", Some (recommendation_job_description_to_yojson x.job_description));
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn));
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
    ]

let recommendation_failure_reason_to_yojson = string_to_yojson

let recommendation_job_inference_benchmark_to_yojson (x : recommendation_job_inference_benchmark) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson recommendation_metrics_to_yojson x.metrics);
      ("EndpointMetrics", option_to_yojson inference_metrics_to_yojson x.endpoint_metrics);
      ( "EndpointConfiguration",
        option_to_yojson endpoint_output_configuration_to_yojson x.endpoint_configuration );
      ("ModelConfiguration", Some (model_configuration_to_yojson x.model_configuration));
      ("FailureReason", option_to_yojson recommendation_failure_reason_to_yojson x.failure_reason);
      ("InvocationEndTime", option_to_yojson invocation_end_time_to_yojson x.invocation_end_time);
      ( "InvocationStartTime",
        option_to_yojson invocation_start_time_to_yojson x.invocation_start_time );
    ]

let recommendation_step_type_to_yojson (x : recommendation_step_type) =
  match x with BENCHMARK -> `String "BENCHMARK"

let inference_recommendations_job_step_to_yojson (x : inference_recommendations_job_step) =
  assoc_to_yojson
    [
      ("StepType", Some (recommendation_step_type_to_yojson x.step_type));
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ( "InferenceBenchmark",
        option_to_yojson recommendation_job_inference_benchmark_to_yojson x.inference_benchmark );
    ]

let inference_recommendations_job_steps_to_yojson tree =
  list_to_yojson inference_recommendations_job_step_to_yojson tree

let inference_recommendations_jobs_to_yojson tree =
  list_to_yojson inference_recommendations_job_to_yojson tree

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson job_arn_to_yojson x.job_arn);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("JobCategory", option_to_yojson job_category_to_yojson x.job_category);
      ( "JobConfigSchemaVersion",
        option_to_yojson job_schema_version_to_yojson x.job_config_schema_version );
      ("JobConfigDocument", option_to_yojson job_config_document_to_yojson x.job_config_document);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SecondaryStatus", option_to_yojson job_secondary_status_to_yojson x.secondary_status);
      ( "SecondaryStatusTransitions",
        option_to_yojson job_secondary_status_transitions_to_yojson x.secondary_status_transitions
      );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let job_config_schema_version_summary_to_yojson (x : job_config_schema_version_summary) =
  assoc_to_yojson
    [ ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version)) ]

let job_config_schemas_to_yojson tree =
  list_to_yojson job_config_schema_version_summary_to_yojson tree

let job_reference_code_contains_to_yojson = string_to_yojson

let job_step_metadata_to_yojson (x : job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let job_summary_to_yojson (x : job_summary) =
  assoc_to_yojson
    [
      ("JobArn", Some (job_arn_to_yojson x.job_arn));
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobSecondaryStatus", Some (job_secondary_status_to_yojson x.job_secondary_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let job_summaries_to_yojson tree = list_to_yojson job_summary_to_yojson tree

let label_counters_for_workteam_to_yojson (x : label_counters_for_workteam) =
  assoc_to_yojson
    [
      ("HumanLabeled", option_to_yojson label_counter_to_yojson x.human_labeled);
      ("PendingHuman", option_to_yojson label_counter_to_yojson x.pending_human);
      ("Total", option_to_yojson label_counter_to_yojson x.total);
    ]

let labeling_job_for_workteam_summary_to_yojson (x : labeling_job_for_workteam_summary) =
  assoc_to_yojson
    [
      ("LabelingJobName", option_to_yojson labeling_job_name_to_yojson x.labeling_job_name);
      ("JobReferenceCode", Some (job_reference_code_to_yojson x.job_reference_code));
      ("WorkRequesterAccountId", Some (account_id_to_yojson x.work_requester_account_id));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LabelCounters", option_to_yojson label_counters_for_workteam_to_yojson x.label_counters);
      ( "NumberOfHumanWorkersPerDataObject",
        option_to_yojson number_of_human_workers_per_data_object_to_yojson
          x.number_of_human_workers_per_data_object );
    ]

let labeling_job_for_workteam_summary_list_to_yojson tree =
  list_to_yojson labeling_job_for_workteam_summary_to_yojson tree

let labeling_job_summary_to_yojson (x : labeling_job_summary) =
  assoc_to_yojson
    [
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
      ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("LabelingJobStatus", Some (labeling_job_status_to_yojson x.labeling_job_status));
      ("LabelCounters", Some (label_counters_to_yojson x.label_counters));
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ( "PreHumanTaskLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.pre_human_task_lambda_arn );
      ( "AnnotationConsolidationLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.annotation_consolidation_lambda_arn );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LabelingJobOutput", option_to_yojson labeling_job_output_to_yojson x.labeling_job_output);
      ("InputConfig", option_to_yojson labeling_job_input_config_to_yojson x.input_config);
    ]

let labeling_job_summary_list_to_yojson tree = list_to_yojson labeling_job_summary_to_yojson tree

let lambda_step_metadata_to_yojson (x : lambda_step_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string256_to_yojson x.arn);
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
    ]

let lineage_group_summary_to_yojson (x : lineage_group_summary) =
  assoc_to_yojson
    [
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("LineageGroupName", option_to_yojson experiment_entity_name_to_yojson x.lineage_group_name);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let lineage_group_summaries_to_yojson tree = list_to_yojson lineage_group_summary_to_yojson tree
let map_string2048_to_yojson tree = map_to_yojson string2048_to_yojson string2048_to_yojson tree

let lineage_metadata_to_yojson (x : lineage_metadata) =
  assoc_to_yojson
    [
      ("ActionArns", option_to_yojson map_string2048_to_yojson x.action_arns);
      ("ArtifactArns", option_to_yojson map_string2048_to_yojson x.artifact_arns);
      ("ContextArns", option_to_yojson map_string2048_to_yojson x.context_arns);
      ("Associations", option_to_yojson association_info_list_to_yojson x.associations);
    ]

let lineage_type_to_yojson (x : lineage_type) =
  match x with
  | TRIAL_COMPONENT -> `String "TrialComponent"
  | ARTIFACT -> `String "Artifact"
  | CONTEXT -> `String "Context"
  | ACTION -> `String "Action"

let list_ai_benchmark_jobs_response_to_yojson (x : list_ai_benchmark_jobs_response) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobs", Some (ai_benchmark_job_summary_list_to_yojson x.ai_benchmark_jobs));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let list_ai_benchmark_jobs_sort_by_to_yojson (x : list_ai_benchmark_jobs_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let name_contains_to_yojson = string_to_yojson

let list_ai_benchmark_jobs_request_to_yojson (x : list_ai_benchmark_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson ai_benchmark_job_status_to_yojson x.status_equals);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortBy", option_to_yojson list_ai_benchmark_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_ai_recommendation_jobs_response_to_yojson (x : list_ai_recommendation_jobs_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobs",
        Some (ai_recommendation_job_summary_list_to_yojson x.ai_recommendation_jobs) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ai_recommendation_jobs_sort_by_to_yojson (x : list_ai_recommendation_jobs_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_ai_recommendation_jobs_request_to_yojson (x : list_ai_recommendation_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson ai_recommendation_job_status_to_yojson x.status_equals);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortBy", option_to_yojson list_ai_recommendation_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_ai_workload_configs_response_to_yojson (x : list_ai_workload_configs_response) =
  assoc_to_yojson
    [
      ("AIWorkloadConfigs", Some (ai_workload_config_summary_list_to_yojson x.ai_workload_configs));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ai_workload_configs_sort_by_to_yojson (x : list_ai_workload_configs_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_ai_workload_configs_request_to_yojson (x : list_ai_workload_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortBy", option_to_yojson list_ai_workload_configs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_actions_response_to_yojson (x : list_actions_response) =
  assoc_to_yojson
    [
      ("ActionSummaries", option_to_yojson action_summaries_to_yojson x.action_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_actions_by_to_yojson (x : sort_actions_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_actions_request_to_yojson (x : list_actions_request) =
  assoc_to_yojson
    [
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
      ("ActionType", option_to_yojson string256_to_yojson x.action_type);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_actions_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_algorithms_output_to_yojson (x : list_algorithms_output) =
  assoc_to_yojson
    [
      ("AlgorithmSummaryList", Some (algorithm_summary_list_to_yojson x.algorithm_summary_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_algorithms_input_to_yojson (x : list_algorithms_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson algorithm_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_aliases_response_to_yojson (x : list_aliases_response) =
  assoc_to_yojson
    [
      ( "SageMakerImageVersionAliases",
        option_to_yojson sage_maker_image_version_aliases_to_yojson
          x.sage_maker_image_version_aliases );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_aliases_request_to_yojson (x : list_aliases_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_app_image_configs_response_to_yojson (x : list_app_image_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AppImageConfigs", option_to_yojson app_image_config_list_to_yojson x.app_image_configs);
    ]

let list_app_image_configs_request_to_yojson (x : list_app_image_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson app_image_config_name_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("ModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.modified_time_before);
      ("ModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.modified_time_after);
      ("SortBy", option_to_yojson app_image_config_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_apps_response_to_yojson (x : list_apps_response) =
  assoc_to_yojson
    [
      ("Apps", option_to_yojson app_list_to_yojson x.apps);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_apps_request_to_yojson (x : list_apps_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson app_sort_key_to_yojson x.sort_by);
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ( "UserProfileNameEquals",
        option_to_yojson user_profile_name_to_yojson x.user_profile_name_equals );
      ("SpaceNameEquals", option_to_yojson space_name_to_yojson x.space_name_equals);
    ]

let list_artifacts_response_to_yojson (x : list_artifacts_response) =
  assoc_to_yojson
    [
      ("ArtifactSummaries", option_to_yojson artifact_summaries_to_yojson x.artifact_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_artifacts_by_to_yojson (x : sort_artifacts_by) =
  match x with CREATION_TIME -> `String "CreationTime"

let list_artifacts_request_to_yojson (x : list_artifacts_request) =
  assoc_to_yojson
    [
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_artifacts_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_associations_response_to_yojson (x : list_associations_response) =
  assoc_to_yojson
    [
      ( "AssociationSummaries",
        option_to_yojson association_summaries_to_yojson x.association_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_associations_by_to_yojson (x : sort_associations_by) =
  match x with
  | SOURCE_ARN -> `String "SourceArn"
  | DESTINATION_ARN -> `String "DestinationArn"
  | SOURCE_TYPE -> `String "SourceType"
  | DESTINATION_TYPE -> `String "DestinationType"
  | CREATION_TIME -> `String "CreationTime"

let list_associations_request_to_yojson (x : list_associations_request) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("DestinationType", option_to_yojson string256_to_yojson x.destination_type);
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_associations_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_auto_ml_jobs_response_to_yojson (x : list_auto_ml_jobs_response) =
  assoc_to_yojson
    [
      ("AutoMLJobSummaries", Some (auto_ml_job_summaries_to_yojson x.auto_ml_job_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_auto_ml_jobs_request_to_yojson (x : list_auto_ml_jobs_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson auto_ml_name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson auto_ml_job_status_to_yojson x.status_equals);
      ("SortOrder", option_to_yojson auto_ml_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson auto_ml_sort_by_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson auto_ml_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_candidates_for_auto_ml_job_response_to_yojson
    (x : list_candidates_for_auto_ml_job_response) =
  assoc_to_yojson
    [
      ("Candidates", Some (auto_ml_candidates_to_yojson x.candidates));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_candidates_for_auto_ml_job_request_to_yojson (x : list_candidates_for_auto_ml_job_request)
    =
  assoc_to_yojson
    [
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
      ("StatusEquals", option_to_yojson candidate_status_to_yojson x.status_equals);
      ("CandidateNameEquals", option_to_yojson candidate_name_to_yojson x.candidate_name_equals);
      ("SortOrder", option_to_yojson auto_ml_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson candidate_sort_by_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson auto_ml_max_results_for_trials_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_cluster_events_response_to_yojson (x : list_cluster_events_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Events", option_to_yojson cluster_event_summaries_to_yojson x.events);
    ]

let list_cluster_events_request_to_yojson (x : list_cluster_events_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("NodeId", option_to_yojson cluster_node_id_to_yojson x.node_id);
      ("EventTimeAfter", option_to_yojson timestamp_to_yojson x.event_time_after);
      ("EventTimeBefore", option_to_yojson timestamp_to_yojson x.event_time_before);
      ("SortBy", option_to_yojson event_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("ResourceType", option_to_yojson cluster_event_resource_type_to_yojson x.resource_type);
      ("MaxResults", option_to_yojson cluster_event_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_cluster_nodes_response_to_yojson (x : list_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ClusterNodeSummaries", Some (cluster_node_summaries_to_yojson x.cluster_node_summaries));
    ]

let list_cluster_nodes_request_to_yojson (x : list_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ( "InstanceGroupNameContains",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name_contains );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson cluster_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ( "IncludeNodeLogicalIds",
        option_to_yojson include_node_logical_ids_boolean_to_yojson x.include_node_logical_ids );
    ]

let list_cluster_scheduler_configs_response_to_yojson (x : list_cluster_scheduler_configs_response)
    =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigSummaries",
        option_to_yojson cluster_scheduler_config_summary_list_to_yojson
          x.cluster_scheduler_config_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_cluster_scheduler_config_by_to_yojson (x : sort_cluster_scheduler_config_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_cluster_scheduler_configs_request_to_yojson (x : list_cluster_scheduler_configs_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("Status", option_to_yojson scheduler_resource_status_to_yojson x.status);
      ("SortBy", option_to_yojson sort_cluster_scheduler_config_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ClusterSummaries", Some (cluster_summaries_to_yojson x.cluster_summaries));
    ]

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson cluster_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
    ]

let list_code_repositories_output_to_yojson (x : list_code_repositories_output) =
  assoc_to_yojson
    [
      ( "CodeRepositorySummaryList",
        Some (code_repository_summary_list_to_yojson x.code_repository_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_code_repositories_input_to_yojson (x : list_code_repositories_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson code_repository_name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson code_repository_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson code_repository_sort_order_to_yojson x.sort_order);
    ]

let list_compilation_jobs_response_to_yojson (x : list_compilation_jobs_response) =
  assoc_to_yojson
    [
      ( "CompilationJobSummaries",
        Some (compilation_job_summaries_to_yojson x.compilation_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_compilation_jobs_sort_by_to_yojson (x : list_compilation_jobs_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_compilation_jobs_request_to_yojson (x : list_compilation_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson compilation_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson list_compilation_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_compute_quotas_response_to_yojson (x : list_compute_quotas_response) =
  assoc_to_yojson
    [
      ( "ComputeQuotaSummaries",
        option_to_yojson compute_quota_summary_list_to_yojson x.compute_quota_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_quota_by_to_yojson (x : sort_quota_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"
  | CLUSTER_ARN -> `String "ClusterArn"

let list_compute_quotas_request_to_yojson (x : list_compute_quotas_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("Status", option_to_yojson scheduler_resource_status_to_yojson x.status);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("SortBy", option_to_yojson sort_quota_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_contexts_response_to_yojson (x : list_contexts_response) =
  assoc_to_yojson
    [
      ("ContextSummaries", option_to_yojson context_summaries_to_yojson x.context_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_contexts_by_to_yojson (x : sort_contexts_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_contexts_request_to_yojson (x : list_contexts_request) =
  assoc_to_yojson
    [
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_contexts_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let monitoring_job_definition_summary_to_yojson (x : monitoring_job_definition_summary) =
  assoc_to_yojson
    [
      ( "MonitoringJobDefinitionName",
        Some (monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name) );
      ( "MonitoringJobDefinitionArn",
        Some (monitoring_job_definition_arn_to_yojson x.monitoring_job_definition_arn) );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let monitoring_job_definition_summary_list_to_yojson tree =
  list_to_yojson monitoring_job_definition_summary_to_yojson tree

let list_data_quality_job_definitions_response_to_yojson
    (x : list_data_quality_job_definitions_response) =
  assoc_to_yojson
    [
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let monitoring_job_definition_sort_key_to_yojson (x : monitoring_job_definition_sort_key) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_data_quality_job_definitions_request_to_yojson
    (x : list_data_quality_job_definitions_request) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let list_device_fleets_response_to_yojson (x : list_device_fleets_response) =
  assoc_to_yojson
    [
      ("DeviceFleetSummaries", Some (device_fleet_summaries_to_yojson x.device_fleet_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_device_fleets_sort_by_to_yojson (x : list_device_fleets_sort_by) =
  match x with
  | Name -> `String "NAME"
  | CreationTime -> `String "CREATION_TIME"
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"

let list_max_results_to_yojson = int_to_yojson

let list_device_fleets_request_to_yojson (x : list_device_fleets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("SortBy", option_to_yojson list_device_fleets_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_devices_response_to_yojson (x : list_devices_response) =
  assoc_to_yojson
    [
      ("DeviceSummaries", Some (device_summaries_to_yojson x.device_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("LatestHeartbeatAfter", option_to_yojson timestamp_to_yojson x.latest_heartbeat_after);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
    ]

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("Domains", option_to_yojson domain_list_to_yojson x.domains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_edge_deployment_plans_response_to_yojson (x : list_edge_deployment_plans_response) =
  assoc_to_yojson
    [
      ( "EdgeDeploymentPlanSummaries",
        Some (edge_deployment_plan_summaries_to_yojson x.edge_deployment_plan_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_edge_deployment_plans_sort_by_to_yojson (x : list_edge_deployment_plans_sort_by) =
  match x with
  | Name -> `String "NAME"
  | DeviceFleetName -> `String "DEVICE_FLEET_NAME"
  | CreationTime -> `String "CREATION_TIME"
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"

let list_edge_deployment_plans_request_to_yojson (x : list_edge_deployment_plans_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ( "DeviceFleetNameContains",
        option_to_yojson name_contains_to_yojson x.device_fleet_name_contains );
      ("SortBy", option_to_yojson list_edge_deployment_plans_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_edge_packaging_jobs_response_to_yojson (x : list_edge_packaging_jobs_response) =
  assoc_to_yojson
    [
      ( "EdgePackagingJobSummaries",
        Some (edge_packaging_job_summaries_to_yojson x.edge_packaging_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_edge_packaging_jobs_sort_by_to_yojson (x : list_edge_packaging_jobs_sort_by) =
  match x with
  | Name -> `String "NAME"
  | ModelName -> `String "MODEL_NAME"
  | CreationTime -> `String "CREATION_TIME"
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"
  | EdgePackagingJobStatus -> `String "STATUS"

let list_edge_packaging_jobs_request_to_yojson (x : list_edge_packaging_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("ModelNameContains", option_to_yojson name_contains_to_yojson x.model_name_contains);
      ("StatusEquals", option_to_yojson edge_packaging_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson list_edge_packaging_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let pagination_token_to_yojson = string_to_yojson

let list_endpoint_configs_output_to_yojson (x : list_endpoint_configs_output) =
  assoc_to_yojson
    [
      ("EndpointConfigs", Some (endpoint_config_summary_list_to_yojson x.endpoint_configs));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let order_key_to_yojson (x : order_key) =
  match x with Ascending -> `String "Ascending" | Descending -> `String "Descending"

let list_endpoint_configs_input_to_yojson (x : list_endpoint_configs_input) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson endpoint_config_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson endpoint_config_name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let list_endpoints_output_to_yojson (x : list_endpoints_output) =
  assoc_to_yojson
    [
      ("Endpoints", Some (endpoint_summary_list_to_yojson x.endpoints));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_endpoints_input_to_yojson (x : list_endpoints_input) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson endpoint_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson endpoint_name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("StatusEquals", option_to_yojson endpoint_status_to_yojson x.status_equals);
    ]

let list_experiments_response_to_yojson (x : list_experiments_response) =
  assoc_to_yojson
    [
      ("ExperimentSummaries", option_to_yojson experiment_summaries_to_yojson x.experiment_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_experiments_by_to_yojson (x : sort_experiments_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_experiments_request_to_yojson (x : list_experiments_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_experiments_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_feature_groups_response_to_yojson (x : list_feature_groups_response) =
  assoc_to_yojson
    [
      ("FeatureGroupSummaries", Some (feature_group_summaries_to_yojson x.feature_group_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_feature_groups_request_to_yojson (x : list_feature_groups_request) =
  assoc_to_yojson
    [
      ("NameContains", option_to_yojson feature_group_name_contains_to_yojson x.name_contains);
      ( "FeatureGroupStatusEquals",
        option_to_yojson feature_group_status_to_yojson x.feature_group_status_equals );
      ( "OfflineStoreStatusEquals",
        option_to_yojson offline_store_status_value_to_yojson x.offline_store_status_equals );
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("SortOrder", option_to_yojson feature_group_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson feature_group_sort_by_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson feature_group_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_flow_definitions_response_to_yojson (x : list_flow_definitions_response) =
  assoc_to_yojson
    [
      ( "FlowDefinitionSummaries",
        Some (flow_definition_summaries_to_yojson x.flow_definition_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_flow_definitions_request_to_yojson (x : list_flow_definitions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_hub_content_versions_response_to_yojson (x : list_hub_content_versions_response) =
  assoc_to_yojson
    [
      ("HubContentSummaries", Some (hub_content_info_list_to_yojson x.hub_content_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hub_content_versions_request_to_yojson (x : list_hub_content_versions_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
      ("MaxSchemaVersion", option_to_yojson document_schema_version_to_yojson x.max_schema_version);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("SortBy", option_to_yojson hub_content_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hub_contents_response_to_yojson (x : list_hub_contents_response) =
  assoc_to_yojson
    [
      ("HubContentSummaries", Some (hub_content_info_list_to_yojson x.hub_content_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hub_contents_request_to_yojson (x : list_hub_contents_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxSchemaVersion", option_to_yojson document_schema_version_to_yojson x.max_schema_version);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("SortBy", option_to_yojson hub_content_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hubs_response_to_yojson (x : list_hubs_response) =
  assoc_to_yojson
    [
      ("HubSummaries", Some (hub_info_list_to_yojson x.hub_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hubs_request_to_yojson (x : list_hubs_request) =
  assoc_to_yojson
    [
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("SortBy", option_to_yojson hub_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_human_task_uis_response_to_yojson (x : list_human_task_uis_response) =
  assoc_to_yojson
    [
      ("HumanTaskUiSummaries", Some (human_task_ui_summaries_to_yojson x.human_task_ui_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_human_task_uis_request_to_yojson (x : list_human_task_uis_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_hyper_parameter_tuning_jobs_response_to_yojson
    (x : list_hyper_parameter_tuning_jobs_response) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobSummaries",
        Some (hyper_parameter_tuning_job_summaries_to_yojson x.hyper_parameter_tuning_job_summaries)
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hyper_parameter_tuning_jobs_request_to_yojson
    (x : list_hyper_parameter_tuning_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson hyper_parameter_tuning_job_sort_by_options_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("StatusEquals", option_to_yojson hyper_parameter_tuning_job_status_to_yojson x.status_equals);
    ]

let list_image_versions_response_to_yojson (x : list_image_versions_response) =
  assoc_to_yojson
    [
      ("ImageVersions", option_to_yojson image_versions_to_yojson x.image_versions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_image_versions_request_to_yojson (x : list_image_versions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson image_version_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson image_version_sort_order_to_yojson x.sort_order);
    ]

let list_images_response_to_yojson (x : list_images_response) =
  assoc_to_yojson
    [
      ("Images", option_to_yojson images_to_yojson x.images);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_images_request_to_yojson (x : list_images_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson image_name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson image_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson image_sort_order_to_yojson x.sort_order);
    ]

let list_inference_components_output_to_yojson (x : list_inference_components_output) =
  assoc_to_yojson
    [
      ( "InferenceComponents",
        Some (inference_component_summary_list_to_yojson x.inference_components) );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_inference_components_input_to_yojson (x : list_inference_components_input) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson inference_component_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson inference_component_name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("StatusEquals", option_to_yojson inference_component_status_to_yojson x.status_equals);
      ("EndpointNameEquals", option_to_yojson endpoint_name_to_yojson x.endpoint_name_equals);
      ("VariantNameEquals", option_to_yojson variant_name_to_yojson x.variant_name_equals);
    ]

let list_inference_experiments_response_to_yojson (x : list_inference_experiments_response) =
  assoc_to_yojson
    [
      ( "InferenceExperiments",
        option_to_yojson inference_experiment_list_to_yojson x.inference_experiments );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_inference_experiments_by_to_yojson (x : sort_inference_experiments_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_inference_experiments_request_to_yojson (x : list_inference_experiments_request) =
  assoc_to_yojson
    [
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("Type", option_to_yojson inference_experiment_type_to_yojson x.type_);
      ("StatusEquals", option_to_yojson inference_experiment_status_to_yojson x.status_equals);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("SortBy", option_to_yojson sort_inference_experiments_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_inference_recommendations_job_steps_response_to_yojson
    (x : list_inference_recommendations_job_steps_response) =
  assoc_to_yojson
    [
      ("Steps", option_to_yojson inference_recommendations_job_steps_to_yojson x.steps);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_recommendations_job_steps_request_to_yojson
    (x : list_inference_recommendations_job_steps_request) =
  assoc_to_yojson
    [
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("Status", option_to_yojson recommendation_job_status_to_yojson x.status);
      ("StepType", option_to_yojson recommendation_step_type_to_yojson x.step_type);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_recommendations_jobs_response_to_yojson
    (x : list_inference_recommendations_jobs_response) =
  assoc_to_yojson
    [
      ( "InferenceRecommendationsJobs",
        Some (inference_recommendations_jobs_to_yojson x.inference_recommendations_jobs) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_recommendations_jobs_sort_by_to_yojson
    (x : list_inference_recommendations_jobs_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_inference_recommendations_jobs_request_to_yojson
    (x : list_inference_recommendations_jobs_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson recommendation_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson list_inference_recommendations_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ModelNameEquals", option_to_yojson model_name_to_yojson x.model_name_equals);
      ( "ModelPackageVersionArnEquals",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn_equals );
    ]

let list_job_schema_versions_response_to_yojson (x : list_job_schema_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("JobConfigSchemas", Some (job_config_schemas_to_yojson x.job_config_schemas));
    ]

let list_job_schema_versions_request_to_yojson (x : list_job_schema_versions_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_jobs_response_to_yojson (x : list_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("JobSummaries", Some (job_summaries_to_yojson x.job_summaries));
    ]

let sort_by_to_yojson (x : sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("StatusEquals", option_to_yojson job_status_to_yojson x.status_equals);
    ]

let list_labeling_jobs_response_to_yojson (x : list_labeling_jobs_response) =
  assoc_to_yojson
    [
      ( "LabelingJobSummaryList",
        option_to_yojson labeling_job_summary_list_to_yojson x.labeling_job_summary_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_labeling_jobs_request_to_yojson (x : list_labeling_jobs_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("StatusEquals", option_to_yojson labeling_job_status_to_yojson x.status_equals);
    ]

let list_labeling_jobs_for_workteam_response_to_yojson
    (x : list_labeling_jobs_for_workteam_response) =
  assoc_to_yojson
    [
      ( "LabelingJobSummaryList",
        Some (labeling_job_for_workteam_summary_list_to_yojson x.labeling_job_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_labeling_jobs_for_workteam_sort_by_options_to_yojson
    (x : list_labeling_jobs_for_workteam_sort_by_options) =
  match x with CREATION_TIME -> `String "CreationTime"

let list_labeling_jobs_for_workteam_request_to_yojson (x : list_labeling_jobs_for_workteam_request)
    =
  assoc_to_yojson
    [
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ( "JobReferenceCodeContains",
        option_to_yojson job_reference_code_contains_to_yojson x.job_reference_code_contains );
      ( "SortBy",
        option_to_yojson list_labeling_jobs_for_workteam_sort_by_options_to_yojson x.sort_by );
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_lineage_entity_parameter_key_to_yojson tree =
  list_to_yojson string_parameter_value_to_yojson tree

let list_lineage_groups_response_to_yojson (x : list_lineage_groups_response) =
  assoc_to_yojson
    [
      ( "LineageGroupSummaries",
        option_to_yojson lineage_group_summaries_to_yojson x.lineage_group_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_lineage_groups_by_to_yojson (x : sort_lineage_groups_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_lineage_groups_request_to_yojson (x : list_lineage_groups_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_lineage_groups_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let mlflow_app_summary_to_yojson (x : mlflow_app_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn);
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
    ]

let mlflow_app_summaries_to_yojson tree = list_to_yojson mlflow_app_summary_to_yojson tree

let list_mlflow_apps_response_to_yojson (x : list_mlflow_apps_response) =
  assoc_to_yojson
    [
      ("Summaries", option_to_yojson mlflow_app_summaries_to_yojson x.summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_mlflow_app_by_to_yojson (x : sort_mlflow_app_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_mlflow_apps_request_to_yojson (x : list_mlflow_apps_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("DefaultForDomainId", option_to_yojson string__to_yojson x.default_for_domain_id);
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ("SortBy", option_to_yojson sort_mlflow_app_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let tracking_server_summary_to_yojson (x : tracking_server_summary) =
  assoc_to_yojson
    [
      ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn);
      ("TrackingServerName", option_to_yojson tracking_server_name_to_yojson x.tracking_server_name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ("IsActive", option_to_yojson is_tracking_server_active_to_yojson x.is_active);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
    ]

let tracking_server_summary_list_to_yojson tree =
  list_to_yojson tracking_server_summary_to_yojson tree

let list_mlflow_tracking_servers_response_to_yojson (x : list_mlflow_tracking_servers_response) =
  assoc_to_yojson
    [
      ( "TrackingServerSummaries",
        option_to_yojson tracking_server_summary_list_to_yojson x.tracking_server_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_tracking_server_by_to_yojson (x : sort_tracking_server_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_mlflow_tracking_servers_request_to_yojson (x : list_mlflow_tracking_servers_request) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("SortBy", option_to_yojson sort_tracking_server_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_model_bias_job_definitions_response_to_yojson
    (x : list_model_bias_job_definitions_response) =
  assoc_to_yojson
    [
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_bias_job_definitions_request_to_yojson (x : list_model_bias_job_definitions_request)
    =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let model_card_export_job_summary_to_yojson (x : model_card_export_job_summary) =
  assoc_to_yojson
    [
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
      ("Status", Some (model_card_export_job_status_to_yojson x.status));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("LastModifiedAt", Some (timestamp_to_yojson x.last_modified_at));
    ]

let model_card_export_job_summary_list_to_yojson tree =
  list_to_yojson model_card_export_job_summary_to_yojson tree

let list_model_card_export_jobs_response_to_yojson (x : list_model_card_export_jobs_response) =
  assoc_to_yojson
    [
      ( "ModelCardExportJobSummaries",
        Some (model_card_export_job_summary_list_to_yojson x.model_card_export_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_card_export_job_sort_order_to_yojson (x : model_card_export_job_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let model_card_export_job_sort_by_to_yojson (x : model_card_export_job_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_model_card_export_jobs_request_to_yojson (x : list_model_card_export_jobs_request) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ( "ModelCardExportJobNameContains",
        option_to_yojson entity_name_to_yojson x.model_card_export_job_name_contains );
      ("StatusEquals", option_to_yojson model_card_export_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson model_card_export_job_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson model_card_export_job_sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let model_card_version_summary_to_yojson (x : model_card_version_summary) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let model_card_version_summary_list_to_yojson tree =
  list_to_yojson model_card_version_summary_to_yojson tree

let list_model_card_versions_response_to_yojson (x : list_model_card_versions_response) =
  assoc_to_yojson
    [
      ( "ModelCardVersionSummaryList",
        Some (model_card_version_summary_list_to_yojson x.model_card_version_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_card_sort_order_to_yojson (x : model_card_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let model_card_version_sort_by_to_yojson (x : model_card_version_sort_by) =
  match x with VERSION -> `String "Version"

let list_model_card_versions_request_to_yojson (x : list_model_card_versions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson model_card_version_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson model_card_sort_order_to_yojson x.sort_order);
    ]

let model_card_summary_to_yojson (x : model_card_summary) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let model_card_summary_list_to_yojson tree = list_to_yojson model_card_summary_to_yojson tree

let list_model_cards_response_to_yojson (x : list_model_cards_response) =
  assoc_to_yojson
    [
      ("ModelCardSummaries", Some (model_card_summary_list_to_yojson x.model_card_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_card_sort_by_to_yojson (x : model_card_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_model_cards_request_to_yojson (x : list_model_cards_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson model_card_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson model_card_sort_order_to_yojson x.sort_order);
    ]

let list_model_explainability_job_definitions_response_to_yojson
    (x : list_model_explainability_job_definitions_response) =
  assoc_to_yojson
    [
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_explainability_job_definitions_request_to_yojson
    (x : list_model_explainability_job_definitions_request) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let model_metadata_summary_to_yojson (x : model_metadata_summary) =
  assoc_to_yojson
    [
      ("Domain", Some (string__to_yojson x.domain));
      ("Framework", Some (string__to_yojson x.framework));
      ("Task", Some (string__to_yojson x.task));
      ("Model", Some (string__to_yojson x.model));
      ("FrameworkVersion", Some (string__to_yojson x.framework_version));
    ]

let model_metadata_summaries_to_yojson tree = list_to_yojson model_metadata_summary_to_yojson tree

let list_model_metadata_response_to_yojson (x : list_model_metadata_response) =
  assoc_to_yojson
    [
      ( "ModelMetadataSummaries",
        Some (model_metadata_summaries_to_yojson x.model_metadata_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_metadata_filter_type_to_yojson (x : model_metadata_filter_type) =
  match x with
  | DOMAIN -> `String "Domain"
  | FRAMEWORK -> `String "Framework"
  | TASK -> `String "Task"
  | FRAMEWORKVERSION -> `String "FrameworkVersion"

let model_metadata_filter_to_yojson (x : model_metadata_filter) =
  assoc_to_yojson
    [
      ("Name", Some (model_metadata_filter_type_to_yojson x.name));
      ("Value", Some (string256_to_yojson x.value));
    ]

let model_metadata_filters_to_yojson tree = list_to_yojson model_metadata_filter_to_yojson tree

let model_metadata_search_expression_to_yojson (x : model_metadata_search_expression) =
  assoc_to_yojson [ ("Filters", option_to_yojson model_metadata_filters_to_yojson x.filters) ]

let list_model_metadata_request_to_yojson (x : list_model_metadata_request) =
  assoc_to_yojson
    [
      ( "SearchExpression",
        option_to_yojson model_metadata_search_expression_to_yojson x.search_expression );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let model_package_group_summary_to_yojson (x : model_package_group_summary) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageGroupStatus",
        Some (model_package_group_status_to_yojson x.model_package_group_status) );
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
    ]

let model_package_group_summary_list_to_yojson tree =
  list_to_yojson model_package_group_summary_to_yojson tree

let list_model_package_groups_output_to_yojson (x : list_model_package_groups_output) =
  assoc_to_yojson
    [
      ( "ModelPackageGroupSummaryList",
        Some (model_package_group_summary_list_to_yojson x.model_package_group_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_package_group_sort_by_to_yojson (x : model_package_group_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_model_package_groups_input_to_yojson (x : list_model_package_groups_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson model_package_group_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ( "CrossAccountFilterOption",
        option_to_yojson cross_account_filter_option_to_yojson x.cross_account_filter_option );
    ]

let model_package_summary_to_yojson (x : model_package_summary) =
  assoc_to_yojson
    [
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
    ]

let model_package_summary_list_to_yojson tree = list_to_yojson model_package_summary_to_yojson tree

let list_model_packages_output_to_yojson (x : list_model_packages_output) =
  assoc_to_yojson
    [
      ( "ModelPackageSummaryList",
        Some (model_package_summary_list_to_yojson x.model_package_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let model_package_sort_by_to_yojson (x : model_package_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let model_package_type_to_yojson (x : model_package_type) =
  match x with
  | VERSIONED -> `String "Versioned"
  | UNVERSIONED -> `String "Unversioned"
  | BOTH -> `String "Both"

let list_model_packages_input_to_yojson (x : list_model_packages_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("ModelPackageGroupName", option_to_yojson arn_or_name_to_yojson x.model_package_group_name);
      ("ModelPackageType", option_to_yojson model_package_type_to_yojson x.model_package_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson model_package_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_model_quality_job_definitions_response_to_yojson
    (x : list_model_quality_job_definitions_response) =
  assoc_to_yojson
    [
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_quality_job_definitions_request_to_yojson
    (x : list_model_quality_job_definitions_request) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let model_summary_to_yojson (x : model_summary) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("ModelArn", Some (model_arn_to_yojson x.model_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let model_summary_list_to_yojson tree = list_to_yojson model_summary_to_yojson tree

let list_models_output_to_yojson (x : list_models_output) =
  assoc_to_yojson
    [
      ("Models", Some (model_summary_list_to_yojson x.models));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let model_name_contains_to_yojson = string_to_yojson

let model_sort_key_to_yojson (x : model_sort_key) =
  match x with Name -> `String "Name" | CreationTime -> `String "CreationTime"

let list_models_input_to_yojson (x : list_models_input) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson model_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson model_name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let monitoring_alert_status_to_yojson (x : monitoring_alert_status) =
  match x with IN_ALERT -> `String "InAlert" | OK -> `String "OK"

let monitoring_alert_name_to_yojson = string_to_yojson

let monitoring_alert_history_summary_to_yojson (x : monitoring_alert_history_summary) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("AlertStatus", Some (monitoring_alert_status_to_yojson x.alert_status));
    ]

let monitoring_alert_history_list_to_yojson tree =
  list_to_yojson monitoring_alert_history_summary_to_yojson tree

let list_monitoring_alert_history_response_to_yojson (x : list_monitoring_alert_history_response) =
  assoc_to_yojson
    [
      ( "MonitoringAlertHistory",
        option_to_yojson monitoring_alert_history_list_to_yojson x.monitoring_alert_history );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let monitoring_alert_history_sort_key_to_yojson (x : monitoring_alert_history_sort_key) =
  match x with CreationTime -> `String "CreationTime" | Status -> `String "Status"

let list_monitoring_alert_history_request_to_yojson (x : list_monitoring_alert_history_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ( "MonitoringAlertName",
        option_to_yojson monitoring_alert_name_to_yojson x.monitoring_alert_name );
      ("SortBy", option_to_yojson monitoring_alert_history_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("StatusEquals", option_to_yojson monitoring_alert_status_to_yojson x.status_equals);
    ]

let model_dashboard_indicator_action_to_yojson (x : model_dashboard_indicator_action) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean__to_yojson x.enabled) ]

let monitoring_alert_actions_to_yojson (x : monitoring_alert_actions) =
  assoc_to_yojson
    [
      ( "ModelDashboardIndicator",
        option_to_yojson model_dashboard_indicator_action_to_yojson x.model_dashboard_indicator );
    ]

let monitoring_evaluation_period_to_yojson = int_to_yojson
let monitoring_datapoints_to_alert_to_yojson = int_to_yojson

let monitoring_alert_summary_to_yojson (x : monitoring_alert_summary) =
  assoc_to_yojson
    [
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("AlertStatus", Some (monitoring_alert_status_to_yojson x.alert_status));
      ("DatapointsToAlert", Some (monitoring_datapoints_to_alert_to_yojson x.datapoints_to_alert));
      ("EvaluationPeriod", Some (monitoring_evaluation_period_to_yojson x.evaluation_period));
      ("Actions", Some (monitoring_alert_actions_to_yojson x.actions));
    ]

let monitoring_alert_summary_list_to_yojson tree =
  list_to_yojson monitoring_alert_summary_to_yojson tree

let list_monitoring_alerts_response_to_yojson (x : list_monitoring_alerts_response) =
  assoc_to_yojson
    [
      ( "MonitoringAlertSummaries",
        option_to_yojson monitoring_alert_summary_list_to_yojson x.monitoring_alert_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_monitoring_alerts_request_to_yojson (x : list_monitoring_alerts_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let monitoring_execution_summary_list_to_yojson tree =
  list_to_yojson monitoring_execution_summary_to_yojson tree

let list_monitoring_executions_response_to_yojson (x : list_monitoring_executions_response) =
  assoc_to_yojson
    [
      ( "MonitoringExecutionSummaries",
        Some (monitoring_execution_summary_list_to_yojson x.monitoring_execution_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let monitoring_execution_sort_key_to_yojson (x : monitoring_execution_sort_key) =
  match x with
  | CREATION_TIME -> `String "CreationTime"
  | SCHEDULED_TIME -> `String "ScheduledTime"
  | STATUS -> `String "Status"

let list_monitoring_executions_request_to_yojson (x : list_monitoring_executions_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_execution_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ScheduledTimeBefore", option_to_yojson timestamp_to_yojson x.scheduled_time_before);
      ("ScheduledTimeAfter", option_to_yojson timestamp_to_yojson x.scheduled_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("StatusEquals", option_to_yojson execution_status_to_yojson x.status_equals);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("MonitoringTypeEquals", option_to_yojson monitoring_type_to_yojson x.monitoring_type_equals);
    ]

let monitoring_schedule_summary_to_yojson (x : monitoring_schedule_summary) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("MonitoringScheduleStatus", Some (schedule_status_to_yojson x.monitoring_schedule_status));
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
    ]

let monitoring_schedule_summary_list_to_yojson tree =
  list_to_yojson monitoring_schedule_summary_to_yojson tree

let list_monitoring_schedules_response_to_yojson (x : list_monitoring_schedules_response) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleSummaries",
        Some (monitoring_schedule_summary_list_to_yojson x.monitoring_schedule_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let monitoring_schedule_sort_key_to_yojson (x : monitoring_schedule_sort_key) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_monitoring_schedules_request_to_yojson (x : list_monitoring_schedules_request) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("SortBy", option_to_yojson monitoring_schedule_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("StatusEquals", option_to_yojson schedule_status_to_yojson x.status_equals);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("MonitoringTypeEquals", option_to_yojson monitoring_type_to_yojson x.monitoring_type_equals);
    ]

let notebook_instance_lifecycle_config_summary_to_yojson
    (x : notebook_instance_lifecycle_config_summary) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
      ( "NotebookInstanceLifecycleConfigArn",
        Some
          (notebook_instance_lifecycle_config_arn_to_yojson x.notebook_instance_lifecycle_config_arn)
      );
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
    ]

let notebook_instance_lifecycle_config_summary_list_to_yojson tree =
  list_to_yojson notebook_instance_lifecycle_config_summary_to_yojson tree

let list_notebook_instance_lifecycle_configs_output_to_yojson
    (x : list_notebook_instance_lifecycle_configs_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "NotebookInstanceLifecycleConfigs",
        option_to_yojson notebook_instance_lifecycle_config_summary_list_to_yojson
          x.notebook_instance_lifecycle_configs );
    ]

let notebook_instance_lifecycle_config_name_contains_to_yojson = string_to_yojson

let notebook_instance_lifecycle_config_sort_order_to_yojson
    (x : notebook_instance_lifecycle_config_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let notebook_instance_lifecycle_config_sort_key_to_yojson
    (x : notebook_instance_lifecycle_config_sort_key) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"

let list_notebook_instance_lifecycle_configs_input_to_yojson
    (x : list_notebook_instance_lifecycle_configs_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson notebook_instance_lifecycle_config_sort_key_to_yojson x.sort_by);
      ( "SortOrder",
        option_to_yojson notebook_instance_lifecycle_config_sort_order_to_yojson x.sort_order );
      ( "NameContains",
        option_to_yojson notebook_instance_lifecycle_config_name_contains_to_yojson x.name_contains
      );
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
    ]

let notebook_instance_summary_to_yojson (x : notebook_instance_summary) =
  assoc_to_yojson
    [
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
      ("NotebookInstanceArn", Some (notebook_instance_arn_to_yojson x.notebook_instance_arn));
      ( "NotebookInstanceStatus",
        option_to_yojson notebook_instance_status_to_yojson x.notebook_instance_status );
      ("Url", option_to_yojson notebook_instance_url_to_yojson x.url);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
    ]

let notebook_instance_summary_list_to_yojson tree =
  list_to_yojson notebook_instance_summary_to_yojson tree

let list_notebook_instances_output_to_yojson (x : list_notebook_instances_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "NotebookInstances",
        option_to_yojson notebook_instance_summary_list_to_yojson x.notebook_instances );
    ]

let notebook_instance_name_contains_to_yojson = string_to_yojson

let notebook_instance_sort_order_to_yojson (x : notebook_instance_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let notebook_instance_sort_key_to_yojson (x : notebook_instance_sort_key) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_notebook_instances_input_to_yojson (x : list_notebook_instances_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson notebook_instance_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson notebook_instance_sort_order_to_yojson x.sort_order);
      ("NameContains", option_to_yojson notebook_instance_name_contains_to_yojson x.name_contains);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ("StatusEquals", option_to_yojson notebook_instance_status_to_yojson x.status_equals);
      ( "NotebookInstanceLifecycleConfigNameContains",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name_contains );
      ( "DefaultCodeRepositoryContains",
        option_to_yojson code_repository_contains_to_yojson x.default_code_repository_contains );
      ( "AdditionalCodeRepositoryEquals",
        option_to_yojson code_repository_name_or_url_to_yojson x.additional_code_repository_equals
      );
    ]

let optimization_type_to_yojson = string_to_yojson
let optimization_types_to_yojson tree = list_to_yojson optimization_type_to_yojson tree

let optimization_job_summary_to_yojson (x : optimization_job_summary) =
  assoc_to_yojson
    [
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
      ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("OptimizationJobStatus", Some (optimization_job_status_to_yojson x.optimization_job_status));
      ("OptimizationStartTime", option_to_yojson timestamp_to_yojson x.optimization_start_time);
      ("OptimizationEndTime", option_to_yojson timestamp_to_yojson x.optimization_end_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ("OptimizationTypes", Some (optimization_types_to_yojson x.optimization_types));
    ]

let optimization_job_summaries_to_yojson tree =
  list_to_yojson optimization_job_summary_to_yojson tree

let list_optimization_jobs_response_to_yojson (x : list_optimization_jobs_response) =
  assoc_to_yojson
    [
      ( "OptimizationJobSummaries",
        Some (optimization_job_summaries_to_yojson x.optimization_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_optimization_jobs_sort_by_to_yojson (x : list_optimization_jobs_sort_by) =
  match x with
  | NAME -> `String "Name"
  | CREATION_TIME -> `String "CreationTime"
  | STATUS -> `String "Status"

let list_optimization_jobs_request_to_yojson (x : list_optimization_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ("OptimizationContains", option_to_yojson name_contains_to_yojson x.optimization_contains);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson optimization_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson list_optimization_jobs_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let partner_app_summary_to_yojson (x : partner_app_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn);
      ("Name", option_to_yojson partner_app_name_to_yojson x.name);
      ("Type", option_to_yojson partner_app_type_to_yojson x.type_);
      ("Status", option_to_yojson partner_app_status_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let partner_app_summaries_to_yojson tree = list_to_yojson partner_app_summary_to_yojson tree

let list_partner_apps_response_to_yojson (x : list_partner_apps_response) =
  assoc_to_yojson
    [
      ("Summaries", option_to_yojson partner_app_summaries_to_yojson x.summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_partner_apps_request_to_yojson (x : list_partner_apps_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let selective_execution_result_to_yojson (x : selective_execution_result) =
  assoc_to_yojson
    [
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
    ]

let quality_check_step_metadata_to_yojson (x : quality_check_step_metadata) =
  assoc_to_yojson
    [
      ("CheckType", option_to_yojson string256_to_yojson x.check_type);
      ( "BaselineUsedForDriftCheckStatistics",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_statistics );
      ( "BaselineUsedForDriftCheckConstraints",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_constraints );
      ( "CalculatedBaselineStatistics",
        option_to_yojson string1024_to_yojson x.calculated_baseline_statistics );
      ( "CalculatedBaselineConstraints",
        option_to_yojson string1024_to_yojson x.calculated_baseline_constraints );
      ("ModelPackageGroupName", option_to_yojson string256_to_yojson x.model_package_group_name);
      ("ViolationReport", option_to_yojson string1024_to_yojson x.violation_report);
      ("CheckJobArn", option_to_yojson string256_to_yojson x.check_job_arn);
      ("SkipCheck", option_to_yojson boolean__to_yojson x.skip_check);
      ("RegisterNewBaseline", option_to_yojson boolean__to_yojson x.register_new_baseline);
    ]

let register_model_step_metadata_to_yojson (x : register_model_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string256_to_yojson x.arn) ]

let model_step_metadata_to_yojson (x : model_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string256_to_yojson x.arn) ]

let tuning_job_step_meta_data_to_yojson (x : tuning_job_step_meta_data) =
  assoc_to_yojson [ ("Arn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.arn) ]

let transform_job_step_metadata_to_yojson (x : transform_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson transform_job_arn_to_yojson x.arn) ]

let processing_job_step_metadata_to_yojson (x : processing_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson processing_job_arn_to_yojson x.arn) ]

let training_job_step_metadata_to_yojson (x : training_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson training_job_arn_to_yojson x.arn) ]

let pipeline_execution_step_metadata_to_yojson (x : pipeline_execution_step_metadata) =
  assoc_to_yojson
    [
      ("TrainingJob", option_to_yojson training_job_step_metadata_to_yojson x.training_job);
      ("ProcessingJob", option_to_yojson processing_job_step_metadata_to_yojson x.processing_job);
      ("TransformJob", option_to_yojson transform_job_step_metadata_to_yojson x.transform_job);
      ("TuningJob", option_to_yojson tuning_job_step_meta_data_to_yojson x.tuning_job);
      ("Model", option_to_yojson model_step_metadata_to_yojson x.model);
      ("RegisterModel", option_to_yojson register_model_step_metadata_to_yojson x.register_model);
      ("Condition", option_to_yojson condition_step_metadata_to_yojson x.condition);
      ("Callback", option_to_yojson callback_step_metadata_to_yojson x.callback);
      ("Lambda", option_to_yojson lambda_step_metadata_to_yojson x.lambda);
      ("EMR", option_to_yojson emr_step_metadata_to_yojson x.em_r);
      ("QualityCheck", option_to_yojson quality_check_step_metadata_to_yojson x.quality_check);
      ("ClarifyCheck", option_to_yojson clarify_check_step_metadata_to_yojson x.clarify_check);
      ("Fail", option_to_yojson fail_step_metadata_to_yojson x.fail);
      ("AutoMLJob", option_to_yojson auto_ml_job_step_metadata_to_yojson x.auto_ml_job);
      ("Endpoint", option_to_yojson endpoint_step_metadata_to_yojson x.endpoint);
      ("EndpointConfig", option_to_yojson endpoint_config_step_metadata_to_yojson x.endpoint_config);
      ( "BedrockCustomModel",
        option_to_yojson bedrock_custom_model_metadata_to_yojson x.bedrock_custom_model );
      ( "BedrockCustomModelDeployment",
        option_to_yojson bedrock_custom_model_deployment_metadata_to_yojson
          x.bedrock_custom_model_deployment );
      ( "BedrockProvisionedModelThroughput",
        option_to_yojson bedrock_provisioned_model_throughput_metadata_to_yojson
          x.bedrock_provisioned_model_throughput );
      ( "BedrockModelImport",
        option_to_yojson bedrock_model_import_metadata_to_yojson x.bedrock_model_import );
      ( "InferenceComponent",
        option_to_yojson inference_component_metadata_to_yojson x.inference_component );
      ("Lineage", option_to_yojson lineage_metadata_to_yojson x.lineage);
      ("Job", option_to_yojson job_step_metadata_to_yojson x.job);
    ]

let step_status_to_yojson (x : step_status) =
  match x with
  | STARTING -> `String "Starting"
  | EXECUTING -> `String "Executing"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"

let step_description_to_yojson = string_to_yojson
let step_display_name_to_yojson = string_to_yojson
let step_name_to_yojson = string_to_yojson

let pipeline_execution_step_to_yojson (x : pipeline_execution_step) =
  assoc_to_yojson
    [
      ("StepName", option_to_yojson step_name_to_yojson x.step_name);
      ("StepDisplayName", option_to_yojson step_display_name_to_yojson x.step_display_name);
      ("StepDescription", option_to_yojson step_description_to_yojson x.step_description);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StepStatus", option_to_yojson step_status_to_yojson x.step_status);
      ("CacheHitResult", option_to_yojson cache_hit_result_to_yojson x.cache_hit_result);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Metadata", option_to_yojson pipeline_execution_step_metadata_to_yojson x.metadata);
      ("AttemptCount", option_to_yojson integer_to_yojson x.attempt_count);
      ( "SelectiveExecutionResult",
        option_to_yojson selective_execution_result_to_yojson x.selective_execution_result );
    ]

let pipeline_execution_step_list_to_yojson tree =
  list_to_yojson pipeline_execution_step_to_yojson tree

let list_pipeline_execution_steps_response_to_yojson (x : list_pipeline_execution_steps_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionSteps",
        option_to_yojson pipeline_execution_step_list_to_yojson x.pipeline_execution_steps );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_pipeline_execution_steps_request_to_yojson (x : list_pipeline_execution_steps_request) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let pipeline_execution_summary_to_yojson (x : pipeline_execution_summary) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionFailureReason",
        option_to_yojson string3072_to_yojson x.pipeline_execution_failure_reason );
    ]

let pipeline_execution_summary_list_to_yojson tree =
  list_to_yojson pipeline_execution_summary_to_yojson tree

let list_pipeline_executions_response_to_yojson (x : list_pipeline_executions_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionSummaries",
        option_to_yojson pipeline_execution_summary_list_to_yojson x.pipeline_execution_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_pipeline_executions_by_to_yojson (x : sort_pipeline_executions_by) =
  match x with
  | CREATION_TIME -> `String "CreationTime"
  | PIPELINE_EXECUTION_ARN -> `String "PipelineExecutionArn"

let list_pipeline_executions_request_to_yojson (x : list_pipeline_executions_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_pipeline_executions_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let pipeline_parameter_name_to_yojson = string_to_yojson

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("Name", Some (pipeline_parameter_name_to_yojson x.name));
      ("Value", Some (string1024_to_yojson x.value));
    ]

let parameter_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let list_pipeline_parameters_for_execution_response_to_yojson
    (x : list_pipeline_parameters_for_execution_response) =
  assoc_to_yojson
    [
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_pipeline_parameters_for_execution_request_to_yojson
    (x : list_pipeline_parameters_for_execution_request) =
  assoc_to_yojson
    [
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let pipeline_version_summary_to_yojson (x : pipeline_version_summary) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "LastExecutionPipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.last_execution_pipeline_execution_arn );
    ]

let pipeline_version_summary_list_to_yojson tree =
  list_to_yojson pipeline_version_summary_to_yojson tree

let list_pipeline_versions_response_to_yojson (x : list_pipeline_versions_response) =
  assoc_to_yojson
    [
      ( "PipelineVersionSummaries",
        option_to_yojson pipeline_version_summary_list_to_yojson x.pipeline_version_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_pipeline_versions_request_to_yojson (x : list_pipeline_versions_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let pipeline_summary_to_yojson (x : pipeline_summary) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastExecutionTime", option_to_yojson timestamp_to_yojson x.last_execution_time);
    ]

let pipeline_summary_list_to_yojson tree = list_to_yojson pipeline_summary_to_yojson tree

let list_pipelines_response_to_yojson (x : list_pipelines_response) =
  assoc_to_yojson
    [
      ("PipelineSummaries", option_to_yojson pipeline_summary_list_to_yojson x.pipeline_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_pipelines_by_to_yojson (x : sort_pipelines_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_pipelines_request_to_yojson (x : list_pipelines_request) =
  assoc_to_yojson
    [
      ("PipelineNamePrefix", option_to_yojson pipeline_name_to_yojson x.pipeline_name_prefix);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_pipelines_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let processing_job_summary_to_yojson (x : processing_job_summary) =
  assoc_to_yojson
    [
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
      ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ProcessingJobStatus", Some (processing_job_status_to_yojson x.processing_job_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
    ]

let processing_job_summaries_to_yojson tree = list_to_yojson processing_job_summary_to_yojson tree

let list_processing_jobs_response_to_yojson (x : list_processing_jobs_response) =
  assoc_to_yojson
    [
      ( "ProcessingJobSummaries",
        Some (processing_job_summaries_to_yojson x.processing_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_processing_jobs_request_to_yojson (x : list_processing_jobs_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson string__to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson processing_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let project_summary_to_yojson (x : project_summary) =
  assoc_to_yojson
    [
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("ProjectId", Some (project_id_to_yojson x.project_id));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ProjectStatus", Some (project_status_to_yojson x.project_status));
    ]

let project_summary_list_to_yojson tree = list_to_yojson project_summary_to_yojson tree

let list_projects_output_to_yojson (x : list_projects_output) =
  assoc_to_yojson
    [
      ("ProjectSummaryList", Some (project_summary_list_to_yojson x.project_summary_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let project_sort_order_to_yojson (x : project_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let project_sort_by_to_yojson (x : project_sort_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_projects_input_to_yojson (x : list_projects_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson project_entity_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson project_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson project_sort_order_to_yojson x.sort_order);
    ]

let resource_catalog_description_to_yojson = string_to_yojson
let resource_catalog_name_to_yojson = string_to_yojson
let resource_catalog_arn_to_yojson = string_to_yojson

let resource_catalog_to_yojson (x : resource_catalog) =
  assoc_to_yojson
    [
      ("ResourceCatalogArn", Some (resource_catalog_arn_to_yojson x.resource_catalog_arn));
      ("ResourceCatalogName", Some (resource_catalog_name_to_yojson x.resource_catalog_name));
      ("Description", Some (resource_catalog_description_to_yojson x.description));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let resource_catalog_list_to_yojson tree = list_to_yojson resource_catalog_to_yojson tree

let list_resource_catalogs_response_to_yojson (x : list_resource_catalogs_response) =
  assoc_to_yojson
    [
      ("ResourceCatalogs", option_to_yojson resource_catalog_list_to_yojson x.resource_catalogs);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_catalog_sort_by_to_yojson (x : resource_catalog_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime"

let resource_catalog_sort_order_to_yojson (x : resource_catalog_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let list_resource_catalogs_request_to_yojson (x : list_resource_catalogs_request) =
  assoc_to_yojson
    [
      ("NameContains", option_to_yojson resource_catalog_name_to_yojson x.name_contains);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("SortOrder", option_to_yojson resource_catalog_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson resource_catalog_sort_by_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ownership_settings_summary_to_yojson (x : ownership_settings_summary) =
  assoc_to_yojson
    [
      ( "OwnerUserProfileName",
        option_to_yojson user_profile_name_to_yojson x.owner_user_profile_name );
    ]

let space_sharing_settings_summary_to_yojson (x : space_sharing_settings_summary) =
  assoc_to_yojson [ ("SharingType", option_to_yojson sharing_type_to_yojson x.sharing_type) ]

let space_settings_summary_to_yojson (x : space_settings_summary) =
  assoc_to_yojson
    [
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ("RemoteAccess", option_to_yojson feature_status_to_yojson x.remote_access);
      ( "SpaceStorageSettings",
        option_to_yojson space_storage_settings_to_yojson x.space_storage_settings );
    ]

let space_details_to_yojson (x : space_details) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("Status", option_to_yojson space_status_to_yojson x.status);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ( "SpaceSettingsSummary",
        option_to_yojson space_settings_summary_to_yojson x.space_settings_summary );
      ( "SpaceSharingSettingsSummary",
        option_to_yojson space_sharing_settings_summary_to_yojson x.space_sharing_settings_summary
      );
      ( "OwnershipSettingsSummary",
        option_to_yojson ownership_settings_summary_to_yojson x.ownership_settings_summary );
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
    ]

let space_list_to_yojson tree = list_to_yojson space_details_to_yojson tree

let list_spaces_response_to_yojson (x : list_spaces_response) =
  assoc_to_yojson
    [
      ("Spaces", option_to_yojson space_list_to_yojson x.spaces);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let space_sort_key_to_yojson (x : space_sort_key) =
  match x with
  | CreationTime -> `String "CreationTime"
  | LastModifiedTime -> `String "LastModifiedTime"

let list_spaces_request_to_yojson (x : list_spaces_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson space_sort_key_to_yojson x.sort_by);
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ("SpaceNameContains", option_to_yojson space_name_to_yojson x.space_name_contains);
    ]

let list_stage_devices_response_to_yojson (x : list_stage_devices_response) =
  assoc_to_yojson
    [
      ( "DeviceDeploymentSummaries",
        Some (device_deployment_summaries_to_yojson x.device_deployment_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_stage_devices_request_to_yojson (x : list_stage_devices_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ( "ExcludeDevicesDeployedInOtherStage",
        option_to_yojson boolean__to_yojson x.exclude_devices_deployed_in_other_stage );
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let studio_lifecycle_config_details_to_yojson (x : studio_lifecycle_config_details) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
      ( "StudioLifecycleConfigName",
        option_to_yojson studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "StudioLifecycleConfigAppType",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson
          x.studio_lifecycle_config_app_type );
    ]

let studio_lifecycle_configs_list_to_yojson tree =
  list_to_yojson studio_lifecycle_config_details_to_yojson tree

let list_studio_lifecycle_configs_response_to_yojson (x : list_studio_lifecycle_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "StudioLifecycleConfigs",
        option_to_yojson studio_lifecycle_configs_list_to_yojson x.studio_lifecycle_configs );
    ]

let studio_lifecycle_config_sort_key_to_yojson (x : studio_lifecycle_config_sort_key) =
  match x with
  | CreationTime -> `String "CreationTime"
  | LastModifiedTime -> `String "LastModifiedTime"
  | Name -> `String "Name"

let list_studio_lifecycle_configs_request_to_yojson (x : list_studio_lifecycle_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson studio_lifecycle_config_name_to_yojson x.name_contains);
      ( "AppTypeEquals",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson x.app_type_equals );
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("ModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.modified_time_before);
      ("ModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.modified_time_after);
      ("SortBy", option_to_yojson studio_lifecycle_config_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let subscribed_workteams_to_yojson tree = list_to_yojson subscribed_workteam_to_yojson tree

let list_subscribed_workteams_response_to_yojson (x : list_subscribed_workteams_response) =
  assoc_to_yojson
    [
      ("SubscribedWorkteams", Some (subscribed_workteams_to_yojson x.subscribed_workteams));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_subscribed_workteams_request_to_yojson (x : list_subscribed_workteams_request) =
  assoc_to_yojson
    [
      ("NameContains", option_to_yojson workteam_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_output_to_yojson (x : list_tags_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_max_results_to_yojson = int_to_yojson

let list_tags_input_to_yojson (x : list_tags_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_tags_max_results_to_yojson x.max_results);
    ]

let training_job_summary_to_yojson (x : training_job_summary) =
  assoc_to_yojson
    [
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("SecondaryStatus", option_to_yojson secondary_status_to_yojson x.secondary_status);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
    ]

let training_job_summaries_to_yojson tree = list_to_yojson training_job_summary_to_yojson tree

let list_training_jobs_response_to_yojson (x : list_training_jobs_response) =
  assoc_to_yojson
    [
      ("TrainingJobSummaries", Some (training_job_summaries_to_yojson x.training_job_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_training_jobs_request_to_yojson (x : list_training_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson training_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ( "WarmPoolStatusEquals",
        option_to_yojson warm_pool_resource_status_to_yojson x.warm_pool_status_equals );
      ( "TrainingPlanArnEquals",
        option_to_yojson training_plan_arn_to_yojson x.training_plan_arn_equals );
    ]

let list_training_jobs_for_hyper_parameter_tuning_job_response_to_yojson
    (x : list_training_jobs_for_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ( "TrainingJobSummaries",
        Some (hyper_parameter_training_job_summaries_to_yojson x.training_job_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let training_job_sort_by_options_to_yojson (x : training_job_sort_by_options) =
  match x with
  | Name -> `String "Name"
  | CreationTime -> `String "CreationTime"
  | Status -> `String "Status"
  | FinalObjectiveMetricValue -> `String "FinalObjectiveMetricValue"

let list_training_jobs_for_hyper_parameter_tuning_job_request_to_yojson
    (x : list_training_jobs_for_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("StatusEquals", option_to_yojson training_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson training_job_sort_by_options_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let training_plan_summary_to_yojson (x : training_plan_summary) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
      ("Status", Some (training_plan_status_to_yojson x.status));
      ("StatusMessage", option_to_yojson training_plan_status_message_to_yojson x.status_message);
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("TotalInstanceCount", option_to_yojson total_instance_count_to_yojson x.total_instance_count);
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "TotalUltraServerCount",
        option_to_yojson ultra_server_count_to_yojson x.total_ultra_server_count );
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ( "ReservedCapacitySummaries",
        option_to_yojson reserved_capacity_summaries_to_yojson x.reserved_capacity_summaries );
    ]

let training_plan_summaries_to_yojson tree = list_to_yojson training_plan_summary_to_yojson tree

let list_training_plans_response_to_yojson (x : list_training_plans_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TrainingPlanSummaries", Some (training_plan_summaries_to_yojson x.training_plan_summaries));
    ]

let training_plan_filter_name_to_yojson (x : training_plan_filter_name) =
  match x with STATUS -> `String "Status"

let training_plan_filter_to_yojson (x : training_plan_filter) =
  assoc_to_yojson
    [
      ("Name", Some (training_plan_filter_name_to_yojson x.name));
      ("Value", Some (string64_to_yojson x.value));
    ]

let training_plan_filters_to_yojson tree = list_to_yojson training_plan_filter_to_yojson tree

let training_plan_sort_order_to_yojson (x : training_plan_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let training_plan_sort_by_to_yojson (x : training_plan_sort_by) =
  match x with
  | NAME -> `String "TrainingPlanName"
  | START_TIME -> `String "StartTime"
  | STATUS -> `String "Status"

let list_training_plans_request_to_yojson (x : list_training_plans_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("StartTimeAfter", option_to_yojson timestamp_to_yojson x.start_time_after);
      ("StartTimeBefore", option_to_yojson timestamp_to_yojson x.start_time_before);
      ("SortBy", option_to_yojson training_plan_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson training_plan_sort_order_to_yojson x.sort_order);
      ("Filters", option_to_yojson training_plan_filters_to_yojson x.filters);
    ]

let transform_job_summary_to_yojson (x : transform_job_summary) =
  assoc_to_yojson
    [
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
      ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TransformJobStatus", Some (transform_job_status_to_yojson x.transform_job_status));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let transform_job_summaries_to_yojson tree = list_to_yojson transform_job_summary_to_yojson tree

let list_transform_jobs_response_to_yojson (x : list_transform_jobs_response) =
  assoc_to_yojson
    [
      ("TransformJobSummaries", Some (transform_job_summaries_to_yojson x.transform_job_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_transform_jobs_request_to_yojson (x : list_transform_jobs_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("StatusEquals", option_to_yojson transform_job_status_to_yojson x.status_equals);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let trial_component_key256_to_yojson = string_to_yojson

let list_trial_component_key256_to_yojson tree =
  list_to_yojson trial_component_key256_to_yojson tree

let trial_component_summary_to_yojson (x : trial_component_summary) =
  assoc_to_yojson
    [
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ( "TrialComponentSource",
        option_to_yojson trial_component_source_to_yojson x.trial_component_source );
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let trial_component_summaries_to_yojson tree = list_to_yojson trial_component_summary_to_yojson tree

let list_trial_components_response_to_yojson (x : list_trial_components_response) =
  assoc_to_yojson
    [
      ( "TrialComponentSummaries",
        option_to_yojson trial_component_summaries_to_yojson x.trial_component_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_trial_components_by_to_yojson (x : sort_trial_components_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_trial_components_request_to_yojson (x : list_trial_components_request) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("SourceArn", option_to_yojson string256_to_yojson x.source_arn);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_trial_components_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let trial_summary_to_yojson (x : trial_summary) =
  assoc_to_yojson
    [
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialSource", option_to_yojson trial_source_to_yojson x.trial_source);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let trial_summaries_to_yojson tree = list_to_yojson trial_summary_to_yojson tree

let list_trials_response_to_yojson (x : list_trials_response) =
  assoc_to_yojson
    [
      ("TrialSummaries", option_to_yojson trial_summaries_to_yojson x.trial_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sort_trials_by_to_yojson (x : sort_trials_by) =
  match x with NAME -> `String "Name" | CREATION_TIME -> `String "CreationTime"

let list_trials_request_to_yojson (x : list_trials_request) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("SortBy", option_to_yojson sort_trials_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ultra_server_health_status_to_yojson (x : ultra_server_health_status) =
  match x with
  | OK -> `String "OK"
  | IMPAIRED -> `String "Impaired"
  | INSUFFICIENT_DATA -> `String "Insufficient-Data"

let ultra_server_to_yojson (x : ultra_server) =
  assoc_to_yojson
    [
      ("UltraServerId", Some (non_empty_string256_to_yojson x.ultra_server_id));
      ("UltraServerType", Some (ultra_server_type_to_yojson x.ultra_server_type));
      ("AvailabilityZone", Some (availability_zone_to_yojson x.availability_zone));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ( "ConfiguredSpareInstanceCount",
        option_to_yojson configured_spare_instance_count_to_yojson x.configured_spare_instance_count
      );
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
      ("HealthStatus", option_to_yojson ultra_server_health_status_to_yojson x.health_status);
    ]

let ultra_servers_to_yojson tree = list_to_yojson ultra_server_to_yojson tree

let list_ultra_servers_by_reserved_capacity_response_to_yojson
    (x : list_ultra_servers_by_reserved_capacity_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("UltraServers", Some (ultra_servers_to_yojson x.ultra_servers));
    ]

let list_ultra_servers_by_reserved_capacity_request_to_yojson
    (x : list_ultra_servers_by_reserved_capacity_request) =
  assoc_to_yojson
    [
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let user_profile_details_to_yojson (x : user_profile_details) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("Status", option_to_yojson user_profile_status_to_yojson x.status);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
    ]

let user_profile_list_to_yojson tree = list_to_yojson user_profile_details_to_yojson tree

let list_user_profiles_response_to_yojson (x : list_user_profiles_response) =
  assoc_to_yojson
    [
      ("UserProfiles", option_to_yojson user_profile_list_to_yojson x.user_profiles);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let user_profile_sort_key_to_yojson (x : user_profile_sort_key) =
  match x with
  | CreationTime -> `String "CreationTime"
  | LastModifiedTime -> `String "LastModifiedTime"

let list_user_profiles_request_to_yojson (x : list_user_profiles_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson user_profile_sort_key_to_yojson x.sort_by);
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ( "UserProfileNameContains",
        option_to_yojson user_profile_name_to_yojson x.user_profile_name_contains );
    ]

let workforces_to_yojson tree = list_to_yojson workforce_to_yojson tree

let list_workforces_response_to_yojson (x : list_workforces_response) =
  assoc_to_yojson
    [
      ("Workforces", Some (workforces_to_yojson x.workforces));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_workforces_sort_by_options_to_yojson (x : list_workforces_sort_by_options) =
  match x with Name -> `String "Name" | CreateDate -> `String "CreateDate"

let list_workforces_request_to_yojson (x : list_workforces_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson list_workforces_sort_by_options_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NameContains", option_to_yojson workforce_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let workteams_to_yojson tree = list_to_yojson workteam_to_yojson tree

let list_workteams_response_to_yojson (x : list_workteams_response) =
  assoc_to_yojson
    [
      ("Workteams", Some (workteams_to_yojson x.workteams));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_workteams_sort_by_options_to_yojson (x : list_workteams_sort_by_options) =
  match x with Name -> `String "Name" | CreateDate -> `String "CreateDate"

let list_workteams_request_to_yojson (x : list_workteams_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson list_workteams_sort_by_options_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NameContains", option_to_yojson workteam_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let model_to_yojson (x : model) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeploymentRecommendation",
        option_to_yojson deployment_recommendation_to_yojson x.deployment_recommendation );
    ]

let model_card_to_yojson (x : model_card) =
  assoc_to_yojson
    [
      ("ModelCardArn", option_to_yojson model_card_arn_to_yojson x.model_card_arn);
      ("ModelCardName", option_to_yojson entity_name_to_yojson x.model_card_name);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("Content", option_to_yojson model_card_content_to_yojson x.content);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ModelId", option_to_yojson string__to_yojson x.model_id);
      ("RiskRating", option_to_yojson string__to_yojson x.risk_rating);
      ("ModelPackageGroupName", option_to_yojson string__to_yojson x.model_package_group_name);
    ]

let model_dashboard_endpoint_to_yojson (x : model_dashboard_endpoint) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
    ]

let model_dashboard_endpoints_to_yojson tree =
  list_to_yojson model_dashboard_endpoint_to_yojson tree

let model_dashboard_model_card_to_yojson (x : model_dashboard_model_card) =
  assoc_to_yojson
    [
      ("ModelCardArn", option_to_yojson model_card_arn_to_yojson x.model_card_arn);
      ("ModelCardName", option_to_yojson entity_name_to_yojson x.model_card_name);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ModelId", option_to_yojson string__to_yojson x.model_id);
      ("RiskRating", option_to_yojson string__to_yojson x.risk_rating);
    ]

let model_dashboard_monitoring_schedule_to_yojson (x : model_dashboard_monitoring_schedule) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ( "MonitoringScheduleStatus",
        option_to_yojson schedule_status_to_yojson x.monitoring_schedule_status );
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "MonitoringScheduleConfig",
        option_to_yojson monitoring_schedule_config_to_yojson x.monitoring_schedule_config );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringAlertSummaries",
        option_to_yojson monitoring_alert_summary_list_to_yojson x.monitoring_alert_summaries );
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
    ]

let model_dashboard_monitoring_schedules_to_yojson tree =
  list_to_yojson model_dashboard_monitoring_schedule_to_yojson tree

let transform_job_to_yojson (x : transform_job) =
  assoc_to_yojson
    [
      ("TransformJobName", option_to_yojson transform_job_name_to_yojson x.transform_job_name);
      ("TransformJobArn", option_to_yojson transform_job_arn_to_yojson x.transform_job_arn);
      ("TransformJobStatus", option_to_yojson transform_job_status_to_yojson x.transform_job_status);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("TransformInput", option_to_yojson transform_input_to_yojson x.transform_input);
      ("TransformOutput", option_to_yojson transform_output_to_yojson x.transform_output);
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformResources", option_to_yojson transform_resources_to_yojson x.transform_resources);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TransformStartTime", option_to_yojson timestamp_to_yojson x.transform_start_time);
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let model_dashboard_model_to_yojson (x : model_dashboard_model) =
  assoc_to_yojson
    [
      ("Model", option_to_yojson model_to_yojson x.model);
      ("Endpoints", option_to_yojson model_dashboard_endpoints_to_yojson x.endpoints);
      ("LastBatchTransformJob", option_to_yojson transform_job_to_yojson x.last_batch_transform_job);
      ( "MonitoringSchedules",
        option_to_yojson model_dashboard_monitoring_schedules_to_yojson x.monitoring_schedules );
      ("ModelCard", option_to_yojson model_dashboard_model_card_to_yojson x.model_card);
    ]

let model_package_to_yojson (x : model_package) =
  assoc_to_yojson
    [
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ("ModelPackageArn", option_to_yojson model_package_arn_to_yojson x.model_package_arn);
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ("ModelPackageStatus", option_to_yojson model_package_status_to_yojson x.model_package_status);
      ( "ModelPackageStatusDetails",
        option_to_yojson model_package_status_details_to_yojson x.model_package_status_details );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("SamplePayloadUrl", option_to_yojson string__to_yojson x.sample_payload_url);
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
    ]

let model_package_group_to_yojson (x : model_package_group) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ( "ModelPackageGroupArn",
        option_to_yojson model_package_group_arn_to_yojson x.model_package_group_arn );
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ( "ModelPackageGroupStatus",
        option_to_yojson model_package_group_status_to_yojson x.model_package_group_status );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let model_variant_action_to_yojson (x : model_variant_action) =
  match x with
  | RETAIN -> `String "Retain"
  | REMOVE -> `String "Remove"
  | PROMOTE -> `String "Promote"

let model_variant_action_map_to_yojson tree =
  map_to_yojson model_variant_name_to_yojson model_variant_action_to_yojson tree

let nested_filters_to_yojson (x : nested_filters) =
  assoc_to_yojson
    [
      ("NestedPropertyName", Some (resource_property_name_to_yojson x.nested_property_name));
      ("Filters", Some (filter_list_to_yojson x.filters));
    ]

let nested_filters_list_to_yojson tree = list_to_yojson nested_filters_to_yojson tree

let online_store_config_update_to_yojson (x : online_store_config_update) =
  assoc_to_yojson [ ("TtlDuration", option_to_yojson ttl_duration_to_yojson x.ttl_duration) ]

let parent_to_yojson (x : parent) =
  assoc_to_yojson
    [
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let pipeline_to_yojson (x : pipeline) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineStatus", option_to_yojson pipeline_status_to_yojson x.pipeline_status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastRunTime", option_to_yojson timestamp_to_yojson x.last_run_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let pipeline_execution_to_yojson (x : pipeline_execution) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExperimentConfig",
        option_to_yojson pipeline_experiment_config_to_yojson x.pipeline_experiment_config );
      ( "FailureReason",
        option_to_yojson pipeline_execution_failure_reason_to_yojson x.failure_reason );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
    ]

let pipeline_version_to_yojson (x : pipeline_version) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ( "LastExecutedPipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.last_executed_pipeline_execution_arn );
      ( "LastExecutedPipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson
          x.last_executed_pipeline_execution_display_name );
      ( "LastExecutedPipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson
          x.last_executed_pipeline_execution_status );
    ]

let processing_job_to_yojson (x : processing_job) =
  assoc_to_yojson
    [
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingJobName", option_to_yojson processing_job_name_to_yojson x.processing_job_name);
      ("ProcessingResources", option_to_yojson processing_resources_to_yojson x.processing_resources);
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("AppSpecification", option_to_yojson app_specification_to_yojson x.app_specification);
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("ProcessingJobArn", option_to_yojson processing_job_arn_to_yojson x.processing_job_arn);
      ( "ProcessingJobStatus",
        option_to_yojson processing_job_status_to_yojson x.processing_job_status );
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("ProcessingStartTime", option_to_yojson timestamp_to_yojson x.processing_start_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let profiler_config_for_update_to_yojson (x : profiler_config_for_update) =
  assoc_to_yojson
    [
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ( "ProfilingIntervalInMilliseconds",
        option_to_yojson profiling_interval_in_milliseconds_to_yojson
          x.profiling_interval_in_milliseconds );
      ("ProfilingParameters", option_to_yojson profiling_parameters_to_yojson x.profiling_parameters);
      ("DisableProfiler", option_to_yojson disable_profiler_to_yojson x.disable_profiler);
    ]

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
      ("ProjectName", option_to_yojson project_entity_name_to_yojson x.project_name);
      ("ProjectId", option_to_yojson project_id_to_yojson x.project_id);
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ( "ServiceCatalogProvisionedProductDetails",
        option_to_yojson service_catalog_provisioned_product_details_to_yojson
          x.service_catalog_provisioned_product_details );
      ("ProjectStatus", option_to_yojson project_status_to_yojson x.project_status);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "TemplateProviderDetails",
        option_to_yojson template_provider_detail_list_to_yojson x.template_provider_details );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
    ]

let put_model_package_group_policy_output_to_yojson (x : put_model_package_group_policy_output) =
  assoc_to_yojson
    [ ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn)) ]

let put_model_package_group_policy_input_to_yojson (x : put_model_package_group_policy_input) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
      ("ResourcePolicy", Some (policy_string_to_yojson x.resource_policy));
    ]

let query_properties_to_yojson tree = map_to_yojson string256_to_yojson string256_to_yojson tree
let query_lineage_types_to_yojson tree = list_to_yojson lineage_type_to_yojson tree
let string40_to_yojson = string_to_yojson
let query_types_to_yojson tree = list_to_yojson string40_to_yojson tree

let query_filters_to_yojson (x : query_filters) =
  assoc_to_yojson
    [
      ("Types", option_to_yojson query_types_to_yojson x.types);
      ("LineageTypes", option_to_yojson query_lineage_types_to_yojson x.lineage_types);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("ModifiedBefore", option_to_yojson timestamp_to_yojson x.modified_before);
      ("ModifiedAfter", option_to_yojson timestamp_to_yojson x.modified_after);
      ("Properties", option_to_yojson query_properties_to_yojson x.properties);
    ]

let string8192_to_yojson = string_to_yojson

let vertex_to_yojson (x : vertex) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson association_entity_arn_to_yojson x.arn);
      ("Type", option_to_yojson string40_to_yojson x.type_);
      ("LineageType", option_to_yojson lineage_type_to_yojson x.lineage_type);
    ]

let vertices_to_yojson tree = list_to_yojson vertex_to_yojson tree

let query_lineage_response_to_yojson (x : query_lineage_response) =
  assoc_to_yojson
    [
      ("Vertices", option_to_yojson vertices_to_yojson x.vertices);
      ("Edges", option_to_yojson edges_to_yojson x.edges);
      ("NextToken", option_to_yojson string8192_to_yojson x.next_token);
    ]

let query_lineage_max_results_to_yojson = int_to_yojson
let query_lineage_max_depth_to_yojson = int_to_yojson
let query_lineage_start_arns_to_yojson tree = list_to_yojson association_entity_arn_to_yojson tree

let query_lineage_request_to_yojson (x : query_lineage_request) =
  assoc_to_yojson
    [
      ("StartArns", option_to_yojson query_lineage_start_arns_to_yojson x.start_arns);
      ("Direction", option_to_yojson direction_to_yojson x.direction);
      ("IncludeEdges", option_to_yojson boolean__to_yojson x.include_edges);
      ("Filters", option_to_yojson query_filters_to_yojson x.filters);
      ("MaxDepth", option_to_yojson query_lineage_max_depth_to_yojson x.max_depth);
      ("MaxResults", option_to_yojson query_lineage_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string8192_to_yojson x.next_token);
    ]

let register_devices_request_to_yojson (x : register_devices_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("Devices", Some (devices_to_yojson x.devices));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let relation_to_yojson (x : relation) =
  match x with
  | EQUAL_TO -> `String "EqualTo"
  | GREATER_THAN_OR_EQUAL_TO -> `String "GreaterThanOrEqualTo"

let remote_debug_config_for_update_to_yojson (x : remote_debug_config_for_update) =
  assoc_to_yojson
    [ ("EnableRemoteDebug", option_to_yojson enable_remote_debug_to_yojson x.enable_remote_debug) ]

let rendering_error_to_yojson (x : rendering_error) =
  assoc_to_yojson
    [ ("Code", Some (string__to_yojson x.code)); ("Message", Some (string__to_yojson x.message)) ]

let rendering_error_list_to_yojson tree = list_to_yojson rendering_error_to_yojson tree

let render_ui_template_response_to_yojson (x : render_ui_template_response) =
  assoc_to_yojson
    [
      ("RenderedContent", Some (string__to_yojson x.rendered_content));
      ("Errors", Some (rendering_error_list_to_yojson x.errors));
    ]

let task_input_to_yojson = string_to_yojson

let renderable_task_to_yojson (x : renderable_task) =
  assoc_to_yojson [ ("Input", Some (task_input_to_yojson x.input)) ]

let render_ui_template_request_to_yojson (x : render_ui_template_request) =
  assoc_to_yojson
    [
      ("UiTemplate", option_to_yojson ui_template_to_yojson x.ui_template);
      ("Task", Some (renderable_task_to_yojson x.task));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("HumanTaskUiArn", option_to_yojson human_task_ui_arn_to_yojson x.human_task_ui_arn);
    ]

let reserved_capacity_instance_count_to_yojson = int_to_yojson

let reserved_capacity_offering_to_yojson (x : reserved_capacity_offering) =
  assoc_to_yojson
    [
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (reserved_capacity_instance_count_to_yojson x.instance_count));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("ExtensionStartTime", option_to_yojson timestamp_to_yojson x.extension_start_time);
      ("ExtensionEndTime", option_to_yojson timestamp_to_yojson x.extension_end_time);
    ]

let reserved_capacity_offerings_to_yojson tree =
  list_to_yojson reserved_capacity_offering_to_yojson tree

let resource_config_for_update_to_yojson (x : resource_config_for_update) =
  assoc_to_yojson
    [
      ( "KeepAlivePeriodInSeconds",
        Some (keep_alive_period_in_seconds_to_yojson x.keep_alive_period_in_seconds) );
    ]

let resource_identifier_to_yojson = string_to_yojson

let retry_pipeline_execution_response_to_yojson (x : retry_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let retry_pipeline_execution_request_to_yojson (x : retry_pipeline_execution_request) =
  assoc_to_yojson
    [
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
    ]

let update_workteam_response_to_yojson (x : update_workteam_response) =
  assoc_to_yojson [ ("Workteam", Some (workteam_to_yojson x.workteam)) ]

let update_workteam_request_to_yojson (x : update_workteam_request) =
  assoc_to_yojson
    [
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
      ("MemberDefinitions", option_to_yojson member_definitions_to_yojson x.member_definitions);
      ("Description", option_to_yojson string200_to_yojson x.description);
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
    ]

let update_workforce_response_to_yojson (x : update_workforce_response) =
  assoc_to_yojson [ ("Workforce", Some (workforce_to_yojson x.workforce)) ]

let update_workforce_request_to_yojson (x : update_workforce_request) =
  assoc_to_yojson
    [
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("OidcConfig", option_to_yojson oidc_config_to_yojson x.oidc_config);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_request_to_yojson x.workforce_vpc_config );
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
    ]

let update_user_profile_response_to_yojson (x : update_user_profile_response) =
  assoc_to_yojson
    [ ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn) ]

let update_user_profile_request_to_yojson (x : update_user_profile_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
    ]

let update_trial_component_response_to_yojson (x : update_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let update_trial_component_request_to_yojson (x : update_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ( "ParametersToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.parameters_to_remove );
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ( "InputArtifactsToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.input_artifacts_to_remove );
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ( "OutputArtifactsToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.output_artifacts_to_remove );
    ]

let update_trial_response_to_yojson (x : update_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let update_trial_request_to_yojson (x : update_trial_request) =
  assoc_to_yojson
    [
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
    ]

let update_training_job_response_to_yojson (x : update_training_job_response) =
  assoc_to_yojson [ ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn)) ]

let update_training_job_request_to_yojson (x : update_training_job_request) =
  assoc_to_yojson
    [
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ("ProfilerConfig", option_to_yojson profiler_config_for_update_to_yojson x.profiler_config);
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ("ResourceConfig", option_to_yojson resource_config_for_update_to_yojson x.resource_config);
      ( "RemoteDebugConfig",
        option_to_yojson remote_debug_config_for_update_to_yojson x.remote_debug_config );
    ]

let update_space_response_to_yojson (x : update_space_response) =
  assoc_to_yojson [ ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn) ]

let update_space_request_to_yojson (x : update_space_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
    ]

let update_project_output_to_yojson (x : update_project_output) =
  assoc_to_yojson [ ("ProjectArn", Some (project_arn_to_yojson x.project_arn)) ]

let update_template_provider_to_yojson (x : update_template_provider) =
  assoc_to_yojson
    [
      ( "CfnTemplateProvider",
        option_to_yojson cfn_update_template_provider_to_yojson x.cfn_template_provider );
    ]

let update_template_provider_list_to_yojson tree =
  list_to_yojson update_template_provider_to_yojson tree

let service_catalog_provisioning_update_details_to_yojson
    (x : service_catalog_provisioning_update_details) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioning_artifact_id );
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
    ]

let update_project_input_to_yojson (x : update_project_input) =
  assoc_to_yojson
    [
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ( "ServiceCatalogProvisioningUpdateDetails",
        option_to_yojson service_catalog_provisioning_update_details_to_yojson
          x.service_catalog_provisioning_update_details );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TemplateProvidersToUpdate",
        option_to_yojson update_template_provider_list_to_yojson x.template_providers_to_update );
    ]

let update_pipeline_version_response_to_yojson (x : update_pipeline_version_response) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
    ]

let update_pipeline_version_request_to_yojson (x : update_pipeline_version_request) =
  assoc_to_yojson
    [
      ("PipelineArn", Some (pipeline_arn_to_yojson x.pipeline_arn));
      ("PipelineVersionId", Some (pipeline_version_id_to_yojson x.pipeline_version_id));
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
    ]

let update_pipeline_execution_response_to_yojson (x : update_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let update_pipeline_execution_request_to_yojson (x : update_pipeline_execution_request) =
  assoc_to_yojson
    [
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
    ]

let update_pipeline_response_to_yojson (x : update_pipeline_response) =
  assoc_to_yojson
    [
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
    ]

let update_pipeline_request_to_yojson (x : update_pipeline_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ( "PipelineDefinitionS3Location",
        option_to_yojson pipeline_definition_s3_location_to_yojson x.pipeline_definition_s3_location
      );
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
    ]

let update_partner_app_response_to_yojson (x : update_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let update_partner_app_request_to_yojson (x : update_partner_app_request) =
  assoc_to_yojson
    [
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("Tier", option_to_yojson non_empty_string64_to_yojson x.tier);
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ("AppVersion", option_to_yojson major_minor_version_to_yojson x.app_version);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let update_notebook_instance_lifecycle_config_output_to_yojson = unit_to_yojson

let update_notebook_instance_lifecycle_config_input_to_yojson
    (x : update_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
    ]

let update_notebook_instance_output_to_yojson = unit_to_yojson

let update_notebook_instance_input_to_yojson (x : update_notebook_instance_input) =
  assoc_to_yojson
    [
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "LifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson x.lifecycle_config_name
      );
      ( "DisassociateLifecycleConfig",
        option_to_yojson disassociate_notebook_instance_lifecycle_config_to_yojson
          x.disassociate_lifecycle_config );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "DisassociateAcceleratorTypes",
        option_to_yojson disassociate_notebook_instance_accelerator_types_to_yojson
          x.disassociate_accelerator_types );
      ( "DisassociateDefaultCodeRepository",
        option_to_yojson disassociate_default_code_repository_to_yojson
          x.disassociate_default_code_repository );
      ( "DisassociateAdditionalCodeRepositories",
        option_to_yojson disassociate_additional_code_repositories_to_yojson
          x.disassociate_additional_code_repositories );
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
    ]

let update_monitoring_schedule_response_to_yojson (x : update_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let update_monitoring_schedule_request_to_yojson (x : update_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
    ]

let update_monitoring_alert_response_to_yojson (x : update_monitoring_alert_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
      ( "MonitoringAlertName",
        option_to_yojson monitoring_alert_name_to_yojson x.monitoring_alert_name );
    ]

let update_monitoring_alert_request_to_yojson (x : update_monitoring_alert_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
      ("DatapointsToAlert", Some (monitoring_datapoints_to_alert_to_yojson x.datapoints_to_alert));
      ("EvaluationPeriod", Some (monitoring_evaluation_period_to_yojson x.evaluation_period));
    ]

let update_model_package_output_to_yojson (x : update_model_package_output) =
  assoc_to_yojson [ ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn)) ]

let update_model_package_input_to_yojson (x : update_model_package_input) =
  assoc_to_yojson
    [
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ( "CustomerMetadataPropertiesToRemove",
        option_to_yojson customer_metadata_key_list_to_yojson
          x.customer_metadata_properties_to_remove );
      ( "AdditionalInferenceSpecificationsToAdd",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications_to_add );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let update_model_card_response_to_yojson (x : update_model_card_response) =
  assoc_to_yojson [ ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn)) ]

let update_model_card_request_to_yojson (x : update_model_card_request) =
  assoc_to_yojson
    [
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
      ("Content", option_to_yojson model_card_content_to_yojson x.content);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
    ]

let update_mlflow_tracking_server_response_to_yojson (x : update_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let update_mlflow_tracking_server_request_to_yojson (x : update_mlflow_tracking_server_request) =
  assoc_to_yojson
    [
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
    ]

let update_mlflow_app_response_to_yojson (x : update_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let update_mlflow_app_request_to_yojson (x : update_mlflow_app_request) =
  assoc_to_yojson
    [
      ("Arn", Some (mlflow_app_arn_to_yojson x.arn));
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
    ]

let update_inference_experiment_response_to_yojson (x : update_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let update_inference_experiment_request_to_yojson (x : update_inference_experiment_request) =
  assoc_to_yojson
    [
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("ModelVariants", option_to_yojson model_variant_config_list_to_yojson x.model_variants);
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ShadowModeConfig", option_to_yojson shadow_mode_config_to_yojson x.shadow_mode_config);
    ]

let update_inference_component_runtime_config_output_to_yojson
    (x : update_inference_component_runtime_config_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let update_inference_component_runtime_config_input_to_yojson
    (x : update_inference_component_runtime_config_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ( "DesiredRuntimeConfig",
        Some (inference_component_runtime_config_to_yojson x.desired_runtime_config) );
    ]

let update_inference_component_output_to_yojson (x : update_inference_component_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let update_inference_component_input_to_yojson (x : update_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ("Specification", option_to_yojson inference_component_specification_to_yojson x.specification);
      ( "Specifications",
        option_to_yojson inference_component_specification_list_to_yojson x.specifications );
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_to_yojson x.runtime_config );
      ( "DeploymentConfig",
        option_to_yojson inference_component_deployment_config_to_yojson x.deployment_config );
    ]

let update_image_version_response_to_yojson (x : update_image_version_response) =
  assoc_to_yojson
    [ ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn) ]

let update_image_version_request_to_yojson (x : update_image_version_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("AliasesToAdd", option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases_to_add);
      ( "AliasesToDelete",
        option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases_to_delete );
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
    ]

let update_image_response_to_yojson (x : update_image_response) =
  assoc_to_yojson [ ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn) ]

let update_image_request_to_yojson (x : update_image_request) =
  assoc_to_yojson
    [
      ("DeleteProperties", option_to_yojson image_delete_property_list_to_yojson x.delete_properties);
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let update_hub_content_reference_response_to_yojson (x : update_hub_content_reference_response) =
  assoc_to_yojson
    [
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
    ]

let update_hub_content_reference_request_to_yojson (x : update_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
    ]

let update_hub_content_response_to_yojson (x : update_hub_content_response) =
  assoc_to_yojson
    [
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
    ]

let update_hub_content_request_to_yojson (x : update_hub_content_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
    ]

let update_hub_response_to_yojson (x : update_hub_response) =
  assoc_to_yojson [ ("HubArn", Some (hub_arn_to_yojson x.hub_arn)) ]

let update_hub_request_to_yojson (x : update_hub_request) =
  assoc_to_yojson
    [
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
    ]

let update_feature_metadata_request_to_yojson (x : update_feature_metadata_request) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ( "ParameterAdditions",
        option_to_yojson feature_parameter_additions_to_yojson x.parameter_additions );
      ( "ParameterRemovals",
        option_to_yojson feature_parameter_removals_to_yojson x.parameter_removals );
    ]

let update_feature_group_response_to_yojson (x : update_feature_group_response) =
  assoc_to_yojson [ ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn)) ]

let throughput_config_update_to_yojson (x : throughput_config_update) =
  assoc_to_yojson
    [
      ("ThroughputMode", option_to_yojson throughput_mode_to_yojson x.throughput_mode);
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
    ]

let update_feature_group_request_to_yojson (x : update_feature_group_request) =
  assoc_to_yojson
    [
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
      ("FeatureAdditions", option_to_yojson feature_additions_to_yojson x.feature_additions);
      ( "OnlineStoreConfig",
        option_to_yojson online_store_config_update_to_yojson x.online_store_config );
      ("ThroughputConfig", option_to_yojson throughput_config_update_to_yojson x.throughput_config);
    ]

let update_experiment_response_to_yojson (x : update_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let update_experiment_request_to_yojson (x : update_experiment_request) =
  assoc_to_yojson
    [
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
    ]

let update_endpoint_weights_and_capacities_output_to_yojson
    (x : update_endpoint_weights_and_capacities_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let update_endpoint_weights_and_capacities_input_to_yojson
    (x : update_endpoint_weights_and_capacities_input) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ( "DesiredWeightsAndCapacities",
        Some (desired_weight_and_capacity_list_to_yojson x.desired_weights_and_capacities) );
    ]

let update_endpoint_output_to_yojson (x : update_endpoint_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let variant_property_type_to_yojson (x : variant_property_type) =
  match x with
  | DesiredInstanceCount -> `String "DesiredInstanceCount"
  | DesiredWeight -> `String "DesiredWeight"
  | DataCaptureConfig -> `String "DataCaptureConfig"

let variant_property_to_yojson (x : variant_property) =
  assoc_to_yojson
    [ ("VariantPropertyType", Some (variant_property_type_to_yojson x.variant_property_type)) ]

let variant_property_list_to_yojson tree = list_to_yojson variant_property_to_yojson tree

let update_endpoint_input_to_yojson (x : update_endpoint_input) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ( "RetainAllVariantProperties",
        option_to_yojson boolean__to_yojson x.retain_all_variant_properties );
      ( "ExcludeRetainedVariantProperties",
        option_to_yojson variant_property_list_to_yojson x.exclude_retained_variant_properties );
      ("DeploymentConfig", option_to_yojson deployment_config_to_yojson x.deployment_config);
      ("RetainDeploymentConfig", option_to_yojson boolean__to_yojson x.retain_deployment_config);
    ]

let update_domain_response_to_yojson (x : update_domain_response) =
  assoc_to_yojson [ ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn) ]

let update_domain_request_to_yojson (x : update_domain_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("DefaultUserSettings", option_to_yojson user_settings_to_yojson x.default_user_settings);
      ( "DomainSettingsForUpdate",
        option_to_yojson domain_settings_for_update_to_yojson x.domain_settings_for_update );
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
    ]

let update_devices_request_to_yojson (x : update_devices_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("Devices", Some (devices_to_yojson x.devices));
    ]

let update_device_fleet_request_to_yojson (x : update_device_fleet_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ( "EnableIotRoleAlias",
        option_to_yojson enable_iot_role_alias_to_yojson x.enable_iot_role_alias );
    ]

let update_context_response_to_yojson (x : update_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let update_context_request_to_yojson (x : update_context_request) =
  assoc_to_yojson
    [
      ("ContextName", Some (context_name_to_yojson x.context_name));
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
    ]

let update_compute_quota_response_to_yojson (x : update_compute_quota_response) =
  assoc_to_yojson
    [
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
      ("ComputeQuotaVersion", Some (integer_to_yojson x.compute_quota_version));
    ]

let update_compute_quota_request_to_yojson (x : update_compute_quota_request) =
  assoc_to_yojson
    [
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("TargetVersion", Some (integer_to_yojson x.target_version));
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("ComputeQuotaTarget", option_to_yojson compute_quota_target_to_yojson x.compute_quota_target);
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
    ]

let update_code_repository_output_to_yojson (x : update_code_repository_output) =
  assoc_to_yojson
    [ ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn)) ]

let update_code_repository_input_to_yojson (x : update_code_repository_input) =
  assoc_to_yojson
    [
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
      ("GitConfig", option_to_yojson git_config_for_update_to_yojson x.git_config);
    ]

let update_cluster_software_response_to_yojson (x : update_cluster_software_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let update_cluster_software_instance_group_specification_to_yojson
    (x : update_cluster_software_instance_group_specification) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ( "ImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.image_release_version );
    ]

let update_cluster_software_instance_groups_to_yojson tree =
  list_to_yojson update_cluster_software_instance_group_specification_to_yojson tree

let update_cluster_software_request_to_yojson (x : update_cluster_software_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ( "InstanceGroups",
        option_to_yojson update_cluster_software_instance_groups_to_yojson x.instance_groups );
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
    ]

let update_cluster_scheduler_config_response_to_yojson
    (x : update_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
      ("ClusterSchedulerConfigVersion", Some (integer_to_yojson x.cluster_scheduler_config_version));
    ]

let update_cluster_scheduler_config_request_to_yojson (x : update_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ("TargetVersion", Some (integer_to_yojson x.target_version));
      ("SchedulerConfig", option_to_yojson scheduler_config_to_yojson x.scheduler_config);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ( "InstanceGroups",
        option_to_yojson cluster_instance_group_specifications_to_yojson x.instance_groups );
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_specifications_to_yojson
          x.restricted_instance_groups );
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_to_yojson
          x.restricted_instance_groups_config );
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ( "InstanceGroupsToDelete",
        option_to_yojson cluster_instance_groups_to_delete_to_yojson x.instance_groups_to_delete );
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_to_yojson x.auto_scaling);
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
    ]

let update_artifact_response_to_yojson (x : update_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let update_artifact_request_to_yojson (x : update_artifact_request) =
  assoc_to_yojson
    [
      ("ArtifactArn", Some (artifact_arn_to_yojson x.artifact_arn));
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
      ("Properties", option_to_yojson artifact_properties_to_yojson x.properties);
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
    ]

let update_app_image_config_response_to_yojson (x : update_app_image_config_response) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let update_app_image_config_request_to_yojson (x : update_app_image_config_request) =
  assoc_to_yojson
    [
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
    ]

let update_action_response_to_yojson (x : update_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let update_action_request_to_yojson (x : update_action_request) =
  assoc_to_yojson
    [
      ("ActionName", Some (experiment_entity_name_to_yojson x.action_name));
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
    ]

let stop_transform_job_request_to_yojson (x : stop_transform_job_request) =
  assoc_to_yojson [ ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name)) ]

let stop_training_job_request_to_yojson (x : stop_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let stop_processing_job_request_to_yojson (x : stop_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let stop_pipeline_execution_response_to_yojson (x : stop_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let stop_pipeline_execution_request_to_yojson (x : stop_pipeline_execution_request) =
  assoc_to_yojson
    [
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
    ]

let stop_optimization_job_request_to_yojson (x : stop_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let stop_notebook_instance_input_to_yojson (x : stop_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let stop_monitoring_schedule_request_to_yojson (x : stop_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let stop_mlflow_tracking_server_response_to_yojson (x : stop_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let stop_mlflow_tracking_server_request_to_yojson (x : stop_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let stop_labeling_job_request_to_yojson (x : stop_labeling_job_request) =
  assoc_to_yojson [ ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name)) ]

let stop_job_response_to_yojson = unit_to_yojson

let stop_job_request_to_yojson (x : stop_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let stop_inference_recommendations_job_request_to_yojson
    (x : stop_inference_recommendations_job_request) =
  assoc_to_yojson [ ("JobName", Some (recommendation_job_name_to_yojson x.job_name)) ]

let stop_inference_experiment_response_to_yojson (x : stop_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let stop_inference_experiment_request_to_yojson (x : stop_inference_experiment_request) =
  assoc_to_yojson
    [
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("ModelVariantActions", Some (model_variant_action_map_to_yojson x.model_variant_actions));
      ( "DesiredModelVariants",
        option_to_yojson model_variant_config_list_to_yojson x.desired_model_variants );
      ( "DesiredState",
        option_to_yojson inference_experiment_stop_desired_state_to_yojson x.desired_state );
      ("Reason", option_to_yojson inference_experiment_status_reason_to_yojson x.reason);
    ]

let stop_hyper_parameter_tuning_job_request_to_yojson (x : stop_hyper_parameter_tuning_job_request)
    =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let stop_edge_packaging_job_request_to_yojson (x : stop_edge_packaging_job_request) =
  assoc_to_yojson
    [ ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name)) ]

let stop_edge_deployment_stage_request_to_yojson (x : stop_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let stop_compilation_job_request_to_yojson (x : stop_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let stop_auto_ml_job_request_to_yojson (x : stop_auto_ml_job_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let stop_ai_recommendation_job_response_to_yojson (x : stop_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
    ]

let stop_ai_recommendation_job_request_to_yojson (x : stop_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let stop_ai_benchmark_job_response_to_yojson (x : stop_ai_benchmark_job_response) =
  assoc_to_yojson
    [ ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn)) ]

let stop_ai_benchmark_job_request_to_yojson (x : stop_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let token_value_to_yojson = string_to_yojson
let stream_url_to_yojson = string_to_yojson
let session_id_to_yojson = string_to_yojson

let start_session_response_to_yojson (x : start_session_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("StreamUrl", option_to_yojson stream_url_to_yojson x.stream_url);
      ("TokenValue", option_to_yojson token_value_to_yojson x.token_value);
    ]

let start_session_request_to_yojson (x : start_session_request) =
  assoc_to_yojson
    [ ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier)) ]

let start_pipeline_execution_response_to_yojson (x : start_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let start_pipeline_execution_request_to_yojson (x : start_pipeline_execution_request) =
  assoc_to_yojson
    [
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_entity_name_to_yojson x.mlflow_experiment_name );
    ]

let start_notebook_instance_input_to_yojson (x : start_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let start_monitoring_schedule_request_to_yojson (x : start_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let start_mlflow_tracking_server_response_to_yojson (x : start_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let start_mlflow_tracking_server_request_to_yojson (x : start_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let start_inference_experiment_response_to_yojson (x : start_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let start_inference_experiment_request_to_yojson (x : start_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let start_edge_deployment_stage_request_to_yojson (x : start_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let start_cluster_health_check_response_to_yojson (x : start_cluster_health_check_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let start_cluster_health_check_request_to_yojson (x : start_cluster_health_check_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ( "DeepHealthCheckConfigurations",
        Some (deep_health_check_configurations_to_yojson x.deep_health_check_configurations) );
    ]

let send_pipeline_execution_step_success_response_to_yojson
    (x : send_pipeline_execution_step_success_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let send_pipeline_execution_step_success_request_to_yojson
    (x : send_pipeline_execution_step_success_request) =
  assoc_to_yojson
    [
      ("CallbackToken", Some (callback_token_to_yojson x.callback_token));
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let send_pipeline_execution_step_failure_response_to_yojson
    (x : send_pipeline_execution_step_failure_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let send_pipeline_execution_step_failure_request_to_yojson
    (x : send_pipeline_execution_step_failure_request) =
  assoc_to_yojson
    [
      ("CallbackToken", Some (callback_token_to_yojson x.callback_token));
      ("FailureReason", option_to_yojson string256_to_yojson x.failure_reason);
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let training_plan_extension_offering_to_yojson (x : training_plan_extension_offering) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
      ("AvailabilityZone", option_to_yojson string256_to_yojson x.availability_zone);
      ("StartDate", option_to_yojson timestamp_to_yojson x.start_date);
      ("EndDate", option_to_yojson timestamp_to_yojson x.end_date);
      ( "DurationHours",
        option_to_yojson training_plan_extension_duration_hours_to_yojson x.duration_hours );
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let training_plan_extension_offerings_to_yojson tree =
  list_to_yojson training_plan_extension_offering_to_yojson tree

let training_plan_offering_to_yojson (x : training_plan_offering) =
  assoc_to_yojson
    [
      ( "TrainingPlanOfferingId",
        Some (training_plan_offering_id_to_yojson x.training_plan_offering_id) );
      ("TargetResources", Some (sage_maker_resource_names_to_yojson x.target_resources));
      ("RequestedStartTimeAfter", option_to_yojson timestamp_to_yojson x.requested_start_time_after);
      ("RequestedEndTimeBefore", option_to_yojson timestamp_to_yojson x.requested_end_time_before);
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "ReservedCapacityOfferings",
        option_to_yojson reserved_capacity_offerings_to_yojson x.reserved_capacity_offerings );
    ]

let training_plan_offerings_to_yojson tree = list_to_yojson training_plan_offering_to_yojson tree

let search_training_plan_offerings_response_to_yojson (x : search_training_plan_offerings_response)
    =
  assoc_to_yojson
    [
      ("TrainingPlanOfferings", Some (training_plan_offerings_to_yojson x.training_plan_offerings));
      ( "TrainingPlanExtensionOfferings",
        option_to_yojson training_plan_extension_offerings_to_yojson
          x.training_plan_extension_offerings );
    ]

let training_plan_duration_hours_input_to_yojson = long_to_yojson

let search_training_plan_offerings_request_to_yojson (x : search_training_plan_offerings_request) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson reserved_capacity_instance_type_to_yojson x.instance_type);
      ("InstanceCount", option_to_yojson reserved_capacity_instance_count_to_yojson x.instance_count);
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("StartTimeAfter", option_to_yojson timestamp_to_yojson x.start_time_after);
      ("EndTimeBefore", option_to_yojson timestamp_to_yojson x.end_time_before);
      ( "DurationHours",
        option_to_yojson training_plan_duration_hours_input_to_yojson x.duration_hours );
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ("TrainingPlanArn", option_to_yojson string__to_yojson x.training_plan_arn);
    ]

let total_hits_to_yojson (x : total_hits) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson long_to_yojson x.value);
      ("Relation", option_to_yojson relation_to_yojson x.relation);
    ]

let training_job_to_yojson (x : training_job) =
  assoc_to_yojson
    [
      ("TrainingJobName", option_to_yojson training_job_name_to_yojson x.training_job_name);
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
      ("TuningJobArn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.tuning_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("ModelArtifacts", option_to_yojson model_artifacts_to_yojson x.model_artifacts);
      ("TrainingJobStatus", option_to_yojson training_job_status_to_yojson x.training_job_status);
      ("SecondaryStatus", option_to_yojson secondary_status_to_yojson x.secondary_status);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("StoppingCondition", option_to_yojson stopping_condition_to_yojson x.stopping_condition);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "SecondaryStatusTransitions",
        option_to_yojson secondary_status_transitions_to_yojson x.secondary_status_transitions );
      ( "FinalMetricDataList",
        option_to_yojson final_metric_data_list_to_yojson x.final_metric_data_list );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "TrainingTimeInSeconds",
        option_to_yojson training_time_in_seconds_to_yojson x.training_time_in_seconds );
      ( "BillableTimeInSeconds",
        option_to_yojson billable_time_in_seconds_to_yojson x.billable_time_in_seconds );
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ( "DebugRuleEvaluationStatuses",
        option_to_yojson debug_rule_evaluation_statuses_to_yojson x.debug_rule_evaluation_statuses
      );
      ( "OutputModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.output_model_package_arn );
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let trial_component_source_detail_to_yojson (x : trial_component_source_detail) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson trial_component_source_arn_to_yojson x.source_arn);
      ("TrainingJob", option_to_yojson training_job_to_yojson x.training_job);
      ("ProcessingJob", option_to_yojson processing_job_to_yojson x.processing_job);
      ("TransformJob", option_to_yojson transform_job_to_yojson x.transform_job);
    ]

let trial_component_to_yojson (x : trial_component) =
  assoc_to_yojson
    [
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("Source", option_to_yojson trial_component_source_to_yojson x.source);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("Metrics", option_to_yojson trial_component_metric_summaries_to_yojson x.metrics);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("SourceDetail", option_to_yojson trial_component_source_detail_to_yojson x.source_detail);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Parents", option_to_yojson parents_to_yojson x.parents);
      ("RunName", option_to_yojson experiment_entity_name_to_yojson x.run_name);
    ]

let trial_component_simple_summary_to_yojson (x : trial_component_simple_summary) =
  assoc_to_yojson
    [
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ( "TrialComponentSource",
        option_to_yojson trial_component_source_to_yojson x.trial_component_source );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
    ]

let trial_component_simple_summaries_to_yojson tree =
  list_to_yojson trial_component_simple_summary_to_yojson tree

let trial_to_yojson (x : trial) =
  assoc_to_yojson
    [
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("Source", option_to_yojson trial_source_to_yojson x.source);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TrialComponentSummaries",
        option_to_yojson trial_component_simple_summaries_to_yojson x.trial_component_summaries );
    ]

let search_record_to_yojson (x : search_record) =
  assoc_to_yojson
    [
      ("TrainingJob", option_to_yojson training_job_to_yojson x.training_job);
      ("Experiment", option_to_yojson experiment_to_yojson x.experiment);
      ("Trial", option_to_yojson trial_to_yojson x.trial);
      ("TrialComponent", option_to_yojson trial_component_to_yojson x.trial_component);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ("ModelPackage", option_to_yojson model_package_to_yojson x.model_package);
      ("ModelPackageGroup", option_to_yojson model_package_group_to_yojson x.model_package_group);
      ("Pipeline", option_to_yojson pipeline_to_yojson x.pipeline);
      ("PipelineExecution", option_to_yojson pipeline_execution_to_yojson x.pipeline_execution);
      ("PipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("FeatureGroup", option_to_yojson feature_group_to_yojson x.feature_group);
      ("FeatureMetadata", option_to_yojson feature_metadata_to_yojson x.feature_metadata);
      ("Project", option_to_yojson project_to_yojson x.project);
      ( "HyperParameterTuningJob",
        option_to_yojson hyper_parameter_tuning_job_search_entity_to_yojson
          x.hyper_parameter_tuning_job );
      ("ModelCard", option_to_yojson model_card_to_yojson x.model_card);
      ("Model", option_to_yojson model_dashboard_model_to_yojson x.model);
      ("Job", option_to_yojson job_to_yojson x.job);
    ]

let search_results_list_to_yojson tree = list_to_yojson search_record_to_yojson tree

let search_response_to_yojson (x : search_response) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson search_results_list_to_yojson x.results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TotalHits", option_to_yojson total_hits_to_yojson x.total_hits);
    ]

let visibility_conditions_value_to_yojson = string_to_yojson
let visibility_conditions_key_to_yojson = string_to_yojson

let visibility_conditions_to_yojson (x : visibility_conditions) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson visibility_conditions_key_to_yojson x.key);
      ("Value", option_to_yojson visibility_conditions_value_to_yojson x.value);
    ]

let visibility_conditions_list_to_yojson tree = list_to_yojson visibility_conditions_to_yojson tree

let search_sort_order_to_yojson (x : search_sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let rec search_expression_list_to_yojson tree = list_to_yojson search_expression_to_yojson tree

and search_expression_to_yojson (x : search_expression) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NestedFilters", option_to_yojson nested_filters_list_to_yojson x.nested_filters);
      ("SubExpressions", option_to_yojson search_expression_list_to_yojson x.sub_expressions);
      ("Operator", option_to_yojson boolean_operator_to_yojson x.operator);
    ]

let search_request_to_yojson (x : search_request) =
  assoc_to_yojson
    [
      ("Resource", Some (resource_type_to_yojson x.resource));
      ("SearchExpression", option_to_yojson search_expression_to_yojson x.search_expression);
      ("SortBy", option_to_yojson resource_property_name_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson search_sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "CrossAccountFilterOption",
        option_to_yojson cross_account_filter_option_to_yojson x.cross_account_filter_option );
      ( "VisibilityConditions",
        option_to_yojson visibility_conditions_list_to_yojson x.visibility_conditions );
    ]
