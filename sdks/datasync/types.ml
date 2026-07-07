type nonrec string_ = string [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec verify_mode =
  | NONE [@ocaml.doc ""]
  | ONLY_FILES_TRANSFERRED [@ocaml.doc ""]
  | POINT_IN_TIME_CONSISTENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec updated_efs_iam_role_arn = string [@@ocaml.doc ""]

type nonrec updated_efs_access_point_arn = string [@@ocaml.doc ""]

type nonrec update_task_response = unit [@@ocaml.doc ""]

type nonrec task_arn = string [@@ocaml.doc ""]

type nonrec overwrite_mode = NEVER [@ocaml.doc ""] | ALWAYS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec atime = BEST_EFFORT [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec mtime = PRESERVE [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec uid =
  | BOTH [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | INT_VALUE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec gid =
  | BOTH [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | INT_VALUE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec preserve_deleted_files = REMOVE [@ocaml.doc ""] | PRESERVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec preserve_devices = PRESERVE [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec posix_permissions = PRESERVE [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec bytes_per_second = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec task_queueing = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec log_level = TRANSFER [@ocaml.doc ""] | BASIC [@ocaml.doc ""] | OFF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transfer_mode = ALL [@ocaml.doc ""] | CHANGED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec smb_security_descriptor_copy_flags =
  | OWNER_DACL_SACL [@ocaml.doc ""]
  | OWNER_DACL [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_tags = NONE [@ocaml.doc ""] | PRESERVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec options = {
  object_tags : object_tags option;
      [@ocaml.doc
        "Specifies whether you want DataSync to [PRESERVE] object tags (default behavior) when \
         transferring between object storage systems. If you want your DataSync task to ignore \
         object tags, specify the [NONE] value.\n"]
  security_descriptor_copy_flags : smb_security_descriptor_copy_flags option;
      [@ocaml.doc
        "Specifies which components of the SMB security descriptor are copied from source to \
         destination objects. \n\n\
        \ This value is only used for transfers between SMB and Amazon FSx for Windows File Server \
         locations or between two FSx for Windows File Server locations. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html}Understanding \
         how DataSync handles file and object metadata}.\n\
        \ \n\
        \  {ul\n\
        \        {-   [OWNER_DACL] (default) - For each copied object, DataSync copies the \
         following metadata:\n\
        \            \n\
        \             {ul\n\
        \                   {-  The object owner.\n\
        \                       \n\
        \                        }\n\
        \                   {-  NTFS discretionary access control lists (DACLs), which determine \
         whether to grant access to an object.\n\
        \                       \n\
        \                        DataSync won't copy NTFS system access control lists (SACLs) with \
         this option.\n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [OWNER_DACL_SACL] - For each copied object, DataSync copies the following \
         metadata:\n\
        \            \n\
        \             {ul\n\
        \                   {-  The object owner.\n\
        \                       \n\
        \                        }\n\
        \                   {-  NTFS discretionary access control lists (DACLs), which determine \
         whether to grant access to an object.\n\
        \                       \n\
        \                        }\n\
        \                   {-  SACLs, which are used by administrators to log attempts to access \
         a secured object.\n\
        \                       \n\
        \                        Copying SACLs requires granting additional permissions to the \
         Windows user that DataSync uses to access your SMB location. For information about \
         choosing a user with the right permissions, see required permissions for \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}SMB}, \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-windows-location-permissions}FSx \
         for Windows File Server}, or \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb}FSx \
         for ONTAP} (depending on the type of location in your transfer).\n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [NONE] - None of the SMB security descriptor components are copied. \
         Destination objects are owned by the user that was provided for accessing the destination \
         location. DACLs and SACLs are set based on the destination server\226\128\153s \
         configuration. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  transfer_mode : transfer_mode option;
      [@ocaml.doc
        "Specifies whether DataSync transfers only the data (including metadata) that differs \
         between locations following an initial copy or transfers all data every time you run the \
         task. If you're planning on recurring transfers, you might only want to transfer what's \
         changed since your previous task execution.\n\n\
        \ {ul\n\
        \       {-   [CHANGED] (default) - After your initial full transfer, DataSync copies only \
         the data and metadata that differs between the source and destination location.\n\
        \           \n\
        \            }\n\
        \       {-   [ALL] - DataSync copies everything in the source to the destination without \
         comparing differences between the locations.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  log_level : log_level option;
      [@ocaml.doc
        "Specifies the type of logs that DataSync publishes to a Amazon CloudWatch Logs log group. \
         To specify the log group, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateTask.html#DataSync-CreateTask-request-CloudWatchLogGroupArn}CloudWatchLogGroupArn}.\n\n\
        \ {ul\n\
        \       {-   [BASIC] - Publishes logs with only basic information (such as transfer errors).\n\
        \           \n\
        \            }\n\
        \       {-   [TRANSFER] - Publishes logs for all files or objects that your DataSync task \
         transfers and performs data-integrity checks on.\n\
        \           \n\
        \            }\n\
        \       {-   [OFF] - No logs are published.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  task_queueing : task_queueing option;
      [@ocaml.doc
        "Specifies whether your transfer tasks should be put into a queue during certain scenarios \
         when \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#running-multiple-tasks}running \
         multiple tasks}. This is [ENABLED] by default.\n"]
  bytes_per_second : bytes_per_second option;
      [@ocaml.doc
        "Limits the bandwidth used by a DataSync task. For example, if you want DataSync to use a \
         maximum of 1 MB, set this value to [1048576] ([=1024*1024]).\n"]
  posix_permissions : posix_permissions option;
      [@ocaml.doc
        "Specifies which users or groups can access a file for a specific purpose such as reading, \
         writing, or execution of the file.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html}Understanding \
         how DataSync handles file and object metadata}.\n\
        \ \n\
        \  {ul\n\
        \        {-   [PRESERVE] (default) - Preserves POSIX-style permissions, which is \
         recommended.\n\
        \            \n\
        \             }\n\
        \        {-   [NONE] - Ignores POSIX-style permissions. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \    DataSync can preserve extant permissions of a source location.\n\
        \    \n\
        \     "]
  preserve_devices : preserve_devices option;
      [@ocaml.doc
        "Specifies whether DataSync should preserve the metadata of block and character devices in \
         the source location and recreate the files with that device name and metadata on the \
         destination. DataSync copies only the name and metadata of such devices.\n\n\
        \  DataSync can't copy the actual contents of these devices because they're nonterminal \
         and don't return an end-of-file (EOF) marker.\n\
        \  \n\
        \    {ul\n\
        \          {-   [NONE] (default) - Ignores special devices (recommended).\n\
        \              \n\
        \               }\n\
        \          {-   [PRESERVE] - Preserves character and block device metadata. This option \
         currently isn't supported for Amazon EFS.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  preserve_deleted_files : preserve_deleted_files option;
      [@ocaml.doc
        "Specifies whether files in the destination location that don't exist in the source should \
         be preserved. This option can affect your Amazon S3 storage cost. If your task deletes \
         objects, you might incur minimum storage duration charges for certain storage classes. \
         For detailed information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Considerations \
         when working with Amazon S3 storage classes in DataSync}.\n\n\
        \ {ul\n\
        \       {-   [PRESERVE] (default) - Ignores such destination files, which is recommended. \n\
        \           \n\
        \            }\n\
        \       {-   [REMOVE] - Deletes destination files that aren\226\128\153t present in the \
         source.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you set this parameter to [REMOVE], you can't set [TransferMode] to [ALL]. When \
         you transfer all data, DataSync doesn't scan your destination location and doesn't know \
         what to delete.\n\
        \    \n\
        \     "]
  gid : gid option;
      [@ocaml.doc
        "Specifies the POSIX group ID (GID) of the file's owners.\n\n\
        \ {ul\n\
        \       {-   [INT_VALUE] (default) - Preserves the integer value of user ID (UID) and GID, \
         which is recommended.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] - Ignores UID and GID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html}Understanding \
         how DataSync handles file and object metadata}.\n\
        \   "]
  uid : uid option;
      [@ocaml.doc
        "Specifies the POSIX user ID (UID) of the file's owner.\n\n\
        \ {ul\n\
        \       {-   [INT_VALUE] (default) - Preserves the integer value of UID and group ID \
         (GID), which is recommended.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] - Ignores UID and GID. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied}Metadata \
         copied by DataSync}.\n\
        \   "]
  mtime : mtime option;
      [@ocaml.doc
        "Specifies whether to preserve metadata indicating the last time that a file was written \
         to before the [PREPARING] step of your task execution. This option is required when you \
         need to run the a task more than once.\n\n\
        \ {ul\n\
        \       {-   [PRESERVE] (default) - Preserves original [Mtime], which is recommended.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] - Ignores [Mtime].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If [Mtime] is set to [PRESERVE], [Atime] must be set to [BEST_EFFORT].\n\
        \    \n\
        \     If [Mtime] is set to [NONE], [Atime] must also be set to [NONE]. \n\
        \     \n\
        \      "]
  atime : atime option;
      [@ocaml.doc
        "Specifies whether to preserve metadata indicating the last time a file was read or \
         written to.\n\n\
        \  The behavior of [Atime] isn't fully standard across platforms, so DataSync can only do \
         this on a best-effort basis.\n\
        \  \n\
        \    {ul\n\
        \          {-   [BEST_EFFORT] (default) - DataSync attempts to preserve the original \
         [Atime] attribute on all source files (that is, the version before the [PREPARING] steps \
         of the task execution). This option is recommended.\n\
        \              \n\
        \               }\n\
        \          {-   [NONE] - Ignores [Atime].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    If [Atime] is set to [BEST_EFFORT], [Mtime] must be set to [PRESERVE]. \n\
        \    \n\
        \     If [Atime] is set to [NONE], [Mtime] must also be [NONE]. \n\
        \     \n\
        \      "]
  overwrite_mode : overwrite_mode option;
      [@ocaml.doc
        "Specifies whether DataSync should modify or preserve data at the destination location.\n\n\
        \ {ul\n\
        \       {-   [ALWAYS] (default) - DataSync modifies data in the destination location when \
         source data (including metadata) has changed.\n\
        \           \n\
        \            If DataSync overwrites objects, you might incur additional charges for \
         certain Amazon S3 storage classes (for example, for retrieval or early deletion). For \
         more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 transfers}.\n\
        \            \n\
        \             }\n\
        \       {-   [NEVER] - DataSync doesn't overwrite data in the destination location even if \
         the source data has changed. You can use this option to protect against overwriting \
         changes made to files or objects in the destination.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  verify_mode : verify_mode option;
      [@ocaml.doc
        "Specifies if and how DataSync checks the integrity of your data at the end of your \
         transfer.\n\n\
        \ {ul\n\
        \       {-   [ONLY_FILES_TRANSFERRED] (recommended) - DataSync calculates the checksum of \
         transferred data (including metadata) at the source location. At the end of the transfer, \
         DataSync then compares this checksum to the checksum calculated on that data at the \
         destination.\n\
        \           \n\
        \             This is the default option for \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \             \n\
        \               We recommend this option when transferring to S3 Glacier Flexible \
         Retrieval or S3 Glacier Deep Archive storage classes. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 locations}.\n\
        \               \n\
        \                }\n\
        \       {-   [POINT_IN_TIME_CONSISTENT] - At the end of the transfer, DataSync checks the \
         entire source and destination to verify that both locations are fully synchronized.\n\
        \           \n\
        \             The is the default option for \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Basic \
         mode tasks} and isn't currently supported with Enhanced mode tasks.\n\
        \             \n\
        \               If you use a \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}manifest}, \
         DataSync only scans and verifies what's listed in the manifest.\n\
        \               \n\
        \                You can't use this option when transferring to S3 Glacier Flexible \
         Retrieval or S3 Glacier Deep Archive storage classes. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 locations}.\n\
        \                \n\
        \                 }\n\
        \       {-   [NONE] - DataSync performs data integrity checks only during your transfer. \
         Unlike other options, there's no additional verification at the end of your transfer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Indicates how your transfer task is configured. These options include how DataSync handles \
   files, objects, and their associated metadata during your transfer. You also can specify how to \
   verify data integrity, set bandwidth limits for your task, among other options.\n\n\
  \ Each option has a default value. Unless you need to, you don't have to configure any option \
   before calling \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html}StartTaskExecution}.\n\
  \ \n\
  \  You also can override your task options for each task execution. For example, you might want \
   to adjust the [LogLevel] for an individual execution.\n\
  \  "]

type nonrec filter_type = SIMPLE_PATTERN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_rule = {
  value : filter_value option;
      [@ocaml.doc
        "A single filter string that consists of the patterns to include or exclude. The patterns \
         are delimited by \"|\" (that is, a pipe), for example: [/folder1|/folder2] \n\n\
        \  \n\
        \ "]
  filter_type : filter_type option;
      [@ocaml.doc
        "The type of filter rule to apply. DataSync only supports the SIMPLE_PATTERN rule type.\n"]
}
[@@ocaml.doc
  "Specifies which files, folders, and objects to include or exclude when transferring files from \
   source to destination.\n"]

type nonrec filter_list = filter_rule list [@@ocaml.doc ""]

type nonrec schedule_expression_cron = string [@@ocaml.doc ""]

type nonrec schedule_status = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_schedule = {
  status : schedule_status option;
      [@ocaml.doc
        "Specifies whether to enable or disable your task schedule. Your schedule is enabled by \
         default, but there can be situations where you need to disable it. For example, you might \
         need to pause a recurring transfer to fix an issue with your task or perform maintenance \
         on your storage system.\n\n\
        \ DataSync might disable your schedule automatically if your task fails repeatedly with \
         the same error. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_TaskScheduleDetails.html}TaskScheduleDetails}.\n\
        \ "]
  schedule_expression : schedule_expression_cron;
      [@ocaml.doc
        "Specifies your task schedule by using a cron or rate expression.\n\n\
        \ Use cron expressions for task schedules that run on a specific time and day. For \
         example, the following cron expression creates a task schedule that runs at 8 AM on the \
         first Wednesday of every month:\n\
        \ \n\
        \   [cron(0 8 * * 3#1)] \n\
        \  \n\
        \   Use rate expressions for task schedules that run on a regular interval. For example, \
         the following rate expression creates a task schedule that runs every 12 hours:\n\
        \   \n\
        \     [rate(12 hours)] \n\
        \    \n\
        \     For information about cron and rate expression syntax, see the \
         {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html} \
         {i Amazon EventBridge User Guide} }.\n\
        \     "]
}
[@@ocaml.doc
  "Configures your DataSync task to run on a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}schedule} (at a \
   minimum interval of 1 hour).\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec log_group_arn = string [@@ocaml.doc ""]

type nonrec manifest_action = TRANSFER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec manifest_format = CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_subdirectory = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec s3_bucket_arn = string [@@ocaml.doc ""]

type nonrec s3_object_version_id = string [@@ocaml.doc ""]

type nonrec s3_manifest_config = {
  manifest_object_version_id : s3_object_version_id option;
      [@ocaml.doc
        "Specifies the object version ID of the manifest that you want DataSync to use. If you \
         don't set this, DataSync uses the latest version of the object.\n"]
  s3_bucket_arn : s3_bucket_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the S3 bucket where you're hosting your \
         manifest.\n"]
  bucket_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "Specifies the Identity and Access Management (IAM) role that allows DataSync to access \
         your manifest. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-access}Providing \
         DataSync access to your manifest}.\n"]
  manifest_object_path : s3_subdirectory;
      [@ocaml.doc
        "Specifies the Amazon S3 object key of your manifest. This can include a prefix (for \
         example, [prefix/my-manifest.csv]).\n"]
}
[@@ocaml.doc
  "Specifies the S3 bucket where you're hosting the manifest that you want DataSync to use. For \
   more information and configuration examples, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
   what DataSync transfers by using a manifest}.\n"]

type nonrec source_manifest_config = {
  s3 : s3_manifest_config;
      [@ocaml.doc "Specifies the S3 bucket where you're hosting your manifest.\n"]
}
[@@ocaml.doc
  "Specifies the manifest that you want DataSync to use and where it's hosted. For more \
   information and configuration examples, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
   what DataSync transfers by using a manifest}.\n"]

type nonrec manifest_config = {
  source : source_manifest_config option;
      [@ocaml.doc
        "Specifies the manifest that you want DataSync to use and where it's hosted.\n\n\
        \  You must specify this parameter if you're configuring a new manifest on or after \
         February 7, 2024.\n\
        \  \n\
        \   If you don't, you'll get a 400 status code and [ValidationException] error stating \
         that you're missing the IAM role for DataSync to access the S3 bucket where you're \
         hosting your manifest. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-access}Providing \
         DataSync access to your manifest}.\n\
        \   \n\
        \    "]
  format : manifest_format option;
      [@ocaml.doc
        "Specifies the file format of your manifest. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-create}Creating \
         a manifest}.\n"]
  action : manifest_action option; [@ocaml.doc "Specifies what DataSync uses the manifest for.\n"]
}
[@@ocaml.doc
  "Configures a manifest, which is a list of files or objects that you want DataSync to transfer. \
   For more information and configuration examples, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
   what DataSync transfers by using a manifest}.\n"]

type nonrec report_destination_s3 = {
  bucket_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the IAM policy that allows DataSync to upload \
         a task report to your S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Allowing \
         DataSync to upload a task report to an Amazon S3 bucket}.\n"]
  s3_bucket_arn : s3_bucket_arn;
      [@ocaml.doc "Specifies the ARN of the S3 bucket where DataSync uploads your report.\n"]
  subdirectory : s3_subdirectory option; [@ocaml.doc "Specifies a bucket prefix for your report.\n"]
}
[@@ocaml.doc
  "Specifies the Amazon S3 bucket where DataSync uploads your \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report}.\n"]

type nonrec report_destination = {
  s3 : report_destination_s3 option;
      [@ocaml.doc "Specifies the Amazon S3 bucket where DataSync uploads your task report.\n"]
}
[@@ocaml.doc
  "Specifies where DataSync uploads your \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report}.\n"]

type nonrec report_output_type = STANDARD [@ocaml.doc ""] | SUMMARY_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_level = SUCCESSES_AND_ERRORS [@ocaml.doc ""] | ERRORS_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_version_ids = NONE [@ocaml.doc ""] | INCLUDE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_override = {
  report_level : report_level option;
      [@ocaml.doc
        "Specifies whether your task report includes errors only or successes and errors.\n\n\
        \ For example, your report might mostly include only what didn't go well in your transfer \
         ([ERRORS_ONLY]). At the same time, you want to verify that your \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}task filter} is \
         working correctly. In this situation, you can get a list of what files DataSync \
         successfully skipped and if something transferred that you didn't to transfer \
         ([SUCCESSES_AND_ERRORS]).\n\
        \ "]
}
[@@ocaml.doc
  "Specifies the level of detail for a particular aspect of your DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report}.\n"]

type nonrec report_overrides = {
  skipped : report_override option;
      [@ocaml.doc
        "Specifies the level of reporting for the files, objects, and directories that DataSync \
         attempted to skip during your transfer.\n"]
  deleted : report_override option;
      [@ocaml.doc
        "Specifies the level of reporting for the files, objects, and directories that DataSync \
         attempted to delete in your destination location. This only applies if you \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html}configure \
         your task} to delete data in the destination that isn't in the source.\n"]
  verified : report_override option;
      [@ocaml.doc
        "Specifies the level of reporting for the files, objects, and directories that DataSync \
         attempted to verify at the end of your transfer.\n"]
  transferred : report_override option;
      [@ocaml.doc
        "Specifies the level of reporting for the files, objects, and directories that DataSync \
         attempted to transfer.\n"]
}
[@@ocaml.doc
  "The level of detail included in each aspect of your DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report}.\n"]

type nonrec task_report_config = {
  overrides : report_overrides option;
      [@ocaml.doc
        "Customizes the reporting level for aspects of your task report. For example, your report \
         might generally only include errors, but you could specify that you want a list of \
         successes and errors just for the files that DataSync attempted to delete in your \
         destination location.\n"]
  object_version_ids : object_version_ids option;
      [@ocaml.doc
        "Specifies whether your task report includes the new version of each object transferred \
         into an S3 bucket. This only applies if you \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/manage-versioning-examples.html}enable \
         versioning on your bucket}. Keep in mind that setting this to [INCLUDE] can increase the \
         duration of your task execution.\n"]
  report_level : report_level option;
      [@ocaml.doc
        "Specifies whether you want your task report to include only what went wrong with your \
         transfer or a list of what succeeded and didn't.\n\n\
        \ {ul\n\
        \       {-   [ERRORS_ONLY]: A report shows what DataSync was unable to transfer, skip, \
         verify, and delete.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESSES_AND_ERRORS]: A report shows what DataSync was able and unable to \
         transfer, skip, verify, and delete.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  output_type : report_output_type option;
      [@ocaml.doc
        "Specifies the type of task report that you want:\n\n\
        \ {ul\n\
        \       {-   [SUMMARY_ONLY]: Provides necessary details about your task, including the \
         number of files, objects, and directories transferred and transfer duration.\n\
        \           \n\
        \            }\n\
        \       {-   [STANDARD]: Provides complete details about your task, including a full list \
         of files, objects, and directories that were transferred, skipped, verified, and more.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  destination : report_destination option;
      [@ocaml.doc
        "Specifies the Amazon S3 bucket where DataSync uploads your task report. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html#task-report-access}Task \
         reports}.\n"]
}
[@@ocaml.doc
  "Specifies how you want to configure a task report, which provides detailed information about \
   for your DataSync transfer.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Task reports}.\n\
  \ "]

type nonrec update_task_request = {
  task_report_config : task_report_config option;
      [@ocaml.doc
        "Specifies how you want to configure a task report, which provides detailed information \
         about your DataSync transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Monitoring \
         your DataSync transfers with task reports}.\n\n\
        \ When using this parameter, your caller identity (the IAM role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ \n\
        \  To remove a task report configuration, specify this parameter as empty.\n\
        \  "]
  manifest_config : manifest_config option;
      [@ocaml.doc
        "Configures a manifest, which is a list of files or objects that you want DataSync to \
         transfer. For more information and configuration examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
         what DataSync transfers by using a manifest}.\n\n\
        \ When using this parameter, your caller identity (the IAM role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ \n\
        \  To remove a manifest configuration, specify this parameter as empty.\n\
        \  "]
  includes : filter_list option;
      [@ocaml.doc
        "Specifies include filters define the files, objects, and folders in your source location \
         that you want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  cloud_watch_log_group_arn : log_group_arn option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of an Amazon CloudWatch log group for monitoring \
         your task.\n\n\
        \ For Enhanced mode tasks, you must use [/aws/datasync] as your log group name. For example:\n\
        \ \n\
        \   [arn:aws:logs:us-east-1:111222333444:log-group:/aws/datasync:*] \n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-logging.html}Monitoring \
         data transfers with CloudWatch Logs}.\n\
        \   "]
  name : tag_value option; [@ocaml.doc "Specifies the name of your task.\n"]
  schedule : task_schedule option;
      [@ocaml.doc
        "Specifies a schedule for when you want your task to run. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}Scheduling \
         your task}.\n"]
  excludes : filter_list option;
      [@ocaml.doc
        "Specifies exclude filters that define the files, objects, and folders in your source \
         location that you don't want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  options : options option; [@ocaml.doc ""]
  task_arn : task_arn; [@ocaml.doc "Specifies the ARN of the task that you want to update.\n"]
}
[@@ocaml.doc "UpdateTaskResponse\n"]

type nonrec update_task_execution_response = unit [@@ocaml.doc ""]

type nonrec task_execution_arn = string [@@ocaml.doc ""]

type nonrec update_task_execution_request = {
  options : options; [@ocaml.doc ""]
  task_execution_arn : task_execution_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the task execution that you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_request_exception = {
  datasync_error_code : string_ option; [@ocaml.doc ""]
  error_code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "This exception is thrown when the client submits a malformed request.\n"]

type nonrec internal_exception = {
  error_code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "This exception is thrown when an error occurs in the DataSync service.\n"]

type nonrec update_smb_domain = string [@@ocaml.doc ""]

type nonrec update_location_smb_response = unit [@@ocaml.doc ""]

type nonrec location_arn = string [@@ocaml.doc ""]

type nonrec smb_subdirectory = string [@@ocaml.doc ""]

type nonrec server_hostname = string [@@ocaml.doc ""]

type nonrec smb_user = string [@@ocaml.doc ""]

type nonrec smb_domain = string [@@ocaml.doc ""]

type nonrec smb_password = string [@@ocaml.doc ""]

type nonrec secret_arn = string [@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec cmk_secret_config = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "Specifies the ARN for the customer-managed KMS key that DataSync uses to encrypt the \
         DataSync-managed secret stored for [SecretArn]. DataSync provides this key to Secrets \
         Manager.\n"]
  secret_arn : secret_arn option;
      [@ocaml.doc
        "Specifies the ARN for the DataSync-managed Secrets Manager secret that that is used to \
         access a specific storage location. This property is generated by DataSync and is \
         read-only. DataSync encrypts this secret with the KMS key that you specify for \
         [KmsKeyArn].\n"]
}
[@@ocaml.doc
  "Specifies configuration information for a DataSync-managed secret, such as an authentication \
   token, secret key, password, or Kerberos keytab that DataSync uses to access a specific storage \
   location, with a customer-managed KMS key.\n\n\
  \  You can use either [CmkSecretConfig] or [CustomSecretConfig] to provide credentials for a \
   [CreateLocation] request. Do not provide both parameters for the same request.\n\
  \  \n\
  \   "]

type nonrec iam_role_arn_or_empty_string = string [@@ocaml.doc ""]

type nonrec custom_secret_config = {
  secret_access_role_arn : iam_role_arn_or_empty_string option;
      [@ocaml.doc
        "Specifies the ARN for the Identity and Access Management role that DataSync uses to \
         access the secret specified for [SecretArn].\n"]
  secret_arn : secret_arn option; [@ocaml.doc "Specifies the ARN for an Secrets Manager secret.\n"]
}
[@@ocaml.doc
  "Specifies configuration information for a customer-managed Secrets Manager secret where a \
   storage location credentials is stored in Secrets Manager as plain text (for authentication \
   token, secret key, or password) or as binary (for Kerberos keytab). This configuration includes \
   the secret ARN, and the ARN for an IAM role that provides access to the secret.\n\n\
  \  You can use either [CmkSecretConfig] or [CustomSecretConfig] to provide credentials for a \
   [CreateLocation] request. Do not provide both parameters for the same request.\n\
  \  \n\
  \   "]

type nonrec agent_arn = string [@@ocaml.doc ""]

type nonrec agent_arn_list = agent_arn list [@@ocaml.doc ""]

type nonrec smb_version =
  | SMB2_0 [@ocaml.doc ""]
  | SMB1 [@ocaml.doc ""]
  | SMB3 [@ocaml.doc ""]
  | SMB2 [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec smb_mount_options = {
  version : smb_version option;
      [@ocaml.doc
        "By default, DataSync automatically chooses an SMB protocol version based on negotiation \
         with your SMB file server. You also can configure DataSync to use a specific SMB version, \
         but we recommend doing this only if DataSync has trouble negotiating with the SMB file \
         server automatically.\n\n\
        \ These are the following options for configuring the SMB version:\n\
        \ \n\
        \  {ul\n\
        \        {-   [AUTOMATIC] (default): DataSync and the SMB file server negotiate the \
         highest version of SMB that they mutually support between 2.1 and 3.1.1.\n\
        \            \n\
        \             This is the recommended option. If you instead choose a specific version \
         that your file server doesn't support, you may get an [Operation Not Supported] error.\n\
        \             \n\
        \              }\n\
        \        {-   [SMB3]: Restricts the protocol negotiation to only SMB version 3.0.2.\n\
        \            \n\
        \             }\n\
        \        {-   [SMB2]: Restricts the protocol negotiation to only SMB version 2.1.\n\
        \            \n\
        \             }\n\
        \        {-   [SMB2_0]: Restricts the protocol negotiation to only SMB version 2.0.\n\
        \            \n\
        \             }\n\
        \        {-   [SMB1]: Restricts the protocol negotiation to only SMB version 1.0.\n\
        \            \n\
        \              The [SMB1] option isn't available when \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateLocationFsxOntap.html}creating \
         an Amazon FSx for NetApp ONTAP location}.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Specifies the version of the Server Message Block (SMB) protocol that DataSync uses to access \
   an SMB file server.\n"]

type nonrec smb_authentication_type = KERBEROS [@ocaml.doc ""] | NTLM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec server_ip_address = string [@@ocaml.doc ""]

type nonrec dns_ip_list = server_ip_address list [@@ocaml.doc ""]

type nonrec kerberos_principal = string [@@ocaml.doc ""]

type nonrec kerberos_keytab_file = bytes [@@ocaml.doc ""]

type nonrec kerberos_krb5_conf_file = bytes [@@ocaml.doc ""]

type nonrec update_location_smb_request = {
  kerberos_krb5_conf : kerberos_krb5_conf_file option;
      [@ocaml.doc
        "Specifies a Kerberos configuration file ([krb5.conf]) that defines your Kerberos realm \
         configuration.\n\n\
        \ The file must be base64 encoded. If you're using the CLI, the encoding is done for you.\n\
        \ "]
  kerberos_keytab : kerberos_keytab_file option;
      [@ocaml.doc
        "Specifies your Kerberos key table (keytab) file, which includes mappings between your \
         Kerberos principal and encryption keys.\n\n\
        \ To avoid task execution errors, make sure that the Kerberos principal that you use to \
         create the keytab file matches exactly what you specify for [KerberosPrincipal].\n\
        \ "]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "Specifies a Kerberos prinicpal, which is an identity in your Kerberos realm that has \
         permission to access the files, folders, and file metadata in your SMB file server.\n\n\
        \ A Kerberos principal might look like [HOST/kerberosuser@MYDOMAIN.ORG].\n\
        \ \n\
        \  Principal names are case sensitive. Your DataSync task execution will fail if the \
         principal that you specify for this parameter doesn\226\128\153t exactly match the \
         principal that you use to create the keytab file.\n\
        \  "]
  dns_ip_addresses : dns_ip_list option;
      [@ocaml.doc
        "Specifies the IP addresses (IPv4 or IPv6) for the DNS servers that your SMB file server \
         belongs to. This parameter applies only if [AuthenticationType] is set to [KERBEROS].\n\n\
        \ If you have multiple domains in your environment, configuring this parameter makes sure \
         that DataSync connects to the right SMB file server. \n\
        \ "]
  authentication_type : smb_authentication_type option;
      [@ocaml.doc
        "Specifies the authentication protocol that DataSync uses to connect to your SMB file \
         server. DataSync supports [NTLM] (default) and [KERBEROS] authentication.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
  mount_options : smb_mount_options option; [@ocaml.doc ""]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "Specifies the DataSync agent (or agents) that can connect to your SMB file server. You \
         specify an agent by using its Amazon Resource Name (ARN).\n"]
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as a [Password] \
         or [KerberosKeytab] or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed Identity and Access Management (IAM) role that \
         provides access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as a [Password] \
         or [KerberosKeytab] or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed KMS key.\n"]
  password : smb_password option;
      [@ocaml.doc
        "Specifies the password of the user who can mount your SMB file server and has permission \
         to access the files and folders involved in your transfer. This parameter applies only if \
         [AuthenticationType] is set to [NTLM].\n"]
  domain : smb_domain option;
      [@ocaml.doc
        "Specifies the Windows domain name that your SMB file server belongs to. This parameter \
         applies only if [AuthenticationType] is set to [NTLM].\n\n\
        \ If you have multiple domains in your environment, configuring this parameter makes sure \
         that DataSync connects to the right file server.\n\
        \ "]
  user : smb_user option;
      [@ocaml.doc
        "Specifies the user name that can mount your SMB file server and has permission to access \
         the files and folders involved in your transfer. This parameter applies only if \
         [AuthenticationType] is set to [NTLM].\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
  server_hostname : server_hostname option;
      [@ocaml.doc
        "Specifies the domain name or IP address (IPv4 or IPv6) of the SMB file server that your \
         DataSync agent connects to.\n\n\
        \  If you're using Kerberos authentication, you must specify a domain name.\n\
        \  \n\
        \   "]
  subdirectory : smb_subdirectory option;
      [@ocaml.doc
        "Specifies the name of the share exported by your SMB file server where DataSync will read \
         or write data. You can include a subdirectory in the share path (for example, \
         [/path/to/subdirectory]). Make sure that other SMB clients in your network can also mount \
         this path.\n\n\
        \ To copy all data in the specified subdirectory, DataSync must be able to mount the SMB \
         share and access all of its data. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
  location_arn : location_arn;
      [@ocaml.doc "Specifies the ARN of the SMB location that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_s3_response = unit [@@ocaml.doc ""]

type nonrec s3_storage_class =
  | GLACIER_INSTANT_RETRIEVAL [@ocaml.doc ""]
  | OUTPOSTS [@ocaml.doc ""]
  | DEEP_ARCHIVE [@ocaml.doc ""]
  | GLACIER [@ocaml.doc ""]
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | ONEZONE_IA [@ocaml.doc ""]
  | STANDARD_IA [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_config = {
  bucket_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "Specifies the ARN of the IAM role that DataSync uses to access your S3 bucket.\n"]
}
[@@ocaml.doc
  "Specifies the Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
   DataSync uses to access your S3 bucket.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-access}Providing \
   DataSync access to S3 buckets}.\n\
  \ "]

type nonrec update_location_s3_request = {
  s3_config : s3_config option; [@ocaml.doc ""]
  s3_storage_class : s3_storage_class option;
      [@ocaml.doc
        "Specifies the storage class that you want your objects to use when Amazon S3 is a \
         transfer destination.\n\n\
        \ For buckets in Amazon Web Services Regions, the storage class defaults to [STANDARD]. \
         For buckets on Outposts, the storage class defaults to [OUTPOSTS].\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 transfers}.\n\
        \  "]
  subdirectory : s3_subdirectory option;
      [@ocaml.doc
        "Specifies a prefix in the S3 bucket that DataSync reads from or writes to (depending on \
         whether the bucket is a source or destination location).\n\n\
        \  DataSync can't transfer objects with a prefix that begins with a slash ([/]) or \
         includes [//], [/./], or [/../] patterns. For example:\n\
        \  \n\
        \   {ul\n\
        \         {-   [/photos] \n\
        \             \n\
        \              }\n\
        \         {-   [photos//2006/January] \n\
        \             \n\
        \              }\n\
        \         {-   [photos/./2006/February] \n\
        \             \n\
        \              }\n\
        \         {-   [photos/../2006/March] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the Amazon S3 transfer location that you're \
         updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_object_storage_response = unit [@@ocaml.doc ""]

type nonrec object_storage_server_port = int [@@ocaml.doc ""]

type nonrec object_storage_server_protocol = HTTP [@ocaml.doc ""] | HTTPS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_storage_access_key = string [@@ocaml.doc ""]

type nonrec object_storage_secret_key = string [@@ocaml.doc ""]

type nonrec object_storage_certificate = bytes [@@ocaml.doc ""]

type nonrec update_location_object_storage_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed Identity and Access Management (IAM) role that \
         provides access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed KMS key.\n"]
  server_certificate : object_storage_certificate option;
      [@ocaml.doc
        "Specifies a certificate chain for DataSync to authenticate with your object storage \
         system if the system uses a private or self-signed certificate authority (CA). You must \
         specify a single [.pem] file with a full certificate chain (for example, \
         [file:///home/user/.ssh/object_storage_certificates.pem]).\n\n\
        \ The certificate chain might include:\n\
        \ \n\
        \  {ul\n\
        \        {-  The object storage system's certificate\n\
        \            \n\
        \             }\n\
        \        {-  All intermediate certificates (if there are any)\n\
        \            \n\
        \             }\n\
        \        {-  The root certificate of the signing CA\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can concatenate your certificates into a [.pem] file (which can be up to 32768 \
         bytes before base64 encoding). The following example [cat] command creates an \
         [object_storage_certificates.pem] file that includes three certificates:\n\
        \   \n\
        \     [cat object_server_certificate.pem intermediate_certificate.pem\n\
        \        ca_root_certificate.pem > object_storage_certificates.pem] \n\
        \    \n\
        \     To use this parameter, configure [ServerProtocol] to [HTTPS].\n\
        \     \n\
        \      Updating this parameter doesn't interfere with tasks that you have in progress.\n\
        \      "]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "(Optional) Specifies the Amazon Resource Names (ARNs) of the DataSync agents that can \
         connect with your object storage system. If you are setting up an agentless cross-cloud \
         transfer, you do not need to specify a value for this parameter.\n\n\
        \  You cannot add or remove agents from a storage location after you initially create it.\n\
        \  \n\
        \   "]
  secret_key : object_storage_secret_key option;
      [@ocaml.doc
        "Specifies the secret key (for example, a password) if credentials are required to \
         authenticate with the object storage server.\n\n\
        \  If you provide a secret using [SecretKey], but do not provide secret configuration \
         details using [CmkSecretConfig] or [CustomSecretConfig], then DataSync stores the token \
         using your Amazon Web Services account's Secrets Manager secret.\n\
        \  \n\
        \   "]
  access_key : object_storage_access_key option;
      [@ocaml.doc
        "Specifies the access key (for example, a user name) if credentials are required to \
         authenticate with the object storage server.\n"]
  server_hostname : server_hostname option;
      [@ocaml.doc
        "Specifies the domain name or IP address (IPv4 or IPv6) of the object storage server that \
         your DataSync agent connects to.\n"]
  subdirectory : s3_subdirectory option;
      [@ocaml.doc
        "Specifies the object prefix for your object storage server. If this is a source location, \
         DataSync only copies objects with this prefix. If this is a destination location, \
         DataSync writes all objects with this prefix.\n"]
  server_protocol : object_storage_server_protocol option;
      [@ocaml.doc "Specifies the protocol that your object storage server uses to communicate.\n"]
  server_port : object_storage_server_port option;
      [@ocaml.doc
        "Specifies the port that your object storage server accepts inbound network traffic on \
         (for example, port 443).\n"]
  location_arn : location_arn;
      [@ocaml.doc "Specifies the ARN of the object storage system location that you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_nfs_response = unit [@@ocaml.doc ""]

type nonrec nfs_subdirectory = string [@@ocaml.doc ""]

type nonrec on_prem_config = {
  agent_arns : agent_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the DataSync agents that can connect to your NFS file \
         server.\n\n\
        \ You can specify more than one agent. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#multiple-agents}Using \
         multiple DataSync agents}.\n\
        \ "]
}
[@@ocaml.doc
  "The DataSync agents that can connect to your Network File System (NFS) file server.\n"]

type nonrec nfs_version =
  | NFS4_1 [@ocaml.doc ""]
  | NFS4_0 [@ocaml.doc ""]
  | NFS3 [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec nfs_mount_options = {
  version : nfs_version option;
      [@ocaml.doc
        "Specifies the NFS version that you want DataSync to use when mounting your NFS share. If \
         the server refuses to use the version specified, the task fails.\n\n\
        \ You can specify the following options:\n\
        \ \n\
        \  {ul\n\
        \        {-   [AUTOMATIC] (default): DataSync chooses NFS version 4.1.\n\
        \            \n\
        \             }\n\
        \        {-   [NFS3]: Stateless protocol version that allows for asynchronous writes on \
         the server.\n\
        \            \n\
        \             }\n\
        \        {-   [NFSv4_0]: Stateful, firewall-friendly protocol version that supports \
         delegations and pseudo file systems.\n\
        \            \n\
        \             }\n\
        \        {-   [NFSv4_1]: Stateful protocol version that supports sessions, directory \
         delegations, and parallel data processing. NFS version 4.1 also includes all features \
         available in version 4.0.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    DataSync currently only supports NFS version 3 with Amazon FSx for NetApp ONTAP \
         locations.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "Specifies how DataSync can access a location using the NFS protocol.\n"]

type nonrec update_location_nfs_request = {
  mount_options : nfs_mount_options option; [@ocaml.doc ""]
  on_prem_config : on_prem_config option; [@ocaml.doc ""]
  server_hostname : server_hostname option;
      [@ocaml.doc
        "Specifies the DNS name or IP address (IPv4 or IPv6) of the NFS file server that your \
         DataSync agent connects to.\n"]
  subdirectory : nfs_subdirectory option;
      [@ocaml.doc
        "Specifies the export path in your NFS file server that you want DataSync to mount.\n\n\
        \ This path (or a subdirectory of the path) is where DataSync transfers data to or from. \
         For information on configuring an export for DataSync, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs}Accessing \
         NFS file servers}.\n\
        \ "]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the NFS transfer location that you want to \
         update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_hdfs_response = unit [@@ocaml.doc ""]

type nonrec hdfs_subdirectory = string [@@ocaml.doc ""]

type nonrec hdfs_server_hostname = string [@@ocaml.doc ""]

type nonrec hdfs_server_port = int [@@ocaml.doc ""]

type nonrec hdfs_name_node = {
  port : hdfs_server_port;
      [@ocaml.doc "The port that the NameNode uses to listen to client requests.\n"]
  hostname : hdfs_server_hostname;
      [@ocaml.doc
        "The hostname of the NameNode in the HDFS cluster. This value is the IP address or Domain \
         Name Service (DNS) name of the NameNode. An agent that's installed on-premises uses this \
         hostname to communicate with the NameNode in the network.\n"]
}
[@@ocaml.doc
  "The NameNode of the Hadoop Distributed File System (HDFS). The NameNode manages the file \
   system's namespace. The NameNode performs operations such as opening, closing, and renaming \
   files and directories. The NameNode contains the information to map blocks of data to the \
   DataNodes.\n"]

type nonrec hdfs_name_node_list = hdfs_name_node list [@@ocaml.doc ""]

type nonrec hdfs_block_size = int [@@ocaml.doc ""]

type nonrec hdfs_replication_factor = int [@@ocaml.doc ""]

type nonrec kms_key_provider_uri = string [@@ocaml.doc ""]

type nonrec hdfs_rpc_protection =
  | PRIVACY [@ocaml.doc ""]
  | INTEGRITY [@ocaml.doc ""]
  | AUTHENTICATION [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hdfs_data_transfer_protection =
  | PRIVACY [@ocaml.doc ""]
  | INTEGRITY [@ocaml.doc ""]
  | AUTHENTICATION [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec qop_configuration = {
  data_transfer_protection : hdfs_data_transfer_protection option;
      [@ocaml.doc
        "The data transfer protection setting configured on the HDFS cluster. This setting \
         corresponds to your [dfs.data.transfer.protection] setting in the [hdfs-site.xml] file on \
         your Hadoop cluster.\n"]
  rpc_protection : hdfs_rpc_protection option;
      [@ocaml.doc
        "The RPC protection setting configured on the HDFS cluster. This setting corresponds to \
         your [hadoop.rpc.protection] setting in your [core-site.xml] file on your Hadoop cluster.\n"]
}
[@@ocaml.doc
  "The Quality of Protection (QOP) configuration specifies the Remote Procedure Call (RPC) and \
   data transfer privacy settings configured on the Hadoop Distributed File System (HDFS) cluster.\n"]

type nonrec hdfs_authentication_type = KERBEROS [@ocaml.doc ""] | SIMPLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hdfs_user = string [@@ocaml.doc ""]

type nonrec update_location_hdfs_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as a \
         [KerberosKeytab] or set of credentials that DataSync uses to access a specific transfer \
         location, and a customer-managed Identity and Access Management (IAM) role that provides \
         access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as a \
         [KerberosKeytab] or set of credentials that DataSync uses to access a specific transfer \
         location, and a customer-managed KMS key.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the DataSync agents that can connect to your HDFS \
         cluster.\n"]
  kerberos_krb5_conf : kerberos_krb5_conf_file option;
      [@ocaml.doc
        "The [krb5.conf] file that contains the Kerberos configuration information. You can load \
         the [krb5.conf] file by providing the file's address. If you're using the CLI, it \
         performs the base64 encoding for you. Otherwise, provide the base64-encoded text.\n"]
  kerberos_keytab : kerberos_keytab_file option;
      [@ocaml.doc
        "The Kerberos key table (keytab) that contains mappings between the defined Kerberos \
         principal and the encrypted keys. You can load the keytab from a file by providing the \
         file's address.\n"]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "The Kerberos principal with access to the files and folders on the HDFS cluster. \n"]
  simple_user : hdfs_user option;
      [@ocaml.doc "The user name used to identify the client on the host operating system.\n"]
  authentication_type : hdfs_authentication_type option;
      [@ocaml.doc "The type of authentication used to determine the identity of the user. \n"]
  qop_configuration : qop_configuration option;
      [@ocaml.doc
        "The Quality of Protection (QOP) configuration specifies the Remote Procedure Call (RPC) \
         and data transfer privacy settings configured on the Hadoop Distributed File System \
         (HDFS) cluster. \n"]
  kms_key_provider_uri : kms_key_provider_uri option;
      [@ocaml.doc "The URI of the HDFS cluster's Key Management Server (KMS). \n"]
  replication_factor : hdfs_replication_factor option;
      [@ocaml.doc
        "The number of DataNodes to replicate the data to when writing to the HDFS cluster. \n"]
  block_size : hdfs_block_size option;
      [@ocaml.doc "The size of the data blocks to write into the HDFS cluster. \n"]
  name_nodes : hdfs_name_node_list option;
      [@ocaml.doc
        "The NameNode that manages the HDFS namespace. The NameNode performs operations such as \
         opening, closing, and renaming files and directories. The NameNode contains the \
         information to map blocks of data to the DataNodes. You can use only one NameNode.\n"]
  subdirectory : hdfs_subdirectory option;
      [@ocaml.doc
        "A subdirectory in the HDFS cluster. This subdirectory is used to read data from or write \
         data to the HDFS cluster.\n"]
  location_arn : location_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the source HDFS cluster location.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_fsx_windows_response = unit [@@ocaml.doc ""]

type nonrec fsx_windows_subdirectory = string [@@ocaml.doc ""]

type nonrec update_location_fsx_windows_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as a [Password] \
         or set of credentials that DataSync uses to access a specific transfer location, and a \
         customer-managed Identity and Access Management (IAM) role that provides access to the \
         secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as a [Password] \
         or set of credentials that DataSync uses to access a specific transfer location, and a \
         customer-managed KMS key.\n"]
  password : smb_password option;
      [@ocaml.doc
        "Specifies the password of the user with the permissions to mount and access the files, \
         folders, and file metadata in your FSx for Windows File Server file system.\n"]
  user : smb_user option;
      [@ocaml.doc
        "Specifies the user with the permissions to mount and access the files, folders, and file \
         metadata in your FSx for Windows File Server file system.\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-windows-location-permissions}required \
         permissions} for FSx for Windows File Server locations.\n\
        \ "]
  domain : update_smb_domain option;
      [@ocaml.doc
        "Specifies the name of the Windows domain that your FSx for Windows File Server file \
         system belongs to.\n\n\
        \ If you have multiple Active Directory domains in your environment, configuring this \
         parameter makes sure that DataSync connects to the right file system.\n\
        \ "]
  subdirectory : fsx_windows_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your file system using forward slashes. DataSync uses this \
         subdirectory to read or write data (depending on whether the file system is a source or \
         destination location).\n"]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the ARN of the FSx for Windows File Server transfer location that you're \
         updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_fsx_open_zfs_response = unit [@@ocaml.doc ""]

type nonrec fsx_protocol_nfs = { mount_options : nfs_mount_options option [@ocaml.doc ""] }
[@@ocaml.doc
  "Specifies the Network File System (NFS) protocol configuration that DataSync uses to access \
   your FSx for OpenZFS file system or FSx for ONTAP file system's storage virtual machine (SVM).\n"]

type nonrec managed_secret_config = {
  secret_arn : secret_arn option; [@ocaml.doc "Specifies the ARN for an Secrets Manager secret.\n"]
}
[@@ocaml.doc
  "Specifies configuration information for a DataSync-managed secret, such as an authentication \
   token or set of credentials that DataSync uses to access a specific transfer location. DataSync \
   uses the default Amazon Web Services-managed KMS key to encrypt this secret in Secrets Manager.\n"]

type nonrec fsx_protocol_smb = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the password for an FSx for ONTAP storage location (using SMB) is stored in plain text, \
         in Secrets Manager. This configuration includes the secret ARN, and the ARN for an IAM \
         role that provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [Password]) or [CustomSecretConfig] (without \
         [Password]) to provide credentials for a [CreateLocationFsxOntap] request. Do not provide \
         both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, which includes the \
         password that DataSync uses to access a specific FSx for ONTAP storage location (using \
         SMB), with a customer-managed KMS key.\n\n\
        \ When you include this parameter as part of a [CreateLocationFsxOntap] request, you \
         provide only the KMS key ARN. DataSync uses this KMS key together with the [Password] you \
         specify for to create a DataSync-managed secret to store the location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with [Password]) or [CustomSecretConfig] \
         (without [Password]) to provide credentials for a [CreateLocationFsxOntap] request. Do \
         not provide both parameters for the same request.\n\
        \    \n\
        \     "]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a [Password] \
         that DataSync uses to access a specific storage location. DataSync uses the default \
         Amazon Web Services-managed KMS key to encrypt this secret in Secrets Manager.\n\n\
        \  Do not provide this for a [CreateLocation] request. [ManagedSecretConfig] is a ReadOnly \
         property and is only be populated in the [DescribeLocation] response.\n\
        \  \n\
        \   "]
  user : smb_user;
      [@ocaml.doc
        "Specifies a user that can mount and access the files, folders, and metadata in your SVM.\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb}Using \
         the SMB protocol}.\n\
        \ "]
  password : smb_password option;
      [@ocaml.doc "Specifies the password of a user who has permission to access your SVM.\n"]
  mount_options : smb_mount_options option; [@ocaml.doc ""]
  domain : smb_domain option;
      [@ocaml.doc
        "Specifies the name of the Windows domain that your storage virtual machine (SVM) belongs \
         to.\n\n\
        \ If you have multiple domains in your environment, configuring this setting makes sure \
         that DataSync connects to the right SVM.\n\
        \ \n\
        \  If you have multiple Active Directory domains in your environment, configuring this \
         parameter makes sure that DataSync connects to the right SVM.\n\
        \  "]
}
[@@ocaml.doc
  "Specifies the Server Message Block (SMB) protocol configuration that DataSync uses to access \
   your Amazon FSx for NetApp ONTAP file system's storage virtual machine (SVM). For more \
   information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access}Providing \
   DataSync access to FSx for ONTAP file systems}.\n"]

type nonrec fsx_protocol = {
  sm_b : fsx_protocol_smb option;
      [@ocaml.doc
        "Specifies the Server Message Block (SMB) protocol configuration that DataSync uses to \
         access your FSx for ONTAP file system's SVM.\n"]
  nf_s : fsx_protocol_nfs option;
      [@ocaml.doc
        "Specifies the Network File System (NFS) protocol configuration that DataSync uses to \
         access your FSx for OpenZFS file system or FSx for ONTAP file system's storage virtual \
         machine (SVM).\n"]
}
[@@ocaml.doc
  "Specifies the data transfer protocol that DataSync uses to access your Amazon FSx file system.\n"]

type nonrec update_location_fsx_open_zfs_request = {
  subdirectory : smb_subdirectory option;
      [@ocaml.doc
        "Specifies a subdirectory in the location's path that must begin with [/fsx]. DataSync \
         uses this subdirectory to read or write data (depending on whether the file system is a \
         source or destination location).\n"]
  protocol : fsx_protocol option; [@ocaml.doc ""]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the FSx for OpenZFS transfer location that \
         you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_fsx_ontap_response = unit [@@ocaml.doc ""]

type nonrec fsx_update_protocol_smb = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as a [Password] \
         or set of credentials that DataSync uses to access a specific transfer location. This \
         configuration includes the secret ARN, and the ARN for an IAM role that provides access \
         to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as a [Password] \
         or set of credentials that DataSync uses to access a specific transfer location, and a \
         customer-managed KMS key.\n"]
  user : smb_user option;
      [@ocaml.doc
        "Specifies a user that can mount and access the files, folders, and metadata in your SVM.\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb}Using \
         the SMB protocol}.\n\
        \ "]
  password : smb_password option;
      [@ocaml.doc "Specifies the password of a user who has permission to access your SVM.\n"]
  mount_options : smb_mount_options option; [@ocaml.doc ""]
  domain : update_smb_domain option;
      [@ocaml.doc
        "Specifies the name of the Windows domain that your storage virtual machine (SVM) belongs \
         to.\n\n\
        \ If you have multiple Active Directory domains in your environment, configuring this \
         parameter makes sure that DataSync connects to the right SVM.\n\
        \ "]
}
[@@ocaml.doc
  "Specifies the Server Message Block (SMB) protocol configuration that DataSync uses to access \
   your Amazon FSx for NetApp ONTAP file system's storage virtual machine (SVM). For more \
   information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access}Providing \
   DataSync access to FSx for ONTAP file systems}.\n"]

type nonrec fsx_update_protocol = {
  sm_b : fsx_update_protocol_smb option;
      [@ocaml.doc
        "Specifies the Server Message Block (SMB) protocol configuration that DataSync uses to \
         access your FSx for ONTAP file system's storage virtual machine (SVM).\n"]
  nf_s : fsx_protocol_nfs option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Specifies the data transfer protocol that DataSync uses to access your Amazon FSx file system.\n\n\
  \  You can't update the Network File System (NFS) protocol configuration for FSx for ONTAP \
   locations. DataSync currently only supports NFS version 3 with this location type.\n\
  \  \n\
  \   "]

type nonrec fsx_ontap_subdirectory = string [@@ocaml.doc ""]

type nonrec update_location_fsx_ontap_request = {
  subdirectory : fsx_ontap_subdirectory option;
      [@ocaml.doc
        "Specifies a path to the file share in the storage virtual machine (SVM) where you want to \
         transfer data to or from.\n\n\
        \ You can specify a junction path (also known as a mount point), qtree path (for NFS file \
         shares), or share name (for SMB file shares). For example, your mount path might be \
         [/vol1], [/vol1/tree1], or [/share1].\n\
        \ \n\
        \   Don't specify a junction path in the SVM's root volume. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-svms.html}Managing FSx for \
         ONTAP storage virtual machines} in the {i Amazon FSx for NetApp ONTAP User Guide}.\n\
        \   \n\
        \    "]
  protocol : fsx_update_protocol option;
      [@ocaml.doc
        "Specifies the data transfer protocol that DataSync uses to access your Amazon FSx file \
         system.\n"]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the FSx for ONTAP transfer location that \
         you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_fsx_lustre_response = unit [@@ocaml.doc ""]

type nonrec update_location_fsx_lustre_request = {
  subdirectory : smb_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your FSx for Lustre file system. The path can include \
         subdirectories.\n\n\
        \ When the location is used as a source, DataSync reads data from the mount path. When the \
         location is used as a destination, DataSync writes data to the mount path. If you don't \
         include this parameter, DataSync uses the file system's root directory ([/]).\n\
        \ "]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the FSx for Lustre transfer location that \
         you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_efs_response = unit [@@ocaml.doc ""]

type nonrec efs_subdirectory = string [@@ocaml.doc ""]

type nonrec efs_in_transit_encryption = TLS1_2 [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_location_efs_request = {
  in_transit_encryption : efs_in_transit_encryption option;
      [@ocaml.doc
        "Specifies whether you want DataSync to use Transport Layer Security (TLS) 1.2 encryption \
         when it transfers data to or from your Amazon EFS file system.\n\n\
        \ If you specify an access point using [AccessPointArn] or an IAM role using \
         [FileSystemAccessRoleArn], you must set this parameter to [TLS1_2].\n\
        \ "]
  file_system_access_role_arn : updated_efs_iam_role_arn option;
      [@ocaml.doc
        "Specifies an Identity and Access Management (IAM) role that allows DataSync to access \
         your Amazon EFS file system.\n\n\
        \ For information on creating this role, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role}Creating \
         a DataSync IAM role for Amazon EFS file system access}.\n\
        \ "]
  access_point_arn : updated_efs_access_point_arn option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the access point that DataSync uses to mount \
         your Amazon EFS file system.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam}Accessing \
         restricted Amazon EFS file systems}.\n\
        \ "]
  subdirectory : efs_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your Amazon EFS file system. This is where DataSync reads or \
         writes data on your file system (depending on if this is a source or destination \
         location).\n\n\
        \ By default, DataSync uses the root directory (or \
         {{:https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html}access point} if you \
         provide one by using [AccessPointArn]). You can also include subdirectories using forward \
         slashes (for example, [/path/to/folder]).\n\
        \ "]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the Amazon EFS transfer location that you're \
         updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_location_azure_blob_response = unit [@@ocaml.doc ""]

type nonrec azure_blob_subdirectory = string [@@ocaml.doc ""]

type nonrec azure_blob_authentication_type = NONE [@ocaml.doc ""] | SAS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec azure_blob_sas_token = string [@@ocaml.doc ""]

type nonrec azure_blob_sas_configuration = {
  token : azure_blob_sas_token;
      [@ocaml.doc
        "Specifies a SAS token that provides permissions to access your Azure Blob Storage.\n\n\
        \ The token is part of the SAS URI string that comes after the storage resource URI and a \
         question mark. A token looks something like this:\n\
        \ \n\
        \   \
         [sp=r&st=2023-12-20T14:54:52Z&se=2023-12-20T22:54:52Z&spr=https&sv=2021-06-08&sr=c&sig=aBBKDWQvyuVcTPH9EBp%2FXTI9E%2F%2Fmq171%2BZU178wcwqU%3D] \n\
        \  "]
}
[@@ocaml.doc
  "The shared access signature (SAS) configuration that allows DataSync to access your Microsoft \
   Azure Blob Storage.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-sas-tokens}SAS \
   tokens} for accessing your Azure Blob Storage.\n\
  \ "]

type nonrec azure_blob_type = BLOCK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec azure_access_tier =
  | ARCHIVE [@ocaml.doc ""]
  | COOL [@ocaml.doc ""]
  | HOT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_location_azure_blob_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed Identity and Access Management (IAM) role that \
         provides access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed KMS key.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "(Optional) Specifies the Amazon Resource Name (ARN) of the DataSync agent that can \
         connect with your Azure Blob Storage container. If you are setting up an agentless \
         cross-cloud transfer, you do not need to specify a value for this parameter.\n\n\
        \ You can specify more than one agent. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html}Using \
         multiple agents for your transfer}.\n\
        \ \n\
        \   You cannot add or remove agents from a storage location after you initially create it.\n\
        \   \n\
        \    "]
  access_tier : azure_access_tier option;
      [@ocaml.doc
        "Specifies the access tier that you want your objects or files transferred into. This only \
         applies when using the location as a transfer destination. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers}Access \
         tiers}.\n"]
  blob_type : azure_blob_type option;
      [@ocaml.doc
        "Specifies the type of blob that you want your objects or files to be when transferring \
         them into Azure Blob Storage. Currently, DataSync only supports moving data into Azure \
         Blob Storage as block blobs. For more information on blob types, see the \
         {{:https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs}Azure \
         Blob Storage documentation}.\n"]
  sas_configuration : azure_blob_sas_configuration option;
      [@ocaml.doc
        "Specifies the SAS configuration that allows DataSync to access your Azure Blob Storage.\n"]
  authentication_type : azure_blob_authentication_type option;
      [@ocaml.doc
        "Specifies the authentication method DataSync uses to access your Azure Blob Storage. \
         DataSync can access blob storage using a shared access signature (SAS).\n"]
  subdirectory : azure_blob_subdirectory option;
      [@ocaml.doc
        "Specifies path segments if you want to limit your transfer to a virtual directory in your \
         container (for example, [/my/images]).\n"]
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the ARN of the Azure Blob Storage transfer location that you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_agent_response = unit [@@ocaml.doc ""]

type nonrec update_agent_request = {
  name : tag_value option; [@ocaml.doc "The name that you want to use to configure the agent.\n"]
  agent_arn : agent_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the agent to update.\n"]
}
[@@ocaml.doc "UpdateAgentRequest\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  keys : tag_key_list; [@ocaml.doc "Specifies the keys in the tags that you want to remove.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the resource to remove the tags from.\n"]
}
[@@ocaml.doc "UntagResourceRequest\n"]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec task_status =
  | UNAVAILABLE [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schedule_disabled_reason = string [@@ocaml.doc ""]

type nonrec schedule_disabled_by = SERVICE [@ocaml.doc ""] | USER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_schedule_details = {
  disabled_by : schedule_disabled_by option;
      [@ocaml.doc
        "Indicates how your task schedule was disabled.\n\n\
        \ {ul\n\
        \       {-   [USER] - Your schedule was manually disabled by using the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_UpdateTask.html}UpdateTask} \
         operation or DataSync console.\n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE] - Your schedule was automatically disabled by DataSync because the \
         task failed repeatedly with the same error.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  disabled_reason : schedule_disabled_reason option;
      [@ocaml.doc
        "Provides a reason if the task schedule is disabled.\n\n\
        \ If your schedule is disabled by [USER], you see a [Manually disabled by\n\
        \        user.] message.\n\
        \ \n\
        \  If your schedule is disabled by [SERVICE], you see an error message to help you \
         understand why the task keeps failing. For information on resolving DataSync errors, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html}Troubleshooting \
         issues with DataSync transfers}.\n\
        \  "]
  status_update_time : time option;
      [@ocaml.doc
        "Indicates the last time the status of your task schedule changed. For example, if \
         DataSync automatically disables your schedule because of a repeated error, you can see \
         when the schedule was disabled.\n"]
}
[@@ocaml.doc
  "Provides information about your DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}task schedule}.\n"]

type nonrec task_mode = ENHANCED [@ocaml.doc ""] | BASIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec task_list_entry = {
  task_mode : task_mode option;
      [@ocaml.doc
        "The task mode that you're using. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Choosing \
         a task mode for your data transfer}.\n"]
  name : tag_value option; [@ocaml.doc "The name of the task.\n"]
  status : task_status option; [@ocaml.doc "The status of the task.\n"]
  task_arn : task_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
}
[@@ocaml.doc
  "Represents a single entry in a list of tasks. [TaskListEntry] returns an array that contains a \
   list of tasks when the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTasks.html}ListTasks} \
   operation is called. A task includes the source and destination file systems to sync and the \
   options to use for the tasks.\n"]

type nonrec task_list = task_list_entry list [@@ocaml.doc ""]

type nonrec task_filter_name = CreationTime [@ocaml.doc ""] | LocationId [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_attribute_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_attribute_value list [@@ocaml.doc ""]

type nonrec operator =
  | BEGINS_WITH [@ocaml.doc ""]
  | NOT_CONTAINS [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | EQ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_filter = {
  operator : operator;
      [@ocaml.doc
        "The operator that is used to compare filter values (for example, [Equals] or [Contains]).\n"]
  values : filter_values;
      [@ocaml.doc
        "The values that you want to filter for. For example, you might want to display only tasks \
         for a specific destination location.\n"]
  name : task_filter_name;
      [@ocaml.doc
        "The name of the filter being used. Each API call supports a list of filters that are \
         available for it. For example, [LocationId] for [ListTasks].\n"]
}
[@@ocaml.doc
  "You can use API filters to narrow down the list of resources returned by [ListTasks]. For \
   example, to retrieve all tasks on a source location, you can use [ListTasks] with filter name \
   [LocationId] and [Operator\n\
  \        Equals] with the ARN for the location.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html}filtering \
   DataSync resources}.\n\
  \ "]

type nonrec task_filters = task_filter list [@@ocaml.doc ""]

type nonrec task_execution_status =
  | ERROR [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | VERIFYING [@ocaml.doc ""]
  | TRANSFERRING [@ocaml.doc ""]
  | PREPARING [@ocaml.doc ""]
  | LAUNCHING [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec duration = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec phase_status =
  | ERROR [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_execution_result_detail = {
  error_detail : string_ option;
      [@ocaml.doc
        "The detailed description of an error that DataSync encountered during your task \
         execution. You can use this information to help \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html}troubleshoot \
         issues}. \n"]
  error_code : string_ option;
      [@ocaml.doc
        "An error that DataSync encountered during your task execution. You can use this \
         information to help \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html}troubleshoot \
         issues}.\n"]
  verify_status : phase_status option;
      [@ocaml.doc
        "The status of the [VERIFYING] step for your task execution. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n"]
  verify_duration : duration option;
      [@ocaml.doc
        "The time in milliseconds that your task execution was in the [VERIFYING] step. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n\n\
        \ For Enhanced mode tasks, the value is always [0]. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-verifying-works}How \
         DataSync verifies your data's integrity}.\n\
        \ "]
  transfer_status : phase_status option;
      [@ocaml.doc
        "The status of the [TRANSFERRING] step for your task execution. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n"]
  transfer_duration : duration option;
      [@ocaml.doc
        "The time in milliseconds that your task execution was in the [TRANSFERRING] step. For \
         more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n\n\
        \ For Enhanced mode tasks, the value is always [0]. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-datasync-transfers}How \
         DataSync transfers your data}.\n\
        \ "]
  total_duration : duration option;
      [@ocaml.doc "The time in milliseconds that your task execution ran.\n"]
  prepare_status : phase_status option;
      [@ocaml.doc
        "The status of the [PREPARING] step for your task execution. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n"]
  prepare_duration : duration option;
      [@ocaml.doc
        "The time in milliseconds that your task execution was in the [PREPARING] step. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n\n\
        \ For Enhanced mode tasks, the value is always [0]. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-datasync-prepares}How \
         DataSync prepares your data transfer}.\n\
        \ "]
}
[@@ocaml.doc "Provides detailed information about the result of your DataSync task execution.\n"]

type nonrec task_execution_list_entry = {
  task_mode : task_mode option;
      [@ocaml.doc
        "The task mode that you're using. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Choosing \
         a task mode for your data transfer}.\n"]
  status : task_execution_status option;
      [@ocaml.doc
        "The status of a task execution. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}Task \
         execution statuses}.\n"]
  task_execution_arn : task_execution_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a task execution.\n"]
}
[@@ocaml.doc
  "Represents a single entry in a list of DataSync task executions that's returned with the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTaskExecutions.html}ListTaskExecutions} \
   operation.\n"]

type nonrec task_execution_list = task_execution_list_entry list [@@ocaml.doc ""]

type nonrec task_execution_folders_listed_detail = {
  at_destination_for_delete : long option;
      [@ocaml.doc
        "The number of directories that DataSync finds at your destination location. This counter \
         is only applicable if you \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-file-object-handling}configure \
         your task} to delete data in the destination that isn't in the source.\n"]
  at_source : long option;
      [@ocaml.doc
        "The number of directories that DataSync finds at your source location.\n\n\
        \ {ul\n\
        \       {-  With a \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}manifest}, \
         DataSync lists only what's in your manifest (and not everything at your source location).\n\
        \           \n\
        \            }\n\
        \       {-  With an include \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}filter}, DataSync \
         lists only what matches the filter at your source location.\n\
        \           \n\
        \            }\n\
        \       {-  With an exclude filter, DataSync lists everything at your source location \
         before applying the filter.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The number of directories that DataSync finds at your locations.\n\n\
  \  Applies only to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced mode \
   tasks}.\n\
  \  \n\
  \   "]

type nonrec task_execution_folders_failed_detail = {
  delete : long option;
      [@ocaml.doc
        "The number of directories that DataSync fails to delete during your task execution.\n"]
  verify : long option;
      [@ocaml.doc
        "The number of directories that DataSync fails to verify during your task execution.\n"]
  transfer : long option;
      [@ocaml.doc
        "The number of directories that DataSync fails to transfer during your task execution.\n"]
  prepare : long option;
      [@ocaml.doc
        "The number of directories that DataSync fails to prepare during your task execution.\n"]
  list_ : long option;
      [@ocaml.doc
        "The number of directories that DataSync fails to list during your task execution.\n"]
}
[@@ocaml.doc
  "The number of directories that DataSync fails to list, prepare, transfer, verify, and delete \
   during your task execution.\n\n\
  \  Applies only to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced mode \
   tasks}.\n\
  \  \n\
  \   "]

type nonrec task_execution_files_listed_detail = {
  at_destination_for_delete : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync finds at your destination location. This \
         counter is only applicable if you \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-file-object-handling}configure \
         your task} to delete data in the destination that isn't in the source.\n"]
  at_source : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync finds at your source location.\n\n\
        \ {ul\n\
        \       {-  With a \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}manifest}, \
         DataSync lists only what's in your manifest (and not everything at your source location).\n\
        \           \n\
        \            }\n\
        \       {-  With an include \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}filter}, DataSync \
         lists only what matches the filter at your source location.\n\
        \           \n\
        \            }\n\
        \       {-  With an exclude filter, DataSync lists everything at your source location \
         before applying the filter.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The number of files or objects that DataSync finds at your locations.\n\n\
  \  Applies only to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced mode \
   tasks}.\n\
  \  \n\
  \   "]

type nonrec task_execution_files_failed_detail = {
  delete : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync fails to delete during your task execution.\n"]
  verify : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync fails to verify during your task execution.\n"]
  transfer : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync fails to transfer during your task execution.\n"]
  prepare : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync fails to prepare during your task execution.\n"]
}
[@@ocaml.doc
  "The number of files or objects that DataSync fails to prepare, transfer, verify, and delete \
   during your task execution.\n\n\
  \  Applies only to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced mode \
   tasks}.\n\
  \  \n\
  \   "]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_list_entry = {
  value : tag_value option; [@ocaml.doc "The value for an Amazon Web Services resource tag.\n"]
  key : tag_key; [@ocaml.doc "The key for an Amazon Web Services resource tag.\n"]
}
[@@ocaml.doc
  "A key-value pair representing a single tag that's been applied to an Amazon Web Services \
   resource.\n"]

type nonrec input_tag_list = tag_list_entry list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : input_tag_list; [@ocaml.doc "Specifies the tags that you want to apply to the resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the resource to apply the tag to.\n"]
}
[@@ocaml.doc "TagResourceRequest\n"]

type nonrec storage_virtual_machine_arn = string [@@ocaml.doc ""]

type nonrec start_task_execution_response = {
  task_execution_arn : task_execution_arn option;
      [@ocaml.doc "The ARN of the running task execution.\n"]
}
[@@ocaml.doc "StartTaskExecutionResponse\n"]

type nonrec start_task_execution_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies the tags that you want to apply to the Amazon Resource Name (ARN) representing \
         the task execution.\n\n\
        \  {i Tags} are key-value pairs that help you manage, filter, and search for your DataSync \
         resources.\n\
        \ "]
  task_report_config : task_report_config option;
      [@ocaml.doc
        "Specifies how you want to configure a task report, which provides detailed information \
         about your DataSync transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Monitoring \
         your DataSync transfers with task reports}.\n\n\
        \ When using this parameter, your caller identity (the role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ \n\
        \  To remove a task report configuration, specify this parameter as empty.\n\
        \  "]
  manifest_config : manifest_config option;
      [@ocaml.doc
        "Configures a manifest, which is a list of files or objects that you want DataSync to \
         transfer. For more information and configuration examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
         what DataSync transfers by using a manifest}.\n\n\
        \ When using this parameter, your caller identity (the role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ \n\
        \  To remove a manifest configuration, specify this parameter with an empty value.\n\
        \  "]
  excludes : filter_list option;
      [@ocaml.doc
        "Specifies a list of filter rules that determines which files to exclude from a task. The \
         list contains a single filter string that consists of the patterns to exclude. The \
         patterns are delimited by \"|\" (that is, a pipe), for example, [\"/folder1|/folder2\"]. \n"]
  includes : filter_list option;
      [@ocaml.doc
        "Specifies a list of filter rules that determines which files to include when running a \
         task. The pattern should contain a single filter string that consists of the patterns to \
         include. The patterns are delimited by \"|\" (that is, a pipe), for example, \
         [\"/folder1|/folder2\"]. \n"]
  override_options : options option; [@ocaml.doc ""]
  task_arn : task_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the task that you want to start.\n"]
}
[@@ocaml.doc "StartTaskExecutionRequest\n"]

type nonrec network_interface_arn = string [@@ocaml.doc ""]

type nonrec source_network_interface_arns = network_interface_arn list [@@ocaml.doc ""]

type nonrec report_result = {
  error_detail : string_ option; [@ocaml.doc "Provides details about issues creating a report.\n"]
  error_code : string_ option;
      [@ocaml.doc
        "Indicates the code associated with the error if DataSync can't create a complete report.\n"]
  status : phase_status option;
      [@ocaml.doc
        "Indicates whether DataSync is still working on your report, created a report, or can't \
         create a complete report.\n"]
}
[@@ocaml.doc
  "Indicates whether DataSync created a complete \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report} for \
   your transfer.\n"]

type nonrec endpoint = string [@@ocaml.doc ""]

type nonrec ec2_subnet_arn = string [@@ocaml.doc ""]

type nonrec pl_subnet_arn_list = ec2_subnet_arn list [@@ocaml.doc ""]

type nonrec ec2_security_group_arn = string [@@ocaml.doc ""]

type nonrec pl_security_group_arn_list = ec2_security_group_arn list [@@ocaml.doc ""]

type nonrec private_link_config = {
  security_group_arns : pl_security_group_arn_list option;
      [@ocaml.doc
        "Specifies the Amazon Resource Names (ARN) of the security group that provides DataSync \
         access to your VPC endpoint. You can only specify one ARN.\n"]
  subnet_arns : pl_subnet_arn_list option;
      [@ocaml.doc
        "Specifies the ARN of the subnet where your VPC endpoint is located. You can only specify \
         one ARN.\n"]
  private_link_endpoint : endpoint option;
      [@ocaml.doc
        "Specifies the VPC endpoint provided by \
         {{:https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-share-your-services.html}Amazon \
         Web Services PrivateLink} that your agent connects to.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "Specifies the ID of the VPC endpoint that your agent connects to.\n"]
}
[@@ocaml.doc
  "Specifies how your DataSync agent connects to Amazon Web Services using a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc}virtual \
   private cloud (VPC) service endpoint}. An agent that uses a VPC endpoint isn't accessible over \
   the public internet.\n"]

type nonrec agent_version = string [@@ocaml.doc ""]

type nonrec platform = {
  version : agent_version option; [@ocaml.doc "The version of the DataSync agent.\n"]
}
[@@ocaml.doc "The platform-related details about the DataSync agent, such as the version number.\n"]

type nonrec output_tag_list = tag_list_entry list [@@ocaml.doc ""]

type nonrec object_storage_bucket_name = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec location_uri = string [@@ocaml.doc ""]

type nonrec location_list_entry = {
  location_uri : location_uri option;
      [@ocaml.doc
        "Represents a list of URIs of a location. [LocationUri] returns an array that contains a \
         list of locations when the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html}ListLocations} \
         operation is called.\n\n\
        \ Format: [TYPE://GLOBAL_ID/SUBDIR].\n\
        \ \n\
        \  TYPE designates the type of location (for example, [nfs] or [s3]).\n\
        \  \n\
        \   GLOBAL_ID is the globally unique identifier of the resource that backs the location. \
         An example for EFS is [us-east-2.fs-abcd1234]. An example for Amazon S3 is the bucket \
         name, such as [myBucket]. An example for NFS is a valid IPv4 or IPv6 address or a \
         hostname that is compliant with DNS.\n\
        \   \n\
        \    SUBDIR is a valid file system path, delimited by forward slashes as is the *nix \
         convention. For NFS and Amazon EFS, it's the export path to mount the location. For \
         Amazon S3, it's the prefix path that you mount to and treat as the root of the location.\n\
        \    \n\
        \     \n\
        \     "]
  location_arn : location_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the location. For Network File System (NFS) or Amazon \
         EFS, the location is the export path. For Amazon S3, the location is the prefix path that \
         you want to mount and use as the root of the location.\n"]
}
[@@ocaml.doc
  "Represents a single entry in a list of locations. [LocationListEntry] returns an array that \
   contains a list of locations when the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html}ListLocations} \
   operation is called.\n"]

type nonrec location_list = location_list_entry list [@@ocaml.doc ""]

type nonrec location_filter_name =
  | CreationTime [@ocaml.doc ""]
  | LocationType [@ocaml.doc ""]
  | LocationUri [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec location_filter = {
  operator : operator;
      [@ocaml.doc
        "The operator that is used to compare filter values (for example, [Equals] or [Contains]).\n"]
  values : filter_values;
      [@ocaml.doc
        "The values that you want to filter for. For example, you might want to display only \
         Amazon S3 locations.\n"]
  name : location_filter_name;
      [@ocaml.doc
        "The name of the filter being used. Each API call supports a list of filters that are \
         available for it (for example, [LocationType] for [ListLocations]).\n"]
}
[@@ocaml.doc
  "Narrow down the list of resources returned by [ListLocations]. For example, to see all your \
   Amazon S3 locations, create a filter using [\"Name\":\n\
  \        \"LocationType\"], [\"Operator\": \"Equals\"], and [\"Values\":\n\
  \      \"S3\"].\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html}filtering \
   resources}.\n\
  \ "]

type nonrec location_filters = location_filter list [@@ocaml.doc ""]

type nonrec list_tasks_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin returning the next list of \
         tasks.\n"]
  tasks : task_list option; [@ocaml.doc "A list of all the tasks that are returned.\n"]
}
[@@ocaml.doc "ListTasksResponse\n"]

type nonrec list_tasks_request = {
  filters : task_filters option;
      [@ocaml.doc
        "You can use API filters to narrow down the list of resources returned by [ListTasks]. For \
         example, to retrieve all tasks on a specific source location, you can use [ListTasks] \
         with filter name [LocationId] and [Operator\n\
        \        Equals] with the ARN for the location.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin the next list of tasks.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of tasks to return.\n"]
}
[@@ocaml.doc "ListTasksRequest\n"]

type nonrec list_task_executions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The opaque string that indicates the position to begin the next list of results in the \
         response.\n"]
  task_executions : task_execution_list option; [@ocaml.doc "A list of the task's executions.\n"]
}
[@@ocaml.doc "ListTaskExecutionsResponse\n"]

type nonrec list_task_executions_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies an opaque string that indicates the position at which to begin the next list of \
         results in the response.\n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies how many results you want in the response.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the task that you want execution information \
         about.\n"]
}
[@@ocaml.doc "ListTaskExecutions\n"]

type nonrec list_tags_for_resource_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The opaque string that indicates the position to begin the next list of results in the \
         response.\n"]
  tags : output_tag_list option; [@ocaml.doc "An array of tags applied to the specified resource.\n"]
}
[@@ocaml.doc "ListTagsForResourceResponse\n"]

type nonrec list_tags_for_resource_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies an opaque string that indicates the position to begin the next list of results \
         in the response.\n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies how many results that you want in the response.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the resource that you want tag information on.\n"]
}
[@@ocaml.doc "ListTagsForResourceRequest\n"]

type nonrec list_locations_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin returning the next list of \
         locations.\n"]
  locations : location_list option; [@ocaml.doc "An array that contains a list of locations.\n"]
}
[@@ocaml.doc "ListLocationsResponse\n"]

type nonrec list_locations_request = {
  filters : location_filters option;
      [@ocaml.doc
        "You can use API filters to narrow down the list of resources returned by [ListLocations]. \
         For example, to retrieve all tasks on a specific source location, you can use \
         [ListLocations] with filter name [LocationType S3] and [Operator Equals].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin the next list of locations.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of locations to return.\n"]
}
[@@ocaml.doc "ListLocationsRequest\n"]

type nonrec agent_status = OFFLINE [@ocaml.doc ""] | ONLINE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec agent_list_entry = {
  platform : platform option;
      [@ocaml.doc "The platform-related details about the agent, such as the version number.\n"]
  status : agent_status option;
      [@ocaml.doc
        "The status of an agent.\n\n\
        \ {ul\n\
        \       {-  If the status is [ONLINE], the agent is configured properly and ready to use.\n\
        \           \n\
        \            }\n\
        \       {-  If the status is [OFFLINE], the agent has been out of contact with DataSync \
         for five minutes or longer. This can happen for a few reasons. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-agents.html#troubleshoot-agent-offline}What \
         do I do if my agent is offline?} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : tag_value option; [@ocaml.doc "The name of an agent.\n"]
  agent_arn : agent_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a DataSync agent.\n"]
}
[@@ocaml.doc
  "Represents a single entry in a list (or array) of DataSync agents when you call the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html}ListAgents} \
   operation.\n"]

type nonrec agent_list = agent_list_entry list [@@ocaml.doc ""]

type nonrec list_agents_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The opaque string that indicates the position to begin the next list of results in the \
         response.\n"]
  agents : agent_list option;
      [@ocaml.doc
        "A list of DataSync agents in your Amazon Web Services account in the Amazon Web Services \
         Region specified in the request. The list is ordered by the agents' Amazon Resource Names \
         (ARNs).\n"]
}
[@@ocaml.doc "ListAgentsResponse\n"]

type nonrec list_agents_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies an opaque string that indicates the position to begin the next list of results \
         in the response.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of DataSync agents to list in a response. By default, a \
         response shows a maximum of 100 agents.\n"]
}
[@@ocaml.doc "ListAgentsRequest\n"]

type nonrec item_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec fsx_open_zfs_subdirectory = string [@@ocaml.doc ""]

type nonrec fsx_lustre_subdirectory = string [@@ocaml.doc ""]

type nonrec fsx_filesystem_arn = string [@@ocaml.doc ""]

type nonrec describe_task_execution_response = {
  end_time : time option; [@ocaml.doc "The time that the transfer task ends.\n"]
  launch_time : time option;
      [@ocaml.doc
        "The time that the task execution actually begins. For non-queued tasks, [LaunchTime] and \
         [StartTime] are typically the same. For queued tasks, [LaunchTime] is typically later \
         than [StartTime] because previously queued tasks must finish running before newer tasks \
         can begin.\n"]
  folders_failed : task_execution_folders_failed_detail option;
      [@ocaml.doc
        "The number of directories that DataSync fails to list, prepare, transfer, verify, and \
         delete during your task execution.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  folders_listed : task_execution_folders_listed_detail option;
      [@ocaml.doc
        "The number of directories that DataSync finds at your locations.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  folders_deleted : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync actually deletes in your destination location. If \
         you don't configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html}delete \
         data in the destination that isn't in the source}, the value is always [0].\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  folders_verified : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync verifies during your transfer.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  folders_transferred : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync actually transfers over the network. This value \
         is updated periodically during your task execution when something is read from the source \
         and sent over the network.\n\n\
        \ If DataSync fails to transfer something, this value can be less than \
         [EstimatedFoldersToTransfer]. In some cases, this value can also be greater than \
         [EstimatedFoldersToTransfer]. \n\
        \ \n\
        \   Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \   \n\
        \    "]
  folders_prepared : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync will attempt to transfer after comparing your \
         source and destination locations.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \    This counter isn't applicable if you configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-transfer-mode}transfer \
         all data}. In that scenario, DataSync copies everything from the source to the \
         destination without comparing differences between the locations.\n\
        \    "]
  folders_skipped : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync skips during your transfer.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  estimated_folders_to_transfer : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync expects to transfer over the network. This value \
         is calculated as DataSync \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}prepares} \
         directories to transfer.\n\n\
        \ How this gets calculated depends primarily on your task\226\128\153s \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-TransferMode}transfer \
         mode} configuration:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [TranserMode] is set to [CHANGED] - The calculation is based on comparing \
         the content of the source and destination locations and determining the difference that \
         needs to be transferred. The difference can include:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Anything that's added or modified at the source location.\n\
        \                       \n\
        \                        }\n\
        \                   {-  Anything that's in both locations and modified at the destination \
         after an initial transfer (unless \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-OverwriteMode}OverwriteMode} \
         is set to [NEVER]).\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  If [TranserMode] is set to [ALL] - The calculation is based only on the items \
         that DataSync finds at the source location.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \    \n\
        \     "]
  estimated_folders_to_delete : item_count option;
      [@ocaml.doc
        "The number of directories that DataSync expects to delete in your destination location. \
         If you don't configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html}delete \
         data in the destination that isn't in the source}, the value is always [0].\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  files_failed : task_execution_files_failed_detail option;
      [@ocaml.doc
        "The number of files or objects that DataSync fails to prepare, transfer, verify, and \
         delete during your task execution.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  files_listed : task_execution_files_listed_detail option;
      [@ocaml.doc
        "The number of files or objects that DataSync finds at your locations.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \   "]
  files_prepared : long option;
      [@ocaml.doc
        "The number of files or objects that DataSync will attempt to transfer after comparing \
         your source and destination locations.\n\n\
        \  Applies only to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}.\n\
        \  \n\
        \    This counter isn't applicable if you configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-transfer-mode}transfer \
         all data}. In that scenario, DataSync copies everything from the source to the \
         destination without comparing differences between the locations.\n\
        \    "]
  task_mode : task_mode option;
      [@ocaml.doc
        "The task mode that you're using. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Choosing \
         a task mode for your data transfer}.\n"]
  estimated_files_to_delete : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync expects to delete in your \
         destination location. If you don't configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html}delete \
         data in the destination that isn't in the source}, the value is always [0].\n\n\
        \  For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-EstimatedFoldersToDelete}EstimatedFoldersToDelete}. \n\
        \  \n\
        \   "]
  report_result : report_result option;
      [@ocaml.doc
        "Indicates whether DataSync generated a complete \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}task report} \
         for your transfer.\n"]
  files_verified : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync verifies during your \
         transfer.\n\n\
        \  When you configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-data-verification-options.html}verify \
         only the data that's transferred}, DataSync doesn't verify directories in some situations \
         or files that fail to transfer.\n\
        \  \n\
        \   For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersVerified}FoldersVerified}. \n\
        \   \n\
        \    "]
  files_skipped : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync skips during your transfer.\n\n\
        \  For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersSkipped}FoldersSkipped}. \n\
        \  \n\
        \   "]
  files_deleted : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync actually deletes in your \
         destination location. If you don't configure your task to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html}delete \
         data in the destination that isn't in the source}, the value is always [0].\n\n\
        \  For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersDeleted}FoldersDeleted}. \n\
        \  \n\
        \   "]
  task_report_config : task_report_config option;
      [@ocaml.doc
        "The configuration of your task report, which provides detailed information about for your \
         DataSync transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Creating a \
         task report}.\n"]
  result_ : task_execution_result_detail option; [@ocaml.doc "The result of the task execution.\n"]
  bytes_compressed : long option;
      [@ocaml.doc
        "The number of physical bytes that DataSync transfers over the network after compression \
         (if compression is possible). This number is typically less than \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-BytesTransferred}BytesTransferred} \
         unless the data isn't compressible.\n"]
  bytes_transferred : long option;
      [@ocaml.doc
        "The number of bytes that DataSync sends to the network before compression (if compression \
         is possible). For the number of bytes transferred over the network, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-BytesCompressed}BytesCompressed}. \n"]
  bytes_written : long option;
      [@ocaml.doc
        "The number of logical bytes that DataSync actually writes to the destination location.\n"]
  files_transferred : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync actually transfers over the \
         network. This value is updated periodically during your task execution when something is \
         read from the source and sent over the network.\n\n\
        \ If DataSync fails to transfer something, this value can be less than \
         [EstimatedFilesToTransfer]. In some cases, this value can also be greater than \
         [EstimatedFilesToTransfer]. This element is implementation-specific for some location \
         types, so don't use it as an exact indication of what's transferring or to monitor your \
         task execution.\n\
        \ \n\
        \   For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersTransferred}FoldersTransferred}. \n\
        \   \n\
        \    "]
  estimated_bytes_to_transfer : long option;
      [@ocaml.doc
        "The number of logical bytes that DataSync expects to write to the destination location.\n"]
  estimated_files_to_transfer : long option;
      [@ocaml.doc
        "The number of files, objects, and directories that DataSync expects to transfer over the \
         network. This value is calculated while DataSync \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses}prepares} \
         the transfer.\n\n\
        \ How this gets calculated depends primarily on your task\226\128\153s \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-TransferMode}transfer \
         mode} configuration:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [TranserMode] is set to [CHANGED] - The calculation is based on comparing \
         the content of the source and destination locations and determining the difference that \
         needs to be transferred. The difference can include:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Anything that's added or modified at the source location.\n\
        \                       \n\
        \                        }\n\
        \                   {-  Anything that's in both locations and modified at the destination \
         after an initial transfer (unless \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-OverwriteMode}OverwriteMode} \
         is set to [NEVER]).\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b (Basic task mode only)} The number of items that DataSync \
         expects to delete (if \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-PreserveDeletedFiles}PreserveDeletedFiles} \
         is set to [REMOVE]).\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  If [TranserMode] is set to [ALL] - The calculation is based only on the items \
         that DataSync finds at the source location.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    For \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Enhanced \
         mode tasks}, this counter only includes files or objects. Directories are counted in \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-EstimatedFoldersToTransfer}EstimatedFoldersToTransfer}. \n\
        \    \n\
        \     "]
  start_time : time option;
      [@ocaml.doc
        "The time that DataSync sends the request to start the task execution. For non-queued \
         tasks, [LaunchTime] and [StartTime] are typically the same. For queued tasks, \
         [LaunchTime] is typically later than [StartTime] because previously queued tasks must \
         finish running before newer tasks can begin.\n"]
  manifest_config : manifest_config option;
      [@ocaml.doc
        "The configuration of the manifest that lists the files or objects to transfer. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
         what DataSync transfers by using a manifest}.\n"]
  includes : filter_list option;
      [@ocaml.doc
        "A list of filter rules that include specific data during your transfer. For more \
         information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Filtering data \
         transferred by DataSync}.\n"]
  excludes : filter_list option;
      [@ocaml.doc
        "A list of filter rules that exclude specific data during your transfer. For more \
         information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Filtering data \
         transferred by DataSync}.\n"]
  options : options option; [@ocaml.doc ""]
  status : task_execution_status option; [@ocaml.doc "The status of the task execution. \n"]
  task_execution_arn : task_execution_arn option;
      [@ocaml.doc
        "The ARN of the task execution that you wanted information about. [TaskExecutionArn] is \
         hierarchical and includes [TaskArn] for the task that was executed. \n\n\
        \ For example, a [TaskExecution] value with the ARN \
         [arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2/execution/exec-08ef1e88ec491019b] \
         executed the task with the ARN \
         [arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2]. \n\
        \ "]
}
[@@ocaml.doc "DescribeTaskExecutionResponse\n"]

type nonrec describe_task_execution_request = {
  task_execution_arn : task_execution_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the task execution that you want information \
         about.\n"]
}
[@@ocaml.doc "DescribeTaskExecutionRequest\n"]

type nonrec destination_network_interface_arns = network_interface_arn list [@@ocaml.doc ""]

type nonrec describe_task_response = {
  task_mode : task_mode option;
      [@ocaml.doc
        "The task mode that you're using. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html}Choosing \
         a task mode for your data transfer}.\n"]
  schedule_details : task_schedule_details option;
      [@ocaml.doc
        "The details about your \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}task \
         schedule}.\n"]
  task_report_config : task_report_config option;
      [@ocaml.doc
        "The configuration of your task report, which provides detailed information about your \
         DataSync transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Monitoring \
         your DataSync transfers with task reports}.\n"]
  manifest_config : manifest_config option;
      [@ocaml.doc
        "The configuration of the manifest that lists the files or objects that you want DataSync \
         to transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
         what DataSync transfers by using a manifest}.\n"]
  includes : filter_list option;
      [@ocaml.doc
        "The include filters that define the files, objects, and folders in your source location \
         that you want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  creation_time : time option; [@ocaml.doc "The time that the task was created.\n"]
  error_detail : string_ option;
      [@ocaml.doc
        "If there's an issue with your task, you can use the error details to help you \
         troubleshoot the problem. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html}Troubleshooting \
         issues with DataSync transfers}.\n"]
  error_code : string_ option;
      [@ocaml.doc
        "If there's an issue with your task, you can use the error code to help you troubleshoot \
         the problem. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html}Troubleshooting \
         issues with DataSync transfers}.\n"]
  schedule : task_schedule option;
      [@ocaml.doc
        "The schedule for when you want your task to run. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}Scheduling \
         your task}.\n"]
  excludes : filter_list option;
      [@ocaml.doc
        "The exclude filters that define the files, objects, and folders in your source location \
         that you don't want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  options : options option;
      [@ocaml.doc
        "The task's settings. For example, what file metadata gets preserved, how data integrity \
         gets verified at the end of your transfer, bandwidth limits, among other options.\n"]
  destination_network_interface_arns : destination_network_interface_arns option;
      [@ocaml.doc
        "The ARNs of the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces}network \
         interfaces} that DataSync created for your destination location.\n"]
  source_network_interface_arns : source_network_interface_arns option;
      [@ocaml.doc
        "The ARNs of the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces}network \
         interfaces} that DataSync created for your source location.\n"]
  cloud_watch_log_group_arn : log_group_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an Amazon CloudWatch log group for monitoring your \
         task.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/configure-logging.html}Monitoring \
         data transfers with CloudWatch Logs}.\n\
        \ "]
  destination_location_arn : location_arn option;
      [@ocaml.doc "The ARN of your transfer's destination location.\n"]
  source_location_arn : location_arn option;
      [@ocaml.doc "The ARN of your transfer's source location.\n"]
  current_task_execution_arn : task_execution_arn option;
      [@ocaml.doc "The ARN of the most recent task execution.\n"]
  name : tag_value option; [@ocaml.doc "The name of your task.\n"]
  status : task_status option;
      [@ocaml.doc
        "The status of your task. For information about what each status means, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-task-how-to.html#understand-task-creation-statuses}Task \
         statuses}.\n"]
  task_arn : task_arn option; [@ocaml.doc "The ARN of your task.\n"]
}
[@@ocaml.doc "DescribeTaskResponse\n"]

type nonrec describe_task_request = {
  task_arn : task_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the transfer task that you want information \
         about.\n"]
}
[@@ocaml.doc "DescribeTaskRequest\n"]

type nonrec describe_location_smb_response = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a customer-managed secret, such as a [Password] \
         or [KerberosKeytab] that DataSync uses to access a specific storage location, with a \
         customer-managed Identity and Access Management (IAM) role that provides access to the \
         secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a [Password] \
         or [KerberosKeytab] that DataSync uses to access a specific storage location, with a \
         customer-managed KMS key.\n"]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a [Password] \
         or [KerberosKeytab] that DataSync uses to access a specific storage location. DataSync \
         uses the default Amazon Web Services-managed KMS key to encrypt this secret in Secrets \
         Manager.\n"]
  authentication_type : smb_authentication_type option;
      [@ocaml.doc
        "The authentication protocol that DataSync uses to connect to your SMB file server.\n"]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "The Kerberos principal that has permission to access the files, folders, and file \
         metadata in your SMB file server.\n"]
  dns_ip_addresses : dns_ip_list option;
      [@ocaml.doc
        "The IPv4 or IPv6 addresses for the DNS servers that your SMB file server belongs to. This \
         element applies only if [AuthenticationType] is set to [KERBEROS].\n"]
  creation_time : time option; [@ocaml.doc "The time that the SMB location was created.\n"]
  mount_options : smb_mount_options option;
      [@ocaml.doc "The SMB protocol version that DataSync uses to access your SMB file server.\n"]
  domain : smb_domain option;
      [@ocaml.doc
        "The name of the Windows domain that the SMB file server belongs to. This element applies \
         only if [AuthenticationType] is set to [NTLM].\n"]
  user : smb_user option;
      [@ocaml.doc
        "The user that can mount and access the files, folders, and file metadata in your SMB file \
         server. This element applies only if [AuthenticationType] is set to [NTLM].\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc "The ARNs of the DataSync agents that can connect with your SMB file server.\n"]
  location_uri : location_uri option; [@ocaml.doc "The URI of the SMB location.\n"]
  location_arn : location_arn option; [@ocaml.doc "The ARN of the SMB location.\n"]
}
[@@ocaml.doc "DescribeLocationSmbResponse\n"]

type nonrec describe_location_smb_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the SMB location that you want information \
         about.\n"]
}
[@@ocaml.doc "DescribeLocationSmbRequest\n"]

type nonrec describe_location_s3_response = {
  creation_time : time option; [@ocaml.doc "The time that the Amazon S3 location was created.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "The ARNs of the DataSync agents deployed on your Outpost when using working with Amazon \
         S3 on Outposts.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent}Deploy \
         your DataSync agent on Outposts}.\n\
        \ "]
  s3_config : s3_config option; [@ocaml.doc ""]
  s3_storage_class : s3_storage_class option;
      [@ocaml.doc
        "When Amazon S3 is a destination location, this is the storage class that you chose for \
         your objects.\n\n\
        \ Some storage classes have behaviors that can affect your Amazon S3 storage costs. For \
         more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 transfers}.\n\
        \ "]
  location_uri : location_uri option;
      [@ocaml.doc "The URL of the Amazon S3 location that was described.\n"]
  location_arn : location_arn option; [@ocaml.doc "The ARN of the Amazon S3 location.\n"]
}
[@@ocaml.doc "DescribeLocationS3Response\n"]

type nonrec describe_location_s3_request = {
  location_arn : location_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the Amazon S3 location.\n"]
}
[@@ocaml.doc "DescribeLocationS3Request\n"]

type nonrec describe_location_object_storage_response = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a customer-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed Identity and Access Management (IAM) role that \
         provides access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location, and a customer-managed KMS key.\n"]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as an \
         authentication token or set of credentials that DataSync uses to access a specific \
         transfer location. DataSync uses the default Amazon Web Services-managed KMS key to \
         encrypt this secret in Secrets Manager.\n"]
  server_certificate : object_storage_certificate option;
      [@ocaml.doc
        "The certificate chain for DataSync to authenticate with your object storage system if the \
         system uses a private or self-signed certificate authority (CA).\n"]
  creation_time : time option; [@ocaml.doc "The time that the location was created.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "The ARNs of the DataSync agents that can connect with your object storage system.\n"]
  server_protocol : object_storage_server_protocol option;
      [@ocaml.doc "The protocol that your object storage system uses to communicate.\n"]
  server_port : object_storage_server_port option;
      [@ocaml.doc
        "The port that your object storage server accepts inbound network traffic on (for example, \
         port 443).\n"]
  access_key : object_storage_access_key option;
      [@ocaml.doc
        "The access key (for example, a user name) required to authenticate with the object \
         storage system.\n"]
  location_uri : location_uri option;
      [@ocaml.doc "The URI of the object storage system location.\n"]
  location_arn : location_arn option; [@ocaml.doc "The ARN of the object storage system location.\n"]
}
[@@ocaml.doc "DescribeLocationObjectStorageResponse\n"]

type nonrec describe_location_object_storage_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the object storage system location.\n"]
}
[@@ocaml.doc "DescribeLocationObjectStorageRequest\n"]

type nonrec describe_location_nfs_response = {
  creation_time : time option; [@ocaml.doc "The time when the NFS location was created.\n"]
  mount_options : nfs_mount_options option;
      [@ocaml.doc "The mount options that DataSync uses to mount your NFS file server.\n"]
  on_prem_config : on_prem_config option; [@ocaml.doc ""]
  location_uri : location_uri option; [@ocaml.doc "The URI of the NFS location.\n"]
  location_arn : location_arn option; [@ocaml.doc "The ARN of the NFS location.\n"]
}
[@@ocaml.doc "DescribeLocationNfsResponse\n"]

type nonrec describe_location_nfs_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the NFS location that you want information \
         about.\n"]
}
[@@ocaml.doc "DescribeLocationNfsRequest\n"]

type nonrec describe_location_hdfs_response = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a customer-managed secret, such as a \
         [KerberosKeytab] that DataSync uses to access a specific storage location, with a \
         customer-managed Identity and Access Management (IAM) role that provides access to the \
         secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a \
         [KerberosKeytab] that DataSync uses to access a specific storage location, with a \
         customer-managed KMS key.\n"]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a \
         [KerberosKeytab] that DataSync uses to access a specific storage location. DataSync uses \
         the default Amazon Web Services-managed KMS key to encrypt this secret in Secrets Manager.\n"]
  creation_time : time option; [@ocaml.doc "The time that the HDFS location was created.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc "The ARNs of the DataSync agents that can connect with your HDFS cluster.\n"]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "The Kerberos principal with access to the files and folders on the HDFS cluster. This \
         parameter is used if the [AuthenticationType] is defined as [KERBEROS].\n"]
  simple_user : hdfs_user option;
      [@ocaml.doc
        "The user name to identify the client on the host operating system. This parameter is used \
         if the [AuthenticationType] is defined as [SIMPLE].\n"]
  authentication_type : hdfs_authentication_type option;
      [@ocaml.doc "The type of authentication used to determine the identity of the user. \n"]
  qop_configuration : qop_configuration option;
      [@ocaml.doc
        "The Quality of Protection (QOP) configuration, which specifies the Remote Procedure Call \
         (RPC) and data transfer protection settings configured on the HDFS cluster. \n"]
  kms_key_provider_uri : kms_key_provider_uri option;
      [@ocaml.doc " The URI of the HDFS cluster's Key Management Server (KMS). \n"]
  replication_factor : hdfs_replication_factor option;
      [@ocaml.doc
        "The number of DataNodes to replicate the data to when writing to the HDFS cluster. \n"]
  block_size : hdfs_block_size option;
      [@ocaml.doc "The size of the data blocks to write into the HDFS cluster. \n"]
  name_nodes : hdfs_name_node_list option;
      [@ocaml.doc "The NameNode that manages the HDFS namespace. \n"]
  location_uri : location_uri option; [@ocaml.doc "The URI of the HDFS location.\n"]
  location_arn : location_arn option; [@ocaml.doc "The ARN of the HDFS location.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_hdfs_request = {
  location_arn : location_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the HDFS location.\n"]
}
[@@ocaml.doc ""]

type nonrec ec2_security_group_arn_list = ec2_security_group_arn list [@@ocaml.doc ""]

type nonrec describe_location_fsx_windows_response = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a customer-managed secret, such as a [Password] \
         that DataSync uses to access a specific storage location, with a customer-managed \
         Identity and Access Management (IAM) role that provides access to the secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a [Password] \
         that DataSync uses to access a specific storage location, with a customer-managed KMS key.\n"]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as a [Password] \
         that DataSync uses to access a specific storage location. DataSync uses the default \
         Amazon Web Services-managed KMS key to encrypt this secret in Secrets Manager.\n"]
  domain : smb_domain option;
      [@ocaml.doc
        "The name of the Microsoft Active Directory domain that the FSx for Windows File Server \
         file system belongs to.\n"]
  user : smb_user option;
      [@ocaml.doc
        "The user with the permissions to mount and access the FSx for Windows File Server file \
         system.\n"]
  creation_time : time option;
      [@ocaml.doc "The time that the FSx for Windows File Server location was created.\n"]
  security_group_arns : ec2_security_group_arn_list option;
      [@ocaml.doc
        "The ARNs of the Amazon EC2 security groups that provide access to your file system's \
         preferred subnet.\n\n\
        \ For information about configuring security groups for file system access, see the \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/limit-access-security-groups.html} \
         {i Amazon FSx for Windows File Server User Guide} }.\n\
        \ "]
  location_uri : location_uri option;
      [@ocaml.doc
        "The uniform resource identifier (URI) of the FSx for Windows File Server location.\n"]
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the FSx for Windows File Server location.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_windows_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the FSx for Windows File Server location.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_open_zfs_response = {
  creation_time : time option;
      [@ocaml.doc "The time that the FSx for OpenZFS location was created.\n"]
  protocol : fsx_protocol option;
      [@ocaml.doc "The type of protocol that DataSync uses to access your file system.\n"]
  security_group_arns : ec2_security_group_arn_list option;
      [@ocaml.doc
        "The ARNs of the security groups that are configured for the FSx for OpenZFS file system.\n"]
  location_uri : location_uri option;
      [@ocaml.doc
        "The uniform resource identifier (URI) of the FSx for OpenZFS location that was described.\n\n\
        \ Example: [fsxz://us-west-2.fs-1234567890abcdef02/fsx/folderA/folder] \n\
        \ "]
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the FSx for OpenZFS location that was described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_open_zfs_request = {
  location_arn : location_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the FSx for OpenZFS location to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_ontap_response = {
  fsx_filesystem_arn : fsx_filesystem_arn option;
      [@ocaml.doc "The ARN of the FSx for ONTAP file system.\n"]
  storage_virtual_machine_arn : storage_virtual_machine_arn option;
      [@ocaml.doc
        "The ARN of the storage virtual machine (SVM) on your FSx for ONTAP file system where \
         you're copying data to or from.\n"]
  security_group_arns : ec2_security_group_arn_list option;
      [@ocaml.doc
        "The security groups that DataSync uses to access your FSx for ONTAP file system.\n"]
  protocol : fsx_protocol option; [@ocaml.doc ""]
  location_uri : location_uri option;
      [@ocaml.doc
        "The uniform resource identifier (URI) of the FSx for ONTAP file system location.\n"]
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the FSx for ONTAP file system location.\n"]
  creation_time : time option; [@ocaml.doc "The time that the location was created.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_ontap_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the FSx for ONTAP file system location that \
         you want information about.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_lustre_response = {
  creation_time : time option;
      [@ocaml.doc "The time that the FSx for Lustre location was created.\n"]
  security_group_arns : ec2_security_group_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the security groups that are configured for the FSx \
         for Lustre file system.\n"]
  location_uri : location_uri option;
      [@ocaml.doc "The URI of the FSx for Lustre location that was described.\n"]
  location_arn : location_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the FSx for Lustre location that was described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_fsx_lustre_request = {
  location_arn : location_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the FSx for Lustre location to describe. \n"]
}
[@@ocaml.doc ""]

type nonrec ec2_config = {
  security_group_arns : ec2_security_group_arn_list;
      [@ocaml.doc
        "Specifies the Amazon Resource Names (ARNs) of the security groups associated with an \
         Amazon EFS file system's mount target.\n"]
  subnet_arn : ec2_subnet_arn;
      [@ocaml.doc
        "Specifies the ARN of a subnet where DataSync creates the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces}network \
         interfaces} for managing traffic during your transfer.\n\n\
        \ The subnet must be located:\n\
        \ \n\
        \  {ul\n\
        \        {-  In the same virtual private cloud (VPC) as the Amazon EFS file system.\n\
        \            \n\
        \             }\n\
        \        {-  In the same Availability Zone as at least one mount target for the Amazon EFS \
         file system.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    You don't need to specify a subnet that includes a file system mount target.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The subnet and security groups that DataSync uses to connect to one of your Amazon EFS file \
   system's {{:https://docs.aws.amazon.com/efs/latest/ug/accessing-fs.html}mount targets}.\n"]

type nonrec efs_access_point_arn = string [@@ocaml.doc ""]

type nonrec describe_location_efs_response = {
  in_transit_encryption : efs_in_transit_encryption option;
      [@ocaml.doc
        "Indicates whether DataSync uses Transport Layer Security (TLS) encryption when \
         transferring data to or from the Amazon EFS file system.\n"]
  file_system_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Identity and Access Management (IAM) role that allows DataSync to access your Amazon \
         EFS file system.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role}Creating \
         a DataSync IAM role for file system access}.\n\
        \ "]
  access_point_arn : efs_access_point_arn option;
      [@ocaml.doc
        "The ARN of the access point that DataSync uses to access the Amazon EFS file system.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam}Accessing \
         restricted file systems}.\n\
        \ "]
  creation_time : time option; [@ocaml.doc "The time that the location was created.\n"]
  ec2_config : ec2_config option; [@ocaml.doc ""]
  location_uri : location_uri option;
      [@ocaml.doc "The URL of the Amazon EFS file system location.\n"]
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the Amazon EFS file system location.\n"]
}
[@@ocaml.doc "DescribeLocationEfsResponse\n"]

type nonrec describe_location_efs_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon EFS file system location that you want \
         information about.\n"]
}
[@@ocaml.doc "DescribeLocationEfsRequest\n"]

type nonrec describe_location_azure_blob_response = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a customer-managed secret, such as an \
         authentication token that DataSync uses to access a specific storage location, with a \
         customer-managed Identity and Access Management (IAM) role that provides access to the \
         secret.\n"]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as an \
         authentication token that DataSync uses to access a specific storage location, with a \
         customer-managed KMS key.\n"]
  managed_secret_config : managed_secret_config option;
      [@ocaml.doc
        "Describes configuration information for a DataSync-managed secret, such as an \
         authentication token that DataSync uses to access a specific storage location. DataSync \
         uses the default Amazon Web Services-managed KMS key to encrypt this secret in Secrets \
         Manager.\n"]
  creation_time : time option;
      [@ocaml.doc "The time that your Azure Blob Storage transfer location was created.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "The ARNs of the DataSync agents that can connect with your Azure Blob Storage container.\n"]
  access_tier : azure_access_tier option;
      [@ocaml.doc
        "The access tier that you want your objects or files transferred into. This only applies \
         when using the location as a transfer destination. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers}Access \
         tiers}.\n"]
  blob_type : azure_blob_type option;
      [@ocaml.doc
        "The type of blob that you want your objects or files to be when transferring them into \
         Azure Blob Storage. Currently, DataSync only supports moving data into Azure Blob Storage \
         as block blobs. For more information on blob types, see the \
         {{:https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs}Azure \
         Blob Storage documentation}.\n"]
  authentication_type : azure_blob_authentication_type option;
      [@ocaml.doc
        "The authentication method DataSync uses to access your Azure Blob Storage. DataSync can \
         access blob storage using a shared access signature (SAS).\n"]
  location_uri : location_uri option;
      [@ocaml.doc "The URL of the Azure Blob Storage container involved in your transfer.\n"]
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of your Azure Blob Storage transfer location.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_location_azure_blob_request = {
  location_arn : location_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of your Azure Blob Storage transfer location.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_type =
  | FIPS_PRIVATE_LINK [@ocaml.doc ""]
  | FIPS [@ocaml.doc ""]
  | PRIVATE_LINK [@ocaml.doc ""]
  | PUBLIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_agent_response = {
  platform : platform option;
      [@ocaml.doc "The platform-related details about the agent, such as the version number.\n"]
  private_link_config : private_link_config option;
      [@ocaml.doc
        "The network configuration that the agent uses when connecting to a \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc}VPC \
         service endpoint}.\n"]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "The type of \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html}service \
         endpoint} that your agent is connected to.\n"]
  creation_time : time option;
      [@ocaml.doc
        "The time that the agent was \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html}activated}.\n"]
  last_connection_time : time option;
      [@ocaml.doc "The last time that the agent was communicating with the DataSync service.\n"]
  status : agent_status option;
      [@ocaml.doc
        "The status of the agent.\n\n\
        \ {ul\n\
        \       {-  If the status is [ONLINE], the agent is configured properly and ready to use.\n\
        \           \n\
        \            }\n\
        \       {-  If the status is [OFFLINE], the agent has been out of contact with DataSync \
         for five minutes or longer. This can happen for a few reasons. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-agents.html#troubleshoot-agent-offline}What \
         do I do if my agent is offline?} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : tag_value option; [@ocaml.doc "The name of the agent.\n"]
  agent_arn : agent_arn option; [@ocaml.doc "The ARN of the agent.\n"]
}
[@@ocaml.doc "DescribeAgentResponse\n"]

type nonrec describe_agent_request = {
  agent_arn : agent_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the DataSync agent that you want information \
         about.\n"]
}
[@@ocaml.doc "DescribeAgent\n"]

type nonrec delete_task_response = unit [@@ocaml.doc ""]

type nonrec delete_task_request = {
  task_arn : task_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the task that you want to delete.\n"]
}
[@@ocaml.doc "DeleteTask\n"]

type nonrec delete_location_response = unit [@@ocaml.doc ""]

type nonrec delete_location_request = {
  location_arn : location_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the location to delete.\n"]
}
[@@ocaml.doc "DeleteLocation\n"]

type nonrec delete_agent_response = unit [@@ocaml.doc ""]

type nonrec delete_agent_request = {
  agent_arn : agent_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the agent to delete. Use the [ListAgents] operation to \
         return a list of agents for your account and Amazon Web Services Region.\n"]
}
[@@ocaml.doc "DeleteAgentRequest\n"]

type nonrec create_task_response = {
  task_arn : task_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
}
[@@ocaml.doc "CreateTaskResponse\n"]

type nonrec create_task_request = {
  task_mode : task_mode option;
      [@ocaml.doc
        "Specifies one of the following task modes for your data transfer:\n\n\
        \ {ul\n\
        \       {-   [ENHANCED] - Transfer virtually unlimited numbers of objects with higher \
         performance than Basic mode. Enhanced mode tasks optimize the data transfer process by \
         listing, preparing, transferring, and verifying data in parallel. Enhanced mode is \
         currently available for transfers between Amazon S3 locations, transfers between Azure \
         Blob and Amazon S3 without an agent, and transfers between other clouds and Amazon S3 \
         without an agent.\n\
        \           \n\
        \             To create an Enhanced mode task, the IAM role that you use to call the \
         [CreateTask] operation must have the [iam:CreateServiceLinkedRole] permission.\n\
        \             \n\
        \               }\n\
        \       {-   [BASIC] (default) - Transfer files or objects between Amazon Web Services \
         storage and all other supported DataSync locations. Basic mode tasks are subject to \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/datasync-limits.html}quotas} on \
         the number of files, objects, and directories in a dataset. Basic mode sequentially \
         prepares, transfers, and verifies data, making it slower than Enhanced mode for most \
         workloads.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html#task-mode-differences}Understanding \
         task mode differences}.\n\
        \   "]
  task_report_config : task_report_config option;
      [@ocaml.doc
        "Specifies how you want to configure a task report, which provides detailed information \
         about your DataSync transfer. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html}Monitoring \
         your DataSync transfers with task reports}.\n\n\
        \ When using this parameter, your caller identity (the role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ "]
  manifest_config : manifest_config option;
      [@ocaml.doc
        "Configures a manifest, which is a list of files or objects that you want DataSync to \
         transfer. For more information and configuration examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html}Specifying \
         what DataSync transfers by using a manifest}.\n\n\
        \ When using this parameter, your caller identity (the role that you're using DataSync \
         with) must have the [iam:PassRole] permission. The \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess}AWSDataSyncFullAccess} \
         policy includes this permission.\n\
        \ "]
  includes : filter_list option;
      [@ocaml.doc
        "Specifies include filters that define the files, objects, and folders in your source \
         location that you want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies the tags that you want to apply to your task.\n\n\
        \  {i Tags} are key-value pairs that help you manage, filter, and search for your DataSync \
         resources.\n\
        \ "]
  schedule : task_schedule option;
      [@ocaml.doc
        "Specifies a schedule for when you want your task to run. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html}Scheduling \
         your task}.\n"]
  excludes : filter_list option;
      [@ocaml.doc
        "Specifies exclude filters that define the files, objects, and folders in your source \
         location that you don't want DataSync to transfer. For more information and examples, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html}Specifying what \
         DataSync transfers by using filters}.\n"]
  options : options option;
      [@ocaml.doc
        "Specifies your task's settings, such as preserving file metadata, verifying data \
         integrity, among other options.\n"]
  name : tag_value option; [@ocaml.doc "Specifies the name of your task.\n"]
  cloud_watch_log_group_arn : log_group_arn option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of an Amazon CloudWatch log group for monitoring \
         your task.\n\n\
        \ For Enhanced mode tasks, you don't need to specify anything. DataSync automatically \
         sends logs to a CloudWatch log group named [/aws/datasync].\n\
        \ "]
  destination_location_arn : location_arn;
      [@ocaml.doc "Specifies the ARN of your transfer's destination location. \n"]
  source_location_arn : location_arn;
      [@ocaml.doc "Specifies the ARN of your transfer's source location.\n"]
}
[@@ocaml.doc "CreateTaskRequest\n"]

type nonrec create_location_smb_response = {
  location_arn : location_arn option; [@ocaml.doc "The ARN of the SMB location that you created.\n"]
}
[@@ocaml.doc "CreateLocationSmbResponse\n"]

type nonrec create_location_smb_request = {
  kerberos_krb5_conf : kerberos_krb5_conf_file option;
      [@ocaml.doc
        "Specifies a Kerberos configuration file ([krb5.conf]) that defines your Kerberos realm \
         configuration.\n\n\
        \ The file must be base64 encoded. If you're using the CLI, the encoding is done for you.\n\
        \ "]
  kerberos_keytab : kerberos_keytab_file option;
      [@ocaml.doc
        "Specifies your Kerberos key table (keytab) file, which includes mappings between your \
         Kerberos principal and encryption keys.\n\n\
        \ To avoid task execution errors, make sure that the Kerberos principal that you use to \
         create the keytab file matches exactly what you specify for [KerberosPrincipal]. \n\
        \ "]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "Specifies a Kerberos principal, which is an identity in your Kerberos realm that has \
         permission to access the files, folders, and file metadata in your SMB file server.\n\n\
        \ A Kerberos principal might look like [HOST/kerberosuser@MYDOMAIN.ORG].\n\
        \ \n\
        \  Principal names are case sensitive. Your DataSync task execution will fail if the \
         principal that you specify for this parameter doesn\226\128\153t exactly match the \
         principal that you use to create the keytab file.\n\
        \  "]
  dns_ip_addresses : dns_ip_list option;
      [@ocaml.doc
        "Specifies the IPv4 or IPv6 addresses for the DNS servers that your SMB file server \
         belongs to. This parameter applies only if [AuthenticationType] is set to [KERBEROS].\n\n\
        \ If you have multiple domains in your environment, configuring this parameter makes sure \
         that DataSync connects to the right SMB file server.\n\
        \ "]
  authentication_type : smb_authentication_type option;
      [@ocaml.doc
        "Specifies the authentication protocol that DataSync uses to connect to your SMB file \
         server. DataSync supports [NTLM] (default) and [KERBEROS] authentication.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your location.\n"]
  mount_options : smb_mount_options option;
      [@ocaml.doc
        "Specifies the version of the SMB protocol that DataSync uses to access your SMB file \
         server.\n"]
  agent_arns : agent_arn_list;
      [@ocaml.doc
        "Specifies the DataSync agent (or agents) that can connect to your SMB file server. You \
         specify an agent by using its Amazon Resource Name (ARN).\n"]
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the SMB storage location credentials is stored in Secrets Manager as plain text (for \
         [Password]) or binary (for [KerberosKeytab]). This configuration includes the secret ARN, \
         and the ARN for an IAM role that provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [SasConfiguration]) or [CustomSecretConfig] \
         (without [SasConfiguration]) to provide credentials for a [CreateLocationSmbRequest] \
         request. Do not provide both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, either a [Password] or \
         [KerberosKeytab] (for [NTLM] (default) and [KERBEROS] authentication types, respectively) \
         that DataSync uses to access a specific SMB storage location, with a customer-managed KMS \
         key.\n\n\
        \ When you include this parameter as part of a [CreateLocationSmbRequest] request, you \
         provide only the KMS key ARN. DataSync uses this KMS key together with either the \
         [Password] or [KerberosKeytab] you specify to create a DataSync-managed secret to store \
         the location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with either [Password] or [KerberosKeytab]) or \
         [CustomSecretConfig] (without any [Password] and [KerberosKeytab]) to provide credentials \
         for a [CreateLocationSmbRequest] request. Do not provide both [CmkSecretConfig] and \
         [CustomSecretConfig] parameters for the same request.\n\
        \    \n\
        \     "]
  password : smb_password option;
      [@ocaml.doc
        "Specifies the password of the user who can mount your SMB file server and has permission \
         to access the files and folders involved in your transfer. This parameter applies only if \
         [AuthenticationType] is set to [NTLM].\n"]
  domain : smb_domain option;
      [@ocaml.doc
        "Specifies the Windows domain name that your SMB file server belongs to. This parameter \
         applies only if [AuthenticationType] is set to [NTLM].\n\n\
        \ If you have multiple domains in your environment, configuring this parameter makes sure \
         that DataSync connects to the right file server.\n\
        \ "]
  user : smb_user option;
      [@ocaml.doc
        "Specifies the user that can mount and access the files, folders, and file metadata in \
         your SMB file server. This parameter applies only if [AuthenticationType] is set to \
         [NTLM].\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
  server_hostname : server_hostname;
      [@ocaml.doc
        "Specifies the domain name or IP address (IPv4 or IPv6) of the SMB file server that your \
         DataSync agent connects to.\n\n\
        \  If you're using Kerberos authentication, you must specify a domain name.\n\
        \  \n\
        \   "]
  subdirectory : smb_subdirectory;
      [@ocaml.doc
        "Specifies the name of the share exported by your SMB file server where DataSync will read \
         or write data. You can include a subdirectory in the share path (for example, \
         [/path/to/subdirectory]). Make sure that other SMB clients in your network can also mount \
         this path.\n\n\
        \ To copy all data in the subdirectory, DataSync must be able to mount the SMB share and \
         access all of its data. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
         DataSync access to SMB file servers}.\n\
        \ "]
}
[@@ocaml.doc "CreateLocationSmbRequest\n"]

type nonrec create_location_s3_response = {
  location_arn : location_arn option; [@ocaml.doc "The ARN of the S3 location that you created.\n"]
}
[@@ocaml.doc "CreateLocationS3Response\n"]

type nonrec create_location_s3_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your transfer location.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "(Amazon S3 on Outposts only) Specifies the Amazon Resource Name (ARN) of the DataSync \
         agent on your Outpost.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent}Deploy \
         your DataSync agent on Outposts}.\n\
        \ "]
  s3_config : s3_config; [@ocaml.doc ""]
  s3_storage_class : s3_storage_class option;
      [@ocaml.doc
        "Specifies the storage class that you want your objects to use when Amazon S3 is a \
         transfer destination.\n\n\
        \ For buckets in Amazon Web Services Regions, the storage class defaults to [STANDARD]. \
         For buckets on Outposts, the storage class defaults to [OUTPOSTS].\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
         class considerations with Amazon S3 transfers}.\n\
        \  "]
  s3_bucket_arn : s3_bucket_arn;
      [@ocaml.doc
        "Specifies the ARN of the S3 bucket that you want to use as a location. (When creating \
         your DataSync task later, you specify whether this location is a transfer source or \
         destination.) \n\n\
        \ If your S3 bucket is located on an Outposts resource, you must specify an Amazon S3 \
         access point. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html}Managing data \
         access with Amazon S3 access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  subdirectory : s3_subdirectory option;
      [@ocaml.doc
        "Specifies a prefix in the S3 bucket that DataSync reads from or writes to (depending on \
         whether the bucket is a source or destination location).\n\n\
        \  DataSync can't transfer objects with a prefix that begins with a slash ([/]) or \
         includes [//], [/./], or [/../] patterns. For example:\n\
        \  \n\
        \   {ul\n\
        \         {-   [/photos] \n\
        \             \n\
        \              }\n\
        \         {-   [photos//2006/January] \n\
        \             \n\
        \              }\n\
        \         {-   [photos/./2006/February] \n\
        \             \n\
        \              }\n\
        \         {-   [photos/../2006/March] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
}
[@@ocaml.doc "CreateLocationS3Request\n"]

type nonrec create_location_object_storage_response = {
  location_arn : location_arn option;
      [@ocaml.doc "Specifies the ARN of the object storage system location that you create.\n"]
}
[@@ocaml.doc "CreateLocationObjectStorageResponse\n"]

type nonrec create_location_object_storage_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the secret key for a specific object storage location is stored in plain text, in Secrets \
         Manager. This configuration includes the secret ARN, and the ARN for an IAM role that \
         provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [SecretKey]) or [CustomSecretConfig] \
         (without [SecretKey]) to provide credentials for a [CreateLocationObjectStorage] request. \
         Do not provide both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, which includes the \
         [SecretKey] that DataSync uses to access a specific object storage location, with a \
         customer-managed KMS key.\n\n\
        \ When you include this parameter as part of a [CreateLocationObjectStorage] request, you \
         provide only the KMS key ARN. DataSync uses this KMS key together with the value you \
         specify for the [SecretKey] parameter to create a DataSync-managed secret to store the \
         location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with [SecretKey]) or [CustomSecretConfig] \
         (without [SecretKey]) to provide credentials for a [CreateLocationObjectStorage] request. \
         Do not provide both parameters for the same request.\n\
        \    \n\
        \     "]
  server_certificate : object_storage_certificate option;
      [@ocaml.doc
        "Specifies a certificate chain for DataSync to authenticate with your object storage \
         system if the system uses a private or self-signed certificate authority (CA). You must \
         specify a single [.pem] file with a full certificate chain (for example, \
         [file:///home/user/.ssh/object_storage_certificates.pem]).\n\n\
        \ The certificate chain might include:\n\
        \ \n\
        \  {ul\n\
        \        {-  The object storage system's certificate\n\
        \            \n\
        \             }\n\
        \        {-  All intermediate certificates (if there are any)\n\
        \            \n\
        \             }\n\
        \        {-  The root certificate of the signing CA\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can concatenate your certificates into a [.pem] file (which can be up to 32768 \
         bytes before base64 encoding). The following example [cat] command creates an \
         [object_storage_certificates.pem] file that includes three certificates:\n\
        \   \n\
        \     [cat object_server_certificate.pem intermediate_certificate.pem\n\
        \        ca_root_certificate.pem > object_storage_certificates.pem] \n\
        \    \n\
        \     To use this parameter, configure [ServerProtocol] to [HTTPS].\n\
        \     "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies the key-value pair that represents a tag that you want to add to the resource. \
         Tags can help you manage, filter, and search for your resources. We recommend creating a \
         name tag for your location.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "(Optional) Specifies the Amazon Resource Names (ARNs) of the DataSync agents that can \
         connect with your object storage system. If you are setting up an agentless cross-cloud \
         transfer, you do not need to specify a value for this parameter.\n\n\
        \  Make sure you configure this parameter correctly when you first create your storage \
         location. You cannot add or remove agents from a storage location after you create it.\n\
        \  \n\
        \   "]
  secret_key : object_storage_secret_key option;
      [@ocaml.doc
        "Specifies the secret key (for example, a password) if credentials are required to \
         authenticate with the object storage server.\n\n\
        \  If you provide a secret using [SecretKey], but do not provide secret configuration \
         details using [CmkSecretConfig] or [CustomSecretConfig], then DataSync stores the token \
         using your Amazon Web Services account's Secrets Manager secret.\n\
        \  \n\
        \   "]
  access_key : object_storage_access_key option;
      [@ocaml.doc
        "Specifies the access key (for example, a user name) if credentials are required to \
         authenticate with the object storage server.\n"]
  bucket_name : object_storage_bucket_name;
      [@ocaml.doc "Specifies the name of the object storage bucket involved in the transfer.\n"]
  subdirectory : s3_subdirectory option;
      [@ocaml.doc
        "Specifies the object prefix for your object storage server. If this is a source location, \
         DataSync only copies objects with this prefix. If this is a destination location, \
         DataSync writes all objects with this prefix. \n"]
  server_protocol : object_storage_server_protocol option;
      [@ocaml.doc
        "Specifies the protocol that your object storage server uses to communicate. If not \
         specified, the default value is [HTTPS].\n"]
  server_port : object_storage_server_port option;
      [@ocaml.doc
        "Specifies the port that your object storage server accepts inbound network traffic on \
         (for example, port 443).\n"]
  server_hostname : server_hostname;
      [@ocaml.doc
        "Specifies the domain name or IP address (IPv4 or IPv6) of the object storage server that \
         your DataSync agent connects to.\n"]
}
[@@ocaml.doc "CreateLocationObjectStorageRequest\n"]

