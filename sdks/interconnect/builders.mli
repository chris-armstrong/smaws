open Types

val make_connection :
  ?tags:tag_map ->
  ?billing_tier:billing_tier ->
  activation_key:activation_key ->
  owner_account:owner_account_id ->
  shared_id:connection_shared_id ->
  state:connection_state ->
  type_:product_type ->
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  description:connection_description ->
  arn:amazon_resource_name ->
  id:connection_id ->
  unit ->
  connection

val make_update_connection_response : ?connection:connection -> unit -> update_connection_response

val make_update_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bandwidth:connection_bandwidth ->
  ?description:connection_description ->
  identifier:connection_id ->
  unit ->
  update_connection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> arn:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> arn:amazon_resource_name -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_bandwidths : ?supported:bandwidth_list -> ?available:bandwidth_list -> unit -> bandwidths

val make_environment :
  ?remote_identifier_type:remote_account_identifier_type ->
  ?activation_page_url:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:product_type ->
  bandwidths:bandwidths ->
  state:environment_state ->
  environment_id:environment_id ->
  location:location ->
  provider:provider ->
  unit ->
  environment

val make_list_environments_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  environments:environment_list ->
  unit ->
  list_environments_response

val make_list_environments_request :
  ?location:location ->
  ?provider:provider ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_environments_request

val make_connection_summary :
  ?billing_tier:billing_tier ->
  shared_id:connection_shared_id ->
  state:connection_state ->
  type_:product_type ->
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  description:connection_description ->
  arn:amazon_resource_name ->
  id:connection_id ->
  unit ->
  connection_summary

val make_list_connections_response :
  ?next_token:next_token ->
  ?connections:connection_summaries_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?attach_point:attach_point ->
  ?provider:provider ->
  ?environment_id:environment_id ->
  ?state:connection_state ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_connections_request

val make_attach_point_descriptor :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:attach_point_type ->
  unit ->
  attach_point_descriptor

val make_list_attach_points_response :
  ?next_token:next_token ->
  attach_points:attach_point_descriptor_list ->
  unit ->
  list_attach_points_response

val make_list_attach_points_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  unit ->
  list_attach_points_request

val make_describe_connection_proposal_response :
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  bandwidth:connection_bandwidth ->
  unit ->
  describe_connection_proposal_response

val make_describe_connection_proposal_request :
  activation_key:activation_key -> unit -> describe_connection_proposal_request

val make_accept_connection_proposal_response :
  ?connection:connection -> unit -> accept_connection_proposal_response

val make_accept_connection_proposal_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_map ->
  ?description:connection_description ->
  activation_key:activation_key ->
  attach_point:attach_point ->
  unit ->
  accept_connection_proposal_request

val make_get_environment_response : environment:environment -> unit -> get_environment_response
val make_get_environment_request : id:environment_id -> unit -> get_environment_request
val make_get_connection_response : ?connection:connection -> unit -> get_connection_response
val make_get_connection_request : identifier:connection_id -> unit -> get_connection_request
val make_delete_connection_response : connection:connection -> unit -> delete_connection_response

val make_delete_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:connection_id ->
  unit ->
  delete_connection_request

val make_create_connection_response : ?connection:connection -> unit -> create_connection_response

val make_create_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_map ->
  ?remote_account:remote_account_identifier ->
  ?description:connection_description ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  unit ->
  create_connection_request
