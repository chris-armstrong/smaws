open Types

module Search : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_request ->
    (search_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_request ->
    ( search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Finds SageMaker resources that match a search query. Matching resources are returned as a list \
   of [SearchRecord] objects in the response. You can sort the search results by any resource \
   property in a ascending or descending order.\n\n\
  \ You can query against the following value types: numeric, text, Boolean, and timestamp.\n\
  \ \n\
  \   The Search API may provide access to otherwise restricted data. See \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/api-permissions-reference.html}Amazon \
   SageMaker API Permissions: Actions, Permissions, and Resources Reference} for more information.\n\
  \   \n\
  \    "]

module SearchTrainingPlanOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_training_plan_offerings_request ->
    ( search_training_plan_offerings_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_training_plan_offerings_request ->
    ( search_training_plan_offerings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for available training plan offerings based on specified criteria. \n\n\
  \ {ul\n\
  \       {-  Users search for available plan offerings based on their requirements (e.g., \
   instance type, count, start time, duration). \n\
  \           \n\
  \            }\n\
  \       {-  And then, they create a plan that best matches their needs using the ID of the plan \
   offering they want to use. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For more information about how to reserve GPU capacity for your SageMaker training jobs or \
   SageMaker HyperPod clusters using Amazon SageMaker Training Plan , see \n\
  \   {[\n\
  \    \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateTrainingPlan.html}CreateTrainingPlan} \n\
  \   ]}\n\
  \   .\n\
  \   "]

module SendPipelineExecutionStepFailure : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_pipeline_execution_step_failure_request ->
    ( send_pipeline_execution_step_failure_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_pipeline_execution_step_failure_request ->
    ( send_pipeline_execution_step_failure_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Notifies the pipeline that the execution of a callback step failed, along with a message \
   describing why. When a callback step is run, the pipeline generates a callback token and \
   includes the token in a message sent to Amazon Simple Queue Service (Amazon SQS).\n"]

module SendPipelineExecutionStepSuccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_pipeline_execution_step_success_request ->
    ( send_pipeline_execution_step_success_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_pipeline_execution_step_success_request ->
    ( send_pipeline_execution_step_success_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Notifies the pipeline that the execution of a callback step succeeded and provides a list of \
   the step's output parameters. When a callback step is run, the pipeline generates a callback \
   token and includes the token in a message sent to Amazon Simple Queue Service (Amazon SQS).\n"]

module StartClusterHealthCheck : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_cluster_health_check_request ->
    ( start_cluster_health_check_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_cluster_health_check_request ->
    ( start_cluster_health_check_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Start deep health checks for a SageMaker HyperPod cluster. You can use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeClusterNode.html}DescribeClusterNode} \
   API to track progress of the deep health checks. The unhealthy nodes will be automatically \
   rebooted or replaced. Please see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-eks-resiliency-node-labels.html} \
   Resilience-related Kubernetes labels by SageMaker HyperPod} for details.\n"]

module StartEdgeDeploymentStage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_edge_deployment_stage_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a stage in an edge deployment plan.\n"]

module StartInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_inference_experiment_request ->
    ( start_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_inference_experiment_request ->
    ( start_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts an inference experiment.\n"]

module StartMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_mlflow_tracking_server_request ->
    ( start_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_mlflow_tracking_server_request ->
    ( start_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Programmatically start an MLflow Tracking Server.\n"]

module StartMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a previously stopped monitoring schedule.\n\n\
  \  By default, when you successfully create a new schedule, the status of a monitoring schedule \
   is [scheduled].\n\
  \  \n\
  \   "]

module StartNotebookInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Launches an ML compute instance with the latest version of the libraries and attaches your ML \
   storage volume. After configuring the notebook instance, SageMaker AI sets the notebook \
   instance status to [InService]. A notebook instance's status must be [InService] before you can \
   connect to your Jupyter notebook. \n"]

module StartPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_request ->
    ( start_pipeline_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_request ->
    ( start_pipeline_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a pipeline execution.\n"]

module StartSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a remote connection session between a local integrated development environments \
   (IDEs) and a remote SageMaker space.\n"]

module StopAIBenchmarkJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_ai_benchmark_job_request ->
    ( stop_ai_benchmark_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_ai_benchmark_job_request ->
    ( stop_ai_benchmark_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a running AI benchmark job.\n"]

module StopAIRecommendationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_ai_recommendation_job_request ->
    ( stop_ai_recommendation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_ai_recommendation_job_request ->
    ( stop_ai_recommendation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a running AI recommendation job.\n"]

module StopAutoMLJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_auto_ml_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_auto_ml_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A method for forcing a running job to shut down.\n"]

module StopCompilationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_compilation_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_compilation_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a model compilation job.\n\n\
  \  To stop a job, Amazon SageMaker AI sends the algorithm the SIGTERM signal. This gracefully \
   shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.\n\
  \ \n\
  \  When it receives a [StopCompilationJob] request, Amazon SageMaker AI changes the \
   [CompilationJobStatus] of the job to [Stopping]. After Amazon SageMaker stops the job, it sets \
   the [CompilationJobStatus] to [Stopped]. \n\
  \  "]

module StopEdgeDeploymentStage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_edge_deployment_stage_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a stage in an edge deployment plan.\n"]

module StopEdgePackagingJob : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_edge_packaging_job_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_edge_packaging_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Request to stop an edge packaging job.\n"]

module StopHyperParameterTuningJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_hyper_parameter_tuning_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_hyper_parameter_tuning_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a running hyperparameter tuning job and all running training jobs that the tuning job \
   launched.\n\n\
  \ All model artifacts output from the training jobs are stored in Amazon Simple Storage Service \
   (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still \
   available in CloudWatch. After the tuning job moves to the [Stopped] state, it releases all \
   reserved resources for the tuning job.\n\
  \ "]

module StopInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_inference_experiment_request ->
    ( stop_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_inference_experiment_request ->
    ( stop_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an inference experiment.\n"]

module StopInferenceRecommendationsJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_inference_recommendations_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_inference_recommendations_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an Inference Recommender job.\n"]

module StopJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a running job. When you call [StopJob], Amazon SageMaker sets the job status to \
   [Stopping]. After the job stops, the status changes to [Stopped]. Partial results may be \
   available in the output location if the job was in progress. To delete a stopped job, call \
   [DeleteJob].\n\n\
  \ The following operations are related to [StopJob]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        {-   [DescribeJob] \n\
  \            \n\
  \             }\n\
  \        {-   [DeleteJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module StopLabelingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_labeling_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_labeling_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained \
   before the job is stopped are placed in the Amazon S3 output bucket.\n"]

module StopMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_mlflow_tracking_server_request ->
    ( stop_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_mlflow_tracking_server_request ->
    ( stop_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Programmatically stop an MLflow Tracking Server.\n"]

module StopMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a previously started monitoring schedule.\n"]

module StopNotebookInstance : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_instance_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the ML compute instance. Before terminating the instance, SageMaker AI disconnects \
   the ML storage volume from it. SageMaker AI preserves the ML storage volume. SageMaker AI stops \
   charging you for the ML compute instance when you call [StopNotebookInstance].\n\n\
  \ To access data on the ML storage volume for a notebook instance that has been terminated, call \
   the [StartNotebookInstance] API. [StartNotebookInstance] launches another ML compute instance, \
   configures it, and attaches the preserved ML storage volume so you can continue your work. \n\
  \ "]

module StopOptimizationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_optimization_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_optimization_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Ends a running inference optimization job.\n"]

module StopPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_request ->
    ( stop_pipeline_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_request ->
    ( stop_pipeline_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a pipeline execution.\n\n\
  \  {b Callback Step} \n\
  \ \n\
  \  A pipeline execution won't stop while a callback step is running. When you call \
   [StopPipelineExecution] on a pipeline execution with a running callback step, SageMaker \
   Pipelines sends an additional Amazon SQS message to the specified SQS queue. The body of the \
   SQS message contains a \"Status\" field which is set to \"Stopping\".\n\
  \  \n\
  \   You should add logic to your Amazon SQS message consumer to take any needed action (for \
   example, resource cleanup) upon receipt of the message followed by a call to \
   [SendPipelineExecutionStepSuccess] or [SendPipelineExecutionStepFailure].\n\
  \   \n\
  \    Only when SageMaker Pipelines receives one of these calls will it stop the pipeline \
   execution.\n\
  \    \n\
  \      {b Lambda Step} \n\
  \     \n\
  \      A pipeline execution can't be stopped while a lambda step is running because the Lambda \
   function invoked by the lambda step can't be stopped. If you attempt to stop the execution \
   while the Lambda function is running, the pipeline waits for the Lambda function to finish or \
   until the timeout is hit, whichever occurs first, and then stops. If the Lambda function \
   finishes, the pipeline execution status is [Stopped]. If the timeout is hit the pipeline \
   execution status is [Failed].\n\
  \      "]

module StopProcessingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_processing_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_processing_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a processing job.\n"]

module StopTrainingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_training_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_training_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a training job. To stop a job, SageMaker sends the algorithm the [SIGTERM] signal, which \
   delays job termination for 120 seconds. Algorithms might use this 120-second window to save the \
   model artifacts, so the results of the training is not lost. \n\n\
  \ When it receives a [StopTrainingJob] request, SageMaker changes the status of the job to \
   [Stopping]. After SageMaker stops the job, it sets the status to [Stopped].\n\
  \ "]

module StopTransformJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_transform_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_transform_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a batch transform job.\n\n\
  \ When Amazon SageMaker receives a [StopTransformJob] request, the status of the job changes to \
   [Stopping]. After Amazon SageMaker stops the job, the status is set to [Stopped]. When you stop \
   a batch transform job before it is completed, Amazon SageMaker doesn't store the job's output \
   in Amazon S3.\n\
  \ "]

module UpdateAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_action_request ->
    ( update_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_action_request ->
    ( update_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an action.\n"]

module UpdateAppImageConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_app_image_config_request ->
    ( update_app_image_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_app_image_config_request ->
    ( update_app_image_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of an AppImageConfig.\n"]

module UpdateArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_artifact_request ->
    ( update_artifact_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_artifact_request ->
    ( update_artifact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an artifact.\n"]

module UpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a SageMaker HyperPod cluster.\n"]

module UpdateClusterSchedulerConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_scheduler_config_request ->
    ( update_cluster_scheduler_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_scheduler_config_request ->
    ( update_cluster_scheduler_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the cluster policy configuration.\n"]

module UpdateClusterSoftware : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_software_request ->
    ( update_cluster_software_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_software_request ->
    ( update_cluster_software_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the platform software of a SageMaker HyperPod cluster for security patching. To learn \
   how to use this API, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-operate.html#sagemaker-hyperpod-operate-cli-command-update-cluster-software}Update \
   the SageMaker HyperPod platform software of a cluster}.\n\n\
  \  The [UpgradeClusterSoftware] API call may impact your SageMaker HyperPod cluster uptime and \
   availability. Plan accordingly to mitigate potential disruptions to your workloads.\n\
  \  \n\
  \   "]

module UpdateCodeRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_code_repository_input ->
    ( update_code_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_code_repository_input ->
    ( update_code_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified Git repository with the specified values.\n"]

module UpdateComputeQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_compute_quota_request ->
    ( update_compute_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_compute_quota_request ->
    ( update_compute_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the compute allocation definition.\n"]

module UpdateContext : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_context_request ->
    ( update_context_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_context_request ->
    ( update_context_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a context.\n"]

module UpdateDeviceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a fleet of devices.\n"]

module UpdateDevices : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_devices_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_devices_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates one or more devices in a fleet.\n"]

module UpdateDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_request ->
    ( update_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_request ->
    ( update_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the default settings for new user profiles in the domain.\n"]

module UpdateEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_input ->
    ( update_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_input ->
    ( update_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deploys the [EndpointConfig] specified in the request to a new fleet of instances. SageMaker \
   shifts endpoint traffic to the new instances with the updated endpoint configuration and then \
   deletes the old instances using the previous [EndpointConfig] (there is no availability loss). \
   For more information about how to control the update and traffic shifting process, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/deployment-guardrails.html} Update models in \
   production}.\n\n\
  \ When SageMaker receives the request, it sets the endpoint status to [Updating]. After updating \
   the endpoint, it sets the status to [InService]. To check the status of an endpoint, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeEndpoint.html}DescribeEndpoint} \
   API. \n\
  \ \n\
  \   You must not delete an [EndpointConfig] in use by an endpoint that is live or while the \
   [UpdateEndpoint] or [CreateEndpoint] operations are being performed on the endpoint. To update \
   an endpoint, you must create a new [EndpointConfig].\n\
  \   \n\
  \    If you delete the [EndpointConfig] of an endpoint that is active or being created or \
   updated you may lose visibility into the instance type the endpoint is using. The endpoint must \
   be deleted in order to stop incurring charges.\n\
  \    \n\
  \     "]

module UpdateEndpointWeightsAndCapacities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_weights_and_capacities_input ->
    ( update_endpoint_weights_and_capacities_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_weights_and_capacities_input ->
    ( update_endpoint_weights_and_capacities_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates variant weight of one or more variants associated with an existing endpoint, or \
   capacity of one variant associated with an existing endpoint. When it receives the request, \
   SageMaker sets the endpoint status to [Updating]. After updating the endpoint, it sets the \
   status to [InService]. To check the status of an endpoint, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeEndpoint.html}DescribeEndpoint} \
   API. \n"]

module UpdateExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_experiment_request ->
    ( update_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_experiment_request ->
    ( update_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds, updates, or removes the description of an experiment. Updates the display name of an \
   experiment.\n"]

module UpdateFeatureGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_feature_group_request ->
    ( update_feature_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_feature_group_request ->
    ( update_feature_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the feature group by either adding features or updating the online store configuration. \
   Use one of the following request parameters at a time while using the [UpdateFeatureGroup] \
   API.\n\n\
  \ You can add features for your feature group using the [FeatureAdditions] request parameter. \
   Features cannot be removed from a feature group.\n\
  \ \n\
  \  You can update the online store configuration by using the [OnlineStoreConfig] request \
   parameter. If a [TtlDuration] is specified, the default [TtlDuration] applies for all records \
   added to the feature group {i after the feature group is updated}. If a record level \
   [TtlDuration] exists from using the [PutRecord] API, the record level [TtlDuration] applies to \
   that record instead of the default [TtlDuration]. To remove the default [TtlDuration] from an \
   existing feature group, use the [UpdateFeatureGroup] API and set the [TtlDuration] [Unit] and \
   [Value] to [null].\n\
  \  "]

module UpdateFeatureMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_feature_metadata_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_feature_metadata_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the description and parameters of the feature group.\n"]

module UpdateHub : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hub_request ->
    ( update_hub_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hub_request ->
    ( update_hub_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a hub.\n"]

module UpdateHubContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hub_content_request ->
    ( update_hub_content_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hub_content_request ->
    ( update_hub_content_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates SageMaker hub content (either a [Model] or [Notebook] resource).\n\n\
  \ You can update the metadata that describes the resource. In addition to the required request \
   fields, specify at least one of the following fields to update:\n\
  \ \n\
  \  {ul\n\
  \        {-   [HubContentDescription] \n\
  \            \n\
  \             }\n\
  \        {-   [HubContentDisplayName] \n\
  \            \n\
  \             }\n\
  \        {-   [HubContentMarkdown] \n\
  \            \n\
  \             }\n\
  \        {-   [HubContentSearchKeywords] \n\
  \            \n\
  \             }\n\
  \        {-   [SupportStatus] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about hubs, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/jumpstart-curated-hubs.html}Private curated \
   hubs for foundation model access control in JumpStart}.\n\
  \   \n\
  \     If you want to update a [ModelReference] resource in your hub, use the \
   [UpdateHubContentResource] API instead.\n\
  \     \n\
  \      "]

module UpdateHubContentReference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hub_content_reference_request ->
    ( update_hub_content_reference_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hub_content_reference_request ->
    ( update_hub_content_reference_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the contents of a SageMaker hub for a [ModelReference] resource. A [ModelReference] \
   allows you to access public SageMaker JumpStart models from within your private hub.\n\n\
  \ When using this API, you can update the [MinVersion] field for additional flexibility in the \
   model version. You shouldn't update any additional fields when using this API, because the \
   metadata in your private hub should match the public JumpStart model's metadata.\n\
  \ \n\
  \   If you want to update a [Model] or [Notebook] resource in your hub, use the \
   [UpdateHubContent] API instead.\n\
  \   \n\
  \     For more information about adding model references to your hub, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/jumpstart-curated-hubs-admin-guide-add-models.html} \
   Add models to a private hub}.\n\
  \     "]

module UpdateImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_image_request ->
    ( update_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_image_request ->
    ( update_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the properties of a SageMaker AI image. To change the image's tags, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_AddTags.html}AddTags} and \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteTags.html}DeleteTags} \
   APIs.\n"]

module UpdateImageVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_image_version_request ->
    ( update_image_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_image_version_request ->
    ( update_image_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of a SageMaker AI image version.\n"]

module UpdateInferenceComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_inference_component_input ->
    ( update_inference_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_inference_component_input ->
    ( update_inference_component_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an inference component.\n"]

module UpdateInferenceComponentRuntimeConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_inference_component_runtime_config_input ->
    ( update_inference_component_runtime_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_inference_component_runtime_config_input ->
    ( update_inference_component_runtime_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Runtime settings for a model that is deployed with an inference component.\n"]

module UpdateInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_inference_experiment_request ->
    ( update_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_inference_experiment_request ->
    ( update_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates an inference experiment that you created. The status of the inference experiment has \
   to be either [Created], [Running]. For more information on the status of an inference \
   experiment, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeInferenceExperiment.html}DescribeInferenceExperiment}. \n"]

module UpdateMlflowApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_mlflow_app_request ->
    ( update_mlflow_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_mlflow_app_request ->
    ( update_mlflow_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an MLflow App.\n"]

module UpdateMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_mlflow_tracking_server_request ->
    ( update_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_mlflow_tracking_server_request ->
    ( update_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates properties of an existing MLflow Tracking Server.\n"]

module UpdateModelCard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_model_card_request ->
    ( update_model_card_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_model_card_request ->
    ( update_model_card_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update an Amazon SageMaker Model Card.\n\n\
  \  You cannot update both model card content and model card status in a single call.\n\
  \  \n\
  \   "]

module UpdateModelPackage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_model_package_input ->
    ( update_model_package_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_model_package_input ->
    ( update_model_package_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a versioned model.\n"]

module UpdateMonitoringAlert : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_monitoring_alert_request ->
    ( update_monitoring_alert_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_monitoring_alert_request ->
    ( update_monitoring_alert_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the parameters of a model monitor alert.\n"]

module UpdateMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_monitoring_schedule_request ->
    ( update_monitoring_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_monitoring_schedule_request ->
    ( update_monitoring_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a previously created schedule.\n"]

module UpdateNotebookInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_instance_input ->
    ( update_notebook_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_instance_input ->
    ( update_notebook_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML \
   compute instance used for your notebook instance to accommodate changes in your workload \
   requirements.\n\n\
  \  This API can attach lifecycle configurations to notebook instances. Lifecycle configuration \
   scripts execute with root access and the notebook instance's IAM execution role privileges. \
   Principals with this permission and access to lifecycle configurations can execute code with \
   the execution role's credentials. See \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html}Customize a \
   Notebook Instance Using a Lifecycle Configuration Script} for security best practices.\n\
  \  \n\
  \   "]

module UpdateNotebookInstanceLifecycleConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_instance_lifecycle_config_input ->
    ( update_notebook_instance_lifecycle_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_instance_lifecycle_config_input ->
    ( update_notebook_instance_lifecycle_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a notebook instance lifecycle configuration created with the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateNotebookInstanceLifecycleConfig.html}CreateNotebookInstanceLifecycleConfig} \
   API.\n\n\
  \  Updates to lifecycle configurations affect all notebook instances using that configuration \
   upon their next start. Lifecycle configuration scripts execute with root access and the \
   notebook instance's IAM execution role privileges. Grant this permission only to trusted \
   principals. See \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html}Customize a \
   Notebook Instance Using a Lifecycle Configuration Script} for security best practices.\n\
  \  \n\
  \   "]

module UpdatePartnerApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_partner_app_request ->
    ( update_partner_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_partner_app_request ->
    ( update_partner_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates all of the SageMaker Partner AI Apps in an account.\n"]

module UpdatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_request ->
    ( update_pipeline_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_request ->
    ( update_pipeline_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a pipeline.\n"]

module UpdatePipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_execution_request ->
    ( update_pipeline_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_execution_request ->
    ( update_pipeline_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a pipeline execution.\n"]

module UpdatePipelineVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_version_request ->
    ( update_pipeline_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_version_request ->
    ( update_pipeline_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a pipeline version.\n"]

module UpdateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_project_input ->
    ( update_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_project_input ->
    ( update_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a machine learning (ML) project that is created from a template that sets up an ML \
   pipeline from training to deploying an approved model.\n\n\
  \  You must not update a project that is in use. If you update the \
   [ServiceCatalogProvisioningUpdateDetails] of a project that is active or being created, or \
   updated, you may lose resources already created by the project.\n\
  \  \n\
  \   "]

module UpdateSpace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_space_request ->
    ( update_space_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_space_request ->
    ( update_space_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the settings of a space.\n\n\
  \  You can't edit the app type of a space in the [SpaceSettings].\n\
  \  \n\
  \   "]

module UpdateTrainingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_training_job_request ->
    ( update_training_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_training_job_request ->
    ( update_training_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a model training job to request a new Debugger profiling configuration or to change warm \
   pool retention length.\n"]

module UpdateTrial : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trial_request ->
    ( update_trial_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trial_request ->
    ( update_trial_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the display name of a trial.\n"]

module UpdateTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trial_component_request ->
    ( update_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trial_component_request ->
    ( update_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates one or more properties of a trial component.\n"]

module UpdateUserProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_profile_request ->
    ( update_user_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_profile_request ->
    ( update_user_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a user profile.\n"]

module UpdateWorkforce : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workforce_request ->
    ( update_workforce_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workforce_request ->
    ( update_workforce_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to update your workforce. You can use this operation to require that workers \
   use specific IP addresses to work on tasks and to update your OpenID Connect (OIDC) Identity \
   Provider (IdP) workforce configuration.\n\n\
  \ The worker portal is now supported in VPC and public internet.\n\
  \ \n\
  \   Use [SourceIpConfig] to restrict worker access to tasks to a specific range of IP addresses. \
   You specify allowed IP addresses by creating a list of up to ten \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html}CIDRs}. By default, a \
   workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, \
   workers who attempt to access tasks using any IP address outside the specified range are denied \
   and get a [Not Found] error message on the worker portal.\n\
  \  \n\
  \   To restrict public internet access for all workers, configure the [SourceIpConfig] CIDR \
   value. For example, when using [SourceIpConfig] with an [IpAddressType] of [IPv4], you can \
   restrict access to the IPv4 CIDR block \"10.0.0.0/16\". When using an [IpAddressType] of \
   [dualstack], you can specify both the IPv4 and IPv6 CIDR blocks, such as \"10.0.0.0/16\" for \
   IPv4 only, \"2001:db8:1234:1a00::/56\" for IPv6 only, or \"10.0.0.0/16\" and \
   \"2001:db8:1234:1a00::/56\" for dual stack.\n\
  \   \n\
  \     Amazon SageMaker does not support Source Ip restriction for worker portals in VPC.\n\
  \     \n\
  \       Use [OidcConfig] to update the configuration of a workforce created using your own OIDC \
   IdP. \n\
  \       \n\
  \         You can only update your OIDC IdP configuration when there are no work teams \
   associated with your workforce. You can delete work teams using the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteWorkteam.html}DeleteWorkteam} \
   operation.\n\
  \         \n\
  \           After restricting access to a range of IP addresses or updating your OIDC IdP \
   configuration with this operation, you can view details about your update workforce using the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeWorkforce.html}DescribeWorkforce} \
   operation.\n\
  \           \n\
  \             This operation only applies to private workforces.\n\
  \             \n\
  \              "]

module UpdateWorkteam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workteam_request ->
    ( update_workteam_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workteam_request ->
    ( update_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing work team with new member definitions or description.\n"]

module RetryPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retry_pipeline_execution_request ->
    ( retry_pipeline_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retry_pipeline_execution_request ->
    ( retry_pipeline_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retry the execution of the pipeline.\n"]

module RenderUiTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    render_ui_template_request ->
    ( render_ui_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    render_ui_template_request ->
    ( render_ui_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Renders the UI template so that you can preview the worker's experience. \n"]

module RegisterDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_devices_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_devices_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Register devices.\n"]

module QueryLineage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_lineage_request ->
    ( query_lineage_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_lineage_request ->
    ( query_lineage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this action to inspect your lineage and discover relationships between entities. For more \
   information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/querying-lineage-entities.html} Querying \
   Lineage Entities} in the {i Amazon SageMaker Developer Guide}.\n"]

module PutModelPackageGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_model_package_group_policy_input ->
    ( put_model_package_group_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_model_package_group_policy_input ->
    ( put_model_package_group_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a resouce policy to control access to a model group. For information about resoure \
   policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html}Identity-based \
   policies and resource-based policies} in the {i Amazon Web Services Identity and Access \
   Management User Guide.}.\n"]

module ListWorkteams : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workteams_request ->
    (list_workteams_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workteams_request ->
    ( list_workteams_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of private work teams that you have defined in a region. The list may be empty if \
   no work team satisfies the filter specified in the [NameContains] parameter.\n"]

module ListWorkforces : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workforces_request ->
    (list_workforces_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workforces_request ->
    ( list_workforces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to list all private and vendor workforces in an Amazon Web Services Region. \
   Note that you can only have one private workforce per Amazon Web Services Region.\n"]

module ListUserProfiles : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_profiles_request ->
    (list_user_profiles_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_profiles_request ->
    ( list_user_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists user profiles.\n"]

module ListUltraServersByReservedCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ultra_servers_by_reserved_capacity_request ->
    ( list_ultra_servers_by_reserved_capacity_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ultra_servers_by_reserved_capacity_request ->
    ( list_ultra_servers_by_reserved_capacity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all UltraServers that are part of a specified reserved capacity.\n"]

module ListTrials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_trials_request ->
    ( list_trials_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_trials_request ->
    ( list_trials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the trials in your account. Specify an experiment name to limit the list to the trials \
   that are part of that experiment. Specify a trial component name to limit the list to the \
   trials that associated with that trial component. The list can be filtered to show only trials \
   that were created in a specific time range. The list can be sorted by trial name or creation \
   time.\n"]

module ListTrialComponents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_trial_components_request ->
    ( list_trial_components_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_trial_components_request ->
    ( list_trial_components_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the trial components in your account. You can sort the list by trial component name or \
   creation time. You can filter the list to show only components that were created in a specific \
   time range. You can also filter on one of the following:\n\n\
  \ {ul\n\
  \       {-   [ExperimentName] \n\
  \           \n\
  \            }\n\
  \       {-   [SourceArn] \n\
  \           \n\
  \            }\n\
  \       {-   [TrialName] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListTransformJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_transform_jobs_request ->
    (list_transform_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_transform_jobs_request ->
    ( list_transform_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists transform jobs.\n"]

module ListTrainingPlans : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_training_plans_request ->
    (list_training_plans_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_training_plans_request ->
    ( list_training_plans_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of training plans for the current account. \n"]

module ListTrainingJobsForHyperParameterTuningJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_training_jobs_for_hyper_parameter_tuning_job_request ->
    ( list_training_jobs_for_hyper_parameter_tuning_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_training_jobs_for_hyper_parameter_tuning_job_request ->
    ( list_training_jobs_for_hyper_parameter_tuning_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_TrainingJobSummary.html}TrainingJobSummary} \
   objects that describe the training jobs that a hyperparameter tuning job launched.\n"]

module ListTrainingJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_training_jobs_request ->
    (list_training_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_training_jobs_request ->
    ( list_training_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists training jobs.\n\n\
  \  When [StatusEquals] and [MaxResults] are set at the same time, the [MaxResults] number of \
   training jobs are first retrieved ignoring the [StatusEquals] parameter and then they are \
   filtered by the [StatusEquals] parameter, which is returned as a response.\n\
  \  \n\
  \   For example, if [ListTrainingJobs] is invoked with the following parameters:\n\
  \   \n\
  \     [{ ... MaxResults: 100, StatusEquals: InProgress ... }] \n\
  \    \n\
  \     First, 100 trainings jobs with any status, including those other than [InProgress], are \
   selected (sorted according to the creation time, from the most current to the oldest). Next, \
   those with a status of [InProgress] are returned.\n\
  \     \n\
  \      You can quickly test the API using the following Amazon Web Services CLI code.\n\
  \      \n\
  \        [aws sagemaker list-training-jobs --max-results 100 --status-equals InProgress] \n\
  \       \n\
  \        "]

module ListTags : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_input ->
    (list_tags_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_input ->
    ( list_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the tags for the specified SageMaker resource.\n"]

module ListSubscribedWorkteams : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_subscribed_workteams_request ->
    (list_subscribed_workteams_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_subscribed_workteams_request ->
    ( list_subscribed_workteams_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the work teams that you are subscribed to in the Amazon Web Services \
   Marketplace. The list may be empty if no work team satisfies the filter specified in the \
   [NameContains] parameter.\n"]

module ListStudioLifecycleConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_studio_lifecycle_configs_request ->
    ( list_studio_lifecycle_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_studio_lifecycle_configs_request ->
    ( list_studio_lifecycle_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Amazon SageMaker AI Studio Lifecycle Configurations in your Amazon Web Services \
   Account.\n"]

module ListStageDevices : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stage_devices_request ->
    (list_stage_devices_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stage_devices_request ->
    ( list_stage_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists devices allocated to the stage, containing detailed device information and deployment \
   status.\n"]

module ListSpaces : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_spaces_request ->
    (list_spaces_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_spaces_request ->
    ( list_spaces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists spaces.\n"]

module ListResourceCatalogs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_catalogs_request ->
    (list_resource_catalogs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_catalogs_request ->
    ( list_resource_catalogs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists Amazon SageMaker Catalogs based on given filters and orders. The maximum number of \
   [ResourceCatalog]s viewable is 1000. \n"]

module ListProjects : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_projects_input ->
    (list_projects_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_projects_input ->
    ( list_projects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the projects in an Amazon Web Services account.\n"]

module ListProcessingJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_processing_jobs_request ->
    (list_processing_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_processing_jobs_request ->
    ( list_processing_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists processing jobs that satisfy various filters.\n"]

module ListPipelines : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_request ->
    (list_pipelines_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_request ->
    ( list_pipelines_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of pipelines.\n"]

module ListPipelineVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_versions_request ->
    ( list_pipeline_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_versions_request ->
    ( list_pipeline_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of all versions of the pipeline.\n"]

module ListPipelineParametersForExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_parameters_for_execution_request ->
    ( list_pipeline_parameters_for_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_parameters_for_execution_request ->
    ( list_pipeline_parameters_for_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of parameters for a pipeline execution.\n"]

module ListPipelineExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_request ->
    ( list_pipeline_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_request ->
    ( list_pipeline_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the pipeline executions.\n"]

module ListPipelineExecutionSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_execution_steps_request ->
    ( list_pipeline_execution_steps_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_execution_steps_request ->
    ( list_pipeline_execution_steps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of [PipeLineExecutionStep] objects.\n"]

module ListPartnerApps : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_partner_apps_request ->
    (list_partner_apps_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_partner_apps_request ->
    ( list_partner_apps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all of the SageMaker Partner AI Apps in an account.\n"]

module ListOptimizationJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_optimization_jobs_request ->
    (list_optimization_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_optimization_jobs_request ->
    ( list_optimization_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the optimization jobs in your account and their properties.\n"]

module ListNotebookInstances : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_instances_input ->
    (list_notebook_instances_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_instances_input ->
    ( list_notebook_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the SageMaker AI notebook instances in the requester's account in an Amazon \
   Web Services Region. \n"]

module ListNotebookInstanceLifecycleConfigs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_instance_lifecycle_configs_input ->
    (list_notebook_instance_lifecycle_configs_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_instance_lifecycle_configs_input ->
    ( list_notebook_instance_lifecycle_configs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists notebook instance lifestyle configurations created with the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateNotebookInstanceLifecycleConfig.html}CreateNotebookInstanceLifecycleConfig} \
   API.\n"]

module ListMonitoringSchedules : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_schedules_request ->
    (list_monitoring_schedules_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_schedules_request ->
    ( list_monitoring_schedules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns list of all monitoring schedules.\n"]

module ListMonitoringExecutions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_executions_request ->
    (list_monitoring_executions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_executions_request ->
    ( list_monitoring_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns list of all monitoring job executions.\n"]

module ListMonitoringAlerts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_alerts_request ->
    ( list_monitoring_alerts_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_alerts_request ->
    ( list_monitoring_alerts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the alerts for a single monitoring schedule.\n"]

module ListMonitoringAlertHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_alert_history_request ->
    ( list_monitoring_alert_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitoring_alert_history_request ->
    ( list_monitoring_alert_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of past alerts in a model monitoring schedule.\n"]

module ListModels : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_models_input ->
    (list_models_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_models_input ->
    ( list_models_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists models created with the [CreateModel] API.\n"]

module ListModelQualityJobDefinitions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_quality_job_definitions_request ->
    (list_model_quality_job_definitions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_quality_job_definitions_request ->
    ( list_model_quality_job_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of model quality monitoring job definitions in your account.\n"]

module ListModelPackages : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_packages_input ->
    (list_model_packages_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_packages_input ->
    ( list_model_packages_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the model packages that have been created.\n"]

module ListModelPackageGroups : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_package_groups_input ->
    (list_model_package_groups_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_package_groups_input ->
    ( list_model_package_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the model groups in your Amazon Web Services account.\n"]

module ListModelMetadata : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_metadata_request ->
    (list_model_metadata_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_metadata_request ->
    ( list_model_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the domain, framework, task, and model name of standard machine learning models found in \
   common model zoos.\n"]

module ListModelExplainabilityJobDefinitions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_explainability_job_definitions_request ->
    ( list_model_explainability_job_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_explainability_job_definitions_request ->
    ( list_model_explainability_job_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists model explainability job definitions that satisfy various filters.\n"]

module ListModelCards : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_cards_request ->
    (list_model_cards_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_cards_request ->
    ( list_model_cards_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List existing model cards.\n"]

module ListModelCardVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_card_versions_request ->
    ( list_model_card_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_card_versions_request ->
    ( list_model_card_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List existing versions of an Amazon SageMaker Model Card.\n"]

module ListModelCardExportJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_card_export_jobs_request ->
    (list_model_card_export_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_card_export_jobs_request ->
    ( list_model_card_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the export jobs for the Amazon SageMaker Model Card.\n"]

module ListModelBiasJobDefinitions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_model_bias_job_definitions_request ->
    (list_model_bias_job_definitions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_bias_job_definitions_request ->
    ( list_model_bias_job_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists model bias jobs definitions that satisfy various filters.\n"]

module ListMlflowTrackingServers : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_mlflow_tracking_servers_request ->
    (list_mlflow_tracking_servers_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_mlflow_tracking_servers_request ->
    ( list_mlflow_tracking_servers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all MLflow Tracking Servers.\n"]

module ListMlflowApps : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_mlflow_apps_request ->
    (list_mlflow_apps_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_mlflow_apps_request ->
    ( list_mlflow_apps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all MLflow Apps\n"]

module ListLineageGroups : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_lineage_groups_request ->
    (list_lineage_groups_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_lineage_groups_request ->
    ( list_lineage_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A list of lineage groups shared with your Amazon Web Services account. For more information, \
   see {{:https://docs.aws.amazon.com/sagemaker/latest/dg/xaccount-lineage-tracking.html} \
   Cross-Account Lineage Tracking } in the {i Amazon SageMaker Developer Guide}.\n"]

module ListLabelingJobsForWorkteam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_labeling_jobs_for_workteam_request ->
    ( list_labeling_jobs_for_workteam_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_labeling_jobs_for_workteam_request ->
    ( list_labeling_jobs_for_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of labeling jobs assigned to a specified work team.\n"]

module ListLabelingJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_labeling_jobs_request ->
    (list_labeling_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_labeling_jobs_request ->
    ( list_labeling_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of labeling jobs.\n"]

module ListJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    (list_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists jobs in a specified category. You can filter results by creation time, last modified \
   time, name, and status. Results are sorted by the field you specify in [SortBy]. Use pagination \
   to retrieve large result sets efficiently.\n\n\
  \ The following operations are related to [ListJobs]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        {-   [DescribeJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListJobSchemaVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_job_schema_versions_request ->
    ( list_job_schema_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_job_schema_versions_request ->
    ( list_job_schema_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists available configuration schema versions for a specified job category. Use the schema \
   versions with [DescribeJobSchemaVersion] to retrieve the full schema document.\n\n\
  \ The following operations are related to [ListJobSchemaVersions]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [DescribeJobSchemaVersion] \n\
  \            \n\
  \             }\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListInferenceRecommendationsJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inference_recommendations_jobs_request ->
    (list_inference_recommendations_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_recommendations_jobs_request ->
    ( list_inference_recommendations_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists recommendation jobs that satisfy various filters.\n"]

module ListInferenceRecommendationsJobSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inference_recommendations_job_steps_request ->
    ( list_inference_recommendations_job_steps_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_recommendations_job_steps_request ->
    ( list_inference_recommendations_job_steps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the subtasks for an Inference Recommender job.\n\n\
  \ The supported subtasks are benchmarks, which evaluate the performance of your model on \
   different instance types.\n\
  \ "]

module ListInferenceExperiments : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inference_experiments_request ->
    (list_inference_experiments_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_experiments_request ->
    ( list_inference_experiments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the list of all inference experiments.\n"]

module ListInferenceComponents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inference_components_input ->
    (list_inference_components_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_components_input ->
    ( list_inference_components_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the inference components in your account and their properties.\n"]

module ListImages : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_images_request ->
    (list_images_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_images_request ->
    ( list_images_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the images in your account and their properties. The list can be filtered by creation \
   time or modified time, and whether the image name contains a specified string.\n"]

module ListImageVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_image_versions_request ->
    ( list_image_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_image_versions_request ->
    ( list_image_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the versions of a specified image and their properties. The list can be filtered by \
   creation time or modified time.\n"]

module ListHyperParameterTuningJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hyper_parameter_tuning_jobs_request ->
    (list_hyper_parameter_tuning_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hyper_parameter_tuning_jobs_request ->
    ( list_hyper_parameter_tuning_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_HyperParameterTuningJobSummary.html}HyperParameterTuningJobSummary} \
   objects that describe the hyperparameter tuning jobs launched in your account.\n"]

module ListHumanTaskUis : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_human_task_uis_request ->
    (list_human_task_uis_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_human_task_uis_request ->
    ( list_human_task_uis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the human task user interfaces in your account.\n"]

module ListHubs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hubs_request ->
    (list_hubs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hubs_request ->
    ( list_hubs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all existing hubs.\n"]

module ListHubContents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hub_contents_request ->
    ( list_hub_contents_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hub_contents_request ->
    ( list_hub_contents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the contents of a hub.\n"]

module ListHubContentVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hub_content_versions_request ->
    ( list_hub_content_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hub_content_versions_request ->
    ( list_hub_content_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List hub content versions.\n"]

module ListFlowDefinitions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_definitions_request ->
    (list_flow_definitions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_definitions_request ->
    ( list_flow_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the flow definitions in your account.\n"]

module ListFeatureGroups : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_feature_groups_request ->
    (list_feature_groups_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_feature_groups_request ->
    ( list_feature_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List [FeatureGroup]s based on given filter and order.\n"]

module ListExperiments : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_experiments_request ->
    (list_experiments_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_experiments_request ->
    ( list_experiments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the experiments in your account. The list can be filtered to show only experiments \
   that were created in a specific time range. The list can be sorted by experiment name or \
   creation time.\n"]

module ListEndpoints : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_input ->
    (list_endpoints_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_input ->
    ( list_endpoints_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists endpoints.\n"]

module ListEndpointConfigs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_configs_input ->
    (list_endpoint_configs_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_configs_input ->
    ( list_endpoint_configs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists endpoint configurations.\n"]

module ListEdgePackagingJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_edge_packaging_jobs_request ->
    (list_edge_packaging_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_edge_packaging_jobs_request ->
    ( list_edge_packaging_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of edge packaging jobs.\n"]

module ListEdgeDeploymentPlans : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_edge_deployment_plans_request ->
    (list_edge_deployment_plans_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_edge_deployment_plans_request ->
    ( list_edge_deployment_plans_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all edge deployment plans.\n"]

module ListDomains : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    (list_domains_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    ( list_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the domains.\n"]

module ListDevices : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    (list_devices_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A list of devices.\n"]

module ListDeviceFleets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_device_fleets_request ->
    (list_device_fleets_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_device_fleets_request ->
    ( list_device_fleets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of devices in the fleet.\n"]

module ListDataQualityJobDefinitions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_job_definitions_request ->
    (list_data_quality_job_definitions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_job_definitions_request ->
    ( list_data_quality_job_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the data quality job definitions in your account.\n"]

module ListContexts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_contexts_request ->
    ( list_contexts_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_contexts_request ->
    ( list_contexts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the contexts in your account and their properties.\n"]

module ListComputeQuotas : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compute_quotas_request ->
    (list_compute_quotas_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compute_quotas_request ->
    ( list_compute_quotas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the resource allocation definitions.\n"]

module ListCompilationJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compilation_jobs_request ->
    (list_compilation_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compilation_jobs_request ->
    ( list_compilation_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists model compilation jobs that satisfy various filters.\n\n\
  \ To create a model compilation job, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateCompilationJob.html}CreateCompilationJob}. \
   To get information about a particular model compilation job you have created, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeCompilationJob.html}DescribeCompilationJob}.\n\
  \ "]

module ListCodeRepositories : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_code_repositories_input ->
    (list_code_repositories_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_code_repositories_input ->
    ( list_code_repositories_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the Git repositories in your account.\n"]

module ListClusters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    (list_clusters_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    ( list_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the list of SageMaker HyperPod clusters.\n"]

module ListClusterSchedulerConfigs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_scheduler_configs_request ->
    (list_cluster_scheduler_configs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_scheduler_configs_request ->
    ( list_cluster_scheduler_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the cluster policy configurations.\n"]

module ListClusterNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_nodes_request ->
    ( list_cluster_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_nodes_request ->
    ( list_cluster_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the list of instances (also called {i nodes} interchangeably) in a SageMaker HyperPod \
   cluster.\n"]

module ListClusterEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_events_request ->
    ( list_cluster_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cluster_events_request ->
    ( list_cluster_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of event summaries for a specified HyperPod cluster. The operation supports \
   filtering, sorting, and pagination of results. This functionality is only supported when the \
   [NodeProvisioningMode] is set to [Continuous].\n"]

module ListCandidatesForAutoMLJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_candidates_for_auto_ml_job_request ->
    ( list_candidates_for_auto_ml_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_candidates_for_auto_ml_job_request ->
    ( list_candidates_for_auto_ml_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the candidates created for the job.\n"]

module ListAutoMLJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_auto_ml_jobs_request ->
    (list_auto_ml_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_auto_ml_jobs_request ->
    ( list_auto_ml_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Request a list of jobs.\n"]

module ListAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associations_request ->
    ( list_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associations_request ->
    ( list_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the associations in your account and their properties.\n"]

module ListArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the artifacts in your account and their properties.\n"]

module ListApps : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_apps_request ->
    (list_apps_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_apps_request ->
    ( list_apps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists apps.\n"]

module ListAppImageConfigs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_app_image_configs_request ->
    (list_app_image_configs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_app_image_configs_request ->
    ( list_app_image_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the AppImageConfigs in your account and their properties. The list can be filtered by \
   creation time or modified time, and whether the AppImageConfig name contains a specified string.\n"]

module ListAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_request ->
    ( list_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_request ->
    ( list_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the aliases of a specified image or image version.\n"]

module ListAlgorithms : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_algorithms_input ->
    (list_algorithms_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_algorithms_input ->
    ( list_algorithms_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the machine learning algorithms that have been created.\n"]

module ListActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_actions_request ->
    ( list_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_actions_request ->
    ( list_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the actions in your account and their properties.\n"]

module ListAIWorkloadConfigs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ai_workload_configs_request ->
    (list_ai_workload_configs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ai_workload_configs_request ->
    ( list_ai_workload_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of AI workload configurations in your account. You can filter the results by \
   name and creation time, and sort the results. The response is paginated.\n"]

module ListAIRecommendationJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ai_recommendation_jobs_request ->
    (list_ai_recommendation_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ai_recommendation_jobs_request ->
    ( list_ai_recommendation_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of AI recommendation jobs in your account. You can filter the results by name, \
   status, and creation time, and sort the results. The response is paginated.\n"]

module ListAIBenchmarkJobs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ai_benchmark_jobs_request ->
    (list_ai_benchmark_jobs_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ai_benchmark_jobs_request ->
    ( list_ai_benchmark_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of AI benchmark jobs in your account. You can filter the results by name, \
   status, and creation time, and sort the results. The response is paginated.\n"]

module ImportHubContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_hub_content_request ->
    ( import_hub_content_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_hub_content_request ->
    ( import_hub_content_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Import hub content.\n"]

module GetSearchSuggestions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_search_suggestions_request ->
    (get_search_suggestions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_search_suggestions_request ->
    ( get_search_suggestions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An auto-complete API for the search functionality in the SageMaker console. It returns \
   suggestions of possible matches for the property name to use in [Search] queries. Provides \
   suggestions for [HyperParameters], [Tags], and [Metrics].\n"]

module GetScalingConfigurationRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scaling_configuration_recommendation_request ->
    ( get_scaling_configuration_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scaling_configuration_recommendation_request ->
    ( get_scaling_configuration_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an Amazon SageMaker Inference Recommender autoscaling recommendation job. Returns \
   recommendations for autoscaling policies that you can apply to your SageMaker endpoint.\n"]

module GetSagemakerServicecatalogPortfolioStatus : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sagemaker_servicecatalog_portfolio_status_input ->
    ( get_sagemaker_servicecatalog_portfolio_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sagemaker_servicecatalog_portfolio_status_input ->
    ( get_sagemaker_servicecatalog_portfolio_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the status of Service Catalog in SageMaker. Service Catalog is used to create SageMaker \
   projects.\n"]

module GetModelPackageGroupPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_model_package_group_policy_input ->
    (get_model_package_group_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_model_package_group_policy_input ->
    ( get_model_package_group_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a resource policy that manages access for a model group. For information about resource \
   policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html}Identity-based \
   policies and resource-based policies} in the {i Amazon Web Services Identity and Access \
   Management User Guide.}.\n"]

module GetLineageGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lineage_group_policy_request ->
    ( get_lineage_group_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lineage_group_policy_request ->
    ( get_lineage_group_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The resource policy for the lineage group.\n"]

module GetDeviceFleetReport : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_fleet_report_request ->
    (get_device_fleet_report_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_fleet_report_request ->
    ( get_device_fleet_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a fleet.\n"]

module ExtendTrainingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    extend_training_plan_request ->
    ( extend_training_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    extend_training_plan_request ->
    ( extend_training_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Extends an existing training plan by purchasing an extension offering. This allows you to add \
   additional compute capacity time to your training plan without creating a new plan or \
   reconfiguring your workloads.\n\n\
  \ To find available extension offerings, use the \n\
  \ {[\n\
  \  \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_SearchTrainingPlanOfferings.html}SearchTrainingPlanOfferings} \n\
  \ ]}\n\
  \  API with the [TrainingPlanArn] parameter.\n\
  \ \n\
  \  To view the history of extensions for a training plan, use the \n\
  \  {[\n\
  \   \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeTrainingPlanExtensionHistory.html}DescribeTrainingPlanExtensionHistory} \n\
  \  ]}\n\
  \   API.\n\
  \  "]

module EnableSagemakerServicecatalogPortfolio : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_sagemaker_servicecatalog_portfolio_input ->
    ( enable_sagemaker_servicecatalog_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_sagemaker_servicecatalog_portfolio_input ->
    ( enable_sagemaker_servicecatalog_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.\n"]

module DisassociateTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_trial_component_request ->
    ( disassociate_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_trial_component_request ->
    ( disassociate_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a trial component from a trial. This doesn't effect other trials the component is \
   associated with. Before you can delete a component, you must disassociate the component from \
   all trials it is associated with. To associate a trial component with a trial, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_AssociateTrialComponent.html}AssociateTrialComponent} \
   API.\n\n\
  \ To get a list of the trials a component is associated with, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_Search.html}Search} API. \
   Specify [ExperimentTrialComponent] for the [Resource] parameter. The list appears in the \
   response under [Results.TrialComponent.Parents].\n\
  \ "]

module DisableSagemakerServicecatalogPortfolio : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_sagemaker_servicecatalog_portfolio_input ->
    ( disable_sagemaker_servicecatalog_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_sagemaker_servicecatalog_portfolio_input ->
    ( disable_sagemaker_servicecatalog_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker \
   projects.\n"]

module DetachClusterNodeVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_cluster_node_volume_request ->
    ( detach_cluster_node_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_cluster_node_volume_request ->
    ( detach_cluster_node_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Detaches your Amazon Elastic Block Store (Amazon EBS) volume from a node in your EKS \
   orchestrated SageMaker HyperPod cluster.\n\n\
  \  This API works with the Amazon Elastic Block Store (Amazon EBS) Container Storage Interface \
   (CSI) driver to manage the lifecycle of persistent storage in your HyperPod EKS clusters. \n\
  \ "]

module DescribeWorkteam : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workteam_request ->
    (describe_workteam_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workteam_request ->
    ( describe_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specific work team. You can see information such as the creation date, \
   the last updated date, membership information, and the work team's Amazon Resource Name (ARN).\n"]

module DescribeWorkforce : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workforce_request ->
    (describe_workforce_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workforce_request ->
    ( describe_workforce_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, \
   if applicable, allowed IP address ranges \
   ({{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html}CIDRs}). Allowable IP \
   address ranges are the IP addresses that workers can use to access tasks. \n\n\
  \  This operation applies only to private workforces.\n\
  \  \n\
  \   "]

module DescribeUserProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_profile_request ->
    ( describe_user_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_profile_request ->
    ( describe_user_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a user profile. For more information, see [CreateUserProfile].\n"]

module DescribeTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trial_component_request ->
    ( describe_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trial_component_request ->
    ( describe_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a list of a trials component's properties.\n"]

module DescribeTrial : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trial_request ->
    ( describe_trial_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trial_request ->
    ( describe_trial_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a list of a trial's properties.\n"]

module DescribeTransformJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_transform_job_request ->
    ( describe_transform_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_transform_job_request ->
    ( describe_transform_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a transform job.\n"]

module DescribeTrainingPlanExtensionHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_training_plan_extension_history_request ->
    ( describe_training_plan_extension_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_training_plan_extension_history_request ->
    ( describe_training_plan_extension_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the extension history for a specified training plan. The response includes details \
   about each extension, such as the offering ID, start and end dates, status, payment status, and \
   cost information.\n"]

module DescribeTrainingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_training_plan_request ->
    ( describe_training_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_training_plan_request ->
    ( describe_training_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves detailed information about a specific training plan.\n"]

module DescribeTrainingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_training_job_request ->
    ( describe_training_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_training_job_request ->
    ( describe_training_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a training job. \n\n\
  \ Some of the attributes below only appear if the training job successfully starts. If the \
   training job fails, [TrainingJobStatus] is [Failed] and, depending on the [FailureReason], \
   attributes like [TrainingStartTime], [TrainingTimeInSeconds], [TrainingEndTime], and \
   [BillableTimeInSeconds] may not be present in the response.\n\
  \ "]

module DescribeSubscribedWorkteam : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_subscribed_workteam_request ->
    (describe_subscribed_workteam_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_subscribed_workteam_request ->
    ( describe_subscribed_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a work team provided by a vendor. It returns details about the \
   subscription with a vendor in the Amazon Web Services Marketplace.\n"]

module DescribeStudioLifecycleConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_lifecycle_config_request ->
    ( describe_studio_lifecycle_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_lifecycle_config_request ->
    ( describe_studio_lifecycle_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the Amazon SageMaker AI Studio Lifecycle Configuration.\n"]

module DescribeSpace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_space_request ->
    ( describe_space_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_space_request ->
    ( describe_space_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the space.\n"]

module DescribeReservedCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_capacity_request ->
    ( describe_reserved_capacity_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_capacity_request ->
    ( describe_reserved_capacity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about a reserved capacity.\n"]

module DescribeProject : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_project_input ->
    (describe_project_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_project_input ->
    ( describe_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the details of a project.\n"]

module DescribeProcessingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_processing_job_request ->
    ( describe_processing_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_processing_job_request ->
    ( describe_processing_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of a processing job.\n"]

module DescribePipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_execution_request ->
    ( describe_pipeline_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_execution_request ->
    ( describe_pipeline_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the details of a pipeline execution.\n"]

module DescribePipelineDefinitionForExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_definition_for_execution_request ->
    ( describe_pipeline_definition_for_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_definition_for_execution_request ->
    ( describe_pipeline_definition_for_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the details of an execution's pipeline definition.\n"]

module DescribePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_request ->
    ( describe_pipeline_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pipeline_request ->
    ( describe_pipeline_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the details of a pipeline.\n"]

module DescribePartnerApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_partner_app_request ->
    ( describe_partner_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_partner_app_request ->
    ( describe_partner_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a SageMaker Partner AI App.\n"]

module DescribeOptimizationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_optimization_job_request ->
    ( describe_optimization_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_optimization_job_request ->
    ( describe_optimization_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides the properties of the specified optimization job.\n"]

module DescribeNotebookInstanceLifecycleConfig : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_instance_lifecycle_config_input ->
    ( describe_notebook_instance_lifecycle_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_instance_lifecycle_config_input ->
    ( describe_notebook_instance_lifecycle_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of a notebook instance lifecycle configuration.\n\n\
  \ For information about notebook instance lifestyle configurations, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html}Step 2.1: \
   (Optional) Customize a Notebook Instance}.\n\
  \ "]

module DescribeNotebookInstance : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_instance_input ->
    (describe_notebook_instance_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_instance_input ->
    ( describe_notebook_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a notebook instance.\n"]

module DescribeMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_monitoring_schedule_request ->
    ( describe_monitoring_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_monitoring_schedule_request ->
    ( describe_monitoring_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the schedule for a monitoring job.\n"]

module DescribeModelQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_quality_job_definition_request ->
    ( describe_model_quality_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_quality_job_definition_request ->
    ( describe_model_quality_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of a model quality job definition.\n"]

module DescribeModelPackageGroup : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_package_group_input ->
    (describe_model_package_group_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_package_group_input ->
    ( describe_model_package_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a description for the specified model group.\n"]

module DescribeModelPackage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_package_input ->
    (describe_model_package_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_package_input ->
    ( describe_model_package_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of the specified model package, which is used to create SageMaker models \
   or list them on Amazon Web Services Marketplace.\n\n\
  \  If you provided a KMS Key ID when you created your model package, you will see the \
   {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Decrypt.html}KMS Decrypt} API call \
   in your CloudTrail logs when you use this API. To call this operation without requiring \
   [kms:Decrypt] permission on the customer-managed key, set [IncludedData] to [MetadataOnly]; the \
   response is returned with the embedded [ModelCard.ModelCardContent] field sanitized.\n\
  \  \n\
  \    To create models in SageMaker, buyers can subscribe to model packages listed on Amazon Web \
   Services Marketplace.\n\
  \    "]

module DescribeModelExplainabilityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_explainability_job_definition_request ->
    ( describe_model_explainability_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_explainability_job_definition_request ->
    ( describe_model_explainability_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of a model explainability job definition.\n"]

module DescribeModelCardExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_card_export_job_request ->
    ( describe_model_card_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_card_export_job_request ->
    ( describe_model_card_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an Amazon SageMaker Model Card export job.\n"]

module DescribeModelCard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_card_request ->
    ( describe_model_card_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_card_request ->
    ( describe_model_card_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the content, creation time, and security configuration of an Amazon SageMaker Model \
   Card.\n\n\
  \  To retrieve only metadata about a model card without requiring [kms:Decrypt] permission on \
   the associated customer-managed Amazon Web Services KMS key, set [IncludedData] to \
   [MetadataOnly]. The default is [AllData], which returns the full model card [Content] and \
   requires [kms:Decrypt] permission when a customer-managed key is configured.\n\
  \  \n\
  \   "]

module DescribeModelBiasJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_bias_job_definition_request ->
    ( describe_model_bias_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_bias_job_definition_request ->
    ( describe_model_bias_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of a model bias job definition.\n"]

module DescribeModel : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_input ->
    (describe_model_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_input ->
    ( describe_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a model that you created using the [CreateModel] API.\n"]

module DescribeMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_mlflow_tracking_server_request ->
    ( describe_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_mlflow_tracking_server_request ->
    ( describe_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about an MLflow Tracking Server.\n"]

module DescribeMlflowApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_mlflow_app_request ->
    ( describe_mlflow_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_mlflow_app_request ->
    ( describe_mlflow_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about an MLflow App.\n"]

module DescribeLineageGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lineage_group_request ->
    ( describe_lineage_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lineage_group_request ->
    ( describe_lineage_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of properties for the requested lineage group. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/xaccount-lineage-tracking.html} \
   Cross-Account Lineage Tracking } in the {i Amazon SageMaker Developer Guide}.\n"]

module DescribeLabelingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_labeling_job_request ->
    ( describe_labeling_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_labeling_job_request ->
    ( describe_labeling_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a labeling job.\n"]

module DescribeJobSchemaVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_job_schema_version_request ->
    ( describe_job_schema_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_job_schema_version_request ->
    ( describe_job_schema_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the JSON schema for a specified job category and schema version. Use this schema to \
   validate your [JobConfigDocument] before calling [CreateJob]. If you don't specify a schema \
   version, the latest version is returned. The schema defines required fields, allowed values, \
   and constraints for the job configuration.\n\n\
  \ The following operations are related to [DescribeJobSchemaVersion]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [ListJobSchemaVersions] \n\
  \            \n\
  \             }\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_job_request ->
    ( describe_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_job_request ->
    ( describe_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about a job, including its current status, secondary status, \
   configuration, and timestamps. Use [SecondaryStatus] for granular progress tracking and \
   [SecondaryStatusTransitions] to see the full history of status changes with timestamps.\n\n\
  \ The following operations are related to [DescribeJob]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        {-   [ListJobs] \n\
  \            \n\
  \             }\n\
  \        {-   [StopJob] \n\
  \            \n\
  \             }\n\
  \        {-   [DeleteJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeInferenceRecommendationsJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_recommendations_job_request ->
    ( describe_inference_recommendations_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_recommendations_job_request ->
    ( describe_inference_recommendations_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the results of the Inference Recommender job. One or more recommendation jobs are \
   returned.\n"]

module DescribeInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_experiment_request ->
    ( describe_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_experiment_request ->
    ( describe_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details about an inference experiment.\n"]

module DescribeInferenceComponent : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_component_input ->
    (describe_inference_component_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_component_input ->
    ( describe_inference_component_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about an inference component.\n"]

module DescribeImageVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_version_request ->
    ( describe_image_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_version_request ->
    ( describe_image_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a version of a SageMaker AI image.\n"]

module DescribeImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_request ->
    ( describe_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_request ->
    ( describe_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a SageMaker AI image.\n"]

module DescribeHyperParameterTuningJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hyper_parameter_tuning_job_request ->
    ( describe_hyper_parameter_tuning_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hyper_parameter_tuning_job_request ->
    ( describe_hyper_parameter_tuning_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of a hyperparameter tuning job, depending on the fields selected. These \
   fields can include the name, Amazon Resource Name (ARN), job status of your tuning job and more.\n"]

module DescribeHumanTaskUi : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_human_task_ui_request ->
    ( describe_human_task_ui_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_human_task_ui_request ->
    ( describe_human_task_ui_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the requested human task user interface (worker task template).\n"]

module DescribeHubContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hub_content_request ->
    ( describe_hub_content_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hub_content_request ->
    ( describe_hub_content_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe the content of a hub.\n"]

module DescribeHub : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hub_request ->
    ( describe_hub_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hub_request ->
    ( describe_hub_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a hub.\n"]

module DescribeFlowDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_definition_request ->
    ( describe_flow_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_definition_request ->
    ( describe_flow_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified flow definition.\n"]

module DescribeFeatureMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_metadata_request ->
    ( describe_feature_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_metadata_request ->
    ( describe_feature_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Shows the metadata for a feature within a feature group.\n"]

module DescribeFeatureGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_group_request ->
    ( describe_feature_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_group_request ->
    ( describe_feature_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to describe a [FeatureGroup]. The response includes information on the \
   creation time, [FeatureGroup] name, the unique identifier for each [FeatureGroup], and more.\n"]

module DescribeExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_experiment_request ->
    ( describe_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_experiment_request ->
    ( describe_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a list of an experiment's properties.\n"]

module DescribeEndpointConfig : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_config_input ->
    (describe_endpoint_config_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_config_input ->
    ( describe_endpoint_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of an endpoint configuration created using the [CreateEndpointConfig] \
   API.\n"]

module DescribeEndpoint : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_input ->
    (describe_endpoint_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_input ->
    ( describe_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the description of an endpoint.\n"]

module DescribeEdgePackagingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_edge_packaging_job_request ->
    ( describe_edge_packaging_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_edge_packaging_job_request ->
    ( describe_edge_packaging_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A description of edge packaging jobs.\n"]

module DescribeEdgeDeploymentPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_edge_deployment_plan_request ->
    ( describe_edge_deployment_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_edge_deployment_plan_request ->
    ( describe_edge_deployment_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an edge deployment plan with deployment status per stage.\n"]

module DescribeDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_request ->
    ( describe_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_request ->
    ( describe_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The description of the domain.\n"]

module DescribeDeviceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_device_fleet_request ->
    ( describe_device_fleet_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_device_fleet_request ->
    ( describe_device_fleet_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A description of the fleet the device belongs to.\n"]

module DescribeDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_device_request ->
    ( describe_device_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_device_request ->
    ( describe_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the device.\n"]

module DescribeDataQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_quality_job_definition_request ->
    ( describe_data_quality_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_quality_job_definition_request ->
    ( describe_data_quality_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the details of a data quality monitoring job definition.\n"]

module DescribeContext : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_context_request ->
    ( describe_context_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_context_request ->
    ( describe_context_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a context.\n"]

module DescribeComputeQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_compute_quota_request ->
    ( describe_compute_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_compute_quota_request ->
    ( describe_compute_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Description of the compute allocation definition.\n"]

module DescribeCompilationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_compilation_job_request ->
    ( describe_compilation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_compilation_job_request ->
    ( describe_compilation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a model compilation job.\n\n\
  \ To create a model compilation job, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateCompilationJob.html}CreateCompilationJob}. \
   To get information about multiple model compilation jobs, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListCompilationJobs.html}ListCompilationJobs}.\n\
  \ "]

module DescribeCodeRepository : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_code_repository_input ->
    (describe_code_repository_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_code_repository_input ->
    ( describe_code_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets details about the specified Git repository.\n"]

module DescribeClusterSchedulerConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_scheduler_config_request ->
    ( describe_cluster_scheduler_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_scheduler_config_request ->
    ( describe_cluster_scheduler_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Description of the cluster policy. This policy is used for task prioritization and fair-share \
   allocation. This helps prioritize critical workloads and distributes idle compute across \
   entities.\n"]

module DescribeClusterNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_node_request ->
    ( describe_cluster_node_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_node_request ->
    ( describe_cluster_node_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information of a node (also called a {i instance} interchangeably) of a SageMaker \
   HyperPod cluster.\n"]

module DescribeClusterEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_event_request ->
    ( describe_cluster_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_event_request ->
    ( describe_cluster_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific event for a given HyperPod cluster. This \
   functionality is only supported when the [NodeProvisioningMode] is set to [Continuous].\n"]

module DescribeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_request ->
    ( describe_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_request ->
    ( describe_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information of a SageMaker HyperPod cluster.\n"]

module DescribeAutoMLJobV2 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_ml_job_v2_request ->
    ( describe_auto_ml_job_v2_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_ml_job_v2_request ->
    ( describe_auto_ml_job_v2_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an AutoML job created by calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJobV2.html}CreateAutoMLJobV2} \
   or \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJob.html}CreateAutoMLJob}.\n"]

module DescribeAutoMLJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_ml_job_request ->
    ( describe_auto_ml_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_ml_job_request ->
    ( describe_auto_ml_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an AutoML job created by calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJob.html}CreateAutoMLJob}.\n\n\
  \  AutoML jobs created by calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJobV2.html}CreateAutoMLJobV2} \
   cannot be described by [DescribeAutoMLJob].\n\
  \  \n\
  \   "]

module DescribeArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_artifact_request ->
    ( describe_artifact_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_artifact_request ->
    ( describe_artifact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an artifact.\n"]

module DescribeAppImageConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_image_config_request ->
    ( describe_app_image_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_image_config_request ->
    ( describe_app_image_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an AppImageConfig.\n"]

module DescribeApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_request ->
    ( describe_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_request ->
    ( describe_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the app.\n"]

module DescribeAlgorithm : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_input ->
    (describe_algorithm_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_input ->
    ( describe_algorithm_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a description of the specified algorithm that is in your account.\n"]

module DescribeAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_action_request ->
    ( describe_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_action_request ->
    ( describe_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an action.\n"]

module DescribeAIWorkloadConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_workload_config_request ->
    ( describe_ai_workload_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_workload_config_request ->
    ( describe_ai_workload_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details of an AI workload configuration, including the dataset configuration, benchmark \
   tool settings, tags, and creation time.\n"]

module DescribeAIRecommendationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_recommendation_job_request ->
    ( describe_ai_recommendation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_recommendation_job_request ->
    ( describe_ai_recommendation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details of an AI recommendation job, including its status, model source, performance \
   targets, optimization recommendations, and deployment configurations.\n"]

module DescribeAIBenchmarkJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_benchmark_job_request ->
    ( describe_ai_benchmark_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ai_benchmark_job_request ->
    ( describe_ai_benchmark_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details of an AI benchmark job, including its status, configuration, target endpoint, \
   and timing information.\n"]

module DeregisterDevices : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_devices_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_devices_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified devices. After you deregister a device, you will need to re-register \
   the devices.\n"]

module DeleteWorkteam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workteam_request ->
    ( delete_workteam_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workteam_request ->
    ( delete_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing work team. This operation can't be undone.\n"]

module DeleteWorkforce : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workforce_request ->
    (delete_workforce_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workforce_request ->
    ( delete_workforce_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to delete a workforce.\n\n\
  \ If you want to create a new workforce in an Amazon Web Services Region where a workforce \
   already exists, use this operation to delete the existing workforce and then use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateWorkforce.html}CreateWorkforce} \
   to create a new workforce.\n\
  \ \n\
  \   If a private workforce contains one or more work teams, you must use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteWorkteam.html}DeleteWorkteam} \
   operation to delete all work teams before you delete the workforce. If you try to delete a \
   workforce that contains one or more work teams, you will receive a [ResourceInUse] error.\n\
  \   \n\
  \    "]

module DeleteUserProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user profile. When a user profile is deleted, the user loses access to their EFS \
   volume, including data, notebooks, and other artifacts.\n"]

module DeleteTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trial_component_request ->
    ( delete_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trial_component_request ->
    ( delete_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified trial component. A trial component must be disassociated from all trials \
   before the trial component can be deleted. To disassociate a trial component from a trial, call \
   the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DisassociateTrialComponent.html}DisassociateTrialComponent} \
   API.\n"]

module DeleteTrial : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trial_request ->
    ( delete_trial_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trial_request ->
    ( delete_trial_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified trial. All trial components that make up the trial must be deleted first. \
   Use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeTrialComponent.html}DescribeTrialComponent} \
   API to get the list of trial components.\n"]

module DeleteTrainingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_training_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_training_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a training job. After SageMaker deletes a training job, all of the metadata for the \
   training job is lost. You can delete only training jobs that are in a terminal state \
   ([Stopped], [Failed], or [Completed]) and don't retain an [Available] \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/train-warm-pools.html}managed warm pool}. \
   You cannot delete a job that is in the [InProgress] or [Stopping] state. After deleting the \
   job, you can reuse its name to create another training job.\n"]

module DeleteTags : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_input ->
    (delete_tags_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_input ->
    ( delete_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified tags from an SageMaker resource.\n\n\
  \ To list a resource's tags, use the [ListTags] API. \n\
  \ \n\
  \   When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are \
   not removed from training jobs that the hyperparameter tuning job launched before you called \
   this API.\n\
  \   \n\
  \      When you call this API to delete tags from a SageMaker Domain or User Profile, the \
   deleted tags are not removed from Apps that the SageMaker Domain or User Profile launched \
   before you called this API.\n\
  \      \n\
  \       "]

module DeleteStudioLifecycleConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_lifecycle_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_lifecycle_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the Amazon SageMaker AI Studio Lifecycle Configuration. In order to delete the \
   Lifecycle Configuration, there must be no running apps using the Lifecycle Configuration. You \
   must also remove the Lifecycle Configuration from UserSettings in all Domains and UserProfiles.\n"]

module DeleteSpace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_space_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_space_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Used to delete a space.\n"]

module DeleteProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete the specified project.\n"]

module DeleteProcessingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_processing_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_processing_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a processing job. After Amazon SageMaker deletes a processing job, all of the metadata \
   for the processing job is lost. You can delete only processing jobs that are in a terminal \
   state ([Stopped], [Failed], or [Completed]). You cannot delete a job that is in the \
   [InProgress] or [Stopping] state. After deleting the job, you can reuse its name to create \
   another processing job.\n"]

module DeletePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_request ->
    ( delete_pipeline_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_request ->
    ( delete_pipeline_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a pipeline if there are no running instances of the pipeline. To delete a pipeline, you \
   must stop all running instances of the pipeline using the [StopPipelineExecution] API. When you \
   delete a pipeline, all instances of the pipeline are deleted.\n"]

module DeletePartnerApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partner_app_request ->
    ( delete_partner_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partner_app_request ->
    ( delete_partner_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a SageMaker Partner AI App.\n"]

module DeleteOptimizationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_optimization_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_optimization_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an optimization job.\n"]

module DeleteNotebookInstanceLifecycleConfig : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_instance_lifecycle_config_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_instance_lifecycle_config_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a notebook instance lifecycle configuration.\n"]

module DeleteNotebookInstance : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_instance_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes an SageMaker AI notebook instance. Before you can delete a notebook instance, you must \
   call the [StopNotebookInstance] API. \n\n\
  \  When you delete a notebook instance, you lose all of your data. SageMaker AI removes the ML \
   compute instance, and deletes the ML storage volume and the network interface associated with \
   the notebook instance. \n\
  \  \n\
  \   "]

module DeleteMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_monitoring_schedule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does \
   not delete the job execution history of the monitoring schedule. \n"]

module DeleteModelQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_quality_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_quality_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the secified model quality monitoring job definition.\n"]

module DeleteModelPackageGroupPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_group_policy_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_group_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a model group resource policy.\n"]

module DeleteModelPackageGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_group_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_group_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified model group.\n"]

module DeleteModelPackage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_package_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a model package.\n\n\
  \ A model package is used to create SageMaker models or list on Amazon Web Services Marketplace. \
   Buyers can subscribe to model packages listed on Amazon Web Services Marketplace to create \
   models in SageMaker.\n\
  \ "]

module DeleteModelExplainabilityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_explainability_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_explainability_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon SageMaker AI model explainability job definition.\n"]

module DeleteModelCard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_card_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_card_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon SageMaker Model Card.\n"]

module DeleteModelBiasJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_bias_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_bias_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon SageMaker AI model bias job definition.\n"]

module DeleteModel : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a model. The [DeleteModel] API deletes only the model entry that was created in \
   SageMaker when you called the [CreateModel] API. It does not delete model artifacts, inference \
   code, or the IAM role that you specified when creating the model. \n"]

module DeleteMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_mlflow_tracking_server_request ->
    ( delete_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_mlflow_tracking_server_request ->
    ( delete_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an MLflow Tracking Server. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/mlflow-cleanup.html.html}Clean up MLflow \
   resources}.\n"]

module DeleteMlflowApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_mlflow_app_request ->
    ( delete_mlflow_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_mlflow_app_request ->
    ( delete_mlflow_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an MLflow App.\n"]

module DeleteJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a job. This operation is idempotent. If the job is currently running, you must stop it \
   before deleting it by calling [StopJob].\n\n\
  \ The following operations are related to [DeleteJob]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreateJob] \n\
  \            \n\
  \             }\n\
  \        {-   [StopJob] \n\
  \            \n\
  \             }\n\
  \        {-   [DescribeJob] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DeleteInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_inference_experiment_request ->
    ( delete_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_inference_experiment_request ->
    ( delete_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an inference experiment.\n\n\
  \   This operation does not delete your endpoint, variants, or any underlying resources. This \
   operation only deletes the metadata of your experiment. \n\
  \  \n\
  \   "]

module DeleteInferenceComponent : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_inference_component_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_inference_component_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an inference component.\n"]

module DeleteImageVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_version_request ->
    ( delete_image_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_version_request ->
    ( delete_image_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a version of a SageMaker AI image. The container image the version represents isn't \
   deleted.\n"]

module DeleteImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a SageMaker AI image and all versions of the image. The container images aren't deleted.\n"]

module DeleteHyperParameterTuningJob : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hyper_parameter_tuning_job_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hyper_parameter_tuning_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a hyperparameter tuning job. The [DeleteHyperParameterTuningJob] API deletes only the \
   tuning job entry that was created in SageMaker when you called the \
   [CreateHyperParameterTuningJob] API. It does not delete training jobs, artifacts, or the IAM \
   role that you specified when creating the model.\n"]

module DeleteHumanTaskUi : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_human_task_ui_request ->
    ( delete_human_task_ui_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_human_task_ui_request ->
    ( delete_human_task_ui_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to delete a human task user interface (worker task template).\n\n\
  \  To see a list of human task user interfaces (work task templates) in your account, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListHumanTaskUis.html}ListHumanTaskUis}. \
   When you delete a worker task template, it no longer appears when you call [ListHumanTaskUis].\n\
  \ "]

module DeleteHubContentReference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_content_reference_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_content_reference_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a hub content reference in order to remove a model from a private hub.\n"]

module DeleteHubContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_content_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_content_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete the contents of a hub.\n"]

module DeleteHub : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hub_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a hub.\n"]

module DeleteFlowDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_flow_definition_request ->
    ( delete_flow_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_flow_definition_request ->
    ( delete_flow_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified flow definition.\n"]

module DeleteFeatureGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_feature_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_feature_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete the [FeatureGroup] and any data that was written to the [OnlineStore] of the \
   [FeatureGroup]. Data cannot be accessed from the [OnlineStore] immediately after \
   [DeleteFeatureGroup] is called. \n\n\
  \ Data written into the [OfflineStore] will not be deleted. The Amazon Web Services Glue \
   database and tables that are automatically created for your [OfflineStore] are not deleted. \n\
  \ \n\
  \  Note that it can take approximately 10-15 minutes to delete an [OnlineStore] [FeatureGroup] \
   with the [InMemory] [StorageType].\n\
  \  "]

module DeleteExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_experiment_request ->
    ( delete_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_experiment_request ->
    ( delete_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an SageMaker experiment. All trials associated with the experiment must be deleted \
   first. Use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListTrials.html}ListTrials} \
   API to get a list of the trials associated with the experiment.\n"]

module DeleteEndpointConfig : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_config_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_config_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an endpoint configuration. The [DeleteEndpointConfig] API deletes only the specified \
   configuration. It does not delete endpoints created using the configuration. \n\n\
  \ You must not delete an [EndpointConfig] in use by an endpoint that is live or while the \
   [UpdateEndpoint] or [CreateEndpoint] operations are being performed on the endpoint. If you \
   delete the [EndpointConfig] of an endpoint that is active or being created or updated you may \
   lose visibility into the instance type the endpoint is using. The endpoint must be deleted in \
   order to stop incurring charges.\n\
  \ "]

module DeleteEndpoint : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an endpoint. SageMaker frees up all of the resources that were deployed when the \
   endpoint was created. \n\n\
  \ SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't \
   need to use the \
   {{:http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html}RevokeGrant} API \
   call.\n\
  \ \n\
  \  When you delete your endpoint, SageMaker asynchronously deletes associated endpoint resources \
   such as KMS key grants. You might still see these resources in your account for a few minutes \
   after deleting your endpoint. Do not delete or revoke the permissions for your \n\
  \  {[\n\
  \   \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateModel.html#sagemaker-CreateModel-request-ExecutionRoleArn}ExecutionRoleArn} \n\
  \  ]}\n\
  \  , otherwise SageMaker cannot delete these resources.\n\
  \  "]

module DeleteEdgeDeploymentStage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a stage in an edge deployment plan if (and only if) the stage is inactive.\n"]

module DeleteEdgeDeploymentPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_edge_deployment_plan_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_edge_deployment_plan_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an edge deployment plan if (and only if) all the stages in the plan are inactive or \
   there are no stages in the plan.\n"]

module DeleteDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to delete a domain. If you onboarded with IAM mode, you will need to delete your domain to \
   onboard again using IAM Identity Center. Use with caution. All of the members of the domain \
   will lose access to their EFS volume, including data, notebooks, and other artifacts. \n"]

module DeleteDeviceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a fleet.\n"]

module DeleteDataQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_job_definition_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a data quality monitoring job definition.\n"]

module DeleteContext : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_context_request ->
    ( delete_context_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_context_request ->
    ( delete_context_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an context.\n"]

module DeleteComputeQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_compute_quota_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_compute_quota_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the compute allocation from the cluster.\n"]

module DeleteCompilationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_compilation_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_compilation_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified compilation job. This action deletes only the compilation job resource in \
   Amazon SageMaker AI. It doesn't delete other resources that are related to that job, such as \
   the model artifacts that the job creates, the compilation logs in CloudWatch, the compiled \
   model, or the IAM role.\n\n\
  \ You can delete a compilation job only if its current status is [COMPLETED], [FAILED], or \
   [STOPPED]. If the job status is [STARTING] or [INPROGRESS], stop the job, and then delete it \
   after its status becomes [STOPPED].\n\
  \ "]

module DeleteCodeRepository : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_code_repository_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_code_repository_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Git repository from your account.\n"]

module DeleteClusterSchedulerConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_scheduler_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_scheduler_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the cluster policy of the cluster.\n"]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a SageMaker HyperPod cluster.\n"]

module DeleteAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_association_request ->
    ( delete_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_association_request ->
    ( delete_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an association.\n"]

module DeleteArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_artifact_request ->
    ( delete_artifact_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_artifact_request ->
    ( delete_artifact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an artifact. Either [ArtifactArn] or [Source] must be specified.\n"]

module DeleteAppImageConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_image_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_image_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an AppImageConfig.\n"]

module DeleteApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Used to stop and delete an app.\n"]

module DeleteAlgorithm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_algorithm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_algorithm_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified algorithm from your account.\n"]

module DeleteAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_action_request ->
    ( delete_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_action_request ->
    ( delete_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an action.\n"]

module DeleteAIWorkloadConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_workload_config_request ->
    ( delete_ai_workload_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_workload_config_request ->
    ( delete_ai_workload_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified AI workload configuration. You cannot delete a configuration that is \
   referenced by an active benchmark job.\n"]

module DeleteAIRecommendationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_recommendation_job_request ->
    ( delete_ai_recommendation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_recommendation_job_request ->
    ( delete_ai_recommendation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified AI recommendation job.\n"]

module DeleteAIBenchmarkJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_benchmark_job_request ->
    ( delete_ai_benchmark_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ai_benchmark_job_request ->
    ( delete_ai_benchmark_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified AI benchmark job.\n"]

module CreateWorkteam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workteam_request ->
    ( create_workteam_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workteam_request ->
    ( create_workteam_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new work team for labeling your data. A work team is defined by one or more Amazon \
   Cognito user pools. You must first create the user pools before you can create a work team.\n\n\
  \ You cannot create more than 25 work teams in an account and region.\n\
  \ "]

module CreateWorkforce : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workforce_request ->
    (create_workforce_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workforce_request ->
    ( create_workforce_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to create a workforce. This operation will return an error if a workforce \
   already exists in the Amazon Web Services Region that you specify. You can only create one \
   workforce in each Amazon Web Services Region per Amazon Web Services account.\n\n\
  \ If you want to create a new workforce in an Amazon Web Services Region where a workforce \
   already exists, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteWorkforce.html}DeleteWorkforce} \
   API operation to delete the existing workforce and then use [CreateWorkforce] to create a new \
   workforce.\n\
  \ \n\
  \  To create a private workforce using Amazon Cognito, you must specify a Cognito user pool in \
   [CognitoConfig]. You can also create an Amazon Cognito workforce using the Amazon SageMaker \
   console. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html} Create a \
   Private Workforce (Amazon Cognito)}.\n\
  \  \n\
  \   To create a private workforce using your own OIDC Identity Provider (IdP), specify your IdP \
   configuration in [OidcConfig]. Your OIDC IdP must support {i groups} because groups are used by \
   Ground Truth and Amazon A2I to create work teams. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private-oidc.html} \
   Create a Private Workforce (OIDC IdP)}.\n\
  \   "]

module CreateUserProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_profile_request ->
    ( create_user_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_profile_request ->
    ( create_user_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a user profile. A user profile represents a single user within a domain, and is the \
   main way to reference a \"person\" for the purposes of sharing, reporting, and other \
   user-oriented features. This entity is created when a user onboards to a domain. If an \
   administrator invites a person by email or imports them from IAM Identity Center, a user \
   profile is automatically created. A user profile is the primary holder of settings for an \
   individual user and has a reference to the user's private Amazon Elastic File System home \
   directory. \n"]

module CreateTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trial_component_request ->
    ( create_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trial_component_request ->
    ( create_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a {i trial component}, which is a stage of a machine learning {i trial}. A trial is \
   composed of one or more trial components. A trial component can be used in multiple trials.\n\n\
  \ Trial components include pre-processing jobs, training jobs, and batch transform jobs.\n\
  \ \n\
  \  When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and trial \
   components are automatically tracked, logged, and indexed. When you use the Amazon Web Services \
   SDK for Python (Boto), you must use the logging APIs provided by the SDK.\n\
  \  \n\
  \   You can add tags to a trial component and then use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_Search.html}Search} API to \
   search for the tags.\n\
  \   "]

module CreateTrial : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trial_request ->
    ( create_trial_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trial_request ->
    ( create_trial_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an SageMaker {i trial}. A trial is a set of steps called {i trial components} that \
   produce a machine learning model. A trial is part of a single SageMaker {i experiment}.\n\n\
  \ When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and trial \
   components are automatically tracked, logged, and indexed. When you use the Amazon Web Services \
   SDK for Python (Boto), you must use the logging APIs provided by the SDK.\n\
  \ \n\
  \  You can add tags to a trial and then use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_Search.html}Search} API to \
   search for the tags.\n\
  \  \n\
  \   To get a list of all your trials, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListTrials.html}ListTrials} \
   API. To view a trial's properties, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeTrial.html}DescribeTrial} \
   API. To create a trial component, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateTrialComponent.html}CreateTrialComponent} \
   API.\n\
  \   "]

module CreateTransformJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_transform_job_request ->
    ( create_transform_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_transform_job_request ->
    ( create_transform_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a transform job. A transform job uses a trained model to get inferences on a dataset and \
   saves these results to an Amazon S3 location that you specify.\n\n\
  \ To perform batch transformations, you create a transform job and use the data that you have \
   readily available.\n\
  \ \n\
  \  In the request body, you provide the following:\n\
  \  \n\
  \   {ul\n\
  \         {-   [TransformJobName] - Identifies the transform job. The name must be unique within \
   an Amazon Web Services Region in an Amazon Web Services account.\n\
  \             \n\
  \              }\n\
  \         {-   [ModelName] - Identifies the model to use. [ModelName] must be the name of an \
   existing Amazon SageMaker model in the same Amazon Web Services Region and Amazon Web Services \
   account. For information on creating a model, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateModel.html}CreateModel}.\n\
  \             \n\
  \              }\n\
  \         {-   [TransformInput] - Describes the dataset to be transformed and the Amazon S3 \
   location where it is stored.\n\
  \             \n\
  \              }\n\
  \         {-   [TransformOutput] - Identifies the Amazon S3 location where you want Amazon \
   SageMaker to save the results from the transform job.\n\
  \             \n\
  \              }\n\
  \         {-   [TransformResources] - Identifies the ML compute instances and AMI image versions \
   for the transform job.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information about how batch transformation works, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html}Batch Transform}.\n\
  \   "]

module CreateTrainingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_training_plan_request ->
    ( create_training_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_training_plan_request ->
    ( create_training_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new training plan in SageMaker to reserve compute capacity.\n\n\
  \ Amazon SageMaker Training Plan is a capability within SageMaker that allows customers to \
   reserve and manage GPU capacity for large-scale AI model training. It provides a way to secure \
   predictable access to computational resources within specific timelines and budgets, without \
   the need to manage underlying infrastructure. \n\
  \ \n\
  \   {b How it works} \n\
  \  \n\
  \   Plans can be created for specific resources such as SageMaker Training Jobs or SageMaker \
   HyperPod clusters, automatically provisioning resources, setting up infrastructure, executing \
   workloads, and handling infrastructure failures.\n\
  \   \n\
  \     {b Plan creation workflow} \n\
  \    \n\
  \     {ul\n\
  \           {-  Users search for available plan offerings based on their requirements (e.g., \
   instance type, count, start time, duration) using the \n\
  \               {[\n\
  \                \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_SearchTrainingPlanOfferings.html}SearchTrainingPlanOfferings} \n\
  \               ]}\n\
  \                API operation.\n\
  \               \n\
  \                }\n\
  \           {-  They create a plan that best matches their needs using the ID of the plan \
   offering they want to use. \n\
  \               \n\
  \                }\n\
  \           {-  After successful upfront payment, the plan's status becomes [Scheduled]. \n\
  \               \n\
  \                }\n\
  \           {-  The plan can be used to:\n\
  \               \n\
  \                {ul\n\
  \                      {-  Queue training jobs.\n\
  \                          \n\
  \                           }\n\
  \                      {-  Allocate to an instance group of a SageMaker HyperPod cluster. \n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           {-  When the plan start date arrives, it becomes [Active]. Based on available \
   reserved capacity:\n\
  \               \n\
  \                {ul\n\
  \                      {-  Training jobs are launched.\n\
  \                          \n\
  \                           }\n\
  \                      {-  Instance groups are provisioned.\n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           }\n\
  \    {b Plan composition} \n\
  \   \n\
  \    A plan can consist of one or more Reserved Capacities, each defined by a specific instance \
   type, quantity, Availability Zone, duration, and start and end times. For more information \
   about Reserved Capacity, see \n\
  \    {[\n\
  \     \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ReservedCapacitySummary.html}ReservedCapacitySummary} \n\
  \    ]}\n\
  \    .\n\
  \    "]

module CreateTrainingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_training_job_request ->
    ( create_training_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_training_job_request ->
    ( create_training_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a model training job. After training completes, SageMaker saves the resulting model \
   artifacts to an Amazon S3 location that you specify. \n\n\
  \ If you choose to host your model using SageMaker hosting services, you can use the resulting \
   model artifacts as part of the model. You can also use the artifacts in a machine learning \
   service other than SageMaker, provided that you know how to use them for inference. \n\
  \ \n\
  \  In the request body, you provide the following: \n\
  \  \n\
  \   {ul\n\
  \         {-   [AlgorithmSpecification] - Identifies the training algorithm to use. \n\
  \             \n\
  \              }\n\
  \         {-   [HyperParameters] - Specify these algorithm-specific parameters to enable the \
   estimation of model parameters during training. Hyperparameters can be tuned to optimize this \
   learning process. For a list of hyperparameters for each training algorithm provided by \
   SageMaker, see {{:https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html}Algorithms}. \n\
  \             \n\
  \               Do not include any security-sensitive information including account access IDs, \
   secrets, or tokens in any hyperparameter fields. As part of the shared responsibility model, \
   you are responsible for any potential exposure, unauthorized access, or compromise of your \
   sensitive data if caused by security-sensitive information included in the request \
   hyperparameter variable or plain text fields.\n\
  \               \n\
  \                 }\n\
  \         {-   [InputDataConfig] - Describes the input required by the training job and the \
   Amazon S3, EFS, or FSx location where it is stored.\n\
  \             \n\
  \              }\n\
  \         {-   [OutputDataConfig] - Identifies the Amazon S3 bucket where you want SageMaker to \
   save the results of model training. \n\
  \             \n\
  \              }\n\
  \         {-   [ResourceConfig] - Identifies the resources, ML compute instances, and ML storage \
   volumes to deploy for model training. In distributed training, you specify more than one \
   instance. \n\
  \             \n\
  \              }\n\
  \         {-   [EnableManagedSpotTraining] - Optimize the cost of training machine learning \
   models by up to 80% by using Amazon EC2 Spot instances. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html}Managed \
   Spot Training}. \n\
  \             \n\
  \              }\n\
  \         {-   [RoleArn] - The Amazon Resource Name (ARN) that SageMaker assumes to perform \
   tasks on your behalf during model training. You must grant this role the necessary permissions \
   so that SageMaker can successfully complete model training. \n\
  \             \n\
  \              }\n\
  \         {-   [StoppingCondition] - To help cap training costs, use [MaxRuntimeInSeconds] to \
   set a time limit for training. Use [MaxWaitTimeInSeconds] to specify how long a managed spot \
   training job has to complete. \n\
  \             \n\
  \              }\n\
  \         {-   [Environment] - The environment variables to set in the Docker container.\n\
  \             \n\
  \               Do not include any security-sensitive information including account access IDs, \
   secrets, or tokens in any environment fields. As part of the shared responsibility model, you \
   are responsible for any potential exposure, unauthorized access, or compromise of your \
   sensitive data if caused by security-sensitive information included in the request environment \
   variable or plain text fields.\n\
  \               \n\
  \                 }\n\
  \         {-   [RetryStrategy] - The number of times to retry the job when the job fails due to \
   an [InternalServerError].\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    For more information about SageMaker, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html}How It Works}. \n\
  \   "]

module CreateStudioLifecycleConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_studio_lifecycle_config_request ->
    ( create_studio_lifecycle_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_studio_lifecycle_config_request ->
    ( create_studio_lifecycle_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Amazon SageMaker AI Studio Lifecycle Configuration.\n"]

module CreateSpace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_space_request ->
    ( create_space_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_space_request ->
    ( create_space_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a private space or a space used for real time collaboration in a domain.\n"]

module CreateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_input ->
    ( create_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_input ->
    ( create_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a machine learning (ML) project that can contain one or more templates that set up an \
   ML pipeline from training to deploying an approved model.\n"]

module CreateProcessingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_processing_job_request ->
    ( create_processing_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_processing_job_request ->
    ( create_processing_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a processing job.\n"]

module CreatePresignedNotebookInstanceUrl : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_notebook_instance_url_input ->
    (create_presigned_notebook_instance_url_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_notebook_instance_url_input ->
    ( create_presigned_notebook_instance_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In \
   the SageMaker AI console, when you choose [Open] next to a notebook instance, SageMaker AI \
   opens a new tab showing the Jupyter server home page from the notebook instance. The console \
   uses this API to get the URL and show the page.\n\n\
  \  The IAM role or user used to call this API defines the permissions to access the notebook \
   instance. Once the presigned URL is created, no additional permission is required to access \
   this URL. IAM authorization policies for this API are also enforced for every HTTP request and \
   WebSocket frame that attempts to connect to the notebook instance.\n\
  \ \n\
  \  You can restrict access to this API and to the URL that it returns to a list of IP addresses \
   that you specify. Use the [NotIpAddress] condition operator and the [aws:SourceIP] condition \
   context key to specify the list of IP addresses that you want to have access to the notebook \
   instance. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter}Limit \
   Access to a Notebook Instance by IP Address}.\n\
  \  \n\
  \    The URL that you get from a call to \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreatePresignedNotebookInstanceUrl.html}CreatePresignedNotebookInstanceUrl} \
   is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you \
   are directed to the Amazon Web Services console sign-in page.\n\
  \    \n\
  \     "]

module CreatePresignedMlflowTrackingServerUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_mlflow_tracking_server_url_request ->
    ( create_presigned_mlflow_tracking_server_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_mlflow_tracking_server_url_request ->
    ( create_presigned_mlflow_tracking_server_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a presigned URL that you can use to connect to the MLflow UI attached to your tracking \
   server. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/mlflow-launch-ui.html}Launch the MLflow UI \
   using a presigned URL}.\n"]

module CreatePresignedMlflowAppUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_mlflow_app_url_request ->
    ( create_presigned_mlflow_app_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_mlflow_app_url_request ->
    ( create_presigned_mlflow_app_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a presigned URL that you can use to connect to the MLflow UI attached to your MLflow \
   App. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/mlflow-launch-ui.html}Launch the MLflow UI \
   using a presigned URL}.\n"]

module CreatePresignedDomainUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_domain_url_request ->
    ( create_presigned_domain_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_domain_url_request ->
    ( create_presigned_domain_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user \
   will be automatically signed in to the domain, and granted access to all of the Apps and files \
   associated with the Domain's Amazon Elastic File System volume. This operation can only be \
   called when the authentication mode equals IAM. \n\n\
  \ The IAM role or user passed to this API defines the permissions to access the app. Once the \
   presigned URL is created, no additional permission is required to access this URL. IAM \
   authorization policies for this API are also enforced for every HTTP request and WebSocket \
   frame that attempts to connect to the app.\n\
  \ \n\
  \  You can restrict access to this API and to the URL that it returns to a list of IP addresses, \
   Amazon VPCs or Amazon VPC Endpoints that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/studio-interface-endpoint.html}Connect to \
   Amazon SageMaker AI Studio Through an Interface VPC Endpoint} .\n\
  \  \n\
  \    {ul\n\
  \          {-  The URL that you get from a call to [CreatePresignedDomainUrl] has a default \
   timeout of 5 minutes. You can configure this value using [ExpiresInSeconds]. If you try to use \
   the URL after the timeout limit expires, you are directed to the Amazon Web Services console \
   sign-in page.\n\
  \              \n\
  \               }\n\
  \          {-  The JupyterLab session default expiration time is 12 hours. You can configure \
   this value using SessionExpirationDurationInSeconds.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_request ->
    ( create_pipeline_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_request ->
    ( create_pipeline_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a pipeline using a JSON pipeline definition.\n"]

module CreatePartnerAppPresignedUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partner_app_presigned_url_request ->
    ( create_partner_app_presigned_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partner_app_presigned_url_request ->
    ( create_partner_app_presigned_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a presigned URL to access an Amazon SageMaker Partner AI App.\n"]

module CreatePartnerApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partner_app_request ->
    ( create_partner_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partner_app_request ->
    ( create_partner_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Amazon SageMaker Partner AI App.\n"]

module CreateOptimizationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_optimization_job_request ->
    ( create_optimization_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_optimization_job_request ->
    ( create_optimization_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a job that optimizes a model for inference performance. To create the job, you provide \
   the location of a source model, and you provide the settings for the optimization techniques \
   that you want the job to apply. When the job completes successfully, SageMaker uploads the new \
   optimized model to the output destination that you specify.\n\n\
  \ For more information about how to use this action, and about the supported optimization \
   techniques, see {{:https://docs.aws.amazon.com/sagemaker/latest/dg/model-optimize.html}Optimize \
   model inference with Amazon SageMaker}.\n\
  \ "]

module CreateNotebookInstanceLifecycleConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_instance_lifecycle_config_input ->
    ( create_notebook_instance_lifecycle_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_instance_lifecycle_config_input ->
    ( create_notebook_instance_lifecycle_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a lifecycle configuration that you can associate with a notebook instance. A {i \
   lifecycle configuration} is a collection of shell scripts that run when you create or start a \
   notebook instance.\n\n\
  \ Each lifecycle configuration script has a limit of 16384 characters.\n\
  \ \n\
  \  The value of the [$PATH] environment variable that is available to both scripts is \
   [/sbin:bin:/usr/sbin:/usr/bin].\n\
  \  \n\
  \   View Amazon CloudWatch Logs for notebook instance lifecycle configurations in log group \
   [/aws/sagemaker/NotebookInstances] in log stream \
   [\\[notebook-instance-name\\]/\\[LifecycleConfigHook\\]].\n\
  \   \n\
  \    Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for \
   longer than 5 minutes, it fails and the notebook instance is not created or started.\n\
  \    \n\
  \     For information about notebook instance lifestyle configurations, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html}Step 2.1: \
   (Optional) Customize a Notebook Instance}.\n\
  \     \n\
  \       Lifecycle configuration scripts execute with root access and the notebook instance's IAM \
   execution role privileges. Grant this permission only to trusted principals. See \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html}Customize a \
   Notebook Instance Using a Lifecycle Configuration Script} for security best practices.\n\
  \       \n\
  \        "]

module CreateNotebookInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_instance_input ->
    ( create_notebook_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_instance_input ->
    ( create_notebook_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an SageMaker AI notebook instance. A notebook instance is a machine learning (ML) \
   compute instance running on a Jupyter notebook. \n\n\
  \ In a [CreateNotebookInstance] request, specify the type of ML compute instance that you want \
   to run. SageMaker AI launches the instance, installs common libraries that you can use to \
   explore datasets for model training, and attaches an ML storage volume to the notebook \
   instance. \n\
  \ \n\
  \  SageMaker AI also provides a set of example notebooks. Each notebook demonstrates how to use \
   SageMaker AI with a specific algorithm or with a machine learning framework. \n\
  \  \n\
  \   After receiving the request, SageMaker AI does the following:\n\
  \   \n\
  \    {ol\n\
  \          {-  Creates a network interface in the SageMaker AI VPC.\n\
  \              \n\
  \               }\n\
  \          {-  (Option) If you specified [SubnetId], SageMaker AI creates a network interface in \
   your own VPC, which is inferred from the subnet ID that you provide in the input. When creating \
   this network interface, SageMaker AI attaches the security group that you specified in the \
   request to the network interface that it creates in your VPC.\n\
  \              \n\
  \               }\n\
  \          {-  Launches an EC2 instance of the type specified in the request in the SageMaker AI \
   VPC. If you specified [SubnetId] of your VPC, SageMaker AI specifies both network interfaces \
   when launching this instance. This enables inbound traffic from your own VPC to the notebook \
   instance, assuming that the security groups allow it.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   After creating the notebook instance, SageMaker AI returns its Amazon Resource Name (ARN). \
   You can't change the name of a notebook instance after you create it.\n\
  \   \n\
  \    After SageMaker AI creates the notebook instance, you can connect to the Jupyter server and \
   work in Jupyter notebooks. For example, you can write code to explore a dataset that you can \
   use for model training, train a model, host models by creating SageMaker AI endpoints, and \
   validate hosted models. \n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html}How It Works}. \n\
  \     "]

module CreateMonitoringSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_monitoring_schedule_request ->
    ( create_monitoring_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_monitoring_schedule_request ->
    ( create_monitoring_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a schedule that regularly starts Amazon SageMaker AI Processing Jobs to monitor the \
   data captured for an Amazon SageMaker AI Endpoint.\n"]

module CreateModelQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_quality_job_definition_request ->
    ( create_model_quality_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_quality_job_definition_request ->
    ( create_model_quality_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a definition for a job that monitors model quality and drift. For information about \
   model monitor, see {{:https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html}Amazon \
   SageMaker AI Model Monitor}.\n"]

module CreateModelPackageGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_package_group_input ->
    ( create_model_package_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_package_group_input ->
    ( create_model_package_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a model group. A model group contains a group of model versions.\n"]

module CreateModelPackage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_package_input ->
    ( create_model_package_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_package_input ->
    ( create_model_package_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a model package that you can use to create SageMaker models or list on Amazon Web \
   Services Marketplace, or a versioned model that is part of a model group. Buyers can subscribe \
   to model packages listed on Amazon Web Services Marketplace to create models in SageMaker.\n\n\
  \ To create a model package by specifying a Docker container that contains your inference code \
   and the Amazon S3 location of your model artifacts, provide values for \
   [InferenceSpecification]. To create a model from an algorithm resource that you created or \
   subscribed to in Amazon Web Services Marketplace, provide a value for \
   [SourceAlgorithmSpecification].\n\
  \ \n\
  \   There are two types of model packages:\n\
  \   \n\
  \    {ul\n\
  \          {-  Versioned - a model that is part of a model group in the model registry.\n\
  \              \n\
  \               }\n\
  \          {-  Unversioned - a model package that is not part of a model group.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateModelExplainabilityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_explainability_job_definition_request ->
    ( create_model_explainability_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_explainability_job_definition_request ->
    ( create_model_explainability_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the definition for a model explainability job.\n"]

module CreateModelCardExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_card_export_job_request ->
    ( create_model_card_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_card_export_job_request ->
    ( create_model_card_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Amazon SageMaker Model Card export job.\n"]

module CreateModelCard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_card_request ->
    ( create_model_card_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_card_request ->
    ( create_model_card_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon SageMaker Model Card.\n\n\
  \ For information about how to use model cards, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/model-cards.html}Amazon SageMaker Model \
   Card}.\n\
  \ "]

module CreateModelBiasJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_bias_job_definition_request ->
    ( create_model_bias_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_bias_job_definition_request ->
    ( create_model_bias_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the definition for a model bias job.\n"]

module CreateModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_input ->
    ( create_model_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_input ->
    ( create_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a model in SageMaker. In the request, you name the model and describe a primary \
   container. For the primary container, you specify the Docker image that contains inference \
   code, artifacts (from prior training), and a custom environment map that the inference code \
   uses when you deploy the model for predictions.\n\n\
  \ Use this API to create a model if you want to use SageMaker hosting services or run a batch \
   transform job.\n\
  \ \n\
  \  To host your model, you create an endpoint configuration with the [CreateEndpointConfig] API, \
   and then create an endpoint with the [CreateEndpoint] API. SageMaker then deploys all of the \
   containers that you defined for the model in the hosting environment. \n\
  \  \n\
  \   To run a batch transform using your model, you start a job with the [CreateTransformJob] \
   API. SageMaker uses your model and your dataset to get inferences which are then saved to a \
   specified S3 location.\n\
  \   \n\
  \    In the request, you also provide an IAM role that SageMaker can assume to access model \
   artifacts and docker image for deployment on ML compute hosting instances or for batch \
   transform jobs. In addition, you also use the IAM role to manage permissions the inference code \
   needs. For example, if the inference code access any other Amazon Web Services resources, you \
   grant necessary permissions via this role.\n\
  \    "]

module CreateMlflowTrackingServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_mlflow_tracking_server_request ->
    ( create_mlflow_tracking_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_mlflow_tracking_server_request ->
    ( create_mlflow_tracking_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an MLflow Tracking Server using a general purpose Amazon S3 bucket as the artifact \
   store. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/mlflow-create-tracking-server.html}Create an \
   MLflow Tracking Server}.\n"]

module CreateMlflowApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_mlflow_app_request ->
    ( create_mlflow_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_mlflow_app_request ->
    ( create_mlflow_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an MLflow Tracking Server using a general purpose Amazon S3 bucket as the artifact store.\n"]

module CreateLabelingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_labeling_job_request ->
    ( create_labeling_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_labeling_job_request ->
    ( create_labeling_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a job that uses workers to label the data objects in your input dataset. You can use \
   the labeled data to train machine learning models. \n\n\
  \ You can select your workforce from one of three providers:\n\
  \ \n\
  \  {ul\n\
  \        {-  A private workforce that you create. It can include employees, contractors, and \
   outside experts. Use a private workforce when want the data to stay within your organization or \
   when a specific set of skills is required.\n\
  \            \n\
  \             }\n\
  \        {-  One or more vendors that you select from the Amazon Web Services Marketplace. \
   Vendors provide expertise in specific areas. \n\
  \            \n\
  \             }\n\
  \        {-  The Amazon Mechanical Turk workforce. This is the largest workforce, but it should \
   only be used for public data or data that has been stripped of any personally identifiable \
   information.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can also use {i automated data labeling} to reduce the number of data objects that need \
   to be labeled by a human. Automated data labeling uses {i active learning} to determine if a \
   data object can be labeled by machine or if it needs to be sent to a human worker. For more \
   information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html}Using Automated \
   Data Labeling}.\n\
  \   \n\
  \    The data objects to be labeled are contained in an Amazon S3 bucket. You create a {i \
   manifest file} that describes the location of each object. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html}Using Input and Output Data}.\n\
  \    \n\
  \     The output can be used as the manifest file for another labeling job or as training data \
   for your machine learning models.\n\
  \     \n\
  \      You can use this operation to create a static labeling job or a streaming labeling job. A \
   static labeling job stops if all data objects in the input manifest file identified in \
   [ManifestS3Uri] have been labeled. A streaming labeling job runs perpetually until it is \
   manually stopped, or remains idle for 10 days. You can send new data objects to an active \
   ([InProgress]) streaming labeling job in real time. To learn how to create a static labeling \
   job, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-create-labeling-job-api.html}Create a \
   Labeling Job (API) } in the Amazon SageMaker Developer Guide. To learn how to create a \
   streaming labeling job, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sms-streaming-create-job.html}Create a \
   Streaming Labeling Job}.\n\
  \      "]

module CreateJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a model customization job in Amazon SageMaker. A job runs a workload based on the job \
   category and configuration you provide. You specify the job category, a schema-versioned \
   configuration document, and an IAM role that grants Amazon SageMaker permission to access \
   resources on your behalf.\n\n\
  \ Use the [AgentRFT] category to fine-tune a model using multi-turn reinforcement learning with \
   reward signals. Use the [AgentRFTEvaluation] category to evaluate a fine-tuned or base model by \
   running multi-turn rollouts against a held-out prompt dataset and computing metrics such as \
   pass\\@k and mean reward.\n\
  \ \n\
  \  Before creating a job, call [ListJobSchemaVersions] and [DescribeJobSchemaVersion] to \
   retrieve the configuration schema for your job category. The [JobConfigDocument] must conform \
   to the schema specified by [JobConfigSchemaVersion].\n\
  \  \n\
  \   The following operations are related to [CreateJob]:\n\
  \   \n\
  \    {ul\n\
  \          {-   [DescribeJob] \n\
  \              \n\
  \               }\n\
  \          {-   [ListJobs] \n\
  \              \n\
  \               }\n\
  \          {-   [StopJob] \n\
  \              \n\
  \               }\n\
  \          {-   [DeleteJob] \n\
  \              \n\
  \               }\n\
  \          {-   [ListJobSchemaVersions] \n\
  \              \n\
  \               }\n\
  \          {-   [DescribeJobSchemaVersion] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateInferenceRecommendationsJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_inference_recommendations_job_request ->
    ( create_inference_recommendations_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_inference_recommendations_job_request ->
    ( create_inference_recommendations_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a recommendation job. You can create either an instance recommendation or load test job.\n"]

module CreateInferenceExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_inference_experiment_request ->
    ( create_inference_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_inference_experiment_request ->
    ( create_inference_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates an inference experiment using the configurations specified in the request. \n\n\
  \  Use this API to setup and schedule an experiment to compare model variants on a Amazon \
   SageMaker inference endpoint. For more information about inference experiments, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/shadow-tests.html}Shadow tests}. \n\
  \ \n\
  \   Amazon SageMaker begins your experiment at the scheduled time and routes traffic to your \
   endpoint's model variants based on your specified configuration. \n\
  \  \n\
  \    While the experiment is in progress or after it has concluded, you can view metrics that \
   compare your model variants. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/shadow-tests-view-monitor-edit.html}View, \
   monitor, and edit shadow tests}. \n\
  \   "]

module CreateInferenceComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_inference_component_input ->
    ( create_inference_component_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_inference_component_input ->
    ( create_inference_component_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an inference component, which is a SageMaker AI hosting object that you can use to \
   deploy a model to an endpoint. In the inference component settings, you specify the model, the \
   endpoint, and how the model utilizes the resources that the endpoint hosts. You can optimize \
   resource utilization by tailoring how the required CPU cores, accelerators, and memory are \
   allocated. You can deploy multiple inference components to an endpoint, where each inference \
   component contains one model and the resource utilization needs for that individual model. \
   After you deploy an inference component, you can directly invoke the associated model when you \
   use the InvokeEndpoint API action.\n"]

module CreateImageVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_version_request ->
    ( create_image_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_version_request ->
    ( create_image_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a version of the SageMaker AI image specified by [ImageName]. The version represents \
   the Amazon ECR container image specified by [BaseImage].\n"]

module CreateImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_request ->
    ( create_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_request ->
    ( create_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a custom SageMaker AI image. A SageMaker AI image is a set of image versions. Each \
   image version represents a container image stored in Amazon ECR. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/studio-byoi.html}Bring your own SageMaker AI \
   image}.\n"]

module CreateHyperParameterTuningJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hyper_parameter_tuning_job_request ->
    ( create_hyper_parameter_tuning_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hyper_parameter_tuning_job_request ->
    ( create_hyper_parameter_tuning_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a \
   model by running many training jobs on your dataset using the algorithm you choose and values \
   for hyperparameters within ranges that you specify. It then chooses the hyperparameter values \
   that result in a model that performs the best, as measured by an objective metric that you \
   choose.\n\n\
  \ A hyperparameter tuning job automatically creates Amazon SageMaker experiments, trials, and \
   trial components for each training job that it runs. You can view these entities in Amazon \
   SageMaker Studio. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/experiments-view-compare.html#experiments-view}View \
   Experiments, Trials, and Trial Components}.\n\
  \ \n\
  \   Do not include any security-sensitive information including account access IDs, secrets, or \
   tokens in any hyperparameter fields. As part of the shared responsibility model, you are \
   responsible for any potential exposure, unauthorized access, or compromise of your sensitive \
   data if caused by any security-sensitive information included in the request hyperparameter \
   variable or plain text fields..\n\
  \   \n\
  \    "]

module CreateHumanTaskUi : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_human_task_ui_request ->
    ( create_human_task_ui_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_human_task_ui_request ->
    ( create_human_task_ui_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines the settings you will use for the human review workflow user interface. Reviewers will \
   see a three-panel interface with an instruction area, the item to review, and an input area.\n"]

module CreateHubContentReference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hub_content_reference_request ->
    ( create_hub_content_reference_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hub_content_reference_request ->
    ( create_hub_content_reference_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a hub content reference in order to add a model in the JumpStart public hub to a private \
   hub.\n"]

module CreateHubContentPresignedUrls : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hub_content_presigned_urls_request ->
    (create_hub_content_presigned_urls_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hub_content_presigned_urls_request ->
    ( create_hub_content_presigned_urls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates presigned URLs for accessing hub content artifacts. This operation generates \
   time-limited, secure URLs that allow direct download of model artifacts and associated files \
   from Amazon SageMaker hub content, including gated models that require end-user license \
   agreement acceptance.\n"]

module CreateHub : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hub_request ->
    ( create_hub_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hub_request ->
    ( create_hub_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Create a hub.\n"]

module CreateFlowDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_flow_definition_request ->
    ( create_flow_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_flow_definition_request ->
    ( create_flow_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a flow definition.\n"]

module CreateFeatureGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_feature_group_request ->
    ( create_feature_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_feature_group_request ->
    ( create_feature_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a new [FeatureGroup]. A [FeatureGroup] is a group of [Features] defined in the \
   [FeatureStore] to describe a [Record]. \n\n\
  \ The [FeatureGroup] defines the schema and features contained in the [FeatureGroup]. A \
   [FeatureGroup] definition is composed of a list of [Features], a [RecordIdentifierFeatureName], \
   an [EventTimeFeatureName] and configurations for its [OnlineStore] and [OfflineStore]. Check \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}Amazon Web Services \
   service quotas} to see the [FeatureGroup]s quota for your Amazon Web Services account.\n\
  \ \n\
  \  Note that it can take approximately 10-15 minutes to provision an [OnlineStore] \
   [FeatureGroup] with the [InMemory] [StorageType].\n\
  \  \n\
  \    You must include at least one of [OnlineStoreConfig] and [OfflineStoreConfig] to create a \
   [FeatureGroup].\n\
  \    \n\
  \     "]

module CreateExperiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_experiment_request ->
    ( create_experiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_experiment_request ->
    ( create_experiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a SageMaker {i experiment}. An experiment is a collection of {i trials} that are \
   observed, compared and evaluated as a group. A trial is a set of steps, called {i trial \
   components}, that produce a machine learning model.\n\n\
  \  In the Studio UI, trials are referred to as {i run groups} and trial components are referred \
   to as {i runs}.\n\
  \  \n\
  \    The goal of an experiment is to determine the components that produce the best model. \
   Multiple trials are performed, each one isolating and measuring the impact of a change to one \
   or more inputs, while keeping the remaining inputs constant.\n\
  \    \n\
  \     When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and \
   trial components are automatically tracked, logged, and indexed. When you use the Amazon Web \
   Services SDK for Python (Boto), you must use the logging APIs provided by the SDK.\n\
  \     \n\
  \      You can add tags to experiments, trials, trial components and then use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_Search.html}Search} API to \
   search for the tags.\n\
  \      \n\
  \       To add a description to an experiment, specify the optional [Description] parameter. To \
   add a description later, or to change the description, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_UpdateExperiment.html}UpdateExperiment} \
   API.\n\
  \       \n\
  \        To get a list of all your experiments, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListExperiments.html}ListExperiments} \
   API. To view an experiment's properties, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeExperiment.html}DescribeExperiment} \
   API. To get a list of all the trials associated with an experiment, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListTrials.html}ListTrials} \
   API. To create a trial call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateTrial.html}CreateTrial} \
   API.\n\
  \        "]

module CreateEndpointConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_config_input ->
    ( create_endpoint_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_config_input ->
    ( create_endpoint_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an endpoint configuration that SageMaker hosting services uses to deploy models. In the \
   configuration, you identify one or more models, created using the [CreateModel] API, to deploy \
   and the resources that you want SageMaker to provision. Then you call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint} \
   API.\n\n\
  \   Use this API if you want to use SageMaker hosting services to deploy models into production. \n\
  \  \n\
  \    In the request, you define a [ProductionVariant], for each model that you want to deploy. \
   Each [ProductionVariant] parameter also describes the resources that you want SageMaker to \
   provision. This includes the number and type of ML compute instances to deploy. \n\
  \    \n\
  \     If you are hosting multiple models, you also assign a [VariantWeight] to specify how much \
   traffic you want to allocate to each model. For example, suppose that you want to host two \
   models, A and B, and you assign traffic weight 2 for model A and 1 for model B. SageMaker \
   distributes two-thirds of the traffic to Model A, and one-third to model B. \n\
  \     \n\
  \       When you call \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint}, \
   a load call is made to DynamoDB to verify that your endpoint configuration exists. When you \
   read data from a DynamoDB table supporting \
   {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} \
   [Eventually Consistent Reads] }, the response might not reflect the results of a recently \
   completed write operation. The response might include some stale data. If the dependent \
   entities are not yet in DynamoDB, this causes a validation error. If you repeat your read \
   request after a short time, the response should return the latest data. So retry logic is \
   recommended to handle these possible issues. We also recommend that customers call \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeEndpointConfig.html}DescribeEndpointConfig} \
   before calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint} \
   to minimize the potential impact of a DynamoDB eventually consistent read.\n\
  \       \n\
  \        "]

module CreateEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_input ->
    ( create_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_input ->
    ( create_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an endpoint using the endpoint configuration specified in the request. SageMaker uses \
   the endpoint to provision resources and deploy models. You create the endpoint configuration \
   with the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpointConfig.html}CreateEndpointConfig} \
   API. \n\n\
  \  Use this API to deploy models using SageMaker hosting services. \n\
  \ \n\
  \    You must not delete an [EndpointConfig] that is in use by an endpoint that is live or while \
   the [UpdateEndpoint] or [CreateEndpoint] operations are being performed on the endpoint. To \
   update an endpoint, you must create a new [EndpointConfig].\n\
  \   \n\
  \     The endpoint name must be unique within an Amazon Web Services Region in your Amazon Web \
   Services account. \n\
  \     \n\
  \      When it receives the request, SageMaker creates the endpoint, launches the resources (ML \
   compute instances), and deploys the model(s) on them. \n\
  \      \n\
  \        When you call \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint}, \
   a load call is made to DynamoDB to verify that your endpoint configuration exists. When you \
   read data from a DynamoDB table supporting \
   {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} \
   [Eventually Consistent Reads] }, the response might not reflect the results of a recently \
   completed write operation. The response might include some stale data. If the dependent \
   entities are not yet in DynamoDB, this causes a validation error. If you repeat your read \
   request after a short time, the response should return the latest data. So retry logic is \
   recommended to handle these possible issues. We also recommend that customers call \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeEndpointConfig.html}DescribeEndpointConfig} \
   before calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint} \
   to minimize the potential impact of a DynamoDB eventually consistent read.\n\
  \        \n\
  \          When SageMaker receives the request, it sets the endpoint status to [Creating]. After \
   it creates the endpoint, it sets the status to [InService]. SageMaker can then process incoming \
   requests for inferences. To check the status of an endpoint, use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeEndpoint.html}DescribeEndpoint} \
   API.\n\
  \          \n\
  \           If any of the models hosted at this endpoint get model data from an Amazon S3 \
   location, SageMaker uses Amazon Web Services Security Token Service to download model artifacts \
   from the S3 path you provided. Amazon Web Services STS is activated in your Amazon Web Services \
   account by default. If you previously deactivated Amazon Web Services STS for a region, you \
   need to reactivate Amazon Web Services STS for that region. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
   and Deactivating Amazon Web Services STS in an Amazon Web Services Region} in the {i Amazon Web \
   Services Identity and Access Management User Guide}.\n\
  \           \n\
  \              To add the IAM role policies for using this API operation, go to the \
   {{:https://console.aws.amazon.com/iam/}IAM console}, and choose Roles in the left navigation \
   pane. Search the IAM role that you want to grant access to use the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html}CreateEndpoint} \
   and \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpointConfig.html}CreateEndpointConfig} \
   API operations, add the following policies to the role. \n\
  \             \n\
  \              {ul\n\
  \                    {-  Option 1: For a full SageMaker access, search and attach the \
   [AmazonSageMakerFullAccess] policy.\n\
  \                        \n\
  \                         }\n\
  \                    {-  Option 2: For granting a limited access to an IAM role, paste the \
   following Action elements manually into the JSON file of the IAM role: \n\
  \                        \n\
  \                          [\"Action\": \\[\"sagemaker:CreateEndpoint\", \
   \"sagemaker:CreateEndpointConfig\"\\]] \n\
  \                         \n\
  \                           [\"Resource\": \\[] \n\
  \                          \n\
  \                            [\"arn:aws:sagemaker:region:account-id:endpoint/endpointName\"] \n\
  \                           \n\
  \                             \
   [\"arn:aws:sagemaker:region:account-id:endpoint-config/endpointConfigName\"] \n\
  \                            \n\
  \                              [\\]] \n\
  \                             \n\
  \                              For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/api-permissions-reference.html}SageMaker API \
   Permissions: Actions, Permissions, and Resources Reference}.\n\
  \                              \n\
  \                               }\n\
  \                    }\n\
  \   "]

module CreateEdgePackagingJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_edge_packaging_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_edge_packaging_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a SageMaker Edge Manager model packaging job. Edge Manager will use the model artifacts \
   from the Amazon Simple Storage Service bucket that you specify. After the model has been \
   packaged, Amazon SageMaker saves the resulting artifacts to an S3 bucket that you specify.\n"]

module CreateEdgeDeploymentStage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_edge_deployment_stage_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new stage in an existing edge deployment plan.\n"]

module CreateEdgeDeploymentPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_edge_deployment_plan_request ->
    ( create_edge_deployment_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_edge_deployment_plan_request ->
    ( create_edge_deployment_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an edge deployment plan, consisting of multiple stages. Each stage may have a different \
   deployment configuration and devices.\n"]

module CreateDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [Domain]. A domain consists of an associated Amazon Elastic File System volume, a \
   list of authorized users, and a variety of security, application, policy, and Amazon Virtual \
   Private Cloud (VPC) configurations. Users within a domain can share notebook files and other \
   artifacts with each other.\n\n\
  \  {b EFS storage} \n\
  \ \n\
  \  When a domain is created, an EFS volume is created for use by all of the users within the \
   domain. Each user receives a private home directory within the EFS volume for notebooks, Git \
   repositories, and data files.\n\
  \  \n\
  \   SageMaker AI uses the Amazon Web Services Key Management Service (Amazon Web Services KMS) \
   to encrypt the EFS volume attached to the domain with an Amazon Web Services managed key by \
   default. For more control, you can specify a customer managed key. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/encryption-at-rest.html}Protect Data at Rest \
   Using Encryption}.\n\
  \   \n\
  \     {b VPC configuration} \n\
  \    \n\
  \     All traffic between the domain and the Amazon EFS volume is through the specified VPC and \
   subnets. For other traffic, you can specify the [AppNetworkAccessType] parameter. \
   [AppNetworkAccessType] corresponds to the network access type that you choose when you onboard \
   to the domain. The following options are available:\n\
  \     \n\
  \      {ul\n\
  \            {-   [PublicInternetOnly] - Non-EFS traffic goes through a VPC managed by Amazon \
   SageMaker AI, which allows internet access. This is the default value.\n\
  \                \n\
  \                 }\n\
  \            {-   [VpcOnly] - All traffic is through the specified VPC and subnets. Internet \
   access is disabled by default. To allow internet access, you must specify a NAT gateway.\n\
  \                \n\
  \                 When internet access is disabled, you won't be able to run a Amazon SageMaker \
   AI Studio notebook or to train or host models unless your VPC has an interface endpoint to the \
   SageMaker AI API and runtime or a NAT gateway and your security groups allow outbound \
   connections.\n\
  \                 \n\
  \                  }\n\
  \            }\n\
  \    NFS traffic over TCP on port 2049 needs to be allowed in both inbound and outbound rules in \
   order to launch a Amazon SageMaker AI Studio app successfully.\n\
  \    \n\
  \      For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/studio-notebooks-and-internet-access.html}Connect \
   Amazon SageMaker AI Studio Notebooks to Resources in a VPC}.\n\
  \      "]

module CreateDeviceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_device_fleet_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a device fleet.\n"]

module CreateDataQualityJobDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_job_definition_request ->
    ( create_data_quality_job_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_job_definition_request ->
    ( create_data_quality_job_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a definition for a job that monitors data quality and drift. For information about \
   model monitor, see {{:https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html}Amazon \
   SageMaker AI Model Monitor}.\n"]

module CreateContext : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_context_request ->
    ( create_context_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_context_request ->
    ( create_context_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a {i context}. A context is a lineage tracking entity that represents a logical \
   grouping of other tracking or experiment entities. Some examples are an endpoint and a model \
   package. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html}Amazon SageMaker ML \
   Lineage Tracking}.\n"]

module CreateComputeQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_compute_quota_request ->
    ( create_compute_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_compute_quota_request ->
    ( create_compute_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create compute allocation definition. This defines how compute is allocated, shared, and \
   borrowed for specified entities. Specifically, how to lend and borrow idle compute and assign a \
   fair-share weight to the specified entities.\n"]

module CreateCompilationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_compilation_job_request ->
    ( create_compilation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_compilation_job_request ->
    ( create_compilation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a model compilation job. After the model has been compiled, Amazon SageMaker AI saves \
   the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you \
   specify. \n\n\
  \ If you choose to host your model using Amazon SageMaker AI hosting services, you can use the \
   resulting model artifacts as part of the model. You can also use the artifacts with Amazon Web \
   Services IoT Greengrass. In that case, deploy them as an ML resource.\n\
  \ \n\
  \  In the request body, you provide the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  A name for the compilation job\n\
  \             \n\
  \              }\n\
  \         {-   Information about the input model artifacts \n\
  \             \n\
  \              }\n\
  \         {-  The output location for the compiled model and the device (target) that the model \
   runs on \n\
  \             \n\
  \              }\n\
  \         {-  The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker AI assumes to \
   perform the model compilation job. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can also provide a [Tag] to track the model compilation job's resource use and costs. \
   The response body contains the [CompilationJobArn] for the compiled job.\n\
  \   \n\
  \    To stop a model compilation job, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_StopCompilationJob.html}StopCompilationJob}. \
   To get information about a particular model compilation job, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeCompilationJob.html}DescribeCompilationJob}. \
   To get information about multiple model compilation jobs, use \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListCompilationJobs.html}ListCompilationJobs}.\n\
  \    "]

module CreateCodeRepository : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_code_repository_input ->
    (create_code_repository_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_code_repository_input ->
    ( create_code_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Git repository as a resource in your SageMaker AI account. You can associate the \
   repository with notebook instances so that you can use Git source control for the notebooks you \
   create. The Git repository is a resource in your SageMaker AI account, so it can be associated \
   with more than one notebook instance, and it persists independently from the lifecycle of any \
   notebook instances it is associated with.\n\n\
  \ The repository can be hosted either in \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html}Amazon Web Services \
   CodeCommit} or in any other Git repository.\n\
  \ "]

module CreateClusterSchedulerConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_scheduler_config_request ->
    ( create_cluster_scheduler_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_scheduler_config_request ->
    ( create_cluster_scheduler_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create cluster policy configuration. This policy is used for task prioritization and fair-share \
   allocation of idle compute. This helps prioritize critical workloads and distributes idle \
   compute across entities.\n"]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon SageMaker HyperPod cluster. SageMaker HyperPod is a capability of SageMaker \
   for creating and managing persistent clusters for developing large machine learning models, \
   such as large language models (LLMs) and diffusion models. To learn more, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod.html}Amazon SageMaker \
   HyperPod} in the {i Amazon SageMaker Developer Guide}.\n"]

module CreateAutoMLJobV2 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_ml_job_v2_request ->
    ( create_auto_ml_job_v2_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_auto_ml_job_v2_request ->
    ( create_auto_ml_job_v2_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Autopilot job also referred to as Autopilot experiment or AutoML job V2.\n\n\
  \ An AutoML job in SageMaker AI is a fully automated process that allows you to build machine \
   learning models with minimal effort and machine learning expertise. When initiating an AutoML \
   job, you provide your data and optionally specify parameters tailored to your use case. \
   SageMaker AI then automates the entire model development lifecycle, including data \
   preprocessing, model training, tuning, and evaluation. AutoML jobs are designed to simplify and \
   accelerate the model building process by automating various tasks and exploring different \
   combinations of machine learning algorithms, data preprocessing techniques, and hyperparameter \
   values. The output of an AutoML job comprises one or more trained models ready for deployment \
   and inference. Additionally, SageMaker AI AutoML jobs generate a candidate model leaderboard, \
   allowing you to select the best-performing model for deployment.\n\
  \ \n\
  \  For more information about AutoML jobs, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html}https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html} \
   in the SageMaker AI developer guide.\n\
  \  \n\
  \   AutoML jobs V2 support various problem types such as regression, binary, and multiclass \
   classification with tabular data, text and image classification, time-series forecasting, and \
   fine-tuning of large language models (LLMs) for text generation.\n\
  \   \n\
  \      \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJobV2.html}CreateAutoMLJobV2} \
   and \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJobV2.html}DescribeAutoMLJobV2} \
   are new versions of \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJob.html}CreateAutoMLJob} \
   and \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJob.html}DescribeAutoMLJob} \
   which offer backward compatibility.\n\
  \     \n\
  \       [CreateAutoMLJobV2] can manage tabular problem types identical to those of its previous \
   version [CreateAutoMLJob], as well as time-series forecasting, non-tabular problem types such \
   as image or text classification, and text generation (LLMs fine-tuning).\n\
  \      \n\
  \       Find guidelines about how to migrate a [CreateAutoMLJob] to [CreateAutoMLJobV2] in \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development-create-experiment.html#autopilot-create-experiment-api-migrate-v1-v2}Migrate \
   a CreateAutoMLJob to CreateAutoMLJobV2}.\n\
  \       \n\
  \         For the list of available problem types supported by [CreateAutoMLJobV2], see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_AutoMLProblemTypeConfig.html}AutoMLProblemTypeConfig}.\n\
  \         \n\
  \          You can find the best-performing model after you run an AutoML job V2 by calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJobV2.html}DescribeAutoMLJobV2}.\n\
  \          "]

module CreateAutoMLJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_ml_job_request ->
    ( create_auto_ml_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_auto_ml_job_request ->
    ( create_auto_ml_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Autopilot job also referred to as Autopilot experiment or AutoML job.\n\n\
  \ An AutoML job in SageMaker AI is a fully automated process that allows you to build machine \
   learning models with minimal effort and machine learning expertise. When initiating an AutoML \
   job, you provide your data and optionally specify parameters tailored to your use case. \
   SageMaker AI then automates the entire model development lifecycle, including data \
   preprocessing, model training, tuning, and evaluation. AutoML jobs are designed to simplify and \
   accelerate the model building process by automating various tasks and exploring different \
   combinations of machine learning algorithms, data preprocessing techniques, and hyperparameter \
   values. The output of an AutoML job comprises one or more trained models ready for deployment \
   and inference. Additionally, SageMaker AI AutoML jobs generate a candidate model leaderboard, \
   allowing you to select the best-performing model for deployment.\n\
  \ \n\
  \  For more information about AutoML jobs, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html}https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html} \
   in the SageMaker AI developer guide.\n\
  \  \n\
  \    We recommend using the new versions \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateAutoMLJobV2.html}CreateAutoMLJobV2} \
   and \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJobV2.html}DescribeAutoMLJobV2}, \
   which offer backward compatibility.\n\
  \    \n\
  \      [CreateAutoMLJobV2] can manage tabular problem types identical to those of its previous \
   version [CreateAutoMLJob], as well as time-series forecasting, non-tabular problem types such \
   as image or text classification, and text generation (LLMs fine-tuning).\n\
  \     \n\
  \      Find guidelines about how to migrate a [CreateAutoMLJob] to [CreateAutoMLJobV2] in \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development-create-experiment.html#autopilot-create-experiment-api-migrate-v1-v2}Migrate \
   a CreateAutoMLJob to CreateAutoMLJobV2}.\n\
  \      \n\
  \        You can find the best-performing model after you run an AutoML job by calling \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJobV2.html}DescribeAutoMLJobV2} \
   (recommended) or \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeAutoMLJob.html}DescribeAutoMLJob}.\n\
  \        "]

module CreateArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_artifact_request ->
    ( create_artifact_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_artifact_request ->
    ( create_artifact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an {i artifact}. An artifact is a lineage tracking entity that represents a URI \
   addressable object or data. Some examples are the S3 URI of a dataset and the ECR registry path \
   of an image. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html}Amazon SageMaker ML \
   Lineage Tracking}.\n"]

module CreateAppImageConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_image_config_request ->
    ( create_app_image_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_image_config_request ->
    ( create_app_image_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceInUse of resource_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration for running a SageMaker AI image as a KernelGateway app. The \
   configuration specifies the Amazon Elastic File System storage volume on the image, and a list \
   of the kernels in the image.\n"]

module CreateApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_request ->
    ( create_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_request ->
    ( create_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a running app for the specified UserProfile. This operation is automatically invoked by \
   Amazon SageMaker AI upon access to the associated Domain, and when new kernel configurations \
   are selected by the user. A user may have multiple Apps active simultaneously.\n"]

module CreateAlgorithm : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_algorithm_input ->
    (create_algorithm_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_algorithm_input ->
    ( create_algorithm_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a machine learning algorithm that you can use in SageMaker and list in the Amazon Web \
   Services Marketplace.\n"]

module CreateAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_action_request ->
    ( create_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_action_request ->
    ( create_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an {i action}. An action is a lineage tracking entity that represents an action or \
   activity. For example, a model deployment or an HPO job. Generally, an action involves at least \
   one input or output artifact. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html}Amazon SageMaker ML \
   Lineage Tracking}.\n"]

module CreateAIWorkloadConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ai_workload_config_request ->
    ( create_ai_workload_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ai_workload_config_request ->
    ( create_ai_workload_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a reusable AI workload configuration that defines datasets, data sources, and benchmark \
   tool settings for consistent performance testing of generative AI inference deployments on \
   Amazon SageMaker AI.\n"]

module CreateAIRecommendationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ai_recommendation_job_request ->
    ( create_ai_recommendation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ai_recommendation_job_request ->
    ( create_ai_recommendation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a recommendation job that generates intelligent optimization recommendations for \
   generative AI inference deployments. The job analyzes your model, workload configuration, and \
   performance targets to recommend optimal instance types, model optimization techniques (such as \
   quantization and speculative decoding), and deployment configurations.\n"]

module CreateAIBenchmarkJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUse of resource_in_use
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ai_benchmark_job_request ->
    ( create_ai_benchmark_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ai_benchmark_job_request ->
    ( create_ai_benchmark_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a benchmark job that runs performance benchmarks against inference infrastructure using \
   a predefined AI workload configuration. The benchmark job measures metrics such as latency, \
   throughput, and cost for your generative AI inference endpoints.\n"]

module BatchReplaceClusterNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_replace_cluster_nodes_request ->
    ( batch_replace_cluster_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_replace_cluster_nodes_request ->
    ( batch_replace_cluster_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces specific nodes within a SageMaker HyperPod cluster with new hardware. \
   [BatchReplaceClusterNodes] terminates the specified instances and provisions new replacement \
   instances with the same configuration but fresh hardware. The Amazon Machine Image (AMI) and \
   instance configuration remain the same.\n\n\
  \ This operation is useful for recovering from hardware failures or persistent issues that \
   cannot be resolved through a reboot.\n\
  \ \n\
  \   {ul\n\
  \         {-   {b Data Loss Warning:} Replacing nodes destroys all instance volumes, including \
   both root and secondary volumes. All data stored on these volumes will be permanently lost and \
   cannot be recovered.\n\
  \             \n\
  \              }\n\
  \         {-  To safeguard your work, back up your data to Amazon S3 or an FSx for Lustre file \
   system before invoking the API on a worker node group. This will help prevent any potential \
   data loss from the instance root volume. For more information about backup, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-operate-cli-command.html#sagemaker-hyperpod-operate-cli-command-update-cluster-software-backup}Use \
   the backup script provided by SageMaker HyperPod}.\n\
  \             \n\
  \              }\n\
  \         {-  If you want to invoke this API on an existing cluster, you'll first need to patch \
   the cluster by running the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_UpdateClusterSoftware.html}UpdateClusterSoftware \
   API}. For more information about patching a cluster, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-operate-cli-command.html#sagemaker-hyperpod-operate-cli-command-update-cluster-software}Update \
   the SageMaker HyperPod platform software of a cluster}.\n\
  \             \n\
  \              }\n\
  \         {-  You can replace up to 25 nodes in a single request.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module BatchRebootClusterNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_reboot_cluster_nodes_request ->
    ( batch_reboot_cluster_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_reboot_cluster_nodes_request ->
    ( batch_reboot_cluster_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots specific nodes within a SageMaker HyperPod cluster using a soft recovery mechanism. \
   [BatchRebootClusterNodes] performs a graceful reboot of the specified nodes by calling the \
   Amazon Elastic Compute Cloud [RebootInstances] API, which attempts to cleanly shut down the \
   operating system before restarting the instance.\n\n\
  \ This operation is useful for recovering from transient issues or applying certain \
   configuration changes that require a restart.\n\
  \ \n\
  \   {ul\n\
  \         {-  Rebooting a node may cause temporary service interruption for workloads running on \
   that node. Ensure your workloads can handle node restarts or use appropriate scheduling to \
   minimize impact.\n\
  \             \n\
  \              }\n\
  \         {-  You can reboot up to 25 nodes in a single request.\n\
  \             \n\
  \              }\n\
  \         {-  For SageMaker HyperPod clusters using the Slurm workload manager, ensure rebooting \
   nodes will not disrupt critical cluster operations.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module BatchDescribeModelPackage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_model_package_input ->
    (batch_describe_model_package_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_model_package_input ->
    ( batch_describe_model_package_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This action batch describes a list of versioned model packages\n"]

module BatchDeleteClusterNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_cluster_nodes_request ->
    ( batch_delete_cluster_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_cluster_nodes_request ->
    ( batch_delete_cluster_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes specific nodes within a SageMaker HyperPod cluster. [BatchDeleteClusterNodes] accepts a \
   cluster name and a list of node IDs.\n\n\
  \  {ul\n\
  \        {-  To safeguard your work, back up your data to Amazon S3 or an FSx for Lustre file \
   system before invoking the API on a worker node group. This will help prevent any potential \
   data loss from the instance root volume. For more information about backup, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-operate-cli-command.html#sagemaker-hyperpod-operate-cli-command-update-cluster-software-backup}Use \
   the backup script provided by SageMaker HyperPod}. \n\
  \            \n\
  \             }\n\
  \        {-  If you want to invoke this API on an existing cluster, you'll first need to patch \
   the cluster by running the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_UpdateClusterSoftware.html}UpdateClusterSoftware \
   API}. For more information about patching a cluster, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-operate-cli-command.html#sagemaker-hyperpod-operate-cli-command-update-cluster-software}Update \
   the SageMaker HyperPod platform software of a cluster}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module BatchAddClusterNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_add_cluster_nodes_request ->
    ( batch_add_cluster_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_add_cluster_nodes_request ->
    ( batch_add_cluster_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds nodes to a HyperPod cluster by incrementing the target count for one or more instance \
   groups. This operation returns a unique [NodeLogicalId] for each node being added, which can be \
   used to track the provisioning status of the node. This API provides a safer alternative to \
   [UpdateCluster] for scaling operations by avoiding unintended configuration changes.\n\n\
  \  This API is only supported for clusters using [Continuous] as the [NodeProvisioningMode].\n\
  \  \n\
  \   "]

module AttachClusterNodeVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_cluster_node_volume_request ->
    ( attach_cluster_node_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_cluster_node_volume_request ->
    ( attach_cluster_node_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Attaches your Amazon Elastic Block Store (Amazon EBS) volume to a node in your EKS \
   orchestrated HyperPod cluster. \n\n\
  \  This API works with the Amazon Elastic Block Store (Amazon EBS) Container Storage Interface \
   (CSI) driver to manage the lifecycle of persistent storage in your HyperPod EKS clusters. \n\
  \ "]

module AssociateTrialComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_trial_component_request ->
    ( associate_trial_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_trial_component_request ->
    ( associate_trial_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a trial component with a trial. A trial component can be associated with multiple \
   trials. To disassociate a trial component from a trial, call the \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DisassociateTrialComponent.html}DisassociateTrialComponent} \
   API.\n"]

module AddTags : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    (add_tags_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified SageMaker resource. You can add tags to \
   notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, \
   labeling jobs, work teams, endpoint configurations, and endpoints.\n\n\
  \ Each tag consists of a key and an optional value. Tag keys must be unique per resource. For \
   more information about tags, see For more information, see \
   {{:https://aws.amazon.com/answers/account-management/aws-tagging-strategies/}Amazon Web \
   Services Tagging Strategies}.\n\
  \ \n\
  \   Tags that you add to a hyperparameter tuning job by calling this API are also added to any \
   training jobs that the hyperparameter tuning job launches after you call this API, but not to \
   training jobs that the hyperparameter tuning job launched before you called this API. To make \
   sure that the tags associated with a hyperparameter tuning job are also added to all training \
   jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning \
   job by specifying them in the [Tags] parameter of \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateHyperParameterTuningJob.html}CreateHyperParameterTuningJob} \n\
  \   \n\
  \      Tags that you add to a SageMaker Domain or User Profile by calling this API are also \
   added to any Apps that the Domain or User Profile launches after you call this API, but not to \
   Apps that the Domain or User Profile launched before you called this API. To make sure that the \
   tags associated with a Domain or User Profile are also added to all Apps that the Domain or \
   User Profile launches, add the tags when you first create the Domain or User Profile by \
   specifying them in the [Tags] parameter of \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateDomain.html}CreateDomain} \
   or \
   {{:https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateUserProfile.html}CreateUserProfile}.\n\
  \      \n\
  \       "]

module AddAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceLimitExceeded of resource_limit_exceeded
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_association_request ->
    ( add_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_association_request ->
    ( add_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an {i association} between the source and the destination. A source can be associated \
   with multiple destinations, and a destination can be associated with multiple sources. An \
   association is a lineage tracking entity. For more information, see \
   {{:https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html}Amazon SageMaker ML \
   Lineage Tracking}.\n"]
