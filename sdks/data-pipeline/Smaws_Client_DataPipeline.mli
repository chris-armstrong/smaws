(** Data Pipeline client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_pipeline_id_name : ?name:id -> ?id:id -> unit -> pipeline_id_name

val make_field :
  ?ref_value:field_name_string ->
  ?string_value:field_string_value ->
  key:field_name_string ->
  unit ->
  field

val make_validation_warning : ?warnings:validation_messages -> ?id:id -> unit -> validation_warning
val make_validation_error : ?errors:validation_messages -> ?id:id -> unit -> validation_error

val make_validate_pipeline_definition_output :
  ?validation_warnings:validation_warnings ->
  ?validation_errors:validation_errors ->
  errored:boolean_ ->
  unit ->
  validate_pipeline_definition_output

val make_pipeline_object : fields:field_list -> name:id -> id:id -> unit -> pipeline_object

val make_parameter_attribute :
  string_value:attribute_value_string -> key:attribute_name_string -> unit -> parameter_attribute

val make_parameter_object :
  attributes:parameter_attribute_list -> id:field_name_string -> unit -> parameter_object

val make_parameter_value :
  string_value:field_string_value -> id:field_name_string -> unit -> parameter_value

val make_validate_pipeline_definition_input :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  pipeline_objects:pipeline_object_list ->
  pipeline_id:id ->
  unit ->
  validate_pipeline_definition_input

val make_task_object :
  ?objects:pipeline_object_map ->
  ?attempt_id:id ->
  ?pipeline_id:id ->
  ?task_id:task_id ->
  unit ->
  task_object

val make_set_task_status_output : unit -> unit

val make_set_task_status_input :
  ?error_stack_trace:string_ ->
  ?error_message:error_message ->
  ?error_id:string_ ->
  task_status:task_status ->
  task_id:task_id ->
  unit ->
  set_task_status_input

val make_set_status_input :
  status:string_ -> object_ids:id_list -> pipeline_id:id -> unit -> set_status_input

val make_operator : ?values:string_list -> ?type_:operator_type -> unit -> operator
val make_selector : ?operator:operator -> ?field_name:string_ -> unit -> selector

val make_report_task_runner_heartbeat_output :
  terminate:boolean_ -> unit -> report_task_runner_heartbeat_output

val make_report_task_runner_heartbeat_input :
  ?hostname:id ->
  ?worker_group:string_ ->
  taskrunner_id:id ->
  unit ->
  report_task_runner_heartbeat_input

val make_report_task_progress_output : canceled:boolean_ -> unit -> report_task_progress_output

val make_report_task_progress_input :
  ?fields:field_list -> task_id:task_id -> unit -> report_task_progress_input

val make_remove_tags_output : unit -> unit
val make_remove_tags_input : tag_keys:string_list -> pipeline_id:id -> unit -> remove_tags_input

val make_query_objects_output :
  ?has_more_results:boolean_ -> ?marker:string_ -> ?ids:id_list -> unit -> query_objects_output

val make_query : ?selectors:selector_list -> unit -> query

val make_query_objects_input :
  ?limit:int_ ->
  ?marker:string_ ->
  ?query:query ->
  sphere:string_ ->
  pipeline_id:id ->
  unit ->
  query_objects_input

val make_put_pipeline_definition_output :
  ?validation_warnings:validation_warnings ->
  ?validation_errors:validation_errors ->
  errored:boolean_ ->
  unit ->
  put_pipeline_definition_output

val make_put_pipeline_definition_input :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  pipeline_objects:pipeline_object_list ->
  pipeline_id:id ->
  unit ->
  put_pipeline_definition_input

val make_poll_for_task_output : ?task_object:task_object -> unit -> poll_for_task_output
val make_instance_identity : ?signature:string_ -> ?document:string_ -> unit -> instance_identity

val make_poll_for_task_input :
  ?instance_identity:instance_identity ->
  ?hostname:id ->
  worker_group:string_ ->
  unit ->
  poll_for_task_input

val make_pipeline_description :
  ?tags:tag_list ->
  ?description:string_ ->
  fields:field_list ->
  name:id ->
  pipeline_id:id ->
  unit ->
  pipeline_description

val make_list_pipelines_output :
  ?has_more_results:boolean_ ->
  ?marker:string_ ->
  pipeline_id_list:pipeline_list ->
  unit ->
  list_pipelines_output

val make_list_pipelines_input : ?marker:string_ -> unit -> list_pipelines_input

val make_get_pipeline_definition_output :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  ?pipeline_objects:pipeline_object_list ->
  unit ->
  get_pipeline_definition_output

val make_get_pipeline_definition_input :
  ?version:string_ -> pipeline_id:id -> unit -> get_pipeline_definition_input

val make_evaluate_expression_output :
  evaluated_expression:long_string -> unit -> evaluate_expression_output

val make_evaluate_expression_input :
  expression:long_string -> object_id:id -> pipeline_id:id -> unit -> evaluate_expression_input

val make_describe_pipelines_output :
  pipeline_description_list:pipeline_description_list -> unit -> describe_pipelines_output

val make_describe_pipelines_input : pipeline_ids:id_list -> unit -> describe_pipelines_input

val make_describe_objects_output :
  ?has_more_results:boolean_ ->
  ?marker:string_ ->
  pipeline_objects:pipeline_object_list ->
  unit ->
  describe_objects_output

val make_describe_objects_input :
  ?marker:string_ ->
  ?evaluate_expressions:boolean_ ->
  object_ids:id_list ->
  pipeline_id:id ->
  unit ->
  describe_objects_input

val make_delete_pipeline_input : pipeline_id:id -> unit -> delete_pipeline_input
val make_deactivate_pipeline_output : unit -> unit

val make_deactivate_pipeline_input :
  ?cancel_active:cancel_active -> pipeline_id:id -> unit -> deactivate_pipeline_input

val make_create_pipeline_output : pipeline_id:id -> unit -> create_pipeline_output

val make_create_pipeline_input :
  ?tags:tag_list -> ?description:string_ -> unique_id:id -> name:id -> unit -> create_pipeline_input

val make_add_tags_output : unit -> unit
val make_add_tags_input : tags:tag_list -> pipeline_id:id -> unit -> add_tags_input
val make_activate_pipeline_output : unit -> unit

val make_activate_pipeline_input :
  ?start_timestamp:timestamp ->
  ?parameter_values:parameter_value_list ->
  pipeline_id:id ->
  unit ->
  activate_pipeline_input
(** {1:operations Operations} *)

module ActivatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    activate_pipeline_input ->
    ( activate_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    activate_pipeline_input ->
    ( activate_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not \
   pass validation, activation fails.\n\n\
  \ If you need to pause the pipeline to investigate an issue with a component, such as a data \
   source or script, call [DeactivatePipeline].\n\
  \ \n\
  \  To activate a finished pipeline, modify the end date for the pipeline and then activate it.\n\
  \  \n\
  \     POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ActivatePipeline Content-Length: 39 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-06372391ZG65EXAMPLE\"\\}   HTTP/1.1 200 x-amzn-RequestId: \
   ee19d5bf-074e-11e2-af6f-6bc7a6be60d9 Content-Type: application/x-amz-json-1.1 Content-Length: 2 \
   Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\\}  "]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or modifies tags for the specified pipeline.\n"]

module CreatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new, empty pipeline. Use [PutPipelineDefinition] to populate the pipeline.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.CreatePipeline Content-Length: 91 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"name\": \
   \"myPipeline\", \"uniqueId\": \"123456789\", \"description\": \"This is my first \
   pipeline\"\\}   HTTP/1.1 200 x-amzn-RequestId: b16911ce-0774-11e2-af6f-6bc7a6be60d9 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 40 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"pipelineId\": \"df-06372391ZG65EXAMPLE\"\\}  "]

module DeactivatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deactivate_pipeline_input ->
    ( deactivate_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deactivate_pipeline_input ->
    ( deactivate_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates the specified running pipeline. The pipeline is set to the [DEACTIVATING] state \
   until the deactivation process completes.\n\n\
  \ To resume a deactivated pipeline, use [ActivatePipeline]. By default, the pipeline resumes \
   from the last completed execution. Optionally, you can specify the date and time to resume the \
   pipeline.\n\
  \ "]

module DeletePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to \
   cancel instances associated with the pipeline that are currently being processed by task \
   runners.\n\n\
  \ Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To \
   temporarily pause a pipeline instead of deleting it, call [SetStatus] with the status set to \
   [PAUSE] on individual components. Components that are paused by [SetStatus] can be resumed.\n\
  \ \n\
  \    POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.DeletePipeline Content-Length: 50 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-06372391ZG65EXAMPLE\"\\}   x-amzn-RequestId: b7a88c81-0754-11e2-af6f-6bc7a6be60d9 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 0 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   Unexpected response: 200, OK, undefined  "]

module DescribeObjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_objects_input ->
    ( describe_objects_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_objects_input ->
    ( describe_objects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the object definitions for a set of objects associated with the pipeline. Object \
   definitions are composed of a set of fields that define the properties of the object.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.DescribeObjects Content-Length: 98 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-06372391ZG65EXAMPLE\", \"objectIds\": \\[\"Schedule\"\\], \"evaluateExpressions\": \
   true\\}   x-amzn-RequestId: 4c18ea5d-0777-11e2-8a14-21bb8a1f50ef Content-Type: \
   application/x-amz-json-1.1 Content-Length: 1488 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"hasMoreResults\": false, \"pipelineObjects\": \\[ \\{\"fields\": \\[ \\{\"key\": \
   \"startDateTime\", \"stringValue\": \"2012-12-12T00:00:00\"\\}, \\{\"key\": \"parent\", \
   \"refValue\": \"Default\"\\}, \\{\"key\": \"\\@sphere\", \"stringValue\": \"COMPONENT\"\\}, \
   \\{\"key\": \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \"period\", \
   \"stringValue\": \"1 hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \
   \"2012-12-21T18:00:00\"\\}, \\{\"key\": \"\\@version\", \"stringValue\": \"1\"\\}, \\{\"key\": \
   \"\\@status\", \"stringValue\": \"PENDING\"\\}, \\{\"key\": \"\\@pipelineId\", \"stringValue\": \
   \"df-06372391ZG65EXAMPLE\"\\} \\], \"id\": \"Schedule\", \"name\": \"Schedule\"\\} \\] \\}  "]

module DescribePipelines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pipelines_input ->
    ( describe_pipelines_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pipelines_input ->
    ( describe_pipelines_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves metadata about one or more pipelines. The information retrieved includes the name of \
   the pipeline, the pipeline identifier, its current state, and the user account that owns the \
   pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your \
   IAM users have created. If you are using an IAM user account, you can retrieve metadata about \
   only those pipelines for which you have read permissions.\n\n\
  \ To retrieve the full pipeline definition instead of metadata about the pipeline, call \
   [GetPipelineDefinition].\n\
  \ \n\
  \    POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.DescribePipelines Content-Length: 70 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineIds\": \
   \\[\"df-08785951KAKJEXAMPLE\"\\] \\}   x-amzn-RequestId: 02870eb7-0736-11e2-af6f-6bc7a6be60d9 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 767 Date: Mon, 12 Nov 2012 17:50:53 \
   GMT \\{\"pipelineDescriptionList\": \\[ \\{\"description\": \"This is my first pipeline\", \
   \"fields\": \\[ \\{\"key\": \"\\@pipelineState\", \"stringValue\": \"SCHEDULED\"\\}, \
   \\{\"key\": \"description\", \"stringValue\": \"This is my first pipeline\"\\}, \\{\"key\": \
   \"name\", \"stringValue\": \"myPipeline\"\\}, \\{\"key\": \"\\@creationTime\", \"stringValue\": \
   \"2012-12-13T01:24:06\"\\}, \\{\"key\": \"\\@id\", \"stringValue\": \
   \"df-0937003356ZJEXAMPLE\"\\}, \\{\"key\": \"\\@sphere\", \"stringValue\": \"PIPELINE\"\\}, \
   \\{\"key\": \"\\@version\", \"stringValue\": \"1\"\\}, \\{\"key\": \"\\@userId\", \
   \"stringValue\": \"924374875933\"\\}, \\{\"key\": \"\\@accountId\", \"stringValue\": \
   \"924374875933\"\\}, \\{\"key\": \"uniqueId\", \"stringValue\": \"1234567890\"\\} \\], \
   \"name\": \"myPipeline\", \"pipelineId\": \"df-0937003356ZJEXAMPLE\"\\} \\] \\}  "]

module EvaluateExpression : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `TaskNotFoundException of task_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    evaluate_expression_input ->
    ( evaluate_expression_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    evaluate_expression_input ->
    ( evaluate_expression_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Task runners call [EvaluateExpression] to evaluate a string in the context of the specified \
   object. For example, a task runner can evaluate SQL queries stored in Amazon S3.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.DescribePipelines Content-Length: 164 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-08785951KAKJEXAMPLE\", \"objectId\": \"Schedule\", \"expression\": \"Transform started at \
   #\\{startDateTime\\} and finished at #\\{endDateTime\\}\"\\}   x-amzn-RequestId: \
   02870eb7-0736-11e2-af6f-6bc7a6be60d9 Content-Type: application/x-amz-json-1.1 Content-Length: \
   103 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"evaluatedExpression\": \"Transform started at \
   2012-12-12T00:00:00 and finished at 2012-12-21T18:00:00\"\\}  "]

module GetPipelineDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_definition_input ->
    ( get_pipeline_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_definition_input ->
    ( get_pipeline_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the definition of the specified pipeline. You can call [GetPipelineDefinition] to retrieve \
   the pipeline definition that you provided using [PutPipelineDefinition].\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.GetPipelineDefinition Content-Length: 40 Host: \
   datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: \
   AuthParams \\{\"pipelineId\": \"df-06372391ZG65EXAMPLE\"\\}   x-amzn-RequestId: \
   e28309e5-0776-11e2-8a14-21bb8a1f50ef Content-Type: application/x-amz-json-1.1 Content-Length: \
   890 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"pipelineObjects\": \\[ \\{\"fields\": \\[ \
   \\{\"key\": \"workerGroup\", \"stringValue\": \"workerGroup\"\\} \\], \"id\": \"Default\", \
   \"name\": \"Default\"\\}, \\{\"fields\": \\[ \\{\"key\": \"startDateTime\", \"stringValue\": \
   \"2012-09-25T17:00:00\"\\}, \\{\"key\": \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \
   \"period\", \"stringValue\": \"1 hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \
   \"2012-09-25T18:00:00\"\\} \\], \"id\": \"Schedule\", \"name\": \"Schedule\"\\}, \\{\"fields\": \
   \\[ \\{\"key\": \"schedule\", \"refValue\": \"Schedule\"\\}, \\{\"key\": \"command\", \
   \"stringValue\": \"echo hello\"\\}, \\{\"key\": \"parent\", \"refValue\": \"Default\"\\}, \
   \\{\"key\": \"type\", \"stringValue\": \"ShellCommandActivity\"\\} \\], \"id\": \"SayHello\", \
   \"name\": \"SayHello\"\\} \\] \\}  "]

module ListPipelines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the pipeline identifiers for all active pipelines that you have permission to access.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ListPipelines Content-Length: 14 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\\}  Status: \
   x-amzn-RequestId: b3104dc5-0734-11e2-af6f-6bc7a6be60d9 Content-Type: application/x-amz-json-1.1 \
   Content-Length: 39 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"PipelineIdList\": \\[ \\{\"id\": \
   \"df-08785951KAKJEXAMPLE\", \"name\": \"MyPipeline\"\\}, \\{\"id\": \"df-08662578ISYEXAMPLE\", \
   \"name\": \"MySecondPipeline\"\\} \\] \\} "]

module PollForTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `TaskNotFoundException of task_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    poll_for_task_input ->
    ( poll_for_task_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `TaskNotFoundException of task_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    poll_for_task_input ->
    ( poll_for_task_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `TaskNotFoundException of task_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Task runners call [PollForTask] to receive a task to perform from AWS Data Pipeline. The task \
   runner specifies which tasks it can perform by setting a value for the [workerGroup] parameter. \
   The task returned can come from any of the pipelines that match the [workerGroup] value passed \
   in by the task runner and that was launched using the IAM user credentials specified by the \
   task runner.\n\n\
  \ If tasks are ready in the work queue, [PollForTask] returns a response immediately. If no \
   tasks are available in the queue, [PollForTask] uses long-polling and holds on to a poll \
   connection for up to a 90 seconds, during which time the first newly scheduled task is handed \
   to the task runner. To accomodate this, set the socket timeout in your task runner to 90 \
   seconds. The task runner should not call [PollForTask] again on the same [workerGroup] until it \
   receives a response, and this can take up to 90 seconds. \n\
  \ \n\
  \    POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.PollForTask Content-Length: 59 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"workerGroup\": \
   \"MyworkerGroup\", \"hostname\": \"example.com\"\\}   x-amzn-RequestId: \
   41c713d2-0775-11e2-af6f-6bc7a6be60d9 Content-Type: application/x-amz-json-1.1 Content-Length: \
   39 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"taskObject\": \\{\"attemptId\": \
   \"\\@SayHello_2012-12-12T00:00:00_Attempt=1\", \"objects\": \
   \\{\"\\@SayHello_2012-12-12T00:00:00_Attempt=1\": \\{\"fields\": \\[ \\{\"key\": \
   \"\\@componentParent\", \"refValue\": \"SayHello\"\\}, \\{\"key\": \"\\@scheduledStartTime\", \
   \"stringValue\": \"2012-12-12T00:00:00\"\\}, \\{\"key\": \"parent\", \"refValue\": \
   \"SayHello\"\\}, \\{\"key\": \"\\@sphere\", \"stringValue\": \"ATTEMPT\"\\}, \\{\"key\": \
   \"workerGroup\", \"stringValue\": \"workerGroup\"\\}, \\{\"key\": \"\\@instanceParent\", \
   \"refValue\": \"\\@SayHello_2012-12-12T00:00:00\"\\}, \\{\"key\": \"type\", \"stringValue\": \
   \"ShellCommandActivity\"\\}, \\{\"key\": \"\\@status\", \"stringValue\": \
   \"WAITING_FOR_RUNNER\"\\}, \\{\"key\": \"\\@version\", \"stringValue\": \"1\"\\}, \\{\"key\": \
   \"schedule\", \"refValue\": \"Schedule\"\\}, \\{\"key\": \"\\@actualStartTime\", \
   \"stringValue\": \"2012-12-13T01:40:50\"\\}, \\{\"key\": \"command\", \"stringValue\": \"echo \
   hello\"\\}, \\{\"key\": \"\\@scheduledEndTime\", \"stringValue\": \"2012-12-12T01:00:00\"\\}, \
   \\{\"key\": \"\\@activeInstances\", \"refValue\": \"\\@SayHello_2012-12-12T00:00:00\"\\}, \
   \\{\"key\": \"\\@pipelineId\", \"stringValue\": \"df-0937003356ZJEXAMPLE\"\\} \\], \"id\": \
   \"\\@SayHello_2012-12-12T00:00:00_Attempt=1\", \"name\": \
   \"\\@SayHello_2012-12-12T00:00:00_Attempt=1\"\\} \\}, \"pipelineId\": \
   \"df-0937003356ZJEXAMPLE\", \"taskId\": \
   \"2xaM4wRs5zOsIH+g9U3oVHfAgAlbSqU6XduncB0HhZ3xMnmvfePZPn4dIbYXHyWyRK+cU15MqDHwdrvftx/4wv+sNS4w34vJfv7QA9aOoOazW28l1GYSb2ZRR0N0paiQp+d1MhSKo10hOTWOsVK5S5Lnx9Qm6omFgXHyIvZRIvTlrQMpr1xuUrflyGOfbFOGpOLpvPE172MYdqpZKnbSS4TcuqgQKSWV2833fEubI57DPOP7ghWa2TcYeSIv4pdLYG53fTuwfbnbdc98g2LNUQzSVhSnt7BoqyNwht2aQ6b/UHg9A80+KVpuXuqmz3m1MXwHFgxjdmuesXNOrrlGpeLCcRWD+aGo0RN1NqhQRzNAig8V4GlaPTQzMsRCljKqvrIyAoP3Tt2XEGsHkkQo12rEX8Z90957XX2qKRwhruwYzqGkSLWjINoLdAxUJdpRXRc5DJTrBd3D5mdzn7kY1l7NEh4kFHJDt3Cx4Z3Mk8MYCACyCk/CEyy9DwuPi66cLz0NBcgbCM5LKjTBOwo1m+am+pvM1kSposE9FPP1+RFGb8k6jQBTJx3TRz1yKilnGXQTZ5xvdOFpJrklIT0OXP1MG3+auM9FlJA+1dX90QoNJE5z7axmK//MOGXUdkqFe2kiDkorqjxwDvc0Js9pVKfKvAmW8YqUbmI9l0ERpWCXXnLVHNmPWz3jaPY+OBAmuJWDmxB/Z8p94aEDg4BVXQ7LvsKQ3DLYhaB7yJ390CJT+i0mm+EBqY60V6YikPSWDFrYQ/NPi2b1DgE19mX8zHqw8qprIl4yh1Ckx2Iige4En/N5ktOoIxnASxAw/TzcE2skxdw5KlHDF+UTj71m16CR/dIaKlXijlfNlNzUBo/bNSadCQn3G5NoO501wPKI:XO50TgDNyo8EXAMPLE/g==:1\"\\} \
   \\}  "]

module PutPipelineDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_pipeline_definition_input ->
    ( put_pipeline_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_pipeline_definition_input ->
    ( put_pipeline_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tasks, schedules, and preconditions to the specified pipeline. You can use \
   [PutPipelineDefinition] to populate a new pipeline.\n\n\
  \  [PutPipelineDefinition] also validates the configuration as it adds it to the pipeline. \
   Changes to the pipeline are saved unless one of the following three validation errors exists in \
   the pipeline. \n\
  \ \n\
  \  {ol\n\
  \        {- An object is missing a name or identifier field.}\n\
  \        {- A string or reference field is empty.}\n\
  \        {- The number of objects in the pipeline exceeds the maximum allowed objects.}\n\
  \        {- The pipeline is in a FINISHED state.}\n\
  \        }\n\
  \    Pipeline object definitions are passed to the [PutPipelineDefinition] action and returned \
   by the [GetPipelineDefinition] action. \n\
  \   \n\
  \      Example 1  This example sets an valid pipeline configuration and returns success.   POST \
   / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.PutPipelineDefinition Content-Length: 914 Host: \
   datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: \
   AuthParams \\{\"pipelineId\": \"df-0937003356ZJEXAMPLE\", \"pipelineObjects\": \\[ \\{\"id\": \
   \"Default\", \"name\": \"Default\", \"fields\": \\[ \\{\"key\": \"workerGroup\", \
   \"stringValue\": \"workerGroup\"\\} \\] \\}, \\{\"id\": \"Schedule\", \"name\": \"Schedule\", \
   \"fields\": \\[ \\{\"key\": \"startDateTime\", \"stringValue\": \"2012-12-12T00:00:00\"\\}, \
   \\{\"key\": \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \"period\", \
   \"stringValue\": \"1 hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \
   \"2012-12-21T18:00:00\"\\} \\] \\}, \\{\"id\": \"SayHello\", \"name\": \"SayHello\", \
   \"fields\": \\[ \\{\"key\": \"type\", \"stringValue\": \"ShellCommandActivity\"\\}, \\{\"key\": \
   \"command\", \"stringValue\": \"echo hello\"\\}, \\{\"key\": \"parent\", \"refValue\": \
   \"Default\"\\}, \\{\"key\": \"schedule\", \"refValue\": \"Schedule\"\\} \\] \\} \\] \\}   \
   HTTP/1.1 200 x-amzn-RequestId: f74afc14-0754-11e2-af6f-6bc7a6be60d9 Content-Type: \
   application/x-amz-json-1.1 Content-Length: 18 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"errored\": false\\}    Example 2  This example sets an invalid pipeline configuration (the \
   value for [workerGroup] is an empty string) and returns an error message.   POST / HTTP/1.1 \
   Content-Type: application/x-amz-json-1.1 X-Amz-Target: DataPipeline.PutPipelineDefinition \
   Content-Length: 903 Host: datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 \
   17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \"df-06372391ZG65EXAMPLE\", \
   \"pipelineObjects\": \\[ \\{\"id\": \"Default\", \"name\": \"Default\", \"fields\": \\[ \
   \\{\"key\": \"workerGroup\", \"stringValue\": \"\"\\} \\] \\}, \\{\"id\": \"Schedule\", \
   \"name\": \"Schedule\", \"fields\": \\[ \\{\"key\": \"startDateTime\", \"stringValue\": \
   \"2012-09-25T17:00:00\"\\}, \\{\"key\": \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \
   \"period\", \"stringValue\": \"1 hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \
   \"2012-09-25T18:00:00\"\\} \\] \\}, \\{\"id\": \"SayHello\", \"name\": \"SayHello\", \
   \"fields\": \\[ \\{\"key\": \"type\", \"stringValue\": \"ShellCommandActivity\"\\}, \\{\"key\": \
   \"command\", \"stringValue\": \"echo hello\"\\}, \\{\"key\": \"parent\", \"refValue\": \
   \"Default\"\\}, \\{\"key\": \"schedule\", \"refValue\": \"Schedule\"\\} \\] \\} \\] \\}   \
   HTTP/1.1 200 x-amzn-RequestId: f74afc14-0754-11e2-af6f-6bc7a6be60d9 Content-Type: \
   application/x-amz-json-1.1 Content-Length: 18 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"__type\": \"com.amazon.setl.webservice#InvalidRequestException\", \"message\": \"Pipeline \
   definition has errors: Could not save the pipeline definition due to FATAL errors: \
   \\[com.amazon.setl.webservice.ValidationError\\@108d7ea9\\] Please call Validate to validate \
   your pipeline\"\\}   "]

module QueryObjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_objects_input ->
    ( query_objects_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_objects_input ->
    ( query_objects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Queries the specified pipeline for the names of objects that match the specified set of \
   conditions.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.QueryObjects Content-Length: 123 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-06372391ZG65EXAMPLE\", \"query\": \\{\"selectors\": \\[ \\] \\}, \"sphere\": \"INSTANCE\", \
   \"marker\": \"\", \"limit\": 10\\}   x-amzn-RequestId: 14d704c1-0775-11e2-af6f-6bc7a6be60d9 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 72 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"hasMoreResults\": false, \"ids\": \\[\"\\@SayHello_1_2012-09-25T17:00:00\"\\] \\}  "]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes existing tags from the specified pipeline.\n"]

module ReportTaskProgress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `TaskNotFoundException of task_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    report_task_progress_input ->
    ( report_task_progress_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    report_task_progress_input ->
    ( report_task_progress_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Task runners call [ReportTaskProgress] when assigned a task to acknowledge that it has the \
   task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the \
   task in a subsequent [PollForTask] call. After this initial acknowledgement, the task runner \
   only needs to report progress every 15 minutes to maintain its ownership of the task. You can \
   change this reporting time from 15 minutes by specifying a [reportProgressTimeout] field in \
   your pipeline.\n\n\
  \ If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that \
   the task runner is unable to process the task and reassigns the task in a subsequent response \
   to [PollForTask]. Task runners should call [ReportTaskProgress] every 60 seconds.\n\
  \ \n\
  \    POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ReportTaskProgress Content-Length: 832 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"taskId\": \
   \"aaGgHT4LuH0T0Y0oLrJRjas5qH0d8cDPADxqq3tn+zCWGELkCdV2JprLreXm1oxeP5EFZHFLJ69kjSsLYE0iYHYBYVGBrB+E/pYq7ANEEeGJFnSBMRiXZVA+8UJ3OzcInvXeinqBmBaKwii7hnnKb/AXjXiNTXyxgydX1KAyg1AxkwBYG4cfPYMZbuEbQJFJvv5C/2+GVXz1w94nKYTeUeepwUOFOuRLS6JVtZoYwpF56E+Yfk1IcGpFOvCZ01B4Bkuu7x3J+MD/j6kJgZLAgbCJQtI3eiW3kdGmX0p0I2BdY1ZsX6b4UiSvM3OMj6NEHJCJL4E0ZfitnhCoe24Kvjo6C2hFbZq+ei/HPgSXBQMSagkr4vS9c0ChzxH2+LNYvec6bY4kymkaZI1dvOzmpa0FcnGf5AjSK4GpsViZ/ujz6zxFv81qBXzjF0/4M1775rjV1VUdyKaixiA/sJiACNezqZqETidp8d24BDPRhGsj6pBCrnelqGFrk/gXEXUsJ+xwMifRC8UVwiKekpAvHUywVk7Ku4jH/n3i2VoLRP6FXwpUbelu34iiZ9czpXyLtyPKwxa87dlrnRVURwkcVjOt2Mcrcaqe+cbWHvNRhyrPkkdfSF3ac8/wfgVbXvLEB2k9mKc67aD9rvdc1PKX09Tk8BKklsMTpZ3TRCd4NzQlJKigMe8Jat9+1tKj4Ole5ZzW6uyTu2s2iFjEV8KXu4MaiRJyNKCdKeGhhZWY37Qk4NBK4Ppgu+C6Y41dpfOh288SLDEVx0/UySlqOEdhba7c6BiPp5r3hKj3mk9lFy5OYp1aoGLeeFmjXveTnPdf2gkWqXXg7AUbJ7jEs1F0lKZQg4szep2gcKyAJXgvXLfJJHcha8Lfb/Ee7wYmyOcAaRpDBoFNSbtoVXar46teIrpho+ZDvynUXvU0grHWGOk=:wn3SgymHZM99bEXAMPLE\", \
   \"fields\": \\[ \\{\"key\": \"percentComplete\", \"stringValue\": \"50\"\\} \\] \\}   \
   x-amzn-RequestId: 640bd023-0775-11e2-af6f-6bc7a6be60d9 Content-Type: application/x-amz-json-1.1 \
   Content-Length: 18 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"canceled\": false\\}  "]

module ReportTaskRunnerHeartbeat : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    report_task_runner_heartbeat_input ->
    ( report_task_runner_heartbeat_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    report_task_runner_heartbeat_input ->
    ( report_task_runner_heartbeat_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Task runners call [ReportTaskRunnerHeartbeat] every 15 minutes to indicate that they are \
   operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data \
   Pipeline, the web service can use this call to detect when the task runner application has \
   failed and restart a new instance.\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ReportTaskRunnerHeartbeat Content-Length: 84 Host: \
   datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: \
   AuthParams \\{\"taskrunnerId\": \"1234567890\", \"workerGroup\": \"wg-12345\", \"hostname\": \
   \"example.com\"\\}   Status: x-amzn-RequestId: b3104dc5-0734-11e2-af6f-6bc7a6be60d9 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 20 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\"terminate\": false\\}  "]

module SetStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_status_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_status_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests that the status of the specified physical or logical pipeline objects be updated in \
   the specified pipeline. This update might not occur immediately, but is eventually consistent. \
   The status that can be set depends on the type of object (for example, DataNode or Activity). \
   You cannot perform this operation on [FINISHED] pipelines and attempting to do so returns \
   [InvalidRequestException].\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.SetStatus Content-Length: 100 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"pipelineId\": \
   \"df-0634701J7KEXAMPLE\", \"objectIds\": \\[\"o-08600941GHJWMBR9E2\"\\], \"status\": \
   \"pause\"\\}   x-amzn-RequestId: e83b8ab7-076a-11e2-af6f-6bc7a6be60d9 Content-Type: \
   application/x-amz-json-1.1 Content-Length: 0 Date: Mon, 12 Nov 2012 17:50:53 GMT Unexpected \
   response: 200, OK, undefined  "]

module SetTaskStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `TaskNotFoundException of task_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_task_status_input ->
    ( set_task_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_task_status_input ->
    ( set_task_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TaskNotFoundException of task_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Task runners call [SetTaskStatus] to notify AWS Data Pipeline that a task is completed and \
   provide information about the final status. A task runner makes this call regardless of whether \
   the task was sucessful. A task runner does not need to call [SetTaskStatus] for tasks that are \
   canceled by the web service during a call to [ReportTaskProgress].\n\n\
  \   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.SetTaskStatus Content-Length: 847 Host: datapipeline.us-east-1.amazonaws.com \
   X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: AuthParams \\{\"taskId\": \
   \"aaGgHT4LuH0T0Y0oLrJRjas5qH0d8cDPADxqq3tn+zCWGELkCdV2JprLreXm1oxeP5EFZHFLJ69kjSsLYE0iYHYBYVGBrB+E/pYq7ANEEeGJFnSBMRiXZVA+8UJ3OzcInvXeinqBmBaKwii7hnnKb/AXjXiNTXyxgydX1KAyg1AxkwBYG4cfPYMZbuEbQJFJvv5C/2+GVXz1w94nKYTeUeepwUOFOuRLS6JVtZoYwpF56E+Yfk1IcGpFOvCZ01B4Bkuu7x3J+MD/j6kJgZLAgbCJQtI3eiW3kdGmX0p0I2BdY1ZsX6b4UiSvM3OMj6NEHJCJL4E0ZfitnhCoe24Kvjo6C2hFbZq+ei/HPgSXBQMSagkr4vS9c0ChzxH2+LNYvec6bY4kymkaZI1dvOzmpa0FcnGf5AjSK4GpsViZ/ujz6zxFv81qBXzjF0/4M1775rjV1VUdyKaixiA/sJiACNezqZqETidp8d24BDPRhGsj6pBCrnelqGFrk/gXEXUsJ+xwMifRC8UVwiKekpAvHUywVk7Ku4jH/n3i2VoLRP6FXwpUbelu34iiZ9czpXyLtyPKwxa87dlrnRVURwkcVjOt2Mcrcaqe+cbWHvNRhyrPkkdfSF3ac8/wfgVbXvLEB2k9mKc67aD9rvdc1PKX09Tk8BKklsMTpZ3TRCd4NzQlJKigMe8Jat9+1tKj4Ole5ZzW6uyTu2s2iFjEV8KXu4MaiRJyNKCdKeGhhZWY37Qk4NBK4Ppgu+C6Y41dpfOh288SLDEVx0/UySlqOEdhba7c6BiPp5r3hKj3mk9lFy5OYp1aoGLeeFmjXveTnPdf2gkWqXXg7AUbJ7jEs1F0lKZQg4szep2gcKyAJXgvXLfJJHcha8Lfb/Ee7wYmyOcAaRpDBoFNSbtoVXar46teIrpho+ZDvynUXvU0grHWGOk=:wn3SgymHZM99bEXAMPLE\", \
   \"taskStatus\": \"FINISHED\"\\}   x-amzn-RequestId: 8c8deb53-0788-11e2-af9c-6bc7a6be6qr8 \
   Content-Type: application/x-amz-json-1.1 Content-Length: 0 Date: Mon, 12 Nov 2012 17:50:53 GMT \
   \\{\\}  "]

(** {1:Serialization and Deserialization} *)
module ValidatePipelineDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `PipelineDeletedException of pipeline_deleted_exception
    | `PipelineNotFoundException of pipeline_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_pipeline_definition_input ->
    ( validate_pipeline_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_pipeline_definition_input ->
    ( validate_pipeline_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `PipelineDeletedException of pipeline_deleted_exception
      | `PipelineNotFoundException of pipeline_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates the specified pipeline definition to ensure that it is well formed and can be run \
   without error.\n\n\
  \   Example 1  This example sets an valid pipeline configuration and returns success.   POST / \
   HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ValidatePipelineDefinition Content-Length: 936 Host: \
   datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: \
   AuthParams \\{\"pipelineId\": \"df-06372391ZG65EXAMPLE\", \"pipelineObjects\": \\[ \\{\"id\": \
   \"Default\", \"name\": \"Default\", \"fields\": \\[ \\{\"key\": \"workerGroup\", \
   \"stringValue\": \"MyworkerGroup\"\\} \\] \\}, \\{\"id\": \"Schedule\", \"name\": \"Schedule\", \
   \"fields\": \\[ \\{\"key\": \"startDateTime\", \"stringValue\": \"2012-09-25T17:00:00\"\\}, \
   \\{\"key\": \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \"period\", \
   \"stringValue\": \"1 hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \
   \"2012-09-25T18:00:00\"\\} \\] \\}, \\{\"id\": \"SayHello\", \"name\": \"SayHello\", \
   \"fields\": \\[ \\{\"key\": \"type\", \"stringValue\": \"ShellCommandActivity\"\\}, \\{\"key\": \
   \"command\", \"stringValue\": \"echo hello\"\\}, \\{\"key\": \"parent\", \"refValue\": \
   \"Default\"\\}, \\{\"key\": \"schedule\", \"refValue\": \"Schedule\"\\} \\] \\} \\] \\}   \
   x-amzn-RequestId: 92c9f347-0776-11e2-8a14-21bb8a1f50ef Content-Type: application/x-amz-json-1.1 \
   Content-Length: 18 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"errored\": false\\}    Example 2  \
   This example sets an invalid pipeline configuration and returns the associated set of \
   validation errors.   POST / HTTP/1.1 Content-Type: application/x-amz-json-1.1 X-Amz-Target: \
   DataPipeline.ValidatePipelineDefinition Content-Length: 903 Host: \
   datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52 GMT Authorization: \
   AuthParams \\{\"pipelineId\": \"df-06372391ZG65EXAMPLE\", \"pipelineObjects\": \\[ \\{\"id\": \
   \"Default\", \"name\": \"Default\", \"fields\": \\[ \\{\"key\": \"workerGroup\", \
   \"stringValue\": \"MyworkerGroup\"\\} \\] \\}, \\{\"id\": \"Schedule\", \"name\": \"Schedule\", \
   \"fields\": \\[ \\{\"key\": \"startDateTime\", \"stringValue\": \"bad-time\"\\}, \\{\"key\": \
   \"type\", \"stringValue\": \"Schedule\"\\}, \\{\"key\": \"period\", \"stringValue\": \"1 \
   hour\"\\}, \\{\"key\": \"endDateTime\", \"stringValue\": \"2012-09-25T18:00:00\"\\} \\] \\}, \
   \\{\"id\": \"SayHello\", \"name\": \"SayHello\", \"fields\": \\[ \\{\"key\": \"type\", \
   \"stringValue\": \"ShellCommandActivity\"\\}, \\{\"key\": \"command\", \"stringValue\": \"echo \
   hello\"\\}, \\{\"key\": \"parent\", \"refValue\": \"Default\"\\}, \\{\"key\": \"schedule\", \
   \"refValue\": \"Schedule\"\\} \\] \\} \\] \\}   x-amzn-RequestId: \
   496a1f5a-0e6a-11e2-a61c-bd6312c92ddd Content-Type: application/x-amz-json-1.1 Content-Length: \
   278 Date: Mon, 12 Nov 2012 17:50:53 GMT \\{\"errored\": true, \"validationErrors\": \\[ \
   \\{\"errors\": \\[\"INVALID_FIELD_VALUE: 'startDateTime' value must be a literal datetime \
   value.\"\\], \"id\": \"Schedule\"\\} \\] \\}   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
