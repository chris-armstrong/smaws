type nonrec ssh_public_key_body = string [@@ocaml.doc ""]

type nonrec service_error_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : service_error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec address_allocation_id = string [@@ocaml.doc ""]

type nonrec address_allocation_ids = address_allocation_id list [@@ocaml.doc ""]

type nonrec agreement_id = string [@@ocaml.doc ""]

type nonrec agreement_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec agreement_status_type = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec server_id = string [@@ocaml.doc ""]

type nonrec as2_async_mdn_server_ids = server_id list [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec as2_async_mdn_connector_config = {
  url : url option;
      [@ocaml.doc "The URL endpoint where asynchronous MDN responses should be sent.\n"]
  server_ids : as2_async_mdn_server_ids option;
      [@ocaml.doc
        "A list of server identifiers that can handle asynchronous MDN responses. You can specify \
         between 1 and 10 server IDs.\n"]
}
[@@ocaml.doc
  "Contains the configuration details for asynchronous Message Disposition Notification (MDN) \
   responses in AS2 connectors. This configuration specifies where asynchronous MDN responses \
   should be sent and which servers should handle them.\n"]

type nonrec preserve_content_type = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec as2_connector_secret_id = string [@@ocaml.doc ""]

type nonrec mdn_response = SYNC [@ocaml.doc ""] | NONE [@ocaml.doc ""] | ASYNC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mdn_signing_alg =
  | SHA256 [@ocaml.doc ""]
  | SHA384 [@ocaml.doc ""]
  | SHA512 [@ocaml.doc ""]
  | SHA1 [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec signing_alg =
  | SHA256 [@ocaml.doc ""]
  | SHA384 [@ocaml.doc ""]
  | SHA512 [@ocaml.doc ""]
  | SHA1 [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_alg =
  | AES128_CBC [@ocaml.doc ""]
  | AES192_CBC [@ocaml.doc ""]
  | AES256_CBC [@ocaml.doc ""]
  | DES_EDE3_CBC [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compression_enum = ZLIB [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec message_subject = string [@@ocaml.doc ""]

type nonrec profile_id = string [@@ocaml.doc ""]

type nonrec as2_connector_config = {
  local_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the AS2 local profile.\n"]
  partner_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the partner profile for the connector.\n"]
  message_subject : message_subject option;
      [@ocaml.doc
        "Used as the [Subject] HTTP header attribute in AS2 messages that are being sent with the \
         connector.\n"]
  compression : compression_enum option;
      [@ocaml.doc "Specifies whether the AS2 file is compressed.\n"]
  encryption_algorithm : encryption_alg option;
      [@ocaml.doc
        "The algorithm that is used to encrypt the file.\n\n\
        \ Note the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Do not use the [DES_EDE3_CBC] algorithm unless you must support a legacy \
         client that requires it, as it is a weak encryption algorithm.\n\
        \            \n\
        \             }\n\
        \        {-  You can only specify [NONE] if the URL for your connector uses HTTPS. Using \
         HTTPS ensures that no traffic is sent in clear text.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  signing_algorithm : signing_alg option;
      [@ocaml.doc "The algorithm that is used to sign the AS2 messages sent with the connector.\n"]
  mdn_signing_algorithm : mdn_signing_alg option;
      [@ocaml.doc
        "The signing algorithm for the MDN response.\n\n\
        \  If set to DEFAULT (or not set at all), the value for [SigningAlgorithm] is used.\n\
        \  \n\
        \   "]
  mdn_response : mdn_response option;
      [@ocaml.doc
        "Used for outbound requests (from an Transfer Family connector to a partner AS2 server) to \
         determine whether the partner response for transfers is synchronous or asynchronous. \
         Specify either of the following values:\n\n\
        \ {ul\n\
        \       {-   [ASYNC]: The system expects an asynchronous MDN response, confirming that the \
         file was transferred successfully (or not).\n\
        \           \n\
        \            }\n\
        \       {-   [SYNC]: The system expects a synchronous MDN response, confirming that the \
         file was transferred successfully (or not).\n\
        \           \n\
        \            }\n\
        \       {-   [NONE]: Specifies that no MDN response is required.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  basic_auth_secret_id : as2_connector_secret_id option;
      [@ocaml.doc
        "Provides Basic authentication support to the AS2 Connectors API. To use Basic \
         authentication, you must provide the name or Amazon Resource Name (ARN) of a secret in \
         Secrets Manager.\n\n\
        \ The default value for this parameter is [null], which indicates that Basic \
         authentication is not enabled for the connector.\n\
        \ \n\
        \  If the connector should use Basic authentication, the secret needs to be in the \
         following format:\n\
        \  \n\
        \    [{ \"Username\": \"user-name\", \"Password\": \"user-password\" }] \n\
        \   \n\
        \    Replace [user-name] and [user-password] with the credentials for the actual user that \
         is being authenticated.\n\
        \    \n\
        \     Note the following:\n\
        \     \n\
        \      {ul\n\
        \            {-  You are storing these credentials in Secrets Manager, {i not passing them \
         directly} into this API.\n\
        \                \n\
        \                 }\n\
        \            {-  If you are using the API, SDKs, or CloudFormation to configure your \
         connector, then you must create the secret before you can enable Basic authentication. \
         However, if you are using the Amazon Web Services management console, you can have the \
         system create the secret for you.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   If you have previously enabled Basic authentication for a connector, you can disable \
         it by using the [UpdateConnector] API call. For example, if you are using the CLI, you \
         can run the following command to remove Basic authentication:\n\
        \   \n\
        \     [update-connector --connector-id my-connector-id --as2-config \
         'BasicAuthSecretId=\"\"'] \n\
        \    "]
  preserve_content_type : preserve_content_type option;
      [@ocaml.doc
        "Allows you to use the Amazon S3 [Content-Type] that is associated with objects in S3 \
         instead of having the content type mapped based on the file extension. This parameter is \
         enabled by default when you create an AS2 connector from the console, but disabled by \
         default when you create an AS2 connector by calling the API directly.\n"]
  async_mdn_config : as2_async_mdn_connector_config option;
      [@ocaml.doc
        "Configuration settings for asynchronous Message Disposition Notification (MDN) responses. \
         This allows you to configure where asynchronous MDN responses should be sent and which \
         servers should handle them.\n"]
}
[@@ocaml.doc
  "Contains the details for an AS2 connector object. The connector object is used for AS2 outbound \
   processes, to connect the Transfer Family customer with the trading partner.\n"]

type nonrec as2_id = string [@@ocaml.doc ""]

type nonrec as2_transport = HTTP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec as2_transports = as2_transport list [@@ocaml.doc ""]

type nonrec callback_token = string [@@ocaml.doc ""]

type nonrec cert_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec cert_serial = string [@@ocaml.doc ""]

type nonrec certificate = string [@@ocaml.doc ""]

type nonrec certificate_body_type = string [@@ocaml.doc ""]

type nonrec certificate_chain_type = string [@@ocaml.doc ""]

type nonrec certificate_id = string [@@ocaml.doc ""]

type nonrec certificate_ids = certificate_id list [@@ocaml.doc ""]

type nonrec certificate_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec certificate_status_type =
  | ACTIVE [@ocaml.doc ""]
  | PENDING_ROTATION [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_type =
  | CERTIFICATE [@ocaml.doc ""]
  | CERTIFICATE_WITH_PRIVATE_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_usage_type =
  | SIGNING [@ocaml.doc ""]
  | ENCRYPTION [@ocaml.doc ""]
  | TLS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec conflict_exception = { message : message [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when the [UpdateServer] is called for a file transfer protocol-enabled \
   server that has VPC as the endpoint type and the server's [VpcEndpointID] is not in the \
   available state.\n"]

type nonrec sftp_port = int [@@ocaml.doc ""]

type nonrec vpc_lattice_resource_configuration_arn = string [@@ocaml.doc ""]

type nonrec connector_vpc_lattice_egress_config = {
  resource_configuration_arn : vpc_lattice_resource_configuration_arn;
      [@ocaml.doc
        "ARN of the VPC_LATTICE Resource Configuration that defines the target SFTP server \
         location. Must point to a valid Resource Configuration in the customer's VPC with \
         appropriate network connectivity to the SFTP server.\n"]
  port_number : sftp_port option;
      [@ocaml.doc
        "Port number for connecting to the SFTP server through VPC_LATTICE. Defaults to 22 if not \
         specified. Must match the port on which the target SFTP server is listening.\n"]
}
[@@ocaml.doc
  "VPC_LATTICE egress configuration that specifies the Resource Configuration ARN and port for \
   connecting to SFTP servers through customer VPCs. Requires a valid Resource Configuration with \
   appropriate network access.\n"]

type nonrec connector_egress_config =
  | VpcLattice of connector_vpc_lattice_egress_config
      [@ocaml.doc
        "VPC_LATTICE configuration for routing connector traffic through customer VPCs. Enables \
         private connectivity to SFTP servers without requiring public internet access or complex \
         network configurations.\n"]
[@@ocaml.doc
  "Configuration structure that defines how traffic is routed from the connector to the SFTP \
   server. Contains VPC Lattice settings when using VPC_LATTICE egress type for private \
   connectivity through customer VPCs.\n"]

type nonrec connector_egress_type = SERVICE_MANAGED [@ocaml.doc ""] | VPC_LATTICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connector_error_message = string [@@ocaml.doc ""]

type nonrec failure_code = string [@@ocaml.doc ""]

type nonrec transfer_table_status =
  | QUEUED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec file_path = string [@@ocaml.doc ""]

type nonrec connector_file_transfer_result = {
  file_path : file_path;
      [@ocaml.doc "The filename and path to where the file was sent to or retrieved from.\n"]
  status_code : transfer_table_status; [@ocaml.doc "The current status for the transfer.\n"]
  failure_code : failure_code option;
      [@ocaml.doc
        "For transfers that fail, this parameter contains a code indicating the reason. For \
         example, [RETRIEVE_FILE_NOT_FOUND] \n"]
  failure_message : message option;
      [@ocaml.doc "For transfers that fail, this parameter describes the reason for the failure.\n"]
}
[@@ocaml.doc
  "A structure that contains the details for files transferred using an SFTP connector, during a \
   single transfer.\n"]

type nonrec connector_file_transfer_results = connector_file_transfer_result list [@@ocaml.doc ""]

type nonrec connector_id = string [@@ocaml.doc ""]

type nonrec connector_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connector_security_policy_name = string [@@ocaml.doc ""]

type nonrec connector_status =
  | ACTIVE [@ocaml.doc ""]
  | ERRORED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connectors_ip_address_type = IPV4 [@ocaml.doc ""] | DUALSTACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_file_location = string [@@ocaml.doc ""]

type nonrec overwrite_existing = TRUE [@ocaml.doc ""] | FALSE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec efs_path = string [@@ocaml.doc ""]

type nonrec efs_file_system_id = string [@@ocaml.doc ""]

type nonrec efs_file_location = {
  file_system_id : efs_file_system_id option;
      [@ocaml.doc "The identifier of the file system, assigned by Amazon EFS.\n"]
  path : efs_path option; [@ocaml.doc "The pathname for the folder being used by a workflow.\n"]
}
[@@ocaml.doc
  "Specifies the details for the file location for the file that's being used in the workflow. \
   Only applicable if you are using Amazon Elastic File Systems (Amazon EFS) for storage.\n\n\
  \  \n\
  \ "]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_input_file_location = {
  bucket : s3_bucket option; [@ocaml.doc "Specifies the S3 bucket for the customer input file.\n"]
  key : s3_key option;
      [@ocaml.doc
        "The name assigned to the file when it was created in Amazon S3. You use the object key to \
         retrieve the object.\n"]
}
[@@ocaml.doc
  "Specifies the customer input Amazon S3 file location. If it is used inside \
   [copyStepDetails.DestinationFileLocation], it should be the S3 copy destination.\n\n\
  \  You need to provide the bucket and key. The key can represent either a path or a file. This \
   is determined by whether or not you end the key value with the forward slash (/) character. If \
   the final character is \"/\", then your file is copied to the folder, and its name does not \
   change. If, rather, the final character is alphanumeric, your uploaded file is renamed to the \
   path value. In this case, if a file with that name already exists, it is overwritten. \n\
  \ \n\
  \  For example, if your path is [shared-files/bob/], your uploaded files are copied to the \
   [shared-files/bob/], folder. If your path is [shared-files/today], each uploaded file is copied \
   to the [shared-files] folder and named [today]: each upload overwrites the previous version of \
   the {i bob} file.\n\
  \  "]

type nonrec input_file_location = {
  s3_file_location : s3_input_file_location option;
      [@ocaml.doc
        "Specifies the details for the Amazon S3 file that's being copied or decrypted.\n"]
  efs_file_location : efs_file_location option;
      [@ocaml.doc
        "Specifies the details for the Amazon Elastic File System (Amazon EFS) file that's being \
         decrypted.\n"]
}
[@@ocaml.doc "Specifies the location for the file that's being processed.\n"]

type nonrec workflow_step_name = string [@@ocaml.doc ""]

type nonrec copy_step_details = {
  name : workflow_step_name option; [@ocaml.doc "The name of the step, used as an identifier.\n"]
  destination_file_location : input_file_location option;
      [@ocaml.doc
        "Specifies the location for the file being copied. Use [${Transfer:UserName}] or \
         [${Transfer:UploadDate}] in this field to parametrize the destination prefix by username \
         or uploaded date.\n\n\
        \ {ul\n\
        \       {-  Set the value of [DestinationFileLocation] to [${Transfer:UserName}] to copy \
         uploaded files to an Amazon S3 bucket that is prefixed with the name of the Transfer \
         Family user that uploaded the file.\n\
        \           \n\
        \            }\n\
        \       {-  Set the value of [DestinationFileLocation] to [${Transfer:UploadDate}] to copy \
         uploaded files to an Amazon S3 bucket that is prefixed with the date of the upload.\n\
        \           \n\
        \             The system resolves [UploadDate] to a date format of {i YYYY-MM-DD}, based \
         on the date the file is uploaded in UTC.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  overwrite_existing : overwrite_existing option;
      [@ocaml.doc
        "A flag that indicates whether to overwrite an existing file of the same name. The default \
         is [FALSE].\n\n\
        \ If the workflow is processing a file that has the same name as an existing file, the \
         behavior is as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [OverwriteExisting] is [TRUE], the existing file is replaced with the file \
         being processed.\n\
        \            \n\
        \             }\n\
        \        {-  If [OverwriteExisting] is [FALSE], nothing happens, and the workflow \
         processing stops.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source_file_location : source_file_location option;
      [@ocaml.doc
        "Specifies which file to use as input to the workflow step: either the output from the \
         previous step, or the originally uploaded file for the workflow.\n\n\
        \ {ul\n\
        \       {-  To use the previous file as the input, enter [${previous.file}]. In this case, \
         this workflow step uses the output file from the previous workflow step as input. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       {-  To use the originally uploaded file location as input for this step, enter \
         [${original.file}].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Each step type has its own [StepDetails] structure.\n"]

type nonrec service_unavailable_exception = {
  message : service_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request has failed because the Amazon Web ServicesTransfer Family service is not available.\n"]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resource = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : message; [@ocaml.doc ""]
  resource : resource; [@ocaml.doc ""]
  resource_type : resource_type; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when a resource is not found by the Amazon Web ServicesTransfer Family \
   service.\n"]

type nonrec resource_exists_exception = {
  message : message; [@ocaml.doc ""]
  resource : resource; [@ocaml.doc ""]
  resource_type : resource_type; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested resource does not exist, or exists in a region other than the one specified for \
   the command.\n"]

type nonrec invalid_request_exception = { message : message [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when the client submits a malformed request.\n"]

type nonrec internal_service_error = { message : message [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when an error occurs in the Transfer Family service.\n"]

type nonrec external_id = string [@@ocaml.doc ""]

type nonrec create_access_response = {
  server_id : server_id; [@ocaml.doc "The identifier of the server that the user is attached to.\n"]
  external_id : external_id;
      [@ocaml.doc
        "The external identifier of the group whose users have access to your Amazon S3 or Amazon \
         EFS resources over the enabled protocols using Transfer Family.\n"]
}
[@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec posix_id = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec secondary_gids = posix_id list [@@ocaml.doc ""]

type nonrec posix_profile = {
  uid : posix_id; [@ocaml.doc "The POSIX user ID used for all EFS operations by this user.\n"]
  gid : posix_id; [@ocaml.doc "The POSIX group ID used for all EFS operations by this user.\n"]
  secondary_gids : secondary_gids option;
      [@ocaml.doc "The secondary POSIX group IDs used for all EFS operations by this user.\n"]
}
[@@ocaml.doc
  "The full POSIX identity, including user ID ([Uid]), group ID ([Gid]), and any secondary groups \
   IDs ([SecondaryGids]), that controls your users' access to your Amazon EFS file systems. The \
   POSIX permissions that are set on files and directories in your file system determine the level \
   of access your users get when transferring files into and out of your Amazon EFS file systems.\n"]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec map_type = FILE [@ocaml.doc ""] | DIRECTORY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec map_target = string [@@ocaml.doc ""]

type nonrec map_entry = string [@@ocaml.doc ""]

type nonrec home_directory_map_entry = {
  entry : map_entry; [@ocaml.doc "Represents an entry for [HomeDirectoryMappings].\n"]
  target : map_target;
      [@ocaml.doc "Represents the map target that is used in a [HomeDirectoryMapEntry].\n"]
  type_ : map_type option;
      [@ocaml.doc
        "Specifies the type of mapping. Set the type to [FILE] if you want the mapping to point to \
         a file, or [DIRECTORY] for the directory to point to a directory.\n\n\
        \  By default, home directory mappings have a [Type] of [DIRECTORY] when you create a \
         Transfer Family server. You would need to explicitly set [Type] to [FILE] if you want a \
         mapping to have a file target.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Represents an object that contains entries and targets for [HomeDirectoryMappings].\n\n\
  \ The following is an [Entry] and [Target] pair example for [chroot].\n\
  \ \n\
  \   [\\[ { \"Entry\": \"/\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
  \  "]

type nonrec home_directory_mappings = home_directory_map_entry list [@@ocaml.doc ""]

type nonrec home_directory_type = PATH [@ocaml.doc ""] | LOGICAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec home_directory = string [@@ocaml.doc ""]

type nonrec create_access_request = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ The following is an [Entry] and [Target] pair example.\n\
        \ \n\
        \   [\\[ { \"Entry\": \"/directory1\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \  \n\
        \   In most cases, you can use this value instead of the session policy to lock down your \
         user to the designated home directory (\"[chroot]\"). To do this, you can set [Entry] to \
         [/] and set [Target] to the [HomeDirectory] parameter value.\n\
        \   \n\
        \    The following is an [Entry] and [Target] pair example for [chroot].\n\
        \    \n\
        \      [\\[ { \"Entry\": \"/\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \     "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n\n\
        \  This policy applies only when the domain of [ServerId] is Amazon S3. Amazon EFS does \
         not use session policies.\n\
        \  \n\
        \   For session policies, Transfer Family stores the policy as a JSON blob, instead of the \
         Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it \
         in the [Policy] argument.\n\
        \   \n\
        \    For an example of a session policy, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html}Example \
         session policy}.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html}AssumeRole} in \
         the {i Security Token Service API Reference}.\n\
        \     \n\
        \      "]
  posix_profile : posix_profile option; [@ocaml.doc ""]
  role : role;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This is the specific server \
         that you added your user to.\n"]
  external_id : external_id;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec retry_after_seconds = string [@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : retry_after_seconds option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec create_agreement_response = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier for the agreement. Use this ID for deleting, or updating an \
         agreement, as well as in any other API calls that require that you specify the agreement \
         ID.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_directories_type = {
  failed_files_directory : home_directory;
      [@ocaml.doc "Specifies a location to store failed AS2 message files.\n"]
  mdn_files_directory : home_directory; [@ocaml.doc "Specifies a location to store MDN files.\n"]
  payload_files_directory : home_directory;
      [@ocaml.doc "Specifies a location to store the payload for AS2 message files.\n"]
  status_files_directory : home_directory;
      [@ocaml.doc "Specifies a location to store AS2 status messages.\n"]
  temporary_files_directory : home_directory;
      [@ocaml.doc "Specifies a location to store temporary AS2 message files.\n"]
}
[@@ocaml.doc "Contains Amazon S3 locations for storing specific types of AS2 message files.\n"]

type nonrec enforce_message_signing_type = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec preserve_filename_type = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The name assigned to the tag that you create.\n"]
  value : tag_value;
      [@ocaml.doc "Contains one or more values that you assigned to the key name you create.\n"]
}
[@@ocaml.doc
  "Creates a key-value pair for a specific resource. Tags are metadata that you can use to search \
   for and group a resource for various purposes. You can apply tags to servers, users, and roles. \
   A tag key can take more than one value. For example, to group servers for accounting purposes, \
   you might create a tag called [Group] and assign the values [Research] and [Accounting] to that \
   group.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec create_agreement_request = {
  description : description option;
      [@ocaml.doc "A name or short description to identify the agreement. \n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This is the specific server \
         that the agreement uses.\n"]
  local_profile_id : profile_id; [@ocaml.doc "A unique identifier for the AS2 local profile.\n"]
  partner_profile_id : profile_id;
      [@ocaml.doc "A unique identifier for the partner profile used in the agreement.\n"]
  base_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for files transferred by using the AS2 protocol.\n\n\
        \ A [BaseDirectory] example is \n\
        \ {[\n\
        \ /{i amzn-s3-demo-bucket}/home/mydirectory\n\
        \ ]}\n\
        \ .\n\
        \ "]
  access_role : role;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  status : agreement_status_type option;
      [@ocaml.doc
        "The status of the agreement. The agreement can be either [ACTIVE] or [INACTIVE].\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for agreements.\n"]
  preserve_filename : preserve_filename_type option;
      [@ocaml.doc
        " Determines whether or not Transfer Family appends a unique string of characters to the \
         end of the AS2 message payload filename when saving it. \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: the filename provided by your trading parter is preserved when the \
         file is saved.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): when Transfer Family saves the file, the filename \
         is adjusted, as described in \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2}File \
         names and locations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  enforce_message_signing : enforce_message_signing_type option;
      [@ocaml.doc
        " Determines whether or not unsigned messages from your trading partners will be accepted. \
         \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: Transfer Family rejects unsigned messages from your trading partner.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): Transfer Family accepts unsigned messages from \
         your trading partner.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  custom_directories : custom_directories_type option;
      [@ocaml.doc
        "A [CustomDirectoriesType] structure. This structure specifies custom directories for \
         storing various AS2 message files. You can specify directories for the following types of \
         files.\n\n\
        \ {ul\n\
        \       {-  Failed files\n\
        \           \n\
        \            }\n\
        \       {-  MDN files\n\
        \           \n\
        \            }\n\
        \       {-  Payload files\n\
        \           \n\
        \            }\n\
        \       {-  Status files\n\
        \           \n\
        \            }\n\
        \       {-  Temporary files\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_connector_response = {
  connector_id : connector_id;
      [@ocaml.doc
        "The unique identifier for the connector, returned after the API call succeeds.\n"]
}
[@@ocaml.doc ""]

type nonrec max_concurrent_connections = int [@@ocaml.doc ""]

type nonrec sftp_connector_trusted_host_key = string [@@ocaml.doc ""]

type nonrec sftp_connector_trusted_host_key_list = sftp_connector_trusted_host_key list
[@@ocaml.doc ""]

type nonrec secret_id = string [@@ocaml.doc ""]

type nonrec sftp_connector_config = {
  user_secret_id : secret_id option;
      [@ocaml.doc
        "The identifier for the secret (in Amazon Web Services Secrets Manager) that contains the \
         SFTP user's private key, password, or both. The identifier must be the Amazon Resource \
         Name (ARN) of the secret.\n\n\
        \  {ul\n\
        \        {-  Required when creating an SFTP connector\n\
        \            \n\
        \             }\n\
        \        {-  Optional when updating an existing SFTP connector\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  trusted_host_keys : sftp_connector_trusted_host_key_list option;
      [@ocaml.doc
        "The public portion of the host key, or keys, that are used to identify the external \
         server to which you are connecting. You can use the [ssh-keyscan] command against the \
         SFTP server to retrieve the necessary key.\n\n\
        \   [TrustedHostKeys] is optional for [CreateConnector]. If not provided, you can use \
         [TestConnection] to retrieve the server host key during the initial connection attempt, \
         and subsequently update the connector with the observed host key.\n\
        \  \n\
        \    When creating connectors with egress config (VPC_LATTICE type connectors), since host \
         name is not something we can verify, the only accepted trusted host key format is \
         [key-type key-body] without the host name. For example: [ssh-rsa \
         AAAAB3Nza...<long-string-for-public-key>] \n\
        \    \n\
        \     The three standard SSH public key format elements are [<key type>], [<body base64>], \
         and an optional [<comment>], with spaces between each element. Specify only the [<key \
         type>] and [<body base64>]: do not enter the [<comment>] portion of the key.\n\
        \     \n\
        \      For the trusted host key, Transfer Family accepts RSA and ECDSA keys.\n\
        \      \n\
        \       {ul\n\
        \             {-  For RSA keys, the [<key type>] string is [ssh-rsa].\n\
        \                 \n\
        \                  }\n\
        \             {-  For ECDSA keys, the [<key type>] string is either [ecdsa-sha2-nistp256], \
         [ecdsa-sha2-nistp384], or [ecdsa-sha2-nistp521], depending on the size of the key you \
         generated.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \   Run this command to retrieve the SFTP server host key, where your SFTP server name is \
         [ftp.host.com].\n\
        \   \n\
        \     [ssh-keyscan ftp.host.com] \n\
        \    \n\
        \     This prints the public host key to standard output.\n\
        \     \n\
        \       [ftp.host.com ssh-rsa AAAAB3Nza...<long-string-for-public-key>] \n\
        \      \n\
        \       Copy and paste this string into the [TrustedHostKeys] field for the \
         [create-connector] command or into the {b Trusted host keys} field in the console.\n\
        \       \n\
        \        For VPC Lattice type connectors (VPC_LATTICE), remove the hostname from the key \
         and use only the [key-type key-body] format. In this example, it should be: [ssh-rsa \
         AAAAB3Nza...<long-string-for-public-key>] \n\
        \        "]
  max_concurrent_connections : max_concurrent_connections option;
      [@ocaml.doc
        "Specify the number of concurrent connections that your connector creates to the remote \
         server. The default value is [1]. The maximum values is [5].\n\n\
        \  If you are using the Amazon Web Services Management Console, the default value is [5].\n\
        \  \n\
        \    This parameter specifies the number of active connections that your connector can \
         establish with the remote server at the same time. Increasing this value can enhance \
         connector performance when transferring large file batches by enabling parallel \
         operations.\n\
        \    "]
}
[@@ocaml.doc
  "Contains the details for an SFTP connector object. The connector object is used for \
   transferring files to and from a partner's SFTP server.\n"]

type nonrec create_connector_request = {
  url : url option;
      [@ocaml.doc
        "The URL of the partner's AS2 or SFTP endpoint.\n\n\
        \ When creating AS2 connectors or service-managed SFTP connectors (connectors without \
         egress configuration), you must provide a URL to specify the remote server endpoint. For \
         VPC Lattice type connectors, the URL must be null.\n\
        \ "]
  as2_config : as2_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an AS2 connector object.\n"]
  access_role : role;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  logging_role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a connector to turn on CloudWatch logging for Amazon S3 events. When set, you can \
         view connector activity in your CloudWatch logs.\n"]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that can be used to group and search for connectors. Tags are metadata \
         attached to connectors for any purpose.\n"]
  sftp_config : sftp_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an SFTP connector object.\n"]
  security_policy_name : connector_security_policy_name option;
      [@ocaml.doc "Specifies the name of the security policy for the connector.\n"]
  egress_config : connector_egress_config option;
      [@ocaml.doc
        "Specifies the egress configuration for the connector, which determines how traffic is \
         routed from the connector to the SFTP server. When set to VPC, enables routing through \
         customer VPCs using VPC_LATTICE for private connectivity.\n"]
  ip_address_type : connectors_ip_address_type option;
      [@ocaml.doc
        "Specifies the IP address type for the connector's network connections. When set to \
         [IPV4], the connector uses IPv4 addresses only. When set to [DUALSTACK], the connector \
         supports both IPv4 and IPv6 addresses, with IPv6 preferred when available.\n"]
}
[@@ocaml.doc ""]

type nonrec create_profile_response = {
  profile_id : profile_id;
      [@ocaml.doc
        "The unique identifier for the AS2 profile, returned after the API call succeeds.\n"]
}
[@@ocaml.doc ""]

type nonrec profile_type = LOCAL [@ocaml.doc ""] | PARTNER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_profile_request = {
  as2_id : as2_id;
      [@ocaml.doc
        "The [As2Id] is the {i AS2-name}, as defined in the \
         {{:https://datatracker.ietf.org/doc/html/rfc4130}RFC 4130}. For inbound transfers, this \
         is the [AS2-From] header for the AS2 messages sent from the partner. For outbound \
         connectors, this is the [AS2-To] header for the AS2 messages sent to the partner using \
         the [StartFileTransfer] API operation. This ID cannot include spaces.\n"]
  profile_type : profile_type;
      [@ocaml.doc
        "Determines the type of profile to create:\n\n\
        \ {ul\n\
        \       {-  Specify [LOCAL] to create a local profile. A local profile represents the \
         AS2-enabled Transfer Family server organization or party.\n\
        \           \n\
        \            }\n\
        \       {-  Specify [PARTNER] to create a partner profile. A partner profile represents a \
         remote organization, external to Transfer Family.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  certificate_ids : certificate_ids option;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for AS2 profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec create_server_response = {
  server_id : server_id;
      [@ocaml.doc "The service-assigned identifier of the server that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_type = IPV4 [@ocaml.doc ""] | DUALSTACK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec directory_listing_optimization = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc
  "Indicates whether optimization to directory listing on S3 servers is used. Disabled by default \
   for compatibility."]

type nonrec s3_storage_options = {
  directory_listing_optimization : directory_listing_optimization option;
      [@ocaml.doc
        "Specifies whether or not performance for your Amazon S3 directories is optimized.\n\n\
        \ {ul\n\
        \       {-  If using the console, this is enabled by default.\n\
        \           \n\
        \            }\n\
        \       {-  If using the API or CLI, this is disabled by default.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, home directory mappings have a [TYPE] of [DIRECTORY]. If you enable this \
         option, you would then need to explicitly set the [HomeDirectoryMapEntry] [Type] to \
         [FILE] if you want a mapping to have a file target.\n\
        \   "]
}
[@@ocaml.doc "The Amazon S3 storage options that are configured for your server.\n"]

type nonrec structured_log_destinations = arn list [@@ocaml.doc ""]

type nonrec workflow_id = string [@@ocaml.doc ""]

type nonrec workflow_detail = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
  execution_role : role;
      [@ocaml.doc
        "Includes the necessary permissions for S3, EFS, and Lambda operations that Transfer can \
         assume, so that all workflow steps can operate on the required resources\n"]
}
[@@ocaml.doc
  "Specifies the workflow ID for the workflow to assign and the execution role that's used for \
   executing the workflow.\n\n\
  \ In addition to a workflow to execute when a file is uploaded completely, [WorkflowDetails] can \
   also contain a workflow ID (and execution role) for a workflow to execute on partial upload. A \
   partial upload occurs when the server session disconnects while the file is still being \
   uploaded.\n\
  \ "]

type nonrec on_partial_upload_workflow_details = workflow_detail list [@@ocaml.doc ""]

type nonrec on_upload_workflow_details = workflow_detail list [@@ocaml.doc ""]

type nonrec workflow_details = {
  on_upload : on_upload_workflow_details option;
      [@ocaml.doc
        "A trigger that starts a workflow: the workflow begins to execute after a file is \
         uploaded.\n\n\
        \ To remove an associated workflow from a server, you can provide an empty [OnUpload] \
         object, as in the following example.\n\
        \ \n\
        \   [aws transfer update-server --server-id s-01234567890abcdef --workflow-details \
         '{\"OnUpload\":\\[\\]}'] \n\
        \  \n\
        \     [OnUpload] can contain a maximum of one [WorkflowDetail] object.\n\
        \    \n\
        \     "]
  on_partial_upload : on_partial_upload_workflow_details option;
      [@ocaml.doc
        "A trigger that starts a workflow if a file is only partially uploaded. You can attach a \
         workflow to a server that executes whenever there is a partial upload.\n\n\
        \ A {i partial upload} occurs when a file is open when the session disconnects.\n\
        \ \n\
        \    [OnPartialUpload] can contain a maximum of one [WorkflowDetail] object.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc
  "Container for the [WorkflowDetail] data type. It is used by actions that trigger a workflow to \
   begin execution.\n"]

type nonrec security_policy_name = string [@@ocaml.doc ""]

type nonrec set_stat_option = DEFAULT [@ocaml.doc ""] | ENABLE_NO_OP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tls_session_resumption_mode =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENFORCED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec passive_ip = string [@@ocaml.doc ""]

type nonrec protocol_details = {
  passive_ip : passive_ip option;
      [@ocaml.doc
        " Indicates passive mode, for FTP and FTPS protocols. Enter a single IPv4 address, such as \
         the public IP address of a firewall, router, or load balancer. For example: \n\n\
        \  [aws transfer update-server --protocol-details PassiveIp=0.0.0.0] \n\
        \ \n\
        \  Replace [0.0.0.0] in the example above with the actual IP address you want to use.\n\
        \  \n\
        \     If you change the [PassiveIp] value, you must stop and then restart your Transfer \
         Family server for the change to take effect. For details on using passive mode (PASV) in \
         a NAT environment, see \
         {{:http://aws.amazon.com/blogs/storage/configuring-your-ftps-server-behind-a-firewall-or-nat-with-aws-transfer-family/}Configuring \
         your FTPS server behind a firewall or NAT with Transfer Family}. \n\
        \    \n\
        \     Additionally, avoid placing Network Load Balancers (NLBs) or NAT gateways in front \
         of Transfer Family servers. This configuration increases costs and can cause performance \
         issues. When NLBs or NATs are in the communication path, Transfer Family cannot \
         accurately recognize client IP addresses, which impacts connection sharding and limits \
         FTPS servers to only 300 simultaneous connections instead of 10,000. If you must use an \
         NLB, use port 21 for health checks and enable TLS session resumption by setting \
         [TlsSessionResumptionMode = ENFORCED]. For optimal performance, migrate to VPC endpoints \
         with Elastic IP addresses instead of using NLBs. For more details, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations} \
         Avoid placing NLBs and NATs in front of Transfer Family}. \n\
        \     \n\
        \        {i Special values} \n\
        \       \n\
        \        The [AUTO] and [0.0.0.0] are special values for the [PassiveIp] parameter. The \
         value [PassiveIp=AUTO] is assigned by default to FTP and FTPS type servers. In this case, \
         the server automatically responds with one of the endpoint IPs within the PASV response. \
         [PassiveIp=0.0.0.0] has a more unique application for its usage. For example, if you have \
         a High Availability (HA) Network Load Balancer (NLB) environment, where you have 3 \
         subnets, you can only specify a single IP address using the [PassiveIp] parameter. This \
         reduces the effectiveness of having High Availability. In this case, you can specify \
         [PassiveIp=0.0.0.0]. This tells the client to use the same IP address as the Control \
         connection and utilize all AZs for their connections. Note, however, that not all FTP \
         clients support the [PassiveIp=0.0.0.0] response. FileZilla and WinSCP do support it. If \
         you are using other clients, check to see if your client supports the [PassiveIp=0.0.0.0] \
         response.\n\
        \        "]
  tls_session_resumption_mode : tls_session_resumption_mode option;
      [@ocaml.doc
        "A property used with Transfer Family servers that use the FTPS protocol. TLS Session \
         Resumption provides a mechanism to resume or share a negotiated secret key between the \
         control and data connection for an FTPS session. [TlsSessionResumptionMode] determines \
         whether or not the server resumes recent, negotiated sessions through a unique session \
         ID. This property is available during [CreateServer] and [UpdateServer] calls. If a \
         [TlsSessionResumptionMode] value is not specified during [CreateServer], it is set to \
         [ENFORCED] by default.\n\n\
        \ {ul\n\
        \       {-   [DISABLED]: the server does not process TLS session resumption client \
         requests and creates a new TLS session for each request. \n\
        \           \n\
        \            }\n\
        \       {-   [ENABLED]: the server processes and accepts clients that are performing TLS \
         session resumption. The server doesn't reject client data connections that do not perform \
         the TLS session resumption client processing.\n\
        \           \n\
        \            }\n\
        \       {-   [ENFORCED]: the server processes and accepts clients that are performing TLS \
         session resumption. The server rejects client data connections that do not perform the \
         TLS session resumption client processing. Before you set the value to [ENFORCED], test \
         your clients.\n\
        \           \n\
        \             Not all FTPS clients perform TLS session resumption. So, if you choose to \
         enforce TLS session resumption, you prevent any connections from FTPS clients that don't \
         perform the protocol negotiation. To determine whether or not you can use the [ENFORCED] \
         value, you need to test your clients.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  set_stat_option : set_stat_option option;
      [@ocaml.doc
        "Use the [SetStatOption] to ignore the error that is generated when the client attempts to \
         use [SETSTAT] on a file you are uploading to an S3 bucket.\n\n\
        \ Some SFTP file transfer clients can attempt to change the attributes of remote files, \
         including timestamp and permissions, using commands, such as [SETSTAT] when uploading the \
         file. However, these commands are not compatible with object storage systems, such as \
         Amazon S3. Due to this incompatibility, file uploads from these clients can result in \
         errors even when the file is otherwise successfully uploaded.\n\
        \ \n\
        \  Set the value to [ENABLE_NO_OP] to have the Transfer Family server ignore the [SETSTAT] \
         command, and upload files without needing to make any changes to your SFTP client. While \
         the [SetStatOption] [ENABLE_NO_OP] setting ignores the error, it does generate a log \
         entry in Amazon CloudWatch Logs, so you can determine when the client is making a \
         [SETSTAT] call.\n\
        \  \n\
        \    If you want to preserve the original timestamp for your file, and modify other file \
         attributes using [SETSTAT], you can use Amazon EFS as backend storage with Transfer \
         Family.\n\
        \    \n\
        \     "]
  as2_transports : as2_transports option;
      [@ocaml.doc
        "Indicates the transport method for the AS2 messages. Currently, only HTTP is supported.\n"]
}
[@@ocaml.doc " The protocol settings that are configured for your server. \n"]

type nonrec protocol =
  | SFTP [@ocaml.doc ""]
  | FTP [@ocaml.doc ""]
  | FTPS [@ocaml.doc ""]
  | AS2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protocols = protocol list [@@ocaml.doc ""]

type nonrec pre_authentication_login_banner = string [@@ocaml.doc ""]

type nonrec post_authentication_login_banner = string [@@ocaml.doc ""]

type nonrec nullable_role = string [@@ocaml.doc ""]

type nonrec identity_provider_type =
  | SERVICE_MANAGED [@ocaml.doc ""]
  | API_GATEWAY [@ocaml.doc ""]
  | AWS_DIRECTORY_SERVICE [@ocaml.doc ""]
  | AWS_LAMBDA [@ocaml.doc ""]
[@@ocaml.doc
  "The mode of authentication for a server. The default value is [SERVICE_MANAGED], which allows \
   you to store and access user credentials within the Transfer Family service.\n\n\
  \ Use [AWS_DIRECTORY_SERVICE] to provide access to Active Directory groups in Directory Service \
   for Microsoft Active Directory or Microsoft Active Directory in your on-premises environment or \
   in Amazon Web Services using AD Connector. This option also requires you to provide a Directory \
   ID by using the [IdentityProviderDetails] parameter.\n\
  \ \n\
  \  Use the [API_GATEWAY] value to integrate with an identity provider of your choosing. The \
   [API_GATEWAY] setting requires you to provide an Amazon API Gateway endpoint URL to call for \
   authentication by using the [IdentityProviderDetails] parameter.\n\
  \  \n\
  \   Use the [AWS_LAMBDA] value to directly use an Lambda function as your identity provider. If \
   you choose this value, you must specify the ARN for the Lambda function in the [Function] \
   parameter for the [IdentityProviderDetails] data type.\n\
  \   "]

type nonrec sftp_authentication_methods =
  | PASSWORD [@ocaml.doc ""]
  | PUBLIC_KEY [@ocaml.doc ""]
  | PUBLIC_KEY_OR_PASSWORD [@ocaml.doc ""]
  | PUBLIC_KEY_AND_PASSWORD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec \#function = string [@@ocaml.doc ""]

type nonrec directory_id = string [@@ocaml.doc ""]

type nonrec identity_provider_details = {
  url : url option;
      [@ocaml.doc "Provides the location of the service endpoint used to authenticate users.\n"]
  invocation_role : role option;
      [@ocaml.doc
        "This parameter is only applicable if your [IdentityProviderType] is [API_GATEWAY]. \
         Provides the type of [InvocationRole] used to authenticate the user account.\n"]
  directory_id : directory_id option;
      [@ocaml.doc
        "The identifier of the Directory Service directory that you want to use as your identity \
         provider.\n"]
  \#function : \#function option;
      [@ocaml.doc "The ARN for a Lambda function to use for the Identity provider.\n"]
  sftp_authentication_methods : sftp_authentication_methods option;
      [@ocaml.doc
        "For SFTP-enabled servers, and for custom identity providers {i only}, you can specify \
         whether to authenticate using a password, SSH key pair, or both.\n\n\
        \ {ul\n\
        \       {-   [PASSWORD] - users must provide their password to connect.\n\
        \           \n\
        \            }\n\
        \       {-   [PUBLIC_KEY] - users must provide their private key to connect.\n\
        \           \n\
        \            }\n\
        \       {-   [PUBLIC_KEY_OR_PASSWORD] - users can authenticate with either their password \
         or their key. This is the default value.\n\
        \           \n\
        \            }\n\
        \       {-   [PUBLIC_KEY_AND_PASSWORD] - users must provide both their private key and \
         their password to connect. The server checks the key first, and then if the key is valid, \
         the system prompts for a password. If the private key provided does not match the public \
         key that is stored, authentication fails.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Returns information related to the type of user authentication that is in use for a file \
   transfer protocol-enabled server's users. A server can have only one method of authentication.\n"]

type nonrec host_key = string [@@ocaml.doc ""]

type nonrec endpoint_type =
  | PUBLIC [@ocaml.doc ""]
  | VPC [@ocaml.doc ""]
  | VPC_ENDPOINT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec endpoint_details = {
  address_allocation_ids : address_allocation_ids option;
      [@ocaml.doc
        "A list of address allocation IDs that are required to attach an Elastic IP address to \
         your server's endpoint.\n\n\
        \ An address allocation ID corresponds to the allocation ID of an Elastic IP address. This \
         value can be retrieved from the [allocationId] field from the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Address.html}Address} data \
         type. One way to retrieve this value is by calling the EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeAddresses.html}DescribeAddresses} \
         API.\n\
        \ \n\
        \  This parameter is optional. Set this parameter if you want to make your VPC endpoint \
         public-facing. For details, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#create-internet-facing-endpoint}Create \
         an internet-facing endpoint for your server}.\n\
        \  \n\
        \    This property can only be set as follows:\n\
        \    \n\
        \     {ul\n\
        \           {-   [EndpointType] must be set to [VPC] \n\
        \               \n\
        \                }\n\
        \           {-  The Transfer Family server must be offline.\n\
        \               \n\
        \                }\n\
        \           {-  You cannot set this parameter for Transfer Family servers that use the FTP \
         protocol.\n\
        \               \n\
        \                }\n\
        \           {-  The server must already have [SubnetIds] populated ([SubnetIds] and \
         [AddressAllocationIds] cannot be updated simultaneously).\n\
        \               \n\
        \                }\n\
        \           {-   [AddressAllocationIds] can't contain duplicates, and must be equal in \
         length to [SubnetIds]. For example, if you have three subnet IDs, you must also specify \
         three address allocation IDs.\n\
        \               \n\
        \                }\n\
        \           {-  Call the [UpdateServer] API to set or change this parameter.\n\
        \               \n\
        \                }\n\
        \           {-  You can't set address allocation IDs for servers that have an \
         [IpAddressType] set to [DUALSTACK] You can only set this property if [IpAddressType] is \
         set to [IPV4].\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "A list of subnet IDs that are required to host your server endpoint in your VPC.\n\n\
        \  This property can only be set when [EndpointType] is set to [VPC].\n\
        \  \n\
        \   "]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc
        "The identifier of the VPC endpoint.\n\n\
        \  This property can only be set when [EndpointType] is set to [VPC_ENDPOINT].\n\
        \  \n\
        \   For more information, see \
         https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.\n\
        \   \n\
        \    "]
  vpc_id : vpc_id option;
      [@ocaml.doc
        "The VPC identifier of the VPC in which a server's endpoint will be hosted.\n\n\
        \  This property can only be set when [EndpointType] is set to [VPC].\n\
        \  \n\
        \   "]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "A list of security groups IDs that are available to attach to your server's endpoint.\n\n\
        \  While [SecurityGroupIds] appears in the response syntax for consistency with \
         [CreateServer] and [UpdateServer] operations, this field is not populated in \
         [DescribeServer] responses. Security groups are managed at the VPC endpoint level and can \
         be modified outside of the Transfer Family service. To retrieve current security group \
         information, use the EC2 [DescribeVpcEndpoints] API with the [VpcEndpointId] returned in \
         the response.\n\
        \  \n\
        \   This property can only be set when [EndpointType] is set to [VPC].\n\
        \   \n\
        \    You can edit the [SecurityGroupIds] property in the \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/API_UpdateServer.html}UpdateServer} \
         API only if you are changing the [EndpointType] from [PUBLIC] or [VPC_ENDPOINT] to [VPC]. \
         To change security groups associated with your server's VPC endpoint after creation, use \
         the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyVpcEndpoint.html}ModifyVpcEndpoint} \
         API.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The virtual private cloud (VPC) endpoint settings that are configured for your file transfer \
   protocol-enabled server. With a VPC endpoint, you can restrict access to your server and \
   resources only within your VPC. To control incoming internet traffic, invoke the [UpdateServer] \
   API and attach an Elastic IP address to your server's endpoint.\n\n\
  \   After May 19, 2021, you won't be able to create a server using [EndpointType=VPC_ENDPOINT] \
   in your Amazon Web Services account if your account hasn't already done so before May 19, 2021. \
   If you have already created servers with [EndpointType=VPC_ENDPOINT] in your Amazon Web \
   Services account on or before May 19, 2021, you will not be affected. After this date, use \
   [EndpointType]=[VPC].\n\
  \  \n\
  \   For more information, see \
   https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.\n\
  \   \n\
  \    It is recommended that you use [VPC] as the [EndpointType]. With this endpoint type, you \
   have the option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with \
   your server's endpoint and use VPC security groups to restrict traffic by the client's public \
   IP address. This is not possible with [EndpointType] set to [VPC_ENDPOINT].\n\
  \    \n\
  \     "]

type nonrec domain = S3 [@ocaml.doc ""] | EFS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_server_request = {
  certificate : certificate option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Certificate Manager (ACM) certificate. Required \
         when [Protocols] is set to [FTPS].\n\n\
        \ To request a new public certificate, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html}Request a \
         public certificate} in the {i Certificate Manager User Guide}.\n\
        \ \n\
        \  To import an existing certificate into ACM, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         certificates into ACM} in the {i Certificate Manager User Guide}.\n\
        \  \n\
        \   To request a private certificate to use FTPS through private IP addresses, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html}Request a \
         private certificate} in the {i Certificate Manager User Guide}.\n\
        \   \n\
        \    Certificates with the following cryptographic algorithms and key sizes are supported:\n\
        \    \n\
        \     {ul\n\
        \           {-  2048-bit RSA (RSA_2048)\n\
        \               \n\
        \                }\n\
        \           {-  4096-bit RSA (RSA_4096)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 256 bit (EC_prime256v1)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 384 bit (EC_secp384r1)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 521 bit (EC_secp521r1)\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    The certificate must be a valid SSL/TLS X.509 version 3 certificate with FQDN or IP \
         address specified and information about the issuer.\n\
        \    \n\
        \     "]
  domain : domain option;
      [@ocaml.doc
        "The domain of the storage system that is used for file transfers. There are two domains \
         available: Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File System \
         (Amazon EFS). The default value is S3.\n\n\
        \  After the server is created, the domain cannot be changed.\n\
        \  \n\
        \   "]
  endpoint_details : endpoint_details option;
      [@ocaml.doc
        "The virtual private cloud (VPC) endpoint settings that are configured for your server. \
         When you host your endpoint within your VPC, you can make your endpoint accessible only \
         to resources within your VPC, or you can attach Elastic IP addresses and make your \
         endpoint accessible to clients over the internet. Your VPC's default security groups are \
         automatically assigned to your endpoint.\n"]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "The type of endpoint that you want your server to use. You can choose to make your \
         server's endpoint publicly accessible (PUBLIC) or host it inside your VPC. With an \
         endpoint that is hosted in a VPC, you can restrict access to your server and resources \
         only within your VPC or choose to make it internet facing by attaching Elastic IP \
         addresses directly to it.\n\n\
        \   After May 19, 2021, you won't be able to create a server using \
         [EndpointType=VPC_ENDPOINT] in your Amazon Web Services account if your account hasn't \
         already done so before May 19, 2021. If you have already created servers with \
         [EndpointType=VPC_ENDPOINT] in your Amazon Web Services account on or before May 19, \
         2021, you will not be affected. After this date, use [EndpointType]=[VPC].\n\
        \  \n\
        \   For more information, see \
         https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.\n\
        \   \n\
        \    It is recommended that you use [VPC] as the [EndpointType]. With this endpoint type, \
         you have the option to directly associate up to three Elastic IPv4 addresses (BYO IP \
         included) with your server's endpoint and use VPC security groups to restrict traffic by \
         the client's public IP address. This is not possible with [EndpointType] set to \
         [VPC_ENDPOINT].\n\
        \    \n\
        \     "]
  host_key : host_key option;
      [@ocaml.doc
        "The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled server. You can add \
         multiple host keys, in case you want to rotate keys, or have a set of active keys that \
         use different algorithms.\n\n\
        \ Use the following command to generate an RSA 2048 bit key with no passphrase:\n\
        \ \n\
        \   [ssh-keygen -t rsa -b 2048 -N \"\" -m PEM -f my-new-server-key].\n\
        \  \n\
        \   Use a minimum value of 2048 for the [-b] option. You can create a stronger key by \
         using 3072 or 4096.\n\
        \   \n\
        \    Use the following command to generate an ECDSA 256 bit key with no passphrase:\n\
        \    \n\
        \      [ssh-keygen -t ecdsa -b 256 -N \"\" -m PEM -f my-new-server-key].\n\
        \     \n\
        \      Valid values for the [-b] option for ECDSA are 256, 384, and 521.\n\
        \      \n\
        \       Use the following command to generate an ED25519 key with no passphrase:\n\
        \       \n\
        \         [ssh-keygen -t ed25519 -N \"\" -f my-new-server-key].\n\
        \        \n\
        \         For all of these commands, you can replace {i my-new-server-key} with a string \
         of your choice.\n\
        \         \n\
        \           If you aren't planning to migrate existing users from an existing SFTP-enabled \
         server to a new server, don't update the host key. Accidentally changing a server's host \
         key can be disruptive.\n\
        \           \n\
        \             For more information, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key}Manage \
         host keys for your SFTP-enabled server} in the {i Transfer Family User Guide}.\n\
        \             "]
  identity_provider_details : identity_provider_details option;
      [@ocaml.doc
        "Required when [IdentityProviderType] is set to [AWS_DIRECTORY_SERVICE], [Amazon Web \
         Services_LAMBDA] or [API_GATEWAY]. Accepts an array containing all of the information \
         required to use a directory in [AWS_DIRECTORY_SERVICE] or invoke a customer-supplied \
         authentication API, including the API Gateway URL. Cannot be specified when \
         [IdentityProviderType] is set to [SERVICE_MANAGED].\n"]
  identity_provider_type : identity_provider_type option;
      [@ocaml.doc
        "The mode of authentication for a server. The default value is [SERVICE_MANAGED], which \
         allows you to store and access user credentials within the Transfer Family service.\n\n\
        \ Use [AWS_DIRECTORY_SERVICE] to provide access to Active Directory groups in Directory \
         Service for Microsoft Active Directory or Microsoft Active Directory in your on-premises \
         environment or in Amazon Web Services using AD Connector. This option also requires you \
         to provide a Directory ID by using the [IdentityProviderDetails] parameter.\n\
        \ \n\
        \  Use the [API_GATEWAY] value to integrate with an identity provider of your choosing. \
         The [API_GATEWAY] setting requires you to provide an Amazon API Gateway endpoint URL to \
         call for authentication by using the [IdentityProviderDetails] parameter.\n\
        \  \n\
        \   Use the [AWS_LAMBDA] value to directly use an Lambda function as your identity \
         provider. If you choose this value, you must specify the ARN for the Lambda function in \
         the [Function] parameter for the [IdentityProviderDetails] data type.\n\
        \   "]
  logging_role : nullable_role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a server to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. \
         When set, you can view user activity in your CloudWatch logs.\n"]
  post_authentication_login_banner : post_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         after the user authenticates.\n\n\
        \  The SFTP protocol does not support post-authentication display banners.\n\
        \  \n\
        \   "]
  pre_authentication_login_banner : pre_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         before the user authenticates. For example, the following banner displays details about \
         using the system:\n\n\
        \  [This system is for the use of authorized users only. Individuals using this computer \
         system without authority, or in excess of their authority, are subject to having all of \
         their activities on this system monitored and recorded by system personnel.] \n\
        \ "]
  protocols : protocols option;
      [@ocaml.doc
        "Specifies the file transfer protocol or protocols over which your file transfer protocol \
         client can connect to your server's endpoint. The available protocols are:\n\n\
        \ {ul\n\
        \       {-   [SFTP] (Secure Shell (SSH) File Transfer Protocol): File transfer over SSH\n\
        \           \n\
        \            }\n\
        \       {-   [FTPS] (File Transfer Protocol Secure): File transfer with TLS encryption\n\
        \           \n\
        \            }\n\
        \       {-   [FTP] (File Transfer Protocol): Unencrypted file transfer\n\
        \           \n\
        \            }\n\
        \       {-   [AS2] (Applicability Statement 2): used for transporting structured \
         business-to-business data\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    {ul\n\
        \          {-  If you select [FTPS], you must choose a certificate stored in Certificate \
         Manager (ACM) which is used to identify your server when clients connect to it over FTPS.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes either [FTP] or [FTPS], then the [EndpointType] must \
         be [VPC] and the [IdentityProviderType] must be either [AWS_DIRECTORY_SERVICE], \
         [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [FTP], then [AddressAllocationIds] cannot be \
         associated.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] is set only to [SFTP], the [EndpointType] can be set to \
         [PUBLIC] and the [IdentityProviderType] can be set any of the supported identity types: \
         [SERVICE_MANAGED], [AWS_DIRECTORY_SERVICE], [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [AS2], then the [EndpointType] must be [VPC], and \
         domain must be Amazon S3.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  protocol_details : protocol_details option;
      [@ocaml.doc
        "The protocol settings that are configured for your server.\n\n\
        \  Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of Transfer Family \
         servers, as this increases costs and can cause performance issues, including reduced \
         connection limits for FTPS. For more details, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations} \
         Avoid placing NLBs and NATs in front of Transfer Family}.\n\
        \  \n\
        \    {ul\n\
        \          {-   To indicate passive mode (for FTP and FTPS protocols), use the [PassiveIp] \
         parameter. Enter a single dotted-quad IPv4 address, such as the external IP address of a \
         firewall, router, or load balancer. \n\
        \              \n\
        \               }\n\
        \          {-  To ignore the error that is generated when the client attempts to use the \
         [SETSTAT] command on a file that you are uploading to an Amazon S3 bucket, use the \
         [SetStatOption] parameter. To have the Transfer Family server ignore the [SETSTAT] \
         command and upload files without needing to make any changes to your SFTP client, set the \
         value to [ENABLE_NO_OP]. If you set the [SetStatOption] parameter to [ENABLE_NO_OP], \
         Transfer Family generates a log entry to Amazon CloudWatch Logs, so that you can \
         determine when the client is making a [SETSTAT] call.\n\
        \              \n\
        \               }\n\
        \          {-  To determine whether your Transfer Family server resumes recent, negotiated \
         sessions through a unique session ID, use the [TlsSessionResumptionMode] parameter.\n\
        \              \n\
        \               }\n\
        \          {-   [As2Transports] indicates the transport method for the AS2 messages. \
         Currently, only HTTP is supported.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  security_policy_name : security_policy_name option;
      [@ocaml.doc "Specifies the name of the security policy for the server.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for servers.\n"]
  workflow_details : workflow_details option;
      [@ocaml.doc
        "Specifies the workflow ID for the workflow to assign and the execution role that's used \
         for executing the workflow.\n\n\
        \ In addition to a workflow to execute when a file is uploaded completely, \
         [WorkflowDetails] can also contain a workflow ID (and execution role) for a workflow to \
         execute on partial upload. A partial upload occurs when the server session disconnects \
         while the file is still being uploaded.\n\
        \ "]
  structured_log_destinations : structured_log_destinations option;
      [@ocaml.doc
        "Specifies the log groups to which your server logs are sent.\n\n\
        \ To specify a log group, you must provide the ARN for an existing log group. In this \
         case, the format of the log group is as follows:\n\
        \ \n\
        \   [arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*] \n\
        \  \n\
        \   For example, [arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*] \n\
        \   \n\
        \    If you have previously specified a log group for a server, you can clear it, and in \
         effect turn off structured logging, by providing an empty value for this parameter in an \
         [update-server] call. For example:\n\
        \    \n\
        \      [update-server --server-id s-1234567890abcdef0 --structured-log-destinations] \n\
        \     "]
  s3_storage_options : s3_storage_options option;
      [@ocaml.doc
        "Specifies whether or not performance for your Amazon S3 directories is optimized.\n\n\
        \ {ul\n\
        \       {-  If using the console, this is enabled by default.\n\
        \           \n\
        \            }\n\
        \       {-  If using the API or CLI, this is disabled by default.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, home directory mappings have a [TYPE] of [DIRECTORY]. If you enable this \
         option, you would then need to explicitly set the [HomeDirectoryMapEntry] [Type] to \
         [FILE] if you want a mapping to have a file target.\n\
        \   "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your \
         Transfer Family endpoint. The default value is [IPV4].\n\n\
        \  The [IpAddressType] parameter has the following limitations:\n\
        \  \n\
        \   {ul\n\
        \         {-  It cannot be changed while the server is online. You must stop the server \
         before modifying this parameter.\n\
        \             \n\
        \              }\n\
        \         {-  It cannot be updated to [DUALSTACK] if the server has [AddressAllocationIds] \
         specified.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \     When using [DUALSTACK] as the [IpAddressType], you cannot set the \
         [AddressAllocationIds] parameter for the \
         {{:https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html}EndpointDetails} \
         for the server.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec user_name = string [@@ocaml.doc ""]

type nonrec create_user_response = {
  server_id : server_id; [@ocaml.doc "The identifier of the server that the user is attached to.\n"]
  user_name : user_name; [@ocaml.doc "A unique string that identifies a Transfer Family user.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_request = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ The following is an [Entry] and [Target] pair example.\n\
        \ \n\
        \   [\\[ { \"Entry\": \"/directory1\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \  \n\
        \   In most cases, you can use this value instead of the session policy to lock your user \
         down to the designated home directory (\"[chroot]\"). To do this, you can set [Entry] to \
         [/] and set [Target] to the value the user should see for their home directory when they \
         log in.\n\
        \   \n\
        \    The following is an [Entry] and [Target] pair example for [chroot].\n\
        \    \n\
        \      [\\[ { \"Entry\": \"/\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \     "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n\n\
        \  This policy applies only when the domain of [ServerId] is Amazon S3. Amazon EFS does \
         not use session policies.\n\
        \  \n\
        \   For session policies, Transfer Family stores the policy as a JSON blob, instead of the \
         Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it \
         in the [Policy] argument.\n\
        \   \n\
        \    For an example of a session policy, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html}Example \
         session policy}.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html}AssumeRole} in \
         the {i Amazon Web Services Security Token Service API Reference}.\n\
        \     \n\
        \      "]
  posix_profile : posix_profile option;
      [@ocaml.doc
        "Specifies the full POSIX identity, including user ID ([Uid]), group ID ([Gid]), and any \
         secondary groups IDs ([SecondaryGids]), that controls your users' access to your Amazon \
         EFS file systems. The POSIX permissions that are set on files and directories in Amazon \
         EFS determine the level of access your users get when transferring files into and out of \
         your Amazon EFS file systems.\n"]
  role : role;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This is the specific server \
         that you added your user to.\n"]
  ssh_public_key_body : ssh_public_key_body option;
      [@ocaml.doc
        "The public portion of the Secure Shell (SSH) key used to authenticate the user to the \
         server.\n\n\
        \ The three standard SSH public key format elements are [<key type>], [<body base64>], and \
         an optional [<comment>], with spaces between each element.\n\
        \ \n\
        \  Transfer Family accepts RSA, ECDSA, and ED25519 keys.\n\
        \  \n\
        \   {ul\n\
        \         {-  For RSA keys, the key type is [ssh-rsa].\n\
        \             \n\
        \              }\n\
        \         {-  For ED25519 keys, the key type is [ssh-ed25519].\n\
        \             \n\
        \              }\n\
        \         {-  For ECDSA keys, the key type is either [ecdsa-sha2-nistp256], \
         [ecdsa-sha2-nistp384], or [ecdsa-sha2-nistp521], depending on the size of the key you \
         generated.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that can be used to group and search for users. Tags are metadata \
         attached to users for any purpose.\n"]
  user_name : user_name;
      [@ocaml.doc
        "A unique string that identifies a user and is associated with a [ServerId]. This user \
         name must be a minimum of 3 and a maximum of 100 characters long. The following are valid \
         characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', period '.', and at sign '\\@'. The \
         user name can't start with a hyphen, period, or at sign.\n"]
}
[@@ocaml.doc ""]

type nonrec web_app_id = string [@@ocaml.doc ""]

type nonrec create_web_app_response = {
  web_app_id : web_app_id; [@ocaml.doc "Returns a unique identifier for the web app.\n"]
}
[@@ocaml.doc ""]

type nonrec web_app_vpc_endpoint_ip_address_type =
  | IPV4 [@ocaml.doc ""]
  | DUALSTACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec web_app_vpc_config = {
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "The list of subnet IDs within the VPC where the web app endpoint will be deployed. These \
         subnets must be in the same VPC specified in the VpcId parameter.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc "The identifier of the VPC where the web app endpoint will be hosted.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The list of security group IDs that control access to the web app endpoint. These \
         security groups determine which sources can access the endpoint based on IP addresses and \
         port configurations.\n"]
  ip_address_type : web_app_vpc_endpoint_ip_address_type option;
      [@ocaml.doc
        "The IP address type for the web app's VPC endpoint. This determines whether the endpoint \
         is accessible over IPv4 only, or over both IPv4 and IPv6.\n"]
}
[@@ocaml.doc
  "Contains the VPC configuration settings for hosting a web app endpoint, including the VPC ID, \
   subnet IDs, and security group IDs for access control.\n"]

type nonrec web_app_endpoint_details =
  | Vpc of web_app_vpc_config
      [@ocaml.doc "The VPC configuration for hosting the web app endpoint within a VPC.\n"]
[@@ocaml.doc
  "Contains the endpoint configuration for a web app, including VPC settings when the endpoint is \
   hosted within a VPC.\n"]

type nonrec web_app_endpoint_policy = FIPS [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec web_app_unit_count = int [@@ocaml.doc ""]

type nonrec web_app_units =
  | Provisioned of web_app_unit_count
      [@ocaml.doc
        "An integer that represents the number of units for your desired number of concurrent \
         connections, or the number of user sessions on your web app at the same time.\n\n\
        \ Each increment allows an additional 250 concurrent sessions: a value of [1] sets the \
         number of concurrent sessions to 250; [2] sets a value of 500, and so on. \n\
        \ "]
[@@ocaml.doc
  "Contains an integer value that represents the value for number of concurrent connections or the \
   user sessions on your web app.\n"]

type nonrec web_app_access_endpoint = string [@@ocaml.doc ""]

type nonrec identity_center_instance_arn = string [@@ocaml.doc ""]

type nonrec identity_center_config = {
  instance_arn : identity_center_instance_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM Identity Center used for the web app.\n"]
  role : role option; [@ocaml.doc "The IAM role in IAM Identity Center used for the web app.\n"]
}
[@@ocaml.doc
  "A structure that describes the values to use for the IAM Identity Center settings when you \
   create or update a web app.\n"]

type nonrec web_app_identity_provider_details =
  | IdentityCenterConfig of identity_center_config
      [@ocaml.doc
        "A structure that describes the values to use for the IAM Identity Center settings when \
         you create a web app.\n"]
[@@ocaml.doc "A union that contains the [IdentityCenterConfig] object.\n"]

type nonrec create_web_app_request = {
  identity_provider_details : web_app_identity_provider_details;
      [@ocaml.doc
        "You can provide a structure that contains the details for the identity provider to use \
         with your web app.\n\n\
        \ For more details about this parameter, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/webapp-identity-center.html}Configure \
         your identity provider for Transfer Family web apps}.\n\
        \ "]
  access_endpoint : web_app_access_endpoint option;
      [@ocaml.doc
        "The [AccessEndpoint] is the URL that you provide to your users for them to interact with \
         the Transfer Family web app. You can specify a custom URL or use the default value.\n\n\
        \ Before you enter a custom URL for this parameter, follow the steps described in \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/webapp-customize.html}Update \
         your access endpoint with a custom URL}.\n\
        \ "]
  web_app_units : web_app_units option;
      [@ocaml.doc
        "A union that contains the value for number of concurrent connections or the user sessions \
         on your web app.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for web apps.\n"]
  web_app_endpoint_policy : web_app_endpoint_policy option;
      [@ocaml.doc
        " Setting for the type of endpoint policy for the web app. The default value is \
         [STANDARD]. \n\n\
        \ If you are creating the web app in an Amazon Web Services GovCloud (US) Region, you can \
         set this parameter to [FIPS].\n\
        \ "]
  endpoint_details : web_app_endpoint_details option;
      [@ocaml.doc
        "The endpoint configuration for the web app. You can specify whether the web app endpoint \
         is publicly accessible or hosted within a VPC.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workflow_response = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_type = PGP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec decrypt_step_details = {
  name : workflow_step_name option; [@ocaml.doc "The name of the step, used as an identifier.\n"]
  type_ : encryption_type;
      [@ocaml.doc "The type of encryption used. Currently, this value must be [PGP].\n"]
  source_file_location : source_file_location option;
      [@ocaml.doc
        "Specifies which file to use as input to the workflow step: either the output from the \
         previous step, or the originally uploaded file for the workflow.\n\n\
        \ {ul\n\
        \       {-  To use the previous file as the input, enter [${previous.file}]. In this case, \
         this workflow step uses the output file from the previous workflow step as input. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       {-  To use the originally uploaded file location as input for this step, enter \
         [${original.file}].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  overwrite_existing : overwrite_existing option;
      [@ocaml.doc
        "A flag that indicates whether to overwrite an existing file of the same name. The default \
         is [FALSE].\n\n\
        \ If the workflow is processing a file that has the same name as an existing file, the \
         behavior is as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [OverwriteExisting] is [TRUE], the existing file is replaced with the file \
         being processed.\n\
        \            \n\
        \             }\n\
        \        {-  If [OverwriteExisting] is [FALSE], nothing happens, and the workflow \
         processing stops.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  destination_file_location : input_file_location;
      [@ocaml.doc
        "Specifies the location for the file being decrypted. Use [${Transfer:UserName}] or \
         [${Transfer:UploadDate}] in this field to parametrize the destination prefix by username \
         or uploaded date.\n\n\
        \ {ul\n\
        \       {-  Set the value of [DestinationFileLocation] to [${Transfer:UserName}] to \
         decrypt uploaded files to an Amazon S3 bucket that is prefixed with the name of the \
         Transfer Family user that uploaded the file.\n\
        \           \n\
        \            }\n\
        \       {-  Set the value of [DestinationFileLocation] to [${Transfer:UploadDate}] to \
         decrypt uploaded files to an Amazon S3 bucket that is prefixed with the date of the \
         upload.\n\
        \           \n\
        \             The system resolves [UploadDate] to a date format of {i YYYY-MM-DD}, based \
         on the date the file is uploaded in UTC.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Each step type has its own [StepDetails] structure.\n"]

type nonrec s3_tag_value = string [@@ocaml.doc ""]

type nonrec s3_tag_key = string [@@ocaml.doc ""]

type nonrec s3_tag = {
  key : s3_tag_key; [@ocaml.doc "The name assigned to the tag that you create.\n"]
  value : s3_tag_value; [@ocaml.doc "The value that corresponds to the key.\n"]
}
[@@ocaml.doc
  "Specifies the key-value pair that are assigned to a file during the execution of a Tagging step.\n"]

type nonrec s3_tags = s3_tag list [@@ocaml.doc ""]

type nonrec tag_step_details = {
  name : workflow_step_name option; [@ocaml.doc "The name of the step, used as an identifier.\n"]
  tags : s3_tags option; [@ocaml.doc "Array that contains from 1 to 10 key/value pairs.\n"]
  source_file_location : source_file_location option;
      [@ocaml.doc
        "Specifies which file to use as input to the workflow step: either the output from the \
         previous step, or the originally uploaded file for the workflow.\n\n\
        \ {ul\n\
        \       {-  To use the previous file as the input, enter [${previous.file}]. In this case, \
         this workflow step uses the output file from the previous workflow step as input. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       {-  To use the originally uploaded file location as input for this step, enter \
         [${original.file}].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Each step type has its own [StepDetails] structure.\n\n\
  \ The key/value pairs used to tag a file during the execution of a workflow step.\n\
  \ "]

type nonrec delete_step_details = {
  name : workflow_step_name option; [@ocaml.doc "The name of the step, used as an identifier.\n"]
  source_file_location : source_file_location option;
      [@ocaml.doc
        "Specifies which file to use as input to the workflow step: either the output from the \
         previous step, or the originally uploaded file for the workflow.\n\n\
        \ {ul\n\
        \       {-  To use the previous file as the input, enter [${previous.file}]. In this case, \
         this workflow step uses the output file from the previous workflow step as input. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       {-  To use the originally uploaded file location as input for this step, enter \
         [${original.file}].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The name of the step, used to identify the delete step.\n"]

type nonrec custom_step_timeout_seconds = int [@@ocaml.doc ""]

type nonrec custom_step_target = string [@@ocaml.doc ""]

type nonrec custom_step_details = {
  name : workflow_step_name option; [@ocaml.doc "The name of the step, used as an identifier.\n"]
  target : custom_step_target option;
      [@ocaml.doc "The ARN for the Lambda function that is being called.\n"]
  timeout_seconds : custom_step_timeout_seconds option;
      [@ocaml.doc "Timeout, in seconds, for the step.\n"]
  source_file_location : source_file_location option;
      [@ocaml.doc
        "Specifies which file to use as input to the workflow step: either the output from the \
         previous step, or the originally uploaded file for the workflow.\n\n\
        \ {ul\n\
        \       {-  To use the previous file as the input, enter [${previous.file}]. In this case, \
         this workflow step uses the output file from the previous workflow step as input. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       {-  To use the originally uploaded file location as input for this step, enter \
         [${original.file}].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Each step type has its own [StepDetails] structure.\n"]

type nonrec workflow_step_type =
  | COPY [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | TAG [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | DECRYPT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workflow_step = {
  type_ : workflow_step_type option;
      [@ocaml.doc
        " Currently, the following step types are supported. \n\n\
        \ {ul\n\
        \       {-   {b  [COPY] } - Copy the file to another location.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [CUSTOM] } - Perform a custom step with an Lambda function target.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [DECRYPT] } - Decrypt a file that was encrypted before it was uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [DELETE] } - Delete the file.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [TAG] } - Add a tag to the file.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  copy_step_details : copy_step_details option;
      [@ocaml.doc
        "Details for a step that performs a file copy.\n\n\
        \  Consists of the following values: \n\
        \ \n\
        \  {ul\n\
        \        {-  A description\n\
        \            \n\
        \             }\n\
        \        {-  An Amazon S3 location for the destination of the file copy.\n\
        \            \n\
        \             }\n\
        \        {-  A flag that indicates whether to overwrite an existing file of the same name. \
         The default is [FALSE].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  custom_step_details : custom_step_details option;
      [@ocaml.doc
        "Details for a step that invokes an Lambda function.\n\n\
        \ Consists of the Lambda function's name, target, and timeout (in seconds). \n\
        \ "]
  delete_step_details : delete_step_details option;
      [@ocaml.doc "Details for a step that deletes the file.\n"]
  tag_step_details : tag_step_details option;
      [@ocaml.doc
        "Details for a step that creates one or more tags.\n\n\
        \ You specify one or more tags. Each tag contains a key-value pair.\n\
        \ "]
  decrypt_step_details : decrypt_step_details option;
      [@ocaml.doc
        "Details for a step that decrypts an encrypted file.\n\n\
        \ Consists of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  A descriptive name\n\
        \            \n\
        \             }\n\
        \        {-  An Amazon S3 or Amazon Elastic File System (Amazon EFS) location for the \
         source file to decrypt.\n\
        \            \n\
        \             }\n\
        \        {-  An S3 or Amazon EFS location for the destination of the file decryption.\n\
        \            \n\
        \             }\n\
        \        {-  A flag that indicates whether to overwrite an existing file of the same name. \
         The default is [FALSE].\n\
        \            \n\
        \             }\n\
        \        {-  The type of encryption that's used. Currently, only PGP encryption is \
         supported.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The basic building block of a workflow.\n"]

type nonrec workflow_steps = workflow_step list [@@ocaml.doc ""]

type nonrec workflow_description = string [@@ocaml.doc ""]

type nonrec create_workflow_request = {
  description : workflow_description option;
      [@ocaml.doc "A textual description for the workflow.\n"]
  steps : workflow_steps;
      [@ocaml.doc
        "Specifies the details for the steps that are in the specified workflow.\n\n\
        \  The [TYPE] specifies which of the following actions is being taken for this step. \n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [COPY] } - Copy the file to another location.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [CUSTOM] } - Perform a custom step with an Lambda function target.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DECRYPT] } - Decrypt a file that was encrypted before it was uploaded.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DELETE] } - Delete the file.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [TAG] } - Add a tag to the file.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \     Currently, copying and tagging are supported only on S3. \n\
        \    \n\
        \       For file location, you specify either the Amazon S3 bucket and key, or the Amazon \
         EFS file system ID and path. \n\
        \      "]
  on_exception_steps : workflow_steps option;
      [@ocaml.doc
        "Specifies the steps (actions) to take if errors are encountered during execution of the \
         workflow.\n\n\
        \  For custom steps, the Lambda function needs to send [FAILURE] to the call back API to \
         kick off the exception steps. Additionally, if the Lambda does not send [SUCCESS] before \
         it times out, the exception steps are executed.\n\
        \  \n\
        \   "]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that can be used to group and search for workflows. Tags are metadata \
         attached to workflows for any purpose.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_http_header_value_type = string [@@ocaml.doc ""]

type nonrec custom_http_header_key_type = string [@@ocaml.doc ""]

type nonrec custom_http_header = {
  key : custom_http_header_key_type option; [@ocaml.doc "The name of the custom HTTP header.\n"]
  value : custom_http_header_value_type option; [@ocaml.doc "The value of the custom HTTP header.\n"]
}
[@@ocaml.doc
  "Represents a custom HTTP header that can be included in AS2 messages. Each header consists of a \
   key-value pair.\n"]

type nonrec custom_http_headers = custom_http_header list [@@ocaml.doc ""]

type nonrec custom_step_status = SUCCESS [@ocaml.doc ""] | FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec date_imported = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec delete_access_request = {
  server_id : server_id;
      [@ocaml.doc "A system-assigned unique identifier for a server that has this user assigned.\n"]
  external_id : external_id;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_agreement_request = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
  server_id : server_id;
      [@ocaml.doc "The server identifier associated with the agreement that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_certificate_request = {
  certificate_id : certificate_id;
      [@ocaml.doc "The identifier of the certificate object that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connector_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
}
[@@ocaml.doc ""]

type nonrec host_key_id = string [@@ocaml.doc ""]

type nonrec delete_host_key_request = {
  server_id : server_id;
      [@ocaml.doc
        "The identifier of the server that contains the host key that you are deleting.\n"]
  host_key_id : host_key_id; [@ocaml.doc "The identifier of the host key that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_id = string [@@ocaml.doc ""]

type nonrec delete_profile_request = {
  profile_id : profile_id; [@ocaml.doc "The identifier of the profile that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_server_request = {
  server_id : server_id; [@ocaml.doc "A unique system-assigned identifier for a server instance.\n"]
}
[@@ocaml.doc ""]

type nonrec ssh_public_key_id = string [@@ocaml.doc ""]

type nonrec delete_ssh_public_key_request = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a file transfer protocol-enabled server instance \
         that has the user assigned to it.\n"]
  ssh_public_key_id : ssh_public_key_id;
      [@ocaml.doc "A unique identifier used to reference your user's specific SSH key.\n"]
  user_name : user_name;
      [@ocaml.doc "A unique string that identifies a user whose public key is being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_request = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance that has the user assigned to it.\n"]
  user_name : user_name;
      [@ocaml.doc "A unique string that identifies a user that is being deleted from a server.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_web_app_request = {
  web_app_id : web_app_id;
      [@ocaml.doc "Provide the unique identifier for the web app that you are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_web_app_customization_request = {
  web_app_id : web_app_id;
      [@ocaml.doc
        "Provide the unique identifier for the web app that contains the customizations that you \
         are deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workflow_request = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec described_access = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ In most cases, you can use this value instead of the session policy to lock down the \
         associated access to the designated home directory (\"[chroot]\"). To do this, you can \
         set [Entry] to '/' and set [Target] to the [HomeDirectory] parameter value.\n\
        \ "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n"]
  posix_profile : posix_profile option; [@ocaml.doc ""]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  external_id : external_id option;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc "Describes the properties of the access that was specified.\n"]

type nonrec describe_access_response = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that has this access assigned.\n"]
  access : described_access;
      [@ocaml.doc "The external identifier of the server that the access is attached to.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_access_request = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that has this access assigned.\n"]
  external_id : external_id;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec described_agreement = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) for the agreement.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
  description : description option;
      [@ocaml.doc "The name or short description that's used to identify the agreement.\n"]
  status : agreement_status_type option;
      [@ocaml.doc "The current status of the agreement, either [ACTIVE] or [INACTIVE].\n"]
  server_id : server_id option;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This identifier indicates the \
         specific server that the agreement uses.\n"]
  local_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the AS2 local profile.\n"]
  partner_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the partner profile used in the agreement.\n"]
  base_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for files that are transferred by using the AS2 protocol.\n"]
  access_role : role option;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for agreements.\n"]
  preserve_filename : preserve_filename_type option;
      [@ocaml.doc
        " Determines whether or not Transfer Family appends a unique string of characters to the \
         end of the AS2 message payload filename when saving it. \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: the filename provided by your trading parter is preserved when the \
         file is saved.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): when Transfer Family saves the file, the filename \
         is adjusted, as described in \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2}File \
         names and locations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  enforce_message_signing : enforce_message_signing_type option;
      [@ocaml.doc
        " Determines whether or not unsigned messages from your trading partners will be accepted. \
         \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: Transfer Family rejects unsigned messages from your trading partner.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): Transfer Family accepts unsigned messages from \
         your trading partner.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  custom_directories : custom_directories_type option;
      [@ocaml.doc
        "A [CustomDirectoriesType] structure. This structure specifies custom directories for \
         storing various AS2 message files. You can specify directories for the following types of \
         files.\n\n\
        \ {ul\n\
        \       {-  Failed files\n\
        \           \n\
        \            }\n\
        \       {-  MDN files\n\
        \           \n\
        \            }\n\
        \       {-  Payload files\n\
        \           \n\
        \            }\n\
        \       {-  Status files\n\
        \           \n\
        \            }\n\
        \       {-  Temporary files\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes the properties of an agreement.\n"]

type nonrec describe_agreement_response = {
  agreement : described_agreement;
      [@ocaml.doc
        "The details for the specified agreement, returned as a [DescribedAgreement] object.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_agreement_request = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
  server_id : server_id; [@ocaml.doc "The server identifier that's associated with the agreement.\n"]
}
[@@ocaml.doc ""]

type nonrec described_certificate = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) for the certificate.\n"]
  certificate_id : certificate_id option;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
  usage : certificate_usage_type option;
      [@ocaml.doc
        "Specifies how this certificate is used. It can be used in the following ways:\n\n\
        \ {ul\n\
        \       {-   [SIGNING]: For signing AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTION]: For encrypting AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [TLS]: For securing AS2 communications sent over HTTPS\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status : certificate_status_type option;
      [@ocaml.doc
        "A certificate's status can be either [ACTIVE] or [INACTIVE].\n\n\
        \ You can set [ActiveDate] and [InactiveDate] in the [UpdateCertificate] call. If you set \
         values for these parameters, those values are used to determine whether the certificate \
         has a status of [ACTIVE] or [INACTIVE].\n\
        \ \n\
        \  If you don't set values for [ActiveDate] and [InactiveDate], we use the [NotBefore] and \
         [NotAfter] date as specified on the X509 certificate to determine when a certificate is \
         active and when it is inactive.\n\
        \  "]
  certificate : certificate_body_type option; [@ocaml.doc "The file name for the certificate.\n"]
  certificate_chain : certificate_chain_type option;
      [@ocaml.doc "The list of certificates that make up the chain for the certificate.\n"]
  active_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes active. If you do not \
         specify a value, [ActiveDate] takes the same value as [NotBeforeDate], which is specified \
         by the CA. \n"]
  inactive_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes inactive. If you do not \
         specify a value, [InactiveDate] takes the same value as [NotAfterDate], which is \
         specified by the CA.\n"]
  serial : cert_serial option; [@ocaml.doc "The serial number for the certificate.\n"]
  not_before_date : cert_date option;
      [@ocaml.doc "The earliest date that the certificate is valid.\n"]
  not_after_date : cert_date option; [@ocaml.doc "The final date that the certificate is valid.\n"]
  type_ : certificate_type option;
      [@ocaml.doc
        "If a private key has been specified for the certificate, its type is \
         [CERTIFICATE_WITH_PRIVATE_KEY]. If there is no private key, the type is [CERTIFICATE].\n"]
  description : description option;
      [@ocaml.doc "The name or description that's used to identity the certificate. \n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for certificates.\n"]
}
[@@ocaml.doc "Describes the properties of a certificate.\n"]

type nonrec describe_certificate_response = {
  certificate : described_certificate;
      [@ocaml.doc "The details for the specified certificate, returned as an object.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificate_request = {
  certificate_id : certificate_id;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec described_connector_vpc_lattice_egress_config = {
  resource_configuration_arn : vpc_lattice_resource_configuration_arn;
      [@ocaml.doc
        "ARN of the VPC_LATTICE Resource Configuration currently used by the connector. This \
         Resource Configuration defines the network path to the SFTP server through the customer's \
         VPC.\n"]
  port_number : sftp_port option;
      [@ocaml.doc
        "Port number currently configured for SFTP connections through VPC_LATTICE. Shows the port \
         on which the connector attempts to connect to the target SFTP server.\n"]
}
[@@ocaml.doc
  "VPC_LATTICE egress configuration details in the response, containing the Resource Configuration \
   ARN and port number currently configured for the connector.\n"]

type nonrec described_connector_egress_config =
  | VpcLattice of described_connector_vpc_lattice_egress_config
      [@ocaml.doc
        "VPC_LATTICE configuration details in the response, showing the current Resource \
         Configuration ARN and port settings for VPC-based connectivity.\n"]
[@@ocaml.doc
  "Response structure containing the current egress configuration details for the connector. Shows \
   how traffic is currently routed from the connector to the SFTP server.\n"]

type nonrec service_managed_egress_ip_address = string [@@ocaml.doc ""]

type nonrec service_managed_egress_ip_addresses = service_managed_egress_ip_address list
[@@ocaml.doc ""]

type nonrec described_connector = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) for the connector.\n"]
  connector_id : connector_id option; [@ocaml.doc "The unique identifier for the connector.\n"]
  url : url option;
      [@ocaml.doc
        "The URL of the partner's AS2 or SFTP endpoint.\n\n\
        \ When creating AS2 connectors or service-managed SFTP connectors (connectors without \
         egress configuration), you must provide a URL to specify the remote server endpoint. For \
         VPC Lattice type connectors, the URL must be null.\n\
        \ "]
  as2_config : as2_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an AS2 connector object.\n"]
  access_role : role option;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  logging_role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a connector to turn on CloudWatch logging for Amazon S3 events. When set, you can \
         view connector activity in your CloudWatch logs.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for connectors.\n"]
  sftp_config : sftp_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an SFTP connector object.\n"]
  service_managed_egress_ip_addresses : service_managed_egress_ip_addresses option;
      [@ocaml.doc
        "The list of egress IP addresses of this connector. These IP addresses are assigned \
         automatically when you create the connector.\n"]
  security_policy_name : connector_security_policy_name option;
      [@ocaml.doc "The text name of the security policy for the specified connector.\n"]
  egress_config : described_connector_egress_config option;
      [@ocaml.doc
        "Current egress configuration of the connector, showing how traffic is routed to the SFTP \
         server. Contains VPC Lattice settings when using VPC_LATTICE egress type.\n\n\
        \ When using the VPC_LATTICE egress type, Transfer Family uses a managed Service Network \
         to simplify the resource sharing process.\n\
        \ "]
  egress_type : connector_egress_type;
      [@ocaml.doc
        "Type of egress configuration for the connector. SERVICE_MANAGED uses Transfer Family \
         managed NAT gateways, while VPC_LATTICE routes traffic through customer VPCs using VPC \
         Lattice.\n"]
  error_message : connector_error_message option;
      [@ocaml.doc
        "Error message providing details when the connector is in ERRORED status. Contains \
         information to help troubleshoot connector creation or operation failures.\n"]
  status : connector_status;
      [@ocaml.doc
        "Current status of the connector. PENDING indicates creation/update in progress, ACTIVE \
         means ready for operations, and ERRORED indicates a failure requiring attention.\n"]
  ip_address_type : connectors_ip_address_type option;
      [@ocaml.doc
        "IP address type for the connector's network connections. When set to [IPV4], the \
         connector uses IPv4 addresses only. When set to [DUALSTACK], the connector supports both \
         IPv4 and IPv6 addresses, with IPv6 preferred when available.\n"]
}
[@@ocaml.doc "Describes the parameters for the connector, as identified by the [ConnectorId].\n"]

type nonrec describe_connector_response = {
  connector : described_connector;
      [@ocaml.doc "The structure that contains the details of the connector.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connector_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_error_message = string [@@ocaml.doc ""]

type nonrec execution_error_type =
  | PERMISSION_DENIED [@ocaml.doc ""]
  | CUSTOM_STEP_FAILED [@ocaml.doc ""]
  | THROTTLED [@ocaml.doc ""]
  | ALREADY_EXISTS [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_error = {
  type_ : execution_error_type;
      [@ocaml.doc
        "Specifies the error type.\n\n\
        \ {ul\n\
        \       {-   [ALREADY_EXISTS]: occurs for a copy step, if the overwrite option is not \
         selected and a file with the same name already exists in the target location.\n\
        \           \n\
        \            }\n\
        \       {-   [BAD_REQUEST]: a general bad request: for example, a step that attempts to \
         tag an EFS file returns [BAD_REQUEST], as only S3 files can be tagged.\n\
        \           \n\
        \            }\n\
        \       {-   [CUSTOM_STEP_FAILED]: occurs when the custom step provided a callback that \
         indicates failure.\n\
        \           \n\
        \            }\n\
        \       {-   [INTERNAL_SERVER_ERROR]: a catch-all error that can occur for a variety of \
         reasons.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_FOUND]: occurs when a requested entity, for example a source file for a \
         copy step, does not exist.\n\
        \           \n\
        \            }\n\
        \       {-   [PERMISSION_DENIED]: occurs if your policy does not contain the correct \
         permissions to complete one or more of the steps in the workflow.\n\
        \           \n\
        \            }\n\
        \       {-   [TIMEOUT]: occurs when the execution times out.\n\
        \           \n\
        \              You can set the [TimeoutSeconds] for a custom step, anywhere from 1 second \
         to 1800 seconds (30 minutes). \n\
        \             \n\
        \               }\n\
        \       {-   [THROTTLED]: occurs if you exceed the new execution refill rate of one \
         workflow per second.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : execution_error_message;
      [@ocaml.doc "Specifies the descriptive message that corresponds to the [ErrorType].\n"]
}
[@@ocaml.doc
  "Specifies the error message and type, for an error that occurs during the execution of the \
   workflow.\n"]

type nonrec step_result_outputs_json = string [@@ocaml.doc ""]

type nonrec execution_step_result = {
  step_type : workflow_step_type option;
      [@ocaml.doc
        "One of the available step types.\n\n\
        \ {ul\n\
        \       {-   {b  [COPY] } - Copy the file to another location.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [CUSTOM] } - Perform a custom step with an Lambda function target.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [DECRYPT] } - Decrypt a file that was encrypted before it was uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [DELETE] } - Delete the file.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [TAG] } - Add a tag to the file.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  outputs : step_result_outputs_json option;
      [@ocaml.doc
        "The values for the key/value pair applied as a tag to the file. Only applicable if the \
         step type is [TAG].\n"]
  error : execution_error option;
      [@ocaml.doc
        "Specifies the details for an error, if it occurred during execution of the specified \
         workflow step.\n"]
}
[@@ocaml.doc
  "Specifies the following details for the step: error (if any), outputs (if any), and the step \
   type.\n"]

type nonrec execution_step_results = execution_step_result list [@@ocaml.doc ""]

type nonrec execution_results = {
  steps : execution_step_results option;
      [@ocaml.doc "Specifies the details for the steps that are in the specified workflow.\n"]
  on_exception_steps : execution_step_results option;
      [@ocaml.doc
        "Specifies the steps (actions) to take if errors are encountered during execution of the \
         workflow.\n"]
}
[@@ocaml.doc
  "Specifies the steps in the workflow, as well as the steps to execute in case of any errors \
   during workflow execution.\n"]

type nonrec execution_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | EXCEPTION [@ocaml.doc ""]
  | HANDLING_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec logging_configuration = {
  logging_role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a server to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. \
         When set, you can view user activity in your CloudWatch logs.\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The name of the CloudWatch logging group for the Transfer Family server to which this \
         workflow belongs.\n"]
}
[@@ocaml.doc "Consists of the logging role and the log group name.\n"]

type nonrec session_id = string [@@ocaml.doc ""]

type nonrec user_details = {
  user_name : user_name;
      [@ocaml.doc
        "A unique string that identifies a Transfer Family user associated with a server.\n"]
  server_id : server_id;
      [@ocaml.doc "The system-assigned unique identifier for a Transfer server instance. \n"]
  session_id : session_id option;
      [@ocaml.doc
        "The system-assigned unique identifier for a session that corresponds to the workflow.\n"]
}
[@@ocaml.doc "Specifies the user name, server ID, and session ID for a workflow.\n"]

type nonrec service_metadata = {
  user_details : user_details;
      [@ocaml.doc
        "The Server ID ([ServerId]), Session ID ([SessionId]) and user ([UserName]) make up the \
         [UserDetails].\n"]
}
[@@ocaml.doc "A container object for the session details that are associated with a workflow.\n"]

type nonrec s3_etag = string [@@ocaml.doc ""]

type nonrec s3_version_id = string [@@ocaml.doc ""]

type nonrec s3_file_location = {
  bucket : s3_bucket option;
      [@ocaml.doc "Specifies the S3 bucket that contains the file being used.\n"]
  key : s3_key option;
      [@ocaml.doc
        "The name assigned to the file when it was created in Amazon S3. You use the object key to \
         retrieve the object.\n"]
  version_id : s3_version_id option; [@ocaml.doc "Specifies the file version.\n"]
  etag : s3_etag option;
      [@ocaml.doc
        "The entity tag is a hash of the object. The ETag reflects changes only to the contents of \
         an object, not its metadata.\n"]
}
[@@ocaml.doc
  "Specifies the details for the file location for the file that's being used in the workflow. \
   Only applicable if you are using S3 storage.\n"]

type nonrec file_location = {
  s3_file_location : s3_file_location option;
      [@ocaml.doc
        "Specifies the S3 details for the file being used, such as bucket, ETag, and so forth.\n"]
  efs_file_location : efs_file_location option;
      [@ocaml.doc "Specifies the Amazon EFS identifier and the path for the file being used.\n"]
}
[@@ocaml.doc "Specifies the Amazon S3 or EFS file details to be used in the step.\n"]

type nonrec execution_id = string [@@ocaml.doc ""]

type nonrec described_execution = {
  execution_id : execution_id option;
      [@ocaml.doc "A unique identifier for the execution of a workflow.\n"]
  initial_file_location : file_location option;
      [@ocaml.doc
        "A structure that describes the Amazon S3 or EFS file location. This is the file location \
         when the execution begins: if the file is being copied, this is the initial (as opposed \
         to destination) file location.\n"]
  service_metadata : service_metadata option;
      [@ocaml.doc
        "A container object for the session details that are associated with a workflow.\n"]
  execution_role : role option; [@ocaml.doc "The IAM role associated with the execution.\n"]
  logging_configuration : logging_configuration option;
      [@ocaml.doc "The IAM logging role associated with the execution.\n"]
  posix_profile : posix_profile option; [@ocaml.doc ""]
  status : execution_status option;
      [@ocaml.doc
        "The status is one of the execution. Can be in progress, completed, exception encountered, \
         or handling the exception. \n"]
  results : execution_results option;
      [@ocaml.doc
        "A structure that describes the execution results. This includes a list of the steps along \
         with the details of each step, error type and message (if any), and the \
         [OnExceptionSteps] structure.\n"]
}
[@@ocaml.doc "The details for an execution object.\n"]

type nonrec describe_execution_response = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
  execution : described_execution;
      [@ocaml.doc "The structure that contains the details of the workflow' execution.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_execution_request = {
  execution_id : execution_id; [@ocaml.doc "A unique identifier for the execution of a workflow.\n"]
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec host_key_type = string [@@ocaml.doc ""]

type nonrec host_key_description = string [@@ocaml.doc ""]

type nonrec host_key_fingerprint = string [@@ocaml.doc ""]

type nonrec described_host_key = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) for the host key.\n"]
  host_key_id : host_key_id option; [@ocaml.doc "A unique identifier for the host key.\n"]
  host_key_fingerprint : host_key_fingerprint option;
      [@ocaml.doc
        "The public key fingerprint, which is a short sequence of bytes used to identify the \
         longer public key.\n"]
  description : host_key_description option;
      [@ocaml.doc "The text description for this host key.\n"]
  type_ : host_key_type option;
      [@ocaml.doc
        "The encryption algorithm that is used for the host key. The [Type] parameter is specified \
         by using one of the following values:\n\n\
        \ {ul\n\
        \       {-   [ssh-rsa] \n\
        \           \n\
        \            }\n\
        \       {-   [ssh-ed25519] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp256] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp384] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp521] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  date_imported : date_imported option;
      [@ocaml.doc "The date on which the host key was added to the server.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for host keys.\n"]
}
[@@ocaml.doc "The details for a server host key.\n"]

type nonrec describe_host_key_response = {
  host_key : described_host_key; [@ocaml.doc "Returns the details for the specified host key.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_host_key_request = {
  server_id : server_id;
      [@ocaml.doc
        "The identifier of the server that contains the host key that you want described.\n"]
  host_key_id : host_key_id; [@ocaml.doc "The identifier of the host key that you want described.\n"]
}
[@@ocaml.doc ""]

type nonrec described_profile = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) for the profile.\n"]
  profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the local or partner AS2 profile.\n"]
  profile_type : profile_type option;
      [@ocaml.doc
        "Indicates whether to list only [LOCAL] type profiles or only [PARTNER] type profiles. If \
         not supplied in the request, the command lists all types of profiles.\n"]
  as2_id : as2_id option;
      [@ocaml.doc
        "The [As2Id] is the {i AS2-name}, as defined in the \
         {{:https://datatracker.ietf.org/doc/html/rfc4130}RFC 4130}. For inbound transfers, this \
         is the [AS2-From] header for the AS2 messages sent from the partner. For outbound \
         connectors, this is the [AS2-To] header for the AS2 messages sent to the partner using \
         the [StartFileTransfer] API operation. This ID cannot include spaces.\n"]
  certificate_ids : certificate_ids option;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for profiles.\n"]
}
[@@ocaml.doc "The details for a local or partner AS2 profile. \n"]

type nonrec describe_profile_response = {
  profile : described_profile;
      [@ocaml.doc "The details of the specified profile, returned as an object.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_profile_request = {
  profile_id : profile_id; [@ocaml.doc "The identifier of the profile that you want described.\n"]
}
[@@ocaml.doc ""]

type nonrec security_policy_protocol = SFTP [@ocaml.doc ""] | FTPS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_policy_protocols = security_policy_protocol list [@@ocaml.doc ""]

type nonrec security_policy_resource_type = SERVER [@ocaml.doc ""] | CONNECTOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_policy_option = string [@@ocaml.doc ""]

type nonrec security_policy_options = security_policy_option list [@@ocaml.doc ""]

type nonrec fips = bool [@@ocaml.doc ""]

type nonrec described_security_policy = {
  fips : fips option;
      [@ocaml.doc
        "Specifies whether this policy enables Federal Information Processing Standards (FIPS). \
         This parameter applies to both server and connector security policies.\n"]
  security_policy_name : security_policy_name;
      [@ocaml.doc "The text name of the specified security policy.\n"]
  ssh_ciphers : security_policy_options option;
      [@ocaml.doc
        "Lists the enabled Secure Shell (SSH) cipher encryption algorithms in the security policy \
         that is attached to the server or connector. This parameter applies to both server and \
         connector security policies.\n"]
  ssh_kexs : security_policy_options option;
      [@ocaml.doc
        "Lists the enabled SSH key exchange (KEX) encryption algorithms in the security policy \
         that is attached to the server or connector. This parameter applies to both server and \
         connector security policies.\n"]
  ssh_macs : security_policy_options option;
      [@ocaml.doc
        "Lists the enabled SSH message authentication code (MAC) encryption algorithms in the \
         security policy that is attached to the server or connector. This parameter applies to \
         both server and connector security policies.\n"]
  tls_ciphers : security_policy_options option;
      [@ocaml.doc
        "Lists the enabled Transport Layer Security (TLS) cipher encryption algorithms in the \
         security policy that is attached to the server.\n\n\
        \  This parameter only applies to security policies for servers.\n\
        \  \n\
        \   "]
  ssh_host_key_algorithms : security_policy_options option;
      [@ocaml.doc
        "Lists the host key algorithms for the security policy.\n\n\
        \  This parameter only applies to security policies for connectors.\n\
        \  \n\
        \   "]
  type_ : security_policy_resource_type option;
      [@ocaml.doc
        "The resource type to which the security policy applies, either server or connector.\n"]
  protocols : security_policy_protocols option;
      [@ocaml.doc "Lists the file transfer protocols that the security policy applies to.\n"]
}
[@@ocaml.doc
  "Describes the properties of a security policy that you specify. For more information about \
   security policies, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html}Working with \
   security policies for servers} or \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html}Working \
   with security policies for SFTP connectors}.\n"]

type nonrec describe_security_policy_response = {
  security_policy : described_security_policy;
      [@ocaml.doc "An array containing the properties of the security policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_security_policy_request = {
  security_policy_name : security_policy_name;
      [@ocaml.doc "Specify the text name of the security policy for which you want the details.\n"]
}
[@@ocaml.doc ""]

type nonrec user_count = int [@@ocaml.doc ""]

type nonrec state =
  | OFFLINE [@ocaml.doc ""]
  | ONLINE [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | START_FAILED [@ocaml.doc ""]
  | STOP_FAILED [@ocaml.doc ""]
[@@ocaml.doc
  "Describes the condition of a file transfer protocol-enabled server with respect to its ability \
   to perform file operations. There are six possible states: [OFFLINE], [ONLINE], [STARTING], \
   [STOPPING], [START_FAILED], and [STOP_FAILED].\n\n\
  \  [OFFLINE] indicates that the server exists, but that it is not available for file operations. \
   [ONLINE] indicates that the server is available to perform file operations. [STARTING] \
   indicates that the server's was instantiated, but the server is not yet available to perform \
   file operations. Under normal conditions, it can take a couple of minutes for the server to be \
   completely operational. Both [START_FAILED] and [STOP_FAILED] are error conditions.\n\
  \ "]

type nonrec described_server = {
  arn : arn; [@ocaml.doc "Specifies the unique Amazon Resource Name (ARN) of the server.\n"]
  certificate : certificate option;
      [@ocaml.doc
        "Specifies the ARN of the Amazon Web ServicesCertificate Manager (ACM) certificate. \
         Required when [Protocols] is set to [FTPS].\n"]
  protocol_details : protocol_details option;
      [@ocaml.doc
        "The protocol settings that are configured for your server.\n\n\
        \  Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of Transfer Family \
         servers, as this increases costs and can cause performance issues, including reduced \
         connection limits for FTPS. For more details, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations} \
         Avoid placing NLBs and NATs in front of Transfer Family}.\n\
        \  \n\
        \    {ul\n\
        \          {-   To indicate passive mode (for FTP and FTPS protocols), use the [PassiveIp] \
         parameter. Enter a single dotted-quad IPv4 address, such as the external IP address of a \
         firewall, router, or load balancer. \n\
        \              \n\
        \               }\n\
        \          {-  To ignore the error that is generated when the client attempts to use the \
         [SETSTAT] command on a file that you are uploading to an Amazon S3 bucket, use the \
         [SetStatOption] parameter. To have the Transfer Family server ignore the [SETSTAT] \
         command and upload files without needing to make any changes to your SFTP client, set the \
         value to [ENABLE_NO_OP]. If you set the [SetStatOption] parameter to [ENABLE_NO_OP], \
         Transfer Family generates a log entry to Amazon CloudWatch Logs, so that you can \
         determine when the client is making a [SETSTAT] call.\n\
        \              \n\
        \               }\n\
        \          {-  To determine whether your Transfer Family server resumes recent, negotiated \
         sessions through a unique session ID, use the [TlsSessionResumptionMode] parameter.\n\
        \              \n\
        \               }\n\
        \          {-   [As2Transports] indicates the transport method for the AS2 messages. \
         Currently, only HTTP is supported.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  domain : domain option;
      [@ocaml.doc
        "Specifies the domain of the storage system that is used for file transfers. There are two \
         domains available: Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File \
         System (Amazon EFS). The default value is S3.\n"]
  endpoint_details : endpoint_details option;
      [@ocaml.doc
        "The virtual private cloud (VPC) endpoint settings that are configured for your server. \
         When you host your endpoint within your VPC, you can make your endpoint accessible only \
         to resources within your VPC, or you can attach Elastic IP addresses and make your \
         endpoint accessible to clients over the internet. Your VPC's default security groups are \
         automatically assigned to your endpoint.\n"]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "Defines the type of endpoint that your server is connected to. If your server is \
         connected to a VPC endpoint, your server isn't accessible over the public internet.\n"]
  host_key_fingerprint : host_key_fingerprint option;
      [@ocaml.doc
        "Specifies the Base64-encoded SHA256 fingerprint of the server's host key. This value is \
         equivalent to the output of the [ssh-keygen -l -f my-new-server-key] command.\n"]
  identity_provider_details : identity_provider_details option;
      [@ocaml.doc
        "Specifies information to call a customer-supplied authentication API. This field is not \
         populated when the [IdentityProviderType] of a server is [AWS_DIRECTORY_SERVICE] or \
         [SERVICE_MANAGED].\n"]
  identity_provider_type : identity_provider_type option;
      [@ocaml.doc
        "The mode of authentication for a server. The default value is [SERVICE_MANAGED], which \
         allows you to store and access user credentials within the Transfer Family service.\n\n\
        \ Use [AWS_DIRECTORY_SERVICE] to provide access to Active Directory groups in Directory \
         Service for Microsoft Active Directory or Microsoft Active Directory in your on-premises \
         environment or in Amazon Web Services using AD Connector. This option also requires you \
         to provide a Directory ID by using the [IdentityProviderDetails] parameter.\n\
        \ \n\
        \  Use the [API_GATEWAY] value to integrate with an identity provider of your choosing. \
         The [API_GATEWAY] setting requires you to provide an Amazon API Gateway endpoint URL to \
         call for authentication by using the [IdentityProviderDetails] parameter.\n\
        \  \n\
        \   Use the [AWS_LAMBDA] value to directly use an Lambda function as your identity \
         provider. If you choose this value, you must specify the ARN for the Lambda function in \
         the [Function] parameter for the [IdentityProviderDetails] data type.\n\
        \   "]
  logging_role : nullable_role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a server to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. \
         When set, you can view user activity in your CloudWatch logs.\n"]
  post_authentication_login_banner : post_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         after the user authenticates.\n\n\
        \  The SFTP protocol does not support post-authentication display banners.\n\
        \  \n\
        \   "]
  pre_authentication_login_banner : pre_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         before the user authenticates. For example, the following banner displays details about \
         using the system:\n\n\
        \  [This system is for the use of authorized users only. Individuals using this computer \
         system without authority, or in excess of their authority, are subject to having all of \
         their activities on this system monitored and recorded by system personnel.] \n\
        \ "]
  protocols : protocols option;
      [@ocaml.doc
        "Specifies the file transfer protocol or protocols over which your file transfer protocol \
         client can connect to your server's endpoint. The available protocols are:\n\n\
        \ {ul\n\
        \       {-   [SFTP] (Secure Shell (SSH) File Transfer Protocol): File transfer over SSH\n\
        \           \n\
        \            }\n\
        \       {-   [FTPS] (File Transfer Protocol Secure): File transfer with TLS encryption\n\
        \           \n\
        \            }\n\
        \       {-   [FTP] (File Transfer Protocol): Unencrypted file transfer\n\
        \           \n\
        \            }\n\
        \       {-   [AS2] (Applicability Statement 2): used for transporting structured \
         business-to-business data\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    {ul\n\
        \          {-  If you select [FTPS], you must choose a certificate stored in Certificate \
         Manager (ACM) which is used to identify your server when clients connect to it over FTPS.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes either [FTP] or [FTPS], then the [EndpointType] must \
         be [VPC] and the [IdentityProviderType] must be either [AWS_DIRECTORY_SERVICE], \
         [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [FTP], then [AddressAllocationIds] cannot be \
         associated.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] is set only to [SFTP], the [EndpointType] can be set to \
         [PUBLIC] and the [IdentityProviderType] can be set any of the supported identity types: \
         [SERVICE_MANAGED], [AWS_DIRECTORY_SERVICE], [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [AS2], then the [EndpointType] must be [VPC], and \
         domain must be Amazon S3.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  security_policy_name : security_policy_name option;
      [@ocaml.doc "Specifies the name of the security policy for the server.\n"]
  server_id : server_id option;
      [@ocaml.doc
        "Specifies the unique system-assigned identifier for a server that you instantiate.\n"]
  state : state option;
      [@ocaml.doc
        "The condition of the server that was described. A value of [ONLINE] indicates that the \
         server can accept jobs and transfer files. A [State] value of [OFFLINE] means that the \
         server cannot perform file transfer operations.\n\n\
        \ The states of [STARTING] and [STOPPING] indicate that the server is in an intermediate \
         state, either not fully able to respond, or not fully offline. The values of \
         [START_FAILED] or [STOP_FAILED] can indicate an error condition.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "Specifies the key-value pairs that you can use to search for and group servers that were \
         assigned to the server that was described.\n"]
  user_count : user_count option;
      [@ocaml.doc
        "Specifies the number of users that are assigned to a server you specified with the \
         [ServerId].\n"]
  workflow_details : workflow_details option;
      [@ocaml.doc
        "Specifies the workflow ID for the workflow to assign and the execution role that's used \
         for executing the workflow.\n\n\
        \ In addition to a workflow to execute when a file is uploaded completely, \
         [WorkflowDetails] can also contain a workflow ID (and execution role) for a workflow to \
         execute on partial upload. A partial upload occurs when the server session disconnects \
         while the file is still being uploaded.\n\
        \ "]
  structured_log_destinations : structured_log_destinations option;
      [@ocaml.doc
        "Specifies the log groups to which your server logs are sent.\n\n\
        \ To specify a log group, you must provide the ARN for an existing log group. In this \
         case, the format of the log group is as follows:\n\
        \ \n\
        \   [arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*] \n\
        \  \n\
        \   For example, [arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*] \n\
        \   \n\
        \    If you have previously specified a log group for a server, you can clear it, and in \
         effect turn off structured logging, by providing an empty value for this parameter in an \
         [update-server] call. For example:\n\
        \    \n\
        \      [update-server --server-id s-1234567890abcdef0 --structured-log-destinations] \n\
        \     "]
  s3_storage_options : s3_storage_options option;
      [@ocaml.doc
        "Specifies whether or not performance for your Amazon S3 directories is optimized.\n\n\
        \ {ul\n\
        \       {-  If using the console, this is enabled by default.\n\
        \           \n\
        \            }\n\
        \       {-  If using the API or CLI, this is disabled by default.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, home directory mappings have a [TYPE] of [DIRECTORY]. If you enable this \
         option, you would then need to explicitly set the [HomeDirectoryMapEntry] [Type] to \
         [FILE] if you want a mapping to have a file target.\n\
        \   "]
  as2_service_managed_egress_ip_addresses : service_managed_egress_ip_addresses option;
      [@ocaml.doc
        "The list of egress IP addresses of this server. These IP addresses are only relevant for \
         servers that use the AS2 protocol. They are used for sending asynchronous MDNs.\n\n\
        \ These IP addresses are assigned automatically when you create an AS2 server. \
         Additionally, if you update an existing server and add the AS2 protocol, static IP \
         addresses are assigned as well.\n\
        \ "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your \
         Transfer Family endpoint. The default value is [IPV4].\n\n\
        \  The [IpAddressType] parameter has the following limitations:\n\
        \  \n\
        \   {ul\n\
        \         {-  It cannot be changed while the server is online. You must stop the server \
         before modifying this parameter.\n\
        \             \n\
        \              }\n\
        \         {-  It cannot be updated to [DUALSTACK] if the server has [AddressAllocationIds] \
         specified.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \     When using [DUALSTACK] as the [IpAddressType], you cannot set the \
         [AddressAllocationIds] parameter for the \
         {{:https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html}EndpointDetails} \
         for the server.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc
  "Describes the properties of a file transfer protocol-enabled server that was specified.\n"]

type nonrec describe_server_response = {
  server : described_server;
      [@ocaml.doc
        "An array containing the properties of a server with the [ServerID] you specified.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_server_request = {
  server_id : server_id; [@ocaml.doc "A system-assigned unique identifier for a server.\n"]
}
[@@ocaml.doc ""]

type nonrec ssh_public_key = {
  date_imported : date_imported;
      [@ocaml.doc "Specifies the date that the public key was added to the Transfer Family user.\n"]
  ssh_public_key_body : ssh_public_key_body;
      [@ocaml.doc
        "Specifies the content of the SSH public key as specified by the [PublicKeyId].\n\n\
        \ Transfer Family accepts RSA, ECDSA, and ED25519 keys.\n\
        \ "]
  ssh_public_key_id : ssh_public_key_id;
      [@ocaml.doc
        "Specifies the [SshPublicKeyId] parameter contains the identifier of the public key.\n"]
}
[@@ocaml.doc
  "Provides information about the public Secure Shell (SSH) key that is associated with a Transfer \
   Family user for the specific file transfer protocol-enabled server (as identified by \
   [ServerId]). The information returned includes the date the key was imported, the public key \
   contents, and the public key ID. A user can store more than one SSH public key associated with \
   their user name on a specific server.\n"]

type nonrec ssh_public_keys = ssh_public_key list [@@ocaml.doc ""]

type nonrec described_user = {
  arn : arn;
      [@ocaml.doc
        "Specifies the unique Amazon Resource Name (ARN) for the user that was requested to be \
         described.\n"]
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ In most cases, you can use this value instead of the session policy to lock your user \
         down to the designated home directory (\"[chroot]\"). To do this, you can set [Entry] to \
         '/' and set [Target] to the HomeDirectory parameter value.\n\
        \ "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n"]
  posix_profile : posix_profile option;
      [@ocaml.doc
        "Specifies the full POSIX identity, including user ID ([Uid]), group ID ([Gid]), and any \
         secondary groups IDs ([SecondaryGids]), that controls your users' access to your Amazon \
         Elastic File System (Amazon EFS) file systems. The POSIX permissions that are set on \
         files and directories in your file system determine the level of access your users get \
         when transferring files into and out of your Amazon EFS file systems.\n"]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  ssh_public_keys : ssh_public_keys option;
      [@ocaml.doc
        "Specifies the public key portion of the Secure Shell (SSH) keys stored for the described \
         user.\n\n\
        \  To delete the public key body, set its value to zero keys, as shown here:\n\
        \  \n\
        \    [SshPublicKeys: \\[\\]] \n\
        \   \n\
        \    "]
  tags : tags option;
      [@ocaml.doc
        "Specifies the key-value pairs for the user requested. Tag can be used to search for and \
         group users for a variety of purposes.\n"]
  user_name : user_name option;
      [@ocaml.doc
        "Specifies the name of the user that was requested to be described. User names are used \
         for authentication purposes. This is the string that will be used by your user when they \
         log in to your server.\n"]
}
[@@ocaml.doc "Describes the properties of a user that was specified.\n"]

type nonrec describe_user_response = {
  server_id : server_id;
      [@ocaml.doc "A system-assigned unique identifier for a server that has this user assigned.\n"]
  user : described_user;
      [@ocaml.doc
        "An array containing the properties of the Transfer Family user for the [ServerID] value \
         that you specified.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_request = {
  server_id : server_id;
      [@ocaml.doc "A system-assigned unique identifier for a server that has this user assigned.\n"]
  user_name : user_name;
      [@ocaml.doc
        "The name of the user assigned to one or more servers. User names are part of the sign-in \
         credentials to use the Transfer Family service and perform file transfer tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec described_web_app_vpc_config = {
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "The list of subnet IDs within the VPC where the web app endpoint is deployed. These \
         subnets must be in the same VPC and provide network connectivity for the endpoint.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc "The identifier of the VPC where the web app endpoint is hosted.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "The identifier of the VPC endpoint created for the web app.\n"]
}
[@@ocaml.doc
  "Contains the VPC configuration details for a web app endpoint, including the VPC identifier, \
   subnet IDs, and VPC endpoint ID used for hosting the endpoint.\n"]

type nonrec described_web_app_endpoint_details =
  | Vpc of described_web_app_vpc_config
      [@ocaml.doc
        "The VPC configuration details when the web app endpoint is hosted within a VPC. This \
         includes the VPC ID, subnet IDs, and VPC endpoint ID.\n"]
[@@ocaml.doc
  "Contains the endpoint configuration details for a web app, including VPC configuration when the \
   endpoint is hosted within a VPC.\n"]

type nonrec web_app_endpoint_type = PUBLIC [@ocaml.doc ""] | VPC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec web_app_endpoint = string [@@ocaml.doc ""]

type nonrec identity_center_application_arn = string [@@ocaml.doc ""]

type nonrec described_identity_center_config = {
  application_arn : identity_center_application_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM Identity Center application: this value is set \
         automatically when you create your web app.\n"]
  instance_arn : identity_center_instance_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM Identity Center used for the web app.\n"]
  role : role option; [@ocaml.doc "The IAM role in IAM Identity Center used for the web app.\n"]
}
[@@ocaml.doc
  "A structure that contains the details of the IAM Identity Center used for your web app. \
   Returned during a call to [DescribeWebApp].\n"]

type nonrec described_web_app_identity_provider_details =
  | IdentityCenterConfig of described_identity_center_config
      [@ocaml.doc
        "Returns a structure for your identity provider details. This structure contains the \
         instance ARN and role being used for the web app.\n"]
[@@ocaml.doc "Returns a structure that contains the identity provider details for your web app.\n"]

type nonrec described_web_app = {
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the web app.\n"]
  web_app_id : web_app_id; [@ocaml.doc "The unique identifier for the web app.\n"]
  described_identity_provider_details : described_web_app_identity_provider_details option;
      [@ocaml.doc
        "A structure that contains the details for the identity provider used by the web app.\n"]
  access_endpoint : web_app_access_endpoint option;
      [@ocaml.doc
        "The [AccessEndpoint] is the URL that you provide to your users for them to interact with \
         the Transfer Family web app. You can specify a custom URL or use the default value.\n"]
  web_app_endpoint : web_app_endpoint option;
      [@ocaml.doc
        "The [WebAppEndpoint] is the unique URL for your Transfer Family web app. This is the \
         value that you use when you configure {b Origins} on CloudFront.\n"]
  web_app_units : web_app_units option;
      [@ocaml.doc
        "A union that contains the value for number of concurrent connections or the user sessions \
         on your web app.\n"]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that can be used to group and search for web apps. Tags are metadata \
         attached to web apps for any purpose.\n"]
  web_app_endpoint_policy : web_app_endpoint_policy option;
      [@ocaml.doc
        " Setting for the type of endpoint policy for the web app. The default value is \
         [STANDARD]. \n\n\
        \ If your web app was created in an Amazon Web Services GovCloud (US) Region, the value of \
         this parameter can be [FIPS], which indicates the web app endpoint is FIPS-compliant.\n\
        \ "]
  endpoint_type : web_app_endpoint_type option;
      [@ocaml.doc
        "The type of endpoint hosting the web app. Valid values are [PUBLIC] for publicly \
         accessible endpoints and [VPC] for VPC-hosted endpoints that provide network isolation.\n"]
  described_endpoint_details : described_web_app_endpoint_details option;
      [@ocaml.doc
        "The endpoint configuration details for the web app, including VPC settings if the \
         endpoint is hosted within a VPC.\n"]
}
[@@ocaml.doc
  "A structure that describes the parameters for the web app, as identified by the [WebAppId].\n"]

type nonrec describe_web_app_response = {
  web_app : described_web_app;
      [@ocaml.doc "Returns a structure that contains the details of the web app.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_web_app_request = {
  web_app_id : web_app_id; [@ocaml.doc "Provide the unique identifier for the web app.\n"]
}
[@@ocaml.doc ""]

type nonrec web_app_favicon_file = bytes [@@ocaml.doc ""]

type nonrec web_app_logo_file = bytes [@@ocaml.doc ""]

type nonrec web_app_title = string [@@ocaml.doc ""]

type nonrec described_web_app_customization = {
  arn : arn; [@ocaml.doc "Returns the Amazon Resource Name (ARN) for the web app.\n"]
  web_app_id : web_app_id; [@ocaml.doc "Returns the unique identifier for your web app.\n"]
  title : web_app_title option;
      [@ocaml.doc "Returns the page title that you defined for your web app.\n"]
  logo_file : web_app_logo_file option;
      [@ocaml.doc "Returns a logo file data string (in base64 encoding).\n"]
  favicon_file : web_app_favicon_file option;
      [@ocaml.doc "Returns an icon file data string (in base64 encoding).\n"]
}
[@@ocaml.doc
  "A structure that contains the customization fields for the web app. You can provide a title, \
   logo, and icon to customize the appearance of your web app.\n"]

type nonrec describe_web_app_customization_response = {
  web_app_customization : described_web_app_customization;
      [@ocaml.doc "Returns a structure that contains the details of the web app customizations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_web_app_customization_request = {
  web_app_id : web_app_id; [@ocaml.doc "Provide the unique identifier for the web app.\n"]
}
[@@ocaml.doc ""]

type nonrec described_workflow = {
  arn : arn; [@ocaml.doc "Specifies the unique Amazon Resource Name (ARN) for the workflow.\n"]
  description : workflow_description option;
      [@ocaml.doc "Specifies the text description for the workflow.\n"]
  steps : workflow_steps option;
      [@ocaml.doc "Specifies the details for the steps that are in the specified workflow.\n"]
  on_exception_steps : workflow_steps option;
      [@ocaml.doc
        "Specifies the steps (actions) to take if errors are encountered during execution of the \
         workflow.\n"]
  workflow_id : workflow_id option; [@ocaml.doc "A unique identifier for the workflow.\n"]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that can be used to group and search for workflows. Tags are metadata \
         attached to workflows for any purpose.\n"]
}
[@@ocaml.doc "Describes the properties of the specified workflow\n"]

type nonrec describe_workflow_response = {
  workflow : described_workflow;
      [@ocaml.doc "The structure that contains the details of the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workflow_request = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec file_paths = file_path list [@@ocaml.doc ""]

type nonrec import_certificate_response = {
  certificate_id : certificate_id;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec private_key_type = string [@@ocaml.doc ""]

type nonrec import_certificate_request = {
  usage : certificate_usage_type;
      [@ocaml.doc
        "Specifies how this certificate is used. It can be used in the following ways:\n\n\
        \ {ul\n\
        \       {-   [SIGNING]: For signing AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTION]: For encrypting AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [TLS]: For securing AS2 communications sent over HTTPS\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  certificate : certificate_body_type;
      [@ocaml.doc
        "{ul\n\
        \      {-  For the CLI, provide a file path for a certificate in URI format. For example, \
         [--certificate file://encryption-cert.pem]. Alternatively, you can provide the raw \
         content.\n\
        \          \n\
        \           }\n\
        \      {-  For the SDK, specify the raw content of a certificate file. For example, \
         [--certificate \"`cat encryption-cert.pem`\"].\n\
        \          \n\
        \           }\n\
        \      }\n\
        \    You can provide both the certificate and its chain in this parameter, without needing \
         to use the [CertificateChain] parameter. If you use this parameter for both the \
         certificate and its chain, do not use the [CertificateChain] parameter.\n\
        \    \n\
        \     "]
  certificate_chain : certificate_chain_type option;
      [@ocaml.doc
        "An optional list of certificates that make up the chain for the certificate that's being \
         imported.\n"]
  private_key : private_key_type option;
      [@ocaml.doc
        "{ul\n\
        \      {-  For the CLI, provide a file path for a private key in URI format. For example, \
         [--private-key file://encryption-key.pem]. Alternatively, you can provide the raw content \
         of the private key file.\n\
        \          \n\
        \           }\n\
        \      {-  For the SDK, specify the raw content of a private key file. For example, \
         [--private-key \"`cat encryption-key.pem`\"] \n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
  active_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes active. If you do not \
         specify a value, [ActiveDate] takes the same value as [NotBeforeDate], which is specified \
         by the CA. \n"]
  inactive_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes inactive. If you do not \
         specify a value, [InactiveDate] takes the same value as [NotAfterDate], which is \
         specified by the CA.\n"]
  description : description option;
      [@ocaml.doc "A short description that helps identify the certificate. \n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec import_host_key_response = {
  server_id : server_id;
      [@ocaml.doc "Returns the server identifier that contains the imported key.\n"]
  host_key_id : host_key_id; [@ocaml.doc "Returns the host key identifier for the imported key.\n"]
}
[@@ocaml.doc ""]

type nonrec import_host_key_request = {
  server_id : server_id;
      [@ocaml.doc
        "The identifier of the server that contains the host key that you are importing.\n"]
  host_key_body : host_key;
      [@ocaml.doc
        "The private key portion of an SSH key pair.\n\n\
        \ Transfer Family accepts RSA, ECDSA, and ED25519 keys.\n\
        \ "]
  description : host_key_description option;
      [@ocaml.doc "The text description that identifies this host key.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs that can be used to group and search for host keys.\n"]
}
[@@ocaml.doc ""]

type nonrec import_ssh_public_key_response = {
  server_id : server_id; [@ocaml.doc "A system-assigned unique identifier for a server.\n"]
  ssh_public_key_id : ssh_public_key_id;
      [@ocaml.doc "The name given to a public key by the system that was imported.\n"]
  user_name : user_name;
      [@ocaml.doc "A user name assigned to the [ServerID] value that you specified.\n"]
}
[@@ocaml.doc
  "Identifies the user, the server they belong to, and the identifier of the SSH public key \
   associated with that user. A user can have more than one key on each server that they are \
   associated with.\n"]

type nonrec import_ssh_public_key_request = {
  server_id : server_id; [@ocaml.doc "A system-assigned unique identifier for a server.\n"]
  ssh_public_key_body : ssh_public_key_body;
      [@ocaml.doc
        "The public key portion of an SSH key pair.\n\n\
        \ Transfer Family accepts RSA, ECDSA, and ED25519 keys.\n\
        \ "]
  user_name : user_name;
      [@ocaml.doc "The name of the Transfer Family user that is assigned to one or more servers.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : message [@ocaml.doc ""] }
[@@ocaml.doc "The [NextToken] parameter that was passed is invalid.\n"]

type nonrec listed_access = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  external_id : external_id option;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc "Lists the properties for one or more specified associated accesses.\n"]

type nonrec listed_accesses = listed_access list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_accesses_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListAccesses] call, a [NextToken] parameter \
         is returned in the output. You can then pass in a subsequent command to the [NextToken] \
         parameter to continue listing additional accesses.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that has users assigned to it.\n"]
  accesses : listed_accesses;
      [@ocaml.doc
        "Returns the accesses and their properties for the [ServerId] value that you specify.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_accesses_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListAccesses] call, a [NextToken] parameter \
         is returned in the output. You can then pass in a subsequent command to the [NextToken] \
         parameter to continue listing additional accesses.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that has users assigned to it.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_agreement = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the specified agreement.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
  description : description option;
      [@ocaml.doc
        "The current description for the agreement. You can change it by calling the \
         [UpdateAgreement] operation and providing a new description. \n"]
  status : agreement_status_type option;
      [@ocaml.doc "The agreement can be either [ACTIVE] or [INACTIVE].\n"]
  server_id : server_id option; [@ocaml.doc "The unique identifier for the agreement.\n"]
  local_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the AS2 local profile.\n"]
  partner_profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the partner profile.\n"]
}
[@@ocaml.doc "Describes the properties of an agreement.\n"]

type nonrec listed_agreements = listed_agreement list [@@ocaml.doc ""]

type nonrec list_agreements_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Returns a token that you can use to call [ListAgreements] again and receive additional \
         results, if there are any.\n"]
  agreements : listed_agreements;
      [@ocaml.doc "Returns an array, where each item contains the details of an agreement.\n"]
}
[@@ocaml.doc ""]

type nonrec list_agreements_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListAgreements] call, a [NextToken] \
         parameter is returned in the output. You can then pass in a subsequent command to the \
         [NextToken] parameter to continue listing additional agreements.\n"]
  server_id : server_id;
      [@ocaml.doc "The identifier of the server for which you want a list of agreements.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_certificate = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the specified certificate.\n"]
  certificate_id : certificate_id option;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
  usage : certificate_usage_type option;
      [@ocaml.doc
        "Specifies how this certificate is used. It can be used in the following ways:\n\n\
        \ {ul\n\
        \       {-   [SIGNING]: For signing AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [ENCRYPTION]: For encrypting AS2 messages\n\
        \           \n\
        \            }\n\
        \       {-   [TLS]: For securing AS2 communications sent over HTTPS\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status : certificate_status_type option;
      [@ocaml.doc
        "The certificate can be either [ACTIVE], [PENDING_ROTATION], or [INACTIVE]. \
         [PENDING_ROTATION] means that this certificate will replace the current certificate when \
         it expires.\n"]
  active_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes active. If you do not \
         specify a value, [ActiveDate] takes the same value as [NotBeforeDate], which is specified \
         by the CA. \n"]
  inactive_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes inactive. If you do not \
         specify a value, [InactiveDate] takes the same value as [NotAfterDate], which is \
         specified by the CA.\n"]
  type_ : certificate_type option;
      [@ocaml.doc
        "The type for the certificate. If a private key has been specified for the certificate, \
         its type is [CERTIFICATE_WITH_PRIVATE_KEY]. If there is no private key, the type is \
         [CERTIFICATE].\n"]
  description : description option;
      [@ocaml.doc "The name or short description that's used to identify the certificate.\n"]
}
[@@ocaml.doc "Describes the properties of a certificate.\n"]

type nonrec listed_certificates = listed_certificate list [@@ocaml.doc ""]

type nonrec list_certificates_response = {
  next_token : next_token option;
      [@ocaml.doc "Returns the next token, which you can use to list the next certificate.\n"]
  certificates : listed_certificates;
      [@ocaml.doc
        "Returns an array of the certificates that are specified in the [ListCertificates] call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_certificates_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListCertificates] call, a [NextToken] \
         parameter is returned in the output. You can then pass in a subsequent command to the \
         [NextToken] parameter to continue listing additional certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_connector = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the specified connector.\n"]
  connector_id : connector_id option; [@ocaml.doc "The unique identifier for the connector.\n"]
  url : url option;
      [@ocaml.doc
        "The URL of the partner's AS2 or SFTP endpoint.\n\n\
        \ When creating AS2 connectors or service-managed SFTP connectors (connectors without \
         egress configuration), you must provide a URL to specify the remote server endpoint. For \
         VPC Lattice type connectors, the URL must be null.\n\
        \ "]
}
[@@ocaml.doc "Returns details of the connector that is specified.\n"]

type nonrec listed_connectors = listed_connector list [@@ocaml.doc ""]

type nonrec list_connectors_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Returns a token that you can use to call [ListConnectors] again and receive additional \
         results, if there are any.\n"]
  connectors : listed_connectors;
      [@ocaml.doc "Returns an array, where each item contains the details of a connector.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connectors_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListConnectors] call, a [NextToken] \
         parameter is returned in the output. You can then pass in a subsequent command to the \
         [NextToken] parameter to continue listing additional connectors.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_execution = {
  execution_id : execution_id option;
      [@ocaml.doc "A unique identifier for the execution of a workflow.\n"]
  initial_file_location : file_location option;
      [@ocaml.doc
        "A structure that describes the Amazon S3 or EFS file location. This is the file location \
         when the execution begins: if the file is being copied, this is the initial (as opposed \
         to destination) file location.\n"]
  service_metadata : service_metadata option;
      [@ocaml.doc
        "A container object for the session details that are associated with a workflow.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The status is one of the execution. Can be in progress, completed, exception encountered, \
         or handling the exception.\n"]
}
[@@ocaml.doc "Returns properties of the execution that is specified.\n"]

type nonrec listed_executions = listed_execution list [@@ocaml.doc ""]

type nonrec list_executions_response = {
  next_token : next_token option;
      [@ocaml.doc
        " [ListExecutions] returns the [NextToken] parameter in the output. You can then pass the \
         [NextToken] parameter in a subsequent command to continue listing additional executions.\n"]
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
  executions : listed_executions;
      [@ocaml.doc "Returns the details for each execution, in a [ListedExecution] array.\n"]
}
[@@ocaml.doc ""]

type nonrec list_executions_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " [ListExecutions] returns the [NextToken] parameter in the output. You can then pass the \
         [NextToken] parameter in a subsequent command to continue listing additional executions.\n\n\
        \  This is useful for pagination, for instance. If you have 100 executions for a workflow, \
         you might only want to list first 10. If so, call the API by specifying the \
         [max-results]: \n\
        \ \n\
        \   [aws transfer list-executions --max-results 10] \n\
        \  \n\
        \    This returns details for the first 10 executions, as well as the pointer \
         ([NextToken]) to the eleventh execution. You can now call the API again, supplying the \
         [NextToken] value you received: \n\
        \   \n\
        \     [aws transfer list-executions --max-results 10 --next-token \
         $somePointerReturnedFromPreviousListResult] \n\
        \    \n\
        \      This call returns the next 10 executions, the 11th through the 20th. You can then \
         repeat the call until the details for all 100 executions have been returned. \n\
        \     "]
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec list_file_transfer_results_response = {
  file_transfer_results : connector_file_transfer_results;
      [@ocaml.doc
        "Returns the details for the files transferred in the transfer identified by the \
         [TransferId] and [ConnectorId] specified.\n\n\
        \ {ul\n\
        \       {-   [FilePath]: the filename and path to where the file was sent to or retrieved \
         from.\n\
        \           \n\
        \            }\n\
        \       {-   [StatusCode]: current status for the transfer. The status returned is one of \
         the following values:[QUEUED], [IN_PROGRESS], [COMPLETED], or [FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [FailureCode]: for transfers that fail, this parameter contains a code \
         indicating the reason. For example, [RETRIEVE_FILE_NOT_FOUND] \n\
        \           \n\
        \            }\n\
        \       {-   [FailureMessage]: for transfers that fail, this parameter describes the \
         reason for the failure.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "Returns a token that you can use to call [ListFileTransferResults] again and receive \
         additional results, if there are any (against the same [TransferId].\n"]
}
[@@ocaml.doc ""]

type nonrec transfer_id = string [@@ocaml.doc ""]

type nonrec list_file_transfer_results_request = {
  connector_id : connector_id;
      [@ocaml.doc
        "A unique identifier for a connector. This value should match the value supplied to the \
         corresponding [StartFileTransfer] call.\n"]
  transfer_id : transfer_id;
      [@ocaml.doc
        "A unique identifier for a file transfer. This value should match the value supplied to \
         the corresponding [StartFileTransfer] call.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If there are more file details than returned in this call, use this value for a \
         subsequent call to [ListFileTransferResults] to retrieve them.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of files to return in a single page. Note that currently you can \
         specify a maximum of 10 file paths in a single \
         {{:https://docs.aws.amazon.com/transfer/latest/APIReference/API_StartFileTransfer.html}StartFileTransfer} \
         operation. Thus, the maximum number of file transfer results that can be returned in a \
         single page is 10. \n"]
}
[@@ocaml.doc ""]

type nonrec listed_host_key = {
  arn : arn; [@ocaml.doc "The unique Amazon Resource Name (ARN) of the host key.\n"]
  host_key_id : host_key_id option; [@ocaml.doc "A unique identifier for the host key.\n"]
  fingerprint : host_key_fingerprint option;
      [@ocaml.doc
        "The public key fingerprint, which is a short sequence of bytes used to identify the \
         longer public key.\n"]
  description : host_key_description option;
      [@ocaml.doc
        "The current description for the host key. You can change it by calling the \
         [UpdateHostKey] operation and providing a new description.\n"]
  type_ : host_key_type option;
      [@ocaml.doc
        "The encryption algorithm that is used for the host key. The [Type] parameter is specified \
         by using one of the following values:\n\n\
        \ {ul\n\
        \       {-   [ssh-rsa] \n\
        \           \n\
        \            }\n\
        \       {-   [ssh-ed25519] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp256] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp384] \n\
        \           \n\
        \            }\n\
        \       {-   [ecdsa-sha2-nistp521] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  date_imported : date_imported option;
      [@ocaml.doc "The date on which the host key was added to the server.\n"]
}
[@@ocaml.doc "Returns properties of the host key that's specified.\n"]

type nonrec listed_host_keys = listed_host_key list [@@ocaml.doc ""]

type nonrec list_host_keys_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Returns a token that you can use to call [ListHostKeys] again and receive additional \
         results, if there are any.\n"]
  server_id : server_id;
      [@ocaml.doc "Returns the server identifier that contains the listed host keys.\n"]
  host_keys : listed_host_keys;
      [@ocaml.doc "Returns an array, where each item contains the details of a host key.\n"]
}
[@@ocaml.doc ""]

type nonrec list_host_keys_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When there are additional results that were not returned, a [NextToken] parameter is \
         returned. You can use that value for a subsequent call to [ListHostKeys] to continue \
         listing results.\n"]
  server_id : server_id;
      [@ocaml.doc
        "The identifier of the server that contains the host keys that you want to view.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_profile = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the specified profile.\n"]
  profile_id : profile_id option;
      [@ocaml.doc "A unique identifier for the local or partner AS2 profile.\n"]
  as2_id : as2_id option;
      [@ocaml.doc
        "The [As2Id] is the {i AS2-name}, as defined in the \
         {{:https://datatracker.ietf.org/doc/html/rfc4130}RFC 4130}. For inbound transfers, this \
         is the [AS2-From] header for the AS2 messages sent from the partner. For outbound \
         connectors, this is the [AS2-To] header for the AS2 messages sent to the partner using \
         the [StartFileTransfer] API operation. This ID cannot include spaces.\n"]
  profile_type : profile_type option;
      [@ocaml.doc
        "Indicates whether to list only [LOCAL] type profiles or only [PARTNER] type profiles. If \
         not supplied in the request, the command lists all types of profiles.\n"]
}
[@@ocaml.doc "Returns the properties of the profile that was specified.\n"]

type nonrec listed_profiles = listed_profile list [@@ocaml.doc ""]

type nonrec list_profiles_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Returns a token that you can use to call [ListProfiles] again and receive additional \
         results, if there are any.\n"]
  profiles : listed_profiles;
      [@ocaml.doc "Returns an array, where each item contains the details of a profile.\n"]
}
[@@ocaml.doc ""]

type nonrec list_profiles_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When there are additional results that were not returned, a [NextToken] parameter is \
         returned. You can use that value for a subsequent call to [ListProfiles] to continue \
         listing results.\n"]
  profile_type : profile_type option;
      [@ocaml.doc
        "Indicates whether to list only [LOCAL] type profiles or only [PARTNER] type profiles. If \
         not supplied in the request, the command lists all types of profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec security_policy_names = security_policy_name list [@@ocaml.doc ""]

type nonrec list_security_policies_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListSecurityPolicies] operation, a \
         [NextToken] parameter is returned in the output. In a following command, you can pass in \
         the [NextToken] parameter to continue listing security policies.\n"]
  security_policy_names : security_policy_names;
      [@ocaml.doc "An array of security policies that were listed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_security_policies_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the number of security policies to return as a response to the \
         [ListSecurityPolicies] query.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When additional results are obtained from the [ListSecurityPolicies] command, a \
         [NextToken] parameter is returned in the output. You can then pass the [NextToken] \
         parameter in a subsequent command to continue listing additional security policies.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_server = {
  arn : arn;
      [@ocaml.doc "Specifies the unique Amazon Resource Name (ARN) for a server to be listed.\n"]
  domain : domain option;
      [@ocaml.doc
        "Specifies the domain of the storage system that is used for file transfers. There are two \
         domains available: Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File \
         System (Amazon EFS). The default value is S3.\n"]
  identity_provider_type : identity_provider_type option;
      [@ocaml.doc
        "The mode of authentication for a server. The default value is [SERVICE_MANAGED], which \
         allows you to store and access user credentials within the Transfer Family service.\n\n\
        \ Use [AWS_DIRECTORY_SERVICE] to provide access to Active Directory groups in Directory \
         Service for Microsoft Active Directory or Microsoft Active Directory in your on-premises \
         environment or in Amazon Web Services using AD Connector. This option also requires you \
         to provide a Directory ID by using the [IdentityProviderDetails] parameter.\n\
        \ \n\
        \  Use the [API_GATEWAY] value to integrate with an identity provider of your choosing. \
         The [API_GATEWAY] setting requires you to provide an Amazon API Gateway endpoint URL to \
         call for authentication by using the [IdentityProviderDetails] parameter.\n\
        \  \n\
        \   Use the [AWS_LAMBDA] value to directly use an Lambda function as your identity \
         provider. If you choose this value, you must specify the ARN for the Lambda function in \
         the [Function] parameter for the [IdentityProviderDetails] data type.\n\
        \   "]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "Specifies the type of VPC endpoint that your server is connected to. If your server is \
         connected to a VPC endpoint, your server isn't accessible over the public internet.\n"]
  logging_role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a server to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. \
         When set, you can view user activity in your CloudWatch logs.\n"]
  server_id : server_id option;
      [@ocaml.doc
        "Specifies the unique system assigned identifier for the servers that were listed.\n"]
  state : state option;
      [@ocaml.doc
        "The condition of the server that was described. A value of [ONLINE] indicates that the \
         server can accept jobs and transfer files. A [State] value of [OFFLINE] means that the \
         server cannot perform file transfer operations.\n\n\
        \ The states of [STARTING] and [STOPPING] indicate that the server is in an intermediate \
         state, either not fully able to respond, or not fully offline. The values of \
         [START_FAILED] or [STOP_FAILED] can indicate an error condition.\n\
        \ "]
  user_count : user_count option;
      [@ocaml.doc
        "Specifies the number of users that are assigned to a server you specified with the \
         [ServerId].\n"]
}
[@@ocaml.doc "Returns properties of a file transfer protocol-enabled server that was specified.\n"]

type nonrec listed_servers = listed_server list [@@ocaml.doc ""]

type nonrec list_servers_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListServers] operation, a [NextToken] \
         parameter is returned in the output. In a following command, you can pass in the \
         [NextToken] parameter to continue listing additional servers.\n"]
  servers : listed_servers; [@ocaml.doc "An array of servers that were listed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_servers_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the number of servers to return as a response to the [ListServers] query.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When additional results are obtained from the [ListServers] command, a [NextToken] \
         parameter is returned in the output. You can then pass the [NextToken] parameter in a \
         subsequent command to continue listing additional servers.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  arn : arn option; [@ocaml.doc "The ARN you specified to list the tags of.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListTagsForResource] call, a [NextToken] \
         parameter is returned in the output. You can then pass in a subsequent command to the \
         [NextToken] parameter to continue listing additional tags.\n"]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs that are assigned to a resource, usually for the purpose of grouping and \
         searching for items. Tags are metadata that you define.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  arn : arn;
      [@ocaml.doc
        "Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an \
         identifier for a specific Amazon Web Services resource, such as a server, user, or role.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the number of tags to return as a response to the [ListTagsForResource] request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When you request additional results from the [ListTagsForResource] operation, a \
         [NextToken] parameter is returned in the input. You can then pass in a subsequent command \
         to the [NextToken] parameter to continue listing additional tags.\n"]
}
[@@ocaml.doc ""]

type nonrec ssh_public_key_count = int [@@ocaml.doc ""]

type nonrec listed_user = {
  arn : arn;
      [@ocaml.doc
        "Provides the unique Amazon Resource Name (ARN) for the user that you want to learn about.\n"]
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n\n\
        \  The IAM role that controls your users' access to your Amazon S3 bucket for servers with \
         [Domain=S3], or your EFS file system for servers with [Domain=EFS]. \n\
        \  \n\
        \   The policies attached to this role determine the level of access you want to provide \
         your users when transferring files into and out of your S3 buckets or EFS file systems.\n\
        \   \n\
        \    "]
  ssh_public_key_count : ssh_public_key_count option;
      [@ocaml.doc "Specifies the number of SSH public keys stored for the user you specified.\n"]
  user_name : user_name option;
      [@ocaml.doc
        "Specifies the name of the user whose ARN was specified. User names are used for \
         authentication purposes.\n"]
}
[@@ocaml.doc "Returns properties of the user that you specify.\n"]

type nonrec listed_users = listed_user list [@@ocaml.doc ""]

type nonrec list_users_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When you can get additional results from the [ListUsers] call, a [NextToken] parameter is \
         returned in the output. You can then pass in a subsequent command to the [NextToken] \
         parameter to continue listing additional users.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that the users are assigned to.\n"]
  users : listed_users;
      [@ocaml.doc
        "Returns the Transfer Family users and their properties for the [ServerId] value that you \
         specify.\n"]
}
[@@ocaml.doc ""]

type nonrec list_users_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the number of users to return as a response to the [ListUsers] request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If there are additional results from the [ListUsers] call, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] to a subsequent [ListUsers] \
         command, to continue listing additional users.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that has users assigned to it.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_web_app = {
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for the web app.\n"]
  web_app_id : web_app_id; [@ocaml.doc "The unique identifier for the web app.\n"]
  access_endpoint : web_app_access_endpoint option;
      [@ocaml.doc
        "The [AccessEndpoint] is the URL that you provide to your users for them to interact with \
         the Transfer Family web app. You can specify a custom URL or use the default value.\n"]
  web_app_endpoint : web_app_endpoint option;
      [@ocaml.doc
        "The [WebAppEndpoint] is the unique URL for your Transfer Family web app. This is the \
         value that you use when you configure {b Origins} on CloudFront.\n"]
  endpoint_type : web_app_endpoint_type option;
      [@ocaml.doc
        "The type of endpoint hosting the web app. Valid values are [PUBLIC] for publicly \
         accessible endpoints and [VPC] for VPC-hosted endpoints.\n"]
}
[@@ocaml.doc " a structure that contains details for the web app.\n"]

type nonrec listed_web_apps = listed_web_app list [@@ocaml.doc ""]

type nonrec list_web_apps_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Provide this value for the [NextToken] parameter in a subsequent command to continue \
         listing additional web apps.\n"]
  web_apps : listed_web_apps;
      [@ocaml.doc
        "Returns, for each listed web app, a structure that contains details for the web app.\n"]
}
[@@ocaml.doc ""]

type nonrec list_web_apps_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Returns the [NextToken] parameter in the output. You can then pass the [NextToken] \
         parameter in a subsequent command to continue listing additional web apps.\n"]
}
[@@ocaml.doc ""]

type nonrec listed_workflow = {
  workflow_id : workflow_id option; [@ocaml.doc "A unique identifier for the workflow.\n"]
  description : workflow_description option;
      [@ocaml.doc "Specifies the text description for the workflow.\n"]
  arn : arn option;
      [@ocaml.doc "Specifies the unique Amazon Resource Name (ARN) for the workflow.\n"]
}
[@@ocaml.doc
  "Contains the identifier, text description, and Amazon Resource Name (ARN) for the workflow.\n"]

type nonrec listed_workflows = listed_workflow list [@@ocaml.doc ""]

type nonrec list_workflows_response = {
  next_token : next_token option;
      [@ocaml.doc
        " [ListWorkflows] returns the [NextToken] parameter in the output. You can then pass the \
         [NextToken] parameter in a subsequent command to continue listing additional workflows.\n"]
  workflows : listed_workflows;
      [@ocaml.doc "Returns the [Arn], [WorkflowId], and [Description] for each workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workflows_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " [ListWorkflows] returns the [NextToken] parameter in the output. You can then pass the \
         [NextToken] parameter in a subsequent command to continue listing additional workflows.\n"]
}
[@@ocaml.doc ""]

type nonrec listing_id = string [@@ocaml.doc ""]

type nonrec max_items = int [@@ocaml.doc ""]

type nonrec move_id = string [@@ocaml.doc ""]

type nonrec output_file_name = string [@@ocaml.doc ""]

type nonrec profile_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec response = string [@@ocaml.doc ""]

type nonrec send_workflow_step_state_response = unit [@@ocaml.doc ""]

type nonrec send_workflow_step_state_request = {
  workflow_id : workflow_id; [@ocaml.doc "A unique identifier for the workflow.\n"]
  execution_id : execution_id; [@ocaml.doc "A unique identifier for the execution of a workflow.\n"]
  token : callback_token;
      [@ocaml.doc
        "Used to distinguish between multiple callbacks for multiple Lambda steps within the same \
         execution.\n"]
  status : custom_step_status;
      [@ocaml.doc "Indicates whether the specified step succeeded or failed.\n"]
}
[@@ocaml.doc ""]

type nonrec server_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec sftp_connector_host_key = string [@@ocaml.doc ""]

type nonrec sftp_connector_connection_details = {
  host_key : sftp_connector_host_key option;
      [@ocaml.doc
        "The SSH public key of the remote SFTP server. This is returned during the initial \
         connection attempt when you call [TestConnection]. It allows you to retrieve the valid \
         server host key to update the connector when you are unable to obtain it in advance.\n"]
}
[@@ocaml.doc "Contains the details for an SFTP connector connection.\n"]

type nonrec source_ip = string [@@ocaml.doc ""]

type nonrec start_directory_listing_response = {
  listing_id : listing_id;
      [@ocaml.doc "Returns a unique identifier for the directory listing call.\n"]
  output_file_name : output_file_name;
      [@ocaml.doc
        "Returns the file name where the results are stored. This is a combination of the \
         connector ID and the listing ID: [<connector-id>-<listing-id>.json].\n"]
}
[@@ocaml.doc ""]

type nonrec start_directory_listing_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
  remote_directory_path : file_path;
      [@ocaml.doc
        "Specifies the directory on the remote SFTP server for which you want to list its contents.\n"]
  max_items : max_items option;
      [@ocaml.doc
        "An optional parameter where you can specify the maximum number of file/directory names to \
         retrieve. The default value is 1,000.\n"]
  output_directory_path : file_path;
      [@ocaml.doc
        "Specifies the path (bucket and prefix) in Amazon S3 storage to store the results of the \
         directory listing.\n"]
}
[@@ocaml.doc ""]

type nonrec start_file_transfer_response = {
  transfer_id : transfer_id; [@ocaml.doc "Returns the unique identifier for the file transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec start_file_transfer_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
  send_file_paths : file_paths option;
      [@ocaml.doc
        "One or more source paths for the Amazon S3 storage. Each string represents a source file \
         path for one outbound file transfer. For example, \n\
         {[\n\
        \ {i amzn-s3-demo-bucket}/{i myfile.txt} \n\
         ]}\n\
         .\n\n\
        \  Replace \n\
        \  {[\n\
        \   {i amzn-s3-demo-bucket} \n\
        \  ]}\n\
        \   with one of your actual buckets.\n\
        \  \n\
        \   "]
  retrieve_file_paths : file_paths option;
      [@ocaml.doc
        "One or more source paths for the partner's SFTP server. Each string represents a source \
         file path for one inbound file transfer.\n"]
  local_directory_path : file_path option;
      [@ocaml.doc
        "For an inbound transfer, the [LocaDirectoryPath] specifies the destination for one or \
         more files that are transferred from the partner's SFTP server.\n"]
  remote_directory_path : file_path option;
      [@ocaml.doc
        "For an outbound transfer, the [RemoteDirectoryPath] specifies the destination for one or \
         more files that are transferred to the partner's SFTP server. If you don't specify a \
         [RemoteDirectoryPath], the destination for transferred files is the SFTP user's home \
         directory.\n"]
  custom_http_headers : custom_http_headers option;
      [@ocaml.doc
        "An array of key-value pairs that represent custom HTTP headers to include in AS2 \
         messages. These headers are added to the AS2 message when sending files to your trading \
         partner.\n"]
}
[@@ocaml.doc ""]

type nonrec start_remote_delete_response = {
  delete_id : delete_id; [@ocaml.doc "Returns a unique identifier for the delete operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_remote_delete_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
  delete_path : file_path;
      [@ocaml.doc
        "The absolute path of the file or directory to delete. You can only specify one path per \
         call to this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_remote_move_response = {
  move_id : move_id; [@ocaml.doc "Returns a unique identifier for the move/rename operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_remote_move_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
  source_path : file_path;
      [@ocaml.doc
        "The absolute path of the file or directory to move or rename. You can only specify one \
         path per call to this operation.\n"]
  target_path : file_path;
      [@ocaml.doc "The absolute path for the target of the move/rename operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_server_request = {
  server_id : server_id;
      [@ocaml.doc "A system-assigned unique identifier for a server that you start.\n"]
}
[@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec status_code = int [@@ocaml.doc ""]

type nonrec stop_server_request = {
  server_id : server_id;
      [@ocaml.doc "A system-assigned unique identifier for a server that you stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  arn : arn;
      [@ocaml.doc
        "An Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a \
         server, user, or role.\n"]
  tags : tags;
      [@ocaml.doc
        "Key-value pairs assigned to ARNs that you can use to group and search for resources by \
         type. You can attach this metadata to resources (servers, users, workflows, and so on) \
         for any purpose.\n"]
}
[@@ocaml.doc ""]

type nonrec test_connection_response = {
  connector_id : connector_id option;
      [@ocaml.doc "Returns the identifier of the connector object that you are testing.\n"]
  status : status option;
      [@ocaml.doc "Returns [OK] for successful test, or [ERROR] if the test fails.\n"]
  status_message : message option;
      [@ocaml.doc
        "Returns [Connection succeeded] if the test is successful. Or, returns a descriptive error \
         message if the test fails. The following list provides troubleshooting details, depending \
         on the error message that you receive.\n\n\
        \ {ul\n\
        \       {-  Verify that your secret name aligns with the one in Transfer Role permissions.\n\
        \           \n\
        \            }\n\
        \       {-  Verify the server URL in the connector configuration , and verify that the \
         login credentials work successfully outside of the connector.\n\
        \           \n\
        \            }\n\
        \       {-  Verify that the secret exists and is formatted correctly.\n\
        \           \n\
        \            }\n\
        \       {-  Verify that the trusted host key in the connector configuration matches the \
         [ssh-keyscan] output.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sftp_connection_details : sftp_connector_connection_details option;
      [@ocaml.doc "Structure that contains the SFTP connector host key.\n"]
}
[@@ocaml.doc ""]

type nonrec test_connection_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
}
[@@ocaml.doc ""]

type nonrec test_identity_provider_response = {
  response : response option;
      [@ocaml.doc "The response that is returned from your API Gateway or your Lambda function.\n"]
  status_code : status_code;
      [@ocaml.doc
        "The HTTP status code that is the response from your API Gateway or your Lambda function.\n"]
  message : message option;
      [@ocaml.doc
        "A message that indicates whether the test was successful or not.\n\n\
        \  If an empty string is returned, the most likely cause is that the authentication failed \
         due to an incorrect username or password.\n\
        \  \n\
        \   "]
  url : url; [@ocaml.doc "The endpoint of the service used to authenticate a user.\n"]
}
[@@ocaml.doc ""]

type nonrec user_password = string [@@ocaml.doc ""]

type nonrec test_identity_provider_request = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned identifier for a specific server. That server's user authentication \
         method is tested with a user name and password.\n"]
  server_protocol : protocol option;
      [@ocaml.doc
        "The type of file transfer protocol to be tested.\n\n\
        \ The available protocols are:\n\
        \ \n\
        \  {ul\n\
        \        {-  Secure Shell (SSH) File Transfer Protocol (SFTP)\n\
        \            \n\
        \             }\n\
        \        {-  File Transfer Protocol Secure (FTPS)\n\
        \            \n\
        \             }\n\
        \        {-  File Transfer Protocol (FTP)\n\
        \            \n\
        \             }\n\
        \        {-  Applicability Statement 2 (AS2)\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source_ip : source_ip option; [@ocaml.doc "The source IP address of the account to be tested.\n"]
  user_name : user_name; [@ocaml.doc "The name of the account to be tested.\n"]
  user_password : user_password option; [@ocaml.doc "The password of the account to be tested.\n"]
}
[@@ocaml.doc ""]

type nonrec update_host_key_response = {
  server_id : server_id;
      [@ocaml.doc
        "Returns the server identifier for the server that contains the updated host key.\n"]
  host_key_id : host_key_id;
      [@ocaml.doc "Returns the host key identifier for the updated host key.\n"]
}
[@@ocaml.doc ""]

type nonrec update_host_key_request = {
  server_id : server_id;
      [@ocaml.doc
        "The identifier of the server that contains the host key that you are updating.\n"]
  host_key_id : host_key_id; [@ocaml.doc "The identifier of the host key that you are updating.\n"]
  description : host_key_description; [@ocaml.doc "An updated description for the host key.\n"]
}
[@@ocaml.doc ""]

type nonrec update_access_response = {
  server_id : server_id; [@ocaml.doc "The identifier of the server that the user is attached to.\n"]
  external_id : external_id;
      [@ocaml.doc
        "The external identifier of the group whose users have access to your Amazon S3 or Amazon \
         EFS resources over the enabled protocols using Amazon Web ServicesTransfer Family.\n"]
}
[@@ocaml.doc ""]

type nonrec update_access_request = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ The following is an [Entry] and [Target] pair example.\n\
        \ \n\
        \   [\\[ { \"Entry\": \"/directory1\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \  \n\
        \   In most cases, you can use this value instead of the session policy to lock down your \
         user to the designated home directory (\"[chroot]\"). To do this, you can set [Entry] to \
         [/] and set [Target] to the [HomeDirectory] parameter value.\n\
        \   \n\
        \    The following is an [Entry] and [Target] pair example for [chroot].\n\
        \    \n\
        \      [\\[ { \"Entry\": \"/\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \     "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n\n\
        \  This policy applies only when the domain of [ServerId] is Amazon S3. Amazon EFS does \
         not use session policies.\n\
        \  \n\
        \   For session policies, Transfer Family stores the policy as a JSON blob, instead of the \
         Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it \
         in the [Policy] argument.\n\
        \   \n\
        \    For an example of a session policy, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html}Example \
         session policy}.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html}AssumeRole} in \
         the {i Amazon Web ServicesSecurity Token Service API Reference}.\n\
        \     \n\
        \      "]
  posix_profile : posix_profile option; [@ocaml.doc ""]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This is the specific server \
         that you added your user to.\n"]
  external_id : external_id;
      [@ocaml.doc
        "A unique identifier that is required to identify specific groups within your directory. \
         The users of the group that you associate have access to your Amazon S3 or Amazon EFS \
         resources over the enabled protocols using Transfer Family. If you know the group name, \
         you can view the SID values by running the following command using Windows PowerShell.\n\n\
        \  \n\
        \ {[\n\
        \ Get-ADGroup -Filter \\{samAccountName -like \"{i YourGroupName}*\"\\} -Properties * | \
         Select SamAccountName,ObjectSid\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  In that command, replace {i YourGroupName} with the name of your Active Directory group.\n\
        \  \n\
        \   The regular expression used to validate this parameter is a string of characters \
         consisting of uppercase and lowercase alphanumeric characters with no spaces. You can \
         also include underscores or any of the following characters: =,.\\@:/-\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_request = {
  arn : arn;
      [@ocaml.doc
        "The value of the resource that will have the tag removed. An Amazon Resource Name (ARN) \
         is an identifier for a specific Amazon Web Services resource, such as a server, user, or \
         role.\n"]
  tag_keys : tag_keys;
      [@ocaml.doc
        "TagKeys are key-value pairs assigned to ARNs that can be used to group and search for \
         resources by type. This metadata can be attached to resources for any purpose.\n"]
}
[@@ocaml.doc ""]

type nonrec update_agreement_response = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
}
[@@ocaml.doc ""]

type nonrec update_agreement_request = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "A unique identifier for the agreement. This identifier is returned when you create an \
         agreement.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance. This is the specific server \
         that the agreement uses.\n"]
  description : description option;
      [@ocaml.doc
        "To replace the existing description, provide a short description for the agreement. \n"]
  status : agreement_status_type option;
      [@ocaml.doc
        "You can update the status for the agreement, either activating an inactive agreement or \
         the reverse.\n"]
  local_profile_id : profile_id option;
      [@ocaml.doc
        "A unique identifier for the AS2 local profile.\n\n\
        \ To change the local profile identifier, provide a new value here.\n\
        \ "]
  partner_profile_id : profile_id option;
      [@ocaml.doc
        "A unique identifier for the partner profile. To change the partner profile identifier, \
         provide a new value here.\n"]
  base_directory : home_directory option;
      [@ocaml.doc
        "To change the landing directory (folder) for files that are transferred, provide the \
         bucket folder that you want to use; for example, \n\
         {[\n\
         /{i amzn-s3-demo-bucket}/{i home}/{i mydirectory} \n\
         ]}\n\
         .\n"]
  access_role : role option;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  preserve_filename : preserve_filename_type option;
      [@ocaml.doc
        " Determines whether or not Transfer Family appends a unique string of characters to the \
         end of the AS2 message payload filename when saving it. \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: the filename provided by your trading parter is preserved when the \
         file is saved.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): when Transfer Family saves the file, the filename \
         is adjusted, as described in \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2}File \
         names and locations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  enforce_message_signing : enforce_message_signing_type option;
      [@ocaml.doc
        " Determines whether or not unsigned messages from your trading partners will be accepted. \
         \n\n\
        \ {ul\n\
        \       {-   [ENABLED]: Transfer Family rejects unsigned messages from your trading partner.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] (default value): Transfer Family accepts unsigned messages from \
         your trading partner.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  custom_directories : custom_directories_type option;
      [@ocaml.doc
        "A [CustomDirectoriesType] structure. This structure specifies custom directories for \
         storing various AS2 message files. You can specify directories for the following types of \
         files.\n\n\
        \ {ul\n\
        \       {-  Failed files\n\
        \           \n\
        \            }\n\
        \       {-  MDN files\n\
        \           \n\
        \            }\n\
        \       {-  Payload files\n\
        \           \n\
        \            }\n\
        \       {-  Status files\n\
        \           \n\
        \            }\n\
        \       {-  Temporary files\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_certificate_response = {
  certificate_id : certificate_id;
      [@ocaml.doc "Returns the identifier of the certificate object that you are updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_certificate_request = {
  certificate_id : certificate_id;
      [@ocaml.doc "The identifier of the certificate object that you are updating.\n"]
  active_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes active. If you do not \
         specify a value, [ActiveDate] takes the same value as [NotBeforeDate], which is specified \
         by the CA. \n"]
  inactive_date : cert_date option;
      [@ocaml.doc
        "An optional date that specifies when the certificate becomes inactive. If you do not \
         specify a value, [InactiveDate] takes the same value as [NotAfterDate], which is \
         specified by the CA.\n"]
  description : description option;
      [@ocaml.doc "A short description to help identify the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connector_response = {
  connector_id : connector_id;
      [@ocaml.doc "Returns the identifier of the connector object that you are updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connector_vpc_lattice_egress_config = {
  resource_configuration_arn : vpc_lattice_resource_configuration_arn option;
      [@ocaml.doc
        "Updated ARN of the VPC_LATTICE Resource Configuration. Use this to change the target SFTP \
         server location or modify the network path through the customer's VPC infrastructure.\n"]
  port_number : sftp_port option;
      [@ocaml.doc
        "Updated port number for SFTP connections through VPC_LATTICE. Change this if the target \
         SFTP server port has been modified or if connecting to a different server endpoint.\n"]
}
[@@ocaml.doc
  "VPC_LATTICE egress configuration updates for modifying how the connector routes traffic through \
   customer VPCs. Changes to these settings may require connector restart to take effect.\n"]

type nonrec update_connector_egress_config =
  | VpcLattice of update_connector_vpc_lattice_egress_config
      [@ocaml.doc
        "VPC_LATTICE configuration updates for the connector. Use this to modify the Resource \
         Configuration ARN or port number for VPC-based connectivity.\n"]
[@@ocaml.doc
  "Structure for updating the egress configuration of an existing connector. Allows modification \
   of how traffic is routed from the connector to the SFTP server, including VPC_LATTICE settings.\n"]

type nonrec update_connector_request = {
  connector_id : connector_id; [@ocaml.doc "The unique identifier for the connector.\n"]
  url : url option;
      [@ocaml.doc
        "The URL of the partner's AS2 or SFTP endpoint.\n\n\
        \ When creating AS2 connectors or service-managed SFTP connectors (connectors without \
         egress configuration), you must provide a URL to specify the remote server endpoint. For \
         VPC Lattice type connectors, the URL must be null.\n\
        \ "]
  as2_config : as2_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an AS2 connector object.\n"]
  access_role : role option;
      [@ocaml.doc
        "Connectors are used to send files using either the AS2 or SFTP protocol. For the access \
         role, provide the Amazon Resource Name (ARN) of the Identity and Access Management role \
         to use.\n\n\
        \  {b For AS2 connectors} \n\
        \ \n\
        \  With AS2, you can send files by calling [StartFileTransfer] and specifying the file \
         paths in the request parameter, [SendFilePaths]. We use the file\226\128\153s parent \
         directory (for example, for [--send-file-paths /bucket/dir/file.txt], parent directory is \
         [/bucket/dir/]) to temporarily store a processed AS2 message file, store the MDN when we \
         receive them from the partner, and write a final JSON file containing relevant metadata \
         of the transmission. So, the [AccessRole] needs to provide read and write access to the \
         parent directory of the file location used in the [StartFileTransfer] request. \
         Additionally, you need to provide read and write access to the parent directory of the \
         files that you intend to send with [StartFileTransfer].\n\
        \  \n\
        \   If you are using Basic authentication for your AS2 connector, the access role requires \
         the [secretsmanager:GetSecretValue] permission for the secret. If the secret is encrypted \
         using a customer-managed key instead of the Amazon Web Services managed key in Secrets \
         Manager, then the role also needs the [kms:Decrypt] permission for that key.\n\
        \   \n\
        \     {b For SFTP connectors} \n\
        \    \n\
        \     Make sure that the access role provides read and write access to the parent \
         directory of the file location that's used in the [StartFileTransfer] request. \
         Additionally, make sure that the role provides [secretsmanager:GetSecretValue] permission \
         to Secrets Manager.\n\
        \     "]
  logging_role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a connector to turn on CloudWatch logging for Amazon S3 events. When set, you can \
         view connector activity in your CloudWatch logs.\n"]
  sftp_config : sftp_connector_config option;
      [@ocaml.doc "A structure that contains the parameters for an SFTP connector object.\n"]
  security_policy_name : connector_security_policy_name option;
      [@ocaml.doc "Specifies the name of the security policy for the connector.\n"]
  egress_config : update_connector_egress_config option;
      [@ocaml.doc
        "Updates the egress configuration for the connector, allowing you to modify how traffic is \
         routed from the connector to the SFTP server. Changes to VPC configuration may require \
         connector restart.\n"]
  ip_address_type : connectors_ip_address_type option;
      [@ocaml.doc
        "Specifies the IP address type for the connector's network connections. When set to \
         [IPV4], the connector uses IPv4 addresses only. When set to [DUALSTACK], the connector \
         supports both IPv4 and IPv6 addresses, with IPv6 preferred when available.\n"]
}
[@@ocaml.doc ""]

type nonrec update_profile_response = {
  profile_id : profile_id;
      [@ocaml.doc "Returns the identifier for the profile that's being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_profile_request = {
  profile_id : profile_id;
      [@ocaml.doc "The identifier of the profile object that you are updating.\n"]
  certificate_ids : certificate_ids option;
      [@ocaml.doc
        "An array of identifiers for the imported certificates. You use this identifier for \
         working with profiles and partner profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec update_server_response = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server that the Transfer Family user is \
         assigned to.\n"]
}
[@@ocaml.doc ""]

type nonrec update_server_request = {
  certificate : certificate option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web ServicesCertificate Manager (ACM) \
         certificate. Required when [Protocols] is set to [FTPS].\n\n\
        \ To request a new public certificate, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html}Request a \
         public certificate} in the {i  Amazon Web ServicesCertificate Manager User Guide}.\n\
        \ \n\
        \  To import an existing certificate into ACM, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         certificates into ACM} in the {i  Amazon Web ServicesCertificate Manager User Guide}.\n\
        \  \n\
        \   To request a private certificate to use FTPS through private IP addresses, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html}Request a \
         private certificate} in the {i  Amazon Web ServicesCertificate Manager User Guide}.\n\
        \   \n\
        \    Certificates with the following cryptographic algorithms and key sizes are supported:\n\
        \    \n\
        \     {ul\n\
        \           {-  2048-bit RSA (RSA_2048)\n\
        \               \n\
        \                }\n\
        \           {-  4096-bit RSA (RSA_4096)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 256 bit (EC_prime256v1)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 384 bit (EC_secp384r1)\n\
        \               \n\
        \                }\n\
        \           {-  Elliptic Prime Curve 521 bit (EC_secp521r1)\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    The certificate must be a valid SSL/TLS X.509 version 3 certificate with FQDN or IP \
         address specified and information about the issuer.\n\
        \    \n\
        \     "]
  protocol_details : protocol_details option;
      [@ocaml.doc
        "The protocol settings that are configured for your server.\n\n\
        \  Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of Transfer Family \
         servers, as this increases costs and can cause performance issues, including reduced \
         connection limits for FTPS. For more details, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations} \
         Avoid placing NLBs and NATs in front of Transfer Family}.\n\
        \  \n\
        \    {ul\n\
        \          {-   To indicate passive mode (for FTP and FTPS protocols), use the [PassiveIp] \
         parameter. Enter a single dotted-quad IPv4 address, such as the external IP address of a \
         firewall, router, or load balancer. \n\
        \              \n\
        \               }\n\
        \          {-  To ignore the error that is generated when the client attempts to use the \
         [SETSTAT] command on a file that you are uploading to an Amazon S3 bucket, use the \
         [SetStatOption] parameter. To have the Transfer Family server ignore the [SETSTAT] \
         command and upload files without needing to make any changes to your SFTP client, set the \
         value to [ENABLE_NO_OP]. If you set the [SetStatOption] parameter to [ENABLE_NO_OP], \
         Transfer Family generates a log entry to Amazon CloudWatch Logs, so that you can \
         determine when the client is making a [SETSTAT] call.\n\
        \              \n\
        \               }\n\
        \          {-  To determine whether your Transfer Family server resumes recent, negotiated \
         sessions through a unique session ID, use the [TlsSessionResumptionMode] parameter.\n\
        \              \n\
        \               }\n\
        \          {-   [As2Transports] indicates the transport method for the AS2 messages. \
         Currently, only HTTP is supported.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  endpoint_details : endpoint_details option;
      [@ocaml.doc
        "The virtual private cloud (VPC) endpoint settings that are configured for your server. \
         When you host your endpoint within your VPC, you can make your endpoint accessible only \
         to resources within your VPC, or you can attach Elastic IP addresses and make your \
         endpoint accessible to clients over the internet. Your VPC's default security groups are \
         automatically assigned to your endpoint.\n"]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "The type of endpoint that you want your server to use. You can choose to make your \
         server's endpoint publicly accessible (PUBLIC) or host it inside your VPC. With an \
         endpoint that is hosted in a VPC, you can restrict access to your server and resources \
         only within your VPC or choose to make it internet facing by attaching Elastic IP \
         addresses directly to it.\n\n\
        \   After May 19, 2021, you won't be able to create a server using \
         [EndpointType=VPC_ENDPOINT] in your Amazon Web Services account if your account hasn't \
         already done so before May 19, 2021. If you have already created servers with \
         [EndpointType=VPC_ENDPOINT] in your Amazon Web Services account on or before May 19, \
         2021, you will not be affected. After this date, use [EndpointType]=[VPC].\n\
        \  \n\
        \   For more information, see \
         https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.\n\
        \   \n\
        \    It is recommended that you use [VPC] as the [EndpointType]. With this endpoint type, \
         you have the option to directly associate up to three Elastic IPv4 addresses (BYO IP \
         included) with your server's endpoint and use VPC security groups to restrict traffic by \
         the client's public IP address. This is not possible with [EndpointType] set to \
         [VPC_ENDPOINT].\n\
        \    \n\
        \     "]
  host_key : host_key option;
      [@ocaml.doc
        "The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled server. You can add \
         multiple host keys, in case you want to rotate keys, or have a set of active keys that \
         use different algorithms.\n\n\
        \ Use the following command to generate an RSA 2048 bit key with no passphrase:\n\
        \ \n\
        \   [ssh-keygen -t rsa -b 2048 -N \"\" -m PEM -f my-new-server-key].\n\
        \  \n\
        \   Use a minimum value of 2048 for the [-b] option. You can create a stronger key by \
         using 3072 or 4096.\n\
        \   \n\
        \    Use the following command to generate an ECDSA 256 bit key with no passphrase:\n\
        \    \n\
        \      [ssh-keygen -t ecdsa -b 256 -N \"\" -m PEM -f my-new-server-key].\n\
        \     \n\
        \      Valid values for the [-b] option for ECDSA are 256, 384, and 521.\n\
        \      \n\
        \       Use the following command to generate an ED25519 key with no passphrase:\n\
        \       \n\
        \         [ssh-keygen -t ed25519 -N \"\" -f my-new-server-key].\n\
        \        \n\
        \         For all of these commands, you can replace {i my-new-server-key} with a string \
         of your choice.\n\
        \         \n\
        \           If you aren't planning to migrate existing users from an existing SFTP-enabled \
         server to a new server, don't update the host key. Accidentally changing a server's host \
         key can be disruptive.\n\
        \           \n\
        \             For more information, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key}Manage \
         host keys for your SFTP-enabled server} in the {i Transfer Family User Guide}.\n\
        \             "]
  identity_provider_details : identity_provider_details option;
      [@ocaml.doc
        "An array containing all of the information required to call a customer's authentication \
         API method.\n"]
  logging_role : nullable_role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         allows a server to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. \
         When set, you can view user activity in your CloudWatch logs.\n"]
  post_authentication_login_banner : post_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         after the user authenticates.\n\n\
        \  The SFTP protocol does not support post-authentication display banners.\n\
        \  \n\
        \   "]
  pre_authentication_login_banner : pre_authentication_login_banner option;
      [@ocaml.doc
        "Specifies a string to display when users connect to a server. This string is displayed \
         before the user authenticates. For example, the following banner displays details about \
         using the system:\n\n\
        \  [This system is for the use of authorized users only. Individuals using this computer \
         system without authority, or in excess of their authority, are subject to having all of \
         their activities on this system monitored and recorded by system personnel.] \n\
        \ "]
  protocols : protocols option;
      [@ocaml.doc
        "Specifies the file transfer protocol or protocols over which your file transfer protocol \
         client can connect to your server's endpoint. The available protocols are:\n\n\
        \ {ul\n\
        \       {-   [SFTP] (Secure Shell (SSH) File Transfer Protocol): File transfer over SSH\n\
        \           \n\
        \            }\n\
        \       {-   [FTPS] (File Transfer Protocol Secure): File transfer with TLS encryption\n\
        \           \n\
        \            }\n\
        \       {-   [FTP] (File Transfer Protocol): Unencrypted file transfer\n\
        \           \n\
        \            }\n\
        \       {-   [AS2] (Applicability Statement 2): used for transporting structured \
         business-to-business data\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    {ul\n\
        \          {-  If you select [FTPS], you must choose a certificate stored in Certificate \
         Manager (ACM) which is used to identify your server when clients connect to it over FTPS.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes either [FTP] or [FTPS], then the [EndpointType] must \
         be [VPC] and the [IdentityProviderType] must be either [AWS_DIRECTORY_SERVICE], \
         [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [FTP], then [AddressAllocationIds] cannot be \
         associated.\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] is set only to [SFTP], the [EndpointType] can be set to \
         [PUBLIC] and the [IdentityProviderType] can be set any of the supported identity types: \
         [SERVICE_MANAGED], [AWS_DIRECTORY_SERVICE], [AWS_LAMBDA], or [API_GATEWAY].\n\
        \              \n\
        \               }\n\
        \          {-  If [Protocol] includes [AS2], then the [EndpointType] must be [VPC], and \
         domain must be Amazon S3.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  security_policy_name : security_policy_name option;
      [@ocaml.doc "Specifies the name of the security policy for the server.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a server instance that the Transfer Family user \
         is assigned to.\n"]
  workflow_details : workflow_details option;
      [@ocaml.doc
        "Specifies the workflow ID for the workflow to assign and the execution role that's used \
         for executing the workflow.\n\n\
        \ In addition to a workflow to execute when a file is uploaded completely, \
         [WorkflowDetails] can also contain a workflow ID (and execution role) for a workflow to \
         execute on partial upload. A partial upload occurs when the server session disconnects \
         while the file is still being uploaded.\n\
        \ \n\
        \  To remove an associated workflow from a server, you can provide an empty [OnUpload] \
         object, as in the following example.\n\
        \  \n\
        \    [aws transfer update-server --server-id s-01234567890abcdef --workflow-details \
         '{\"OnUpload\":\\[\\]}'] \n\
        \   "]
  structured_log_destinations : structured_log_destinations option;
      [@ocaml.doc
        "Specifies the log groups to which your server logs are sent.\n\n\
        \ To specify a log group, you must provide the ARN for an existing log group. In this \
         case, the format of the log group is as follows:\n\
        \ \n\
        \   [arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*] \n\
        \  \n\
        \   For example, [arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*] \n\
        \   \n\
        \    If you have previously specified a log group for a server, you can clear it, and in \
         effect turn off structured logging, by providing an empty value for this parameter in an \
         [update-server] call. For example:\n\
        \    \n\
        \      [update-server --server-id s-1234567890abcdef0 --structured-log-destinations] \n\
        \     "]
  s3_storage_options : s3_storage_options option;
      [@ocaml.doc
        "Specifies whether or not performance for your Amazon S3 directories is optimized.\n\n\
        \ {ul\n\
        \       {-  If using the console, this is enabled by default.\n\
        \           \n\
        \            }\n\
        \       {-  If using the API or CLI, this is disabled by default.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, home directory mappings have a [TYPE] of [DIRECTORY]. If you enable this \
         option, you would then need to explicitly set the [HomeDirectoryMapEntry] [Type] to \
         [FILE] if you want a mapping to have a file target.\n\
        \   "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your \
         Transfer Family endpoint. The default value is [IPV4].\n\n\
        \  The [IpAddressType] parameter has the following limitations:\n\
        \  \n\
        \   {ul\n\
        \         {-  It cannot be changed while the server is online. You must stop the server \
         before modifying this parameter.\n\
        \             \n\
        \              }\n\
        \         {-  It cannot be updated to [DUALSTACK] if the server has [AddressAllocationIds] \
         specified.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \     When using [DUALSTACK] as the [IpAddressType], you cannot set the \
         [AddressAllocationIds] parameter for the \
         {{:https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html}EndpointDetails} \
         for the server.\n\
        \     \n\
        \      "]
  identity_provider_type : identity_provider_type option;
      [@ocaml.doc
        "The mode of authentication for a server. The default value is [SERVICE_MANAGED], which \
         allows you to store and access user credentials within the Transfer Family service.\n\n\
        \ Use [AWS_DIRECTORY_SERVICE] to provide access to Active Directory groups in Directory \
         Service for Microsoft Active Directory or Microsoft Active Directory in your on-premises \
         environment or in Amazon Web Services using AD Connector. This option also requires you \
         to provide a Directory ID by using the [IdentityProviderDetails] parameter.\n\
        \ \n\
        \  Use the [API_GATEWAY] value to integrate with an identity provider of your choosing. \
         The [API_GATEWAY] setting requires you to provide an Amazon API Gateway endpoint URL to \
         call for authentication by using the [IdentityProviderDetails] parameter.\n\
        \  \n\
        \   Use the [AWS_LAMBDA] value to directly use an Lambda function as your identity \
         provider. If you choose this value, you must specify the ARN for the Lambda function in \
         the [Function] parameter for the [IdentityProviderDetails] data type.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_user_response = {
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a Transfer Family server instance that the \
         account is assigned to.\n"]
  user_name : user_name;
      [@ocaml.doc
        "The unique identifier for a user that is assigned to a server instance that was specified \
         in the request.\n"]
}
[@@ocaml.doc
  " [UpdateUserResponse] returns the user name and identifier for the request to update a user's \
   properties.\n"]

type nonrec update_user_request = {
  home_directory : home_directory option;
      [@ocaml.doc
        "The landing directory (folder) for a user when they log in to the server using the \
         client.\n\n\
        \ A [HomeDirectory] example is [/bucket_name/home/mydirectory].\n\
        \ \n\
        \   You can use the [HomeDirectory] parameter for [HomeDirectoryType] when it is set to \
         either [PATH] or [LOGICAL].\n\
        \   \n\
        \    "]
  home_directory_type : home_directory_type option;
      [@ocaml.doc
        "The type of landing directory (folder) that you want your users' home directory to be \
         when they log in to the server. If you set it to [PATH], the user will see the absolute \
         Amazon S3 bucket or Amazon EFS path as is in their file transfer protocol clients. If you \
         set it to [LOGICAL], you need to provide mappings in the [HomeDirectoryMappings] for how \
         you want to make Amazon S3 or Amazon EFS paths visible to your users.\n\n\
        \  If [HomeDirectoryType] is [LOGICAL], you must provide mappings, using the \
         [HomeDirectoryMappings] parameter. If, on the other hand, [HomeDirectoryType] is [PATH], \
         you provide an absolute path using the [HomeDirectory] parameter. You cannot have both \
         [HomeDirectory] and [HomeDirectoryMappings] in your template.\n\
        \  \n\
        \   "]
  home_directory_mappings : home_directory_mappings option;
      [@ocaml.doc
        "Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys \
         should be visible to your user and how you want to make them visible. You must specify \
         the [Entry] and [Target] pair, where [Entry] shows how the path is made visible and \
         [Target] is the actual Amazon S3 or Amazon EFS path. If you only specify a target, it is \
         displayed as is. You also must ensure that your Identity and Access Management (IAM) role \
         provides access to paths in [Target]. This value can be set only when [HomeDirectoryType] \
         is set to {i LOGICAL}.\n\n\
        \ The following is an [Entry] and [Target] pair example.\n\
        \ \n\
        \   [\\[ { \"Entry\": \"/directory1\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \  \n\
        \   In most cases, you can use this value instead of the session policy to lock down your \
         user to the designated home directory (\"[chroot]\"). To do this, you can set [Entry] to \
         '/' and set [Target] to the HomeDirectory parameter value.\n\
        \   \n\
        \    The following is an [Entry] and [Target] pair example for [chroot].\n\
        \    \n\
        \      [\\[ { \"Entry\": \"/\", \"Target\": \"/bucket_name/home/mydirectory\" } \\]] \n\
        \     "]
  policy : policy option;
      [@ocaml.doc
        "A session policy for your user so that you can use the same Identity and Access \
         Management (IAM) role across multiple users. This policy scopes down a user's access to \
         portions of their Amazon S3 bucket. Variables that you can use inside this policy include \
         [${Transfer:UserName}], [${Transfer:HomeDirectory}], and [${Transfer:HomeBucket}].\n\n\
        \  This policy applies only when the domain of [ServerId] is Amazon S3. Amazon EFS does \
         not use session policies.\n\
        \  \n\
        \   For session policies, Transfer Family stores the policy as a JSON blob, instead of the \
         Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it \
         in the [Policy] argument.\n\
        \   \n\
        \    For an example of a session policy, see \
         {{:https://docs.aws.amazon.com/transfer/latest/userguide/session-policy}Creating a \
         session policy}.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html}AssumeRole} in \
         the {i Amazon Web Services Security Token Service API Reference}.\n\
        \     \n\
        \      "]
  posix_profile : posix_profile option;
      [@ocaml.doc
        "Specifies the full POSIX identity, including user ID ([Uid]), group ID ([Gid]), and any \
         secondary groups IDs ([SecondaryGids]), that controls your users' access to your Amazon \
         Elastic File Systems (Amazon EFS). The POSIX permissions that are set on files and \
         directories in your file system determines the level of access your users get when \
         transferring files into and out of your Amazon EFS file systems.\n"]
  role : role option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         controls your users' access to your Amazon S3 bucket or Amazon EFS file system. The \
         policies attached to this role determine the level of access that you want to provide \
         your users when transferring files into and out of your Amazon S3 bucket or Amazon EFS \
         file system. The IAM role should also contain a trust relationship that allows the server \
         to access your resources when servicing your users' transfer requests.\n"]
  server_id : server_id;
      [@ocaml.doc
        "A system-assigned unique identifier for a Transfer Family server instance that the user \
         is assigned to.\n"]
  user_name : user_name;
      [@ocaml.doc
        "A unique string that identifies a user and is associated with a server as specified by \
         the [ServerId]. This user name must be a minimum of 3 and a maximum of 100 characters \
         long. The following are valid characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', \
         period '.', and at sign '\\@'. The user name can't start with a hyphen, period, or at \
         sign.\n"]
}
[@@ocaml.doc ""]

type nonrec update_web_app_response = {
  web_app_id : web_app_id;
      [@ocaml.doc "Returns the unique identifier for the web app being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_web_app_vpc_config = {
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "The list of subnet IDs within the VPC where the web app endpoint should be deployed \
         during the update operation.\n"]
  ip_address_type : web_app_vpc_endpoint_ip_address_type option;
      [@ocaml.doc
        "The IP address type for the web app's VPC endpoint. This determines whether the endpoint \
         is accessible over IPv4 only, or over both IPv4 and IPv6.\n"]
}
[@@ocaml.doc
  "Contains the VPC configuration settings for updating a web app endpoint, including the subnet \
   IDs where the endpoint should be deployed.\n"]

type nonrec update_web_app_endpoint_details =
  | Vpc of update_web_app_vpc_config
      [@ocaml.doc
        "The VPC configuration details for updating a web app endpoint hosted within a VPC. This \
         includes the subnet IDs for endpoint deployment.\n"]
[@@ocaml.doc
  "Contains the endpoint configuration details for updating a web app, including VPC settings for \
   endpoints hosted within a VPC.\n"]

type nonrec update_web_app_identity_center_config = {
  role : role option; [@ocaml.doc "The IAM role used to access IAM Identity Center.\n"]
}
[@@ocaml.doc
  "A structure that describes the values to use for the IAM Identity Center settings when you \
   update a web app.\n"]

type nonrec update_web_app_identity_provider_details =
  | IdentityCenterConfig of update_web_app_identity_center_config
      [@ocaml.doc
        "A structure that describes the values to use for the IAM Identity Center settings when \
         you update a web app.\n"]
[@@ocaml.doc "A union that contains the [UpdateWebAppIdentityCenterConfig] object.\n"]

type nonrec update_web_app_request = {
  web_app_id : web_app_id;
      [@ocaml.doc "Provide the identifier of the web app that you are updating.\n"]
  identity_provider_details : update_web_app_identity_provider_details option;
      [@ocaml.doc
        "Provide updated identity provider values in a [WebAppIdentityProviderDetails] object.\n"]
  access_endpoint : web_app_access_endpoint option;
      [@ocaml.doc
        "The [AccessEndpoint] is the URL that you provide to your users for them to interact with \
         the Transfer Family web app. You can specify a custom URL or use the default value.\n"]
  web_app_units : web_app_units option;
      [@ocaml.doc
        "A union that contains the value for number of concurrent connections or the user sessions \
         on your web app.\n"]
  endpoint_details : update_web_app_endpoint_details option;
      [@ocaml.doc
        "The updated endpoint configuration for the web app. You can modify the endpoint type and \
         VPC configuration settings.\n"]
}
[@@ocaml.doc ""]

type nonrec update_web_app_customization_response = {
  web_app_id : web_app_id;
      [@ocaml.doc "Returns the unique identifier for the web app being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_web_app_customization_request = {
  web_app_id : web_app_id;
      [@ocaml.doc "Provide the identifier of the web app that you are updating.\n"]
  title : web_app_title option; [@ocaml.doc "Provide an updated title.\n"]
  logo_file : web_app_logo_file option;
      [@ocaml.doc "Specify logo file data string (in base64 encoding).\n"]
  favicon_file : web_app_favicon_file option;
      [@ocaml.doc "Specify an icon file data string (in base64 encoding).\n"]
}
[@@ocaml.doc ""]

type nonrec user_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec web_app_customization_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec web_app_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec workflow_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
