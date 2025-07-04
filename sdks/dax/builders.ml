open Smaws_Lib
open Types
let make_subnet
  ?subnet_availability_zone:(subnet_availability_zone_ : string option)
  ?subnet_identifier:(subnet_identifier_ : string option) () =
  ({
     subnet_availability_zone = subnet_availability_zone_;
     subnet_identifier = subnet_identifier_
   } : subnet)
let make_subnet_group ?subnets:(subnets_ : subnet list option)
  ?vpc_id:(vpc_id_ : string option)
  ?description:(description_ : string option)
  ?subnet_group_name:(subnet_group_name_ : string option) () =
  ({
     subnets = subnets_;
     vpc_id = vpc_id_;
     description = description_;
     subnet_group_name = subnet_group_name_
   } : subnet_group)
let make_update_subnet_group_response
  ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : update_subnet_group_response)
let make_update_subnet_group_request
  ?subnet_ids:(subnet_ids_ : string list option)
  ?description:(description_ : string option)
  ~subnet_group_name:(subnet_group_name_ : string) () =
  ({
     subnet_ids = subnet_ids_;
     description = description_;
     subnet_group_name = subnet_group_name_
   } : update_subnet_group_request)
let make_parameter_group ?description:(description_ : string option)
  ?parameter_group_name:(parameter_group_name_ : string option) () =
  ({ description = description_; parameter_group_name = parameter_group_name_
   } : parameter_group)
let make_update_parameter_group_response
  ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : update_parameter_group_response)
let make_parameter_name_value
  ?parameter_value:(parameter_value_ : string option)
  ?parameter_name:(parameter_name_ : string option) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : 
  parameter_name_value)
let make_update_parameter_group_request
  ~parameter_name_values:(parameter_name_values_ : parameter_name_value list)
  ~parameter_group_name:(parameter_group_name_ : string) () =
  ({
     parameter_name_values = parameter_name_values_;
     parameter_group_name = parameter_group_name_
   } : update_parameter_group_request)
let make_endpoint ?ur_l:(ur_l_ : string option) ?port:(port_ : int option)
  ?address:(address_ : string option) () =
  ({ ur_l = ur_l_; port = port_; address = address_ } : endpoint)
let make_node
  ?parameter_group_status:(parameter_group_status_ : string option)
  ?node_status:(node_status_ : string option)
  ?availability_zone:(availability_zone_ : string option)
  ?node_create_time:(node_create_time_ : CoreTypes.Timestamp.t option)
  ?endpoint:(endpoint_ : endpoint option) ?node_id:(node_id_ : string option)
  () =
  ({
     parameter_group_status = parameter_group_status_;
     node_status = node_status_;
     availability_zone = availability_zone_;
     node_create_time = node_create_time_;
     endpoint = endpoint_;
     node_id = node_id_
   } : node)
let make_notification_configuration
  ?topic_status:(topic_status_ : string option)
  ?topic_arn:(topic_arn_ : string option) () =
  ({ topic_status = topic_status_; topic_arn = topic_arn_ } : notification_configuration)
let make_security_group_membership ?status:(status_ : string option)
  ?security_group_identifier:(security_group_identifier_ : string option) ()
  =
  ({ status = status_; security_group_identifier = security_group_identifier_
   } : security_group_membership)
let make_parameter_group_status
  ?node_ids_to_reboot:(node_ids_to_reboot_ : string list option)
  ?parameter_apply_status:(parameter_apply_status_ : string option)
  ?parameter_group_name:(parameter_group_name_ : string option) () =
  ({
     node_ids_to_reboot = node_ids_to_reboot_;
     parameter_apply_status = parameter_apply_status_;
     parameter_group_name = parameter_group_name_
   } : parameter_group_status)
let make_sse_description ?status:(status_ : sse_status option) () =
  ({ status = status_ } : sse_description)
