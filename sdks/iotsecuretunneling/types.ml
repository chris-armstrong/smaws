type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec client_access_token = string [@@ocaml.doc ""]

type nonrec client_mode =
  | SOURCE [@ocaml.doc ""]
  | DESTINATION [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Thrown when an operation is attempted on a resource that does not exist.\n"]

type nonrec close_tunnel_response = unit [@@ocaml.doc ""]

type nonrec delete_flag = bool [@@ocaml.doc ""]

type nonrec tunnel_id = string [@@ocaml.doc ""]

type nonrec close_tunnel_request = {
  tunnel_id : tunnel_id; [@ocaml.doc "The ID of the tunnel to close.\n"]
  delete : delete_flag option;
      [@ocaml.doc "When set to true, IoT Secure Tunneling deletes the tunnel data immediately.\n"]
}
[@@ocaml.doc ""]

type nonrec date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec connection_status = CONNECTED [@ocaml.doc ""] | DISCONNECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_state = {
  status : connection_status option;
      [@ocaml.doc
        "The connection status of the tunnel. Valid values are [CONNECTED] and [DISCONNECTED].\n"]
  last_updated_at : date_type option;
      [@ocaml.doc "The last time the connection status was updated.\n"]
}
[@@ocaml.doc "The state of a connection.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc
  "An arbitary key/value pair used to add searchable metadata to secure tunnel resources.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec timeout_in_min = int [@@ocaml.doc ""]

type nonrec timeout_config = {
  max_lifetime_timeout_minutes : timeout_in_min option;
      [@ocaml.doc
        "The maximum amount of time (in minutes) a tunnel can remain open. If not specified, \
         maxLifetimeTimeoutMinutes defaults to 720 minutes. Valid values are from 1 minute to 12 \
         hours (720 minutes) \n"]
}
[@@ocaml.doc "Tunnel timeout configuration.\n"]

type nonrec service = string [@@ocaml.doc ""]

type nonrec service_list = service list [@@ocaml.doc ""]

type nonrec thing_name = string [@@ocaml.doc ""]

type nonrec destination_config = {
  thing_name : thing_name option;
      [@ocaml.doc "The name of the IoT thing to which you want to connect.\n"]
  services : service_list;
      [@ocaml.doc
        "A list of service names that identify the target application. The IoT client running on \
         the destination device reads this value and uses it to look up a port or an IP address \
         and a port. The IoT client instantiates the local proxy, which uses this information to \
         connect to the destination application.\n"]
}
[@@ocaml.doc "The destination configuration.\n"]

type nonrec description = string [@@ocaml.doc ""]

type nonrec tunnel_status = OPEN [@ocaml.doc ""] | CLOSED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tunnel_arn = string [@@ocaml.doc ""]

type nonrec tunnel = {
  tunnel_id : tunnel_id option; [@ocaml.doc "A unique alpha-numeric ID that identifies a tunnel.\n"]
  tunnel_arn : tunnel_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a tunnel.\n"]
  status : tunnel_status option;
      [@ocaml.doc "The status of a tunnel. Valid values are: Open and Closed.\n"]
  source_connection_state : connection_state option;
      [@ocaml.doc "The connection state of the source application.\n"]
  destination_connection_state : connection_state option;
      [@ocaml.doc "The connection state of the destination application.\n"]
  description : description option; [@ocaml.doc "A description of the tunnel.\n"]
  destination_config : destination_config option;
      [@ocaml.doc
        "The destination configuration that specifies the thing name of the destination device and \
         a service name that the local proxy uses to connect to the destination application.\n"]
  timeout_config : timeout_config option; [@ocaml.doc "Timeout configuration for the tunnel.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag metadata associated with the secure tunnel.\n"]
  created_at : date_type option; [@ocaml.doc "The time when the tunnel was created.\n"]
  last_updated_at : date_type option; [@ocaml.doc "The last time the tunnel was updated.\n"]
}
[@@ocaml.doc "A connection between a source computer and a destination device.\n"]

type nonrec describe_tunnel_response = {
  tunnel : tunnel option; [@ocaml.doc "The tunnel being described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tunnel_request = {
  tunnel_id : tunnel_id; [@ocaml.doc "The tunnel to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : amazon_resource_name; [@ocaml.doc "The resource ARN.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The keys of the tags to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : amazon_resource_name; [@ocaml.doc "The ARN of the resource.\n"]
  tags : tag_list; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec rotate_tunnel_access_token_response = {
  tunnel_arn : tunnel_arn option; [@ocaml.doc "The Amazon Resource Name for the tunnel.\n"]
  source_access_token : client_access_token option;
      [@ocaml.doc
        "The client access token that the source local proxy uses to connect to IoT Secure \
         Tunneling.\n"]
  destination_access_token : client_access_token option;
      [@ocaml.doc
        "The client access token that the destination local proxy uses to connect to IoT Secure \
         Tunneling.\n"]
}
[@@ocaml.doc ""]

type nonrec rotate_tunnel_access_token_request = {
  tunnel_id : tunnel_id; [@ocaml.doc "The tunnel for which you want to rotate the access tokens.\n"]
  client_mode : client_mode;
      [@ocaml.doc
        "The mode of the client that will use the client token, which can be either the source or \
         destination, or both source and destination.\n"]
  destination_config : destination_config option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Thrown when a tunnel limit is exceeded.\n"]

type nonrec open_tunnel_response = {
  tunnel_id : tunnel_id option; [@ocaml.doc "A unique alpha-numeric tunnel ID.\n"]
  tunnel_arn : tunnel_arn option; [@ocaml.doc "The Amazon Resource Name for the tunnel.\n"]
  source_access_token : client_access_token option;
      [@ocaml.doc
        "The access token the source local proxy uses to connect to IoT Secure Tunneling.\n"]
  destination_access_token : client_access_token option;
      [@ocaml.doc
        "The access token the destination local proxy uses to connect to IoT Secure Tunneling.\n"]
}
[@@ocaml.doc ""]

type nonrec open_tunnel_request = {
  description : description option; [@ocaml.doc "A short text description of the tunnel. \n"]
  tags : tag_list option; [@ocaml.doc "A collection of tag metadata.\n"]
  destination_config : destination_config option;
      [@ocaml.doc "The destination configuration for the OpenTunnel request.\n"]
  timeout_config : timeout_config option; [@ocaml.doc "Timeout configuration for a tunnel.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec tunnel_summary = {
  tunnel_id : tunnel_id option; [@ocaml.doc "The unique alpha-numeric identifier for the tunnel.\n"]
  tunnel_arn : tunnel_arn option; [@ocaml.doc "The Amazon Resource Name of the tunnel. \n"]
  status : tunnel_status option;
      [@ocaml.doc "The status of a tunnel. Valid values are: Open and Closed.\n"]
  description : description option; [@ocaml.doc "A description of the tunnel.\n"]
  created_at : date_type option; [@ocaml.doc "The time the tunnel was created.\n"]
  last_updated_at : date_type option; [@ocaml.doc "The time the tunnel was last updated.\n"]
}
[@@ocaml.doc "Information about the tunnel.\n"]

type nonrec tunnel_summary_list = tunnel_summary list [@@ocaml.doc ""]

type nonrec list_tunnels_response = {
  tunnel_summaries : tunnel_summary_list option;
      [@ocaml.doc "A short description of the tunnels in an Amazon Web Services account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to get the next set of results, or null if there are no additional \
         results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tunnels_request = {
  thing_name : thing_name option;
      [@ocaml.doc "The name of the IoT thing associated with the destination device.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return at once.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "To retrieve the next set of results, the nextToken value from a previous response; \
         otherwise null to receive the first set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags for the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name; [@ocaml.doc "The resource ARN.\n"]
}
[@@ocaml.doc ""]
