open Types

module StartBgpFailoverTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_bgp_failover_test_request ->
    ( start_bgp_failover_test_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_bgp_failover_test_request ->
    ( start_bgp_failover_test_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the virtual interface failover test that verifies your configuration meets your \
   resiliency requirements by placing the BGP peering session in the DOWN state. You can then send \
   traffic to verify that there are no outages.\n\n\
  \ You can run the test on public, private, transit, and hosted virtual interfaces.\n\
  \ \n\
  \  You can use \
   {{:https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html}ListVirtualInterfaceTestHistory} \
   to view the virtual interface test history.\n\
  \  \n\
  \   If you need to stop the test before the test interval completes, use \
   {{:https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html}StopBgpFailoverTest}.\n\
  \   "]

module StopBgpFailoverTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_bgp_failover_test_request ->
    ( stop_bgp_failover_test_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_bgp_failover_test_request ->
    ( stop_bgp_failover_test_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the virtual interface failover test.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified Direct Connect resource. Each resource can have a \
   maximum of 50 tags.\n\n\
  \ Each tag consists of a key and an optional value. If a tag with the same key is already \
   associated with the resource, this action updates its value.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from the specified Direct Connect resource.\n"]

module UpdateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Direct Connect connection configuration.\n\n\
  \ You can update the following parameters for a connection:\n\
  \ \n\
  \  {ul\n\
  \        {-  The connection name\n\
  \            \n\
  \             }\n\
  \        {-  The connection's MAC Security (MACsec) encryption mode.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module UpdateDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_request ->
    ( update_direct_connect_gateway_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_request ->
    ( update_direct_connect_gateway_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of a current Direct Connect gateway.\n"]

module UpdateDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_association_request ->
    ( update_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_direct_connect_gateway_association_request ->
    ( update_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified attributes of the Direct Connect gateway association.\n\n\
  \ Add or remove prefixes from the association.\n\
  \ "]

module UpdateLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the attributes of the specified link aggregation group (LAG).\n\n\
  \ You can update the following LAG attributes:\n\
  \ \n\
  \  {ul\n\
  \        {-  The name of the LAG.\n\
  \            \n\
  \             }\n\
  \        {-  The value for the minimum number of connections that must be operational for the \
   LAG itself to be operational. \n\
  \            \n\
  \             }\n\
  \        {-  The LAG's MACsec encryption mode.\n\
  \            \n\
  \             Amazon Web Services assigns this value to each connection which is part of the LAG.\n\
  \             \n\
  \              }\n\
  \        {-  The tags\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    If you adjust the threshold value for the minimum number of operational connections, ensure \
   that the new value does not cause the LAG to fall below the threshold and become \
   non-operational.\n\
  \    \n\
  \     "]

module UpdateVirtualInterfaceAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_virtual_interface_attributes_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_virtual_interface_attributes_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified attributes of the specified virtual private interface.\n\n\
  \ Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the \
   underlying physical connection if it wasn't updated to support jumbo frames. Updating the \
   connection disrupts network connectivity for all virtual interfaces associated with the \
   connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \ "]

module ListVirtualInterfaceTestHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_interface_test_history_request ->
    ( list_virtual_interface_test_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_interface_test_history_request ->
    ( list_virtual_interface_test_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the virtual interface failover test history.\n"]

module DisassociateMacSecKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mac_sec_key_request ->
    ( disassociate_mac_sec_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mac_sec_key_request ->
    ( disassociate_mac_sec_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a MAC Security (MACsec) security key and a Direct Connect \
   connection.\n"]

module DisassociateConnectionFromLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_from_lag_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_from_lag_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a connection from a link aggregation group (LAG). The connection is interrupted \
   and re-established as a standalone connection (the connection is not deleted; to delete the \
   connection, use the [DeleteConnection] request). If the LAG has associated virtual interfaces \
   or hosted connections, they remain associated with the LAG. A disassociated connection owned by \
   an Direct Connect Partner is automatically converted to an interconnect.\n\n\
  \ If disassociating the connection would cause the LAG to fall below its setting for minimum \
   number of operational connections, the request fails, except when it's the last member of the \
   LAG. If all connections are disassociated, the LAG continues to exist as an empty LAG with no \
   physical connections. \n\
  \ "]

module DescribeVirtualInterfaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_virtual_interfaces_request ->
    ( virtual_interfaces,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_virtual_interfaces_request ->
    ( virtual_interfaces Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays all virtual interfaces for an Amazon Web Services account. Virtual interfaces deleted \
   fewer than 15 minutes before you make the request are also returned. If you specify a \
   connection ID, only the virtual interfaces associated with the connection are returned. If you \
   specify a virtual interface ID, then only a single virtual interface is returned.\n\n\
  \ A virtual interface (VLAN) transmits the traffic between the Direct Connect location and the \
   customer network.\n\
  \ \n\
  \  {ul\n\
  \        {-  If you're using an [asn], the response includes the ASN value in both the [asn] and \
   [asnLong] fields.\n\
  \            \n\
  \             }\n\
  \        {-  If you're using [asnLong], the response returns a value of [0] (zero) for the [asn] \
   attribute because it exceeds the highest ASN value of 2,147,483,647 that it can support\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeVirtualGateways : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( virtual_gateways,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( virtual_gateways Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeVpnGateways] instead. See \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeVpnGateways.html}DescribeVPNGateways} \
   in the {i Amazon Elastic Compute Cloud API Reference}.\n\
  \ \n\
  \   Lists the virtual private gateways owned by the Amazon Web Services account.\n\
  \   \n\
  \    You can create one or more Direct Connect private virtual interfaces linked to a virtual \
   private gateway.\n\
  \    "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the tags associated with the specified Direct Connect resources.\n"]

module DescribeRouterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_router_configuration_request ->
    ( describe_router_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_router_configuration_request ->
    ( describe_router_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Details about the router. \n"]

module DescribeLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( locations,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( locations Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Direct Connect locations in the current Amazon Web Services Region. These are the \
   locations that can be selected when calling [CreateConnection] or [CreateInterconnect].\n"]

module DescribeLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_loa_request ->
    ( loa,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_loa_request ->
    ( loa Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG).\n\n\
  \ The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is \
   used when establishing your cross connect to Amazon Web Services at the colocation facility. \
   For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \ "]

module DescribeLags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lags_request ->
    ( lags,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lags_request ->
    ( lags Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all your link aggregation groups (LAG) or the specified LAG.\n"]

module DescribeInterconnects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnects_request ->
    ( interconnects,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnects_request ->
    ( interconnects Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the interconnects owned by the Amazon Web Services account or only the specified \
   interconnect.\n"]

module DescribeInterconnectLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnect_loa_request ->
    ( describe_interconnect_loa_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_interconnect_loa_request ->
    ( describe_interconnect_loa_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeLoa] instead.\n\
  \ \n\
  \   Gets the LOA-CFA for the specified interconnect.\n\
  \   \n\
  \    The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that \
   is used when establishing your cross connect to Amazon Web Services at the colocation facility. \
   For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \    "]

module DescribeHostedConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hosted_connections_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hosted_connections_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the hosted connections that have been provisioned on the specified interconnect or link \
   aggregation group (LAG).\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module DescribeDirectConnectGateways : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateways_request ->
    ( describe_direct_connect_gateways_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateways_request ->
    ( describe_direct_connect_gateways_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted \
   Direct Connect gateways are not returned.\n"]

module DescribeDirectConnectGatewayAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_attachments_request ->
    ( describe_direct_connect_gateway_attachments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_attachments_request ->
    ( describe_direct_connect_gateway_attachments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the attachments between your Direct Connect gateways and virtual interfaces. You must \
   specify a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect \
   gateway, the response contains all virtual interfaces attached to the Direct Connect gateway. \
   If you specify a virtual interface, the response contains all Direct Connect gateways attached \
   to the virtual interface. If you specify both, the response contains the attachment between the \
   Direct Connect gateway and the virtual interface.\n"]

module DescribeDirectConnectGatewayAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_associations_request ->
    ( describe_direct_connect_gateway_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_associations_request ->
    ( describe_direct_connect_gateway_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the associations between your Direct Connect gateways and virtual private gateways and \
   transit gateways. You must specify one of the following:\n\n\
  \ {ul\n\
  \       {-  A Direct Connect gateway\n\
  \           \n\
  \            The response contains all virtual private gateways and transit gateways associated \
   with the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A virtual private gateway\n\
  \           \n\
  \            The response contains the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A transit gateway\n\
  \           \n\
  \            The response contains the Direct Connect gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a virtual private gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   virtual private gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a transit gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   transit gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway and a virtual private gateway\n\
  \           \n\
  \            The response contains the association between the Direct Connect gateway and \
   virtual private gateway.\n\
  \            \n\
  \             }\n\
  \       {-  A Direct Connect gateway association to a Cloud WAN core network\n\
  \           \n\
  \            The response contains the Cloud WAN core network ID that the Direct Connect gateway \
   is associated to.\n\
  \            \n\
  \             }\n\
  \       }\n\
  \  "]

module DescribeDirectConnectGatewayAssociationProposals : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_association_proposals_request ->
    ( describe_direct_connect_gateway_association_proposals_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_direct_connect_gateway_association_proposals_request ->
    ( describe_direct_connect_gateway_association_proposals_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more association proposals for connection between a virtual private gateway or \
   transit gateway and a Direct Connect gateway. \n"]

module DescribeCustomerMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_customer_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_customer_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get and view a list of customer agreements, along with their signed status and whether the \
   customer is an NNIPartner, NNIPartnerV2, or a nonPartner. \n"]

module DescribeConnectionsOnInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_on_interconnect_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_on_interconnect_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeHostedConnections] instead.\n\
  \ \n\
  \   Lists the connections that have been provisioned on the specified interconnect.\n\
  \   \n\
  \     Intended for use by Direct Connect Partners only.\n\
  \     \n\
  \      "]

module DescribeConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_request ->
    ( connections,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_request ->
    ( connections Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Displays the specified connection or all connections in this Region.\n"]

module DescribeConnectionLoa : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_loa_request ->
    ( describe_connection_loa_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_loa_request ->
    ( describe_connection_loa_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [DescribeLoa] instead.\n\
  \ \n\
  \   Gets the LOA-CFA for a connection.\n\
  \   \n\
  \    The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that \
   your APN partner or service provider uses when establishing your cross connect to Amazon Web \
   Services at the colocation facility. For more information, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html}Requesting Cross \
   Connects at Direct Connect Locations} in the {i Direct Connect User Guide}.\n\
  \    "]

module DeleteVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_interface_request ->
    ( delete_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_interface_request ->
    ( delete_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a virtual interface.\n"]

module DeleteLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active \
   virtual interfaces or hosted connections.\n"]

module DeleteInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_interconnect_request ->
    ( delete_interconnect_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_interconnect_request ->
    ( delete_interconnect_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified interconnect.\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module DeleteDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_proposal_request ->
    ( delete_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_proposal_request ->
    ( delete_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association proposal request between the specified Direct Connect gateway and \
   virtual private gateway or transit gateway.\n"]

module DeleteDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_request ->
    ( delete_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_association_request ->
    ( delete_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between the specified Direct Connect gateway and virtual private \
   gateway.\n\n\
  \ We recommend that you specify the [associationID] to delete the association. Alternatively, if \
   you own virtual gateway and a Direct Connect gateway association, you can specify the \
   [virtualGatewayId] and [directConnectGatewayId] to delete an association.\n\
  \ "]

module DeleteDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_request ->
    ( delete_direct_connect_gateway_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_direct_connect_gateway_request ->
    ( delete_direct_connect_gateway_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that \
   are attached to the Direct Connect gateway and disassociate all virtual private gateways \
   associated with the Direct Connect gateway.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified connection.\n\n\
  \ Deleting a connection only stops the Direct Connect port hour and data transfer charges. If \
   you are partnering with any third parties to connect with the Direct Connect location, you must \
   cancel your service with them separately.\n\
  \ "]

module DeleteBGPPeer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_bgp_peer_request ->
    ( delete_bgp_peer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_bgp_peer_request ->
    ( delete_bgp_peer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified BGP peer on the specified virtual interface with the specified customer \
   address and ASN.\n\n\
  \ You cannot delete the last BGP peer from a virtual interface.\n\
  \ "]

module CreateTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_transit_virtual_interface_request ->
    ( create_transit_virtual_interface_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_transit_virtual_interface_request ->
    ( create_transit_virtual_interface_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transit virtual interface. A transit virtual interface should be used to access one \
   or more transit gateways associated with Direct Connect gateways. A transit virtual interface \
   enables the connection of multiple VPCs attached to a transit gateway to a Direct Connect \
   gateway.\n\n\
  \  If you associate your transit gateway with one or more Direct Connect gateways, the \
   Autonomous System Number (ASN) used by the transit gateway and the Direct Connect gateway must \
   be different. For example, if you use the default ASN 64512 for both your the transit gateway \
   and Direct Connect gateway, the association request fails.\n\
  \  \n\
  \    A jumbo MTU value must be either 1500 or 8500. No other values will be accepted. Setting \
   the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the underlying \
   physical connection if it wasn't updated to support jumbo frames. Updating the connection \
   disrupts network connectivity for all virtual interfaces associated with the connection for up \
   to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \    "]

module CreatePublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_public_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_public_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a public virtual interface. A virtual interface is the VLAN that transports Direct \
   Connect traffic. A public virtual interface supports sending traffic to public services of \
   Amazon Web Services such as Amazon S3.\n\n\
  \ When creating an IPv6 public virtual interface ([addressFamily] is [ipv6]), leave the \
   [customer] and [amazon] address fields blank to use auto-assigned IPv6 space. Custom IPv6 \
   addresses are not supported.\n\
  \ "]

module CreatePrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_private_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_private_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a private virtual interface. A virtual interface is the VLAN that transports Direct \
   Connect traffic. A private virtual interface can be connected to either a Direct Connect \
   gateway or a Virtual Private Gateway (VGW). Connecting the private virtual interface to a \
   Direct Connect gateway enables the possibility for connecting to multiple VPCs, including VPCs \
   in different Amazon Web Services Regions. Connecting the private virtual interface to a VGW \
   only provides access to a single VPC within the same Region.\n\n\
  \ Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the \
   underlying physical connection if it wasn't updated to support jumbo frames. Updating the \
   connection disrupts network connectivity for all virtual interfaces associated with the \
   connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \
   [DescribeConnections]. To check whether your virtual interface supports jumbo frames, call \
   [DescribeVirtualInterfaces].\n\
  \ "]

module CreateLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_lag_request ->
    ( lag,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_lag_request ->
    ( lag Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a link aggregation group (LAG) with the specified number of bundled physical dedicated \
   connections between the customer network and a specific Direct Connect location. A LAG is a \
   logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple \
   interfaces, enabling you to treat them as a single interface.\n\n\
  \ All connections in a LAG must use the same bandwidth (either 1Gbps, 10Gbps, 100Gbps, or \
   400Gbps) and must terminate at the same Direct Connect endpoint.\n\
  \ \n\
  \  You can have up to 10 dedicated connections per location. Regardless of this limit, if you \
   request more connections for the LAG than Direct Connect can allocate on a single endpoint, no \
   LAG is created..\n\
  \  \n\
  \   You can specify an existing physical dedicated connection or interconnect to include in the \
   LAG (which counts towards the total number of connections). Doing so interrupts the current \
   physical dedicated connection, and re-establishes them as a member of the LAG. The LAG will be \
   created on the same Direct Connect endpoint to which the dedicated connection terminates. Any \
   virtual interfaces associated with the dedicated connection are automatically disassociated and \
   re-associated with the LAG. The connection ID does not change.\n\
  \   \n\
  \    If the Amazon Web Services account used to create a LAG is a registered Direct Connect \
   Partner, the LAG is automatically enabled to host sub-connections. For a LAG owned by a \
   partner, any associated virtual interfaces cannot be directly configured.\n\
  \    "]

module CreateInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_interconnect_request ->
    ( interconnect,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_interconnect_request ->
    ( interconnect Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an interconnect between an Direct Connect Partner's network and a specific Direct \
   Connect location.\n\n\
  \ An interconnect is a connection that is capable of hosting other connections. The Direct \
   Connect Partner can use an interconnect to provide Direct Connect hosted connections to \
   customers through their own network services. Like a standard connection, an interconnect links \
   the partner's network to an Direct Connect location over a standard Ethernet fiber-optic cable. \
   One end is connected to the partner's router, the other to an Direct Connect router.\n\
  \ \n\
  \  You can automatically add the new interconnect to a link aggregation group (LAG) by \
   specifying a LAG ID in the request. This ensures that the new interconnect is allocated on the \
   same Direct Connect endpoint that hosts the specified LAG. If there are no available ports on \
   the endpoint, the request fails and no interconnect is created.\n\
  \  \n\
  \   For each end customer, the Direct Connect Partner provisions a connection on their \
   interconnect by calling [AllocateHostedConnection]. The end customer can then connect to Amazon \
   Web Services resources by creating a virtual interface on their connection, using the VLAN \
   assigned to them by the Direct Connect Partner.\n\
  \   \n\
  \     Intended for use by Direct Connect Partners only.\n\
  \     \n\
  \      "]

module CreateDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_proposal_request ->
    ( create_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_proposal_request ->
    ( create_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a proposal to associate the specified virtual private gateway or transit gateway with \
   the specified Direct Connect gateway.\n\n\
  \ You can associate a Direct Connect gateway and virtual private gateway or transit gateway that \
   is owned by any Amazon Web Services account. \n\
  \ "]

module CreateDirectConnectGatewayAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_request ->
    ( create_direct_connect_gateway_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_association_request ->
    ( create_direct_connect_gateway_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an association between a Direct Connect gateway and a virtual private gateway. The \
   virtual private gateway must be attached to a VPC and must not be associated with another \
   Direct Connect gateway.\n"]

module CreateDirectConnectGateway : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_request ->
    ( create_direct_connect_gateway_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_direct_connect_gateway_request ->
    ( create_direct_connect_gateway_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a \
   set of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and \
   visible in any Amazon Web Services Region after it is created. The virtual interfaces and \
   virtual private gateways that are connected through a Direct Connect gateway can be in \
   different Amazon Web Services Regions. This enables you to connect to a VPC in any Region, \
   regardless of the Region in which the virtual interfaces are located, and pass traffic between \
   them.\n"]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection between a customer network and a specific Direct Connect location.\n\n\
  \ A connection links your internal network to an Direct Connect location over a standard \
   Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an \
   Direct Connect router.\n\
  \ \n\
  \  To find the locations for your Region, use [DescribeLocations].\n\
  \  \n\
  \   You can automatically add the new connection to a link aggregation group (LAG) by specifying \
   a LAG ID in the request. This ensures that the new connection is allocated on the same Direct \
   Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, \
   the request fails and no connection is created.\n\
  \   "]

module CreateBGPPeer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_bgp_peer_request ->
    ( create_bgp_peer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_bgp_peer_request ->
    ( create_bgp_peer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a BGP peer on the specified virtual interface.\n\n\
  \ You must create a BGP peer for the corresponding address family (IPv4/IPv6) in order to access \
   Amazon Web Services resources that also use that address family.\n\
  \ \n\
  \  If logical redundancy is not supported by the connection, interconnect, or LAG, the BGP peer \
   cannot be in the same address family as an existing BGP peer on the virtual interface.\n\
  \  \n\
  \   When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6 addresses \
   are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom \
   IPv6 addresses.\n\
  \   \n\
  \     If you let Amazon Web Services auto-assign IPv4 addresses, a /30 CIDR will be allocated \
   from 169.254.0.0/16. Amazon Web Services does not recommend this option if you intend to use \
   the customer router peer IP address as the source and destination for traffic. Instead you \
   should use RFC 1918 or other addressing, and specify the address yourself. For more information \
   about RFC 1918 see {{:https://datatracker.ietf.org/doc/html/rfc1918} Address Allocation for \
   Private Internets}.\n\
  \     \n\
  \       For a public virtual interface, the Autonomous System Number (ASN) must be private or \
   already on the allow list for the virtual interface.\n\
  \       "]

module ConfirmTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_transit_virtual_interface_request ->
    ( confirm_transit_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_transit_virtual_interface_request ->
    ( confirm_transit_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a transit virtual interface created by another Amazon Web Services \
   account.\n\n\
  \  After the owner of the transit virtual interface makes this call, the specified transit \
   virtual interface is created and made available to handle traffic.\n\
  \ "]

module ConfirmPublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_public_virtual_interface_request ->
    ( confirm_public_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_public_virtual_interface_request ->
    ( confirm_public_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a public virtual interface created by another Amazon Web Services account.\n\n\
  \ After the virtual interface owner makes this call, the specified virtual interface is created \
   and made available to handle traffic.\n\
  \ "]

module ConfirmPrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_private_virtual_interface_request ->
    ( confirm_private_virtual_interface_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_private_virtual_interface_request ->
    ( confirm_private_virtual_interface_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts ownership of a private virtual interface created by another Amazon Web Services \
   account.\n\n\
  \ After the virtual interface owner makes this call, the virtual interface is created and \
   attached to the specified virtual private gateway or Direct Connect gateway, and is made \
   available to handle traffic.\n\
  \ "]

module ConfirmCustomerAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_customer_agreement_request ->
    ( confirm_customer_agreement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_customer_agreement_request ->
    ( confirm_customer_agreement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The confirmation of the terms of agreement when creating the connection/link aggregation group \
   (LAG). \n"]

module ConfirmConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_connection_request ->
    ( confirm_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_connection_request ->
    ( confirm_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms the creation of the specified hosted connection on an interconnect.\n\n\
  \ Upon creation, the hosted connection is initially in the [Ordering] state, and remains in this \
   state until the owner confirms creation of the hosted connection.\n\
  \ "]

module AssociateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a virtual interface with a specified link aggregation group (LAG) or connection. \
   Connectivity to Amazon Web Services is temporarily interrupted as the virtual interface is \
   being migrated. If the target connection or LAG has an associated virtual interface with a \
   conflicting VLAN number or a conflicting IP address, the operation fails.\n\n\
  \ Virtual interfaces associated with a hosted connection cannot be associated with a LAG; hosted \
   connections must be migrated along with their virtual interfaces using \
   [AssociateHostedConnection].\n\
  \ \n\
  \  To reassociate a virtual interface to a new connection or LAG, the requester must own either \
   the virtual interface itself or the connection to which the virtual interface is currently \
   associated. Additionally, the requester must own the connection or LAG for the association.\n\
  \  "]

module AssociateMacSecKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_mac_sec_key_request ->
    ( associate_mac_sec_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_mac_sec_key_request ->
    ( associate_mac_sec_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a MAC Security (MACsec) Connection Key Name (CKN)/ Connectivity Association Key \
   (CAK) pair with a Direct Connect connection.\n\n\
  \ You must supply either the [secretARN,] or the CKN/CAK ([ckn] and [cak]) pair in the request.\n\
  \ \n\
  \  For information about MAC Security (MACsec) key considerations, see \
   {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-key-consideration}MACsec \
   pre-shared CKN/CAK key considerations } in the {i Direct Connect User Guide}.\n\
  \  "]

module AssociateHostedConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_hosted_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_hosted_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) \
   or interconnect. If the target interconnect or LAG has an existing hosted connection with a \
   conflicting VLAN number or IP address, the operation fails. This action temporarily interrupts \
   the hosted connection's connectivity to Amazon Web Services as it is being migrated.\n\n\
  \  Intended for use by Direct Connect Partners only.\n\
  \  \n\
  \   "]

module AssociateConnectionWithLag : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_with_lag_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_with_lag_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an existing connection with a link aggregation group (LAG). The connection is \
   interrupted and re-established as a member of the LAG (connectivity to Amazon Web Services is \
   interrupted). The connection must be hosted on the same Direct Connect endpoint as the LAG, and \
   its bandwidth must match the bandwidth for the LAG. You can re-associate a connection that's \
   currently associated with a different LAG; however, if removing the connection would cause the \
   original LAG to fall below its setting for minimum number of operational connections, the \
   request fails.\n\n\
  \ Any virtual interfaces that are directly associated with the connection are automatically \
   re-associated with the LAG. If the connection was originally associated with a different LAG, \
   the virtual interfaces remain associated with the original LAG.\n\
  \ \n\
  \  For interconnects, any hosted connections are automatically re-associated with the LAG. If \
   the interconnect was originally associated with a different LAG, the hosted connections remain \
   associated with the original LAG.\n\
  \  "]

module AllocateTransitVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_transit_virtual_interface_request ->
    ( allocate_transit_virtual_interface_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_transit_virtual_interface_request ->
    ( allocate_transit_virtual_interface_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a transit virtual interface to be owned by the specified Amazon Web Services \
   account. Use this type of interface to connect a transit gateway to your Direct Connect \
   gateway.\n\n\
  \ The owner of a connection provisions a transit virtual interface to be owned by the specified \
   Amazon Web Services account.\n\
  \ \n\
  \  After you create a transit virtual interface, it must be confirmed by the owner using \
   [ConfirmTransitVirtualInterface]. Until this step has been completed, the transit virtual \
   interface is in the [requested] state and is not available to handle traffic.\n\
  \  "]

module AllocatePublicVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_public_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_public_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a public virtual interface to be owned by the specified Amazon Web Services account.\n\n\
  \ The owner of a connection calls this function to provision a public virtual interface to be \
   owned by the specified Amazon Web Services account.\n\
  \ \n\
  \  Virtual interfaces created using this function must be confirmed by the owner using \
   [ConfirmPublicVirtualInterface]. Until this step has been completed, the virtual interface is \
   in the [confirming] state and is not available to handle traffic.\n\
  \  \n\
  \   When creating an IPv6 public virtual interface, omit the Amazon address and customer \
   address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you \
   cannot specify custom IPv6 addresses.\n\
  \   "]

module AllocatePrivateVirtualInterface : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_private_virtual_interface_request ->
    ( virtual_interface,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_private_virtual_interface_request ->
    ( virtual_interface Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions a private virtual interface to be owned by the specified Amazon Web Services \
   account.\n\n\
  \ Virtual interfaces created using this action must be confirmed by the owner using \
   [ConfirmPrivateVirtualInterface]. Until then, the virtual interface is in the [Confirming] \
   state and is not available to handle traffic.\n\
  \ "]

module AllocateHostedConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_hosted_connection_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_hosted_connection_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of \
   interconnects.\n\n\
  \ Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a hosted \
   connection on the specified interconnect or LAG of interconnects. Amazon Web Services polices \
   the hosted connection for the specified capacity and the Direct Connect Partner must also \
   police the hosted connection for the specified capacity.\n\
  \ \n\
  \   Intended for use by Direct Connect Partners only.\n\
  \   \n\
  \    "]

module AllocateConnectionOnInterconnect : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allocate_connection_on_interconnect_request ->
    ( connection,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allocate_connection_on_interconnect_request ->
    ( connection Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deprecated. Use [AllocateHostedConnection] instead.\n\
  \ \n\
  \   Creates a hosted connection on an interconnect.\n\
  \   \n\
  \    Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection \
   on the specified interconnect.\n\
  \    \n\
  \      Intended for use by Direct Connect Partners only.\n\
  \      \n\
  \       "]

module AcceptDirectConnectGatewayAssociationProposal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DirectConnectClientException of direct_connect_client_exception
    | `DirectConnectServerException of direct_connect_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_direct_connect_gateway_association_proposal_request ->
    ( accept_direct_connect_gateway_association_proposal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_direct_connect_gateway_association_proposal_request ->
    ( accept_direct_connect_gateway_association_proposal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DirectConnectClientException of direct_connect_client_exception
      | `DirectConnectServerException of direct_connect_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct \
   Connect gateway.\n"]