let make_cluster
  ?cluster_endpoint_encryption_type:(cluster_endpoint_encryption_type_ :
                                      cluster_endpoint_encryption_type option)
  ?sse_description:(sse_description_ : sse_description option)
  ?parameter_group:(parameter_group_ : parameter_group_status option)
  ?iam_role_arn:(iam_role_arn_ : string option)
  ?security_groups:(security_groups_ : security_group_membership list option)
  ?subnet_group:(subnet_group_ : string option)
  ?notification_configuration:(notification_configuration_ :
                                notification_configuration option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?nodes:(nodes_ : node list option)
  ?node_ids_to_remove:(node_ids_to_remove_ : string list option)
  ?cluster_discovery_endpoint:(cluster_discovery_endpoint_ : endpoint option)
  ?status:(status_ : string option) ?node_type:(node_type_ : string option)
  ?active_nodes:(active_nodes_ : int option)
  ?total_nodes:(total_nodes_ : int option)
  ?cluster_arn:(cluster_arn_ : string option)
  ?description:(description_ : string option)
  ?cluster_name:(cluster_name_ : string option) () =
  ({
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     sse_description = sse_description_;
     parameter_group = parameter_group_;
     iam_role_arn = iam_role_arn_;
     security_groups = security_groups_;
     subnet_group = subnet_group_;
     notification_configuration = notification_configuration_;
     preferred_maintenance_window = preferred_maintenance_window_;
     nodes = nodes_;
     node_ids_to_remove = node_ids_to_remove_;
     cluster_discovery_endpoint = cluster_discovery_endpoint_;
     status = status_;
     node_type = node_type_;
     active_nodes = active_nodes_;
     total_nodes = total_nodes_;
     cluster_arn = cluster_arn_;
     description = description_;
     cluster_name = cluster_name_
   } : cluster)
let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)
let make_update_cluster_request
  ?security_group_ids:(security_group_ids_ : string list option)
  ?parameter_group_name:(parameter_group_name_ : string option)
  ?notification_topic_status:(notification_topic_status_ : string option)
  ?notification_topic_arn:(notification_topic_arn_ : string option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?description:(description_ : string option)
  ~cluster_name:(cluster_name_ : string) () =
  ({
     security_group_ids = security_group_ids_;
     parameter_group_name = parameter_group_name_;
     notification_topic_status = notification_topic_status_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     description = description_;
     cluster_name = cluster_name_
   } : update_cluster_request)
let make_tag ?value:(value_ : string option) ?key:(key_ : string option) () =
  ({ value = value_; key = key_ } : tag)
let make_untag_resource_response ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : untag_resource_response)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list)
  ~resource_name:(resource_name_ : string) () =
  ({ tag_keys = tag_keys_; resource_name = resource_name_ } : untag_resource_request)
let make_tag_resource_response ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : tag_resource_response)
let make_tag_resource_request ~tags:(tags_ : tag list)
  ~resource_name:(resource_name_ : string) () =
  ({ tags = tags_; resource_name = resource_name_ } : tag_resource_request)
let make_sse_specification ~enabled:(enabled_ : bool) () =
  ({ enabled = enabled_ } : sse_specification)
let make_reboot_node_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : reboot_node_response)
let make_reboot_node_request ~node_id:(node_id_ : string)
  ~cluster_name:(cluster_name_ : string) () =
  ({ node_id = node_id_; cluster_name = cluster_name_ } : reboot_node_request)
let make_node_type_specific_value ?value:(value_ : string option)
  ?node_type:(node_type_ : string option) () =
  ({ value = value_; node_type = node_type_ } : node_type_specific_value)
let make_parameter ?change_type:(change_type_ : change_type option)
  ?is_modifiable:(is_modifiable_ : is_modifiable option)
  ?allowed_values:(allowed_values_ : string option)
  ?data_type:(data_type_ : string option) ?source:(source_ : string option)
  ?description:(description_ : string option)
  ?node_type_specific_values:(node_type_specific_values_ :
                               node_type_specific_value list option)
  ?parameter_value:(parameter_value_ : string option)
  ?parameter_type:(parameter_type_ : parameter_type option)
  ?parameter_name:(parameter_name_ : string option) () =
  ({
     change_type = change_type_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     source = source_;
     description = description_;
     node_type_specific_values = node_type_specific_values_;
     parameter_value = parameter_value_;
     parameter_type = parameter_type_;
     parameter_name = parameter_name_
   } : parameter)
let make_list_tags_response ?next_token:(next_token_ : string option)
  ?tags:(tags_ : tag list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_response)
let make_list_tags_request ?next_token:(next_token_ : string option)
  ~resource_name:(resource_name_ : string) () =
  ({ next_token = next_token_; resource_name = resource_name_ } : list_tags_request)
let make_increase_replication_factor_response
  ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : increase_replication_factor_response)
let make_increase_replication_factor_request
  ?availability_zones:(availability_zones_ : string list option)
  ~new_replication_factor:(new_replication_factor_ : int)
  ~cluster_name:(cluster_name_ : string) () =
  ({
     availability_zones = availability_zones_;
     new_replication_factor = new_replication_factor_;
     cluster_name = cluster_name_
   } : increase_replication_factor_request)
let make_event ?date:(date_ : CoreTypes.Timestamp.t option)
  ?message:(message_ : string option)
  ?source_type:(source_type_ : source_type option)
  ?source_name:(source_name_ : string option) () =
  ({
     date = date_;
     message = message_;
     source_type = source_type_;
     source_name = source_name_
   } : event)
let make_describe_subnet_groups_response
  ?subnet_groups:(subnet_groups_ : subnet_group list option)
  ?next_token:(next_token_ : string option) () =
  ({ subnet_groups = subnet_groups_; next_token = next_token_ } : describe_subnet_groups_response)
let make_describe_subnet_groups_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?subnet_group_names:(subnet_group_names_ : string list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     subnet_group_names = subnet_group_names_
   } : describe_subnet_groups_request)
let make_describe_parameters_response
  ?parameters:(parameters_ : parameter list option)
  ?next_token:(next_token_ : string option) () =
  ({ parameters = parameters_; next_token = next_token_ } : describe_parameters_response)
let make_describe_parameters_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) ?source:(source_ : string option)
  ~parameter_group_name:(parameter_group_name_ : string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     source = source_;
     parameter_group_name = parameter_group_name_
   } : describe_parameters_request)
