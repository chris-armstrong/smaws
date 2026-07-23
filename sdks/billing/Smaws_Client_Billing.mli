(** Billing client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  name:field_name -> message:error_message -> unit -> validation_exception_field

val make_update_billing_view_response :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_response

val make_time_range :
  ?begin_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  time_range

val make_cost_category_values :
  key:cost_category_name -> values:values -> unit -> cost_category_values

val make_tag_values : key:tag_key -> values:values -> unit -> tag_values
val make_dimension_values : key:dimension -> values:values -> unit -> dimension_values

val make_expression :
  ?dimensions:dimension_values ->
  ?tags:tag_values ->
  ?cost_categories:cost_category_values ->
  ?time_range:time_range ->
  unit ->
  expression

val make_update_billing_view_request :
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?data_filter_expression:expression ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn ->
  resource_tag_keys:resource_tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_arn:resource_arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_source_views_for_billing_view_response :
  ?next_token:page_token ->
  source_views:billing_view_source_views_list ->
  unit ->
  list_source_views_for_billing_view_response

val make_list_source_views_for_billing_view_request :
  ?max_results:billing_views_max_results ->
  ?next_token:page_token ->
  arn:billing_view_arn ->
  unit ->
  list_source_views_for_billing_view_request

val make_billing_view_health_status :
  ?status_code:billing_view_status ->
  ?status_reasons:billing_view_status_reasons ->
  unit ->
  billing_view_health_status

val make_billing_view_list_element :
  ?arn:billing_view_arn ->
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?billing_view_type:billing_view_type ->
  ?health_status:billing_view_health_status ->
  unit ->
  billing_view_list_element

val make_list_billing_views_response :
  ?next_token:page_token -> billing_views:billing_view_list -> unit -> list_billing_views_response

val make_string_search :
  search_option:search_option -> search_value:search_value -> unit -> string_search

val make_active_time_range :
  active_after_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  active_before_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  active_time_range

val make_list_billing_views_request :
  ?active_time_range:active_time_range ->
  ?arns:billing_view_arn_list ->
  ?billing_view_types:billing_view_type_list ->
  ?names:string_searches ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?max_results:billing_views_max_results ->
  ?next_token:page_token ->
  unit ->
  list_billing_views_request

val make_get_resource_policy_response :
  ?policy:policy_document -> resource_arn:resource_arn -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:resource_arn -> unit -> get_resource_policy_request

val make_billing_view_element :
  ?arn:billing_view_arn ->
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?billing_view_type:billing_view_type ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?data_filter_expression:expression ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?derived_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?source_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?view_definition_last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?health_status:billing_view_health_status ->
  unit ->
  billing_view_element

val make_get_billing_view_response :
  billing_view:billing_view_element -> unit -> get_billing_view_response

val make_get_billing_view_request : arn:billing_view_arn -> unit -> get_billing_view_request

val make_disassociate_source_views_response :
  arn:billing_view_arn -> unit -> disassociate_source_views_response

val make_disassociate_source_views_request :
  arn:billing_view_arn ->
  source_views:billing_view_source_views_list ->
  unit ->
  disassociate_source_views_request

val make_delete_billing_view_response : arn:billing_view_arn -> unit -> delete_billing_view_response

val make_delete_billing_view_request :
  ?force:Smaws_Lib.Smithy_api.Types.boolean_ ->
  arn:billing_view_arn ->
  unit ->
  delete_billing_view_request

val make_create_billing_view_response :
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:billing_view_arn ->
  unit ->
  create_billing_view_response

val make_create_billing_view_request :
  ?description:billing_view_description ->
  ?data_filter_expression:expression ->
  ?client_token:client_token ->
  ?resource_tags:resource_tag_list ->
  name:billing_view_name ->
  source_views:billing_view_source_views_list ->
  unit ->
  create_billing_view_request

val make_associate_source_views_response :
  arn:billing_view_arn -> unit -> associate_source_views_response

val make_associate_source_views_request :
  arn:billing_view_arn ->
  source_views:billing_view_source_views_list ->
  unit ->
  associate_source_views_request
(** {1:operations Operations} *)

module AssociateSourceViews : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_source_views_request ->
    ( associate_source_views_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_source_views_request ->
    ( associate_source_views_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Associates one or more source billing views with an existing billing view. This allows \
   creating aggregate billing views that combine data from multiple sources. \n"]

module CreateBillingView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_billing_view_request ->
    ( create_billing_view_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_billing_view_request ->
    ( create_billing_view_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a billing view with the specified billing view attributes. \n"]

module DeleteBillingView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_billing_view_request ->
    ( delete_billing_view_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_billing_view_request ->
    ( delete_billing_view_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified billing view.\n"]

module DisassociateSourceViews : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_source_views_request ->
    ( disassociate_source_views_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_source_views_request ->
    ( disassociate_source_views_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Removes the association between one or more source billing views and an existing billing view. \
   This allows modifying the composition of aggregate billing views. \n"]

module GetBillingView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_billing_view_request ->
    ( get_billing_view_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_billing_view_request ->
    ( get_billing_view_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the metadata associated to the specified billing view ARN. \n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the resource-based policy document attached to the resource in [JSON] format. \n"]

module ListBillingViews : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_billing_views_request ->
    ( list_billing_views_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_billing_views_request ->
    ( list_billing_views_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the billing views available for a given time period. \n\n\
  \ Every Amazon Web Services account has a unique [PRIMARY] billing view that represents the \
   billing data available by default. Accounts that use Billing Conductor also have \
   [BILLING_GROUP] billing views representing pro forma costs associated with each created billing \
   group.\n\
  \ "]

module ListSourceViewsForBillingView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_source_views_for_billing_view_request ->
    ( list_source_views_for_billing_view_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_source_views_for_billing_view_request ->
    ( list_source_views_for_billing_view_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the source views (managed Amazon Web Services billing views) associated with the billing \
   view. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists tags associated with the billing view resource. \n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " An API operation for adding one or more tags (key-value pairs) to a resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Removes one or more tags from a resource. Specify only tag keys in your request. Don't specify \
   the value. \n"]

(** {1:Serialization and Deserialization} *)
module UpdateBillingView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_billing_view_request ->
    ( update_billing_view_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_billing_view_request ->
    ( update_billing_view_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "An API to update the attributes of the billing view. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
