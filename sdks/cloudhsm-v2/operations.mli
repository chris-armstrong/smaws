open Types

module CopyBackupToRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_to_region_request ->
    ( copy_backup_to_region_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_to_region_request ->
    ( copy_backup_to_region_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copy an CloudHSM cluster backup to a different region.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM backup in a \
   different Amazon Web Services account.\n\
  \ "]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new CloudHSM cluster.\n\n\
  \  {b Cross-account use:} Yes. To perform this operation with an CloudHSM backup in a different \
   AWS account, specify the full backup ARN in the value of the SourceBackupId parameter.\n\
  \ "]

module CreateHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_request ->
    ( create_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_request ->
    ( create_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new hardware security module (HSM) in the specified CloudHSM cluster.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM cluster in a \
   different Amazon Web Service account.\n\
  \ "]

module DeleteBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified CloudHSM backup. A backup can be restored up to 7 days after the \
   DeleteBackup request is made. For more information on restoring a backup, see [RestoreBackup].\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM backup in a \
   different Amazon Web Services account.\n\
  \ "]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified CloudHSM cluster. Before you can delete a cluster, you must delete all \
   HSMs in the cluster. To see if the cluster contains any HSMs, use [DescribeClusters]. To delete \
   an HSM, use [DeleteHsm].\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM cluster in a \
   different Amazon Web Services account.\n\
  \ "]

module DeleteHsm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_request ->
    ( delete_hsm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_request ->
    ( delete_hsm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP address \
   of the HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need to specify \
   only one of these values. To find these values, use [DescribeClusters].\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM hsm in a \
   different Amazon Web Services account.\n\
  \ "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes an CloudHSM resource policy. Deleting a resource policy will result in the resource \
   being unshared and removed from any RAM resource shares. Deleting the resource policy attached \
   to a backup will not impact any clusters created from that backup.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in a \
   different Amazon Web Services account.\n\
  \ "]

module DescribeBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about backups of CloudHSM clusters. Lists either the backups you own or the \
   backups shared with you when the Shared parameter is true.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the backups. When the response contains only a subset of backups, it includes a [NextToken] \
   value. Use this value in a subsequent [DescribeBackups] request to get more backups. When you \
   receive a response with no [NextToken] (or an empty or null value), that means there are no \
   more backups to get.\n\
  \ \n\
  \   {b Cross-account use:} Yes. Customers can describe backups in other Amazon Web Services \
   accounts that are shared with them.\n\
  \  "]

module DescribeClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about CloudHSM clusters.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the clusters. When the response contains only a subset of clusters, it includes a \
   [NextToken] value. Use this value in a subsequent [DescribeClusters] request to get more \
   clusters. When you receive a response with no [NextToken] (or an empty or null value), that \
   means there are no more clusters to get.\n\
  \ \n\
  \   {b Cross-account use:} No. You cannot perform this operation on CloudHSM clusters in a \
   different Amazon Web Services account.\n\
  \  "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Retrieves the resource policy document attached to a given resource. \n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in a \
   different Amazon Web Services account.\n\
  \ "]

module InitializeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    initialize_cluster_request ->
    ( initialize_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    initialize_cluster_request ->
    ( initialize_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Claims an CloudHSM cluster by submitting the cluster certificate issued by your issuing \
   certificate authority (CA) and the CA's root certificate. Before you can claim a cluster, you \
   must sign the cluster's certificate signing request (CSR) with your issuing CA. To get the \
   cluster's CSR, use [DescribeClusters].\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM cluster in a \
   different Amazon Web Services account.\n\
  \ "]

module ListTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of tags for the specified CloudHSM cluster.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the tags. When the response contains only a subset of tags, it includes a [NextToken] \
   value. Use this value in a subsequent [ListTags] request to get more tags. When you receive a \
   response with no [NextToken] (or an empty or null value), that means there are no more tags to \
   get.\n\
  \ \n\
  \   {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in a \
   different Amazon Web Services account.\n\
  \  "]

module ModifyBackupAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_backup_attributes_request ->
    ( modify_backup_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_backup_attributes_request ->
    ( modify_backup_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies attributes for CloudHSM backup.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM backup in a \
   different Amazon Web Services account.\n\
  \ "]

module ModifyCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_request ->
    ( modify_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_request ->
    ( modify_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies CloudHSM cluster.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM cluster in a \
   different Amazon Web Services account.\n\
  \ "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an CloudHSM resource policy. A resource policy helps you to define the IAM \
   entity (for example, an Amazon Web Services account) that can manage your CloudHSM resources. \
   The following resources support CloudHSM resource policies: \n\n\
  \ {ul\n\
  \       {-   Backup - The resource policy allows you to describe the backup and restore a \
   cluster from the backup in another Amazon Web Services account.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   In order to share a backup, it must be in a 'READY' state and you must own it.\n\
  \   \n\
  \     While you can share a backup using the CloudHSM PutResourcePolicy operation, we recommend \
   using Resource Access Manager (RAM) instead. Using RAM provides multiple benefits as it creates \
   the policy for you, allows multiple resources to be shared at one time, and increases the \
   discoverability of shared resources. If you use PutResourcePolicy and want consumers to be able \
   to describe the backups you share with them, you must promote the backup to a standard RAM \
   Resource Share using the RAM PromoteResourceShareCreatedFromPolicy API operation. For more \
   information, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html} Working \
   with shared backups} in the CloudHSM User Guide\n\
  \     \n\
  \        {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in \
   a different Amazon Web Services account.\n\
  \       "]

module RestoreBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_backup_request ->
    ( restore_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_backup_request ->
    ( restore_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a specified CloudHSM backup that is in the [PENDING_DELETION] state. For more \
   information on deleting a backup, see [DeleteBackup].\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM backup in a \
   different Amazon Web Services account.\n\
  \ "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceLimitExceededException of cloud_hsm_resource_limit_exceeded_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceLimitExceededException of cloud_hsm_resource_limit_exceeded_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceLimitExceededException of cloud_hsm_resource_limit_exceeded_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified CloudHSM cluster.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in a \
   different Amazon Web Services account.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
    | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
    | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
    | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
    | `CloudHsmServiceException of cloud_hsm_service_exception
    | `CloudHsmTagException of cloud_hsm_tag_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudHsmAccessDeniedException of cloud_hsm_access_denied_exception
      | `CloudHsmInternalFailureException of cloud_hsm_internal_failure_exception
      | `CloudHsmInvalidRequestException of cloud_hsm_invalid_request_exception
      | `CloudHsmResourceNotFoundException of cloud_hsm_resource_not_found_exception
      | `CloudHsmServiceException of cloud_hsm_service_exception
      | `CloudHsmTagException of cloud_hsm_tag_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tag or tags from the specified CloudHSM cluster.\n\n\
  \  {b Cross-account use:} No. You cannot perform this operation on an CloudHSM resource in a \
   different Amazon Web Services account.\n\
  \ "]