let make_describe_parameter_groups_response
  ?parameter_groups:(parameter_groups_ : parameter_group list option)
  ?next_token:(next_token_ : string option) () =
  ({ parameter_groups = parameter_groups_; next_token = next_token_ } : 
  describe_parameter_groups_response)
let make_describe_parameter_groups_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?parameter_group_names:(parameter_group_names_ : string list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     parameter_group_names = parameter_group_names_
   } : describe_parameter_groups_request)
let make_describe_events_response ?events:(events_ : event list option)
  ?next_token:(next_token_ : string option) () =
  ({ events = events_; next_token = next_token_ } : describe_events_response)
let make_describe_events_request ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) ?duration:(duration_ : int option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?source_type:(source_type_ : source_type option)
  ?source_name:(source_name_ : string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     duration = duration_;
     end_time = end_time_;
     start_time = start_time_;
     source_type = source_type_;
     source_name = source_name_
   } : describe_events_request)
let make_describe_default_parameters_response
  ?parameters:(parameters_ : parameter list option)
  ?next_token:(next_token_ : string option) () =
  ({ parameters = parameters_; next_token = next_token_ } : describe_default_parameters_response)
let make_describe_default_parameters_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_default_parameters_request)
let make_describe_clusters_response
  ?clusters:(clusters_ : cluster list option)
  ?next_token:(next_token_ : string option) () =
  ({ clusters = clusters_; next_token = next_token_ } : describe_clusters_response)
let make_describe_clusters_request ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?cluster_names:(cluster_names_ : string list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     cluster_names = cluster_names_
   } : describe_clusters_request)
let make_delete_subnet_group_response
  ?deletion_message:(deletion_message_ : string option) () =
  ({ deletion_message = deletion_message_ } : delete_subnet_group_response)
let make_delete_subnet_group_request
  ~subnet_group_name:(subnet_group_name_ : string) () =
  ({ subnet_group_name = subnet_group_name_ } : delete_subnet_group_request)
let make_delete_parameter_group_response
  ?deletion_message:(deletion_message_ : string option) () =
  ({ deletion_message = deletion_message_ } : delete_parameter_group_response)
let make_delete_parameter_group_request
  ~parameter_group_name:(parameter_group_name_ : string) () =
  ({ parameter_group_name = parameter_group_name_ } : delete_parameter_group_request)
let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)
let make_delete_cluster_request ~cluster_name:(cluster_name_ : string) () =
  ({ cluster_name = cluster_name_ } : delete_cluster_request)
let make_decrease_replication_factor_response
  ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : decrease_replication_factor_response)
let make_decrease_replication_factor_request
  ?node_ids_to_remove:(node_ids_to_remove_ : string list option)
  ?availability_zones:(availability_zones_ : string list option)
  ~new_replication_factor:(new_replication_factor_ : int)
  ~cluster_name:(cluster_name_ : string) () =
  ({
     node_ids_to_remove = node_ids_to_remove_;
     availability_zones = availability_zones_;
     new_replication_factor = new_replication_factor_;
     cluster_name = cluster_name_
   } : decrease_replication_factor_request)
let make_create_subnet_group_response
  ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : create_subnet_group_response)
let make_create_subnet_group_request
  ?description:(description_ : string option)
  ~subnet_ids:(subnet_ids_ : string list)
  ~subnet_group_name:(subnet_group_name_ : string) () =
  ({
     subnet_ids = subnet_ids_;
     description = description_;
     subnet_group_name = subnet_group_name_
   } : create_subnet_group_request)
let make_create_parameter_group_response
  ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : create_parameter_group_response)
let make_create_parameter_group_request
  ?description:(description_ : string option)
  ~parameter_group_name:(parameter_group_name_ : string) () =
  ({ description = description_; parameter_group_name = parameter_group_name_
   } : create_parameter_group_request)
let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)
let make_create_cluster_request
  ?cluster_endpoint_encryption_type:(cluster_endpoint_encryption_type_ :
                                      cluster_endpoint_encryption_type option)
  ?sse_specification:(sse_specification_ : sse_specification option)
  ?tags:(tags_ : tag list option)
  ?parameter_group_name:(parameter_group_name_ : string option)
  ?notification_topic_arn:(notification_topic_arn_ : string option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?security_group_ids:(security_group_ids_ : string list option)
  ?subnet_group_name:(subnet_group_name_ : string option)
  ?availability_zones:(availability_zones_ : string list option)
  ?description:(description_ : string option)
  ~iam_role_arn:(iam_role_arn_ : string)
  ~replication_factor:(replication_factor_ : int)
  ~node_type:(node_type_ : string) ~cluster_name:(cluster_name_ : string) ()
  =
  ({
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     sse_specification = sse_specification_;
     tags = tags_;
     parameter_group_name = parameter_group_name_;
     iam_role_arn = iam_role_arn_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     security_group_ids = security_group_ids_;
     subnet_group_name = subnet_group_name_;
     availability_zones = availability_zones_;
     replication_factor = replication_factor_;
     description = description_;
     node_type = node_type_;
     cluster_name = cluster_name_
   } : create_cluster_request)