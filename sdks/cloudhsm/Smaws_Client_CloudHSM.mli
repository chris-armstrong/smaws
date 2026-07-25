(** CloudHSM client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_add_tags_to_resource_response : status:string_ -> unit -> add_tags_to_resource_response
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_add_tags_to_resource_request :
  resource_arn:string_ -> tag_list:tag_list -> unit -> add_tags_to_resource_request

val make_remove_tags_from_resource_response :
  status:string_ -> unit -> remove_tags_from_resource_response

val make_remove_tags_from_resource_request :
  resource_arn:string_ -> tag_key_list:tag_key_list -> unit -> remove_tags_from_resource_request

val make_modify_luna_client_response : ?client_arn:client_arn -> unit -> modify_luna_client_response

val make_modify_luna_client_request :
  client_arn:client_arn -> certificate:certificate -> unit -> modify_luna_client_request

val make_modify_hsm_response : ?hsm_arn:hsm_arn -> unit -> modify_hsm_response

val make_modify_hsm_request :
  ?subnet_id:subnet_id ->
  ?eni_ip:ip_address ->
  ?iam_role_arn:iam_role_arn ->
  ?external_id:external_id ->
  ?syslog_ip:ip_address ->
  hsm_arn:hsm_arn ->
  unit ->
  modify_hsm_request

val make_modify_hapg_response : ?hapg_arn:hapg_arn -> unit -> modify_hapg_response

val make_modify_hapg_request :
  ?label:label ->
  ?partition_serial_list:partition_serial_list ->
  hapg_arn:hapg_arn ->
  unit ->
  modify_hapg_request

val make_list_tags_for_resource_response :
  tag_list:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_list_luna_clients_response :
  ?next_token:pagination_token -> client_list:client_list -> unit -> list_luna_clients_response

val make_list_luna_clients_request :
  ?next_token:pagination_token -> unit -> list_luna_clients_request

val make_list_hsms_response :
  ?hsm_list:hsm_list -> ?next_token:pagination_token -> unit -> list_hsms_response

val make_list_hsms_request : ?next_token:pagination_token -> unit -> list_hsms_request

val make_list_hapgs_response :
  ?next_token:pagination_token -> hapg_list:hapg_list -> unit -> list_hapgs_response

val make_list_hapgs_request : ?next_token:pagination_token -> unit -> list_hapgs_request
val make_list_available_zones_response : ?az_list:az_list -> unit -> list_available_zones_response
val make_list_available_zones_request : unit -> unit

val make_get_config_response :
  ?config_type:string_ ->
  ?config_file:string_ ->
  ?config_cred:string_ ->
  unit ->
  get_config_response

val make_get_config_request :
  client_arn:client_arn ->
  client_version:client_version ->
  hapg_list:hapg_list ->
  unit ->
  get_config_request

val make_describe_luna_client_response :
  ?client_arn:client_arn ->
  ?certificate:certificate ->
  ?certificate_fingerprint:certificate_fingerprint ->
  ?last_modified_timestamp:timestamp ->
  ?label:label ->
  unit ->
  describe_luna_client_response

val make_describe_luna_client_request :
  ?client_arn:client_arn ->
  ?certificate_fingerprint:certificate_fingerprint ->
  unit ->
  describe_luna_client_request

val make_describe_hsm_response :
  ?hsm_arn:hsm_arn ->
  ?status:hsm_status ->
  ?status_details:string_ ->
  ?availability_zone:a_z ->
  ?eni_id:eni_id ->
  ?eni_ip:ip_address ->
  ?subscription_type:subscription_type ->
  ?subscription_start_date:timestamp ->
  ?subscription_end_date:timestamp ->
  ?vpc_id:vpc_id ->
  ?subnet_id:subnet_id ->
  ?iam_role_arn:iam_role_arn ->
  ?serial_number:hsm_serial_number ->
  ?vendor_name:string_ ->
  ?hsm_type:string_ ->
  ?software_version:string_ ->
  ?ssh_public_key:ssh_key ->
  ?ssh_key_last_updated:timestamp ->
  ?server_cert_uri:string_ ->
  ?server_cert_last_updated:timestamp ->
  ?partitions:partition_list ->
  unit ->
  describe_hsm_response

val make_describe_hsm_request :
  ?hsm_arn:hsm_arn -> ?hsm_serial_number:hsm_serial_number -> unit -> describe_hsm_request

val make_describe_hapg_response :
  ?hapg_arn:hapg_arn ->
  ?hapg_serial:string_ ->
  ?hsms_last_action_failed:hsm_list ->
  ?hsms_pending_deletion:hsm_list ->
  ?hsms_pending_registration:hsm_list ->
  ?label:label ->
  ?last_modified_timestamp:timestamp ->
  ?partition_serial_list:partition_serial_list ->
  ?state:cloud_hsm_object_state ->
  unit ->
  describe_hapg_response

val make_describe_hapg_request : hapg_arn:hapg_arn -> unit -> describe_hapg_request
val make_delete_luna_client_response : status:string_ -> unit -> delete_luna_client_response
val make_delete_luna_client_request : client_arn:client_arn -> unit -> delete_luna_client_request
val make_delete_hsm_response : status:string_ -> unit -> delete_hsm_response
val make_delete_hsm_request : hsm_arn:hsm_arn -> unit -> delete_hsm_request
val make_delete_hapg_response : status:string_ -> unit -> delete_hapg_response
val make_delete_hapg_request : hapg_arn:hapg_arn -> unit -> delete_hapg_request
val make_create_luna_client_response : ?client_arn:client_arn -> unit -> create_luna_client_response

val make_create_luna_client_request :
  ?label:client_label -> certificate:certificate -> unit -> create_luna_client_request

val make_create_hsm_response : ?hsm_arn:hsm_arn -> unit -> create_hsm_response

val make_create_hsm_request :
  ?eni_ip:ip_address ->
  ?external_id:external_id ->
  ?client_token:client_token ->
  ?syslog_ip:ip_address ->
  subnet_id:subnet_id ->
  ssh_key:ssh_key ->
  iam_role_arn:iam_role_arn ->
  subscription_type:subscription_type ->
  unit ->
  create_hsm_request

val make_create_hapg_response : ?hapg_arn:hapg_arn -> unit -> create_hapg_response

val make_create_hapg_request : label:label -> unit -> create_hapg_request
(** {1:operations Operations} *)

module CreateHapg : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hapg_request ->
    ( create_hapg_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hapg_request ->
    ( create_hapg_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Creates a high-availability partition group. A high-availability partition group is a group \
   of partitions that spans multiple physical HSMs.\n\
  \  "]

module CreateHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_request ->
    ( create_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_request ->
    ( create_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Creates an uninitialized HSM instance.\n\
  \  \n\
  \   There is an upfront fee charged for each HSM instance that you create with the [CreateHsm] \
   operation. If you accidentally provision an HSM and want to request a refund, delete the \
   instance using the [DeleteHsm] operation, go to the \
   {{:https://console.aws.amazon.com/support/home}AWS Support Center}, create a new case, and \
   select {b Account and Billing Support}.\n\
  \   \n\
  \     It can take up to 20 minutes to create and provision an HSM. You can monitor the status of \
   the HSM with the [DescribeHsm] operation. The HSM is ready to be initialized when the status \
   changes to [RUNNING].\n\
  \     \n\
  \      "]

module CreateLunaClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_luna_client_request ->
    ( create_luna_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_luna_client_request ->
    ( create_luna_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Creates an HSM client.\n\
  \  "]

module DeleteHapg : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hapg_request ->
    ( delete_hapg_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hapg_request ->
    ( delete_hapg_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Deletes a high-availability partition group.\n\
  \  "]

module DeleteHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_request ->
    ( delete_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_request ->
    ( delete_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Deletes an HSM. After completion, this operation cannot be undone and your key material \
   cannot be recovered.\n\
  \  "]

module DeleteLunaClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_luna_client_request ->
    ( delete_luna_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_luna_client_request ->
    ( delete_luna_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Deletes a client.\n\
  \  "]

module DescribeHapg : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hapg_request ->
    ( describe_hapg_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hapg_request ->
    ( describe_hapg_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Retrieves information about a high-availability partition group.\n\
  \  "]

module DescribeHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_request ->
    ( describe_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_request ->
    ( describe_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Retrieves information about an HSM. You can identify the HSM by its ARN or its serial number.\n\
  \  "]

module DescribeLunaClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_luna_client_request ->
    ( describe_luna_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_luna_client_request ->
    ( describe_luna_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Retrieves information about an HSM client.\n\
  \  "]

module GetConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_config_request ->
    ( get_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_config_request ->
    ( get_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Gets the configuration files necessary to connect to all high availability partition groups \
   the client is associated with.\n\
  \  "]

module ListAvailableZones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_zones_request ->
    ( list_available_zones_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_zones_request ->
    ( list_available_zones_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Lists the Availability Zones that have available AWS CloudHSM capacity.\n\
  \  "]

module ListHapgs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hapgs_request ->
    ( list_hapgs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hapgs_request ->
    ( list_hapgs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Lists the high-availability partition groups for the account.\n\
  \  \n\
  \   This operation supports pagination with the use of the [NextToken] member. If more results \
   are available, the [NextToken] member of the response contains a token that you pass in the \
   next call to [ListHapgs] to retrieve the next set of items.\n\
  \   "]

module ListHsms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hsms_request ->
    ( list_hsms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hsms_request ->
    ( list_hsms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Retrieves the identifiers of all of the HSMs provisioned for the current customer.\n\
  \  \n\
  \   This operation supports pagination with the use of the [NextToken] member. If more results \
   are available, the [NextToken] member of the response contains a token that you pass in the \
   next call to [ListHsms] to retrieve the next set of items.\n\
  \   "]

module ListLunaClients : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_luna_clients_request ->
    ( list_luna_clients_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_luna_clients_request ->
    ( list_luna_clients_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Lists all of the clients.\n\
  \  \n\
  \   This operation supports pagination with the use of the [NextToken] member. If more results \
   are available, the [NextToken] member of the response contains a token that you pass in the \
   next call to [ListLunaClients] to retrieve the next set of items.\n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Returns a list of all tags for the specified AWS CloudHSM resource.\n\
  \  "]

module ModifyHapg : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_hapg_request ->
    ( modify_hapg_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_hapg_request ->
    ( modify_hapg_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Modifies an existing high-availability partition group.\n\
  \  "]

module ModifyHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_hsm_request ->
    ( modify_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_hsm_request ->
    ( modify_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Modifies an HSM.\n\
  \  \n\
  \    This operation can result in the HSM being offline for up to 15 minutes while the AWS \
   CloudHSM service is reconfigured. If you are modifying a production HSM, you should ensure that \
   your AWS CloudHSM service is configured for high availability, and consider executing this \
   operation during a maintenance window.\n\
  \    \n\
  \     "]

module ModifyLunaClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_luna_client_request ->
    ( modify_luna_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_luna_client_request ->
    ( modify_luna_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Modifies the certificate used by the client.\n\
  \  \n\
  \   This action can potentially start a workflow to install the new certificate on the client's \
   HSMs.\n\
  \   "]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Removes one or more tags from the specified AWS CloudHSM resource.\n\
  \  \n\
  \   To remove a tag, specify only the tag key to remove (not the value). To overwrite the value \
   for an existing tag, use [AddTagsToResource].\n\
  \   "]

(** {1:Serialization and Deserialization} *)
module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmInternalException of cloud_hsm_internal_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmInternalException of cloud_hsm_internal_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is documentation for {b AWS CloudHSM Classic}. For more information, see \
   {{:http://aws.amazon.com/cloudhsm/faqs-classic/}AWS CloudHSM Classic FAQs}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/classic/userguide/}AWS CloudHSM Classic User Guide}, \
   and the {{:https://docs.aws.amazon.com/cloudhsm/classic/APIReference/}AWS CloudHSM Classic API \
   Reference}.\n\n\
  \  {b For information about the current version of AWS CloudHSM}, see \
   {{:http://aws.amazon.com/cloudhsm/}AWS CloudHSM}, the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/}AWS CloudHSM User Guide}, and the \
   {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/}AWS CloudHSM API Reference}.\n\
  \ \n\
  \  Adds or overwrites one or more tags for the specified AWS CloudHSM resource.\n\
  \  \n\
  \   Each tag consists of a key and a value. Tag keys must be unique to each resource.\n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
