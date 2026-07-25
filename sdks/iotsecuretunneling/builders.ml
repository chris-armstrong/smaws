open Types

let make_close_tunnel_response () = (() : unit)

let make_close_tunnel_request ?delete:(delete_ : delete_flag option)
    ~tunnel_id:(tunnel_id_ : tunnel_id) () =
  ({ tunnel_id = tunnel_id_; delete = delete_ } : close_tunnel_request)

let make_connection_state ?status:(status_ : connection_status option)
    ?last_updated_at:(last_updated_at_ : date_type option) () =
  ({ status = status_; last_updated_at = last_updated_at_ } : connection_state)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_timeout_config
    ?max_lifetime_timeout_minutes:(max_lifetime_timeout_minutes_ : timeout_in_min option) () =
  ({ max_lifetime_timeout_minutes = max_lifetime_timeout_minutes_ } : timeout_config)

let make_destination_config ?thing_name:(thing_name_ : thing_name option)
    ~services:(services_ : service_list) () =
  ({ thing_name = thing_name_; services = services_ } : destination_config)

let make_tunnel ?tunnel_id:(tunnel_id_ : tunnel_id option)
    ?tunnel_arn:(tunnel_arn_ : tunnel_arn option) ?status:(status_ : tunnel_status option)
    ?source_connection_state:(source_connection_state_ : connection_state option)
    ?destination_connection_state:(destination_connection_state_ : connection_state option)
    ?description:(description_ : description option)
    ?destination_config:(destination_config_ : destination_config option)
    ?timeout_config:(timeout_config_ : timeout_config option) ?tags:(tags_ : tag_list option)
    ?created_at:(created_at_ : date_type option)
    ?last_updated_at:(last_updated_at_ : date_type option) () =
  ({
     tunnel_id = tunnel_id_;
     tunnel_arn = tunnel_arn_;
     status = status_;
     source_connection_state = source_connection_state_;
     destination_connection_state = destination_connection_state_;
     description = description_;
     destination_config = destination_config_;
     timeout_config = timeout_config_;
     tags = tags_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
   }
    : tunnel)

let make_describe_tunnel_response ?tunnel:(tunnel_ : tunnel option) () =
  ({ tunnel = tunnel_ } : describe_tunnel_response)

let make_describe_tunnel_request ~tunnel_id:(tunnel_id_ : tunnel_id) () =
  ({ tunnel_id = tunnel_id_ } : describe_tunnel_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_rotate_tunnel_access_token_response ?tunnel_arn:(tunnel_arn_ : tunnel_arn option)
    ?source_access_token:(source_access_token_ : client_access_token option)
    ?destination_access_token:(destination_access_token_ : client_access_token option) () =
  ({
     tunnel_arn = tunnel_arn_;
     source_access_token = source_access_token_;
     destination_access_token = destination_access_token_;
   }
    : rotate_tunnel_access_token_response)

let make_rotate_tunnel_access_token_request
    ?destination_config:(destination_config_ : destination_config option)
    ~tunnel_id:(tunnel_id_ : tunnel_id) ~client_mode:(client_mode_ : client_mode) () =
  ({ tunnel_id = tunnel_id_; client_mode = client_mode_; destination_config = destination_config_ }
    : rotate_tunnel_access_token_request)

let make_open_tunnel_response ?tunnel_id:(tunnel_id_ : tunnel_id option)
    ?tunnel_arn:(tunnel_arn_ : tunnel_arn option)
    ?source_access_token:(source_access_token_ : client_access_token option)
    ?destination_access_token:(destination_access_token_ : client_access_token option) () =
  ({
     tunnel_id = tunnel_id_;
     tunnel_arn = tunnel_arn_;
     source_access_token = source_access_token_;
     destination_access_token = destination_access_token_;
   }
    : open_tunnel_response)

let make_open_tunnel_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option)
    ?destination_config:(destination_config_ : destination_config option)
    ?timeout_config:(timeout_config_ : timeout_config option) () =
  ({
     description = description_;
     tags = tags_;
     destination_config = destination_config_;
     timeout_config = timeout_config_;
   }
    : open_tunnel_request)

let make_tunnel_summary ?tunnel_id:(tunnel_id_ : tunnel_id option)
    ?tunnel_arn:(tunnel_arn_ : tunnel_arn option) ?status:(status_ : tunnel_status option)
    ?description:(description_ : description option) ?created_at:(created_at_ : date_type option)
    ?last_updated_at:(last_updated_at_ : date_type option) () =
  ({
     tunnel_id = tunnel_id_;
     tunnel_arn = tunnel_arn_;
     status = status_;
     description = description_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
   }
    : tunnel_summary)

let make_list_tunnels_response ?tunnel_summaries:(tunnel_summaries_ : tunnel_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tunnel_summaries = tunnel_summaries_; next_token = next_token_ } : list_tunnels_response)

let make_list_tunnels_request ?thing_name:(thing_name_ : thing_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ thing_name = thing_name_; max_results = max_results_; next_token = next_token_ }
    : list_tunnels_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)
