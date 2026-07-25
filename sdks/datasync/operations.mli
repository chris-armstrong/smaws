open Types

module ListAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agents_request ->
    ( list_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agents_request ->
    ( list_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DataSync agents that belong to an Amazon Web Services account in the Amazon \
   Web Services Region specified in the request.\n\n\
  \ With pagination, you can reduce the number of agents returned in a response. If you get a \
   truncated list of agents in a response, the response contains a marker that you can specify in \
   your next request to fetch the next page of agents.\n\
  \ \n\
  \   [ListAgents] is eventually consistent. This means the result of running the operation might \
   not reflect that you just created or deleted an agent. For example, if you create an agent with \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateAgent.html}CreateAgent} and \
   then immediately run [ListAgents], that agent might not show up in the list right away. In \
   situations like this, you can always confirm whether an agent has been created (or deleted) by \
   using \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeAgent.html}DescribeAgent}.\n\
  \  "]

module ListLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_locations_request ->
    ( list_locations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_locations_request ->
    ( list_locations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of source and destination locations.\n\n\
  \ If you have more locations than are returned in a response (that is, the response returns only \
   a truncated list of your agents), the response contains a token that you can specify in your \
   next request to fetch the next page of locations.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns all the tags associated with an Amazon Web Services resource.\n"]

module ListTaskExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_task_executions_request ->
    ( list_task_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_task_executions_request ->
    ( list_task_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of executions for an DataSync transfer task.\n"]

module ListTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the DataSync tasks you created.\n"]

module StartTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_task_execution_request ->
    ( start_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_task_execution_request ->
    ( start_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an DataSync transfer task. For each task, you can only run one task execution at a time.\n\n\
  \ There are several steps to a task execution. For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/working-with-task-executions.html#understand-task-execution-statuses}Task \
   execution statuses}.\n\
  \ \n\
  \   If you're planning to transfer data to or from an Amazon S3 location, review \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}how \
   DataSync can affect your S3 request charges} and the \
   {{:http://aws.amazon.com/datasync/pricing/}DataSync pricing page} before you begin.\n\
  \   \n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a {i tag} to an Amazon Web Services resource. Tags are key-value pairs that can help \
   you manage, filter, and search for your resources.\n\n\
  \ These include DataSync resources, such as locations, tasks, and task executions.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_agent_request ->
    ( update_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_agent_request ->
    ( update_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of an DataSync agent.\n"]

module UpdateLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_azure_blob_request ->
    ( update_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_azure_blob_request ->
    ( update_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configurations of the Microsoft Azure Blob Storage transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html}Configuring \
   DataSync transfers with Azure Blob Storage}.\n\
  \ "]

module UpdateLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_efs_request ->
    ( update_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_efs_request ->
    ( update_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon EFS transfer location that you're \
   using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html}Configuring \
   DataSync transfers with Amazon EFS}.\n\
  \ "]

module UpdateLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_lustre_request ->
    ( update_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_lustre_request ->
    ( update_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for Lustre transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html}Configuring \
   DataSync transfers with FSx for Lustre}.\n\
  \ "]

module UpdateLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_ontap_request ->
    ( update_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_ontap_request ->
    ( update_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for NetApp ONTAP transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html}Configuring \
   DataSync transfers with FSx for ONTAP}.\n\
  \ "]

module UpdateLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_open_zfs_request ->
    ( update_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_open_zfs_request ->
    ( update_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for OpenZFS transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html}Configuring \
   DataSync transfers with FSx for OpenZFS}.\n\
  \ \n\
  \   Request parameters related to [SMB] aren't supported with the [UpdateLocationFsxOpenZfs] \
   operation.\n\
  \   \n\
  \    "]

module UpdateLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_windows_request ->
    ( update_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_windows_request ->
    ( update_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for Windows File Server \
   transfer location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html}Configuring \
   DataSync transfers with FSx for Windows File Server}.\n\
  \ "]

module UpdateLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_hdfs_request ->
    ( update_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_hdfs_request ->
    ( update_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Hadoop Distributed File System (HDFS) \
   transfer location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html}Configuring \
   DataSync transfers with an HDFS cluster}.\n\
  \ "]

module UpdateLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_nfs_request ->
    ( update_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_nfs_request ->
    ( update_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Network File System (NFS) transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html}Configuring \
   transfers with an NFS file server}.\n\
  \ "]

module UpdateLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_object_storage_request ->
    ( update_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_object_storage_request ->
    ( update_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the object storage transfer location that \
   you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html}Configuring \
   DataSync transfers with an object storage system}.\n\
  \ "]

module UpdateLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_s3_request ->
    ( update_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_s3_request ->
    ( update_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon S3 transfer location that you're \
   using with DataSync.\n\n\
  \  Before you begin, make sure that you read the following topics:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
   class considerations with Amazon S3 locations} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}Evaluating \
   S3 request costs when using DataSync} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module UpdateLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_smb_request ->
    ( update_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_smb_request ->
    ( update_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Server Message Block (SMB) transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html}Configuring \
   DataSync transfers with an SMB file server}.\n\
  \ "]

module UpdateTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_request ->
    ( update_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_request ->
    ( update_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of a {i task}, which defines where and how DataSync transfers your \
   data.\n"]

module UpdateTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_execution_request ->
    ( update_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_execution_request ->
    ( update_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of a running DataSync task execution.\n\n\
  \  Currently, the only [Option] that you can modify with [UpdateTaskExecution] is \n\
  \  {[\n\
  \   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-BytesPerSecond}BytesPerSecond} \n\
  \  ]}\n\
  \  , which throttles bandwidth for a running or queued task execution.\n\
  \  \n\
  \   "]

module DescribeTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_execution_request ->
    ( describe_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_execution_request ->
    ( describe_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about an execution of your DataSync task. You can use this operation to \
   help monitor the progress of an ongoing data transfer or check the results of the transfer.\n\n\
  \  Some [DescribeTaskExecution] response elements are only relevant to a specific task mode. For \
   information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html#task-mode-differences}Understanding \
   task mode differences} and \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/transfer-performance-counters.html}Understanding \
   data transfer performance counters}.\n\
  \  \n\
  \   "]

module DescribeTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_request ->
    ( describe_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_request ->
    ( describe_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about a {i task}, which defines where and how DataSync transfers your data.\n"]

module DescribeLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_smb_request ->
    ( describe_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_smb_request ->
    ( describe_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Server Message Block (SMB) file \
   server is configured.\n"]

module DescribeLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_s3_request ->
    ( describe_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_s3_request ->
    ( describe_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an S3 bucket is configured.\n"]

module DescribeLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_object_storage_request ->
    ( describe_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_object_storage_request ->
    ( describe_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an object storage system is \
   configured.\n"]

module DescribeLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_nfs_request ->
    ( describe_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_nfs_request ->
    ( describe_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Network File System (NFS) file \
   server is configured.\n"]

module DescribeLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_hdfs_request ->
    ( describe_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_hdfs_request ->
    ( describe_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Hadoop Distributed File System \
   (HDFS) is configured.\n"]

module DescribeLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_windows_request ->
    ( describe_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_windows_request ->
    ( describe_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for Windows File \
   Server file system is configured.\n"]

module DescribeLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_open_zfs_request ->
    ( describe_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_open_zfs_request ->
    ( describe_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for OpenZFS file \
   system is configured.\n\n\
  \  Response elements related to [SMB] aren't supported with the [DescribeLocationFsxOpenZfs] \
   operation.\n\
  \  \n\
  \   "]

module DescribeLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_ontap_request ->
    ( describe_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_ontap_request ->
    ( describe_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for NetApp ONTAP \
   file system is configured.\n\n\
  \  If your location uses SMB, the [DescribeLocationFsxOntap] operation doesn't actually return a \
   [Password].\n\
  \  \n\
  \   "]

module DescribeLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_lustre_request ->
    ( describe_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_lustre_request ->
    ( describe_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for Lustre file \
   system is configured.\n"]

module DescribeLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_efs_request ->
    ( describe_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_efs_request ->
    ( describe_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon EFS file system is \
   configured.\n"]

module DescribeLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_azure_blob_request ->
    ( describe_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_azure_blob_request ->
    ( describe_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for Microsoft Azure Blob Storage is \
   configured.\n"]

module DescribeAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agent_request ->
    ( describe_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agent_request ->
    ( describe_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an DataSync agent, such as its name, service endpoint type, and status.\n"]

module DeleteTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_task_request ->
    ( delete_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_task_request ->
    ( delete_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a transfer task resource from DataSync.\n"]

module DeleteLocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_location_request ->
    ( delete_location_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_location_request ->
    ( delete_location_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a transfer location resource from DataSync. \n"]

module DeleteAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_agent_request ->
    ( delete_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_agent_request ->
    ( delete_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an DataSync agent resource from your Amazon Web Services account.\n\n\
  \ Keep in mind that this operation (which can't be undone) doesn't remove the agent's virtual \
   machine (VM) or Amazon EC2 instance from your storage environment. For next steps, you can \
   delete the VM or instance from your storage environment or reuse it to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html}activate a new \
   agent}.\n\
  \ "]

module CreateTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_task_request ->
    ( create_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_task_request ->
    ( create_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures a {i task}, which defines where and how DataSync transfers your data.\n\n\
  \ A task includes a source location, destination location, and transfer options (such as \
   bandwidth limits, scheduling, and more).\n\
  \ \n\
  \   If you're planning to transfer data to or from an Amazon S3 location, review \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}how \
   DataSync can affect your S3 request charges} and the \
   {{:http://aws.amazon.com/datasync/pricing/}DataSync pricing page} before you begin.\n\
  \   \n\
  \    "]

module CreateLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_smb_request ->
    ( create_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_smb_request ->
    ( create_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Server Message Block (SMB) file server. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync accesses SMB file servers. For \
   more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
   DataSync access to SMB file servers}.\n\
  \ "]

module CreateLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_s3_request ->
    ( create_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_s3_request ->
    ( create_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon S3 bucket. DataSync can use this location as a \
   source or destination for transferring data.\n\n\
  \  Before you begin, make sure that you read the following topics:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
   class considerations with Amazon S3 locations} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}Evaluating \
   S3 request costs when using DataSync} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html}Configuring \
   transfers with Amazon S3}.\n\
  \    "]

module CreateLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_object_storage_request ->
    ( create_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_object_storage_request ->
    ( create_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an object storage system. DataSync can use this location as \
   a source or destination for transferring data. You can make transfers with or without a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#when-agent-required}DataSync \
   agent}.\n\n\
  \ Before you begin, make sure that you understand the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html#create-object-location-prerequisites}prerequisites} \
   for DataSync to work with object storage systems.\n\
  \ "]

module CreateLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_nfs_request ->
    ( create_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_nfs_request ->
    ( create_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Network File System (NFS) file server. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs}accesses \
   NFS file servers}.\n\
  \ "]

module CreateLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_hdfs_request ->
    ( create_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_hdfs_request ->
    ( create_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Hadoop Distributed File System (HDFS). DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html#accessing-hdfs}accesses \
   HDFS clusters}.\n\
  \ "]

module CreateLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_windows_request ->
    ( create_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_windows_request ->
    ( create_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for Windows File Server file system. DataSync \
   can use this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-location-access}accesses \
   FSx for Windows File Server file systems}.\n\
  \ "]

module CreateLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_open_zfs_request ->
    ( create_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_open_zfs_request ->
    ( create_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for OpenZFS file system. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html#create-openzfs-access}accesses \
   FSx for OpenZFS file systems}.\n\
  \ \n\
  \   Request parameters related to [SMB] aren't supported with the [CreateLocationFsxOpenZfs] \
   operation.\n\
  \   \n\
  \    "]

module CreateLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_ontap_request ->
    ( create_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_ontap_request ->
    ( create_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for NetApp ONTAP file system. DataSync can \
   use this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access}accesses \
   FSx for ONTAP file systems}.\n\
  \ "]

module CreateLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_lustre_request ->
    ( create_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_lustre_request ->
    ( create_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for Lustre file system. DataSync can use this \
   location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html#create-lustre-location-access}accesses \
   FSx for Lustre file systems}.\n\
  \ "]

module CreateLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_efs_request ->
    ( create_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_efs_request ->
    ( create_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon EFS file system. DataSync can use this location \
   as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-access}accesses \
   Amazon EFS file systems}.\n\
  \ "]

module CreateLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_azure_blob_request ->
    ( create_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_azure_blob_request ->
    ( create_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Microsoft Azure Blob Storage container. DataSync can use \
   this location as a transfer source or destination. You can make transfers with or without a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-creating-agent}DataSync \
   agent} that connects to your container.\n\n\
  \ Before you begin, make sure you know \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access}how \
   DataSync accesses Azure Blob Storage} and works with \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers}access \
   tiers} and \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#blob-types}blob \
   types}.\n\
  \ "]

module CreateAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_agent_request ->
    ( create_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_agent_request ->
    ( create_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates an DataSync agent that you deploy in your storage environment. The activation process \
   associates the agent with your Amazon Web Services account.\n\n\
  \ If you haven't deployed an agent yet, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html}Do I \
   need a DataSync agent?} \n\
  \ "]

module CancelTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_task_execution_request ->
    ( cancel_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_task_execution_request ->
    ( cancel_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an DataSync task execution that's in progress. The transfer of some files are abruptly \
   interrupted. File contents that're transferred to the destination might be incomplete or \
   inconsistent with the source files.\n\n\
  \ However, if you start a new task execution using the same task and allow it to finish, file \
   content on the destination will be complete and consistent. This applies to other unexpected \
   failures that interrupt a task execution. In all of these cases, DataSync successfully \
   completes the transfer when you start the next task execution.\n\
  \ "]
