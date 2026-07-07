type nonrec xslt_template_name_for_mac_sec = string [@@ocaml.doc ""]

type nonrec xslt_template_name = string [@@ocaml.doc ""]

type nonrec owner_account = string [@@ocaml.doc ""]

type nonrec virtual_interface_id = string [@@ocaml.doc ""]

type nonrec location_code = string [@@ocaml.doc ""]

type nonrec connection_id = string [@@ocaml.doc ""]

type nonrec virtual_interface_type = string [@@ocaml.doc ""]

type nonrec virtual_interface_name = string [@@ocaml.doc ""]

type nonrec vla_n = int [@@ocaml.doc ""]

type nonrec as_n = int [@@ocaml.doc ""]

type nonrec long_asn = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec bgp_auth_key = string [@@ocaml.doc ""]

type nonrec amazon_address = string [@@ocaml.doc ""]

type nonrec customer_address = string [@@ocaml.doc ""]

type nonrec address_family = IPv6 [@ocaml.doc ""] | IPv4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec virtual_interface_state =
  | Unknown [@ocaml.doc ""]
  | Rejected [@ocaml.doc ""]
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Testing [@ocaml.doc ""]
  | Down [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Verifying [@ocaml.doc ""]
  | Confirming [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec router_config = string [@@ocaml.doc ""]

type nonrec mt_u = int [@@ocaml.doc ""]

type nonrec jumbo_frame_capable = bool [@@ocaml.doc ""]

type nonrec virtual_gateway_id = string [@@ocaml.doc ""]

type nonrec direct_connect_gateway_id = string [@@ocaml.doc ""]

type nonrec cid_r = string [@@ocaml.doc ""]

type nonrec route_filter_prefix = {
  cidr : cid_r option;
      [@ocaml.doc
        "The CIDR block for the advertised route. Separate multiple routes using commas. An IPv6 \
         CIDR must use /64 or shorter.\n"]
}
[@@ocaml.doc
  "Information about a route filter prefix that a customer can advertise through Border Gateway \
   Protocol (BGP) over a public virtual interface.\n"]

type nonrec route_filter_prefix_list = route_filter_prefix list [@@ocaml.doc ""]

type nonrec bgp_peer_id = string [@@ocaml.doc ""]

type nonrec bgp_peer_state =
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Verifying [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bgp_status = Unknown [@ocaml.doc ""] | Down [@ocaml.doc ""] | Up [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_device_v2 = string [@@ocaml.doc ""]

type nonrec aws_logical_device_id = string [@@ocaml.doc ""]

type nonrec bgp_peer = {
  aws_logical_device_id : aws_logical_device_id option;
      [@ocaml.doc
        "The Direct Connect endpoint that terminates the logical connection. This device might be \
         different than the device that terminates the physical connection.\n"]
  aws_device_v2 : aws_device_v2 option;
      [@ocaml.doc "The Direct Connect endpoint that terminates the BGP peer.\n"]
  bgp_status : bgp_status option;
      [@ocaml.doc
        "The status of the BGP peer. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [up]: The BGP peer is established. This state does not indicate the state of \
         the routing function. Ensure that you are receiving routes over the BGP session.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The BGP peer is down.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The BGP peer status is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  bgp_peer_state : bgp_peer_state option;
      [@ocaml.doc
        "The state of the BGP peer. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [verifying]: The BGP peering addresses or ASN require validation before the \
         BGP peer can be created. This state applies only to public virtual interfaces.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The BGP peer is created, and remains in this state until it is \
         ready to be established.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The BGP peer is ready to be established.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The BGP peer is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The BGP peer is deleted and cannot be established.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for the BGP peer. The valid range is from 1 to 4294967294 for BGP \
         configuration. \n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  bgp_peer_id : bgp_peer_id option; [@ocaml.doc "The ID of the BGP peer.\n"]
}
[@@ocaml.doc "Information about a BGP peer.\n"]

type nonrec bgp_peer_list = bgp_peer list [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "The value.\n"]
  key : tag_key; [@ocaml.doc "The key.\n"]
}
[@@ocaml.doc "Information about a tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec site_link_enabled = bool [@@ocaml.doc ""]

type nonrec rate_limit = string [@@ocaml.doc ""]

type nonrec virtual_interface = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) applied to the virtual interface. The value must be \
         one of the supported bandwidth values and cannot exceed the bandwidth of the parent \
         connection or LAG. Supported values: [50Mbps], [100Mbps], [200Mbps], [300Mbps], \
         [400Mbps], [500Mbps], [600Mbps], [700Mbps], [800Mbps], [900Mbps], [1Gbps], [1.2Gbps], \
         [1.5Gbps], [1.8Gbps], [2Gbps], [2.1Gbps], [2.4Gbps], [2.7Gbps], [3Gbps], [3.2Gbps], \
         [3.6Gbps], [4Gbps], [5Gbps], [6Gbps], [7Gbps], [8Gbps], [9Gbps], [10Gbps], [12Gbps], \
         [15Gbps], [18Gbps], [20Gbps], [21Gbps], [24Gbps], [27Gbps], [30Gbps], [32Gbps], [36Gbps], \
         [40Gbps], [50Gbps], [60Gbps], [70Gbps], [80Gbps], [100Gbps], [120Gbps], [150Gbps], \
         [180Gbps], [200Gbps], [210Gbps], [240Gbps], [270Gbps], [300Gbps], [320Gbps], [360Gbps], \
         [400Gbps], [450Gbps], [480Gbps], [500Gbps], [540Gbps], [600Gbps], [700Gbps], [800Gbps], \
         [900Gbps], [1Tbps], [1.1Tbps], [1.2Tbps], [1.3Tbps], [1.4Tbps], [1.5Tbps], [1.6Tbps].\n"]
  site_link_enabled : site_link_enabled option;
      [@ocaml.doc "Indicates whether SiteLink is enabled.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the virtual interface.\n"]
  aws_logical_device_id : aws_logical_device_id option;
      [@ocaml.doc
        "The Direct Connect endpoint that terminates the logical connection. This device might be \
         different than the device that terminates the physical connection.\n"]
  aws_device_v2 : aws_device_v2 option;
      [@ocaml.doc "The Direct Connect endpoint that terminates the physical connection.\n"]
  region : region option;
      [@ocaml.doc "The Amazon Web Services Region where the virtual interface is located.\n"]
  bgp_peers : bgp_peer_list option;
      [@ocaml.doc "The BGP peers configured on this virtual interface.\n"]
  route_filter_prefixes : route_filter_prefix_list option;
      [@ocaml.doc
        "The routes to be advertised to the Amazon Web Services network in this Region. Applies to \
         public virtual interfaces.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc
        "The ID of the virtual private gateway. Applies only to private virtual interfaces.\n"]
  jumbo_frame_capable : jumbo_frame_capable option;
      [@ocaml.doc "Indicates whether jumbo frames are supported.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500\n"]
  customer_router_config : router_config option; [@ocaml.doc "The customer router configuration.\n"]
  virtual_interface_state : virtual_interface_state option;
      [@ocaml.doc
        "The state of the virtual interface. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [confirming]: The creation of the virtual interface is pending confirmation \
         from the virtual interface owner. If the owner of the virtual interface is different from \
         the owner of the connection on which it is provisioned, then the virtual interface will \
         remain in this state until it is confirmed by the virtual interface owner.\n\
        \           \n\
        \            }\n\
        \       {-   [verifying]: This state only applies to public virtual interfaces. Each \
         public virtual interface needs validation before the virtual interface can be created.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: A virtual interface is in this state from the time that it is \
         created until the virtual interface is ready to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: A virtual interface that is able to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: A virtual interface that is BGP down.\n\
        \           \n\
        \            }\n\
        \       {-   [testing]: A virtual interface is in this state immediately after calling \
         [StartBgpFailoverTest] and remains in this state during the duration of the test.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: A virtual interface is in this state immediately after calling \
         [DeleteVirtualInterface] until it can no longer forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: A virtual interface that cannot forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: The virtual interface owner has declined creation of the virtual \
         interface. If a virtual interface in the [Confirming] state is deleted by the virtual \
         interface owner, the virtual interface enters the [Rejected] state.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the virtual interface is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  amazon_side_asn : long_asn option;
      [@ocaml.doc "The autonomous system number (AS) for the Amazon side of the connection.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for the virtual interface. The valid range is from 1 to 4294967294 for BGP \
         configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vlan : vla_n option; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name option;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
  virtual_interface_type : virtual_interface_type option;
      [@ocaml.doc
        "The type of virtual interface. The possible values are [private], [public] and [transit].\n"]
  connection_id : connection_id option; [@ocaml.doc "The ID of the connection.\n"]
  location : location_code option; [@ocaml.doc "The location of the connection.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
  owner_account : owner_account option;
      [@ocaml.doc "The ID of the Amazon Web Services account that owns the virtual interface.\n"]
}
[@@ocaml.doc "Information about a virtual interface.\n"]

type nonrec virtual_interface_list = virtual_interface list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec virtual_interfaces = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  virtual_interfaces : virtual_interface_list option; [@ocaml.doc "The virtual interfaces\n"]
}
[@@ocaml.doc ""]

type nonrec test_id = string [@@ocaml.doc ""]

type nonrec bgp_peer_id_list = bgp_peer_id list [@@ocaml.doc ""]

type nonrec failure_test_history_status = string [@@ocaml.doc ""]

type nonrec test_duration = int [@@ocaml.doc ""]

type nonrec start_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec end_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec virtual_interface_test_history = {
  end_time : end_time option;
      [@ocaml.doc "The time that the virtual interface moves out of the DOWN state.\n"]
  start_time : start_time option;
      [@ocaml.doc "The time that the virtual interface moves to the DOWN state.\n"]
  test_duration_in_minutes : test_duration option;
      [@ocaml.doc "The time that the virtual interface failover test ran in minutes.\n"]
  owner_account : owner_account option;
      [@ocaml.doc "The owner ID of the tested virtual interface.\n"]
  status : failure_test_history_status option;
      [@ocaml.doc "The status of the virtual interface failover test.\n"]
  bgp_peers : bgp_peer_id_list option;
      [@ocaml.doc
        "The BGP peers that were put in the DOWN state as part of the virtual interface failover \
         test.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the tested virtual interface.\n"]
  test_id : test_id option; [@ocaml.doc "The ID of the virtual interface failover test.\n"]
}
[@@ocaml.doc "Information about the virtual interface failover test.\n"]

type nonrec virtual_interface_test_history_list = virtual_interface_test_history list
[@@ocaml.doc ""]

type nonrec virtual_interface_region = string [@@ocaml.doc ""]

type nonrec virtual_gateway_state = string [@@ocaml.doc ""]

type nonrec virtual_gateway = {
  virtual_gateway_state : virtual_gateway_state option;
      [@ocaml.doc
        "The state of the virtual private gateway. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [pending]: Initial state after creating the virtual private gateway.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: Ready for use by a private virtual interface.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: Initial state after deleting the virtual private gateway.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The virtual private gateway is deleted. The private virtual \
         interface is unable to send traffic over this gateway.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway.\n"]
}
[@@ocaml.doc "Information about a virtual private gateway for a private virtual interface.\n"]

type nonrec virtual_gateway_list = virtual_gateway list [@@ocaml.doc ""]

type nonrec virtual_gateways = {
  virtual_gateways : virtual_gateway_list option; [@ocaml.doc "The virtual private gateways.\n"]
}
[@@ocaml.doc ""]

type nonrec virtual_gateway_region = string [@@ocaml.doc ""]

type nonrec vendor = string [@@ocaml.doc ""]

type nonrec enable_site_link = bool [@@ocaml.doc ""]

type nonrec update_virtual_interface_attributes_request = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. Use this to \
         update the bandwidth allocation on an existing virtual interface.\n"]
  virtual_interface_name : virtual_interface_name option;
      [@ocaml.doc "The name of the virtual private interface.\n"]
  enable_site_link : enable_site_link option;
      [@ocaml.doc "Indicates whether to enable or disable SiteLink.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500.\n"]
  virtual_interface_id : virtual_interface_id;
      [@ocaml.doc "The ID of the virtual private interface.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec direct_connect_server_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A server-side error occurred.\n"]

type nonrec direct_connect_client_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameters are not valid.\n"]

type nonrec lag_id = string [@@ocaml.doc ""]

type nonrec lag_name = string [@@ocaml.doc ""]

type nonrec count = int [@@ocaml.doc ""]

type nonrec encryption_mode = string [@@ocaml.doc ""]

type nonrec update_lag_request = {
  encryption_mode : encryption_mode option;
      [@ocaml.doc
        "The LAG MAC Security (MACsec) encryption mode.\n\n\
        \ Amazon Web Services applies the value to all connections which are part of the LAG.\n\
        \ "]
  minimum_links : count option;
      [@ocaml.doc
        "The minimum number of physical connections that must be operational for the LAG itself to \
         be operational.\n"]
  lag_name : lag_name option; [@ocaml.doc "The name of the LAG.\n"]
  lag_id : lag_id; [@ocaml.doc "The ID of the LAG.\n"]
}
[@@ocaml.doc ""]

type nonrec bandwidth = string [@@ocaml.doc ""]

type nonrec lag_state =
  | Unknown [@ocaml.doc ""]
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Down [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Requested [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_device = string [@@ocaml.doc ""]

type nonrec connection_name = string [@@ocaml.doc ""]

type nonrec connection_state =
  | Unknown [@ocaml.doc ""]
  | Rejected [@ocaml.doc ""]
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Down [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Requested [@ocaml.doc ""]
  | Ordering [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partner_name = string [@@ocaml.doc ""]

type nonrec loa_issue_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec has_logical_redundancy =
  | No [@ocaml.doc ""]
  | Yes [@ocaml.doc ""]
  | Unknown [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec provider_name = string [@@ocaml.doc ""]

type nonrec mac_sec_capable = bool [@@ocaml.doc ""]

type nonrec port_encryption_status = string [@@ocaml.doc ""]

type nonrec secret_ar_n = string [@@ocaml.doc ""]

type nonrec ckn = string [@@ocaml.doc ""]

type nonrec state = string [@@ocaml.doc ""]

type nonrec start_on_date = string [@@ocaml.doc ""]

type nonrec mac_sec_key = {
  start_on : start_on_date option;
      [@ocaml.doc
        "The date that the MAC Security (MACsec) secret key takes effect. The value is displayed \
         in UTC format.\n"]
  state : state option;
      [@ocaml.doc
        "The state of the MAC Security (MACsec) secret key.\n\n\
        \ The possible values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [associating]: The MAC Security (MACsec) secret key is being validated and \
         not yet associated with the connection or LAG.\n\
        \            \n\
        \             }\n\
        \        {-   [associated]: The MAC Security (MACsec) secret key is validated and \
         associated with the connection or LAG.\n\
        \            \n\
        \             }\n\
        \        {-   [disassociating]: The MAC Security (MACsec) secret key is being \
         disassociated from the connection or LAG\n\
        \            \n\
        \             }\n\
        \        {-   [disassociated]: The MAC Security (MACsec) secret key is no longer \
         associated with the connection or LAG.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  ckn : ckn option; [@ocaml.doc "The Connection Key Name (CKN) for the MAC Security secret key.\n"]
  secret_ar_n : secret_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.\n"]
}
[@@ocaml.doc "Information about the MAC Security (MACsec) secret key.\n"]

type nonrec mac_sec_key_list = mac_sec_key list [@@ocaml.doc ""]

type nonrec rate_limiter_status = {
  total_bandwidth : bandwidth option;
      [@ocaml.doc "The total bandwidth allocated across all rate limiters on the connection.\n"]
  remaining : count option;
      [@ocaml.doc "The number of rate limiters remaining (available) on the connection.\n"]
  in_use : count option;
      [@ocaml.doc "The number of rate limiters currently in use on the connection.\n"]
  max_allowed : count option;
      [@ocaml.doc "The maximum number of rate limiters allowed on the connection.\n"]
}
[@@ocaml.doc
  "Contains information about the rate limiter status for a connection, including the maximum \
   number of rate limiters allowed, the number currently in use, and the remaining capacity.\n"]

type nonrec partner_interconnect_mac_sec_capable = bool [@@ocaml.doc ""]

type nonrec connection = {
  partner_interconnect_mac_sec_capable : partner_interconnect_mac_sec_capable option;
      [@ocaml.doc
        "Indicates whether the interconnect hosting this connection supports MAC Security (MACsec).\n"]
  rate_limiter_status : rate_limiter_status option;
      [@ocaml.doc
        "The rate limiter status for the connection, including how many rate limiters are in use \
         and the maximum allowed.\n"]
  mac_sec_keys : mac_sec_key_list option;
      [@ocaml.doc "The MAC Security (MACsec) security keys associated with the connection.\n"]
  encryption_mode : encryption_mode option;
      [@ocaml.doc
        "The MAC Security (MACsec) connection encryption mode.\n\n\
        \ The valid values are [no_encrypt], [should_encrypt], and [must_encrypt].\n\
        \ "]
  port_encryption_status : port_encryption_status option;
      [@ocaml.doc
        "The MAC Security (MACsec) port link status of the connection.\n\n\
        \ The valid values are [Encryption Up], which means that there is an active Connection Key \
         Name, or [Encryption Down].\n\
        \ "]
  mac_sec_capable : mac_sec_capable option;
      [@ocaml.doc "Indicates whether the connection supports MAC Security (MACsec).\n"]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the connection.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the connection.\n"]
  has_logical_redundancy : has_logical_redundancy option;
      [@ocaml.doc
        "Indicates whether the connection supports a secondary BGP peer in the same address family \
         (IPv4/IPv6).\n"]
  aws_logical_device_id : aws_logical_device_id option;
      [@ocaml.doc
        "The Direct Connect endpoint that terminates the logical connection. This device might be \
         different than the device that terminates the physical connection.\n"]
  aws_device_v2 : aws_device_v2 option;
      [@ocaml.doc "The Direct Connect endpoint that terminates the physical connection.\n"]
  jumbo_frame_capable : jumbo_frame_capable option;
      [@ocaml.doc "Indicates whether jumbo frames are supported.\n"]
  aws_device : aws_device option;
      [@ocaml.doc "The Direct Connect endpoint on which the physical connection terminates.\n"]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
  loa_issue_time : loa_issue_time option;
      [@ocaml.doc "The time of the most recent call to [DescribeLoa] for this connection.\n"]
  partner_name : partner_name option;
      [@ocaml.doc
        "The name of the Direct Connect service provider associated with the connection.\n"]
  vlan : vla_n option; [@ocaml.doc "The ID of the VLAN.\n"]
  bandwidth : bandwidth option; [@ocaml.doc "The bandwidth of the connection.\n"]
  location : location_code option; [@ocaml.doc "The location of the connection.\n"]
  region : region option;
      [@ocaml.doc "The Amazon Web Services Region where the connection is located.\n"]
  connection_state : connection_state option;
      [@ocaml.doc
        "The state of the connection. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [ordering]: The initial state of a hosted connection provisioned on an \
         interconnect. The connection stays in the ordering state until the owner of the hosted \
         connection confirms or declines the connection order.\n\
        \           \n\
        \            }\n\
        \       {-   [requested]: The initial state of a standard connection. The connection stays \
         in the requested state until the Letter of Authorization (LOA) is sent to the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The connection has been approved and is being initialized.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The network link is up and the connection is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The network link is down.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The connection is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The connection has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: A hosted connection in the [ordering] state enters the [rejected] \
         state if it is deleted by the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the connection is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  connection_name : connection_name option; [@ocaml.doc "The name of the connection.\n"]
  connection_id : connection_id option; [@ocaml.doc "The ID of the connection.\n"]
  owner_account : owner_account option;
      [@ocaml.doc "The ID of the Amazon Web Services account that owns the connection.\n"]
}
[@@ocaml.doc "Information about an Direct Connect connection.\n"]

type nonrec connection_list = connection list [@@ocaml.doc ""]

type nonrec boolean_flag = bool [@@ocaml.doc ""]

type nonrec lag = {
  rate_limiter_status : rate_limiter_status option;
      [@ocaml.doc
        "The rate limiter status for the LAG, including how many rate limiters are in use and the \
         maximum allowed.\n"]
  mac_sec_keys : mac_sec_key_list option;
      [@ocaml.doc "The MAC Security (MACsec) security keys associated with the LAG.\n"]
  encryption_mode : encryption_mode option;
      [@ocaml.doc
        "The LAG MAC Security (MACsec) encryption mode.\n\n\
        \ The valid values are [no_encrypt], [should_encrypt], and [must_encrypt].\n\
        \ "]
  mac_sec_capable : mac_sec_capable option;
      [@ocaml.doc "Indicates whether the LAG supports MAC Security (MACsec).\n"]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the LAG.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the LAG.\n"]
  has_logical_redundancy : has_logical_redundancy option;
      [@ocaml.doc
        "Indicates whether the LAG supports a secondary BGP peer in the same address family \
         (IPv4/IPv6).\n"]
  jumbo_frame_capable : jumbo_frame_capable option;
      [@ocaml.doc "Indicates whether jumbo frames are supported.\n"]
  allows_hosted_connections : boolean_flag option;
      [@ocaml.doc "Indicates whether the LAG can host other connections.\n"]
  connections : connection_list option; [@ocaml.doc "The connections bundled by the LAG.\n"]
  aws_logical_device_id : aws_logical_device_id option;
      [@ocaml.doc
        "The Direct Connect endpoint that terminates the logical connection. This device might be \
         different than the device that terminates the physical connection.\n"]
  aws_device_v2 : aws_device_v2 option;
      [@ocaml.doc "The Direct Connect endpoint that hosts the LAG.\n"]
  aws_device : aws_device option; [@ocaml.doc "The Direct Connect endpoint that hosts the LAG.\n"]
  minimum_links : count option;
      [@ocaml.doc
        "The minimum number of physical dedicated connections that must be operational for the LAG \
         itself to be operational.\n"]
  region : region option;
      [@ocaml.doc "The Amazon Web Services Region where the connection is located.\n"]
  location : location_code option; [@ocaml.doc "The location of the LAG.\n"]
  lag_state : lag_state option;
      [@ocaml.doc
        "The state of the LAG. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [requested]: The initial state of a LAG. The LAG stays in the requested state \
         until the Letter of Authorization (LOA) is available.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The LAG has been approved and is being initialized.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The network link is established and the LAG is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The network link is down.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The LAG is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The LAG is deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the LAG is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  lag_name : lag_name option; [@ocaml.doc "The name of the LAG.\n"]
  owner_account : owner_account option;
      [@ocaml.doc "The ID of the Amazon Web Services account that owns the LAG.\n"]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
  number_of_connections : count option;
      [@ocaml.doc
        "The number of physical dedicated connections initially provisioned and bundled by the \
         LAG. You can have a maximum of four connections when the port speed is 1 Gbps or 10 Gbps, \
         or two when the port speed is 100 Gbps or 400 Gbps.\n"]
  connections_bandwidth : bandwidth option;
      [@ocaml.doc
        "The individual bandwidth of the physical connections bundled by the LAG. The possible \
         values are 1Gbps, 10Gbps, 100Gbps, or 400 Gbps.. \n"]
}
[@@ocaml.doc "Information about a link aggregation group (LAG).\n"]

type nonrec direct_connect_gateway_name = string [@@ocaml.doc ""]

type nonrec direct_connect_gateway_state =
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec state_change_error = string [@@ocaml.doc ""]

type nonrec direct_connect_gateway = {
  tags : tag_list option; [@ocaml.doc "Information about a tag.\n"]
  state_change_error : state_change_error option;
      [@ocaml.doc "The error message if the state of an object failed to advance.\n"]
  direct_connect_gateway_state : direct_connect_gateway_state option;
      [@ocaml.doc
        "The state of the Direct Connect gateway. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [pending]: The initial state after calling [CreateDirectConnectGateway].\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The Direct Connect gateway is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The initial state after calling [DeleteDirectConnectGateway].\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The Direct Connect gateway is deleted and cannot pass traffic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  owner_account : owner_account option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the Direct Connect gateway.\n"]
  amazon_side_asn : long_asn option;
      [@ocaml.doc "The autonomous system number (AS) for the Amazon side of the connection.\n"]
  direct_connect_gateway_name : direct_connect_gateway_name option;
      [@ocaml.doc "The name of the Direct Connect gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc
  "Information about a Direct Connect gateway, which enables you to connect virtual interfaces and \
   virtual private gateway or transit gateways.\n"]

type nonrec update_direct_connect_gateway_response = {
  direct_connect_gateway : direct_connect_gateway option;
      [@ocaml.doc
        "Informaiton about a Direct Connect gateway, which enables you to connect virtual \
         interfaces and virtual private gateways or transit gateways.\n"]
}
[@@ocaml.doc ""]

type nonrec update_direct_connect_gateway_request = {
  new_direct_connect_gateway_name : direct_connect_gateway_name;
      [@ocaml.doc "The new name for the Direct Connect gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway to update.\n"]
}
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_association_state =
  | Updating [@ocaml.doc ""]
  | Disassociated [@ocaml.doc ""]
  | Disassociating [@ocaml.doc ""]
  | Associated [@ocaml.doc ""]
  | Associating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec gateway_identifier = string [@@ocaml.doc ""]

type nonrec gateway_type = TransitGateway [@ocaml.doc ""] | VirtualPrivateGateway [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec associated_gateway = {
  region : region option; [@ocaml.doc "The Region where the associated gateway is located.\n"]
  owner_account : owner_account option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the associated virtual private \
         gateway or transit gateway.\n"]
  type_ : gateway_type option; [@ocaml.doc "The type of associated gateway.\n"]
  id : gateway_identifier option; [@ocaml.doc "The ID of the associated gateway.\n"]
}
[@@ocaml.doc "Information about the associated gateway.\n"]

type nonrec direct_connect_gateway_association_id = string [@@ocaml.doc ""]

type nonrec core_network_identifier = string [@@ocaml.doc ""]

type nonrec core_network_attachment_id = string [@@ocaml.doc ""]

type nonrec associated_core_network = {
  attachment_id : core_network_attachment_id option;
      [@ocaml.doc "the ID of the Direct Connect gateway attachment.\n"]
  owner_account : owner_account option;
      [@ocaml.doc "The account owner of the Cloud WAN core network.\n"]
  id : core_network_identifier option;
      [@ocaml.doc
        "The ID of the Cloud WAN core network that the Direct Connect gateway is associated to.\n"]
}
[@@ocaml.doc
  "The Amazon Web Services Cloud WAN core network that the Direct Connect gateway is associated \
   to. This is only returned when a Direct Connect gateway is associated to a Cloud WAN core \
   network.\n"]

type nonrec direct_connect_gateway_association = {
  virtual_gateway_owner_account : owner_account option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the virtual private gateway.\n"]
  virtual_gateway_region : virtual_gateway_region option;
      [@ocaml.doc "The Amazon Web Services Region where the virtual private gateway is located.\n"]
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc
        "The ID of the virtual private gateway. Applies only to private virtual interfaces.\n"]
  associated_core_network : associated_core_network option;
      [@ocaml.doc
        "The ID of the Cloud WAN core network associated with the Direct Connect gateway attachment.\n"]
  allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to advertise to the Direct Connect gateway.\n"]
  association_id : direct_connect_gateway_association_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway association.\n"]
  associated_gateway : associated_gateway option;
      [@ocaml.doc "Information about the associated gateway.\n"]
  state_change_error : state_change_error option;
      [@ocaml.doc "The error message if the state of an object failed to advance.\n"]
  association_state : direct_connect_gateway_association_state option;
      [@ocaml.doc
        "The state of the association. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [associating]: The initial state after calling \
         [CreateDirectConnectGatewayAssociation].\n\
        \           \n\
        \            }\n\
        \       {-   [associated]: The Direct Connect gateway and virtual private gateway or \
         transit gateway are successfully associated and ready to pass traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [disassociating]: The initial state after calling \
         [DeleteDirectConnectGatewayAssociation].\n\
        \           \n\
        \            }\n\
        \       {-   [disassociated]: The virtual private gateway or transit gateway is \
         disassociated from the Direct Connect gateway. Traffic flow between the Direct Connect \
         gateway and virtual private gateway or transit gateway is stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [updating]: The CIDR blocks for the virtual private gateway or transit \
         gateway are currently being updated. This could be new CIDR blocks added or current CIDR \
         blocks removed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  direct_connect_gateway_owner_account : owner_account option;
      [@ocaml.doc "The ID of the Amazon Web Services account that owns the associated gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc
  "Information about an association between a Direct Connect gateway and a virtual private gateway \
   or transit gateway.\n"]

type nonrec update_direct_connect_gateway_association_result = {
  direct_connect_gateway_association : direct_connect_gateway_association option;
      [@ocaml.doc
        "Information about an association between a Direct Connect gateway and a virtual private \
         gateway or transit gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec update_direct_connect_gateway_association_request = {
  remove_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.\n"]
  add_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to advertise to the Direct Connect gateway.\n"]
  association_id : direct_connect_gateway_association_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway association.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_request = {
  encryption_mode : encryption_mode option;
      [@ocaml.doc
        "The connection MAC Security (MACsec) encryption mode.\n\n\
        \ The valid values are [no_encrypt], [should_encrypt], and [must_encrypt].\n\
        \ "]
  connection_name : connection_name option; [@ocaml.doc "The name of the connection.\n"]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the connection.\n\n\
        \ You can use [DescribeConnections] to retrieve the connection ID.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The tag keys of the tags to remove.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You have reached the limit on the number of tags that can be assigned.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "The tags to add.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_tag_keys_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A tag key was specified more than once.\n"]

type nonrec stop_bgp_failover_test_response = {
  virtual_interface_test : virtual_interface_test_history option;
      [@ocaml.doc "Information about the virtual interface failover test.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_bgp_failover_test_request = {
  virtual_interface_id : virtual_interface_id;
      [@ocaml.doc "The ID of the virtual interface you no longer want to test.\n"]
}
[@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec start_bgp_failover_test_response = {
  virtual_interface_test : virtual_interface_test_history option;
      [@ocaml.doc "Information about the virtual interface failover test.\n"]
}
[@@ocaml.doc ""]

type nonrec start_bgp_failover_test_request = {
  test_duration_in_minutes : test_duration option;
      [@ocaml.doc
        "The time in minutes that the virtual interface failover test will last.\n\n\
        \ Maximum value: 4,320 minutes (72 hours).\n\
        \ \n\
        \  Default: 180 minutes (3 hours).\n\
        \  "]
  bgp_peers : bgp_peer_id_list option; [@ocaml.doc "The BGP peers to place in the DOWN state.\n"]
  virtual_interface_id : virtual_interface_id;
      [@ocaml.doc "The ID of the virtual interface you want to test.\n"]
}
[@@ocaml.doc ""]

type nonrec software = string [@@ocaml.doc ""]

type nonrec router_type_identifier = string [@@ocaml.doc ""]

type nonrec platform = string [@@ocaml.doc ""]

type nonrec router_type = {
  router_type_identifier : router_type_identifier option;
      [@ocaml.doc
        "Identifies the router by a combination of vendor, platform, and software version. For \
         example, [CiscoSystemsInc-2900SeriesRouters-IOS124].\n"]
  xslt_template_name_for_mac_sec : xslt_template_name_for_mac_sec option;
      [@ocaml.doc "The MAC Security (MACsec) template for the virtual interface's router.\n"]
  xslt_template_name : xslt_template_name option;
      [@ocaml.doc "The template for the virtual interface's router.\n"]
  software : software option; [@ocaml.doc "The router software. \n"]
  platform : platform option; [@ocaml.doc "The virtual interface router platform.\n"]
  vendor : vendor option; [@ocaml.doc "The vendor for the virtual interface's router.\n"]
}
[@@ocaml.doc "Information about the virtual router.\n"]

type nonrec resource_tag = {
  tags : tag_list option; [@ocaml.doc "The tags.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc "Information about a tag associated with an Direct Connect resource.\n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec resource_arn_list = resource_arn list [@@ocaml.doc ""]

type nonrec request_mac_sec = bool [@@ocaml.doc ""]

type nonrec provider_list = provider_name list [@@ocaml.doc ""]

type nonrec port_speed = string [@@ocaml.doc ""]

type nonrec list_virtual_interface_test_history_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  virtual_interface_test_history : virtual_interface_test_history_list option;
      [@ocaml.doc "The ID of the tested virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec max_result_set_size = int [@@ocaml.doc ""]

type nonrec list_virtual_interface_test_history_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  status : failure_test_history_status option;
      [@ocaml.doc "The status of the virtual interface failover test.\n"]
  bgp_peers : bgp_peer_id_list option;
      [@ocaml.doc
        "The BGP peers that were placed in the DOWN state during the virtual interface failover \
         test.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface that was tested.\n"]
  test_id : test_id option; [@ocaml.doc "The ID of the virtual interface failover test.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_mac_sec_key_response = {
  mac_sec_keys : mac_sec_key_list option;
      [@ocaml.doc
        "The MAC Security (MACsec) security keys no longer associated with the connection.\n"]
  connection_id : connection_id option;
      [@ocaml.doc
        "The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG \
         (dxlag-xxxx).\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_mac_sec_key_request = {
  secret_ar_n : secret_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.\n\n\
        \ You can use [DescribeConnections] to retrieve the ARN of the MAC Security (MACsec) \
         secret key.\n\
        \ "]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG \
         (dxlag-xxxx).\n\n\
        \ You can use [DescribeConnections], [DescribeInterconnects], or [DescribeLags] to \
         retrieve connection ID.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec disassociate_connection_from_lag_request = {
  lag_id : lag_id; [@ocaml.doc "The ID of the LAG.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_virtual_interfaces_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
  connection_id : connection_id option; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_response = {
  resource_tags : resource_tag_list option; [@ocaml.doc "Information about the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_request = {
  resource_arns : resource_arn_list;
      [@ocaml.doc "The Amazon Resource Names (ARNs) of the resources.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_router_configuration_response = {
  virtual_interface_name : virtual_interface_name option;
      [@ocaml.doc "Provides the details about a virtual interface's router.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID assigned to the virtual interface.\n"]
  router : router_type option; [@ocaml.doc "The details about the router.\n"]
  customer_router_config : router_config option; [@ocaml.doc "The customer router configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_router_configuration_request = {
  router_type_identifier : router_type_identifier option;
      [@ocaml.doc
        "Identifies the router by a combination of vendor, platform, and software version. For \
         example, [CiscoSystemsInc-2900SeriesRouters-IOS124].\n"]
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc "Provides the details about a virtual interface's router.\n"]

type nonrec location_name = string [@@ocaml.doc ""]

type nonrec available_port_speeds = port_speed list [@@ocaml.doc ""]

type nonrec available_mac_sec_port_speeds = port_speed list [@@ocaml.doc ""]

type nonrec location = {
  available_mac_sec_port_speeds : available_mac_sec_port_speeds option;
      [@ocaml.doc "The available MAC Security (MACsec) port speeds for the location.\n"]
  available_providers : provider_list option;
      [@ocaml.doc "The name of the service provider for the location.\n"]
  available_port_speeds : available_port_speeds option;
      [@ocaml.doc "The available port speeds for the location.\n"]
  region : region option; [@ocaml.doc "The Amazon Web Services Region for the location.\n"]
  location_name : location_name option;
      [@ocaml.doc
        "The name of the location. This includes the name of the colocation partner and the \
         physical site of the building.\n"]
  location_code : location_code option; [@ocaml.doc "The code for the location.\n"]
}
[@@ocaml.doc "Information about an Direct Connect location.\n"]

type nonrec location_list = location list [@@ocaml.doc ""]

type nonrec locations = { locations : location_list option [@ocaml.doc "The locations.\n"] }
[@@ocaml.doc ""]

type nonrec loa_content = bytes [@@ocaml.doc ""]

type nonrec loa_content_type = PDF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec loa = {
  loa_content_type : loa_content_type option;
      [@ocaml.doc
        "The standard media type for the LOA-CFA document. The only supported value is \
         application/pdf.\n"]
  loa_content : loa_content option; [@ocaml.doc "The binary contents of the LOA-CFA document.\n"]
}
[@@ocaml.doc
  "Information about a Letter of Authorization - Connecting Facility Assignment (LOA-CFA) for a \
   connection.\n"]

type nonrec describe_loa_request = {
  loa_content_type : loa_content_type option;
      [@ocaml.doc
        "The standard media type for the LOA-CFA document. The only supported value is \
         application/pdf.\n"]
  provider_name : provider_name option;
      [@ocaml.doc
        "The name of the service provider who establishes connectivity on your behalf. If you \
         specify this parameter, the LOA-CFA lists the provider name alongside your company name \
         as the requester of the cross connect.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of a connection, LAG, or interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec lag_list = lag list [@@ocaml.doc ""]

type nonrec lags = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  lags : lag_list option; [@ocaml.doc "The LAGs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_lags_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
}
[@@ocaml.doc ""]

type nonrec interconnect_id = string [@@ocaml.doc ""]

type nonrec interconnect_name = string [@@ocaml.doc ""]

type nonrec interconnect_state =
  | Unknown [@ocaml.doc ""]
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Down [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Requested [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec interconnect = {
  mac_sec_keys : mac_sec_key_list option; [@ocaml.doc "The MAC Security (MACsec) security keys.\n"]
  encryption_mode : encryption_mode option;
      [@ocaml.doc
        "The MAC Security (MACsec) encryption mode.\n\n\
        \ The valid values are [no_encrypt], [should_encrypt], and [must_encrypt].\n\
        \ "]
  port_encryption_status : port_encryption_status option;
      [@ocaml.doc
        "The MAC Security (MACsec) port link status.\n\n\
        \ The valid values are [Encryption Up], which means that there is an active Connection Key \
         Name, or [Encryption Down].\n\
        \ "]
  mac_sec_capable : mac_sec_capable option;
      [@ocaml.doc "Indicates whether the interconnect supports MAC Security (MACsec).\n"]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the interconnect.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the interconnect.\n"]
  has_logical_redundancy : has_logical_redundancy option;
      [@ocaml.doc
        "Indicates whether the interconnect supports a secondary BGP in the same address family \
         (IPv4/IPv6).\n"]
  aws_logical_device_id : aws_logical_device_id option;
      [@ocaml.doc
        "The Direct Connect endpoint that terminates the logical connection. This device might be \
         different than the device that terminates the physical connection.\n"]
  aws_device_v2 : aws_device_v2 option;
      [@ocaml.doc "The Direct Connect endpoint that terminates the physical connection.\n"]
  jumbo_frame_capable : jumbo_frame_capable option;
      [@ocaml.doc "Indicates whether jumbo frames are supported.\n"]
  aws_device : aws_device option;
      [@ocaml.doc "The Direct Connect endpoint on which the physical connection terminates.\n"]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
  loa_issue_time : loa_issue_time option;
      [@ocaml.doc "The time of the most recent call to [DescribeLoa] for this connection.\n"]
  bandwidth : bandwidth option; [@ocaml.doc "The bandwidth of the connection.\n"]
  location : location_code option; [@ocaml.doc "The location of the connection.\n"]
  region : region option;
      [@ocaml.doc "The Amazon Web Services Region where the connection is located.\n"]
  interconnect_state : interconnect_state option;
      [@ocaml.doc
        "The state of the interconnect. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [requested]: The initial state of an interconnect. The interconnect stays in \
         the requested state until the Letter of Authorization (LOA) is sent to the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The interconnect is approved, and is being initialized.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The network link is up, and the interconnect is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The network link is down.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The interconnect is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The interconnect is deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the interconnect is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  interconnect_name : interconnect_name option; [@ocaml.doc "The name of the interconnect.\n"]
  interconnect_id : interconnect_id option; [@ocaml.doc "The ID of the interconnect.\n"]
}
[@@ocaml.doc "Information about an interconnect.\n"]

type nonrec interconnect_list = interconnect list [@@ocaml.doc ""]

type nonrec interconnects = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  interconnects : interconnect_list option; [@ocaml.doc "The interconnects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_interconnects_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  interconnect_id : interconnect_id option; [@ocaml.doc "The ID of the interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_interconnect_loa_response = {
  loa : loa option;
      [@ocaml.doc "The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_interconnect_loa_request = {
  loa_content_type : loa_content_type option;
      [@ocaml.doc
        "The standard media type for the LOA-CFA document. The only supported value is \
         application/pdf.\n"]
  provider_name : provider_name option;
      [@ocaml.doc
        "The name of the service provider who establishes connectivity on your behalf. If you \
         supply this parameter, the LOA-CFA lists the provider name alongside your company name as \
         the requester of the cross connect.\n"]
  interconnect_id : interconnect_id; [@ocaml.doc "The ID of the interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec connections = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  connections : connection_list option; [@ocaml.doc "The connections.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_hosted_connections_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  connection_id : connection_id; [@ocaml.doc "The ID of the interconnect or LAG.\n"]
}
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_list = direct_connect_gateway list [@@ocaml.doc ""]

type nonrec describe_direct_connect_gateways_result = {
  next_token : pagination_token option; [@ocaml.doc "The token to retrieve the next page.\n"]
  direct_connect_gateways : direct_connect_gateway_list option;
      [@ocaml.doc "The Direct Connect gateways.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateways_request = {
  next_token : pagination_token option;
      [@ocaml.doc "The token provided in the previous call to retrieve the next page.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_attachment_state =
  | Detached [@ocaml.doc ""]
  | Detaching [@ocaml.doc ""]
  | Attached [@ocaml.doc ""]
  | Attaching [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_attachment_type =
  | PrivateVirtualInterface [@ocaml.doc ""]
  | TransitVirtualInterface [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_attachment = {
  state_change_error : state_change_error option;
      [@ocaml.doc "The error message if the state of an object failed to advance.\n"]
  attachment_type : direct_connect_gateway_attachment_type option;
      [@ocaml.doc "The type of attachment.\n"]
  attachment_state : direct_connect_gateway_attachment_state option;
      [@ocaml.doc
        "The state of the attachment. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [attaching]: The initial state after a virtual interface is created using the \
         Direct Connect gateway.\n\
        \           \n\
        \            }\n\
        \       {-   [attached]: The Direct Connect gateway and virtual interface are attached and \
         ready to pass traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [detaching]: The initial state after calling [DeleteVirtualInterface].\n\
        \           \n\
        \            }\n\
        \       {-   [detached]: The virtual interface is detached from the Direct Connect \
         gateway. Traffic flow between the Direct Connect gateway and virtual interface is stopped.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  virtual_interface_owner_account : owner_account option;
      [@ocaml.doc "The ID of the Amazon Web Services account that owns the virtual interface.\n"]
  virtual_interface_region : virtual_interface_region option;
      [@ocaml.doc "The Amazon Web Services Region where the virtual interface is located.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc
  "Information about an attachment between a Direct Connect gateway and a virtual interface.\n"]

type nonrec direct_connect_gateway_attachment_list = direct_connect_gateway_attachment list
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_attachments_result = {
  next_token : pagination_token option; [@ocaml.doc "The token to retrieve the next page.\n"]
  direct_connect_gateway_attachments : direct_connect_gateway_attachment_list option;
      [@ocaml.doc "The attachments.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_attachments_request = {
  next_token : pagination_token option;
      [@ocaml.doc "The token provided in the previous call to retrieve the next page.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_association_list = direct_connect_gateway_association list
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_associations_result = {
  next_token : pagination_token option; [@ocaml.doc "The token to retrieve the next page.\n"]
  direct_connect_gateway_associations : direct_connect_gateway_association_list option;
      [@ocaml.doc "Information about the associations.\n"]
}
[@@ocaml.doc ""]

type nonrec associated_gateway_id = string [@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_associations_request = {
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway or transit gateway.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The token provided in the previous call to retrieve the next page.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  associated_gateway_id : associated_gateway_id option;
      [@ocaml.doc "The ID of the associated gateway.\n"]
  association_id : direct_connect_gateway_association_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway association.\n"]
}
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_association_proposal_id = string [@@ocaml.doc ""]

type nonrec direct_connect_gateway_association_proposal_state =
  | Deleted [@ocaml.doc ""]
  | Accepted [@ocaml.doc ""]
  | Requested [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec direct_connect_gateway_association_proposal = {
  requested_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to advertise to the Direct Connect gateway.\n"]
  existing_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The existing Amazon VPC prefixes advertised to the Direct Connect gateway.\n"]
  associated_gateway : associated_gateway option;
      [@ocaml.doc "Information about the associated gateway.\n"]
  proposal_state : direct_connect_gateway_association_proposal_state option;
      [@ocaml.doc
        "The state of the proposal. The following are possible values:\n\n\
        \ {ul\n\
        \       {-   [accepted]: The proposal has been accepted. The Direct Connect gateway \
         association is available to use in this state.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The proposal has been deleted by the owner that made the proposal. \
         The Direct Connect gateway association cannot be used in this state.\n\
        \           \n\
        \            }\n\
        \       {-   [requested]: The proposal has been requested. The Direct Connect gateway \
         association cannot be used in this state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  direct_connect_gateway_owner_account : owner_account option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the Direct Connect gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  proposal_id : direct_connect_gateway_association_proposal_id option;
      [@ocaml.doc "The ID of the association proposal.\n"]
}
[@@ocaml.doc
  "Information about the proposal request to attach a virtual private gateway to a Direct Connect \
   gateway. \n"]

type nonrec direct_connect_gateway_association_proposal_list =
  direct_connect_gateway_association_proposal list
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_association_proposals_result = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
  direct_connect_gateway_association_proposals :
    direct_connect_gateway_association_proposal_list option;
      [@ocaml.doc "Describes the Direct Connect gateway association proposals.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_direct_connect_gateway_association_proposals_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  associated_gateway_id : associated_gateway_id option;
      [@ocaml.doc "The ID of the associated gateway.\n"]
  proposal_id : direct_connect_gateway_association_proposal_id option;
      [@ocaml.doc "The ID of the proposal.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_name = string [@@ocaml.doc ""]

type nonrec customer_agreement = {
  status : status option;
      [@ocaml.doc
        "The status of the customer agreement. This will be either [signed] or [unsigned] \n"]
  agreement_name : agreement_name option; [@ocaml.doc "The name of the agreement.\n"]
}
[@@ocaml.doc "The name and status of a customer agreement. \n"]

type nonrec agreement_list = customer_agreement list [@@ocaml.doc ""]

type nonrec nni_partner_type =
  | NonPartner [@ocaml.doc ""]
  | V2 [@ocaml.doc ""]
  | V1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_customer_metadata_response = {
  nni_partner_type : nni_partner_type option;
      [@ocaml.doc
        "The type of network-to-network interface (NNI) partner. The partner type will be one of \
         the following:\n\n\
        \ {ul\n\
        \       {-  V1: This partner can only allocate 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, \
         or 500Mbps subgigabit connections.\n\
        \           \n\
        \            }\n\
        \       {-  V2: This partner can only allocate 1GB, 2GB, 5GB, or 10GB hosted connections.\n\
        \           \n\
        \            }\n\
        \       {-  nonPartner: The customer is not a partner.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  agreements : agreement_list option; [@ocaml.doc "The list of customer agreements.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connections_on_interconnect_request = {
  interconnect_id : interconnect_id; [@ocaml.doc "The ID of the interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connections_request = {
  next_token : pagination_token option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_result_set_size option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n\n\
        \ If [MaxResults] is given a value larger than 100, only 100 results are returned.\n\
        \ "]
  connection_id : connection_id option; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_loa_response = {
  loa : loa option;
      [@ocaml.doc "The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_loa_request = {
  loa_content_type : loa_content_type option;
      [@ocaml.doc
        "The standard media type for the LOA-CFA document. The only supported value is \
         application/pdf.\n"]
  provider_name : provider_name option;
      [@ocaml.doc
        "The name of the APN partner or service provider who establishes connectivity on your \
         behalf. If you specify this parameter, the LOA-CFA lists the provider name alongside your \
         company name as the requester of the cross connect.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_virtual_interface_response = {
  virtual_interface_state : virtual_interface_state option;
      [@ocaml.doc
        "The state of the virtual interface. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [confirming]: The creation of the virtual interface is pending confirmation \
         from the virtual interface owner. If the owner of the virtual interface is different from \
         the owner of the connection on which it is provisioned, then the virtual interface will \
         remain in this state until it is confirmed by the virtual interface owner.\n\
        \           \n\
        \            }\n\
        \       {-   [verifying]: This state only applies to public virtual interfaces. Each \
         public virtual interface needs validation before the virtual interface can be created.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: A virtual interface is in this state from the time that it is \
         created until the virtual interface is ready to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: A virtual interface that is able to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: A virtual interface that is BGP down.\n\
        \           \n\
        \            }\n\
        \       {-   [testing]: A virtual interface is in this state immediately after calling \
         [StartBgpFailoverTest] and remains in this state during the duration of the test.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: A virtual interface is in this state immediately after calling \
         [DeleteVirtualInterface] until it can no longer forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: A virtual interface that cannot forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: The virtual interface owner has declined creation of the virtual \
         interface. If a virtual interface in the [Confirming] state is deleted by the virtual \
         interface owner, the virtual interface enters the [Rejected] state.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the virtual interface is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_virtual_interface_request = {
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lag_request = { lag_id : lag_id [@ocaml.doc "The ID of the LAG.\n"] }
[@@ocaml.doc ""]

type nonrec delete_interconnect_response = {
  interconnect_state : interconnect_state option;
      [@ocaml.doc
        "The state of the interconnect. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [requested]: The initial state of an interconnect. The interconnect stays in \
         the requested state until the Letter of Authorization (LOA) is sent to the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The interconnect is approved, and is being initialized.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The network link is up, and the interconnect is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The network link is down.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The interconnect is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The interconnect is deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the interconnect is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_interconnect_request = {
  interconnect_id : interconnect_id; [@ocaml.doc "The ID of the interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_association_proposal_result = {
  direct_connect_gateway_association_proposal : direct_connect_gateway_association_proposal option;
      [@ocaml.doc "The ID of the associated gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_association_proposal_request = {
  proposal_id : direct_connect_gateway_association_proposal_id;
      [@ocaml.doc "The ID of the proposal.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_association_result = {
  direct_connect_gateway_association : direct_connect_gateway_association option;
      [@ocaml.doc "Information about the deleted association.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_association_request = {
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  association_id : direct_connect_gateway_association_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway association.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_result = {
  direct_connect_gateway : direct_connect_gateway option;
      [@ocaml.doc "The Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_direct_connect_gateway_request = {
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_request = {
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bgp_peer_response = {
  virtual_interface : virtual_interface option; [@ocaml.doc "The virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bgp_peer_request = {
  bgp_peer_id : bgp_peer_id option; [@ocaml.doc "The ID of the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for the BGP peer to be deleted from a Direct Connect virtual interface. The \
         valid range is from 1 to 4294967294 for BGP configuration. \n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The rate limiter limit has been exceeded for the connection. You cannot add more rate limiters \
   to virtual interfaces on this connection.\n"]

type nonrec create_transit_virtual_interface_result = {
  virtual_interface : virtual_interface option;
      [@ocaml.doc "Information about a virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec new_transit_virtual_interface = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  enable_site_link : enable_site_link option;
      [@ocaml.doc "Indicates whether to enable or disable SiteLink.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags associated with the transitive virtual interface.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for a new transit virtual interface.The valid range is from 1 to 4294967294 \
         for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vlan : vla_n option; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name option;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a transit virtual interface.\n"]

type nonrec create_transit_virtual_interface_request = {
  new_transit_virtual_interface : new_transit_virtual_interface;
      [@ocaml.doc "Information about the transit virtual interface.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec new_public_virtual_interface = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the public virtual interface.\n"]
  route_filter_prefixes : route_filter_prefix_list option;
      [@ocaml.doc
        "The routes to be advertised to the Amazon Web Services network in this Region. Applies to \
         public virtual interfaces.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for a new public virtual interface. The valid range is from 1 to 4294967294 \
         for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vlan : vla_n; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a public virtual interface.\n"]

type nonrec create_public_virtual_interface_request = {
  new_public_virtual_interface : new_public_virtual_interface;
      [@ocaml.doc "Information about the public virtual interface.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec new_private_virtual_interface = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  enable_site_link : enable_site_link option;
      [@ocaml.doc "Indicates whether to enable or disable SiteLink.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the private virtual interface.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The long ASN for a new private virtual interface. The valid range is from 1 to 4294967294 \
         for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The valid values are 1-2147483646.\n\
        \   "]
  vlan : vla_n; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a private virtual interface.\n"]

type nonrec create_private_virtual_interface_request = {
  new_private_virtual_interface : new_private_virtual_interface;
      [@ocaml.doc "Information about the private virtual interface.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec create_lag_request = {
  request_mac_sec : request_mac_sec option;
      [@ocaml.doc
        "Indicates whether the connection will support MAC Security (MACsec).\n\n\
        \  All connections in the LAG must be capable of supporting MAC Security (MACsec). For \
         information about MAC Security (MACsec) prerequisties, see \
         {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-prerequisites}MACsec \
         prerequisties} in the {i Direct Connect User Guide}.\n\
        \  \n\
        \   "]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the LAG.\n"]
  child_connection_tags : tag_list option;
      [@ocaml.doc "The tags to associate with the automtically created LAGs.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to associate with the LAG.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The ID of an existing dedicated connection to migrate to the LAG.\n"]
  lag_name : lag_name; [@ocaml.doc "The name of the LAG.\n"]
  connections_bandwidth : bandwidth;
      [@ocaml.doc
        "The bandwidth of the individual physical dedicated connections bundled by the LAG. The \
         possible values are 1Gbps,10Gbps, 100Gbps, and 400Gbps. \n"]
  location : location_code; [@ocaml.doc "The location for the LAG.\n"]
  number_of_connections : count;
      [@ocaml.doc
        "The number of physical dedicated connections initially provisioned and bundled by the \
         LAG. You can have a maximum of four connections when the port speed is 1Gbps or 10Gbps, \
         or two when the port speed is 100Gbps or 400Gbps.\n"]
}
[@@ocaml.doc ""]

type nonrec create_interconnect_request = {
  request_mac_sec : request_mac_sec option;
      [@ocaml.doc "Indicates whether you want the interconnect to support MAC Security (MACsec).\n"]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the interconnect.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to associate with the interconnect.\n"]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
  location : location_code; [@ocaml.doc "The location of the interconnect.\n"]
  bandwidth : bandwidth;
      [@ocaml.doc "The port bandwidth, in Gbps. The possible values are 1, 10, and 100.\n"]
  interconnect_name : interconnect_name; [@ocaml.doc "The name of the interconnect.\n"]
}
[@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_association_proposal_result = {
  direct_connect_gateway_association_proposal : direct_connect_gateway_association_proposal option;
      [@ocaml.doc "Information about the Direct Connect gateway proposal.\n"]
}
[@@ocaml.doc ""]

type nonrec gateway_id_to_associate = string [@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_association_proposal_request = {
  remove_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.\n"]
  add_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc "The Amazon VPC prefixes to advertise to the Direct Connect gateway.\n"]
  gateway_id : gateway_id_to_associate;
      [@ocaml.doc "The ID of the virtual private gateway or transit gateway.\n"]
  direct_connect_gateway_owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the Direct Connect gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_association_result = {
  direct_connect_gateway_association : direct_connect_gateway_association option;
      [@ocaml.doc "The association to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_association_request = {
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway.\n"]
  add_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc
        "The Amazon VPC prefixes to advertise to the Direct Connect gateway\n\n\
        \ This parameter is required when you create an association to a transit gateway.\n\
        \ \n\
        \  For information about how to set the prefixes, see \
         {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes}Allowed \
         Prefixes} in the {i Direct Connect User Guide}.\n\
        \  "]
  gateway_id : gateway_id_to_associate option;
      [@ocaml.doc "The ID of the virtual private gateway or transit gateway.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_result = {
  direct_connect_gateway : direct_connect_gateway option;
      [@ocaml.doc "The Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec create_direct_connect_gateway_request = {
  amazon_side_asn : long_asn option;
      [@ocaml.doc
        "The autonomous system number (ASN) for Border Gateway Protocol (BGP) to be configured on \
         the Amazon side of the connection. The ASN must be in the private range of 64,512 to \
         65,534 or 4,200,000,000 to 4,294,967,294. The default is 64512.\n"]
  tags : tag_list option; [@ocaml.doc "The key-value pair tags associated with the request.\n"]
  direct_connect_gateway_name : direct_connect_gateway_name;
      [@ocaml.doc "The name of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_request = {
  request_mac_sec : request_mac_sec option;
      [@ocaml.doc
        "Indicates whether you want the connection to support MAC Security (MACsec).\n\n\
        \ MAC Security (MACsec) is unavailable on hosted connections. For information about MAC \
         Security (MACsec) prerequisites, see \
         {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/MACSec.html}MAC Security in \
         Direct Connect} in the {i Direct Connect User Guide}.\n\
        \ "]
  provider_name : provider_name option;
      [@ocaml.doc "The name of the service provider associated with the requested connection.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to associate with the lag.\n"]
  lag_id : lag_id option; [@ocaml.doc "The ID of the LAG.\n"]
  connection_name : connection_name; [@ocaml.doc "The name of the connection.\n"]
  bandwidth : bandwidth; [@ocaml.doc "The bandwidth of the connection.\n"]
  location : location_code; [@ocaml.doc "The location of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec create_bgp_peer_response = {
  virtual_interface : virtual_interface option; [@ocaml.doc "The virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec new_bgp_peer = {
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  asn_long : long_asn option;
      [@ocaml.doc "The long ASN for a new BGP peer. The valid range is from 1 to 4294967294.\n"]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n"]
}
[@@ocaml.doc "Information about a new BGP peer.\n"]

type nonrec create_bgp_peer_request = {
  new_bgp_peer : new_bgp_peer option; [@ocaml.doc "Information about the BGP peer.\n"]
  virtual_interface_id : virtual_interface_id option;
      [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec confirm_transit_virtual_interface_response = {
  virtual_interface_state : virtual_interface_state option;
      [@ocaml.doc
        "The state of the virtual interface. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [confirming]: The creation of the virtual interface is pending confirmation \
         from the virtual interface owner. If the owner of the virtual interface is different from \
         the owner of the connection on which it is provisioned, then the virtual interface will \
         remain in this state until it is confirmed by the virtual interface owner.\n\
        \           \n\
        \            }\n\
        \       {-   [verifying]: This state only applies to public virtual interfaces. Each \
         public virtual interface needs validation before the virtual interface can be created.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: A virtual interface is in this state from the time that it is \
         created until the virtual interface is ready to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: A virtual interface that is able to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: A virtual interface that is BGP down.\n\
        \           \n\
        \            }\n\
        \       {-   [testing]: A virtual interface is in this state immediately after calling \
         [StartBgpFailoverTest] and remains in this state during the duration of the test.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: A virtual interface is in this state immediately after calling \
         [DeleteVirtualInterface] until it can no longer forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: A virtual interface that cannot forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: The virtual interface owner has declined creation of the virtual \
         interface. If a virtual interface in the [Confirming] state is deleted by the virtual \
         interface owner, the virtual interface enters the [Rejected] state.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the virtual interface is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec confirm_transit_virtual_interface_request = {
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec confirm_public_virtual_interface_response = {
  virtual_interface_state : virtual_interface_state option;
      [@ocaml.doc
        "The state of the virtual interface. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [confirming]: The creation of the virtual interface is pending confirmation \
         from the virtual interface owner. If the owner of the virtual interface is different from \
         the owner of the connection on which it is provisioned, then the virtual interface will \
         remain in this state until it is confirmed by the virtual interface owner.\n\
        \           \n\
        \            }\n\
        \       {-   [verifying]: This state only applies to public virtual interfaces. Each \
         public virtual interface needs validation before the virtual interface can be created.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: A virtual interface is in this state from the time that it is \
         created until the virtual interface is ready to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: A virtual interface that is able to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: A virtual interface that is BGP down.\n\
        \           \n\
        \            }\n\
        \       {-   [testing]: A virtual interface is in this state immediately after calling \
         [StartBgpFailoverTest] and remains in this state during the duration of the test.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: A virtual interface is in this state immediately after calling \
         [DeleteVirtualInterface] until it can no longer forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: A virtual interface that cannot forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: The virtual interface owner has declined creation of the virtual \
         interface. If a virtual interface in the [Confirming] state is deleted by the virtual \
         interface owner, the virtual interface enters the [Rejected] state.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the virtual interface is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec confirm_public_virtual_interface_request = {
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec confirm_private_virtual_interface_response = {
  virtual_interface_state : virtual_interface_state option;
      [@ocaml.doc
        "The state of the virtual interface. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [confirming]: The creation of the virtual interface is pending confirmation \
         from the virtual interface owner. If the owner of the virtual interface is different from \
         the owner of the connection on which it is provisioned, then the virtual interface will \
         remain in this state until it is confirmed by the virtual interface owner.\n\
        \           \n\
        \            }\n\
        \       {-   [verifying]: This state only applies to public virtual interfaces. Each \
         public virtual interface needs validation before the virtual interface can be created.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: A virtual interface is in this state from the time that it is \
         created until the virtual interface is ready to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: A virtual interface that is able to forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: A virtual interface that is BGP down.\n\
        \           \n\
        \            }\n\
        \       {-   [testing]: A virtual interface is in this state immediately after calling \
         [StartBgpFailoverTest] and remains in this state during the duration of the test.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: A virtual interface is in this state immediately after calling \
         [DeleteVirtualInterface] until it can no longer forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: A virtual interface that cannot forward traffic.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: The virtual interface owner has declined creation of the virtual \
         interface. If a virtual interface in the [Confirming] state is deleted by the virtual \
         interface owner, the virtual interface enters the [Rejected] state.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the virtual interface is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec confirm_private_virtual_interface_request = {
  direct_connect_gateway_id : direct_connect_gateway_id option;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
  virtual_gateway_id : virtual_gateway_id option;
      [@ocaml.doc "The ID of the virtual private gateway.\n"]
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec confirm_customer_agreement_response = {
  status : status option;
      [@ocaml.doc
        " The status of the customer agreement when the connection was created. This will be \
         either [signed] or [unsigned]. \n"]
}
[@@ocaml.doc ""]

type nonrec confirm_customer_agreement_request = {
  agreement_name : agreement_name option; [@ocaml.doc " The name of the customer agreement. \n"]
}
[@@ocaml.doc ""]

type nonrec confirm_connection_response = {
  connection_state : connection_state option;
      [@ocaml.doc
        "The state of the connection. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [ordering]: The initial state of a hosted connection provisioned on an \
         interconnect. The connection stays in the ordering state until the owner of the hosted \
         connection confirms or declines the connection order.\n\
        \           \n\
        \            }\n\
        \       {-   [requested]: The initial state of a standard connection. The connection stays \
         in the requested state until the Letter of Authorization (LOA) is sent to the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [pending]: The connection has been approved and is being initialized.\n\
        \           \n\
        \            }\n\
        \       {-   [available]: The network link is up and the connection is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [down]: The network link is down.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The connection is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [deleted]: The connection has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [rejected]: A hosted connection in the [ordering] state enters the [rejected] \
         state if it is deleted by the customer.\n\
        \           \n\
        \            }\n\
        \       {-   [unknown]: The state of the connection is not available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec confirm_connection_request = {
  connection_id : connection_id; [@ocaml.doc "The ID of the hosted connection.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_virtual_interface_request = {
  connection_id : connection_id; [@ocaml.doc "The ID of the LAG or connection.\n"]
  virtual_interface_id : virtual_interface_id; [@ocaml.doc "The ID of the virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_mac_sec_key_response = {
  mac_sec_keys : mac_sec_key_list option;
      [@ocaml.doc "The MAC Security (MACsec) security keys associated with the connection.\n"]
  connection_id : connection_id option;
      [@ocaml.doc
        "The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG \
         (dxlag-xxxx).\n"]
}
[@@ocaml.doc ""]

type nonrec cak = string [@@ocaml.doc ""]

type nonrec associate_mac_sec_key_request = {
  cak : cak option;
      [@ocaml.doc
        "The MAC Security (MACsec) CAK to associate with the connection.\n\n\
        \ You can create the CKN/CAK pair using an industry standard tool.\n\
        \ \n\
        \   The valid values are 64 hexadecimal characters (0-9, A-E).\n\
        \  \n\
        \   If you use this request parameter, you must use the [ckn] request parameter and not \
         use the [secretARN] request parameter.\n\
        \   "]
  ckn : ckn option;
      [@ocaml.doc
        "The MAC Security (MACsec) CKN to associate with the connection.\n\n\
        \ You can create the CKN/CAK pair using an industry standard tool.\n\
        \ \n\
        \   The valid values are 64 hexadecimal characters (0-9, A-E).\n\
        \  \n\
        \   If you use this request parameter, you must use the [cak] request parameter and not \
         use the [secretARN] request parameter.\n\
        \   "]
  secret_ar_n : secret_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key to associate with \
         the connection.\n\n\
        \ You can use [DescribeConnections] or [DescribeLags] to retrieve the MAC Security \
         (MACsec) secret key.\n\
        \ \n\
        \  If you use this request parameter, you do not use the [ckn] and [cak] request parameters.\n\
        \  "]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG \
         (dxlag-xxxx).\n\n\
        \ You can use [DescribeConnections], [DescribeInterconnects], or [DescribeLags] to \
         retrieve connection ID.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec associate_hosted_connection_request = {
  parent_connection_id : connection_id; [@ocaml.doc "The ID of the interconnect or the LAG.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the hosted connection.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_connection_with_lag_request = {
  lag_id : lag_id; [@ocaml.doc "The ID of the LAG with which to associate the connection.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the connection.\n"]
}
[@@ocaml.doc ""]

type nonrec allocate_transit_virtual_interface_result = {
  virtual_interface : virtual_interface option;
      [@ocaml.doc "Information about the transit virtual interface.\n"]
}
[@@ocaml.doc ""]

type nonrec new_transit_virtual_interface_allocation = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags associated with the transitive virtual interface.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500 \n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The ASN when allocating a new transit virtual interface. The valid range is from 1 to \
         4294967294 for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The valid values are 1-2147483646.\n\
        \   "]
  vlan : vla_n option; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name option;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a transit virtual interface to be provisioned on a connection.\n"]

type nonrec allocate_transit_virtual_interface_request = {
  new_transit_virtual_interface_allocation : new_transit_virtual_interface_allocation;
      [@ocaml.doc "Information about the transit virtual interface.\n"]
  owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the transit virtual interface.\n"]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the connection on which the transit virtual interface is provisioned.\n"]
}
[@@ocaml.doc ""]

type nonrec new_public_virtual_interface_allocation = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the public virtual interface.\n"]
  route_filter_prefixes : route_filter_prefix_list option;
      [@ocaml.doc
        "The routes to be advertised to the Amazon Web Services network in this Region. Applies to \
         public virtual interfaces.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The ASN when allocating a new public virtual interface. The valid range is from 1 to \
         4294967294 for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The valid values are 1-2147483646.\n\
        \   "]
  vlan : vla_n; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a public virtual interface to be provisioned on a connection.\n"]

type nonrec allocate_public_virtual_interface_request = {
  new_public_virtual_interface_allocation : new_public_virtual_interface_allocation;
      [@ocaml.doc "Information about the public virtual interface.\n"]
  owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the public virtual interface.\n"]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the connection on which the public virtual interface is provisioned.\n"]
}
[@@ocaml.doc ""]

type nonrec new_private_virtual_interface_allocation = {
  rate_limit : rate_limit option;
      [@ocaml.doc
        "The rate limit (bandwidth allocation) to apply to the virtual interface. The rate limit \
         restricts the maximum bandwidth that the virtual interface can use on the parent \
         connection.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the private virtual interface.\n"]
  customer_address : customer_address option;
      [@ocaml.doc "The IP address assigned to the customer interface.\n"]
  address_family : address_family option; [@ocaml.doc "The address family for the BGP peer.\n"]
  amazon_address : amazon_address option;
      [@ocaml.doc "The IP address assigned to the Amazon interface.\n"]
  auth_key : bgp_auth_key option;
      [@ocaml.doc
        "The authentication key for BGP configuration. This string has a minimum length of 6 \
         characters and and a maximun lenth of 80 characters.\n"]
  mtu : mt_u option;
      [@ocaml.doc
        "The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. \
         The default value is 1500.\n"]
  asn_long : long_asn option;
      [@ocaml.doc
        "The ASN when allocating a new private virtual interface. The valid range is from 1 to \
         4294967294 for BGP configuration.\n\n\
        \ Note the following limitations when using [asnLong]:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \            \n\
        \             }\n\
        \        {-   [asnLong] accepts any valid ASN value, regardless if it's 2-byte or 4-byte. \n\
        \            \n\
        \             }\n\
        \        {-  When using a 4-byte [asnLong], the API response returns [0] for the legacy \
         [asn] attribute since 4-byte ASN values exceed the maximum supported value of \
         2,147,483,647.\n\
        \            \n\
        \             }\n\
        \        {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \            \n\
        \             }\n\
        \        {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  asn : as_n option;
      [@ocaml.doc
        "The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border \
         Gateway Protocol (BGP) configuration. If you provide a number greater than the maximum, \
         an error is returned. Use [asnLong] instead.\n\n\
        \ {ul\n\
        \       {-  You can use [asnLong] or [asn], but not both. We recommend using [asnLong] as \
         it supports a greater pool of numbers. \n\
        \           \n\
        \            }\n\
        \       {-  If you provide a value in the same API call for both [asn] and [asnLong], the \
         API will only accept the value for [asnLong]. \n\
        \           \n\
        \            }\n\
        \       {-  If you enter a 4-byte ASN for the [asn] parameter, the API returns an error. \n\
        \           \n\
        \            }\n\
        \       {-  If you are using a 2-byte ASN, the API response will include the 2-byte value \
         for both the [asn] and [asnLong] fields.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The valid values are 1-2147483646.\n\
        \   "]
  vlan : vla_n; [@ocaml.doc "The ID of the VLAN.\n"]
  virtual_interface_name : virtual_interface_name;
      [@ocaml.doc
        "The name of the virtual interface assigned by the customer network. The name has a \
         maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).\n"]
}
[@@ocaml.doc "Information about a private virtual interface to be provisioned on a connection.\n"]

type nonrec allocate_private_virtual_interface_request = {
  new_private_virtual_interface_allocation : new_private_virtual_interface_allocation;
      [@ocaml.doc "Information about the private virtual interface.\n"]
  owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the virtual private interface.\n"]
  connection_id : connection_id;
      [@ocaml.doc
        "The ID of the connection on which the private virtual interface is provisioned.\n"]
}
[@@ocaml.doc ""]

type nonrec allocate_hosted_connection_request = {
  tags : tag_list option; [@ocaml.doc "The tags associated with the connection.\n"]
  vlan : vla_n; [@ocaml.doc "The dedicated VLAN provisioned to the hosted connection.\n"]
  connection_name : connection_name; [@ocaml.doc "The name of the hosted connection.\n"]
  bandwidth : bandwidth;
      [@ocaml.doc
        "The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, \
         300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps, and 25Gbps. Note that only those \
         Direct Connect Partners who have met specific requirements are allowed to create a 1Gbps, \
         2Gbps, 5Gbps, 10Gbps, or 25Gbps hosted connection. \n"]
  owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account ID of the customer for the connection.\n"]
  connection_id : connection_id; [@ocaml.doc "The ID of the interconnect or LAG.\n"]
}
[@@ocaml.doc ""]

type nonrec allocate_connection_on_interconnect_request = {
  vlan : vla_n; [@ocaml.doc "The dedicated VLAN provisioned to the connection.\n"]
  interconnect_id : interconnect_id;
      [@ocaml.doc "The ID of the interconnect on which the connection will be provisioned.\n"]
  owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account of the customer for whom the connection will be \
         provisioned.\n"]
  connection_name : connection_name; [@ocaml.doc "The name of the provisioned connection.\n"]
  bandwidth : bandwidth;
      [@ocaml.doc
        "The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, \
         300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note that only those Direct \
         Connect Partners who have met specific requirements are allowed to create a 1Gbps, 2Gbps, \
         5Gbps or 10Gbps hosted connection.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_direct_connect_gateway_association_proposal_result = {
  direct_connect_gateway_association : direct_connect_gateway_association option;
      [@ocaml.doc
        "Information about an association between a Direct Connect gateway and a virtual gateway \
         or transit gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_direct_connect_gateway_association_proposal_request = {
  override_allowed_prefixes_to_direct_connect_gateway : route_filter_prefix_list option;
      [@ocaml.doc
        "Overrides the Amazon VPC prefixes advertised to the Direct Connect gateway.\n\n\
        \ For information about how to set the prefixes, see \
         {{:https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes}Allowed \
         Prefixes} in the {i Direct Connect User Guide}.\n\
        \ "]
  associated_gateway_owner_account : owner_account;
      [@ocaml.doc
        "The ID of the Amazon Web Services account that owns the virtual private gateway or \
         transit gateway.\n"]
  proposal_id : direct_connect_gateway_association_proposal_id;
      [@ocaml.doc "The ID of the request proposal.\n"]
  direct_connect_gateway_id : direct_connect_gateway_id;
      [@ocaml.doc "The ID of the Direct Connect gateway.\n"]
}
[@@ocaml.doc ""]
