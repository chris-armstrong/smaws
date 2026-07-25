type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An entity that you specified does not exist.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request failed because it attempted to create resource beyond the allowed service quota.\n"]

type nonrec internal_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "This exception occurs due to unexpected causes.\n"]

type nonrec concurrent_modification_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "There is concurrent modification on a rule, target, archive, or replay.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec connection_state =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | AUTHORIZED [@ocaml.doc ""]
  | DEAUTHORIZED [@ocaml.doc ""]
  | AUTHORIZING [@ocaml.doc ""]
  | DEAUTHORIZING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_arn = string [@@ocaml.doc ""]

type nonrec update_connection_response = {
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection that was updated.\n"]
  connection_state : connection_state option;
      [@ocaml.doc "The state of the connection that was updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last modified.\n"]
  last_authorized_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last authorized.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec connection_body_parameter = {
  key : string_ option; [@ocaml.doc "The key for the parameter.\n"]
  value : sensitive_string option; [@ocaml.doc "The value associated with the key.\n"]
  is_value_secret : boolean_ option; [@ocaml.doc "Specified whether the value is secret.\n"]
}
[@@ocaml.doc
  "Additional parameter included in the body. You can include up to 100 additional body parameters \
   per request. An event payload cannot exceed 64 KB.\n"]

type nonrec connection_body_parameters_list = connection_body_parameter list [@@ocaml.doc ""]

type nonrec query_string_value_sensitive = string [@@ocaml.doc ""]

type nonrec query_string_key = string [@@ocaml.doc ""]

type nonrec connection_query_string_parameter = {
  key : query_string_key option; [@ocaml.doc "The key for a query string parameter.\n"]
  value : query_string_value_sensitive option;
      [@ocaml.doc "The value associated with the key for the query string parameter.\n"]
  is_value_secret : boolean_ option; [@ocaml.doc "Specifies whether the value is secret.\n"]
}
[@@ocaml.doc
  "Additional query string parameter for the connection. You can include up to 100 additional \
   query string parameters per request. Each additional parameter counts towards the event payload \
   size, which cannot exceed 64 KB.\n"]

type nonrec connection_query_string_parameters_list = connection_query_string_parameter list
[@@ocaml.doc ""]

type nonrec header_value_sensitive = string [@@ocaml.doc ""]

type nonrec header_key = string [@@ocaml.doc ""]

type nonrec connection_header_parameter = {
  key : header_key option; [@ocaml.doc "The key for the parameter.\n"]
  value : header_value_sensitive option; [@ocaml.doc "The value associated with the key.\n"]
  is_value_secret : boolean_ option; [@ocaml.doc "Specified whether the value is a secret.\n"]
}
[@@ocaml.doc
  "Additional parameter included in the header. You can include up to 100 additional header \
   parameters per request. An event payload cannot exceed 64 KB.\n"]

type nonrec connection_header_parameters_list = connection_header_parameter list [@@ocaml.doc ""]

type nonrec connection_http_parameters = {
  header_parameters : connection_header_parameters_list option;
      [@ocaml.doc "Contains additional header parameters for the connection.\n"]
  query_string_parameters : connection_query_string_parameters_list option;
      [@ocaml.doc "Contains additional query string parameters for the connection.\n"]
  body_parameters : connection_body_parameters_list option;
      [@ocaml.doc "Contains additional body string parameters for the connection.\n"]
}
[@@ocaml.doc "Contains additional parameters for the connection.\n"]

type nonrec auth_header_parameters_sensitive = string [@@ocaml.doc ""]

type nonrec auth_header_parameters = string [@@ocaml.doc ""]

type nonrec update_connection_api_key_auth_request_parameters = {
  api_key_name : auth_header_parameters option;
      [@ocaml.doc "The name of the API key to use for authorization.\n"]
  api_key_value : auth_header_parameters_sensitive option;
      [@ocaml.doc "The value associated with teh API key to use for authorization.\n"]
}
[@@ocaml.doc "Contains the API key authorization parameters to use to update the connection.\n"]

type nonrec connection_o_auth_http_method =
  | GET [@ocaml.doc ""]
  | POST [@ocaml.doc ""]
  | PUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec https_endpoint = string [@@ocaml.doc ""]

type nonrec update_connection_o_auth_client_request_parameters = {
  client_i_d : auth_header_parameters option;
      [@ocaml.doc "The client ID to use for OAuth authorization.\n"]
  client_secret : auth_header_parameters_sensitive option;
      [@ocaml.doc
        "The client secret assciated with the client ID to use for OAuth authorization.\n"]
}
[@@ocaml.doc "Contains the OAuth authorization parameters to use for the connection.\n"]

type nonrec update_connection_o_auth_request_parameters = {
  client_parameters : update_connection_o_auth_client_request_parameters option;
      [@ocaml.doc
        "A [UpdateConnectionOAuthClientRequestParameters] object that contains the client \
         parameters to use for the connection when OAuth is specified as the authorization type.\n"]
  authorization_endpoint : https_endpoint option;
      [@ocaml.doc
        "The URL to the authorization endpoint when OAuth is specified as the authorization type.\n"]
  http_method : connection_o_auth_http_method option;
      [@ocaml.doc "The method used to connect to the HTTP endpoint.\n"]
  o_auth_http_parameters : connection_http_parameters option;
      [@ocaml.doc "The additional HTTP parameters used for the OAuth authorization request.\n"]
}
[@@ocaml.doc "Contains the OAuth request parameters to use for the connection.\n"]

type nonrec update_connection_basic_auth_request_parameters = {
  username : auth_header_parameters option;
      [@ocaml.doc "The user name to use for Basic authorization.\n"]
  password : auth_header_parameters_sensitive option;
      [@ocaml.doc "The password associated with the user name to use for Basic authorization.\n"]
}
[@@ocaml.doc "Contains the Basic authorization parameters for the connection.\n"]

type nonrec update_connection_auth_request_parameters = {
  basic_auth_parameters : update_connection_basic_auth_request_parameters option;
      [@ocaml.doc
        "A [UpdateConnectionBasicAuthRequestParameters] object that contains the authorization \
         parameters for Basic authorization.\n"]
  o_auth_parameters : update_connection_o_auth_request_parameters option;
      [@ocaml.doc
        "A [UpdateConnectionOAuthRequestParameters] object that contains the authorization \
         parameters for OAuth authorization.\n"]
  api_key_auth_parameters : update_connection_api_key_auth_request_parameters option;
      [@ocaml.doc
        "A [UpdateConnectionApiKeyAuthRequestParameters] object that contains the authorization \
         parameters for API key authorization.\n"]
  invocation_http_parameters : connection_http_parameters option;
      [@ocaml.doc
        "A [ConnectionHttpParameters] object that contains the additional parameters to use for \
         the connection.\n"]
}
[@@ocaml.doc "Contains the additional parameters to use for the connection.\n"]

type nonrec connection_authorization_type =
  | BASIC [@ocaml.doc ""]
  | OAUTH_CLIENT_CREDENTIALS [@ocaml.doc ""]
  | API_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_description = string [@@ocaml.doc ""]

type nonrec connection_name = string [@@ocaml.doc ""]

type nonrec update_connection_request = {
  name : connection_name; [@ocaml.doc "The name of the connection to update.\n"]
  description : connection_description option; [@ocaml.doc "A description for the connection.\n"]
  authorization_type : connection_authorization_type option;
      [@ocaml.doc "The type of authorization to use for the connection.\n"]
  auth_parameters : update_connection_auth_request_parameters option;
      [@ocaml.doc "The authorization parameters to use for the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_event_pattern_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The event pattern is not valid.\n"]

type nonrec archive_state_reason = string [@@ocaml.doc ""]

type nonrec archive_state =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec archive_arn = string [@@ocaml.doc ""]

type nonrec update_archive_response = {
  archive_arn : archive_arn option; [@ocaml.doc "The ARN of the archive.\n"]
  state : archive_state option; [@ocaml.doc "The state of the archive.\n"]
  state_reason : archive_state_reason option;
      [@ocaml.doc "The reason that the archive is in the current state.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time at which the archive was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec retention_days = int [@@ocaml.doc ""]

type nonrec event_pattern = string [@@ocaml.doc ""]

type nonrec archive_description = string [@@ocaml.doc ""]

type nonrec archive_name = string [@@ocaml.doc ""]

type nonrec update_archive_request = {
  archive_name : archive_name; [@ocaml.doc "The name of the archive to update.\n"]
  description : archive_description option; [@ocaml.doc "The description for the archive.\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc "The event pattern to use to filter events sent to the archive.\n"]
  retention_days : retention_days option;
      [@ocaml.doc "The number of days to retain events in the archive.\n"]
}
[@@ocaml.doc ""]

type nonrec api_destination_state = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec api_destination_arn = string [@@ocaml.doc ""]

type nonrec update_api_destination_response = {
  api_destination_arn : api_destination_arn option;
      [@ocaml.doc "The ARN of the API destination that was updated.\n"]
  api_destination_state : api_destination_state option;
      [@ocaml.doc "The state of the API destination that was updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was last modified.\n"]
}
[@@ocaml.doc ""]

type nonrec api_destination_invocation_rate_limit_per_second = int [@@ocaml.doc ""]

type nonrec api_destination_http_method =
  | POST [@ocaml.doc ""]
  | GET [@ocaml.doc ""]
  | HEAD [@ocaml.doc ""]
  | OPTIONS [@ocaml.doc ""]
  | PUT [@ocaml.doc ""]
  | PATCH [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec api_destination_description = string [@@ocaml.doc ""]

type nonrec api_destination_name = string [@@ocaml.doc ""]

type nonrec update_api_destination_request = {
  name : api_destination_name; [@ocaml.doc "The name of the API destination to update.\n"]
  description : api_destination_description option;
      [@ocaml.doc "The name of the API destination to update.\n"]
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection to use for the API destination.\n"]
  invocation_endpoint : https_endpoint option;
      [@ocaml.doc "The URL to the endpoint to use for the API destination.\n"]
  http_method : api_destination_http_method option;
      [@ocaml.doc "The method to use for the API destination.\n"]
  invocation_rate_limit_per_second : api_destination_invocation_rate_limit_per_second option;
      [@ocaml.doc "The maximum number of invocations per second to send to the API destination.\n"]
}
[@@ocaml.doc ""]

type nonrec managed_rule_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "This rule was created by an Amazon Web Services service on behalf of your account. It is \
   managed by that service. If you see this error in response to [DeleteRule] or [RemoveTargets], \
   you can use the [Force] parameter in those calls to delete the rule or remove targets from the \
   rule. You cannot modify these managed rules by using [DisableRule], [EnableRule], [PutTargets], \
   [PutRule], [TagResource], or [UntagResource]. \n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : arn;
      [@ocaml.doc "The ARN of the EventBridge resource from which you are removing tags.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The list of tag keys to remove from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec test_event_pattern_response = {
  result_ : boolean_ option; [@ocaml.doc "Indicates whether the event matches the event pattern.\n"]
}
[@@ocaml.doc ""]

type nonrec test_event_pattern_request = {
  event_pattern : event_pattern;
      [@ocaml.doc
        "The event pattern. For more information, see \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events \
         and Event Patterns} in the {i Amazon EventBridge User Guide}.\n"]
  event : string_;
      [@ocaml.doc
        "The event, in JSON format, to test against the event pattern. The JSON must follow the \
         format specified in \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/aws-events.html}Amazon Web \
         Services Events}, and the following fields are mandatory:\n\n\
        \ {ul\n\
        \       {-   [id] \n\
        \           \n\
        \            }\n\
        \       {-   [account] \n\
        \           \n\
        \            }\n\
        \       {-   [source] \n\
        \           \n\
        \            }\n\
        \       {-   [time] \n\
        \           \n\
        \            }\n\
        \       {-   [region] \n\
        \           \n\
        \            }\n\
        \       {-   [resources] \n\
        \           \n\
        \            }\n\
        \       {-   [detail-type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "A string you can use to assign a value. The combination of tag keys and values can help \
         you organize and categorize your resources.\n"]
  value : tag_value; [@ocaml.doc "The value for the specified tag key.\n"]
}
[@@ocaml.doc
  "A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and \
   event buses support tagging.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : arn;
      [@ocaml.doc "The ARN of the EventBridge resource that you're adding tags to.\n"]
  tags : tag_list; [@ocaml.doc "The list of key-value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource you are trying to create already exists.\n"]

type nonrec replay_state_reason = string [@@ocaml.doc ""]

type nonrec replay_state =
  | STARTING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replay_arn = string [@@ocaml.doc ""]

type nonrec start_replay_response = {
  replay_arn : replay_arn option; [@ocaml.doc "The ARN of the replay.\n"]
  state : replay_state option; [@ocaml.doc "The state of the replay.\n"]
  state_reason : replay_state_reason option;
      [@ocaml.doc "The reason that the replay is in the state.\n"]
  replay_start_time : timestamp option; [@ocaml.doc "The time at which the replay started.\n"]
}
[@@ocaml.doc ""]

type nonrec replay_destination_filters = arn list [@@ocaml.doc ""]

type nonrec replay_destination = {
  arn : arn;
      [@ocaml.doc
        "The ARN of the event bus to replay event to. You can replay events only to the event bus \
         specified to create the archive.\n"]
  filter_arns : replay_destination_filters option;
      [@ocaml.doc "A list of ARNs for rules to replay events to.\n"]
}
[@@ocaml.doc "A [ReplayDestination] object that contains details about a replay.\n"]

type nonrec replay_description = string [@@ocaml.doc ""]

type nonrec replay_name = string [@@ocaml.doc ""]

type nonrec start_replay_request = {
  replay_name : replay_name; [@ocaml.doc "The name of the replay to start.\n"]
  description : replay_description option; [@ocaml.doc "A description for the replay to start.\n"]
  event_source_arn : arn; [@ocaml.doc "The ARN of the archive to replay events from.\n"]
  event_start_time : timestamp;
      [@ocaml.doc
        "A time stamp for the time to start replaying events. Only events that occurred between \
         the [EventStartTime] and [EventEndTime] are replayed.\n"]
  event_end_time : timestamp;
      [@ocaml.doc
        "A time stamp for the time to stop replaying events. Only events that occurred between the \
         [EventStartTime] and [EventEndTime] are replayed.\n"]
  destination : replay_destination;
      [@ocaml.doc
        "A [ReplayDestination] object that includes details about the destination for the replay.\n"]
}
[@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec remove_targets_result_entry = {
  target_id : target_id option; [@ocaml.doc "The ID of the target.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "The error code that indicates why the target removal failed. If the value is \
         [ConcurrentModificationException], too many requests were made at the same time.\n"]
  error_message : error_message option;
      [@ocaml.doc "The error message that explains why the target removal failed.\n"]
}
[@@ocaml.doc "Represents a target that failed to be removed from a rule.\n"]

type nonrec remove_targets_result_entry_list = remove_targets_result_entry list [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec remove_targets_response = {
  failed_entry_count : integer option; [@ocaml.doc "The number of failed entries.\n"]
  failed_entries : remove_targets_result_entry_list option;
      [@ocaml.doc "The failed target entries.\n"]
}
[@@ocaml.doc ""]

type nonrec target_id_list = target_id list [@@ocaml.doc ""]

type nonrec event_bus_name_or_arn = string [@@ocaml.doc ""]

type nonrec rule_name = string [@@ocaml.doc ""]

type nonrec remove_targets_request = {
  rule : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
  ids : target_id_list; [@ocaml.doc "The IDs of the targets to remove from the rule.\n"]
  force : boolean_ option;
      [@ocaml.doc
        "If this is a managed rule, created by an Amazon Web Services service on your behalf, you \
         must specify [Force] as [True] to remove targets. This parameter is ignored for rules \
         that are not managed rules. You can check whether a rule is a managed rule by using \
         [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_disabled_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation you are attempting is not available in this region.\n"]

type nonrec non_partner_event_bus_name = string [@@ocaml.doc ""]

type nonrec statement_id = string [@@ocaml.doc ""]

type nonrec remove_permission_request = {
  statement_id : statement_id option;
      [@ocaml.doc
        "The statement ID corresponding to the account that is no longer allowed to put events to \
         the default event bus.\n"]
  remove_all_permissions : boolean_ option;
      [@ocaml.doc "Specifies whether to remove all permissions.\n"]
  event_bus_name : non_partner_event_bus_name option;
      [@ocaml.doc
        "The name of the event bus to revoke permissions for. If you omit this, the default event \
         bus is used.\n"]
}
[@@ocaml.doc ""]

type nonrec put_targets_result_entry = {
  target_id : target_id option; [@ocaml.doc "The ID of the target.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "The error code that indicates why the target addition failed. If the value is \
         [ConcurrentModificationException], too many requests were made at the same time.\n"]
  error_message : error_message option;
      [@ocaml.doc "The error message that explains why the target addition failed.\n"]
}
[@@ocaml.doc "Represents a target that failed to be added to a rule.\n"]

type nonrec put_targets_result_entry_list = put_targets_result_entry list [@@ocaml.doc ""]

type nonrec put_targets_response = {
  failed_entry_count : integer option; [@ocaml.doc "The number of failed entries.\n"]
  failed_entries : put_targets_result_entry_list option; [@ocaml.doc "The failed target entries.\n"]
}
[@@ocaml.doc ""]

type nonrec maximum_event_age_in_seconds = int [@@ocaml.doc ""]

type nonrec maximum_retry_attempts = int [@@ocaml.doc ""]

type nonrec retry_policy = {
  maximum_retry_attempts : maximum_retry_attempts option;
      [@ocaml.doc
        "The maximum number of retry attempts to make before the request fails. Retry attempts \
         continue until either the maximum number of attempts is made or until the duration of the \
         [MaximumEventAgeInSeconds] is met.\n"]
  maximum_event_age_in_seconds : maximum_event_age_in_seconds option;
      [@ocaml.doc "The maximum amount of time, in seconds, to continue to make retry attempts.\n"]
}
[@@ocaml.doc "A [RetryPolicy] object that includes information about the retry policy settings.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec dead_letter_config = {
  arn : resource_arn option;
      [@ocaml.doc "The ARN of the SQS queue specified as the target for the dead-letter queue.\n"]
}
[@@ocaml.doc
  "A [DeadLetterConfig] object that contains information about a dead-letter queue configuration.\n"]

type nonrec sage_maker_pipeline_parameter_value = string [@@ocaml.doc ""]

type nonrec sage_maker_pipeline_parameter_name = string [@@ocaml.doc ""]

type nonrec sage_maker_pipeline_parameter = {
  name : sage_maker_pipeline_parameter_name;
      [@ocaml.doc
        "Name of parameter to start execution of a SageMaker AI Model Building Pipeline.\n"]
  value : sage_maker_pipeline_parameter_value;
      [@ocaml.doc
        "Value of parameter to start execution of a SageMaker AI Model Building Pipeline.\n"]
}
[@@ocaml.doc
  "Name/Value pair of a parameter to start execution of a SageMaker AI Model Building Pipeline.\n"]

type nonrec sage_maker_pipeline_parameter_list = sage_maker_pipeline_parameter list [@@ocaml.doc ""]

type nonrec sage_maker_pipeline_parameters = {
  pipeline_parameter_list : sage_maker_pipeline_parameter_list option;
      [@ocaml.doc
        "List of Parameter names and values for SageMaker AI Model Building Pipeline execution.\n"]
}
[@@ocaml.doc
  "These are custom parameters to use when the target is a SageMaker AI Model Building Pipeline \
   that starts based on EventBridge events.\n"]

type nonrec statement_name = string [@@ocaml.doc ""]

type nonrec sql = string [@@ocaml.doc ""]

type nonrec db_user = string [@@ocaml.doc ""]

type nonrec database = string [@@ocaml.doc ""]

type nonrec redshift_secret_manager_arn = string [@@ocaml.doc ""]

type nonrec redshift_data_parameters = {
  secret_manager_arn : redshift_secret_manager_arn option;
      [@ocaml.doc
        "The name or ARN of the secret that enables access to the database. Required when \
         authenticating using Amazon Web Services Secrets Manager.\n"]
  database : database;
      [@ocaml.doc
        "The name of the database. Required when authenticating using temporary credentials.\n"]
  db_user : db_user option;
      [@ocaml.doc
        "The database user name. Required when authenticating using temporary credentials.\n"]
  sql : sql; [@ocaml.doc "The SQL statement text to run.\n"]
  statement_name : statement_name option;
      [@ocaml.doc
        "The name of the SQL statement. You can name the SQL statement when you create it to \
         identify the query.\n"]
  with_event : boolean_ option;
      [@ocaml.doc
        "Indicates whether to send an event back to EventBridge after the SQL statement runs.\n"]
}
[@@ocaml.doc
  "These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke \
   the Amazon Redshift Data API ExecuteStatement based on EventBridge events.\n"]

type nonrec query_string_value = string [@@ocaml.doc ""]

type nonrec query_string_parameters_map = (query_string_key * query_string_value) list
[@@ocaml.doc ""]

type nonrec header_value = string [@@ocaml.doc ""]

type nonrec header_parameters_map = (header_key * header_value) list [@@ocaml.doc ""]

type nonrec path_parameter = string [@@ocaml.doc ""]

type nonrec path_parameter_list = path_parameter list [@@ocaml.doc ""]

type nonrec http_parameters = {
  path_parameter_values : path_parameter_list option;
      [@ocaml.doc
        "The path parameter values to be used to populate API Gateway REST API or EventBridge \
         ApiDestination path wildcards (\"*\").\n"]
  header_parameters : header_parameters_map option;
      [@ocaml.doc
        "The headers that need to be sent as part of request invoking the API Gateway REST API or \
         EventBridge ApiDestination.\n"]
  query_string_parameters : query_string_parameters_map option;
      [@ocaml.doc
        "The query string keys/values that need to be sent as part of request invoking the API \
         Gateway REST API or EventBridge ApiDestination.\n"]
}
[@@ocaml.doc
  "These are custom parameter to be used when the target is an API Gateway REST APIs or \
   EventBridge ApiDestinations. In the latter case, these are merged with any InvocationParameters \
   specified on the Connection, with any values from the Connection taking precedence.\n"]

type nonrec message_group_id = string [@@ocaml.doc ""]

type nonrec sqs_parameters = {
  message_group_id : message_group_id option;
      [@ocaml.doc "The FIFO message group ID to use as the target.\n"]
}
[@@ocaml.doc
  "This structure includes the custom parameter to be used when the target is an SQS FIFO queue.\n"]

type nonrec batch_retry_strategy = {
  attempts : integer option;
      [@ocaml.doc
        "The number of times to attempt to retry, if the job fails. Valid values are \
         1\226\128\14710.\n"]
}
[@@ocaml.doc
  "The retry strategy to use for failed jobs, if the target is an Batch job. If you specify a \
   retry strategy here, it overrides the retry strategy defined in the job definition.\n"]

type nonrec batch_array_properties = {
  size : integer option;
      [@ocaml.doc
        "The size of the array, if this is an array batch job. Valid values are integers between 2 \
         and 10,000.\n"]
}
[@@ocaml.doc
  "The array properties for the submitted job, such as the size of the array. The array size can \
   be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. \
   This parameter is used only if the target is an Batch job.\n"]

type nonrec batch_parameters = {
  job_definition : string_;
      [@ocaml.doc
        "The ARN or name of the job definition to use if the event target is an Batch job. This \
         job definition must already exist.\n"]
  job_name : string_;
      [@ocaml.doc "The name to use for this execution of the job, if the target is an Batch job.\n"]
  array_properties : batch_array_properties option;
      [@ocaml.doc
        "The array properties for the submitted job, such as the size of the array. The array size \
         can be between 2 and 10,000. If you specify array properties for a job, it becomes an \
         array job. This parameter is used only if the target is an Batch job.\n"]
  retry_strategy : batch_retry_strategy option;
      [@ocaml.doc
        "The retry strategy to use for failed jobs, if the target is an Batch job. The retry \
         strategy is the number of times to retry the failed job execution. Valid values are \
         1\226\128\14710. When you specify a retry strategy here, it overrides the retry strategy \
         defined in the job definition.\n"]
}
[@@ocaml.doc "The custom parameters to be used when the target is an Batch job.\n"]

type nonrec reference_id = string [@@ocaml.doc ""]

type nonrec propagate_tags = TASK_DEFINITION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec placement_strategy_field = string [@@ocaml.doc ""]

type nonrec placement_strategy_type =
  | RANDOM [@ocaml.doc ""]
  | SPREAD [@ocaml.doc ""]
  | BINPACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec placement_strategy = {
  type_ : placement_strategy_type option;
      [@ocaml.doc
        "The type of placement strategy. The random placement strategy randomly places tasks on \
         available candidates. The spread placement strategy spreads placement across available \
         candidates evenly based on the field parameter. The binpack strategy places tasks on \
         available candidates that have the least available amount of the resource that is \
         specified with the field parameter. For example, if you binpack on memory, a task is \
         placed on the instance with the least amount of remaining memory (but still enough to run \
         the task). \n"]
  field : placement_strategy_field option;
      [@ocaml.doc
        "The field to apply the placement strategy against. For the spread placement strategy, \
         valid values are instanceId (or host, which has the same effect), or any platform or \
         custom attribute that is applied to a container instance, such as \
         attribute:ecs.availability-zone. For the binpack placement strategy, valid values are cpu \
         and memory. For the random placement strategy, this field is not used. \n"]
}
[@@ocaml.doc
  "The task placement strategy for a task or service. To learn more, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html}Task \
   Placement Strategies} in the Amazon Elastic Container Service Service Developer Guide.\n"]

type nonrec placement_strategies = placement_strategy list [@@ocaml.doc ""]

type nonrec placement_constraint_expression = string [@@ocaml.doc ""]

type nonrec placement_constraint_type =
  | DISTINCT_INSTANCE [@ocaml.doc ""]
  | MEMBER_OF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec placement_constraint = {
  type_ : placement_constraint_type option;
      [@ocaml.doc
        "The type of constraint. Use distinctInstance to ensure that each task in a particular \
         group is running on a different container instance. Use memberOf to restrict the \
         selection to a group of valid candidates. \n"]
  expression : placement_constraint_expression option;
      [@ocaml.doc
        "A cluster query language expression to apply to the constraint. You cannot specify an \
         expression if the constraint type is [distinctInstance]. To learn more, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster \
         Query Language} in the Amazon Elastic Container Service Developer Guide. \n"]
}
[@@ocaml.doc
  "An object representing a constraint on task placement. To learn more, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html}Task \
   Placement Constraints} in the Amazon Elastic Container Service Developer Guide.\n"]

type nonrec placement_constraints = placement_constraint list [@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item_base = int [@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item_weight = int [@@ocaml.doc ""]

type nonrec capacity_provider = string [@@ocaml.doc ""]

type nonrec capacity_provider_strategy_item = {
  capacity_provider : capacity_provider; [@ocaml.doc "The short name of the capacity provider.\n"]
  weight : capacity_provider_strategy_item_weight option;
      [@ocaml.doc
        "The weight value designates the relative percentage of the total number of tasks launched \
         that should use the specified capacity provider. The weight value is taken into \
         consideration after the base value, if defined, is satisfied.\n"]
  base : capacity_provider_strategy_item_base option;
      [@ocaml.doc
        "The base value designates how many tasks, at a minimum, to run on the specified capacity \
         provider. Only one capacity provider in a capacity provider strategy can have a base \
         defined. If no value is specified, the default value of 0 is used. \n"]
}
[@@ocaml.doc
  "The details of a capacity provider strategy. To learn more, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html}CapacityProviderStrategyItem} \
   in the Amazon ECS API Reference.\n"]

type nonrec capacity_provider_strategy = capacity_provider_strategy_item list [@@ocaml.doc ""]

type nonrec assign_public_ip = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec aws_vpc_configuration = {
  subnets : string_list;
      [@ocaml.doc
        "Specifies the subnets associated with the task. These subnets must all be in the same \
         VPC. You can specify as many as 16 subnets.\n"]
  security_groups : string_list option;
      [@ocaml.doc
        "Specifies the security groups associated with the task. These security groups must all be \
         in the same VPC. You can specify as many as five security groups. If you do not specify a \
         security group, the default security group for the VPC is used.\n"]
  assign_public_ip : assign_public_ip option;
      [@ocaml.doc
        "Specifies whether the task's elastic network interface receives a public IP address. You \
         can specify [ENABLED] only when [LaunchType] in [EcsParameters] is set to [FARGATE].\n"]
}
[@@ocaml.doc
  "This structure specifies the VPC subnets and security groups for the task, and whether a public \
   IP address is to be used. This structure is relevant only for ECS tasks that use the [awsvpc] \
   network mode.\n"]

type nonrec network_configuration = {
  awsvpc_configuration : aws_vpc_configuration option;
      [@ocaml.doc
        "Use this structure to specify the VPC subnets and security groups for the task, and \
         whether a public IP address is to be used. This structure is relevant only for ECS tasks \
         that use the [awsvpc] network mode.\n"]
}
[@@ocaml.doc "This structure specifies the network configuration for an ECS task.\n"]

type nonrec launch_type = EC2 [@ocaml.doc ""] | FARGATE [@ocaml.doc ""] | EXTERNAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec limit_min1 = int [@@ocaml.doc ""]

type nonrec ecs_parameters = {
  task_definition_arn : arn;
      [@ocaml.doc
        "The ARN of the task definition to use if the event target is an Amazon ECS task. \n"]
  task_count : limit_min1 option;
      [@ocaml.doc "The number of tasks to create based on [TaskDefinition]. The default is 1.\n"]
  launch_type : launch_type option;
      [@ocaml.doc
        "Specifies the launch type on which your task is running. The launch type that you specify \
         here must match one of the launch type (compatibilities) of the target task. The \
         [FARGATE] value is supported only in the Regions where Fargate witt Amazon ECS is \
         supported. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html}Fargate \
         on Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
  network_configuration : network_configuration option;
      [@ocaml.doc
        "Use this structure if the Amazon ECS task uses the [awsvpc] network mode. This structure \
         specifies the VPC subnets and security groups associated with the task, and whether a \
         public IP address is to be used. This structure is required if [LaunchType] is [FARGATE] \
         because the [awsvpc] mode is required for Fargate tasks.\n\n\
        \ If you specify [NetworkConfiguration] when the target ECS task does not use the [awsvpc] \
         network mode, the task fails.\n\
        \ "]
  platform_version : string_ option;
      [@ocaml.doc
        "Specifies the platform version for the task. Specify only the numeric portion of the \
         platform version, such as [1.1.0].\n\n\
        \ This structure is used only if [LaunchType] is [FARGATE]. For more information about \
         valid platform versions, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate \
         Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n\
        \ "]
  group : string_ option;
      [@ocaml.doc
        "Specifies an ECS task group for the task. The maximum length is 255 characters.\n"]
  capacity_provider_strategy : capacity_provider_strategy option;
      [@ocaml.doc
        "The capacity provider strategy to use for the task.\n\n\
        \ If a [capacityProviderStrategy] is specified, the [launchType] parameter must be \
         omitted. If no [capacityProviderStrategy] or launchType is specified, the \
         [defaultCapacityProviderStrategy] for the cluster is used. \n\
        \ "]
  enable_ecs_managed_tags : boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable Amazon ECS managed tags for the task. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging \
         Your Amazon ECS Resources} in the Amazon Elastic Container Service Developer Guide. \n"]
  enable_execute_command : boolean_ option;
      [@ocaml.doc
        "Whether or not to enable the execute command functionality for the containers in this \
         task. If true, this enables execute command functionality on all containers in the task.\n"]
  placement_constraints : placement_constraints option;
      [@ocaml.doc
        "An array of placement constraint objects to use for the task. You can specify up to 10 \
         constraints per task (including constraints in the task definition and those specified at \
         runtime).\n"]
  placement_strategy : placement_strategies option;
      [@ocaml.doc
        "The placement strategy objects to use for the task. You can specify a maximum of five \
         strategy rules per task. \n"]
  propagate_tags : propagate_tags option;
      [@ocaml.doc
        "Specifies whether to propagate the tags from the task definition to the task. If no value \
         is specified, the tags are not propagated. Tags can only be propagated to the task during \
         task creation. To add tags to a task after task creation, use the TagResource API action. \n"]
  reference_id : reference_id option; [@ocaml.doc "The reference ID to use for the task.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The metadata that you apply to the task to help you categorize and organize them. Each \
         tag consists of a key and an optional value, both of which you define. To learn more, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags}RunTask} \
         in the Amazon ECS API Reference.\n"]
}
[@@ocaml.doc "The custom parameters to be used when the target is an Amazon ECS task.\n"]

type nonrec run_command_target_value = string [@@ocaml.doc ""]

type nonrec run_command_target_values = run_command_target_value list [@@ocaml.doc ""]

type nonrec run_command_target_key = string [@@ocaml.doc ""]

type nonrec run_command_target = {
  key : run_command_target_key; [@ocaml.doc "Can be either [tag:] {i tag-key} or [InstanceIds].\n"]
  values : run_command_target_values;
      [@ocaml.doc
        "If [Key] is [tag:] {i tag-key}, [Values] is a list of tag values. If [Key] is \
         [InstanceIds], [Values] is a list of Amazon EC2 instance IDs.\n"]
}
[@@ocaml.doc
  "Information about the EC2 instances that are to be sent the command, specified as key-value \
   pairs. Each [RunCommandTarget] block can include only one key, but this key may specify \
   multiple values.\n"]

type nonrec run_command_targets = run_command_target list [@@ocaml.doc ""]

type nonrec run_command_parameters = {
  run_command_targets : run_command_targets;
      [@ocaml.doc
        "Currently, we support including only one RunCommandTarget block, which specifies either \
         an array of InstanceIds or a tag.\n"]
}
[@@ocaml.doc
  "This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2 \
   instances are to be sent the command. \n"]

type nonrec target_partition_key_path = string [@@ocaml.doc ""]

type nonrec kinesis_parameters = {
  partition_key_path : target_partition_key_path;
      [@ocaml.doc
        "The JSON path to be extracted from the event and used as the partition key. For more \
         information, see \
         {{:https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key}Amazon \
         Kinesis Streams Key Concepts} in the {i Amazon Kinesis Streams Developer Guide}.\n"]
}
[@@ocaml.doc
  "This object enables you to specify a JSON path to extract from the event and use as the \
   partition key for the Amazon Kinesis data stream, so that you can control the shard to which \
   the event goes. If you do not include this parameter, the default is to use the [eventId] as \
   the partition key.\n"]

type nonrec transformer_input = string [@@ocaml.doc ""]

type nonrec target_input_path = string [@@ocaml.doc ""]

type nonrec input_transformer_path_key = string [@@ocaml.doc ""]

type nonrec transformer_paths = (input_transformer_path_key * target_input_path) list
[@@ocaml.doc ""]

type nonrec input_transformer = {
  input_paths_map : transformer_paths option;
      [@ocaml.doc
        "Map of JSON paths to be extracted from the event. You can then insert these in the \
         template in [InputTemplate] to produce the output you want to be sent to the target.\n\n\
        \  [InputPathsMap] is an array key-value pairs, where each value is a valid JSON path. You \
         can have as many as 100 key-value pairs. You must use JSON dot notation, not bracket \
         notation.\n\
        \ \n\
        \  The keys cannot start with \"Amazon Web Services.\" \n\
        \  "]
  input_template : transformer_input;
      [@ocaml.doc
        "Input template where you specify placeholders that will be filled with the values of the \
         keys from [InputPathsMap] to customize the data sent to the target. Enclose each \
         [InputPathsMaps] value in brackets: <{i value}> The InputTemplate must be valid JSON.\n\n\
        \ If [InputTemplate] is a JSON object (surrounded by curly braces), the following \
         restrictions apply:\n\
        \ \n\
        \  {ul\n\
        \        {-  The placeholder cannot be used as an object key.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following example shows the syntax for using [InputPathsMap] and [InputTemplate].\n\
        \   \n\
        \     [ \"InputTransformer\":] \n\
        \    \n\
        \      [{] \n\
        \     \n\
        \       [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n\
        \        \"$.detail.status\"},] \n\
        \      \n\
        \        \n\
        \       {[\n\
        \       \"InputTemplate\": \" is in state \"\n\
        \       ]}\n\
        \        \n\
        \       \n\
        \         [}] \n\
        \        \n\
        \         To have the [InputTemplate] include quote marks within a JSON string, escape \
         each quote marks with a slash, as in the following example:\n\
        \         \n\
        \           [ \"InputTransformer\":] \n\
        \          \n\
        \            [{] \n\
        \           \n\
        \             [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n\
        \        \"$.detail.status\"},] \n\
        \            \n\
        \              \n\
        \             {[\n\
        \             \"InputTemplate\": \" is in state \\\"\\\"\"\n\
        \             ]}\n\
        \              \n\
        \             \n\
        \               [}] \n\
        \              \n\
        \               The [InputTemplate] can also be valid JSON with varibles in quotes or out, \
         as in the following example:\n\
        \               \n\
        \                 [ \"InputTransformer\":] \n\
        \                \n\
        \                  [{] \n\
        \                 \n\
        \                   [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n\
        \        \"$.detail.status\"},] \n\
        \                  \n\
        \                    \n\
        \                   {[\n\
        \                   \"InputTemplate\": '\\{\"myInstance\": ,\"myStatus\": \" is in state \
         \\\"\\\"\"\\}'\n\
        \                   ]}\n\
        \                    \n\
        \                   \n\
        \                     [}] \n\
        \                    "]
}
[@@ocaml.doc
  "Contains the parameters needed for you to provide custom input to a target based on one or more \
   pieces of data extracted from the event.\n"]

type nonrec target_input = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec target_arn = string [@@ocaml.doc ""]

type nonrec target = {
  id : target_id;
      [@ocaml.doc "The ID of the target. We recommend using a memorable and unique string.\n"]
  arn : target_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the target.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule \
         is triggered. If one rule triggers multiple targets, you can use a different IAM role for \
         each target.\n"]
  input : target_input option;
      [@ocaml.doc
        "Valid JSON text passed to the target. In this case, nothing from the event itself is \
         passed to the target. For more information, see \
         {{:http://www.rfc-editor.org/rfc/rfc7159.txt}The JavaScript Object Notation (JSON) Data \
         Interchange Format}.\n"]
  input_path : target_input_path option;
      [@ocaml.doc
        "The value of the JSONPath that is used for extracting part of the matched event when \
         passing it to the target. You must use JSON dot notation, not bracket notation. For more \
         information about JSON paths, see {{:http://goessner.net/articles/JsonPath/}JSONPath}.\n"]
  input_transformer : input_transformer option;
      [@ocaml.doc
        "Settings to enable you to provide custom input to a target based on certain event data. \
         You can extract one or more key-value pairs from the event and then use that data to send \
         customized input to the target.\n"]
  kinesis_parameters : kinesis_parameters option;
      [@ocaml.doc
        "The custom parameter you can use to control the shard assignment, when the target is a \
         Kinesis data stream. If you do not include this parameter, the default is to use the \
         [eventId] as the partition key.\n"]
  run_command_parameters : run_command_parameters option;
      [@ocaml.doc "Parameters used when you are using the rule to invoke Amazon EC2 Run Command.\n"]
  ecs_parameters : ecs_parameters option;
      [@ocaml.doc
        "Contains the Amazon ECS task definition and task count to be used, if the event target is \
         an Amazon ECS task. For more information about Amazon ECS tasks, see \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html}Task \
         Definitions } in the {i Amazon EC2 Container Service Developer Guide}.\n"]
  batch_parameters : batch_parameters option;
      [@ocaml.doc
        "If the event target is an Batch job, this contains the job definition, job name, and \
         other parameters. For more information, see \
         {{:https://docs.aws.amazon.com/batch/latest/userguide/jobs.html}Jobs} in the {i Batch \
         User Guide}.\n"]
  sqs_parameters : sqs_parameters option;
      [@ocaml.doc
        "Contains the message group ID to use when the target is a FIFO queue.\n\n\
        \ If you specify an SQS FIFO queue as a target, the queue must have content-based \
         deduplication enabled.\n\
        \ "]
  http_parameters : http_parameters option;
      [@ocaml.doc
        "Contains the HTTP parameters to use when the target is a API Gateway REST endpoint or \
         EventBridge ApiDestination.\n\n\
        \ If you specify an API Gateway REST API or EventBridge ApiDestination as a target, you \
         can use this parameter to specify headers, path parameters, and query string keys/values \
         as part of your target invoking request. If you're using ApiDestinations, the \
         corresponding Connection can also have these values configured. In case of any \
         conflicting keys, values from the Connection take precedence.\n\
        \ "]
  redshift_data_parameters : redshift_data_parameters option;
      [@ocaml.doc
        "Contains the Amazon Redshift Data API parameters to use when the target is a Amazon \
         Redshift cluster.\n\n\
        \ If you specify a Amazon Redshift Cluster as a Target, you can use this to specify \
         parameters to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge \
         events.\n\
        \ "]
  sage_maker_pipeline_parameters : sage_maker_pipeline_parameters option;
      [@ocaml.doc
        "Contains the SageMaker AI Model Building Pipeline parameters to start execution of a \
         SageMaker AI Model Building Pipeline.\n\n\
        \ If you specify a SageMaker AI Model Building Pipeline as a target, you can use this to \
         specify parameters to start a pipeline execution based on EventBridge events.\n\
        \ "]
  dead_letter_config : dead_letter_config option;
      [@ocaml.doc
        "The [DeadLetterConfig] that defines the target queue to send dead-letter queue events to.\n"]
  retry_policy : retry_policy option;
      [@ocaml.doc
        "The [RetryPolicy] object that contains the retry policy configuration to use for the \
         dead-letter queue.\n"]
}
[@@ocaml.doc
  "Targets are the resources to be invoked when a rule is triggered. For a complete list of \
   services and resources that can be set as a target, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutTargets.html}PutTargets}.\n\n\
  \ If you are setting the event bus of another account as the target, and that account granted \
   permission to your account through an organization instead of directly by the account ID, then \
   you must specify a [RoleArn] with proper permissions in the [Target] structure. For more \
   information, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending \
   and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User \
   Guide}.\n\
  \ "]

type nonrec target_list = target list [@@ocaml.doc ""]

type nonrec put_targets_request = {
  rule : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
  targets : target_list; [@ocaml.doc "The targets to update or add to the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_arn = string [@@ocaml.doc ""]

type nonrec put_rule_response = {
  rule_arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_description = string [@@ocaml.doc ""]

type nonrec rule_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec schedule_expression = string [@@ocaml.doc ""]

type nonrec put_rule_request = {
  name : rule_name; [@ocaml.doc "The name of the rule that you are creating or updating.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc
        "The scheduling expression. For example, \"cron(0 20 * * ? *)\" or \"rate(5 minutes)\".\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc
        "The event pattern. For more information, see \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events \
         and Event Patterns} in the {i Amazon EventBridge User Guide}.\n"]
  state : rule_state option; [@ocaml.doc "Indicates whether the rule is enabled or disabled.\n"]
  description : rule_description option; [@ocaml.doc "A description of the rule.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role associated with the rule.\n\n\
        \ If you're setting an event bus in another account as the target and that account granted \
         permission to your account through an organization instead of directly by the account ID, \
         you must specify a [RoleArn] with proper permissions in the [Target] structure, instead \
         of here in this parameter.\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "The list of key-value pairs to associate with the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus to associate with this rule. If you omit this, the \
         default event bus is used.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_length_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The event bus policy is too long. For more information, see the limits.\n"]

type nonrec condition = {
  type_ : string_;
      [@ocaml.doc
        "Specifies the type of condition. Currently the only supported value is [StringEquals].\n"]
  key : string_;
      [@ocaml.doc
        "Specifies the key for the condition. Currently the only supported key is \
         [aws:PrincipalOrgID].\n"]
  value : string_;
      [@ocaml.doc
        "Specifies the value for the key. Currently, this must be the ID of the organization.\n"]
}
[@@ocaml.doc
  "A JSON string which you can use to limit the event bus permissions you are granting to only \
   accounts that fulfill the condition. Currently, the only supported condition is membership in a \
   certain Amazon Web Services organization. The string must contain [Type], [Key], and [Value] \
   fields. The [Value] field specifies the ID of the Amazon Web Services organization. Following \
   is an example value for [Condition]:\n\n\
  \  ['{\"Type\" : \"StringEquals\", \"Key\": \"aws:PrincipalOrgID\", \"Value\":\n\
  \        \"o-1234567890\"}'] \n\
  \ "]

type nonrec principal = string [@@ocaml.doc ""]

type nonrec action = string [@@ocaml.doc ""]

type nonrec put_permission_request = {
  event_bus_name : non_partner_event_bus_name option;
      [@ocaml.doc
        "The name of the event bus associated with the rule. If you omit this, the default event \
         bus is used.\n"]
  action : action option;
      [@ocaml.doc "The action that you are enabling the other account to perform.\n"]
  principal : principal option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account ID that you are permitting to put events to your \
         default event bus. Specify \"*\" to permit any account to put events to your default \
         event bus.\n\n\
        \ If you specify \"*\" without specifying [Condition], avoid creating rules that may match \
         undesirable events. To create more secure rules, make sure that the event pattern for \
         each rule contains an [account] field with a specific account ID from which to receive \
         events. Rules with an account field do not match any events sent from other accounts.\n\
        \ "]
  statement_id : statement_id option;
      [@ocaml.doc
        "An identifier string for the external account that you are granting permissions to. If \
         you later want to revoke the permission for this external account, specify this \
         [StatementId] when you run \
         {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemovePermission.html}RemovePermission}.\n"]
  condition : condition option;
      [@ocaml.doc
        "This parameter enables you to limit the permission to accounts that fulfill a certain \
         condition, such as being a member of a certain Amazon Web Services organization. For more \
         information about Amazon Web Services Organizations, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html}What \
         Is Amazon Web Services Organizations} in the {i Amazon Web Services Organizations User \
         Guide}.\n\n\
        \ If you specify [Condition] with an Amazon Web Services organization ID, and specify \
         \"*\" as the value for [Principal], you grant permission to all the accounts in the named \
         organization.\n\
        \ \n\
        \  The [Condition] is a JSON string which must contain [Type], [Key], and [Value] fields.\n\
        \  "]
  policy : string_ option;
      [@ocaml.doc
        "A JSON string that describes the permission policy statement. You can include a [Policy] \
         parameter in the request instead of using the [StatementId], [Action], [Principal], or \
         [Condition] parameters.\n"]
}
[@@ocaml.doc ""]

type nonrec event_id = string [@@ocaml.doc ""]

type nonrec put_partner_events_result_entry = {
  event_id : event_id option; [@ocaml.doc "The ID of the event.\n"]
  error_code : error_code option;
      [@ocaml.doc "The error code that indicates why the event submission failed.\n"]
  error_message : error_message option;
      [@ocaml.doc "The error message that explains why the event submission failed.\n"]
}
[@@ocaml.doc "Represents an event that a partner tried to generate, but failed.\n"]

type nonrec put_partner_events_result_entry_list = put_partner_events_result_entry list
[@@ocaml.doc ""]

type nonrec put_partner_events_response = {
  failed_entry_count : integer option;
      [@ocaml.doc
        "The number of events from this operation that could not be written to the partner event \
         bus.\n"]
  entries : put_partner_events_result_entry_list option;
      [@ocaml.doc
        "The list of events from this operation that were successfully written to the partner \
         event bus.\n"]
}
[@@ocaml.doc ""]

type nonrec event_resource = string [@@ocaml.doc ""]

type nonrec event_resource_list = event_resource list [@@ocaml.doc ""]

type nonrec event_source_name = string [@@ocaml.doc ""]

type nonrec event_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec put_partner_events_request_entry = {
  time : event_time option; [@ocaml.doc "The date and time of the event.\n"]
  source : event_source_name option; [@ocaml.doc "The event source that is generating the entry.\n"]
  resources : event_resource_list option;
      [@ocaml.doc
        "Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event \
         primarily concerns. Any number, including zero, may be present.\n"]
  detail_type : string_ option;
      [@ocaml.doc "A free-form string used to decide what fields to expect in the event detail.\n"]
  detail : string_ option;
      [@ocaml.doc
        "A valid JSON string. There is no other schema imposed. The JSON string may contain fields \
         and nested subobjects.\n"]
}
[@@ocaml.doc "The details about an event generated by an SaaS partner.\n"]

type nonrec put_partner_events_request_entry_list = put_partner_events_request_entry list
[@@ocaml.doc ""]

type nonrec put_partner_events_request = {
  entries : put_partner_events_request_entry_list;
      [@ocaml.doc "The list of events to write to the event bus.\n"]
}
[@@ocaml.doc ""]

type nonrec put_events_result_entry = {
  event_id : event_id option; [@ocaml.doc "The ID of the event.\n"]
  error_code : error_code option;
      [@ocaml.doc "The error code that indicates why the event submission failed.\n"]
  error_message : error_message option;
      [@ocaml.doc "The error message that explains why the event submission failed.\n"]
}
[@@ocaml.doc "Represents an event that failed to be submitted.\n"]

type nonrec put_events_result_entry_list = put_events_result_entry list [@@ocaml.doc ""]

type nonrec put_events_response = {
  failed_entry_count : integer option; [@ocaml.doc "The number of failed entries.\n"]
  entries : put_events_result_entry_list option;
      [@ocaml.doc
        "The successfully and unsuccessfully ingested events results. If the ingestion was \
         successful, the entry has the event ID in it. Otherwise, you can use the error code and \
         error message to identify the problem with the entry.\n"]
}
[@@ocaml.doc ""]

type nonrec trace_header = string [@@ocaml.doc ""]

type nonrec non_partner_event_bus_name_or_arn = string [@@ocaml.doc ""]

type nonrec put_events_request_entry = {
  time : event_time option;
      [@ocaml.doc
        "The time stamp of the event, per {{:https://www.rfc-editor.org/rfc/rfc3339.txt}RFC3339}. \
         If no time stamp is provided, the time stamp of the \
         {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html}PutEvents} \
         call is used.\n"]
  source : string_ option; [@ocaml.doc "The source of the event.\n"]
  resources : event_resource_list option;
      [@ocaml.doc
        "Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event \
         primarily concerns. Any number, including zero, may be present.\n"]
  detail_type : string_ option;
      [@ocaml.doc "Free-form string used to decide what fields to expect in the event detail.\n"]
  detail : string_ option;
      [@ocaml.doc
        "A valid JSON string. There is no other schema imposed. The JSON string may contain fields \
         and nested subobjects.\n"]
  event_bus_name : non_partner_event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus to receive the event. Only the rules that are associated \
         with this event bus are used to match the event. If you omit this, the default event bus \
         is used.\n"]
  trace_header : trace_header option;
      [@ocaml.doc
        "An X-Ray trade header, which is an http header (X-Amzn-Trace-Id) that contains the \
         trace-id associated with the event.\n\n\
        \ To learn more about X-Ray trace headers, see \
         {{:https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html#xray-concepts-tracingheader}Tracing \
         header} in the X-Ray Developer Guide.\n\
        \ "]
}
[@@ocaml.doc "Represents an event to be submitted.\n"]

type nonrec put_events_request_entry_list = put_events_request_entry list [@@ocaml.doc ""]

type nonrec put_events_request = {
  entries : put_events_request_entry_list;
      [@ocaml.doc
        "The entry that defines an event in your system. You can specify several parameters for \
         the entry such as the source and type of the event, resources associated with the event, \
         and so on.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_targets_by_rule_response = {
  targets : target_list option; [@ocaml.doc "The targets assigned to the rule.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Indicates whether there are additional results to retrieve. If there are no more results, \
         the value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_max100 = int [@@ocaml.doc ""]

type nonrec list_targets_by_rule_request = {
  rule : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc "The list of tag keys and values associated with the resource you specified\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : arn;
      [@ocaml.doc "The ARN of the EventBridge resource for which you want to view tags.\n"]
}
[@@ocaml.doc ""]

type nonrec event_bus_name = string [@@ocaml.doc ""]

type nonrec managed_by = string [@@ocaml.doc ""]

type nonrec rule = {
  name : rule_name option; [@ocaml.doc "The name of the rule.\n"]
  arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc
        "The event pattern of the rule. For more information, see \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events \
         and Event Patterns} in the {i Amazon EventBridge User Guide}.\n"]
  state : rule_state option; [@ocaml.doc "The state of the rule.\n"]
  description : rule_description option; [@ocaml.doc "The description of the rule.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc
        "The scheduling expression. For example, \"cron(0 20 * * ? *)\", \"rate(5 minutes)\". For \
         more information, see \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule-schedule.html}Creating \
         an Amazon EventBridge rule that runs on a schedule}.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that is used for target invocation.\n\n\
        \ If you're setting an event bus in another account as the target and that account granted \
         permission to your account through an organization instead of directly by the account ID, \
         you must specify a [RoleArn] with proper permissions in the [Target] structure, instead \
         of here in this parameter.\n\
        \ "]
  managed_by : managed_by option;
      [@ocaml.doc
        "If the rule was created on behalf of your account by an Amazon Web Services service, this \
         field displays the principal name of the service that created the rule.\n"]
  event_bus_name : event_bus_name option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
}
[@@ocaml.doc "Contains information about a rule in Amazon EventBridge.\n"]

type nonrec rule_response_list = rule list [@@ocaml.doc ""]

type nonrec list_rules_response = {
  rules : rule_response_list option; [@ocaml.doc "The rules that match the specified criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Indicates whether there are additional results to retrieve. If there are no more results, \
         the value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rules_request = {
  name_prefix : rule_name option; [@ocaml.doc "The prefix matching the rule name.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus to list the rules for. If you omit this, the default \
         event bus is used.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_name_list = rule_name list [@@ocaml.doc ""]

type nonrec list_rule_names_by_target_response = {
  rule_names : rule_name_list option;
      [@ocaml.doc "The names of the rules that can invoke the given target.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Indicates whether there are additional results to retrieve. If there are no more results, \
         the value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rule_names_by_target_request = {
  target_arn : target_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the target resource.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus to list rules for. If you omit this, the default event \
         bus is used.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec replay = {
  replay_name : replay_name option; [@ocaml.doc "The name of the replay.\n"]
  event_source_arn : arn option; [@ocaml.doc "The ARN of the archive to replay event from.\n"]
  state : replay_state option; [@ocaml.doc "The current state of the replay.\n"]
  state_reason : replay_state_reason option;
      [@ocaml.doc "A description of why the replay is in the current state.\n"]
  event_start_time : timestamp option;
      [@ocaml.doc
        "A time stamp for the time to start replaying events. This is determined by the time in \
         the event as described in \
         {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html#eventbridge-Type-PutEventsRequestEntry-Time}Time}.\n"]
  event_end_time : timestamp option;
      [@ocaml.doc
        "A time stamp for the time to start replaying events. Any event with a creation time prior \
         to the [EventEndTime] specified is replayed.\n"]
  event_last_replayed_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the last event was replayed.\n"]
  replay_start_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the replay started.\n"]
  replay_end_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the replay completed.\n"]
}
[@@ocaml.doc "A [Replay] object that contains details about a replay.\n"]

type nonrec replay_list = replay list [@@ocaml.doc ""]

type nonrec list_replays_response = {
  replays : replay_list option;
      [@ocaml.doc "An array of [Replay] objects that contain information about the replay.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_replays_request = {
  name_prefix : replay_name option;
      [@ocaml.doc
        "A name prefix to filter the replays returned. Only replays with name that match the \
         prefix are returned.\n"]
  state : replay_state option; [@ocaml.doc "The state of the replay.\n"]
  event_source_arn : arn option;
      [@ocaml.doc "The ARN of the archive from which the events are replayed.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of replays to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_event_source = {
  arn : string_ option; [@ocaml.doc "The ARN of the partner event source.\n"]
  name : string_ option; [@ocaml.doc "The name of the partner event source.\n"]
}
[@@ocaml.doc
  "A partner event source is created by an SaaS partner. If a customer creates a partner event bus \
   that matches this event source, that Amazon Web Services account can receive events from the \
   partner's applications or services.\n"]

type nonrec partner_event_source_list = partner_event_source list [@@ocaml.doc ""]

type nonrec list_partner_event_sources_response = {
  partner_event_sources : partner_event_source_list option;
      [@ocaml.doc "The list of partner event sources returned by the operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent operation to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_event_source_name_prefix = string [@@ocaml.doc ""]

type nonrec list_partner_event_sources_request = {
  name_prefix : partner_event_source_name_prefix;
      [@ocaml.doc
        "If you specify this, the results are limited to only those partner event sources that \
         start with the string you specify.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to this operation. Specifying this retrieves the \
         next set of results.\n"]
  limit : limit_max100 option;
      [@ocaml.doc
        "pecifying this limits the number of results returned by this operation. The operation \
         also returns a NextToken which you can use in a subsequent operation to retrieve the next \
         set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec event_source_state =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec partner_event_source_account = {
  account : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that the partner event source was offered to.\n"]
  creation_time : timestamp option; [@ocaml.doc "The date and time the event source was created.\n"]
  expiration_time : timestamp option;
      [@ocaml.doc
        "The date and time that the event source will expire, if the Amazon Web Services account \
         doesn't create a matching event bus for it.\n"]
  state : event_source_state option;
      [@ocaml.doc
        "The state of the event source. If it is ACTIVE, you have already created a matching event \
         bus for this event source, and that event bus is active. If it is PENDING, either you \
         haven't yet created a matching event bus, or that event bus is deactivated. If it is \
         DELETED, you have created a matching event bus, but the event source has since been \
         deleted.\n"]
}
[@@ocaml.doc "The Amazon Web Services account that a partner event source has been offered to.\n"]

type nonrec partner_event_source_account_list = partner_event_source_account list [@@ocaml.doc ""]

type nonrec list_partner_event_source_accounts_response = {
  partner_event_source_accounts : partner_event_source_account_list option;
      [@ocaml.doc "The list of partner event sources returned by the operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent operation to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_partner_event_source_accounts_request = {
  event_source_name : event_source_name;
      [@ocaml.doc "The name of the partner event source to display account information about.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token returned by a previous call to this operation. Specifying this retrieves the \
         next set of results.\n"]
  limit : limit_max100 option;
      [@ocaml.doc
        "Specifying this limits the number of results returned by this operation. The operation \
         also returns a NextToken which you can use in a subsequent operation to retrieve the next \
         set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec event_source = {
  arn : string_ option; [@ocaml.doc "The ARN of the event source.\n"]
  created_by : string_ option;
      [@ocaml.doc "The name of the partner that created the event source.\n"]
  creation_time : timestamp option; [@ocaml.doc "The date and time the event source was created.\n"]
  expiration_time : timestamp option;
      [@ocaml.doc
        "The date and time that the event source will expire, if the Amazon Web Services account \
         doesn't create a matching event bus for it.\n"]
  name : string_ option; [@ocaml.doc "The name of the event source.\n"]
  state : event_source_state option;
      [@ocaml.doc
        "The state of the event source. If it is ACTIVE, you have already created a matching event \
         bus for this event source, and that event bus is active. If it is PENDING, either you \
         haven't yet created a matching event bus, or that event bus is deactivated. If it is \
         DELETED, you have created a matching event bus, but the event source has since been \
         deleted.\n"]
}
[@@ocaml.doc
  "A partner event source is created by an SaaS partner. If a customer creates a partner event bus \
   that matches this event source, that Amazon Web Services account can receive events from the \
   partner's applications or services.\n"]

type nonrec event_source_list = event_source list [@@ocaml.doc ""]

type nonrec list_event_sources_response = {
  event_sources : event_source_list option; [@ocaml.doc "The list of event sources.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent operation to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec event_source_name_prefix = string [@@ocaml.doc ""]

type nonrec list_event_sources_request = {
  name_prefix : event_source_name_prefix option;
      [@ocaml.doc
        "Specifying this limits the results to only those partner event sources with names that \
         start with the specified prefix.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option;
      [@ocaml.doc
        "Specifying this limits the number of results returned by this operation. The operation \
         also returns a NextToken which you can use in a subsequent operation to retrieve the next \
         set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec event_bus = {
  name : string_ option; [@ocaml.doc "The name of the event bus.\n"]
  arn : string_ option; [@ocaml.doc "The ARN of the event bus.\n"]
  policy : string_ option;
      [@ocaml.doc
        "The permissions policy of the event bus, describing which other Amazon Web Services \
         accounts can write events to this event bus.\n"]
}
[@@ocaml.doc
  "An event bus receives events from a source and routes them to rules associated with that event \
   bus. Your account's default event bus receives events from Amazon Web Services services. A \
   custom event bus can receive events from your custom applications and services. A partner event \
   bus receives events from an event source created by an SaaS partner. These events come from the \
   partners services or applications.\n"]

type nonrec event_bus_list = event_bus list [@@ocaml.doc ""]

type nonrec list_event_buses_response = {
  event_buses : event_bus_list option; [@ocaml.doc "This list of event buses.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent operation to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_event_buses_request = {
  name_prefix : event_bus_name option;
      [@ocaml.doc
        "Specifying this limits the results to only those event buses with names that start with \
         the specified prefix.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option;
      [@ocaml.doc
        "Specifying this limits the number of results returned by this operation. The operation \
         also returns a NextToken which you can use in a subsequent operation to retrieve the next \
         set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_state_reason = string [@@ocaml.doc ""]

type nonrec connection = {
  connection_arn : connection_arn option; [@ocaml.doc "The ARN of the connection.\n"]
  name : connection_name option; [@ocaml.doc "The name of the connection.\n"]
  connection_state : connection_state option; [@ocaml.doc "The state of the connection.\n"]
  state_reason : connection_state_reason option;
      [@ocaml.doc "The reason that the connection is in the connection state.\n"]
  authorization_type : connection_authorization_type option;
      [@ocaml.doc "The authorization type specified for the connection.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last modified.\n"]
  last_authorized_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last authorized.\n"]
}
[@@ocaml.doc "Contains information about a connection.\n"]

type nonrec connection_response_list = connection list [@@ocaml.doc ""]

type nonrec list_connections_response = {
  connections : connection_response_list option;
      [@ocaml.doc "An array of connections objects that include details about the connections.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent request to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connections_request = {
  name_prefix : connection_name option;
      [@ocaml.doc
        "A name prefix to filter results returned. Only connections with a name that starts with \
         the prefix are returned.\n"]
  connection_state : connection_state option; [@ocaml.doc "The state of the connection.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of connections to return.\n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec archive = {
  archive_name : archive_name option; [@ocaml.doc "The name of the archive.\n"]
  event_source_arn : arn option;
      [@ocaml.doc
        "The ARN of the event bus associated with the archive. Only events from this event bus are \
         sent to the archive.\n"]
  state : archive_state option; [@ocaml.doc "The current state of the archive.\n"]
  state_reason : archive_state_reason option;
      [@ocaml.doc "A description for the reason that the archive is in the current state.\n"]
  retention_days : retention_days option;
      [@ocaml.doc "The number of days to retain events in the archive before they are deleted.\n"]
  size_bytes : long option; [@ocaml.doc "The size of the archive, in bytes.\n"]
  event_count : long option; [@ocaml.doc "The number of events in the archive.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The time stamp for the time that the archive was created.\n"]
}
[@@ocaml.doc "An [Archive] object that contains details about an archive.\n"]

type nonrec archive_response_list = archive list [@@ocaml.doc ""]

type nonrec list_archives_response = {
  archives : archive_response_list option;
      [@ocaml.doc "An array of [Archive] objects that include details about an archive.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_archives_request = {
  name_prefix : archive_name option;
      [@ocaml.doc
        "A name prefix to filter the archives returned. Only archives with name that match the \
         prefix are returned.\n"]
  event_source_arn : arn option;
      [@ocaml.doc "The ARN of the event source associated with the archive.\n"]
  state : archive_state option; [@ocaml.doc "The state of the archive.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec api_destination = {
  api_destination_arn : api_destination_arn option; [@ocaml.doc "The ARN of the API destination.\n"]
  name : api_destination_name option; [@ocaml.doc "The name of the API destination.\n"]
  api_destination_state : api_destination_state option;
      [@ocaml.doc "The state of the API destination.\n"]
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection specified for the API destination.\n"]
  invocation_endpoint : https_endpoint option;
      [@ocaml.doc "The URL to the endpoint for the API destination.\n"]
  http_method : api_destination_http_method option;
      [@ocaml.doc "The method to use to connect to the HTTP endpoint.\n"]
  invocation_rate_limit_per_second : api_destination_invocation_rate_limit_per_second option;
      [@ocaml.doc "The maximum number of invocations per second to send to the HTTP endpoint.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was last modified.\n"]
}
[@@ocaml.doc "Contains details about an API destination.\n"]

type nonrec api_destination_response_list = api_destination list [@@ocaml.doc ""]

type nonrec list_api_destinations_response = {
  api_destinations : api_destination_response_list option;
      [@ocaml.doc
        "An array of [ApiDestination] objects that include information about an API destination.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token you can use in a subsequent request to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_api_destinations_request = {
  name_prefix : api_destination_name option;
      [@ocaml.doc
        "A name prefix to filter results returned. Only API destinations with a name that starts \
         with the prefix are returned.\n"]
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection specified for the API destination.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token returned by a previous call to retrieve the next set of results.\n"]
  limit : limit_max100 option;
      [@ocaml.doc "The maximum number of API destinations to include in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_rule_request = {
  name : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_rule_request = {
  name : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
}
[@@ocaml.doc ""]

type nonrec created_by = string [@@ocaml.doc ""]

type nonrec describe_rule_response = {
  name : rule_name option; [@ocaml.doc "The name of the rule.\n"]
  arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc
        "The event pattern. For more information, see \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events \
         and Event Patterns} in the {i Amazon EventBridge User Guide}.\n"]
  schedule_expression : schedule_expression option;
      [@ocaml.doc
        "The scheduling expression. For example, \"cron(0 20 * * ? *)\", \"rate(5 minutes)\".\n"]
  state : rule_state option; [@ocaml.doc "Specifies whether the rule is enabled or disabled.\n"]
  description : rule_description option; [@ocaml.doc "The description of the rule.\n"]
  role_arn : role_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role associated with the rule.\n"]
  managed_by : managed_by option;
      [@ocaml.doc
        "If this is a managed rule, created by an Amazon Web Services service on your behalf, this \
         field displays the principal name of the Amazon Web Services service that created the \
         rule.\n"]
  event_bus_name : event_bus_name option;
      [@ocaml.doc "The name of the event bus associated with the rule.\n"]
  created_by : created_by option;
      [@ocaml.doc
        "The account ID of the user that created the rule. If you use [PutRule] to put a rule on \
         an event bus in another account, the other account is the owner of the rule, and the rule \
         ARN includes the account ID for that account. However, the value for [CreatedBy] is the \
         account ID as the account that created the rule in the other account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rule_request = {
  name : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_replay_response = {
  replay_name : replay_name option; [@ocaml.doc "The name of the replay.\n"]
  replay_arn : replay_arn option; [@ocaml.doc "The ARN of the replay.\n"]
  description : replay_description option; [@ocaml.doc "The description of the replay.\n"]
  state : replay_state option; [@ocaml.doc "The current state of the replay.\n"]
  state_reason : replay_state_reason option;
      [@ocaml.doc "The reason that the replay is in the current state.\n"]
  event_source_arn : arn option; [@ocaml.doc "The ARN of the archive events were replayed from.\n"]
  destination : replay_destination option;
      [@ocaml.doc "A [ReplayDestination] object that contains details about the replay.\n"]
  event_start_time : timestamp option;
      [@ocaml.doc "The time stamp of the first event that was last replayed from the archive.\n"]
  event_end_time : timestamp option;
      [@ocaml.doc "The time stamp for the last event that was replayed from the archive.\n"]
  event_last_replayed_time : timestamp option;
      [@ocaml.doc "The time that the event was last replayed.\n"]
  replay_start_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the replay started.\n"]
  replay_end_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the replay stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_replay_request = {
  replay_name : replay_name; [@ocaml.doc "The name of the replay to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_partner_event_source_response = {
  arn : string_ option; [@ocaml.doc "The ARN of the event source.\n"]
  name : string_ option; [@ocaml.doc "The name of the event source.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_partner_event_source_request = {
  name : event_source_name; [@ocaml.doc "The name of the event source to display.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_source_response = {
  arn : string_ option; [@ocaml.doc "The ARN of the partner event source.\n"]
  created_by : string_ option;
      [@ocaml.doc "The name of the SaaS partner that created the event source.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The date and time that the event source was created.\n"]
  expiration_time : timestamp option;
      [@ocaml.doc
        "The date and time that the event source will expire if you do not create a matching event \
         bus.\n"]
  name : string_ option; [@ocaml.doc "The name of the partner event source.\n"]
  state : event_source_state option;
      [@ocaml.doc
        "The state of the event source. If it is ACTIVE, you have already created a matching event \
         bus for this event source, and that event bus is active. If it is PENDING, either you \
         haven't yet created a matching event bus, or that event bus is deactivated. If it is \
         DELETED, you have created a matching event bus, but the event source has since been \
         deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_source_request = {
  name : event_source_name;
      [@ocaml.doc "The name of the partner event source to display the details of.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_bus_response = {
  name : string_ option;
      [@ocaml.doc "The name of the event bus. Currently, this is always [default].\n"]
  arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account permitted to write events to the current \
         account.\n"]
  policy : string_ option;
      [@ocaml.doc "The policy that enables the external account to send events to your account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_bus_request = {
  name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus to show details for. If you omit this, the default event \
         bus is displayed.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_api_key_auth_response_parameters = {
  api_key_name : auth_header_parameters option;
      [@ocaml.doc "The name of the header to use for the [APIKeyValue] used for authorization.\n"]
}
[@@ocaml.doc
  "Contains the authorization parameters for the connection if API Key is specified as the \
   authorization type.\n"]

type nonrec connection_o_auth_client_response_parameters = {
  client_i_d : auth_header_parameters option;
      [@ocaml.doc "The client ID associated with the response to the connection request.\n"]
}
[@@ocaml.doc
  "Contains the client response parameters for the connection when OAuth is specified as the \
   authorization type.\n"]

type nonrec connection_o_auth_response_parameters = {
  client_parameters : connection_o_auth_client_response_parameters option;
      [@ocaml.doc
        "A [ConnectionOAuthClientResponseParameters] object that contains details about the client \
         parameters returned when OAuth is specified as the authorization type.\n"]
  authorization_endpoint : https_endpoint option;
      [@ocaml.doc "The URL to the HTTP endpoint that authorized the request.\n"]
  http_method : connection_o_auth_http_method option;
      [@ocaml.doc "The method used to connect to the HTTP endpoint.\n"]
  o_auth_http_parameters : connection_http_parameters option;
      [@ocaml.doc "The additional HTTP parameters used for the OAuth authorization request.\n"]
}
[@@ocaml.doc
  "Contains the response parameters when OAuth is specified as the authorization type.\n"]

type nonrec connection_basic_auth_response_parameters = {
  username : auth_header_parameters option;
      [@ocaml.doc "The user name to use for Basic authorization.\n"]
}
[@@ocaml.doc
  "Contains the authorization parameters for the connection if Basic is specified as the \
   authorization type.\n"]

type nonrec connection_auth_response_parameters = {
  basic_auth_parameters : connection_basic_auth_response_parameters option;
      [@ocaml.doc "The authorization parameters for Basic authorization.\n"]
  o_auth_parameters : connection_o_auth_response_parameters option;
      [@ocaml.doc "The OAuth parameters to use for authorization.\n"]
  api_key_auth_parameters : connection_api_key_auth_response_parameters option;
      [@ocaml.doc "The API Key parameters to use for authorization.\n"]
  invocation_http_parameters : connection_http_parameters option;
      [@ocaml.doc
        "Additional parameters for the connection that are passed through with every invocation to \
         the HTTP endpoint.\n"]
}
[@@ocaml.doc "Contains the authorization parameters to use for the connection.\n"]

type nonrec secrets_manager_secret_arn = string [@@ocaml.doc ""]

type nonrec describe_connection_response = {
  connection_arn : connection_arn option; [@ocaml.doc "The ARN of the connection retrieved.\n"]
  name : connection_name option; [@ocaml.doc "The name of the connection retrieved.\n"]
  description : connection_description option;
      [@ocaml.doc "The description for the connection retrieved.\n"]
  connection_state : connection_state option;
      [@ocaml.doc "The state of the connection retrieved.\n"]
  state_reason : connection_state_reason option;
      [@ocaml.doc "The reason that the connection is in the current connection state.\n"]
  authorization_type : connection_authorization_type option;
      [@ocaml.doc "The type of authorization specified for the connection.\n"]
  secret_arn : secrets_manager_secret_arn option;
      [@ocaml.doc
        "The ARN of the secret created from the authorization parameters specified for the \
         connection.\n"]
  auth_parameters : connection_auth_response_parameters option;
      [@ocaml.doc "The parameters to use for authorization for the connection.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last modified.\n"]
  last_authorized_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last authorized.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_request = {
  name : connection_name; [@ocaml.doc "The name of the connection to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_archive_response = {
  archive_arn : archive_arn option; [@ocaml.doc "The ARN of the archive.\n"]
  archive_name : archive_name option; [@ocaml.doc "The name of the archive.\n"]
  event_source_arn : arn option;
      [@ocaml.doc "The ARN of the event source associated with the archive.\n"]
  description : archive_description option; [@ocaml.doc "The description of the archive.\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc "The event pattern used to filter events sent to the archive.\n"]
  state : archive_state option; [@ocaml.doc "The state of the archive.\n"]
  state_reason : archive_state_reason option;
      [@ocaml.doc "The reason that the archive is in the state.\n"]
  retention_days : retention_days option;
      [@ocaml.doc "The number of days to retain events for in the archive.\n"]
  size_bytes : long option; [@ocaml.doc "The size of the archive in bytes.\n"]
  event_count : long option; [@ocaml.doc "The number of events in the archive.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time at which the archive was created.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_archive_request = {
  archive_name : archive_name; [@ocaml.doc "The name of the archive to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_api_destination_response = {
  api_destination_arn : api_destination_arn option;
      [@ocaml.doc "The ARN of the API destination retrieved.\n"]
  name : api_destination_name option; [@ocaml.doc "The name of the API destination retrieved.\n"]
  description : api_destination_description option;
      [@ocaml.doc "The description for the API destination retrieved.\n"]
  api_destination_state : api_destination_state option;
      [@ocaml.doc "The state of the API destination retrieved.\n"]
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection specified for the API destination retrieved.\n"]
  invocation_endpoint : https_endpoint option;
      [@ocaml.doc "The URL to use to connect to the HTTP endpoint.\n"]
  http_method : api_destination_http_method option;
      [@ocaml.doc "The method to use to connect to the HTTP endpoint.\n"]
  invocation_rate_limit_per_second : api_destination_invocation_rate_limit_per_second option;
      [@ocaml.doc
        "The maximum number of invocations per second to specified for the API destination. Note \
         that if you set the invocation rate maximum to a value lower the rate necessary to send \
         all events received on to the destination HTTP endpoint, some events may not be delivered \
         within the 24-hour retry window. If you plan to set the rate lower than the rate \
         necessary to deliver all events, consider using a dead-letter queue to catch events that \
         are not delivered within 24 hours.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the API destination was last modified.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_api_destination_request = {
  name : api_destination_name; [@ocaml.doc "The name of the API destination to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_request = {
  name : rule_name; [@ocaml.doc "The name of the rule.\n"]
  event_bus_name : event_bus_name_or_arn option;
      [@ocaml.doc
        "The name or ARN of the event bus associated with the rule. If you omit this, the default \
         event bus is used.\n"]
  force : boolean_ option;
      [@ocaml.doc
        "If this is a managed rule, created by an Amazon Web Services service on your behalf, you \
         must specify [Force] as [True] to delete the rule. This parameter is ignored for rules \
         that are not managed rules. You can check whether a rule is a managed rule by using \
         [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_partner_event_source_request = {
  name : event_source_name; [@ocaml.doc "The name of the event source to delete.\n"]
  account : account_id;
      [@ocaml.doc
        "The Amazon Web Services account ID of the Amazon Web Services customer that the event \
         source was created for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_bus_request = {
  name : event_bus_name; [@ocaml.doc "The name of the event bus to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_response = {
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection that was deleted.\n"]
  connection_state : connection_state option;
      [@ocaml.doc "The state of the connection before it was deleted.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc
        "A time stamp for the time that the connection was last modified before it was deleted.\n"]
  last_authorized_time : timestamp option;
      [@ocaml.doc
        "A time stamp for the time that the connection was last authorized before it wa deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_request = {
  name : connection_name; [@ocaml.doc "The name of the connection to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_archive_response = unit [@@ocaml.doc ""]

type nonrec delete_archive_request = {
  archive_name : archive_name; [@ocaml.doc "The name of the archive to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_api_destination_response = unit [@@ocaml.doc ""]

type nonrec delete_api_destination_request = {
  name : api_destination_name; [@ocaml.doc "The name of the destination to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec deauthorize_connection_response = {
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection that authorization was removed from.\n"]
  connection_state : connection_state option; [@ocaml.doc "The state of the connection.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last updated.\n"]
  last_authorized_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last authorized.\n"]
}
[@@ocaml.doc ""]

type nonrec deauthorize_connection_request = {
  name : connection_name; [@ocaml.doc "The name of the connection to remove authorization from.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_state_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified state is not a valid state for an event source.\n"]

type nonrec deactivate_event_source_request = {
  name : event_source_name; [@ocaml.doc "The name of the partner event source to deactivate.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partner_event_source_response = {
  event_source_arn : string_ option; [@ocaml.doc "The ARN of the partner event source.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partner_event_source_request = {
  name : event_source_name;
      [@ocaml.doc
        "The name of the partner event source. This name must be unique and must be in the format \n\
         {[\n\
        \ {i partner_name}/{i event_namespace}/{i event_name} \n\
         ]}\n\
         . The Amazon Web Services account that wants to use this partner event source must create \
         a partner event bus with a name that matches the name of the partner event source.\n"]
  account : account_id;
      [@ocaml.doc
        "The Amazon Web Services account ID that is permitted to create a matching partner event \
         bus for this partner event source.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_bus_response = {
  event_bus_arn : string_ option; [@ocaml.doc "The ARN of the new event bus.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_bus_request = {
  name : event_bus_name;
      [@ocaml.doc
        "The name of the new event bus. \n\n\
        \ Event bus names cannot contain the / character. You can't use the name [default] for a \
         custom event bus, as this name is already used for your account's default event bus.\n\
        \ \n\
        \  If this is a partner event bus, the name must exactly match the name of the partner \
         event source that this event bus is matched to.\n\
        \  "]
  event_source_name : event_source_name option;
      [@ocaml.doc
        "If you are creating a partner event bus, this specifies the partner event source that the \
         new event bus will be matched with.\n"]
  tags : tag_list option; [@ocaml.doc "Tags to associate with the event bus.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_response = {
  connection_arn : connection_arn option;
      [@ocaml.doc "The ARN of the connection that was created by the request.\n"]
  connection_state : connection_state option;
      [@ocaml.doc "The state of the connection that was created by the request.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp for the time that the connection was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_api_key_auth_request_parameters = {
  api_key_name : auth_header_parameters;
      [@ocaml.doc "The name of the API key to use for authorization.\n"]
  api_key_value : auth_header_parameters_sensitive;
      [@ocaml.doc "The value for the API key to use for authorization.\n"]
}
[@@ocaml.doc "Contains the API key authorization parameters for the connection.\n"]

type nonrec create_connection_o_auth_client_request_parameters = {
  client_i_d : auth_header_parameters;
      [@ocaml.doc "The client ID to use for OAuth authorization for the connection.\n"]
  client_secret : auth_header_parameters_sensitive;
      [@ocaml.doc
        "The client secret associated with the client ID to use for OAuth authorization for the \
         connection.\n"]
}
[@@ocaml.doc "Contains the Basic authorization parameters to use for the connection.\n"]

type nonrec create_connection_o_auth_request_parameters = {
  client_parameters : create_connection_o_auth_client_request_parameters;
      [@ocaml.doc
        "A [CreateConnectionOAuthClientRequestParameters] object that contains the client \
         parameters for OAuth authorization.\n"]
  authorization_endpoint : https_endpoint;
      [@ocaml.doc
        "The URL to the authorization endpoint when OAuth is specified as the authorization type.\n"]
  http_method : connection_o_auth_http_method;
      [@ocaml.doc "The method to use for the authorization request.\n"]
  o_auth_http_parameters : connection_http_parameters option;
      [@ocaml.doc
        "A [ConnectionHttpParameters] object that contains details about the additional parameters \
         to use for the connection.\n"]
}
[@@ocaml.doc "Contains the OAuth authorization parameters to use for the connection.\n"]

type nonrec create_connection_basic_auth_request_parameters = {
  username : auth_header_parameters; [@ocaml.doc "The user name to use for Basic authorization.\n"]
  password : auth_header_parameters_sensitive;
      [@ocaml.doc "The password associated with the user name to use for Basic authorization.\n"]
}
[@@ocaml.doc "Contains the Basic authorization parameters to use for the connection.\n"]

type nonrec create_connection_auth_request_parameters = {
  basic_auth_parameters : create_connection_basic_auth_request_parameters option;
      [@ocaml.doc
        "A [CreateConnectionBasicAuthRequestParameters] object that contains the Basic \
         authorization parameters to use for the connection.\n"]
  o_auth_parameters : create_connection_o_auth_request_parameters option;
      [@ocaml.doc
        "A [CreateConnectionOAuthRequestParameters] object that contains the OAuth authorization \
         parameters to use for the connection.\n"]
  api_key_auth_parameters : create_connection_api_key_auth_request_parameters option;
      [@ocaml.doc
        "A [CreateConnectionApiKeyAuthRequestParameters] object that contains the API key \
         authorization parameters to use for the connection.\n"]
  invocation_http_parameters : connection_http_parameters option;
      [@ocaml.doc
        "A [ConnectionHttpParameters] object that contains the API key authorization parameters to \
         use for the connection. Note that if you include additional parameters for the target of \
         a rule via [HttpParameters], including query strings, the parameters added for the \
         connection take precedence.\n"]
}
[@@ocaml.doc "Contains the authorization parameters for the connection.\n"]

type nonrec create_connection_request = {
  name : connection_name; [@ocaml.doc "The name for the connection to create.\n"]
  description : connection_description option;
      [@ocaml.doc "A description for the connection to create.\n"]
  authorization_type : connection_authorization_type;
      [@ocaml.doc "The type of authorization to use for the connection.\n"]
  auth_parameters : create_connection_auth_request_parameters;
      [@ocaml.doc
        "A [CreateConnectionAuthRequestParameters] object that contains the authorization \
         parameters to use to authorize with the endpoint. \n"]
}
[@@ocaml.doc ""]

type nonrec create_archive_response = {
  archive_arn : archive_arn option; [@ocaml.doc "The ARN of the archive that was created.\n"]
  state : archive_state option; [@ocaml.doc "The state of the archive that was created.\n"]
  state_reason : archive_state_reason option;
      [@ocaml.doc "The reason that the archive is in the state.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time at which the archive was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_archive_request = {
  archive_name : archive_name; [@ocaml.doc "The name for the archive to create.\n"]
  event_source_arn : arn;
      [@ocaml.doc "The ARN of the event bus that sends events to the archive.\n"]
  description : archive_description option; [@ocaml.doc "A description for the archive.\n"]
  event_pattern : event_pattern option;
      [@ocaml.doc "An event pattern to use to filter events sent to the archive.\n"]
  retention_days : retention_days option;
      [@ocaml.doc
        "The number of days to retain events for. Default value is 0. If set to 0, events are \
         retained indefinitely\n"]
}
[@@ocaml.doc ""]

type nonrec create_api_destination_response = {
  api_destination_arn : api_destination_arn option;
      [@ocaml.doc "The ARN of the API destination that was created by the request.\n"]
  api_destination_state : api_destination_state option;
      [@ocaml.doc "The state of the API destination that was created by the request.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "A time stamp indicating the time that the API destination was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "A time stamp indicating the time that the API destination was last modified.\n"]
}
[@@ocaml.doc ""]

type nonrec create_api_destination_request = {
  name : api_destination_name; [@ocaml.doc "The name for the API destination to create.\n"]
  description : api_destination_description option;
      [@ocaml.doc "A description for the API destination to create.\n"]
  connection_arn : connection_arn;
      [@ocaml.doc
        "The ARN of the connection to use for the API destination. The destination endpoint must \
         support the authorization type specified for the connection.\n"]
  invocation_endpoint : https_endpoint;
      [@ocaml.doc "The URL to the HTTP invocation endpoint for the API destination.\n"]
  http_method : api_destination_http_method;
      [@ocaml.doc "The method to use for the request to the HTTP invocation endpoint.\n"]
  invocation_rate_limit_per_second : api_destination_invocation_rate_limit_per_second option;
      [@ocaml.doc
        "The maximum number of requests per second to send to the HTTP invocation endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_status_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An error occurred because a replay can be canceled only when the state is Running or Starting.\n"]

type nonrec cancel_replay_response = {
  replay_arn : replay_arn option; [@ocaml.doc "The ARN of the replay to cancel.\n"]
  state : replay_state option; [@ocaml.doc "The current state of the replay.\n"]
  state_reason : replay_state_reason option;
      [@ocaml.doc "The reason that the replay is in the current state.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_replay_request = {
  replay_name : replay_name; [@ocaml.doc "The name of the replay to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec activate_event_source_request = {
  name : event_source_name; [@ocaml.doc "The name of the partner event source to activate.\n"]
}
[@@ocaml.doc ""]
