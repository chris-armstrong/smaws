open Types

val make_connection :
  ?billing_tier:billing_tier ->
  ?tags:tag_map ->
  id:connection_id ->
  arn:amazon_resource_name ->
  description:connection_description ->
  bandwidth:connection_bandwidth ->
  attach_point:attach_point ->
  environment_id:environment_id ->
  provider:provider ->
  location:location ->
  type_:product_type ->
  state:connection_state ->
  shared_id:connection_shared_id ->
  owner_account:owner_account_id ->
  activation_key:activation_key ->
  unit ->
  connection

val make_accept_connection_proposal_response :
  ?connection:connection -> unit -> accept_connection_proposal_response

val make_accept_connection_proposal_request :
  ?description:connection_description ->
  ?tags:tag_map ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  attach_point:attach_point ->
  activation_key:activation_key ->
  unit ->
  accept_connection_proposal_request

val make_attach_point_descriptor :
  type_:attach_point_type ->
  identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  attach_point_descriptor

val make_bandwidths : ?available:bandwidth_list -> ?supported:bandwidth_list -> unit -> bandwidths

val make_connection_summary :
  ?billing_tier:billing_tier ->
  id:connection_id ->
  arn:amazon_resource_name ->
  description:connection_description ->
  bandwidth:connection_bandwidth ->
  attach_point:attach_point ->
  environment_id:environment_id ->
  provider:provider ->
  location:location ->
  type_:product_type ->
  state:connection_state ->
  shared_id:connection_shared_id ->
  unit ->
  connection_summary

val make_create_connection_response : ?connection:connection -> unit -> create_connection_response

val make_create_connection_request :
  ?description:connection_description ->
  ?remote_account:remote_account_identifier ->
  ?tags:tag_map ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  bandwidth:connection_bandwidth ->
  attach_point:attach_point ->
  environment_id:environment_id ->
  unit ->
  create_connection_request

val make_delete_connection_response : connection:connection -> unit -> delete_connection_response

val make_delete_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:connection_id ->
  unit ->
  delete_connection_request

val make_describe_connection_proposal_response :
  bandwidth:connection_bandwidth ->
  environment_id:environment_id ->
  provider:provider ->
  location:location ->
  unit ->
  describe_connection_proposal_response

val make_describe_connection_proposal_request :
  activation_key:activation_key -> unit -> describe_connection_proposal_request

val make_environment :
  ?activation_page_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?remote_identifier_type:remote_account_identifier_type ->
  provider:provider ->
  location:location ->
  environment_id:environment_id ->
  state:environment_state ->
  bandwidths:bandwidths ->
  type_:product_type ->
  unit ->
  environment

val make_get_connection_response : ?connection:connection -> unit -> get_connection_response
val make_get_connection_request : identifier:connection_id -> unit -> get_connection_request
val make_get_environment_response : environment:environment -> unit -> get_environment_response
val make_get_environment_request : id:environment_id -> unit -> get_environment_request
val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  arn:amazon_resource_name -> tags:tag_map -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_attach_points_response :
  ?next_token:next_token ->
  attach_points:attach_point_descriptor_list ->
  unit ->
  list_attach_points_response

val make_list_attach_points_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  environment_id:environment_id ->
  unit ->
  list_attach_points_request

val make_list_connections_response :
  ?connections:connection_summaries_list ->
  ?next_token:next_token ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?state:connection_state ->
  ?environment_id:environment_id ->
  ?provider:provider ->
  ?attach_point:attach_point ->
  unit ->
  list_connections_request

val make_list_environments_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  environments:environment_list ->
  unit ->
  list_environments_response

val make_list_environments_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?provider:provider ->
  ?location:location ->
  unit ->
  list_environments_request

val make_update_connection_response : ?connection:connection -> unit -> update_connection_response

val make_update_connection_request :
  ?description:connection_description ->
  ?bandwidth:connection_bandwidth ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:connection_id ->
  unit ->
  update_connection_request