type nonrec create_location_nfs_response = {
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the transfer location that you created for your NFS file server.\n"]
}
[@@ocaml.doc "CreateLocationNfsResponse\n"]

type nonrec create_location_nfs_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your location.\n"]
  mount_options : nfs_mount_options option;
      [@ocaml.doc "Specifies the options that DataSync can use to mount your NFS file server.\n"]
  on_prem_config : on_prem_config;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the DataSync agent that can connect to your \
         NFS file server.\n\n\
        \ You can specify more than one agent. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#multiple-agents}Using \
         multiple DataSync agents}.\n\
        \ "]
  server_hostname : server_hostname;
      [@ocaml.doc
        "Specifies the DNS name or IP address (IPv4 or IPv6) of the NFS file server that your \
         DataSync agent connects to.\n"]
  subdirectory : nfs_subdirectory;
      [@ocaml.doc
        "Specifies the export path in your NFS file server that you want DataSync to mount.\n\n\
        \ This path (or a subdirectory of the path) is where DataSync transfers data to or from. \
         For information on configuring an export for DataSync, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs}Accessing \
         NFS file servers}.\n\
        \ "]
}
[@@ocaml.doc "CreateLocationNfsRequest\n"]

type nonrec create_location_hdfs_response = {
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the source HDFS cluster location that you create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_hdfs_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the Kerberos keytab for the HDFS storage location is stored in binary, in Secrets \
         Manager. This configuration includes the secret ARN, and the ARN for an IAM role that \
         provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [KerberosKeytab]) or [CustomSecretConfig] \
         (without [KerberosKeytab]) to provide credentials for a [CreateLocationHdfs] request. Do \
         not provide both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, which includes the \
         Kerberos keytab that DataSync uses to access a specific Hadoop Distributed File System \
         (HDFS) storage location, with a customer-managed KMS key.\n\n\
        \ When you include this parameter as part of a [CreateLocationHdfs] request, you provide \
         only the KMS key ARN. DataSync uses this KMS key together with the [KerberosKeytab] you \
         specify for to create a DataSync-managed secret to store the location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with [KerberosKeytab]) or [CustomSecretConfig] \
         (without [KerberosKeytab]) to provide credentials for a [CreateLocationHdfs] request. Do \
         not provide both parameters for the same request.\n\
        \    \n\
        \     "]
  tags : input_tag_list option;
      [@ocaml.doc
        "The key-value pair that represents the tag that you want to add to the location. The \
         value can be an empty string. We recommend using tags to name your resources. \n"]
  agent_arns : agent_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the DataSync agents that can connect to your HDFS \
         cluster.\n"]
  kerberos_krb5_conf : kerberos_krb5_conf_file option;
      [@ocaml.doc
        "The [krb5.conf] file that contains the Kerberos configuration information. You can load \
         the [krb5.conf] file by providing the file's address. If you're using the CLI, it \
         performs the base64 encoding for you. Otherwise, provide the base64-encoded text. \n\n\
        \  If [KERBEROS] is specified for [AuthenticationType], this parameter is required.\n\
        \  \n\
        \   "]
  kerberos_keytab : kerberos_keytab_file option;
      [@ocaml.doc
        "The Kerberos key table (keytab) that contains mappings between the defined Kerberos \
         principal and the encrypted keys. You can load the keytab from a file by providing the \
         file's address.\n\n\
        \  If [KERBEROS] is specified for [AuthenticationType], this parameter is required. \n\
        \  \n\
        \   "]
  kerberos_principal : kerberos_principal option;
      [@ocaml.doc
        "The Kerberos principal with access to the files and folders on the HDFS cluster. \n\n\
        \  If [KERBEROS] is specified for [AuthenticationType], this parameter is required.\n\
        \  \n\
        \   "]
  simple_user : hdfs_user option;
      [@ocaml.doc
        "The user name used to identify the client on the host operating system. \n\n\
        \  If [SIMPLE] is specified for [AuthenticationType], this parameter is required. \n\
        \  \n\
        \   "]
  authentication_type : hdfs_authentication_type;
      [@ocaml.doc "The type of authentication used to determine the identity of the user. \n"]
  qop_configuration : qop_configuration option;
      [@ocaml.doc
        "The Quality of Protection (QOP) configuration specifies the Remote Procedure Call (RPC) \
         and data transfer protection settings configured on the Hadoop Distributed File System \
         (HDFS) cluster. If [QopConfiguration] isn't specified, [RpcProtection] and \
         [DataTransferProtection] default to [PRIVACY]. If you set [RpcProtection] or \
         [DataTransferProtection], the other parameter assumes the same value. \n"]
  kms_key_provider_uri : kms_key_provider_uri option;
      [@ocaml.doc "The URI of the HDFS cluster's Key Management Server (KMS). \n"]
  replication_factor : hdfs_replication_factor option;
      [@ocaml.doc
        "The number of DataNodes to replicate the data to when writing to the HDFS cluster. By \
         default, data is replicated to three DataNodes.\n"]
  block_size : hdfs_block_size option;
      [@ocaml.doc
        "The size of data blocks to write into the HDFS cluster. The block size must be a multiple \
         of 512 bytes. The default block size is 128 mebibytes (MiB).\n"]
  name_nodes : hdfs_name_node_list;
      [@ocaml.doc
        "The NameNode that manages the HDFS namespace. The NameNode performs operations such as \
         opening, closing, and renaming files and directories. The NameNode contains the \
         information to map blocks of data to the DataNodes. You can use only one NameNode.\n"]
  subdirectory : hdfs_subdirectory option;
      [@ocaml.doc
        "A subdirectory in the HDFS cluster. This subdirectory is used to read data from or write \
         data to the HDFS cluster. If the subdirectory isn't specified, it will default to [/].\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_windows_response = {
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the FSx for Windows File Server file system location you created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_windows_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the password for an FSx for Windows File Server storage location is stored in plain text, \
         in Secrets Manager. This configuration includes the secret ARN, and the ARN for an IAM \
         role that provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [Password]) or [CustomSecretConfig] (without \
         [Password]) to provide credentials for a [CreateLocationFsxWindows] request. Do not \
         provide both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, which includes the \
         password that DataSync uses to access a specific FSx Windows storage location, with a \
         customer-managed KMS key.\n\n\
        \ When you include this parameter as part of a [CreateLocationFsxWindows] request, you \
         provide only the KMS key ARN. DataSync uses this KMS key together with the [Password] you \
         specify for to create a DataSync-managed secret to store the location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with [Password]) or [CustomSecretConfig] \
         (without [Password]) to provide credentials for a [CreateLocationFsxWindows] request. Do \
         not provide both parameters for the same request.\n\
        \    \n\
        \     "]
  password : smb_password option;
      [@ocaml.doc
        "Specifies the password of the user with the permissions to mount and access the files, \
         folders, and file metadata in your FSx for Windows File Server file system.\n"]
  domain : smb_domain option;
      [@ocaml.doc
        "Specifies the name of the Windows domain that the FSx for Windows File Server file system \
         belongs to.\n\n\
        \ If you have multiple Active Directory domains in your environment, configuring this \
         parameter makes sure that DataSync connects to the right file system.\n\
        \ "]
  user : smb_user;
      [@ocaml.doc
        "Specifies the user with the permissions to mount and access the files, folders, and file \
         metadata in your FSx for Windows File Server file system.\n\n\
        \ For information about choosing a user with the right level of access for your transfer, \
         see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-windows-location-permissions}required \
         permissions} for FSx for Windows File Server locations.\n\
        \ "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your location.\n"]
  security_group_arns : ec2_security_group_arn_list;
      [@ocaml.doc
        "Specifies the ARNs of the Amazon EC2 security groups that provide access to your file \
         system's preferred subnet.\n\n\
        \ The security groups that you specify must be able to communicate with your file system's \
         security groups. For information about configuring security groups for file system \
         access, see the \
         {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/limit-access-security-groups.html} \
         {i Amazon FSx for Windows File Server User Guide} }.\n\
        \ \n\
        \   If you choose a security group that doesn't allow connections from within itself, do \
         one of the following:\n\
        \   \n\
        \    {ul\n\
        \          {-  Configure the security group to allow it to communicate within itself.\n\
        \              \n\
        \               }\n\
        \          {-  Choose a different security group that can communicate with the mount \
         target's security group.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  fsx_filesystem_arn : fsx_filesystem_arn;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) for the FSx for Windows File Server file system.\n"]
  subdirectory : fsx_windows_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your file system using forward slashes. This is where DataSync \
         reads or writes data (depending on if this is a source or destination location).\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_open_zfs_response = {
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the FSx for OpenZFS file system location that you created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_open_zfs_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "The key-value pair that represents a tag that you want to add to the resource. The value \
         can be an empty string. This value helps you manage, filter, and search for your \
         resources. We recommend that you create a name tag for your location.\n"]
  subdirectory : fsx_open_zfs_subdirectory option;
      [@ocaml.doc
        "A subdirectory in the location's path that must begin with [/fsx]. DataSync uses this \
         subdirectory to read or write data (depending on whether the file system is a source or \
         destination location).\n"]
  security_group_arns : ec2_security_group_arn_list;
      [@ocaml.doc
        "The ARNs of the security groups that are used to configure the FSx for OpenZFS file system.\n"]
  protocol : fsx_protocol;
      [@ocaml.doc "The type of protocol that DataSync uses to access your file system.\n"]
  fsx_filesystem_arn : fsx_filesystem_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the FSx for OpenZFS file system.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_ontap_response = {
  location_arn : location_arn option;
      [@ocaml.doc "Specifies the ARN of the FSx for ONTAP file system location that you create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_ontap_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your location.\n"]
  subdirectory : fsx_ontap_subdirectory option;
      [@ocaml.doc
        "Specifies a path to the file share in the SVM where you want to transfer data to or from.\n\n\
        \ You can specify a junction path (also known as a mount point), qtree path (for NFS file \
         shares), or share name (for SMB file shares). For example, your mount path might be \
         [/vol1], [/vol1/tree1], or [/share1].\n\
        \ \n\
        \   Don't specify a junction path in the SVM's root volume. For more information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-svms.html}Managing FSx for \
         ONTAP storage virtual machines} in the {i Amazon FSx for NetApp ONTAP User Guide}.\n\
        \   \n\
        \    "]
  storage_virtual_machine_arn : storage_virtual_machine_arn;
      [@ocaml.doc
        "Specifies the ARN of the storage virtual machine (SVM) in your file system where you want \
         to copy data to or from.\n"]
  security_group_arns : ec2_security_group_arn_list;
      [@ocaml.doc
        "Specifies the Amazon EC2 security groups that provide access to your file system's \
         preferred subnet.\n\n\
        \ The security groups must allow outbound traffic on the following ports (depending on the \
         protocol you use):\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Network File System (NFS)}: TCP ports 111, 635, and 2049\n\
        \            \n\
        \             }\n\
        \        {-   {b Server Message Block (SMB)}: TCP port 445\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Your file system's security groups must also allow inbound traffic on the same ports.\n\
        \   "]
  protocol : fsx_protocol; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_lustre_response = {
  location_arn : location_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the FSx for Lustre file system location that you \
         created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_location_fsx_lustre_request = {
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your location.\n"]
  subdirectory : fsx_lustre_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your FSx for Lustre file system. The path can include \
         subdirectories.\n\n\
        \ When the location is used as a source, DataSync reads data from the mount path. When the \
         location is used as a destination, DataSync writes data to the mount path. If you don't \
         include this parameter, DataSync uses the file system's root directory ([/]).\n\
        \ "]
  security_group_arns : ec2_security_group_arn_list;
      [@ocaml.doc
        "Specifies the Amazon Resource Names (ARNs) of up to five security groups that provide \
         access to your FSx for Lustre file system.\n\n\
        \ The security groups must be able to access the file system's ports. The file system must \
         also allow access from the security groups. For information about file system access, see \
         the \
         {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/limit-access-security-groups.html} \
         {i Amazon FSx for Lustre User Guide} }.\n\
        \ "]
  fsx_filesystem_arn : fsx_filesystem_arn;
      [@ocaml.doc "Specifies the Amazon Resource Name (ARN) of the FSx for Lustre file system.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_efs_response = {
  location_arn : location_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon EFS file system location that you create.\n"]
}
[@@ocaml.doc "CreateLocationEfs\n"]

type nonrec efs_filesystem_arn = string [@@ocaml.doc ""]

type nonrec create_location_efs_request = {
  in_transit_encryption : efs_in_transit_encryption option;
      [@ocaml.doc
        "Specifies whether you want DataSync to use Transport Layer Security (TLS) 1.2 encryption \
         when it transfers data to or from your Amazon EFS file system.\n\n\
        \ If you specify an access point using [AccessPointArn] or an IAM role using \
         [FileSystemAccessRoleArn], you must set this parameter to [TLS1_2].\n\
        \ "]
  file_system_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "Specifies an Identity and Access Management (IAM) role that allows DataSync to access \
         your Amazon EFS file system.\n\n\
        \ For information on creating this role, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role}Creating \
         a DataSync IAM role for file system access}.\n\
        \ "]
  access_point_arn : efs_access_point_arn option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the access point that DataSync uses to mount \
         your Amazon EFS file system.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam}Accessing \
         restricted file systems}.\n\
        \ "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies the key-value pair that represents a tag that you want to add to the resource. \
         The value can be an empty string. This value helps you manage, filter, and search for \
         your resources. We recommend that you create a name tag for your location.\n"]
  ec2_config : ec2_config;
      [@ocaml.doc
        "Specifies the subnet and security groups DataSync uses to connect to one of your Amazon \
         EFS file system's {{:https://docs.aws.amazon.com/efs/latest/ug/accessing-fs.html}mount \
         targets}.\n"]
  efs_filesystem_arn : efs_filesystem_arn;
      [@ocaml.doc "Specifies the ARN for your Amazon EFS file system.\n"]
  subdirectory : efs_subdirectory option;
      [@ocaml.doc
        "Specifies a mount path for your Amazon EFS file system. This is where DataSync reads or \
         writes data on your file system (depending on if this is a source or destination \
         location).\n\n\
        \ By default, DataSync uses the root directory (or \
         {{:https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html}access point} if you \
         provide one by using [AccessPointArn]). You can also include subdirectories using forward \
         slashes (for example, [/path/to/folder]).\n\
        \ "]
}
[@@ocaml.doc "CreateLocationEfsRequest\n"]

