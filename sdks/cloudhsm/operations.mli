open Types

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
