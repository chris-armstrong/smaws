open Types

module CancelQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_query_request ->
    ( cancel_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_query_request ->
    ( cancel_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Cancels a query that has been issued. Cancellation is provided only if the query has not \
   completed running before the cancellation request was issued. Because cancellation is an \
   idempotent operation, subsequent cancellation requests will return a [CancellationMessage], \
   indicating that the query has already been canceled. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.cancel-query.html}code \
   sample} for details. \n"]

module CreateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create a scheduled query that will be run on your behalf at the configured schedule. \
   Timestream assumes the execution role provided as part of the [ScheduledQueryExecutionRoleArn] \
   parameter to run the query. You can use the [NotificationConfiguration] parameter to configure \
   notification for your scheduled query operations.\n"]

module DeleteScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a given scheduled query. This is an irreversible operation. \n"]

module DescribeAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_settings_request ->
    ( describe_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_settings_request ->
    ( describe_account_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the settings for your account that include the query pricing model and the configured \
   maximum TCUs the service can use for your query workload.\n\n\
  \ You're charged only for the duration of compute units used for your workloads.\n\
  \ "]

module DescribeEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "DescribeEndpoints returns a list of available endpoints to make Timestream API calls against. \
   This API is available through both Write and Query.\n\n\
  \ Because the Timestream SDKs are designed to transparently work with the service\226\128\153s \
   architecture, including the management and mapping of the service endpoints, {i it is not \
   recommended that you use this API unless}:\n\
  \ \n\
  \  {ul\n\
  \        {-  You are using \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/VPCEndpoints}VPC endpoints \
   (Amazon Web Services PrivateLink) with Timestream } \n\
  \            \n\
  \             }\n\
  \        {-  Your application uses a programming language that does not yet have SDK support\n\
  \            \n\
  \             }\n\
  \        {-  You require better control over the client-side implementation\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For detailed information on how and when to use and implement DescribeEndpoints, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/Using.API.html#Using-API.endpoint-discovery}The \
   Endpoint Discovery Pattern}.\n\
  \   "]

module DescribeScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_query_request ->
    ( describe_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_query_request ->
    ( describe_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides detailed information about a scheduled query.\n"]

module ExecuteScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " You can use this API to run a scheduled query manually. \n\n\
  \ If you enabled [QueryInsights], this API also returns insights and metrics related to the \
   query that you executed as part of an Amazon SNS notification. [QueryInsights] helps with \
   performance tuning of your query. For more information about [QueryInsights], see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html}Using \
   query insights to optimize queries in Amazon Timestream}.\n\
  \ "]

module ListScheduledQueries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of all scheduled queries in the caller's Amazon account and Region. \
   [ListScheduledQueries] is eventually consistent. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all tags on a Timestream query resource.\n"]

module PrepareQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    prepare_query_request ->
    ( prepare_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    prepare_query_request ->
    ( prepare_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A synchronous operation that allows you to submit a query with parameters to be stored by \
   Timestream for later running. Timestream only supports using this operation with [ValidateOnly] \
   set to [true]. \n"]

module Query : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `QueryExecutionException of query_execution_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `QueryExecutionException of query_execution_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `QueryExecutionException of query_execution_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [Query] is a synchronous operation that enables you to run a query against your Amazon \
   Timestream data.\n\n\
  \ If you enabled [QueryInsights], this API also returns insights and metrics related to the \
   query that you executed. [QueryInsights] helps with performance tuning of your query. For more \
   information about [QueryInsights], see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html}Using \
   query insights to optimize queries in Amazon Timestream}.\n\
  \ \n\
  \   The maximum number of [Query] API requests you're allowed to make with [QueryInsights] \
   enabled is 1 query per second (QPS). If you exceed this query rate, it might result in \
   throttling.\n\
  \   \n\
  \      [Query] will time out after 60 seconds. You must update the default timeout in the SDK to \
   support a timeout of 60 seconds. See the \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.run-query.html}code \
   sample} for details. \n\
  \     \n\
  \      Your query request will fail in the following cases:\n\
  \      \n\
  \       {ul\n\
  \             {-   If you submit a [Query] request with the same client token outside of the \
   5-minute idempotency window. \n\
  \                 \n\
  \                  }\n\
  \             {-   If you submit a [Query] request with the same client token, but change other \
   parameters, within the 5-minute idempotency window. \n\
  \                 \n\
  \                  }\n\
  \             {-   If the size of the row (including the query metadata) exceeds 1 MB, then the \
   query will fail with the following error message: \n\
  \                 \n\
  \                   [Query aborted as max page response size has been exceeded by the output\n\
  \                        result row] \n\
  \                  \n\
  \                   }\n\
  \             {-   If the IAM principal of the query initiator and the result reader are not the \
   same and/or the query initiator and the result reader do not have the same query string in the \
   query requests, the query will fail with an [Invalid\n\
  \                        pagination token] error. \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associate a set of tags with a Timestream resource. You can then activate these user-defined \
   tags so that they appear on the Billing and Cost Management console for cost allocation \
   tracking. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the association of tags from a Timestream query resource.\n"]

module UpdateAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_account_settings_request ->
    ( update_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_account_settings_request ->
    ( update_account_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Transitions your account to use TCUs for query pricing and modifies the maximum query compute \
   units that you've configured. If you reduce the value of [MaxQueryTCU] to a desired \
   configuration, the new value can take up to 24 hours to be effective.\n\n\
  \  After you've transitioned your account to use TCUs for query pricing, you can't transition to \
   using bytes scanned for query pricing.\n\
  \  \n\
  \   "]

module UpdateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a scheduled query.\n"]