type nonrec create_location_azure_blob_response = {
  location_arn : location_arn option;
      [@ocaml.doc "The ARN of the Azure Blob Storage transfer location that you created.\n"]
}
[@@ocaml.doc ""]

type nonrec azure_blob_container_url = string [@@ocaml.doc ""]

type nonrec create_location_azure_blob_request = {
  custom_secret_config : custom_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a customer-managed Secrets Manager secret where \
         the authentication token for an AzureBlob storage location is stored in plain text, in \
         Secrets Manager. This configuration includes the secret ARN, and the ARN for an IAM role \
         that provides access to the secret. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key} \
         Using a secret that you manage}.\n\n\
        \  You can use either [CmkSecretConfig] (with [SasConfiguration]) or [CustomSecretConfig] \
         (without [SasConfiguration]) to provide credentials for a [CreateLocationAzureBlob] \
         request. Do not provide both parameters for the same request.\n\
        \  \n\
        \   "]
  cmk_secret_config : cmk_secret_config option;
      [@ocaml.doc
        "Specifies configuration information for a DataSync-managed secret, which includes the \
         authentication token that DataSync uses to access a specific AzureBlob storage location, \
         with a customer-managed KMS key.\n\n\
        \ When you include this parameter as part of a [CreateLocationAzureBlob] request, you \
         provide only the KMS key ARN. DataSync uses this KMS key together with the authentication \
         token you specify for [SasConfiguration] to create a DataSync-managed secret to store the \
         location access credentials.\n\
        \ \n\
        \  Make sure that DataSync has permission to access the KMS key that you specify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key} \
         Using a service-managed secret encrypted with a custom KMS key}.\n\
        \  \n\
        \    You can use either [CmkSecretConfig] (with [SasConfiguration]) or \
         [CustomSecretConfig] (without [SasConfiguration]) to provide credentials for a \
         [CreateLocationAzureBlob] request. Do not provide both parameters for the same request.\n\
        \    \n\
        \     "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least a name tag for your transfer location.\n"]
  agent_arns : agent_arn_list option;
      [@ocaml.doc
        "(Optional) Specifies the Amazon Resource Name (ARN) of the DataSync agent that can \
         connect with your Azure Blob Storage container. If you are setting up an agentless \
         cross-cloud transfer, you do not need to specify a value for this parameter.\n\n\
        \ You can specify more than one agent. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html}Using \
         multiple agents for your transfer}.\n\
        \ \n\
        \   Make sure you configure this parameter correctly when you first create your storage \
         location. You cannot add or remove agents from a storage location after you create it.\n\
        \   \n\
        \    "]
  subdirectory : azure_blob_subdirectory option;
      [@ocaml.doc
        "Specifies path segments if you want to limit your transfer to a virtual directory in your \
         container (for example, [/my/images]).\n"]
  access_tier : azure_access_tier option;
      [@ocaml.doc
        "Specifies the access tier that you want your objects or files transferred into. This only \
         applies when using the location as a transfer destination. For more information, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers}Access \
         tiers}.\n"]
  blob_type : azure_blob_type option;
      [@ocaml.doc
        "Specifies the type of blob that you want your objects or files to be when transferring \
         them into Azure Blob Storage. Currently, DataSync only supports moving data into Azure \
         Blob Storage as block blobs. For more information on blob types, see the \
         {{:https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs}Azure \
         Blob Storage documentation}.\n"]
  sas_configuration : azure_blob_sas_configuration option;
      [@ocaml.doc
        "Specifies the SAS configuration that allows DataSync to access your Azure Blob Storage.\n\n\
        \  If you provide an authentication token using [SasConfiguration], but do not provide \
         secret configuration details using [CmkSecretConfig] or [CustomSecretConfig], then \
         DataSync stores the token using your Amazon Web Services account's secrets manager secret.\n\
        \  \n\
        \   "]
  authentication_type : azure_blob_authentication_type;
      [@ocaml.doc
        "Specifies the authentication method DataSync uses to access your Azure Blob Storage. \
         DataSync can access blob storage using a shared access signature (SAS).\n"]
  container_url : azure_blob_container_url;
      [@ocaml.doc
        "Specifies the URL of the Azure Blob Storage container involved in your transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec create_agent_response = {
  agent_arn : agent_arn option;
      [@ocaml.doc
        "The ARN of the agent that you just activated. Use the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html}ListAgents} \
         operation to return a list of agents in your Amazon Web Services account and Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc "CreateAgentResponse\n"]

type nonrec activation_key = string [@@ocaml.doc ""]

type nonrec create_agent_request = {
  security_group_arns : pl_security_group_arn_list option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the security group that allows traffic \
         between your agent and VPC service endpoint. You can only specify one ARN.\n"]
  subnet_arns : pl_subnet_arn_list option;
      [@ocaml.doc
        "Specifies the ARN of the subnet where your VPC service endpoint is located. You can only \
         specify one ARN.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc
        "Specifies the ID of the \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#datasync-in-vpc}VPC \
         service endpoint} that you're using. For example, a VPC endpoint ID looks like \
         [vpce-01234d5aff67890e1].\n\n\
        \  The VPC service endpoint you use must include the DataSync service name (for example, \
         [com.amazonaws.us-east-2.datasync]).\n\
        \  \n\
        \   "]
  tags : input_tag_list option;
      [@ocaml.doc
        "Specifies labels that help you categorize, filter, and search for your Amazon Web \
         Services resources. We recommend creating at least one tag for your agent.\n"]
  agent_name : tag_value option;
      [@ocaml.doc
        "Specifies a name for your agent. We recommend specifying a name that you can remember.\n"]
  activation_key : activation_key;
      [@ocaml.doc
        "Specifies your DataSync agent's activation key. If you don't have an activation key, see \
         {{:https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html}Activating \
         your agent}.\n"]
}
[@@ocaml.doc "CreateAgentRequest\n"]

type nonrec cancel_task_execution_response = unit [@@ocaml.doc ""]

type nonrec cancel_task_execution_request = {
  task_execution_arn : task_execution_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the task execution to stop.\n"]
}
[@@ocaml.doc "CancelTaskExecutionRequest\n"]
