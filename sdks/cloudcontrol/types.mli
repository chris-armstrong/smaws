type nonrec error_message = string [@@ocaml.doc ""]

type nonrec already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource with the name requested already exists.\n"]

type nonrec request_token_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A resource operation with the specified request token can't be found.\n"]

type nonrec concurrent_modification_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource is currently being modified by another operation.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec handler_error_code =
  | NOT_UPDATABLE [@ocaml.doc ""]
  | INVALID_REQUEST [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | UNAUTHORIZED_TAGGING_OPERATION [@ocaml.doc ""]
  | INVALID_CREDENTIALS [@ocaml.doc ""]
  | ALREADY_EXISTS [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | RESOURCE_CONFLICT [@ocaml.doc ""]
  | THROTTLING [@ocaml.doc ""]
  | SERVICE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | NOT_STABILIZED [@ocaml.doc ""]
  | GENERAL_SERVICE_EXCEPTION [@ocaml.doc ""]
  | SERVICE_INTERNAL_ERROR [@ocaml.doc ""]
  | SERVICE_TIMEOUT [@ocaml.doc ""]
  | NETWORK_FAILURE [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec properties = string [@@ocaml.doc ""]

type nonrec operation_status =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCEL_IN_PROGRESS [@ocaml.doc ""]
  | CANCEL_COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation = CREATE [@ocaml.doc ""] | DELETE [@ocaml.doc ""] | UPDATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec request_token = string [@@ocaml.doc ""]

type nonrec identifier = string [@@ocaml.doc ""]

type nonrec type_name = string [@@ocaml.doc ""]

type nonrec progress_event = {
  type_name : type_name option;
      [@ocaml.doc "The name of the resource type used in the operation.\n"]
  identifier : identifier option;
      [@ocaml.doc
        "The primary identifier for the resource.\n\n\
        \  In some cases, the resource identifier may be available before the resource operation \
         has reached a status of [SUCCESS].\n\
        \  \n\
        \   "]
  request_token : request_token option;
      [@ocaml.doc
        "The unique token representing this resource operation request.\n\n\
        \ Use the [RequestToken] with \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
         to return the current status of a resource operation request.\n\
        \ "]
  hooks_request_token : request_token option;
      [@ocaml.doc "The unique token representing the Hooks operation for the request.\n"]
  operation : operation option; [@ocaml.doc "The resource operation type.\n"]
  operation_status : operation_status option;
      [@ocaml.doc
        "The current status of the resource operation request.\n\n\
        \ {ul\n\
        \       {-   [PENDING]: The resource operation hasn't yet started.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS]: The resource operation is currently in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS]: The resource operation has successfully completed.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: The resource operation has failed. Refer to the error code and \
         status message for more information.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCEL_IN_PROGRESS]: The resource operation is in the process of being \
         canceled.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCEL_COMPLETE]: The resource operation has been canceled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  event_time : timestamp option; [@ocaml.doc "When the resource operation request was initiated.\n"]
  resource_model : properties option;
      [@ocaml.doc
        "A JSON string containing the resource model, consisting of each resource property and its \
         current value.\n"]
  status_message : status_message option;
      [@ocaml.doc "Any message explaining the current status.\n"]
  error_code : handler_error_code option;
      [@ocaml.doc
        "For requests with a status of [FAILED], the associated error code.\n\n\
        \ For error code definitions, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-test-contract-errors.html}Handler \
         error codes} in the {i CloudFormation Command Line Interface User Guide for Extension \
         Development}.\n\
        \ "]
  retry_after : timestamp option;
      [@ocaml.doc "When to next request the status of this resource operation request.\n"]
}
[@@ocaml.doc
  "Represents the current status of a resource operation request. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html}Managing \
   resource operation requests} in the {i Amazon Web Services Cloud Control API User Guide}.\n"]

type nonrec cancel_resource_request_output = {
  progress_event : progress_event option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec cancel_resource_request_input = {
  request_token : request_token;
      [@ocaml.doc
        "The [RequestToken] of the [ProgressEvent] object returned by the resource operation \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec client_token_conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified client token has already been used in another resource request.\n\n\
  \ It's best practice for client tokens to be unique for each resource operation request. \
   However, client token expire after 36 hours.\n\
  \ "]

type nonrec unsupported_action_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource doesn't support this resource operation.\n"]

type nonrec type_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified extension doesn't exist in the CloudFormation registry.\n"]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec service_limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that a non-transient resource limit was reached on the \
   service side.\n"]

type nonrec service_internal_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that the downstream service returned an internal error, \
   typically with a [5XX HTTP] status code.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A resource with the specified identifier can't be found.\n"]

type nonrec resource_conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource is temporarily unavailable to be acted upon. For example, if the resource is \
   currently undergoing an operation and can't be acted upon until that operation is finished.\n"]

type nonrec private_type_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Cloud Control API hasn't received a valid response from the resource handler, due to a \
   configuration error. This includes issues such as the resource handler returning an invalid \
   response, or timing out.\n"]

type nonrec not_updatable_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "One or more properties included in this resource operation are defined as create-only, and \
   therefore can't be updated.\n"]

type nonrec not_stabilized_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that the downstream resource failed to complete all of its \
   ready-state checks.\n"]

type nonrec network_failure_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that the request couldn't be completed due to networking \
   issues, such as a failure to receive a response from the server.\n"]

type nonrec invalid_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that invalid input from the user has generated a generic \
   exception.\n"]

type nonrec invalid_credentials_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that the credentials provided by the user are invalid.\n"]

type nonrec handler_internal_failure_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that an unexpected error occurred within the resource handler.\n"]

type nonrec handler_failure_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has failed without a returning a more specific error code. This can \
   include timeouts.\n"]

type nonrec general_service_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource handler has returned that the downstream service generated an error that doesn't \
   map to any other handler error code.\n"]

type nonrec concurrent_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Another resource operation is currently being performed on this resource.\n"]

type nonrec update_resource_output = {
  progress_event : progress_event option;
      [@ocaml.doc
        "Represents the current status of the resource update request.\n\n\
        \ Use the [RequestToken] of the [ProgressEvent] with \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
         to return the current status of a resource operation request.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec patch_document = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec type_version_id = string [@@ocaml.doc ""]

type nonrec update_resource_input = {
  type_name : type_name; [@ocaml.doc "The name of the resource type.\n"]
  type_version_id : type_version_id option;
      [@ocaml.doc
        "For private resource types, the type version to use in this resource operation. If you do \
         not specify a resource version, CloudFormation uses the default version.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud \
         Control API to use when performing this resource operation. The role specified must have \
         the permissions required for this operation. The necessary permissions for each event \
         handler are defined in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers}handlers} \n\
         ]}\n\
        \ section of the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}resource \
         type definition schema}.\n\n\
        \ If you do not specify a role, Cloud Control API uses a temporary session created using \
         your Amazon Web Services user credentials.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions}Specifying \
         credentials} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \  "]
  client_token : client_token option;
      [@ocaml.doc
        "A unique identifier to ensure the idempotency of the resource request. As a best \
         practice, specify this token to ensure idempotency, so that Amazon Web Services Cloud \
         Control API can accurately distinguish between request retries and new resource requests. \
         You might retry a resource request to ensure that it was successfully received.\n\n\
        \ A client token is valid for 36 hours once used. After that, a resource request with the \
         same client token is treated as a new request.\n\
        \ \n\
        \  If you do not specify a client token, one is generated for inclusion in the request.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency}Ensuring \
         resource operation requests are unique} in the {i Amazon Web Services Cloud Control API \
         User Guide}.\n\
        \   "]
  identifier : identifier;
      [@ocaml.doc
        "The identifier for the resource.\n\n\
        \ You can specify the primary identifier, or any secondary identifier defined for the \
         resource type in its resource schema. You can only specify one identifier. Primary \
         identifiers can be specified as a string or JSON; secondary identifiers must be specified \
         as JSON.\n\
        \ \n\
        \  For compound primary identifiers (that is, one that consists of multiple resource \
         properties strung together), to specify the primary identifier as a string, list the \
         property values {i in the order they are specified} in the primary identifier definition, \
         separated by [|].\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html}Identifying \
         resources} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \   "]
  patch_document : patch_document;
      [@ocaml.doc
        "A JavaScript Object Notation (JSON) document listing the patch operations that represent \
         the updates to apply to the current resource properties. For details, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-update.html#resource-operations-update-patch}Composing \
         the patch document} in the {i Amazon Web Services Cloud Control API User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec handler_next_token = string [@@ocaml.doc ""]

type nonrec resource_description = {
  identifier : identifier option;
      [@ocaml.doc
        "The primary identifier for the resource.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html}Identifying \
         resources} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \ "]
  properties : properties option;
      [@ocaml.doc "A list of the resource properties and their current values.\n"]
}
[@@ocaml.doc "Represents information about a provisioned resource.\n"]

type nonrec resource_descriptions = resource_description list [@@ocaml.doc ""]

type nonrec list_resources_output = {
  type_name : type_name option; [@ocaml.doc "The name of the resource type.\n"]
  resource_descriptions : resource_descriptions option;
      [@ocaml.doc
        "Information about the specified resources, including primary identifier and resource model.\n"]
  next_token : handler_next_token option;
      [@ocaml.doc
        "If the request doesn't return all of the remaining results, [NextToken] is set to a \
         token. To retrieve the next set of results, call [ListResources] again and assign that \
         token to the request object's [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to null.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_resources_input = {
  type_name : type_name; [@ocaml.doc "The name of the resource type.\n"]
  type_version_id : type_version_id option;
      [@ocaml.doc
        "For private resource types, the type version to use in this resource operation. If you do \
         not specify a resource version, CloudFormation uses the default version.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud \
         Control API to use when performing this resource operation. The role specified must have \
         the permissions required for this operation. The necessary permissions for each event \
         handler are defined in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers}handlers} \n\
         ]}\n\
        \ section of the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}resource \
         type definition schema}.\n\n\
        \ If you do not specify a role, Cloud Control API uses a temporary session created using \
         your Amazon Web Services user credentials.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions}Specifying \
         credentials} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \  "]
  next_token : handler_next_token option;
      [@ocaml.doc
        "If the previous paginated request didn't return all of the remaining results, the \
         response object's [NextToken] parameter value is set to a token. To retrieve the next set \
         of results, call this action again and assign that token to the request object's \
         [NextToken] parameter. If there are no remaining results, the previous response object's \
         [NextToken] parameter is set to [null].\n"]
  max_results : max_results option; [@ocaml.doc "Reserved.\n"]
  resource_model : properties option;
      [@ocaml.doc "The resource model to use to select the resources to return.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec resource_request_status_summaries = progress_event list [@@ocaml.doc ""]

type nonrec list_resource_requests_output = {
  resource_request_status_summaries : resource_request_status_summaries option;
      [@ocaml.doc "The requests that match the specified filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all of the remaining results, [NextToken] is set to a \
         token. To retrieve the next set of results, call [ListResources] again and assign that \
         token to the request object's [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to null.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_statuses = operation_status list [@@ocaml.doc ""]

type nonrec operations = operation list [@@ocaml.doc ""]

type nonrec resource_request_status_filter = {
  operations : operations option; [@ocaml.doc "The operation types to include in the filter.\n"]
  operation_statuses : operation_statuses option;
      [@ocaml.doc
        "The operation statuses to include in the filter.\n\n\
        \ {ul\n\
        \       {-   [PENDING]: The operation has been requested, but not yet initiated.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS]: The operation is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS]: The operation completed.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: The operation failed.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCEL_IN_PROGRESS]: The operation is in the process of being canceled.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCEL_COMPLETE]: The operation has been canceled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The filter criteria to use in determining the requests returned.\n"]

type nonrec list_resource_requests_input = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n\n\
        \ The default is [20].\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If the previous paginated request didn't return all of the remaining results, the \
         response object's [NextToken] parameter value is set to a token. To retrieve the next set \
         of results, call this action again and assign that token to the request object's \
         [NextToken] parameter. If there are no remaining results, the previous response object's \
         [NextToken] parameter is set to [null].\n"]
  resource_request_status_filter : resource_request_status_filter option;
      [@ocaml.doc "The filter criteria to apply to the requests returned.\n"]
}
[@@ocaml.doc ""]

type nonrec hook_failure_mode = string [@@ocaml.doc ""]

type nonrec hook_status = string [@@ocaml.doc ""]

type nonrec hook_invocation_point = string [@@ocaml.doc ""]

type nonrec hook_type_arn = string [@@ocaml.doc ""]

type nonrec hook_progress_event = {
  hook_type_name : type_name option; [@ocaml.doc "The type name of the Hook being invoked.\n"]
  hook_type_version_id : type_version_id option;
      [@ocaml.doc "The type version of the Hook being invoked.\n"]
  hook_type_arn : hook_type_arn option; [@ocaml.doc "The ARN of the Hook being invoked.\n"]
  invocation_point : hook_invocation_point option;
      [@ocaml.doc "States whether the Hook is invoked before or after resource provisioning.\n"]
  hook_status : hook_status option;
      [@ocaml.doc
        "The status of the Hook invocation. The following are potential statuses:\n\n\
        \ {ul\n\
        \       {-   [HOOK_PENDING]: The Hook was added to the invocation plan, but not yet invoked.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_IN_PROGRESS]: The Hook was invoked, but hasn't completed.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_SUCCEEDED]: The Hook invocation is complete with a successful \
         result.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_FAILED]: The Hook invocation is complete with a failed result.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_FAILED]: The Hook invocation didn't complete successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  hook_event_time : timestamp option;
      [@ocaml.doc "The time that the Hook invocation request initiated.\n"]
  hook_status_message : status_message option;
      [@ocaml.doc "The message explaining the current Hook status.\n"]
  failure_mode : hook_failure_mode option;
      [@ocaml.doc
        "The failure mode of the invocation. The following are the potential statuses:\n\n\
        \ {ul\n\
        \       {-   [FAIL]: This will fail the Hook invocation and the request associated with it.\n\
        \           \n\
        \            }\n\
        \       {-   [WARN]: This will fail the Hook invocation, but not the request associated \
         with it.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Represents the current status of applicable Hooks for a resource operation request. It contains \
   list of Hook invocation information for the resource specified in the request since the same \
   target can invoke multiple Hooks. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html}Managing \
   resource operation requests with Amazon Web Services Cloud Control API }.\n"]

type nonrec hooks_progress_event = hook_progress_event list [@@ocaml.doc ""]

type nonrec get_resource_request_status_output = {
  progress_event : progress_event option;
      [@ocaml.doc "Represents the current status of the resource operation request.\n"]
  hooks_progress_event : hooks_progress_event option;
      [@ocaml.doc
        "Lists Hook invocations for the specified target in the request. This is a list since the \
         same target can invoke multiple Hooks.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_request_status_input = {
  request_token : request_token;
      [@ocaml.doc
        "A unique token used to track the progress of the resource operation request.\n\n\
        \ Request tokens are included in the [ProgressEvent] type returned by a resource operation \
         request.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_resource_output = {
  type_name : type_name option; [@ocaml.doc "The name of the resource type.\n"]
  resource_description : resource_description option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_resource_input = {
  type_name : type_name; [@ocaml.doc "The name of the resource type.\n"]
  type_version_id : type_version_id option;
      [@ocaml.doc
        "For private resource types, the type version to use in this resource operation. If you do \
         not specify a resource version, CloudFormation uses the default version.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud \
         Control API to use when performing this resource operation. The role specified must have \
         the permissions required for this operation. The necessary permissions for each event \
         handler are defined in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers}handlers} \n\
         ]}\n\
        \ section of the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}resource \
         type definition schema}.\n\n\
        \ If you do not specify a role, Cloud Control API uses a temporary session created using \
         your Amazon Web Services user credentials.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions}Specifying \
         credentials} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \  "]
  identifier : identifier;
      [@ocaml.doc
        "The identifier for the resource.\n\n\
        \ You can specify the primary identifier, or any secondary identifier defined for the \
         resource type in its resource schema. You can only specify one identifier. Primary \
         identifiers can be specified as a string or JSON; secondary identifiers must be specified \
         as JSON.\n\
        \ \n\
        \  For compound primary identifiers (that is, one that consists of multiple resource \
         properties strung together), to specify the primary identifier as a string, list the \
         property values {i in the order they are specified} in the primary identifier definition, \
         separated by [|].\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html}Identifying \
         resources} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_resource_output = {
  progress_event : progress_event option;
      [@ocaml.doc
        "Represents the current status of the resource deletion request.\n\n\
        \ After you have initiated a resource deletion request, you can monitor the progress of \
         your request by calling \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
         using the [RequestToken] of the [ProgressEvent] returned by [DeleteResource].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_resource_input = {
  type_name : type_name; [@ocaml.doc "The name of the resource type.\n"]
  type_version_id : type_version_id option;
      [@ocaml.doc
        "For private resource types, the type version to use in this resource operation. If you do \
         not specify a resource version, CloudFormation uses the default version.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud \
         Control API to use when performing this resource operation. The role specified must have \
         the permissions required for this operation. The necessary permissions for each event \
         handler are defined in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers}handlers} \n\
         ]}\n\
        \ section of the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}resource \
         type definition schema}.\n\n\
        \ If you do not specify a role, Cloud Control API uses a temporary session created using \
         your Amazon Web Services user credentials.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions}Specifying \
         credentials} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \  "]
  client_token : client_token option;
      [@ocaml.doc
        "A unique identifier to ensure the idempotency of the resource request. As a best \
         practice, specify this token to ensure idempotency, so that Amazon Web Services Cloud \
         Control API can accurately distinguish between request retries and new resource requests. \
         You might retry a resource request to ensure that it was successfully received.\n\n\
        \ A client token is valid for 36 hours once used. After that, a resource request with the \
         same client token is treated as a new request.\n\
        \ \n\
        \  If you do not specify a client token, one is generated for inclusion in the request.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency}Ensuring \
         resource operation requests are unique} in the {i Amazon Web Services Cloud Control API \
         User Guide}.\n\
        \   "]
  identifier : identifier;
      [@ocaml.doc
        "The identifier for the resource.\n\n\
        \ You can specify the primary identifier, or any secondary identifier defined for the \
         resource type in its resource schema. You can only specify one identifier. Primary \
         identifiers can be specified as a string or JSON; secondary identifiers must be specified \
         as JSON.\n\
        \ \n\
        \  For compound primary identifiers (that is, one that consists of multiple resource \
         properties strung together), to specify the primary identifier as a string, list the \
         property values {i in the order they are specified} in the primary identifier definition, \
         separated by [|].\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html}Identifying \
         resources} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_resource_output = {
  progress_event : progress_event option;
      [@ocaml.doc
        "Represents the current status of the resource creation request.\n\n\
        \ After you have initiated a resource creation request, you can monitor the progress of \
         your request by calling \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
         using the [RequestToken] of the [ProgressEvent] returned by [CreateResource].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_resource_input = {
  type_name : type_name; [@ocaml.doc "The name of the resource type.\n"]
  type_version_id : type_version_id option;
      [@ocaml.doc
        "For private resource types, the type version to use in this resource operation. If you do \
         not specify a resource version, CloudFormation uses the default version.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud \
         Control API to use when performing this resource operation. The role specified must have \
         the permissions required for this operation. The necessary permissions for each event \
         handler are defined in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers}handlers} \n\
         ]}\n\
        \ section of the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}resource \
         type definition schema}.\n\n\
        \ If you do not specify a role, Cloud Control API uses a temporary session created using \
         your Amazon Web Services user credentials.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions}Specifying \
         credentials} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
        \  "]
  client_token : client_token option;
      [@ocaml.doc
        "A unique identifier to ensure the idempotency of the resource request. As a best \
         practice, specify this token to ensure idempotency, so that Amazon Web Services Cloud \
         Control API can accurately distinguish between request retries and new resource requests. \
         You might retry a resource request to ensure that it was successfully received.\n\n\
        \ A client token is valid for 36 hours once used. After that, a resource request with the \
         same client token is treated as a new request.\n\
        \ \n\
        \  If you do not specify a client token, one is generated for inclusion in the request.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency}Ensuring \
         resource operation requests are unique} in the {i Amazon Web Services Cloud Control API \
         User Guide}.\n\
        \   "]
  desired_state : properties;
      [@ocaml.doc
        "Structured data format representing the desired state of the resource, consisting of that \
         resource's properties and their desired values.\n\n\
        \  Cloud Control API currently supports JSON as a structured data format.\n\
        \  \n\
        \    Specify the desired state as one of the following:\n\
        \    \n\
        \     {ul\n\
        \           {-  A JSON blob\n\
        \               \n\
        \                }\n\
        \           {-  A local path containing the desired state in JSON data format\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-create.html#resource-operations-create-desiredstate}Composing \
         the desired state of the resource} in the {i Amazon Web Services Cloud Control API User \
         Guide}.\n\
        \   \n\
        \    For more information about the properties of a specific resource, refer to the \
         related topic for the resource in the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Resource \
         and property types reference} in the {i CloudFormation Users Guide}.\n\
        \    "]
}
[@@ocaml.doc ""]
