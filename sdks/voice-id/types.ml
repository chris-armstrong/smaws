type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "You do not have sufficient permissions to perform this action. Check the error message and try \
   again.\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request failed one or more validations; check the error message for more details.\n"]

type nonrec throttling_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was denied due to request throttling. Please slow down your request rate. Refer to \
   {{:https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html##voiceid-api-quotas} \
   Amazon Connect Voice ID Service API throttling quotas } and try your request again.\n"]

type nonrec service_quota_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request exceeded the service quota. Refer to \
   {{:https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#voiceid-quotas}Voice \
   ID Service Quotas} and try your request again.\n"]

type nonrec resource_type =
  | BATCH_JOB [@ocaml.doc ""]
  | COMPLIANCE_CONSENT [@ocaml.doc ""]
  | DOMAIN [@ocaml.doc ""]
  | FRAUDSTER [@ocaml.doc ""]
  | SESSION [@ocaml.doc ""]
  | SPEAKER [@ocaml.doc ""]
  | WATCHLIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : string_ option; [@ocaml.doc ""]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of resource which cannot not be found. Possible types are [BATCH_JOB], \
         [COMPLIANCE_CONSENT], [DOMAIN], [FRAUDSTER], [SESSION] and [SPEAKER].\n"]
}
[@@ocaml.doc
  "The specified resource cannot be found. Check the [ResourceType] and error message for more \
   details.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request failed due to an unknown error on the server side.\n"]

type nonrec conflict_type =
  | ANOTHER_ACTIVE_STREAM [@ocaml.doc ""]
  | DOMAIN_NOT_ACTIVE [@ocaml.doc ""]
  | CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT [@ocaml.doc ""]
  | ENROLLMENT_ALREADY_EXISTS [@ocaml.doc ""]
  | SPEAKER_NOT_SET [@ocaml.doc ""]
  | SPEAKER_OPTED_OUT [@ocaml.doc ""]
  | CONCURRENT_CHANGES [@ocaml.doc ""]
  | DOMAIN_LOCKED_FROM_ENCRYPTION_UPDATES [@ocaml.doc ""]
  | CANNOT_DELETE_NON_EMPTY_WATCHLIST [@ocaml.doc ""]
  | FRAUDSTER_MUST_BELONG_TO_AT_LEAST_ONE_WATCHLIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : string_ option; [@ocaml.doc ""]
  conflict_type : conflict_type option;
      [@ocaml.doc
        "The type of conflict which caused a ConflictException. Possible types and the \
         corresponding error messages are as follows:\n\n\
        \ {ul\n\
        \       {-   [DOMAIN_NOT_ACTIVE]: The domain is not active.\n\
        \           \n\
        \            }\n\
        \       {-   [CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT]: You cannot change the speaker ID \
         after an enrollment has been requested.\n\
        \           \n\
        \            }\n\
        \       {-   [ENROLLMENT_ALREADY_EXISTS]: There is already an enrollment for this session.\n\
        \           \n\
        \            }\n\
        \       {-   [SPEAKER_NOT_SET]: You must set the speaker ID before requesting an enrollment.\n\
        \           \n\
        \            }\n\
        \       {-   [SPEAKER_OPTED_OUT]: You cannot request an enrollment for an opted out speaker.\n\
        \           \n\
        \            }\n\
        \       {-   [CONCURRENT_CHANGES]: The request could not be processed as the resource was \
         modified by another request during execution.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The request failed due to a conflict. Check the [ConflictType] and error message for more \
   details.\n"]

type nonrec watchlist_id = string [@@ocaml.doc ""]

type nonrec response_watchlist_ids = watchlist_id list [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec generated_fraudster_id = string [@@ocaml.doc ""]

type nonrec domain_id = string [@@ocaml.doc ""]

type nonrec fraudster = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the fraudster.\n"]
  generated_fraudster_id : generated_fraudster_id option;
      [@ocaml.doc "The service-generated identifier for the fraudster.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp of when Voice ID identified the fraudster.\n"]
  watchlist_ids : response_watchlist_ids option;
      [@ocaml.doc "The identifier of the watchlists the fraudster is a part of.\n"]
}
[@@ocaml.doc "Contains all the information about a fraudster.\n"]

type nonrec associate_fraudster_response = { fraudster : fraudster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec fraudster_id = string [@@ocaml.doc ""]

type nonrec associate_fraudster_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the fraudster.\n"]
  watchlist_id : watchlist_id;
      [@ocaml.doc "The identifier of the watchlist you want to associate with the fraudster.\n"]
  fraudster_id : fraudster_id;
      [@ocaml.doc "The identifier of the fraudster to be associated with the watchlist.\n"]
}
[@@ocaml.doc ""]

type nonrec score = int [@@ocaml.doc ""]

type nonrec authentication_configuration = {
  acceptance_threshold : score;
      [@ocaml.doc "The minimum threshold needed to successfully authenticate a speaker.\n"]
}
[@@ocaml.doc "The configuration used to authenticate a speaker during a session.\n"]

type nonrec authentication_decision =
  | ACCEPT [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
  | NOT_ENOUGH_SPEECH [@ocaml.doc ""]
  | SPEAKER_NOT_ENROLLED [@ocaml.doc ""]
  | SPEAKER_OPTED_OUT [@ocaml.doc ""]
  | SPEAKER_ID_NOT_PROVIDED [@ocaml.doc ""]
  | SPEAKER_EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generated_speaker_id = string [@@ocaml.doc ""]

type nonrec customer_speaker_id = string [@@ocaml.doc ""]

type nonrec unique_id_large = string [@@ocaml.doc ""]

type nonrec authentication_result = {
  authentication_result_id : unique_id_large option;
      [@ocaml.doc
        "The unique identifier for this authentication result. Because there can be multiple \
         authentications for a given session, this field helps to identify if the returned result \
         is from a previous streaming activity or a new result. Note that in absence of any new \
         streaming activity, [AcceptanceThreshold] changes, or [SpeakerId] changes, Voice ID \
         always returns cached Authentication Result for this API.\n"]
  audio_aggregation_started_at : timestamp option;
      [@ocaml.doc "A timestamp of when audio aggregation started for this authentication result.\n"]
  audio_aggregation_ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when audio aggregation ended for this authentication result.\n"]
  customer_speaker_id : customer_speaker_id option;
      [@ocaml.doc
        "The client-provided identifier for the speaker whose authentication result is produced. \
         Only present if a [SpeakerId] is provided for the session.\n"]
  generated_speaker_id : generated_speaker_id option;
      [@ocaml.doc
        "The service-generated identifier for the speaker whose authentication result is produced.\n"]
  decision : authentication_decision option;
      [@ocaml.doc
        "The authentication decision produced by Voice ID, processed against the current session \
         state and streamed audio of the speaker.\n"]
  score : score option;
      [@ocaml.doc
        "The authentication score for the speaker whose authentication result is produced. This \
         value is only present if the authentication decision is either [ACCEPT] or [REJECT].\n"]
  configuration : authentication_configuration option;
      [@ocaml.doc
        "The [AuthenticationConfiguration] used to generate this authentication result.\n"]
}
[@@ocaml.doc
  "The authentication result produced by Voice ID, processed against the current session state and \
   streamed audio of the speaker.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec client_token_string = string [@@ocaml.doc ""]

type nonrec watchlist_details = {
  default_watchlist_id : watchlist_id; [@ocaml.doc "The identifier of the default watchlist.\n"]
}
[@@ocaml.doc "Details of the watchlists in a domain.\n"]

type nonrec server_side_encryption_update_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec server_side_encryption_update_details = {
  old_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The previous KMS key ID the domain was encrypted with, before \
         ServerSideEncryptionConfiguration was updated to a new KMS key ID.\n"]
  update_status : server_side_encryption_update_status option;
      [@ocaml.doc
        "Status of the server-side encryption update. During an update, if there is an issue with \
         the domain's current or old KMS key ID, such as an inaccessible or disabled key, then the \
         status is FAILED. In order to resolve this, the key needs to be made accessible, and then \
         an UpdateDomain call with the existing server-side encryption configuration will \
         re-attempt this update process.\n"]
  message : string_ option;
      [@ocaml.doc
        "Message explaining the current UpdateStatus. When the UpdateStatus is FAILED, this \
         message explains the cause of the failure.\n"]
}
[@@ocaml.doc
  "Details about the most recent server-side encryption configuration update. When the server-side \
   encryption configuration is changed, dependency on the old KMS key is removed through an \
   asynchronous process. When this update is complete, the domain\226\128\153s data can only be \
   accessed using the new KMS key.\n"]

type nonrec server_side_encryption_configuration = {
  kms_key_id : kms_key_id;
      [@ocaml.doc
        "The identifier of the KMS key to use to encrypt data stored by Voice ID. Voice ID doesn't \
         support asymmetric customer managed keys. \n"]
}
[@@ocaml.doc
  "The configuration containing information about the customer managed key used for encrypting \
   customer data.\n"]

type nonrec domain_status =
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec domain = {
  domain_id : domain_id option; [@ocaml.doc "The identifier of the domain.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for the domain.\n"]
  name : domain_name option; [@ocaml.doc "The name for the domain.\n"]
  description : description option; [@ocaml.doc "The description of the domain.\n"]
  domain_status : domain_status option; [@ocaml.doc "The current status of the domain.\n"]
  server_side_encryption_configuration : server_side_encryption_configuration option;
      [@ocaml.doc
        "The server-side encryption configuration containing the KMS key identifier you want Voice \
         ID to use to encrypt your data.\n"]
  created_at : timestamp option; [@ocaml.doc "The timestamp of when the domain was created.\n"]
  updated_at : timestamp option; [@ocaml.doc "The timestamp of when the domain was last update.\n"]
  server_side_encryption_update_details : server_side_encryption_update_details option;
      [@ocaml.doc
        "Details about the most recent server-side encryption configuration update. When the \
         server-side encryption configuration is changed, dependency on the old KMS key is removed \
         through an asynchronous process. When this update is complete, the domain's data can only \
         be accessed using the new KMS key.\n"]
  watchlist_details : watchlist_details option;
      [@ocaml.doc
        "The watchlist details of a domain. Contains the default watchlist ID of the domain.\n"]
}
[@@ocaml.doc "Contains all the information about a domain.\n"]

type nonrec create_domain_response = {
  domain : domain option; [@ocaml.doc "Information about the newly created domain.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "The first part of a key:value pair that forms a tag associated with a given resource. For \
         example, in the tag 'Department':'Sales', the key is 'Department'. \n"]
  value : tag_value;
      [@ocaml.doc
        "The second part of a key:value pair that forms a tag associated with a given resource. \
         For example, in the tag 'Department':'Sales', the value is 'Sales'. \n"]
}
[@@ocaml.doc
  "The tags used to organize, track, or control access for this resource. For example, \\{ \
   \"tags\": \\{\"key1\":\"value1\", \"key2\":\"value2\"\\} \\}.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_domain_request = {
  name : domain_name; [@ocaml.doc "The name of the domain.\n"]
  description : description option; [@ocaml.doc "A brief description of this domain.\n"]
  server_side_encryption_configuration : server_side_encryption_configuration;
      [@ocaml.doc
        "The configuration, containing the KMS key identifier, to be used by Voice ID for the \
         server-side encryption of your data. Refer to \
         {{:https://docs.aws.amazon.com/connect/latest/adminguide/encryption-at-rest.html#encryption-at-rest-voiceid} \
         Amazon Connect Voice ID encryption at rest} for more details on how the KMS key is used. \n"]
  client_token : client_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If not provided, the Amazon Web Services SDK populates this field. For more \
         information about idempotency, see \
         {{:https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/}Making \
         retries safe with idempotent APIs}.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags you want added to the domain.\n"]
}
[@@ocaml.doc ""]

type nonrec watchlist_description = string [@@ocaml.doc ""]

type nonrec watchlist_name = string [@@ocaml.doc ""]

type nonrec watchlist = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  watchlist_id : watchlist_id option; [@ocaml.doc "The identifier of the watchlist.\n"]
  name : watchlist_name option; [@ocaml.doc "The name for the watchlist.\n"]
  description : watchlist_description option; [@ocaml.doc "The description of the watchlist.\n"]
  default_watchlist : boolean_ option;
      [@ocaml.doc "Whether the specified watchlist is the default watchlist of a domain.\n"]
  created_at : timestamp option; [@ocaml.doc "The timestamp of when the watchlist was created.\n"]
  updated_at : timestamp option; [@ocaml.doc "The timestamp of when the watchlist was updated.\n"]
}
[@@ocaml.doc "Contains all the information about a watchlist.\n"]

type nonrec create_watchlist_response = {
  watchlist : watchlist option; [@ocaml.doc "Information about the newly created watchlist.\n"]
}
[@@ocaml.doc ""]

type nonrec create_watchlist_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  name : watchlist_name; [@ocaml.doc "The name of the watchlist.\n"]
  description : watchlist_description option;
      [@ocaml.doc "A brief description of this watchlist.\n"]
  client_token : client_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If not provided, the Amazon Web Services SDK populates this field. For more \
         information about idempotency, see \
         {{:https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/}Making \
         retries safe with idempotent APIs}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_domain_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fraudster_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the fraudster.\n"]
  fraudster_id : fraudster_id; [@ocaml.doc "The identifier of the fraudster you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec speaker_id = string [@@ocaml.doc ""]

type nonrec delete_speaker_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the speaker.\n"]
  speaker_id : speaker_id; [@ocaml.doc "The identifier of the speaker you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_watchlist_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  watchlist_id : watchlist_id; [@ocaml.doc "The identifier of the watchlist to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_domain_response = {
  domain : domain option; [@ocaml.doc "Information about the specified domain.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_domain_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fraudster_response = {
  fraudster : fraudster option; [@ocaml.doc "Information about the specified fraudster.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fraudster_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the fraudster.\n"]
  fraudster_id : fraudster_id; [@ocaml.doc "The identifier of the fraudster you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec job_progress = {
  percent_complete : score option;
      [@ocaml.doc
        "Shows the completed percentage of enrollment or registration requests listed in the input \
         file.\n"]
}
[@@ocaml.doc "Indicates the completion progress for a batch job.\n"]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec failure_details = {
  status_code : integer option;
      [@ocaml.doc "An HTTP status code representing the nature of the error.\n"]
  message : string_ option;
      [@ocaml.doc "A description of the error that caused the batch job failure.\n"]
}
[@@ocaml.doc "Contains error details for a failed batch job.\n"]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec output_data_config = {
  s3_uri : s3_uri;
      [@ocaml.doc
        "The S3 path of the folder where Voice ID writes the job output file. It has a [*.out] \
         extension. For example, if the input file name is [input-file.json] and the output folder \
         path is [s3://output-bucket/output-folder], the full output file path is \
         [s3://output-bucket/output-folder/job-Id/input-file.json.out].\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier of the KMS key you want Voice ID to use to encrypt the output file of a \
         speaker enrollment job/fraudster registration job. \n"]
}
[@@ocaml.doc "The configuration containing output file information for a batch job.\n"]

type nonrec input_data_config = {
  s3_uri : s3_uri;
      [@ocaml.doc
        "The S3 location for the input manifest file that contains the list of individual \
         enrollment or registration job requests.\n"]
}
[@@ocaml.doc "The configuration containing input file information for a batch job.\n"]

type nonrec registration_config_watchlist_ids = watchlist_id list [@@ocaml.doc ""]

type nonrec duplicate_registration_action = SKIP [@ocaml.doc ""] | REGISTER_AS_NEW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_config = {
  duplicate_registration_action : duplicate_registration_action option;
      [@ocaml.doc
        "The action to take when a fraudster is identified as a duplicate. The default action is \
         [SKIP], which skips registering the duplicate fraudster. Setting the value to \
         [REGISTER_AS_NEW] always registers a new fraudster into the specified domain.\n"]
  fraudster_similarity_threshold : score option;
      [@ocaml.doc
        "The minimum similarity score between the new and old fraudsters in order to consider the \
         new fraudster a duplicate.\n"]
  watchlist_ids : registration_config_watchlist_ids option;
      [@ocaml.doc
        "The identifiers of watchlists that a fraudster is registered to. If a watchlist isn't \
         provided, the fraudsters are registered to the default watchlist. \n"]
}
[@@ocaml.doc
  "The registration configuration to be used during the batch fraudster registration job.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec fraudster_registration_job_status =
  | SUBMITTED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec fraudster_registration_job = {
  job_name : job_name option;
      [@ocaml.doc "The client-provided name for the fraudster registration job.\n"]
  job_id : job_id option;
      [@ocaml.doc "The service-generated identifier for the fraudster registration job.\n"]
  job_status : fraudster_registration_job_status option;
      [@ocaml.doc "The current status of the fraudster registration job.\n"]
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the fraudster registration job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access \
         customer's buckets to read the input manifest file and write the job output file.\n"]
  registration_config : registration_config option;
      [@ocaml.doc
        "The registration config containing details such as the action to take when a duplicate \
         fraudster is detected, and the similarity threshold to use for detecting a duplicate \
         fraudster.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data config containing an S3 URI for the input manifest file that contains the \
         list of fraudster registration job requests.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data config containing the S3 location where you want Voice ID to write your \
         job output file; you must also include a KMS key ID in order to encrypt the file.\n"]
  created_at : timestamp option;
      [@ocaml.doc "A timestamp of when the fraudster registration job was created.\n"]
  ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when the fraudster registration job ended.\n"]
  failure_details : failure_details option;
      [@ocaml.doc
        "Contains details that are populated when an entire batch job fails. In cases of \
         individual registration job failures, the batch job as a whole doesn't fail; it is \
         completed with a [JobStatus] of [COMPLETED_WITH_ERRORS]. You can use the job output file \
         to identify the individual registration requests that failed.\n"]
  job_progress : job_progress option;
      [@ocaml.doc
        "Shows the completed percentage of registration requests listed in the input file.\n"]
}
[@@ocaml.doc "Contains all the information about a fraudster registration job.\n"]

type nonrec describe_fraudster_registration_job_response = {
  job : fraudster_registration_job option;
      [@ocaml.doc "Contains details about the specified fraudster registration job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fraudster_registration_job_request = {
  domain_id : domain_id;
      [@ocaml.doc "The identifier of the domain that contains the fraudster registration job.\n"]
  job_id : job_id;
      [@ocaml.doc "The identifier of the fraudster registration job you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec speaker_status =
  | ENROLLED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | OPTED_OUT [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec speaker = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the speaker.\n"]
  customer_speaker_id : customer_speaker_id option;
      [@ocaml.doc "The client-provided identifier for the speaker.\n"]
  generated_speaker_id : generated_speaker_id option;
      [@ocaml.doc "The service-generated identifier for the speaker.\n"]
  status : speaker_status option; [@ocaml.doc "The current status of the speaker.\n"]
  created_at : timestamp option; [@ocaml.doc "A timestamp of when the speaker was created. \n"]
  updated_at : timestamp option; [@ocaml.doc "A timestamp of the speaker's last update.\n"]
  last_accessed_at : timestamp option;
      [@ocaml.doc
        "The timestamp of when the speaker was last accessed for enrollment, re-enrollment or a \
         successful authentication. This timestamp is accurate to one hour.\n"]
}
[@@ocaml.doc "Contains all the information about a speaker.\n"]

type nonrec describe_speaker_response = {
  speaker : speaker option; [@ocaml.doc "Information about the specified speaker.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_speaker_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the speaker.\n"]
  speaker_id : speaker_id; [@ocaml.doc "The identifier of the speaker you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec enrollment_job_fraud_detection_config_watchlist_ids = watchlist_id list [@@ocaml.doc ""]

type nonrec fraud_detection_action = IGNORE [@ocaml.doc ""] | FAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enrollment_job_fraud_detection_config = {
  fraud_detection_action : fraud_detection_action option;
      [@ocaml.doc
        "The action to take when the given speaker is flagged by the fraud detection system. The \
         default value is [FAIL], which fails the speaker enrollment. Changing this value to \
         [IGNORE] results in the speaker being enrolled even if they are flagged by the fraud \
         detection system.\n"]
  risk_threshold : score option;
      [@ocaml.doc
        "Threshold value for determining whether the speaker is a high risk to be fraudulent. If \
         the detected risk score calculated by Voice ID is greater than or equal to the threshold, \
         the speaker is considered a fraudster.\n"]
  watchlist_ids : enrollment_job_fraud_detection_config_watchlist_ids option;
      [@ocaml.doc "The identifier of watchlists against which fraud detection is performed. \n"]
}
[@@ocaml.doc
  "The fraud detection configuration to be used during the batch speaker enrollment job.\n"]

type nonrec existing_enrollment_action = SKIP [@ocaml.doc ""] | OVERWRITE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enrollment_config = {
  existing_enrollment_action : existing_enrollment_action option;
      [@ocaml.doc
        " The action to take when the specified speaker is already enrolled in the specified \
         domain. The default value is [SKIP], which skips the enrollment for the existing speaker. \
         Setting the value to [OVERWRITE] replaces the existing voice prints and enrollment audio \
         stored for that speaker with new data generated from the latest audio.\n"]
  fraud_detection_config : enrollment_job_fraud_detection_config option;
      [@ocaml.doc "The fraud detection configuration to use for the speaker enrollment job.\n"]
}
[@@ocaml.doc "Contains configurations defining enrollment behavior for the batch job.\n"]

type nonrec speaker_enrollment_job_status =
  | SUBMITTED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec speaker_enrollment_job = {
  job_name : job_name option;
      [@ocaml.doc "The client-provided name for the speaker enrollment job.\n"]
  job_id : job_id option;
      [@ocaml.doc "The service-generated identifier for the speaker enrollment job.\n"]
  job_status : speaker_enrollment_job_status option;
      [@ocaml.doc "The current status of the speaker enrollment job.\n"]
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the speaker enrollment job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access \
         customer's buckets to read the input manifest file and write the job output file.\n"]
  enrollment_config : enrollment_config option;
      [@ocaml.doc
        "The configuration that defines the action to take when the speaker is already enrolled in \
         Voice ID, and the [FraudDetectionConfig] to use.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data config containing an S3 URI for the input manifest file that contains the \
         list of speaker enrollment job requests.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data config containing the S3 location where Voice ID writes the job output \
         file; you must also include a KMS key ID to encrypt the file.\n"]
  created_at : timestamp option;
      [@ocaml.doc "A timestamp of when the speaker enrollment job was created.\n"]
  ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when the speaker enrollment job ended. \n"]
  failure_details : failure_details option;
      [@ocaml.doc
        "Contains details that are populated when an entire batch job fails. In cases of \
         individual registration job failures, the batch job as a whole doesn't fail; it is \
         completed with a [JobStatus] of [COMPLETED_WITH_ERRORS]. You can use the job output file \
         to identify the individual registration requests that failed.\n"]
  job_progress : job_progress option;
      [@ocaml.doc
        "Provides details on job progress. This field shows the completed percentage of \
         registration requests listed in the input file.\n"]
}
[@@ocaml.doc "Contains all the information about a speaker enrollment job.\n"]

type nonrec describe_speaker_enrollment_job_response = {
  job : speaker_enrollment_job option;
      [@ocaml.doc "Contains details about the specified speaker enrollment job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_speaker_enrollment_job_request = {
  domain_id : domain_id;
      [@ocaml.doc "The identifier of the domain that contains the speaker enrollment job.\n"]
  job_id : job_id; [@ocaml.doc "The identifier of the speaker enrollment job you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_watchlist_response = {
  watchlist : watchlist option; [@ocaml.doc "Information about the specified watchlist.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_watchlist_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  watchlist_id : watchlist_id;
      [@ocaml.doc "The identifier of the watchlist that you are describing.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_fraudster_response = { fraudster : fraudster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec disassociate_fraudster_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the fraudster.\n"]
  watchlist_id : watchlist_id;
      [@ocaml.doc
        "The identifier of the watchlist that you want to disassociate from the fraudster.\n"]
  fraudster_id : fraudster_id;
      [@ocaml.doc "The identifier of the fraudster to be disassociated from the watchlist.\n"]
}
[@@ocaml.doc ""]

type nonrec domain_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec domain_summary = {
  domain_id : domain_id option; [@ocaml.doc "The identifier of the domain.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for the domain.\n"]
  name : domain_name option; [@ocaml.doc "The client-provided name for the domain.\n"]
  description : description option; [@ocaml.doc "The description of the domain.\n"]
  domain_status : domain_status option; [@ocaml.doc "The current status of the domain.\n"]
  server_side_encryption_configuration : server_side_encryption_configuration option;
      [@ocaml.doc
        "The server-side encryption configuration containing the KMS key identifier you want Voice \
         ID to use to encrypt your data.\n"]
  created_at : timestamp option; [@ocaml.doc "The timestamp of when the domain was created.\n"]
  updated_at : timestamp option; [@ocaml.doc "The timestamp of when the domain was last updated.\n"]
  server_side_encryption_update_details : server_side_encryption_update_details option;
      [@ocaml.doc
        "Details about the most recent server-side encryption configuration update. When the \
         server-side encryption configuration is changed, dependency on the old KMS key is removed \
         through an asynchronous process. When this update is complete, the domain's data can only \
         be accessed using the new KMS key.\n"]
  watchlist_details : watchlist_details option;
      [@ocaml.doc "Provides information about [watchlistDetails] and [DefaultWatchlistID]. \n"]
}
[@@ocaml.doc "Contains a summary of information about a domain.\n"]

type nonrec domain_summaries = domain_summary list [@@ocaml.doc ""]

type nonrec voice_spoofing_risk = {
  risk_score : score;
      [@ocaml.doc
        "The score indicating the likelihood of speaker\226\128\153s voice being spoofed.\n"]
}
[@@ocaml.doc "The details resulting from 'Voice Spoofing Risk' analysis of the speaker.\n"]

type nonrec known_fraudster_risk = {
  risk_score : score;
      [@ocaml.doc "The score indicating the likelihood the speaker is a known fraudster.\n"]
  generated_fraudster_id : generated_fraudster_id option;
      [@ocaml.doc
        "The identifier of the fraudster that is the closest match to the speaker. If there are no \
         fraudsters registered in a given domain, or if there are no fraudsters with a non-zero \
         RiskScore, this value is [null].\n"]
}
[@@ocaml.doc
  "Contains details produced as a result of performing known fraudster risk analysis on a speaker.\n"]

type nonrec fraud_risk_details = {
  known_fraudster_risk : known_fraudster_risk;
      [@ocaml.doc "The details resulting from 'Known Fraudster Risk' analysis of the speaker.\n"]
  voice_spoofing_risk : voice_spoofing_risk;
      [@ocaml.doc "The details resulting from 'Voice Spoofing Risk' analysis of the speaker.\n"]
}
[@@ocaml.doc
  "Details regarding various fraud risk analyses performed against the current session state and \
   streamed audio of the speaker.\n"]

type nonrec fraud_detection_reason =
  | KNOWN_FRAUDSTER [@ocaml.doc ""]
  | VOICE_SPOOFING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fraud_detection_reasons = fraud_detection_reason list [@@ocaml.doc ""]

type nonrec fraud_detection_decision =
  | HIGH_RISK [@ocaml.doc ""]
  | LOW_RISK [@ocaml.doc ""]
  | NOT_ENOUGH_SPEECH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fraud_detection_configuration = {
  risk_threshold : score option;
      [@ocaml.doc
        "Threshold value for determining whether the speaker is a fraudster. If the detected risk \
         score calculated by Voice ID is higher than the threshold, the speaker is considered a \
         fraudster.\n"]
  watchlist_id : watchlist_id option;
      [@ocaml.doc "The identifier of the watchlist against which fraud detection is performed. \n"]
}
[@@ocaml.doc
  "The configuration used for performing fraud detection over a speaker during a session.\n"]

type nonrec fraud_detection_result = {
  fraud_detection_result_id : unique_id_large option;
      [@ocaml.doc
        "The unique identifier for this fraud detection result. Given there can be multiple fraud \
         detections for a given session, this field helps in identifying if the returned result is \
         from previous streaming activity or a new result. Note that in the absence of any new \
         streaming activity or risk threshold changes, Voice ID always returns cached Fraud \
         Detection result for this API.\n"]
  audio_aggregation_started_at : timestamp option;
      [@ocaml.doc
        "A timestamp of when audio aggregation started for this fraud detection result.\n"]
  audio_aggregation_ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when audio aggregation ended for this fraud detection result.\n"]
  configuration : fraud_detection_configuration option;
      [@ocaml.doc
        "The [FraudDetectionConfiguration] used to generate this fraud detection result.\n"]
  decision : fraud_detection_decision option;
      [@ocaml.doc
        "The fraud detection decision produced by Voice ID, processed against the current session \
         state and streamed audio of the speaker.\n"]
  reasons : fraud_detection_reasons option;
      [@ocaml.doc
        "The reason speaker was flagged by the fraud detection system. This is only be populated \
         if fraud detection Decision is [HIGH_RISK], and the following possible values: \
         [KNOWN_FRAUDSTER] and [VOICE_SPOOFING].\n"]
  risk_details : fraud_risk_details option;
      [@ocaml.doc
        "Details about each risk analyzed for this speaker. Currently, this contains \
         KnownFraudsterRisk and VoiceSpoofingRisk details.\n"]
}
[@@ocaml.doc
  "The fraud detection result produced by Voice ID, processed against the current session state \
   and streamed audio of the speaker.\n"]

type nonrec streaming_status =
  | PENDING_CONFIGURATION [@ocaml.doc ""]
  | ONGOING [@ocaml.doc ""]
  | ENDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec session_name = string [@@ocaml.doc ""]

type nonrec session_id = string [@@ocaml.doc ""]

type nonrec evaluate_session_response = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the session.\n"]
  session_id : session_id option; [@ocaml.doc "The service-generated identifier of the session.\n"]
  session_name : session_name option; [@ocaml.doc "The client-provided name of the session.\n"]
  streaming_status : streaming_status option;
      [@ocaml.doc
        "The current status of audio streaming for this session. This field is useful to infer \
         next steps when the Authentication or Fraud Detection results are empty or the decision \
         is [NOT_ENOUGH_SPEECH]. In this situation, if the [StreamingStatus] is \
         [ONGOING/PENDING_CONFIGURATION], it can mean that the client should call the API again \
         later, after Voice ID has enough audio to produce a result. If the decision remains \
         [NOT_ENOUGH_SPEECH] even after [StreamingStatus] is [ENDED], it means that the previously \
         streamed session did not have enough speech to perform evaluation, and a new streaming \
         session is needed to try again.\n"]
  authentication_result : authentication_result option;
      [@ocaml.doc
        "Details resulting from the authentication process, such as authentication decision and \
         authentication score.\n"]
  fraud_detection_result : fraud_detection_result option;
      [@ocaml.doc
        "Details resulting from the fraud detection process, such as fraud detection decision and \
         risk score.\n"]
}
[@@ocaml.doc ""]

type nonrec session_name_or_id = string [@@ocaml.doc ""]

type nonrec evaluate_session_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain where the session started.\n"]
  session_name_or_id : session_name_or_id;
      [@ocaml.doc
        "The session identifier, or name of the session, that you want to evaluate. In Voice ID \
         integration, this is the Contact-Id.\n"]
}
[@@ocaml.doc ""]

type nonrec fraudster_registration_job_summary = {
  job_name : job_name option;
      [@ocaml.doc "The client-provided name for the fraudster registration job.\n"]
  job_id : job_id option;
      [@ocaml.doc "The service-generated identifier for the fraudster registration job.\n"]
  job_status : fraudster_registration_job_status option;
      [@ocaml.doc "The current status of the fraudster registration job.\n"]
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the fraudster registration job.\n"]
  created_at : timestamp option;
      [@ocaml.doc "A timestamp of when the fraudster registration job was created. \n"]
  ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when the fraudster registration job ended.\n"]
  failure_details : failure_details option;
      [@ocaml.doc
        "Contains details that are populated when an entire batch job fails. In cases of \
         individual registration job failures, the batch job as a whole doesn't fail; it is \
         completed with a [JobStatus] of [COMPLETED_WITH_ERRORS]. You can use the job output file \
         to identify the individual registration requests that failed.\n"]
  job_progress : job_progress option;
      [@ocaml.doc
        "Shows the completed percentage of registration requests listed in the input file.\n"]
}
[@@ocaml.doc "Contains a summary of information about a fraudster registration job.\n"]

type nonrec fraudster_registration_job_summaries = fraudster_registration_job_summary list
[@@ocaml.doc ""]

type nonrec fraudster_summary = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the fraudster summary.\n"]
  generated_fraudster_id : generated_fraudster_id option;
      [@ocaml.doc "The service-generated identifier for the fraudster.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp of when the fraudster summary was created.\n"]
  watchlist_ids : response_watchlist_ids option;
      [@ocaml.doc "The identifier of the watchlists the fraudster is a part of.\n"]
}
[@@ocaml.doc "Contains a summary of information about a fraudster. \n"]

type nonrec fraudster_summaries = fraudster_summary list [@@ocaml.doc ""]

type nonrec list_domains_response = {
  domain_summaries : domain_summaries option;
      [@ocaml.doc
        "A list containing details about each domain in the Amazon Web Services account.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results_for_list_domain_fe = int [@@ocaml.doc ""]

type nonrec list_domains_request = {
  max_results : max_results_for_list_domain_fe option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fraudster_registration_jobs_response = {
  job_summaries : fraudster_registration_job_summaries option;
      [@ocaml.doc "A list containing details about each specified fraudster registration job.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_for_list = int [@@ocaml.doc ""]

type nonrec list_fraudster_registration_jobs_request = {
  domain_id : domain_id;
      [@ocaml.doc "The identifier of the domain that contains the fraudster registration Jobs.\n"]
  job_status : fraudster_registration_job_status option;
      [@ocaml.doc "Provides the status of your fraudster registration job.\n"]
  max_results : max_results_for_list option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fraudsters_response = {
  fraudster_summaries : fraudster_summaries option;
      [@ocaml.doc
        "A list that contains details about each fraudster in the Amazon Web Services account. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec list_fraudsters_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain. \n"]
  watchlist_id : watchlist_id option;
      [@ocaml.doc
        "The identifier of the watchlist. If provided, all fraudsters in the watchlist are listed. \
         If not provided, all fraudsters in the domain are listed.\n"]
  max_results : max_results_for_list option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec speaker_enrollment_job_summary = {
  job_name : job_name option;
      [@ocaml.doc "The client-provided name for the speaker enrollment job.\n"]
  job_id : job_id option;
      [@ocaml.doc "The service-generated identifier for the speaker enrollment job.\n"]
  job_status : speaker_enrollment_job_status option;
      [@ocaml.doc "The current status of the speaker enrollment job.\n"]
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the speaker enrollment job.\n"]
  created_at : timestamp option;
      [@ocaml.doc "A timestamp of when of the speaker enrollment job was created.\n"]
  ended_at : timestamp option;
      [@ocaml.doc "A timestamp of when the speaker enrollment job ended.\n"]
  failure_details : failure_details option;
      [@ocaml.doc
        "Contains details that are populated when an entire batch job fails. In cases of \
         individual registration job failures, the batch job as a whole doesn't fail; it is \
         completed with a [JobStatus] of [COMPLETED_WITH_ERRORS]. You can use the job output file \
         to identify the individual registration requests that failed.\n"]
  job_progress : job_progress option;
      [@ocaml.doc
        "Provides details regarding job progress. This field shows the completed percentage of \
         enrollment requests listed in the input file.\n"]
}
[@@ocaml.doc "Contains a summary of information about a speaker enrollment job.\n"]

type nonrec speaker_enrollment_job_summaries = speaker_enrollment_job_summary list [@@ocaml.doc ""]

type nonrec list_speaker_enrollment_jobs_response = {
  job_summaries : speaker_enrollment_job_summaries option;
      [@ocaml.doc "A list containing details about each specified speaker enrollment job.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec list_speaker_enrollment_jobs_request = {
  domain_id : domain_id;
      [@ocaml.doc "The identifier of the domain that contains the speaker enrollment jobs.\n"]
  job_status : speaker_enrollment_job_status option;
      [@ocaml.doc "Provides the status of your speaker enrollment Job.\n"]
  max_results : max_results_for_list option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec speaker_summary = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the speaker.\n"]
  customer_speaker_id : customer_speaker_id option;
      [@ocaml.doc "The client-provided identifier for the speaker.\n"]
  generated_speaker_id : generated_speaker_id option;
      [@ocaml.doc "The service-generated identifier for the speaker. \n"]
  status : speaker_status option; [@ocaml.doc "The current status of the speaker.\n"]
  created_at : timestamp option; [@ocaml.doc "A timestamp showing the speaker's creation time. \n"]
  updated_at : timestamp option; [@ocaml.doc "A timestamp showing the speaker's last update.\n"]
  last_accessed_at : timestamp option;
      [@ocaml.doc
        "The timestamp when the speaker was last accessed for enrollment, re-enrollment or a \
         successful authentication. This timestamp is accurate to one hour.\n"]
}
[@@ocaml.doc "Contains a summary of information about a speaker.\n"]

type nonrec speaker_summaries = speaker_summary list [@@ocaml.doc ""]

type nonrec list_speakers_response = {
  speaker_summaries : speaker_summaries option;
      [@ocaml.doc
        "A list containing details about each speaker in the Amazon Web Services account. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec list_speakers_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain.\n"]
  max_results : max_results_for_list option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The list of tags associated with the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Voice ID resource for which you want to list the \
         tags.\n"]
}
[@@ocaml.doc ""]

type nonrec watchlist_summary = {
  domain_id : domain_id option;
      [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  watchlist_id : watchlist_id option; [@ocaml.doc "The identifier of the watchlist.\n"]
  name : watchlist_name option; [@ocaml.doc "The name for the watchlist.\n"]
  description : watchlist_description option; [@ocaml.doc "The description of the watchlist.\n"]
  default_watchlist : boolean_ option;
      [@ocaml.doc "Whether the specified watchlist is the default watchlist of a domain.\n"]
  created_at : timestamp option; [@ocaml.doc "The timestamp of when the watchlist was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The timestamp of when the watchlist was last updated.\n"]
}
[@@ocaml.doc "Contains a summary of information about a watchlist.\n"]

type nonrec watchlist_summaries = watchlist_summary list [@@ocaml.doc ""]

type nonrec list_watchlists_response = {
  watchlist_summaries : watchlist_summaries option;
      [@ocaml.doc
        "A list that contains details about each watchlist in the Amazon Web Services account. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec list_watchlists_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain.\n"]
  max_results : max_results_for_list option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [NextToken] to \
         obtain more pages of results. The default is 100; the maximum allowed page size is also \
         100. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec opt_out_speaker_response = {
  speaker : speaker option; [@ocaml.doc "Details about the opted-out speaker.\n"]
}
[@@ocaml.doc ""]

type nonrec opt_out_speaker_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the speaker.\n"]
  speaker_id : speaker_id; [@ocaml.doc "The identifier of the speaker you want opted-out.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fraudster_registration_job_response = {
  job : fraudster_registration_job option;
      [@ocaml.doc "Details about the started fraudster registration job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fraudster_registration_job_request = {
  client_token : client_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If not provided, the Amazon Web Services SDK populates this field. For more \
         information about idempotency, see \
         {{:https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/}Making \
         retries safe with idempotent APIs}.\n"]
  job_name : job_name option; [@ocaml.doc "The name of the new fraudster registration job.\n"]
  domain_id : domain_id;
      [@ocaml.doc
        "The identifier of the domain that contains the fraudster registration job and in which \
         the fraudsters are registered.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access \
         customer's buckets to read the input manifest file and write the Job output file. Refer \
         to the \
         {{:https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-fraudster-watchlist.html}Create \
         and edit a fraudster watchlist} documentation for the permissions needed in this role.\n"]
  registration_config : registration_config option;
      [@ocaml.doc
        "The registration config containing details such as the action to take when a duplicate \
         fraudster is detected, and the similarity threshold to use for detecting a duplicate \
         fraudster. \n"]
  input_data_config : input_data_config;
      [@ocaml.doc
        "The input data config containing an S3 URI for the input manifest file that contains the \
         list of fraudster registration requests.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc
        "The output data config containing the S3 location where Voice ID writes the job output \
         file; you must also include a KMS key ID to encrypt the file.\n"]
}
[@@ocaml.doc ""]

type nonrec start_speaker_enrollment_job_response = {
  job : speaker_enrollment_job option;
      [@ocaml.doc "Details about the started speaker enrollment job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_speaker_enrollment_job_request = {
  client_token : client_token_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If not provided, the Amazon Web Services SDK populates this field. For more \
         information about idempotency, see \
         {{:https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/}Making \
         retries safe with idempotent APIs}.\n"]
  job_name : job_name option; [@ocaml.doc "A name for your speaker enrollment job.\n"]
  domain_id : domain_id;
      [@ocaml.doc
        "The identifier of the domain that contains the speaker enrollment job and in which the \
         speakers are enrolled. \n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access \
         customer's buckets to read the input manifest file and write the job output file. Refer \
         to \
         {{:https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-batch-enrollment.html}Batch \
         enrollment using audio data from prior calls} for the permissions needed in this role.\n"]
  enrollment_config : enrollment_config option;
      [@ocaml.doc
        "The enrollment config that contains details such as the action to take when a speaker is \
         already enrolled in Voice ID or when a speaker is identified as a fraudster.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc
        "The input data config containing the S3 location for the input manifest file that \
         contains the list of speaker enrollment requests.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc
        "The output data config containing the S3 location where Voice ID writes the job output \
         file; you must also include a KMS key ID to encrypt the file.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Voice ID resource you want to tag.\n"]
  tags : tag_list; [@ocaml.doc "The list of tags to assign to the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Voice ID resource you want to remove tags from.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "The list of tag keys you want to remove from the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec update_domain_response = {
  domain : domain option; [@ocaml.doc "Details about the updated domain\n"]
}
[@@ocaml.doc ""]

type nonrec update_domain_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain to be updated.\n"]
  name : domain_name; [@ocaml.doc "The name of the domain.\n"]
  description : description option; [@ocaml.doc "A brief description about this domain.\n"]
  server_side_encryption_configuration : server_side_encryption_configuration;
      [@ocaml.doc
        "The configuration, containing the KMS key identifier, to be used by Voice ID for the \
         server-side encryption of your data. Changing the domain's associated KMS key immediately \
         triggers an asynchronous process to remove dependency on the old KMS key, such that the \
         domain's data can only be accessed using the new KMS key. The domain's \
         [ServerSideEncryptionUpdateDetails] contains the details for this process.\n"]
}
[@@ocaml.doc ""]

type nonrec update_watchlist_response = {
  watchlist : watchlist option; [@ocaml.doc "Details about the updated watchlist.\n"]
}
[@@ocaml.doc ""]

type nonrec update_watchlist_request = {
  domain_id : domain_id; [@ocaml.doc "The identifier of the domain that contains the watchlist.\n"]
  watchlist_id : watchlist_id; [@ocaml.doc "The identifier of the watchlist to be updated.\n"]
  name : watchlist_name option; [@ocaml.doc "The name of the watchlist.\n"]
  description : watchlist_description option;
      [@ocaml.doc "A brief description about this watchlist.\n"]
}
[@@ocaml.doc ""]
