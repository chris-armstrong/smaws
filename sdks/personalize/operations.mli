open Types

module CreateBatchInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_inference_job_request ->
    ( create_batch_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_inference_job_request ->
    ( create_batch_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates batch recommendations based on a list of items or users stored in Amazon S3 and \
   exports the recommendations to an Amazon S3 bucket.\n\n\
  \ To generate batch recommendations, specify the ARN of a solution version and an Amazon S3 URI \
   for the input and output data. For user personalization, popular items, and personalized \
   ranking solutions, the batch inference job generates a list of recommended items for each user \
   ID in the input file. For related items solutions, the job generates a list of recommended \
   items for each item ID in the input file.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/getting-batch-recommendations.html}Creating \
   a batch inference job }.\n\
  \  \n\
  \    If you use the Similar-Items recipe, Amazon Personalize can add descriptive themes to batch \
   recommendations. To generate themes, set the job's mode to [THEME_GENERATION] and specify the \
   name of the field that contains item names in the input data.\n\
  \   \n\
  \     For more information about generating themes, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/themed-batch-recommendations.html}Batch \
   recommendations with themes from Content Generator }. \n\
  \    \n\
  \     You can't get batch recommendations with the Trending-Now or Next-Best-Action recipes.\n\
  \     "]

module CreateBatchSegmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_segment_job_request ->
    ( create_batch_segment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_segment_job_request ->
    ( create_batch_segment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a batch segment job. The operation can handle up to 50 million records and the input \
   file must be in JSON format. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/recommendations-batch.html}Getting batch \
   recommendations and user segments}.\n"]

module CreateCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_campaign_request ->
    ( create_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_campaign_request ->
    ( create_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  You incur campaign costs while it is active. To avoid unnecessary costs, make sure to delete \
   the campaign when you are finished. For information about campaign costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \ \n\
  \   Creates a campaign that deploys a solution version. When a client calls the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   and \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html}GetPersonalizedRanking} \
   APIs, a campaign is specified in the request.\n\
  \   \n\
  \     {b Minimum Provisioned TPS and Auto-Scaling} \n\
  \    \n\
  \       A high [minProvisionedTPS] will increase your cost. We recommend starting with 1 for \
   [minProvisionedTPS] (the default). Track your usage using Amazon CloudWatch metrics, and \
   increase the [minProvisionedTPS] as necessary.\n\
  \      \n\
  \         When you create an Amazon Personalize campaign, you can specify the minimum \
   provisioned transactions per second ([minProvisionedTPS]) for the campaign. This is the \
   baseline transaction throughput for the campaign provisioned by Amazon Personalize. It sets the \
   minimum billing charge for the campaign while it is active. A transaction is a single \
   [GetRecommendations] or [GetPersonalizedRanking] request. The default [minProvisionedTPS] is 1.\n\
  \        \n\
  \          If your TPS increases beyond the [minProvisionedTPS], Amazon Personalize auto-scales \
   the provisioned capacity up and down, but never below [minProvisionedTPS]. There's a short time \
   delay while the capacity is increased that might cause loss of transactions. When your traffic \
   reduces, capacity returns to the [minProvisionedTPS]. \n\
  \         \n\
  \          You are charged for the the minimum provisioned TPS or, if your requests exceed the \
   [minProvisionedTPS], the actual TPS. The actual TPS is the total number of recommendation \
   requests you make. We recommend starting with a low [minProvisionedTPS], track your usage using \
   Amazon CloudWatch metrics, and then increase the [minProvisionedTPS] as necessary.\n\
  \          \n\
  \           For more information about campaign costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \           \n\
  \             {b Status} \n\
  \            \n\
  \             A campaign can be in one of the following states:\n\
  \             \n\
  \              {ul\n\
  \                    {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                        \n\
  \                         }\n\
  \                    {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                        \n\
  \                         }\n\
  \                    }\n\
  \   To get the campaign status, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign}.\n\
  \   \n\
  \     Wait until the [status] of the campaign is [ACTIVE] before asking the campaign for \
   recommendations.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html}ListCampaigns} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateCampaign.html}UpdateCampaign} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteCampaign.html}DeleteCampaign} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateDataDeletionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_deletion_job_request ->
    ( create_data_deletion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_deletion_job_request ->
    ( create_data_deletion_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a batch job that deletes all references to specific users from an Amazon Personalize \
   dataset group in batches. You specify the users to delete in a CSV file of userIds in an Amazon \
   S3 bucket. After a job completes, Amazon Personalize no longer trains on the users\226\128\153 \
   data and no longer considers the users when generating user segments. For more information \
   about creating a data deletion job, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html}Deleting users}.\n\n\
  \ {ul\n\
  \       {-  Your input file must be a CSV file with a single USER_ID column that lists the users \
   IDs. For more information about preparing the CSV file, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/prepare-deletion-input-file.html}Preparing \
   your data deletion file and uploading it to Amazon S3}.\n\
  \           \n\
  \            }\n\
  \       {-  To give Amazon Personalize permission to access your input CSV file of userIds, you \
   must specify an IAM service role that has permission to read from the data source. This role \
   needs [GetObject] and [ListBucket] permissions for the bucket and its content. These \
   permissions are the same as importing data. For information on granting access to your Amazon \
   S3 bucket, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html}Giving \
   Amazon Personalize Access to Amazon S3 Resources}. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    After you create a job, it can take up to a day to delete all references to the users from \
   datasets and models. Until the job completes, Amazon Personalize continues to use the data when \
   training. And if you use a User Segmentation recipe, the users might appear in user segments. \n\
  \   \n\
  \     {b Status} \n\
  \    \n\
  \     A data deletion job can have one of the following statuses:\n\
  \     \n\
  \      {ul\n\
  \            {-  PENDING > IN_PROGRESS > COMPLETED -or- FAILED\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   To get the status of the data deletion job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html}DescribeDataDeletionJob} \
   API operation and specify the Amazon Resource Name (ARN) of the job. If the status is FAILED, \
   the response includes a [failureReason] key, which describes why the job failed.\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDataDeletionJobs.html}ListDataDeletionJobs} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html}DescribeDataDeletionJob} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty dataset and adds it to the specified dataset group. Use \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   to import your training data to a dataset.\n\n\
  \ There are 5 types of datasets:\n\
  \ \n\
  \  {ul\n\
  \        {-  Item interactions\n\
  \            \n\
  \             }\n\
  \        {-  Items\n\
  \            \n\
  \             }\n\
  \        {-  Users\n\
  \            \n\
  \             }\n\
  \        {-  Action interactions\n\
  \            \n\
  \             }\n\
  \        {-  Actions\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Each dataset type has an associated schema with required field types. Only the [Item \
   interactions] dataset is required in order to train a model (also referred to as creating a \
   solution).\n\
  \   \n\
  \    A dataset can be in one of the following states:\n\
  \    \n\
  \     {ul\n\
  \           {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \               \n\
  \                }\n\
  \           {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To get the status of the dataset, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html}DescribeDataset}.\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasets.html}ListDatasets} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html}DescribeDataset} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDataset.html}DeleteDataset} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module CreateDatasetExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_export_job_request ->
    ( create_dataset_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_export_job_request ->
    ( create_dataset_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a job that exports data from your dataset to an Amazon S3 bucket. To allow Amazon \
   Personalize to export the training data, you must specify an service-linked IAM role that gives \
   Amazon Personalize [PutObject] permissions for your Amazon S3 bucket. For information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/export-data.html}Exporting a dataset} in \
   the Amazon Personalize developer guide. \n\n\
  \  {b Status} \n\
  \ \n\
  \  A dataset export job can be in one of the following states:\n\
  \  \n\
  \   {ul\n\
  \         {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    To get the status of the export job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html}DescribeDatasetExportJob}, \
   and specify the Amazon Resource Name (ARN) of the dataset export job. The dataset export is \
   complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response \
   includes a [failureReason] key, which describes why the job failed. \n\
  \   "]

module CreateDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty dataset group. A dataset group is a container for Amazon Personalize \
   resources. A dataset group can contain at most three datasets, one for each type of dataset:\n\n\
  \ {ul\n\
  \       {-  Item interactions\n\
  \           \n\
  \            }\n\
  \       {-  Items\n\
  \           \n\
  \            }\n\
  \       {-  Users\n\
  \           \n\
  \            }\n\
  \       {-  Actions\n\
  \           \n\
  \            }\n\
  \       {-  Action interactions\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    A dataset group can be a Domain dataset group, where you specify a domain and use \
   pre-configured resources like recommenders, or a Custom dataset group, where you use custom \
   resources, such as a solution with a solution version, that you deploy with a campaign. If you \
   start with a Domain dataset group, you can still add custom resources such as solutions and \
   solution versions trained with recipes for custom use cases and deployed with campaigns. \n\
  \   \n\
  \    A dataset group can be in one of the following states:\n\
  \    \n\
  \     {ul\n\
  \           {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \               \n\
  \                }\n\
  \           {-  DELETE PENDING\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To get the status of the dataset group, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup}. \
   If the status shows as CREATE FAILED, the response includes a [failureReason] key, which \
   describes why the creation failed.\n\
  \   \n\
  \     You must wait until the [status] of the dataset group is [ACTIVE] before adding a dataset \
   to the group.\n\
  \     \n\
  \       You can specify an Key Management Service (KMS) key to encrypt the datasets in the \
   group. If you specify a KMS key, you must also include an Identity and Access Management (IAM) \
   role that has permission to access the key.\n\
  \       \n\
  \         {b APIs that require a dataset group ARN in the request} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \    {b Related APIs} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetGroups.html}ListDatasetGroups} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDatasetGroup.html}DeleteDatasetGroup} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_import_job_request ->
    ( create_dataset_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_import_job_request ->
    ( create_dataset_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a job that imports training data from your data source (an Amazon S3 bucket) to an \
   Amazon Personalize dataset. To allow Amazon Personalize to import the training data, you must \
   specify an IAM service role that has permission to read from the data source, as Amazon \
   Personalize makes a copy of your data and processes it internally. For information on granting \
   access to your Amazon S3 bucket, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html}Giving \
   Amazon Personalize Access to Amazon S3 Resources}. \n\n\
  \ If you already created a recommender or deployed a custom solution version with a campaign, \
   how new bulk records influence recommendations depends on the domain use case or recipe that \
   you use. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/how-new-data-influences-recommendations.html}How \
   new data influences real-time recommendations}.\n\
  \ \n\
  \   By default, a dataset import job replaces any existing data in the dataset that you imported \
   in bulk. To add new records without replacing existing data, specify INCREMENTAL for the import \
   mode in the CreateDatasetImportJob operation.\n\
  \   \n\
  \      {b Status} \n\
  \     \n\
  \      A dataset import job can be in one of the following states:\n\
  \      \n\
  \       {ul\n\
  \             {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   To get the status of the import job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob}, \
   providing the Amazon Resource Name (ARN) of the dataset import job. The dataset import is \
   complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response \
   includes a [failureReason] key, which describes why the job failed.\n\
  \   \n\
  \     Importing takes time. You must wait until the status shows as ACTIVE before training a \
   model using the dataset.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetImportJobs.html}ListDatasetImportJobs} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_tracker_request ->
    ( create_event_tracker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_tracker_request ->
    ( create_event_tracker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an event tracker that you use when adding event data to a specified dataset group using \
   the {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
   API.\n\n\
  \  Only one event tracker can be associated with a dataset group. You will get an error if you \
   call [CreateEventTracker] using the same dataset group as an existing event tracker.\n\
  \  \n\
  \    When you create an event tracker, the response includes a tracking ID, which you pass as a \
   parameter when you use the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
   operation. Amazon Personalize then appends the event data to the Item interactions dataset of \
   the dataset group you specify in your event tracker. \n\
  \    \n\
  \     The event tracker can be in one of the following states:\n\
  \     \n\
  \      {ul\n\
  \            {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                \n\
  \                 }\n\
  \            {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   To get the status of the event tracker, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html}DescribeEventTracker}.\n\
  \   \n\
  \     The event tracker must be in the ACTIVE state before using the tracking ID.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListEventTrackers.html}ListEventTrackers} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html}DescribeEventTracker} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteEventTracker.html}DeleteEventTracker} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_filter_request ->
    ( create_filter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_filter_request ->
    ( create_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a recommendation filter. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/filter.html}Filtering recommendations and \
   user segments}.\n"]

module CreateMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_metric_attribution_request ->
    ( create_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_metric_attribution_request ->
    ( create_metric_attribution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a metric attribution. A metric attribution creates reports on the data that you import \
   into Amazon Personalize. Depending on how you imported the data, you can view reports in Amazon \
   CloudWatch or Amazon S3. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html}Measuring \
   impact of recommendations}.\n"]

module CreateRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_recommender_request ->
    ( create_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_recommender_request ->
    ( create_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a recommender with the recipe (a Domain dataset group use case) you specify. You create \
   recommenders for a Domain dataset group and specify the recommender's Amazon Resource Name \
   (ARN) when you make a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request. \n\n\
  \  {b Minimum recommendation requests per second} \n\
  \ \n\
  \   A high [minRecommendationRequestsPerSecond] will increase your bill. We recommend starting \
   with 1 for [minRecommendationRequestsPerSecond] (the default). Track your usage using Amazon \
   CloudWatch metrics, and increase the [minRecommendationRequestsPerSecond] as necessary.\n\
  \   \n\
  \     When you create a recommender, you can configure the recommender's minimum recommendation \
   requests per second. The minimum recommendation requests per second \
   ([minRecommendationRequestsPerSecond]) specifies the baseline recommendation request throughput \
   provisioned by Amazon Personalize. The default minRecommendationRequestsPerSecond is [1]. A \
   recommendation request is a single [GetRecommendations] operation. Request throughput is \
   measured in requests per second and Amazon Personalize uses your requests per second to derive \
   your requests per hour and the price of your recommender usage. \n\
  \     \n\
  \       If your requests per second increases beyond [minRecommendationRequestsPerSecond], \
   Amazon Personalize auto-scales the provisioned capacity up and down, but never below \
   [minRecommendationRequestsPerSecond]. There's a short time delay while the capacity is \
   increased that might cause loss of requests.\n\
  \      \n\
  \        Your bill is the greater of either the minimum requests per hour (based on \
   minRecommendationRequestsPerSecond) or the actual number of requests. The actual request \
   throughput used is calculated as the average requests/second within a one-hour window. We \
   recommend starting with the default [minRecommendationRequestsPerSecond], track your usage \
   using Amazon CloudWatch metrics, and then increase the [minRecommendationRequestsPerSecond] as \
   necessary. \n\
  \       \n\
  \         {b Status} \n\
  \        \n\
  \         A recommender can be in one of the following states:\n\
  \         \n\
  \          {ul\n\
  \                {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                    \n\
  \                     }\n\
  \                {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START \
   IN_PROGRESS > ACTIVE\n\
  \                    \n\
  \                     }\n\
  \                {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                    \n\
  \                     }\n\
  \                }\n\
  \   To get the recommender status, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender}.\n\
  \   \n\
  \     Wait until the [status] of the recommender is [ACTIVE] before asking the recommender for \
   recommendations.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListRecommenders.html}ListRecommenders} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateRecommender.html}UpdateRecommender} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteRecommender.html}DeleteRecommender} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_schema_request ->
    ( create_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_schema_request ->
    ( create_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Personalize schema from the specified schema string. The schema you create \
   must be in Avro JSON format.\n\n\
  \ Amazon Personalize recognizes three schema variants. Each schema is associated with a dataset \
   type and has a set of required field and keywords. If you are creating a schema for a dataset \
   in a Domain dataset group, you provide the domain of the Domain dataset group. You specify a \
   schema when you call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n\
  \ \n\
  \   {b Related APIs} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSchemas.html}ListSchemas} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html}DescribeSchema} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSchema.html}DeleteSchema} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_solution_request ->
    ( create_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_solution_request ->
    ( create_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " By default, all new solutions use automatic training. With automatic training, you incur \
   training costs while your solution is active. To avoid unnecessary costs, when you are finished \
   you can {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateSolution.html}update the \
   solution} to turn off automatic training. For information about training costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \ \n\
  \   Creates the configuration for training a model (creating a solution version). This \
   configuration includes the recipe to use for model training and optional training \
   configuration, such as columns to use in training and feature transformation parameters. For \
   more information about configuring a solution, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html}Creating \
   and configuring a solution}. \n\
  \   \n\
  \     By default, new solutions use automatic training to create solution versions every 7 days. \
   You can change the training frequency. Automatic solution version creation starts within one \
   hour after the solution is ACTIVE. If you manually create a solution version within the hour, \
   the solution skips the first automatic training. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html}Configuring \
   automatic training}.\n\
  \    \n\
  \      To turn off automatic training, set [performAutoTraining] to false. If you turn off \
   automatic training, you must manually create a solution version by calling the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html}CreateSolutionVersion} \
   operation.\n\
  \     \n\
  \      After training starts, you can get the solution version's Amazon Resource Name (ARN) with \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \
   API operation. To get its status, use the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \n\
  \      \n\
  \       After training completes you can evaluate model accuracy by calling \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_GetSolutionMetrics.html}GetSolutionMetrics}. \
   When you are satisfied with the solution version, you deploy it using \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}. \
   The campaign provides recommendations to a client through the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   API.\n\
  \       \n\
  \         Amazon Personalize doesn't support configuring the [hpoObjective] for solution \
   hyperparameter optimization at this time.\n\
  \         \n\
  \            {b Status} \n\
  \           \n\
  \            A solution can be in one of the following states:\n\
  \            \n\
  \             {ul\n\
  \                   {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                       \n\
  \                        }\n\
  \                   {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                       \n\
  \                        }\n\
  \                   }\n\
  \   To get the status of the solution, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution}. \
   If you use manual training, the status must be ACTIVE before you call [CreateSolutionVersion].\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateSolution.html}UpdateSolution} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html}ListSolutions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html}CreateSolutionVersion} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html}DeleteSolution} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateSolutionVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_solution_version_request ->
    ( create_solution_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_solution_version_request ->
    ( create_solution_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Trains or retrains an active solution in a Custom dataset group. A solution is created using \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \
   operation and must be in the ACTIVE state before calling [CreateSolutionVersion]. A new version \
   of the solution is created every time you call this operation.\n\n\
  \  {b Status} \n\
  \ \n\
  \  A solution version can be in one of the following states:\n\
  \  \n\
  \   {ul\n\
  \         {-  CREATE PENDING\n\
  \             \n\
  \              }\n\
  \         {-  CREATE IN_PROGRESS\n\
  \             \n\
  \              }\n\
  \         {-  ACTIVE\n\
  \             \n\
  \              }\n\
  \         {-  CREATE FAILED\n\
  \             \n\
  \              }\n\
  \         {-  CREATE STOPPING\n\
  \             \n\
  \              }\n\
  \         {-  CREATE STOPPED\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To get the status of the version, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \
   Wait until the status shows as ACTIVE before calling [CreateCampaign].\n\
  \   \n\
  \    If the status shows as CREATE FAILED, the response includes a [failureReason] key, which \
   describes why the job failed.\n\
  \    \n\
  \      {b Related APIs} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html}ListSolutions} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html}DeleteSolution} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module DeleteCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_campaign_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_campaign_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a campaign by deleting the solution deployment. The solution that the campaign is based \
   on is not deleted and can be redeployed when needed. A deleted campaign can no longer be \
   specified in a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request. For information on creating campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n"]

module DeleteDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a dataset. You can't delete a dataset if an associated [DatasetImportJob] or \
   [SolutionVersion] is in the CREATE PENDING or IN PROGRESS state. For more information about \
   deleting datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-dataset.html}Deleting a dataset}. \n"]

module DeleteDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a dataset group. Before you delete a dataset group, you must delete the following:\n\n\
  \ {ul\n\
  \       {-  All associated event trackers.\n\
  \           \n\
  \            }\n\
  \       {-  All associated solutions.\n\
  \           \n\
  \            }\n\
  \       {-  All datasets in the dataset group.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeleteEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_tracker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_tracker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the event tracker. Does not delete the dataset from the dataset group. For more \
   information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module DeleteFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a filter.\n"]

module DeleteMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_attribution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_attribution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a metric attribution.\n"]

module DeleteRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_recommender_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_recommender_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates and removes a recommender. A deleted recommender can no longer be specified in a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request.\n"]

module DeleteSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a schema. Before deleting a schema, you must delete all datasets referencing the \
   schema. For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module DeleteSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_solution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_solution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes all versions of a solution and the [Solution] object itself. Before deleting a \
   solution, you must delete all campaigns based on the solution. To determine what campaigns are \
   using the solution, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html}ListCampaigns} and \
   supply the Amazon Resource Name (ARN) of the solution. You can't delete a solution if an \
   associated [SolutionVersion] is in the CREATE PENDING or IN PROGRESS state. For more \
   information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module DescribeAlgorithm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_request ->
    ( describe_algorithm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_request ->
    ( describe_algorithm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the given algorithm.\n"]

module DescribeBatchInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_inference_job_request ->
    ( describe_batch_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_inference_job_request ->
    ( describe_batch_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), \
   status, input and output configurations, and the ARN of the solution version used to generate \
   the recommendations.\n"]

module DescribeBatchSegmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_segment_job_request ->
    ( describe_batch_segment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_segment_job_request ->
    ( describe_batch_segment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties of a batch segment job including name, Amazon Resource Name (ARN), status, \
   input and output configurations, and the ARN of the solution version used to generate segments.\n"]

module DescribeCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_campaign_request ->
    ( describe_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_campaign_request ->
    ( describe_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given campaign, including its status.\n\n\
  \ A campaign can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When the [status] is [CREATE FAILED], the response includes the [failureReason] key, which \
   describes why.\n\
  \   \n\
  \    For more information on campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n\
  \    "]

module DescribeDataDeletionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_deletion_job_request ->
    ( describe_data_deletion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_deletion_job_request ->
    ( describe_data_deletion_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the data deletion job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataDeletionJob.html}CreateDataDeletionJob}, \
   including the job status.\n"]

module DescribeDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given dataset. For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module DescribeDatasetExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_export_job_request ->
    ( describe_dataset_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_export_job_request ->
    ( describe_dataset_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the dataset export job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html}CreateDatasetExportJob}, \
   including the export job status.\n"]

module DescribeDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_group_request ->
    ( describe_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_group_request ->
    ( describe_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given dataset group. For more information on dataset groups, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup}.\n"]

module DescribeDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_import_job_request ->
    ( describe_dataset_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_import_job_request ->
    ( describe_dataset_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the dataset import job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob}, \
   including the import job status.\n"]

module DescribeEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_tracker_request ->
    ( describe_event_tracker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_tracker_request ->
    ( describe_event_tracker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes an event tracker. The response includes the [trackingId] and [status] of the event \
   tracker. For more information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module DescribeFeatureTransformation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_transformation_request ->
    ( describe_feature_transformation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_transformation_request ->
    ( describe_feature_transformation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the given feature transformation.\n"]

module DescribeFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_filter_request ->
    ( describe_filter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_filter_request ->
    ( describe_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a filter's properties.\n"]

module DescribeMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_attribution_request ->
    ( describe_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_attribution_request ->
    ( describe_metric_attribution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a metric attribution.\n"]

module DescribeRecipe : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recipe_request ->
    ( describe_recipe_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recipe_request ->
    ( describe_recipe_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a recipe.\n\n\
  \ A recipe contains three items:\n\
  \ \n\
  \  {ul\n\
  \        {-  An algorithm that trains a model.\n\
  \            \n\
  \             }\n\
  \        {-  Hyperparameters that govern the training.\n\
  \            \n\
  \             }\n\
  \        {-  Feature transformation information for modifying the input data before training.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Amazon Personalize provides a set of predefined recipes. You specify a recipe when you \
   create a solution with the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \
   API. [CreateSolution] trains a model by using the algorithm in the specified recipe and a \
   training dataset. The solution, when deployed as a campaign, can provide recommendations using \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   API.\n\
  \   "]

module DescribeRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommender_request ->
    ( describe_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommender_request ->
    ( describe_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given recommender, including its status.\n\n\
  \ A recommender can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START IN_PROGRESS > \
   ACTIVE\n\
  \            \n\
  \             }\n\
  \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When the [status] is [CREATE FAILED], the response includes the [failureReason] key, which \
   describes why.\n\
  \   \n\
  \    The [modelMetrics] key is null when the recommender is being created or deleted.\n\
  \    \n\
  \     For more information on recommenders, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html}CreateRecommender}.\n\
  \     "]

module DescribeSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_schema_request ->
    ( describe_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_schema_request ->
    ( describe_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a schema. For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module DescribeSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_request ->
    ( describe_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_request ->
    ( describe_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a solution. For more information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module DescribeSolutionVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_version_request ->
    ( describe_solution_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_version_request ->
    ( describe_solution_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a specific version of a solution. For more information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n"]

module GetSolutionMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_solution_metrics_request ->
    ( get_solution_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_solution_metrics_request ->
    ( get_solution_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the metrics for the specified solution version.\n"]

module ListBatchInferenceJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_batch_inference_jobs_request ->
    ( list_batch_inference_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_batch_inference_jobs_request ->
    ( list_batch_inference_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the batch inference jobs that have been performed off of a solution version.\n"]

module ListBatchSegmentJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_batch_segment_jobs_request ->
    ( list_batch_segment_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_batch_segment_jobs_request ->
    ( list_batch_segment_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the batch segment jobs that have been performed off of a solution version that \
   you specify.\n"]

module ListCampaigns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_campaigns_request ->
    ( list_campaigns_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_campaigns_request ->
    ( list_campaigns_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of campaigns that use the given solution. When a solution is not specified, all \
   the campaigns associated with the account are listed. The response provides the properties for \
   each campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n"]

module ListDataDeletionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_deletion_jobs_request ->
    ( list_data_deletion_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_deletion_jobs_request ->
    ( list_data_deletion_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of data deletion jobs for a dataset group ordered by creation time, with the \
   most recent first. When a dataset group is not specified, all the data deletion jobs associated \
   with the account are listed. The response provides the properties for each job, including the \
   Amazon Resource Name (ARN). For more information on data deletion jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html}Deleting users}.\n"]

module ListDatasetExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_export_jobs_request ->
    ( list_dataset_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_export_jobs_request ->
    ( list_dataset_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset export jobs that use the given dataset. When a dataset is not \
   specified, all the dataset export jobs associated with the account are listed. The response \
   provides the properties for each dataset export job, including the Amazon Resource Name (ARN). \
   For more information on dataset export jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html}CreateDatasetExportJob}. \
   For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module ListDatasetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_groups_request ->
    ( list_dataset_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_groups_request ->
    ( list_dataset_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset groups. The response provides the properties for each dataset group, \
   including the Amazon Resource Name (ARN). For more information on dataset groups, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup}.\n"]

module ListDatasetImportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_import_jobs_request ->
    ( list_dataset_import_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_import_jobs_request ->
    ( list_dataset_import_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset import jobs that use the given dataset. When a dataset is not \
   specified, all the dataset import jobs associated with the account are listed. The response \
   provides the properties for each dataset import job, including the Amazon Resource Name (ARN). \
   For more information on dataset import jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob}. \
   For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module ListDatasets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of datasets contained in the given dataset group. The response provides the \
   properties for each dataset, including the Amazon Resource Name (ARN). For more information on \
   datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module ListEventTrackers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_trackers_request ->
    ( list_event_trackers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_trackers_request ->
    ( list_event_trackers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of event trackers associated with the account. The response provides the \
   properties for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. \
   For more information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module ListFilters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_filters_request ->
    ( list_filters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_filters_request ->
    ( list_filters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all filters that belong to a given dataset group.\n"]

module ListMetricAttributionMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attribution_metrics_request ->
    ( list_metric_attribution_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attribution_metrics_request ->
    ( list_metric_attribution_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the metrics for the metric attribution.\n"]

module ListMetricAttributions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attributions_request ->
    ( list_metric_attributions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attributions_request ->
    ( list_metric_attributions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists metric attributions.\n"]

module ListRecipes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recipes_request ->
    ( list_recipes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recipes_request ->
    ( list_recipes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of available recipes. The response provides the properties for each recipe, \
   including the recipe's Amazon Resource Name (ARN).\n"]

module ListRecommenders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommenders_request ->
    ( list_recommenders_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommenders_request ->
    ( list_recommenders_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of recommenders in a given Domain dataset group. When a Domain dataset group is \
   not specified, all the recommenders associated with the account are listed. The response \
   provides the properties for each recommender, including the Amazon Resource Name (ARN). For \
   more information on recommenders, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html}CreateRecommender}.\n"]

module ListSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of schemas associated with the account. The response provides the properties \
   for each schema, including the Amazon Resource Name (ARN). For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module ListSolutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_solutions_request ->
    ( list_solutions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_solutions_request ->
    ( list_solutions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of solutions in a given dataset group. When a dataset group is not specified, \
   all the solutions associated with the account are listed. The response provides the properties \
   for each solution, including the Amazon Resource Name (ARN). For more information on solutions, \
   see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module ListSolutionVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_solution_versions_request ->
    ( list_solution_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_solution_versions_request ->
    ( list_solution_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of solution versions for the given solution. When a solution is not specified, \
   all the solution versions associated with the account are listed. The response provides the \
   properties for each solution version, including the Amazon Resource Name (ARN).\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get a list of {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} \
   attached to a resource.\n"]

module StartRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_recommender_request ->
    ( start_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_recommender_request ->
    ( start_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a recommender that is INACTIVE. Starting a recommender does not create any new models, \
   but resumes billing and automatic retraining for the recommender.\n"]

module StopRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_recommender_request ->
    ( stop_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_recommender_request ->
    ( stop_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a recommender that is ACTIVE. Stopping a recommender halts billing and automatic \
   retraining for the recommender.\n"]

module StopSolutionVersionCreation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_solution_version_creation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_solution_version_creation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops creating a solution version that is in a state of CREATE_PENDING or CREATE IN_PROGRESS. \n\n\
  \ Depending on the current state of the solution version, the solution version state changes as \
   follows:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE_PENDING > CREATE_STOPPED\n\
  \            \n\
  \             or\n\
  \             \n\
  \              }\n\
  \        {-  CREATE_IN_PROGRESS > CREATE_STOPPING > CREATE_STOPPED\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You are billed for all of the training completed up until you stop the solution version \
   creation. You cannot resume creating a solution version once it has been stopped.\n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Add a list of tags to a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagKeysException of too_many_tag_keys_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags that are attached to a resource. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/tags-remove.html}Removing tags from Amazon \
   Personalize resources}.\n"]

module UpdateCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_campaign_request ->
    ( update_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_campaign_request ->
    ( update_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates a campaign to deploy a retrained solution version with an existing campaign, change \
   your campaign's [minProvisionedTPS], or modify your campaign's configuration. For example, you \
   can set [enableMetadataWithRecommendations] to true for an existing campaign.\n\n\
  \  To update a campaign to start automatically using the latest solution version, specify the \
   following:\n\
  \ \n\
  \  {ul\n\
  \        {-  For the [SolutionVersionArn] parameter, specify the Amazon Resource Name (ARN) of \
   your solution in [SolutionArn/$LATEST] format. \n\
  \            \n\
  \             }\n\
  \        {-   In the [campaignConfig], set [syncWithLatestSolutionVersion] to [true]. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check the \
   campaign status using the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \
   operation.\n\
  \   \n\
  \     You can still get recommendations from a campaign while an update is in progress. The \
   campaign will use the previous solution version and campaign configuration to generate \
   recommendations until the latest campaign update status is [Active]. \n\
  \     \n\
  \       For more information about updating a campaign, including code samples, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/update-campaigns.html}Updating a \
   campaign}. For more information about campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html}Creating a campaign}.\n\
  \       "]

module UpdateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_request ->
    ( update_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_request ->
    ( update_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a dataset to replace its schema with a new or existing one. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/updating-dataset-schema.html}Replacing a \
   dataset's schema}. \n"]

module UpdateMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_metric_attribution_request ->
    ( update_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_metric_attribution_request ->
    ( update_metric_attribution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a metric attribution.\n"]

module UpdateRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_recommender_request ->
    ( update_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_recommender_request ->
    ( update_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the recommender to modify the recommender configuration. If you update the recommender \
   to modify the columns used in training, Amazon Personalize automatically starts a full \
   retraining of the models backing your recommender. While the update completes, you can still \
   get recommendations from the recommender. The recommender uses the previous configuration until \
   the update completes. To track the status of this update, use the [latestRecommenderUpdate] \
   returned in the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender} \
   operation. \n"]

module UpdateSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_solution_request ->
    ( update_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_solution_request ->
    ( update_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an Amazon Personalize solution to use a different automatic training configuration. \
   When you update a solution, you can change whether the solution uses automatic training, and \
   you can change the training frequency. For more information about updating a solution, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/updating-solution.html}Updating a \
   solution}.\n\n\
  \ A solution update can be in one of the following states:\n\
  \ \n\
  \  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \  \n\
  \   To get the status of a solution update, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \
   API operation and find the status in the [latestSolutionUpdate]. \n\
  \   "]
