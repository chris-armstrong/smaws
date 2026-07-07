type nonrec arn = string [@@ocaml.doc ""]

type nonrec update_solution_response = {
  solution_arn : arn option;
      [@ocaml.doc "The same solution Amazon Resource Name (ARN) as given in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec perform_auto_training = bool [@@ocaml.doc ""]

type nonrec perform_incremental_update = bool [@@ocaml.doc ""]

type nonrec scheduling_expression = string [@@ocaml.doc ""]

type nonrec auto_training_config = {
  scheduling_expression : scheduling_expression option;
      [@ocaml.doc
        "Specifies how often to automatically train new solution versions. Specify a rate \
         expression in rate({i value} {i unit}) format. For value, specify a number between 1 and \
         30. For unit, specify [day] or [days]. For example, to automatically create a new \
         solution version every 5 days, specify [rate(5 days)]. The default is every 7 days.\n\n\
        \ For more information about auto training, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html}Creating \
         and configuring a solution}.\n\
        \ "]
}
[@@ocaml.doc "The automatic training configuration to use when [performAutoTraining] is true.\n"]

type nonrec event_type = string [@@ocaml.doc ""]

type nonrec event_type_threshold_value = float [@@ocaml.doc ""]

type nonrec event_type_weight = float [@@ocaml.doc ""]

type nonrec event_parameters = {
  weight : event_type_weight option;
      [@ocaml.doc
        "The weight of the event type. A higher weight means higher importance of the event type \
         for the created solution.\n"]
  event_value_threshold : event_type_threshold_value option;
      [@ocaml.doc
        "The threshold of the event type. Only events with a value greater or equal to this \
         threshold will be considered for solution creation.\n"]
  event_type : event_type option;
      [@ocaml.doc "The name of the event type to be considered for solution creation.\n"]
}
[@@ocaml.doc "Describes the parameters of events, which are used in solution creation.\n"]

type nonrec event_parameters_list = event_parameters list [@@ocaml.doc ""]

type nonrec events_config = {
  event_parameters_list : event_parameters_list option;
      [@ocaml.doc
        "A list of event parameters, which includes event types and their event value thresholds \
         and weights.\n"]
}
[@@ocaml.doc "Describes the configuration of events, which are used in solution creation.\n"]

type nonrec solution_update_config = {
  events_config : events_config option;
      [@ocaml.doc
        "Describes the configuration of an event, which includes a list of event parameters. You \
         can specify up to 10 event parameters. Events are used in solution creation.\n"]
  auto_training_config : auto_training_config option; [@ocaml.doc ""]
}
[@@ocaml.doc "The configuration details of the solution update.\n"]

type nonrec update_solution_request = {
  solution_update_config : solution_update_config option;
      [@ocaml.doc "The new configuration details of the solution.\n"]
  perform_incremental_update : perform_incremental_update option;
      [@ocaml.doc
        "Whether to perform incremental training updates on your model. When enabled, this allows \
         the model to learn from new data more frequently without requiring full retraining, which \
         enables near real-time personalization. This parameter is supported only for solutions \
         that use the semantic-similarity recipe.\n"]
  perform_auto_training : perform_auto_training option;
      [@ocaml.doc
        "Whether the solution uses automatic training to create new solution versions (trained \
         models). You can change the training frequency by specifying a [schedulingExpression] in \
         the [AutoTrainingConfig] as part of solution configuration. \n\n\
        \  If you turn on automatic training, the first automatic training starts within one hour \
         after the solution update completes. If you manually create a solution version within the \
         hour, the solution skips the first automatic training. For more information about \
         automatic training, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html}Configuring \
         automatic training}. \n\
        \ \n\
        \   After training starts, you can get the solution version's Amazon Resource Name (ARN) \
         with the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \
         API operation. To get its status, use the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \n\
        \  "]
  solution_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the solution to update.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Could not find the specified resource.\n"]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource is in use.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The limit on the number of requests per second has been exceeded.\n"]

type nonrec invalid_input_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Provide a valid value for the field or parameter.\n"]

type nonrec update_recommender_response = {
  recommender_arn : arn option;
      [@ocaml.doc "The same recommender Amazon Resource Name (ARN) as given in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec parameter_name = string [@@ocaml.doc ""]

type nonrec hyper_parameters = (parameter_name * parameter_value) list [@@ocaml.doc ""]

type nonrec transactions_per_second = int [@@ocaml.doc ""]

type nonrec column_name = string [@@ocaml.doc ""]

type nonrec column_names_list = column_name list [@@ocaml.doc ""]

type nonrec dataset_type = string [@@ocaml.doc ""]

type nonrec excluded_dataset_columns = (dataset_type * column_names_list) list [@@ocaml.doc ""]

type nonrec included_dataset_columns = (dataset_type * column_names_list) list [@@ocaml.doc ""]

type nonrec training_data_config = {
  included_dataset_columns : included_dataset_columns option;
      [@ocaml.doc
        "A map that specifies which columns to include from each dataset during training. The map \
         can contain up to 3 entries, where each key is a dataset name (maximum length of 256 \
         characters, must contain only letters and underscores) and each value is an array of up \
         to 50 column names. Column names can be up to 150 characters long, must start with a \
         letter or underscore, and can contain only letters, numbers, and underscores.\n"]
  excluded_dataset_columns : excluded_dataset_columns option;
      [@ocaml.doc
        "Specifies the columns to exclude from training. Each key is a dataset type, and each \
         value is a list of columns. Exclude columns to control what data Amazon Personalize uses \
         to generate recommendations.\n\n\
        \  For example, you might have a column that you want to use only to filter \
         recommendations. You can exclude this column from training and Amazon Personalize \
         considers it only when filtering. \n\
        \ "]
}
[@@ocaml.doc
  "The training data configuration to use when creating a domain recommender or custom solution \
   version (trained model).\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec recommender_config = {
  enable_metadata_with_recommendations : boolean_ option;
      [@ocaml.doc
        "Whether metadata with recommendations is enabled for the recommender. If enabled, you can \
         specify the columns from your Items dataset in your request for recommendations. Amazon \
         Personalize returns this data for each item in the recommendation response. For \
         information about enabling metadata for a recommender, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/creating-recommenders.html#create-recommender-return-metadata}Enabling \
         metadata in recommendations for a recommender}.\n\n\
        \  If you enable metadata in recommendations, you will incur additional costs. For more \
         information, see {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize \
         pricing}. \n\
        \ "]
  training_data_config : training_data_config option;
      [@ocaml.doc
        " Specifies the training data configuration to use when creating a domain recommender. \n"]
  min_recommendation_requests_per_second : transactions_per_second option;
      [@ocaml.doc
        "Specifies the requested minimum provisioned recommendation requests per second that \
         Amazon Personalize will support. A high [minRecommendationRequestsPerSecond] will \
         increase your bill. We recommend starting with 1 for [minRecommendationRequestsPerSecond] \
         (the default). Track your usage using Amazon CloudWatch metrics, and increase the \
         [minRecommendationRequestsPerSecond] as necessary.\n"]
  item_exploration_config : hyper_parameters option;
      [@ocaml.doc
        "Specifies the exploration configuration hyperparameters, including [explorationWeight] \
         and [explorationItemAgeCutOff], you want to use to configure the amount of item \
         exploration Amazon Personalize uses when recommending items. Provide \
         [itemExplorationConfig] data only if your recommenders generate personalized \
         recommendations for a user (not popular items or similar items).\n"]
}
[@@ocaml.doc "The configuration details of the recommender.\n"]

type nonrec update_recommender_request = {
  recommender_config : recommender_config;
      [@ocaml.doc "The configuration details of the recommender.\n"]
  recommender_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec update_metric_attribution_response = {
  metric_attribution_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the metric attribution that you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_expression = string [@@ocaml.doc ""]

type nonrec metric_attribute = {
  expression : metric_expression;
      [@ocaml.doc
        "The attribute's expression. Available functions are [SUM()] or [SAMPLECOUNT()]. For SUM() \
         functions, provide the dataset type (either Interactions or Items) and column to sum as a \
         parameter. For example SUM(Items.PRICE).\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "The metric's name. The name helps you identify the metric in Amazon CloudWatch or Amazon \
         S3.\n"]
  event_type : event_type; [@ocaml.doc "The metric's event type.\n"]
}
[@@ocaml.doc
  "Contains information on a metric that a metric attribution reports on. For more information, \
   see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html}Measuring \
   impact of recommendations}.\n"]

type nonrec metric_attributes = metric_attribute list [@@ocaml.doc ""]

type nonrec metric_attributes_names_list = metric_name list [@@ocaml.doc ""]

type nonrec s3_location = string [@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec s3_data_config = {
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Key Management Service (KMS) key that Amazon \
         Personalize uses to encrypt or decrypt the input and output files.\n"]
  path : s3_location; [@ocaml.doc "The file path of the Amazon S3 bucket.\n"]
}
[@@ocaml.doc "The configuration details of an Amazon S3 input or output bucket.\n"]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec metric_attribution_output = {
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data \
         to your output Amazon S3 bucket and add metrics to Amazon CloudWatch. For more \
         information, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html}Measuring \
         impact of recommendations}.\n"]
  s3_data_destination : s3_data_config option; [@ocaml.doc ""]
}
[@@ocaml.doc "The output configuration details for a metric attribution.\n"]

type nonrec update_metric_attribution_request = {
  metric_attribution_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the metric attribution to update.\n"]
  metrics_output_config : metric_attribution_output option;
      [@ocaml.doc "An output config for the metric attribution.\n"]
  remove_metrics : metric_attributes_names_list option;
      [@ocaml.doc "Remove metric attributes from the metric attribution.\n"]
  add_metrics : metric_attributes option;
      [@ocaml.doc "Add new metric attributes to the metric attribution.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource already exists.\n"]

type nonrec update_dataset_response = {
  dataset_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_dataset_request = {
  schema_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the new schema you want use.\n"]
  dataset_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_campaign_response = {
  campaign_arn : arn option; [@ocaml.doc "The same campaign ARN as given in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec ranking_influence_weight = float [@@ocaml.doc ""]

type nonrec ranking_influence_type = FRESHNESS [@ocaml.doc ""] | POPULARITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ranking_influence = (ranking_influence_type * ranking_influence_weight) list
[@@ocaml.doc ""]

type nonrec campaign_config = {
  ranking_influence : ranking_influence option;
      [@ocaml.doc
        "A map of ranking influence values for POPULARITY and FRESHNESS. For each key, specify a \
         numerical value between 0.0 and 1.0 that determines how much influence that ranking \
         factor has on the final recommendations. A value closer to 1.0 gives more weight to the \
         factor, while a value closer to 0.0 reduces its influence. \n"]
  sync_with_latest_solution_version : boolean_ option;
      [@ocaml.doc
        "Whether the campaign automatically updates to use the latest solution version (trained \
         model) of a solution. If you specify [True], you must specify the ARN of your {i \
         solution} for the [SolutionVersionArn] parameter. It must be in [SolutionArn/$LATEST] \
         format. The default is [False] and you must manually update the campaign to deploy the \
         latest solution version. \n\n\
        \  For more information about automatic campaign updates, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update}Enabling \
         automatic campaign updates}. \n\
        \ "]
  enable_metadata_with_recommendations : boolean_ option;
      [@ocaml.doc
        "Whether metadata with recommendations is enabled for the campaign. If enabled, you can \
         specify the columns from your Items dataset in your request for recommendations. Amazon \
         Personalize returns this data for each item in the recommendation response. For \
         information about enabling metadata for a campaign, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-return-metadata}Enabling \
         metadata in recommendations for a campaign}.\n\n\
        \  If you enable metadata in recommendations, you will incur additional costs. For more \
         information, see {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize \
         pricing}. \n\
        \ "]
  item_exploration_config : hyper_parameters option;
      [@ocaml.doc
        "Specifies the exploration configuration hyperparameters, including [explorationWeight] \
         and [explorationItemAgeCutOff], you want to use to configure the amount of item \
         exploration Amazon Personalize uses when recommending items. Provide \
         [itemExplorationConfig] data only if your solution uses the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html}User-Personalization} \
         recipe.\n"]
}
[@@ocaml.doc "The configuration details of a campaign.\n"]

type nonrec update_campaign_request = {
  campaign_config : campaign_config option;
      [@ocaml.doc "The configuration details of a campaign.\n"]
  min_provisioned_tp_s : transactions_per_second option;
      [@ocaml.doc
        "Specifies the requested minimum provisioned transactions (recommendations) per second \
         that Amazon Personalize will support. A high [minProvisionedTPS] will increase your bill. \
         We recommend starting with 1 for [minProvisionedTPS] (the default). Track your usage \
         using Amazon CloudWatch metrics, and increase the [minProvisionedTPS] as necessary.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a new model to deploy. To specify the latest solution \
         version of your solution, specify the ARN of your {i solution} in [SolutionArn/$LATEST] \
         format. You must use this format if you set [syncWithLatestSolutionVersion] to [True] in \
         the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CampaignConfig.html}CampaignConfig}. \
         \n\n\
        \  To deploy a model that isn't the latest solution version of your solution, specify the \
         ARN of the solution version. \n\
        \ \n\
        \   For more information about automatic campaign updates, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update}Enabling \
         automatic campaign updates}. \n\
        \  "]
  campaign_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys; [@ocaml.doc "The keys of the tags to be removed.\n"]
  resource_arn : arn; [@ocaml.doc "The resource's Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tag_keys_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request contains more tag keys than can be associated with a resource (50 tag keys per \
   resource). \n"]

type nonrec tuned_hpo_params = {
  algorithm_hyper_parameters : hyper_parameters option;
      [@ocaml.doc "A list of the hyperparameter values of the best performing model.\n"]
}
[@@ocaml.doc
  "If hyperparameter optimization (HPO) was performed, contains the hyperparameter values of the \
   best performing model.\n"]

type nonrec tunable = bool [@@ocaml.doc ""]

type nonrec training_type = MANUAL [@ocaml.doc ""] | AUTOMATIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec training_mode =
  | AUTOTRAIN [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
  | FULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec training_input_mode = string [@@ocaml.doc ""]

type nonrec training_hours = float [@@ocaml.doc ""]

type nonrec tracking_id = string [@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You have exceeded the maximum number of tags you can apply to this resource. \n"]

type nonrec fields_for_theme_generation = {
  item_name : column_name;
      [@ocaml.doc
        "The name of the Items dataset column that stores the name of each item in the dataset.\n"]
}
[@@ocaml.doc "A string to string map of the configuration details for theme generation.\n"]

type nonrec theme_generation_config = {
  fields_for_theme_generation : fields_for_theme_generation;
      [@ocaml.doc "Fields used to generate descriptive themes for a batch inference job.\n"]
}
[@@ocaml.doc "The configuration details for generating themes with a batch inference job.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  tag_value : tag_value;
      [@ocaml.doc
        "The optional part of a key-value pair that makes up a tag. A value acts as a descriptor \
         within a tag category (key).\n"]
  tag_key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that makes up a tag. A key is a general label that acts like \
         a category for more specific tag values.\n"]
}
[@@ocaml.doc
  "The optional metadata that you apply to resources to help you categorize and organize them. \
   Each tag consists of a key and an optional value, both of which you define. For more \
   information see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}Tagging Amazon \
   Personalize resources}. \n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc
        "Tags to apply to the resource. For more information see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}Tagging \
         Amazon Personalize resources}.\n"]
  resource_arn : arn; [@ocaml.doc "The resource's Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec stop_solution_version_creation_request = {
  solution_version_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version you want to stop creating.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_recommender_response = {
  recommender_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender you stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_recommender_request = {
  recommender_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec start_recommender_response = {
  recommender_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender you started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_recommender_request = {
  recommender_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender to start.\n"]
}
[@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec solution_summary = {
  recipe_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recipe used by the solution.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the solution.\n\n\
        \ A solution can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  solution_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the solution.\n"]
  name : name option; [@ocaml.doc "The name of the solution.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a solution. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \
   API.\n"]

type nonrec solutions = solution_summary list [@@ocaml.doc ""]

type nonrec failure_reason = string [@@ocaml.doc ""]

type nonrec solution_version_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a solution version fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution version was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that this version of a solution was created.\n"]
  training_type : training_type option;
      [@ocaml.doc "Whether the solution version was created automatically or manually.\n"]
  training_mode : training_mode option;
      [@ocaml.doc
        "The scope of training to be performed when creating the solution version. A [FULL] \
         training considers all of the data in your dataset group. An [UPDATE] processes only the \
         data that has changed since the latest training. Only solution versions created with the \
         User-Personalization recipe can use [UPDATE]. \n"]
  status : status option;
      [@ocaml.doc
        "The status of the solution version.\n\n\
        \ A solution version can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  solution_version_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the solution version.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a solution version. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion} \
   API.\n"]

type nonrec solution_versions = solution_version_summary list [@@ocaml.doc ""]

type nonrec perform_hp_o = bool [@@ocaml.doc ""]

type nonrec perform_auto_m_l = bool [@@ocaml.doc ""]

type nonrec event_value_threshold = string [@@ocaml.doc ""]

type nonrec hpo_objective_type = string [@@ocaml.doc ""]

type nonrec metric_regex = string [@@ocaml.doc ""]

type nonrec hpo_objective = {
  metric_regex : metric_regex option;
      [@ocaml.doc "A regular expression for finding the metric in the training job logs.\n"]
  metric_name : metric_name option; [@ocaml.doc "The name of the metric.\n"]
  type_ : hpo_objective_type option;
      [@ocaml.doc "The type of the metric. Valid values are [Maximize] and [Minimize].\n"]
}
[@@ocaml.doc
  "The metric to optimize during hyperparameter optimization (HPO).\n\n\
  \  Amazon Personalize doesn't support configuring the [hpoObjective] at this time.\n\
  \  \n\
  \   "]

type nonrec hpo_resource = string [@@ocaml.doc ""]

type nonrec hpo_resource_config = {
  max_parallel_training_jobs : hpo_resource option;
      [@ocaml.doc
        "The maximum number of parallel training jobs when you create a solution version. The \
         maximum value for [maxParallelTrainingJobs] is [10].\n"]
  max_number_of_training_jobs : hpo_resource option;
      [@ocaml.doc
        "The maximum number of training jobs when you create a solution version. The maximum value \
         for [maxNumberOfTrainingJobs] is [40].\n"]
}
[@@ocaml.doc "Describes the resource configuration for hyperparameter optimization (HPO).\n"]

type nonrec integer_min_value = int [@@ocaml.doc ""]

type nonrec integer_max_value = int [@@ocaml.doc ""]

type nonrec integer_hyper_parameter_range = {
  max_value : integer_max_value option;
      [@ocaml.doc "The maximum allowable value for the hyperparameter.\n"]
  min_value : integer_min_value option;
      [@ocaml.doc "The minimum allowable value for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc "Provides the name and range of an integer-valued hyperparameter.\n"]

type nonrec integer_hyper_parameter_ranges = integer_hyper_parameter_range list [@@ocaml.doc ""]

type nonrec continuous_min_value = float [@@ocaml.doc ""]

type nonrec continuous_max_value = float [@@ocaml.doc ""]

type nonrec continuous_hyper_parameter_range = {
  max_value : continuous_max_value option;
      [@ocaml.doc "The maximum allowable value for the hyperparameter.\n"]
  min_value : continuous_min_value option;
      [@ocaml.doc "The minimum allowable value for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc "Provides the name and range of a continuous hyperparameter.\n"]

type nonrec continuous_hyper_parameter_ranges = continuous_hyper_parameter_range list
[@@ocaml.doc ""]

type nonrec categorical_value = string [@@ocaml.doc ""]

type nonrec categorical_values = categorical_value list [@@ocaml.doc ""]

type nonrec categorical_hyper_parameter_range = {
  values : categorical_values option;
      [@ocaml.doc "A list of the categories for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc "Provides the name and range of a categorical hyperparameter.\n"]

type nonrec categorical_hyper_parameter_ranges = categorical_hyper_parameter_range list
[@@ocaml.doc ""]

type nonrec hyper_parameter_ranges = {
  categorical_hyper_parameter_ranges : categorical_hyper_parameter_ranges option;
      [@ocaml.doc "The categorical hyperparameters and their ranges.\n"]
  continuous_hyper_parameter_ranges : continuous_hyper_parameter_ranges option;
      [@ocaml.doc "The continuous hyperparameters and their ranges.\n"]
  integer_hyper_parameter_ranges : integer_hyper_parameter_ranges option;
      [@ocaml.doc "The integer-valued hyperparameters and their ranges.\n"]
}
[@@ocaml.doc
  "Specifies the hyperparameters and their ranges. Hyperparameters can be categorical, continuous, \
   or integer-valued.\n"]

type nonrec hpo_config = {
  algorithm_hyper_parameter_ranges : hyper_parameter_ranges option;
      [@ocaml.doc "The hyperparameters and their allowable ranges.\n"]
  hpo_resource_config : hpo_resource_config option;
      [@ocaml.doc "Describes the resource configuration for HPO.\n"]
  hpo_objective : hpo_objective option;
      [@ocaml.doc
        "The metric to optimize during HPO.\n\n\
        \  Amazon Personalize doesn't support configuring the [hpoObjective] at this time.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Describes the properties for hyperparameter optimization (HPO).\n"]

type nonrec feature_transformation_parameters = (parameter_name * parameter_value) list
[@@ocaml.doc ""]

type nonrec arn_list = arn list [@@ocaml.doc ""]

type nonrec auto_ml_config = {
  recipe_list : arn_list option; [@ocaml.doc "The list of candidate recipes.\n"]
  metric_name : metric_name option; [@ocaml.doc "The metric to optimize.\n"]
}
[@@ocaml.doc
  "When the solution performs AutoML ([performAutoML] is true in \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}), \
   Amazon Personalize determines which recipe, from the specified list, optimizes the given \
   metric. Amazon Personalize then uses that recipe for the solution.\n"]

type nonrec item_attribute = string [@@ocaml.doc ""]

type nonrec objective_sensitivity =
  | OFF [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec optimization_objective = {
  objective_sensitivity : objective_sensitivity option;
      [@ocaml.doc
        "Specifies how Amazon Personalize balances the importance of your optimization objective \
         versus relevance.\n"]
  item_attribute : item_attribute option;
      [@ocaml.doc
        "The numerical metadata column in an Items dataset related to the optimization objective. \
         For example, VIDEO_LENGTH (to maximize streaming minutes), or PRICE (to maximize revenue).\n"]
}
[@@ocaml.doc
  "Describes the additional objective for the solution, such as maximizing streaming minutes or \
   increasing revenue. For more information see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/optimizing-solution-for-objective.html}Optimizing \
   a solution}.\n"]

type nonrec solution_config = {
  auto_training_config : auto_training_config option;
      [@ocaml.doc "Specifies the automatic training configuration to use.\n"]
  training_data_config : training_data_config option;
      [@ocaml.doc
        " Specifies the training data configuration to use when creating a custom solution version \
         (trained model). \n"]
  optimization_objective : optimization_objective option;
      [@ocaml.doc
        "Describes the additional objective for the solution, such as maximizing streaming minutes \
         or increasing revenue. For more information see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/optimizing-solution-for-objective.html}Optimizing \
         a solution}.\n"]
  events_config : events_config option;
      [@ocaml.doc
        "Describes the configuration of an event, which includes a list of event parameters. You \
         can specify up to 10 event parameters. Events are used in solution creation.\n"]
  auto_ml_config : auto_ml_config option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_AutoMLConfig.html}AutoMLConfig} \
         object containing a list of recipes to search when AutoML is performed.\n"]
  feature_transformation_parameters : feature_transformation_parameters option;
      [@ocaml.doc "Lists the feature transformation parameters.\n"]
  algorithm_hyper_parameters : hyper_parameters option;
      [@ocaml.doc "Lists the algorithm hyperparameters and their values.\n"]
  hpo_config : hpo_config option;
      [@ocaml.doc "Describes the properties for hyperparameter optimization (HPO).\n"]
  event_value_threshold : event_value_threshold option;
      [@ocaml.doc
        "Only events with a value greater than or equal to this threshold are used for training a \
         model.\n"]
}
[@@ocaml.doc "Describes the configuration properties for the solution.\n"]

type nonrec solution_version = {
  training_type : training_type option;
      [@ocaml.doc "Whether the solution version was created automatically or manually.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc
        "The date and time (in Unix time) that this version of the solution was created.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If training a solution version fails, the reason for the failure.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the solution version.\n\n\
        \ A solution version can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING\n\
        \            \n\
        \             }\n\
        \        {-  CREATE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE\n\
        \            \n\
        \             }\n\
        \        {-  CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  CREATE STOPPING\n\
        \            \n\
        \             }\n\
        \        {-  CREATE STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tuned_hpo_params : tuned_hpo_params option;
      [@ocaml.doc
        "If hyperparameter optimization was performed, contains the hyperparameter values of the \
         best performing model.\n"]
  training_mode : training_mode option;
      [@ocaml.doc
        "The scope of training to be performed when creating the solution version. A [FULL] \
         training considers all of the data in your dataset group. An [UPDATE] processes only the \
         data that has changed since the latest training. Only solution versions created with the \
         User-Personalization recipe can use [UPDATE]. \n"]
  training_hours : training_hours option;
      [@ocaml.doc
        "The time used to train the model. You are billed for the time it takes to train a model. \
         This field is visible only after Amazon Personalize successfully trains a model.\n"]
  solution_config : solution_config option;
      [@ocaml.doc "Describes the configuration properties for the solution.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group providing the training data.\n"]
  event_type : event_type option;
      [@ocaml.doc
        "The event type (for example, 'click' or 'like') that is used for training the model.\n"]
  recipe_arn : arn option; [@ocaml.doc "The ARN of the recipe used in the solution.\n"]
  perform_incremental_update : perform_incremental_update option;
      [@ocaml.doc
        "Whether the solution version should perform an incremental update. When set to true, the \
         training will process only the data that has changed since the latest training, similar \
         to when trainingMode is set to UPDATE. This can only be used with solution versions that \
         use the User-Personalization recipe.\n"]
  perform_auto_m_l : perform_auto_m_l option;
      [@ocaml.doc
        "When true, Amazon Personalize searches for the most optimal recipe according to the \
         solution configuration. When false (the default), Amazon Personalize uses [recipeArn].\n"]
  perform_hp_o : perform_hp_o option;
      [@ocaml.doc
        "Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is \
         [false].\n"]
  solution_arn : arn option; [@ocaml.doc "The ARN of the solution.\n"]
  solution_version_arn : arn option; [@ocaml.doc "The ARN of the solution version.\n"]
  name : name option; [@ocaml.doc "The name of the solution version.\n"]
}
[@@ocaml.doc
  "An object that provides information about a specific version of a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_Solution.html}Solution} in a Custom \
   dataset group.\n"]

type nonrec solution_update_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a solution update fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution update was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the solution update was created.\n"]
  perform_incremental_update : perform_incremental_update option;
      [@ocaml.doc
        "A Boolean value that indicates whether incremental training updates are performed on the \
         model. When enabled, this allows the model to learn from new data more frequently without \
         requiring full retraining, which enables near real-time personalization. This parameter \
         is supported only for solutions that use the semantic-similarity recipe.\n"]
  perform_auto_training : perform_auto_training option;
      [@ocaml.doc "Whether the solution automatically creates solution versions.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the solution update. A solution update can be in one of the following \
         states:\n\n\
        \ CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \ "]
  solution_update_config : solution_update_config option;
      [@ocaml.doc "The configuration details of the solution.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a solution update. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \
   API.\n"]

type nonrec auto_ml_result = {
  best_recipe_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the best recipe.\n"]
}
[@@ocaml.doc
  "When the solution performs AutoML ([performAutoML] is true in \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}), \
   specifies the recipe that best optimized the specified metric.\n"]

type nonrec solution = {
  latest_solution_update : solution_update_summary option;
      [@ocaml.doc "Provides a summary of the latest updates to the solution.\n"]
  latest_solution_version : solution_version_summary option;
      [@ocaml.doc
        "Describes the latest version of the solution, including the status and the ARN.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the solution was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the solution.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the solution.\n\n\
        \ A solution can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  auto_ml_result : auto_ml_result option;
      [@ocaml.doc "When [performAutoML] is true, specifies the best recipe found.\n"]
  solution_config : solution_config option;
      [@ocaml.doc "Describes the configuration properties for the solution.\n"]
  event_type : event_type option;
      [@ocaml.doc
        "The event type (for example, 'click' or 'like') that is used for training the model. If \
         no [eventType] is provided, Amazon Personalize uses all interactions for training with \
         equal weight regardless of type.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that provides the training data.\n"]
  recipe_arn : arn option;
      [@ocaml.doc
        "The ARN of the recipe used to create the solution. This is required when [performAutoML] \
         is false.\n"]
  perform_incremental_update : perform_incremental_update option;
      [@ocaml.doc
        "A Boolean value that indicates whether incremental training updates are performed on the \
         model. When enabled, this allows the model to learn from new data more frequently without \
         requiring full retraining, which enables near real-time personalization. This parameter \
         is supported only for solutions that use the semantic-similarity recipe\n"]
  perform_auto_training : perform_auto_training option;
      [@ocaml.doc
        "Specifies whether the solution automatically creates solution versions. The default is \
         [True] and the solution automatically creates new solution versions every 7 days.\n\n\
        \ For more information about auto training, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html}Creating \
         and configuring a solution}.\n\
        \ "]
  perform_auto_m_l : perform_auto_m_l option;
      [@ocaml.doc
        " We don't recommend enabling automated machine learning. Instead, match your use case to \
         the available Amazon Personalize recipes. For more information, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/determining-use-case.html}Determining \
         your use case.} \n\
        \ \n\
        \   When true, Amazon Personalize performs a search for the best USER_PERSONALIZATION \
         recipe from the list specified in the solution configuration ([recipeArn] must not be \
         specified). When false (the default), Amazon Personalize uses [recipeArn] for training.\n\
        \   "]
  perform_hp_o : perform_hp_o option;
      [@ocaml.doc
        "Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is \
         [false].\n"]
  solution_arn : arn option; [@ocaml.doc "The ARN of the solution.\n"]
  name : name option; [@ocaml.doc "The name of the solution.\n"]
}
[@@ocaml.doc
  " By default, all new solutions use automatic training. With automatic training, you incur \
   training costs while your solution is active. To avoid unnecessary costs, when you are finished \
   you can {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateSolution.html}update the \
   solution} to turn off automatic training. For information about training costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \ \n\
  \   An object that provides information about a solution. A solution includes the custom recipe, \
   customized parameters, and trained models (Solution Versions) that Amazon Personalize uses to \
   generate recommendations. \n\
  \   \n\
  \    After you create a solution, you can\226\128\153t change its configuration. If you need to \
   make changes, you can \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/cloning-solution.html}clone the solution} \
   with the Amazon Personalize console or create a new one.\n\
  \    "]

type nonrec domain = VIDEO_ON_DEMAND [@ocaml.doc ""] | ECOMMERCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dataset_schema_summary = {
  domain : domain option;
      [@ocaml.doc
        "The domain of a schema that you created for a dataset in a Domain dataset group.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the schema was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the schema was created.\n"]
  schema_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  name : name option; [@ocaml.doc "The name of the schema.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a dataset schema. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html}DescribeSchema} \
   API.\n"]

type nonrec schemas = dataset_schema_summary list [@@ocaml.doc ""]

type nonrec resource_config = (parameter_name * parameter_value) list [@@ocaml.doc ""]

type nonrec recommender_summary = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recommender was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recommender was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the recommender. A recommender can be in one of the following states:\n\n\
        \ {ul\n\
        \       {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \           \n\
        \            }\n\
        \       {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START IN_PROGRESS \
         > ACTIVE\n\
        \           \n\
        \            }\n\
        \       {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  recommender_config : recommender_config option;
      [@ocaml.doc "The configuration details of the recommender.\n"]
  recipe_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case) that the \
         recommender was created for.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Domain dataset group that contains the recommender.\n"]
  recommender_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender.\n"]
  name : name option; [@ocaml.doc "The name of the recommender.\n"]
}
[@@ocaml.doc "Provides a summary of the properties of the recommender.\n"]

type nonrec recommenders = recommender_summary list [@@ocaml.doc ""]

type nonrec recommender_update_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a recommender update fails, the reason behind the failure.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the recommender update. A recommender update can be in one of the following \
         states:\n\n\
        \ CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \ "]
  last_updated_date_time : date option;
      [@ocaml.doc
        "The date and time (in Unix time) that the recommender update was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recommender update was created.\n"]
  recommender_config : recommender_config option;
      [@ocaml.doc "The configuration details of the recommender update.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a recommender update. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender} \
   API.\n"]

type nonrec metric_value = float [@@ocaml.doc ""]

type nonrec metrics = (metric_name * metric_value) list [@@ocaml.doc ""]

type nonrec recommender = {
  model_metrics : metrics option;
      [@ocaml.doc
        "Provides evaluation metrics that help you determine the performance of a recommender. For \
         more information, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/evaluating-recommenders.html} \
         Evaluating a recommender}.\n"]
  latest_recommender_update : recommender_update_summary option;
      [@ocaml.doc "Provides a summary of the latest updates to the recommender. \n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If a recommender fails, the reason behind the failure.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the recommender.\n\n\
        \ A recommender can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START \
         IN_PROGRESS > ACTIVE\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recommender was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recommender was created.\n"]
  recommender_config : recommender_config option;
      [@ocaml.doc "The configuration details of the recommender.\n"]
  recipe_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case) that the \
         recommender was created for. \n"]
  name : name option; [@ocaml.doc "The name of the recommender.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Domain dataset group that contains the recommender.\n"]
  recommender_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender.\n"]
}
[@@ocaml.doc
  "Describes a recommendation generator for a Domain dataset group. You create a recommender in a \
   Domain dataset group for a specific domain use case (domain recipe), and specify the \
   recommender in a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request.\n"]

type nonrec recipe_summary = {
  domain : domain option;
      [@ocaml.doc "The domain of the recipe (if the recipe is a Domain dataset group use case).\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the recipe was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the recipe was created.\n"]
  status : status option; [@ocaml.doc "The status of the recipe.\n"]
  recipe_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the recipe.\n"]
  name : name option; [@ocaml.doc "The name of the recipe.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a recipe. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecipe.html}DescribeRecipe} \
   API.\n"]

type nonrec recipes = recipe_summary list [@@ocaml.doc ""]

type nonrec recipe_type = string [@@ocaml.doc ""]

type nonrec recipe_provider = SERVICE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec recipe = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recipe was last updated.\n"]
  recipe_type : recipe_type option;
      [@ocaml.doc
        "One of the following values:\n\n\
        \ {ul\n\
        \       {-  PERSONALIZED_RANKING\n\
        \           \n\
        \            }\n\
        \       {-  RELATED_ITEMS\n\
        \           \n\
        \            }\n\
        \       {-  USER_PERSONALIZATION\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the recipe was created.\n"]
  description : description option; [@ocaml.doc "The description of the recipe.\n"]
  status : status option; [@ocaml.doc "The status of the recipe.\n"]
  feature_transformation_arn : arn option;
      [@ocaml.doc "The ARN of the FeatureTransformation object.\n"]
  algorithm_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize uses to train the \
         model.\n"]
  recipe_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the recipe.\n"]
  name : name option; [@ocaml.doc "The name of the recipe.\n"]
}
[@@ocaml.doc
  "Provides information about a recipe. Each recipe provides an algorithm that Amazon Personalize \
   uses in model training when you use the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \
   operation. \n"]

type nonrec num_batch_results = int [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec metric_attribution_summary = {
  failure_reason : failure_reason option; [@ocaml.doc "The metric attribution's failure reason.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The metric attribution's last updated date time.\n"]
  creation_date_time : date option; [@ocaml.doc "The metric attribution's creation date time.\n"]
  status : status option; [@ocaml.doc "The metric attribution's status.\n"]
  metric_attribution_arn : arn option;
      [@ocaml.doc "The metric attribution's Amazon Resource Name (ARN).\n"]
  name : name option; [@ocaml.doc "The name of the metric attribution.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a metric attribution. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeMetricAttribution.html}DescribeMetricAttribution}.\n"]

type nonrec metric_attributions = metric_attribution_summary list [@@ocaml.doc ""]

type nonrec metric_attribution = {
  failure_reason : failure_reason option; [@ocaml.doc "The metric attribution's failure reason.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The metric attribution's last updated date time.\n"]
  creation_date_time : date option; [@ocaml.doc "The metric attribution's creation date time.\n"]
  status : status option; [@ocaml.doc "The metric attribution's status.\n"]
  metrics_output_config : metric_attribution_output option;
      [@ocaml.doc "The metric attribution's output configuration.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The metric attribution's dataset group Amazon Resource Name (ARN).\n"]
  metric_attribution_arn : arn option;
      [@ocaml.doc "The metric attribution's Amazon Resource Name (ARN).\n"]
  name : name option; [@ocaml.doc "The metric attribution's name.\n"]
}
[@@ocaml.doc
  "Contains information on a metric attribution. A metric attribution creates reports on the data \
   that you import into Amazon Personalize. Depending on how you import the data, you can view \
   reports in Amazon CloudWatch or Amazon S3. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html}Measuring \
   impact of recommendations}.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The resource's tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn; [@ocaml.doc "The resource's Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec list_solutions_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of solutions (if they exist).\n"]
  solutions : solutions option; [@ocaml.doc "A list of the current solutions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_solutions_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of solutions to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListSolutions] for getting the next set of \
         solutions (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The token is not valid.\n"]

type nonrec list_solution_versions_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of solution versions (if they exist).\n"]
  solution_versions : solution_versions option;
      [@ocaml.doc "A list of solution versions describing the version properties.\n"]
}
[@@ocaml.doc ""]

type nonrec list_solution_versions_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of solution versions to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListSolutionVersions] for getting the next \
         set of solution versions (if they exist).\n"]
  solution_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the solution.\n"]
}
[@@ocaml.doc ""]

type nonrec list_schemas_response = {
  next_token : next_token option;
      [@ocaml.doc "A token used to get the next set of schemas (if they exist).\n"]
  schemas : schemas option; [@ocaml.doc "A list of schemas.\n"]
}
[@@ocaml.doc ""]

type nonrec list_schemas_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of schemas to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListSchemas] for getting the next set of \
         schemas (if they exist).\n"]
}
[@@ocaml.doc ""]

type nonrec list_recommenders_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of recommenders (if they exist).\n"]
  recommenders : recommenders option; [@ocaml.doc "A list of the recommenders.\n"]
}
[@@ocaml.doc ""]

type nonrec list_recommenders_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of recommenders to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListRecommenders] for getting the next set of \
         recommenders (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Domain dataset group to list the recommenders for. \
         When a Domain dataset group is not specified, all the recommenders associated with the \
         account are listed.\n"]
}
[@@ocaml.doc ""]

type nonrec list_recipes_response = {
  next_token : next_token option; [@ocaml.doc "A token for getting the next set of recipes.\n"]
  recipes : recipes option; [@ocaml.doc "The list of available recipes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_recipes_request = {
  domain : domain option;
      [@ocaml.doc
        " Filters returned recipes by domain for a Domain dataset group. Only recipes (Domain \
         dataset group use cases) for this domain are included in the response. If you don't \
         specify a domain, all recipes are returned. \n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of recipes to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListRecipes] for getting the next set of \
         recipes (if they exist).\n"]
  recipe_provider : recipe_provider option; [@ocaml.doc "The default is [SERVICE].\n"]
}
[@@ocaml.doc ""]

type nonrec list_metric_attributions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Specify the pagination token from a previous request to retrieve the next page of results.\n"]
  metric_attributions : metric_attributions option; [@ocaml.doc "The list of metric attributions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_metric_attributions_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of metric attributions to return in one page of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specify the pagination token from a previous request to retrieve the next page of results.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The metric attributions' dataset group Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec list_metric_attribution_metrics_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Specify the pagination token from a previous [ListMetricAttributionMetricsResponse] \
         request to retrieve the next page of results.\n"]
  metrics : metric_attributes option;
      [@ocaml.doc "The metrics for the specified metric attribution.\n"]
}
[@@ocaml.doc ""]

type nonrec list_metric_attribution_metrics_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of metrics to return in one page of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specify the pagination token from a previous request to retrieve the next page of results.\n"]
  metric_attribution_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the metric attribution to retrieve attributes for.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_summary = {
  status : status option; [@ocaml.doc "The status of the filter.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the filter failed, the reason for the failure.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The ARN of the dataset group to which the filter belongs.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the filter was last updated.\n"]
  creation_date_time : date option; [@ocaml.doc "The time at which the filter was created.\n"]
  filter_arn : arn option; [@ocaml.doc "The ARN of the filter.\n"]
  name : name option; [@ocaml.doc "The name of the filter.\n"]
}
[@@ocaml.doc "A short summary of a filter's attributes.\n"]

type nonrec filters = filter_summary list [@@ocaml.doc ""]

type nonrec list_filters_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of filters (if they exist).\n"]
  filters : filters option; [@ocaml.doc "A list of returned filters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_filters_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of filters to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListFilters] for getting the next set of \
         filters (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The ARN of the dataset group that contains the filters.\n"]
}
[@@ocaml.doc ""]

type nonrec event_tracker_summary = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the event tracker was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the event tracker was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the event tracker.\n\n\
        \ An event tracker can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  event_tracker_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the event tracker.\n"]
  name : name option; [@ocaml.doc "The name of the event tracker.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of an event tracker. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html}DescribeEventTracker} \
   API.\n"]

type nonrec event_trackers = event_tracker_summary list [@@ocaml.doc ""]

type nonrec list_event_trackers_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of event trackers (if they exist).\n"]
  event_trackers : event_trackers option; [@ocaml.doc "A list of event trackers.\n"]
}
[@@ocaml.doc ""]

type nonrec list_event_trackers_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of event trackers to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListEventTrackers] for getting the next set \
         of event trackers (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The ARN of a dataset group used to filter the response.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_summary = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset.\n\n\
        \ A dataset can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  dataset_type : dataset_type option;
      [@ocaml.doc
        "The dataset type. One of the following values:\n\n\
        \ {ul\n\
        \       {-  Interactions\n\
        \           \n\
        \            }\n\
        \       {-  Items\n\
        \           \n\
        \            }\n\
        \       {-  Users\n\
        \           \n\
        \            }\n\
        \       {-  Event-Interactions\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dataset_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset.\n"]
  name : name option; [@ocaml.doc "The name of the dataset.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a dataset. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html}DescribeDataset} \
   API.\n"]

type nonrec datasets = dataset_summary list [@@ocaml.doc ""]

type nonrec list_datasets_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of datasets (if they exist).\n"]
  datasets : datasets option;
      [@ocaml.doc "An array of [Dataset] objects. Each object provides metadata information.\n"]
}
[@@ocaml.doc ""]

type nonrec list_datasets_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of datasets to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListDatasets] for getting the next set of \
         dataset import jobs (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that contains the datasets to list.\n"]
}
[@@ocaml.doc ""]

type nonrec import_mode = INCREMENTAL [@ocaml.doc ""] | FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dataset_import_job_summary = {
  import_mode : import_mode option;
      [@ocaml.doc
        "The import mode the dataset import job used to update the data in the dataset. For more \
         information see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/updating-existing-bulk-data.html}Updating \
         existing bulk data}. \n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If a dataset import job fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc
        "The date and time (in Unix time) that the dataset import job status was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset import job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset import job.\n\n\
        \ A dataset import job can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  job_name : name option; [@ocaml.doc "The name of the dataset import job.\n"]
  dataset_import_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a dataset import job. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \
   API.\n"]

type nonrec dataset_import_jobs = dataset_import_job_summary list [@@ocaml.doc ""]

type nonrec list_dataset_import_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of dataset import jobs (if they exist).\n"]
  dataset_import_jobs : dataset_import_jobs option; [@ocaml.doc "The list of dataset import jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_import_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of dataset import jobs to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListDatasetImportJobs] for getting the next \
         set of dataset import jobs (if they exist).\n"]
  dataset_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset to list the dataset import jobs for.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_group_summary = {
  domain : domain option; [@ocaml.doc "The domain of a Domain dataset group.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If creating a dataset group fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset group was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset group was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset group.\n\n\
        \ A dataset group can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
  name : name option; [@ocaml.doc "The name of the dataset group.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a dataset group. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   API.\n"]

type nonrec dataset_groups = dataset_group_summary list [@@ocaml.doc ""]

type nonrec list_dataset_groups_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of dataset groups (if they exist).\n"]
  dataset_groups : dataset_groups option; [@ocaml.doc "The list of your dataset groups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_groups_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of dataset groups to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListDatasetGroups] for getting the next set \
         of dataset groups (if they exist).\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_export_job_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a dataset export job fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc
        "The date and time (in Unix time) that the dataset export job status was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the dataset export job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset export job.\n\n\
        \ A dataset export job can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  job_name : name option; [@ocaml.doc "The name of the dataset export job.\n"]
  dataset_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset export job.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a dataset export job. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html}DescribeDatasetExportJob} \
   API.\n"]

type nonrec dataset_export_jobs = dataset_export_job_summary list [@@ocaml.doc ""]

type nonrec list_dataset_export_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of dataset export jobs (if they exist).\n"]
  dataset_export_jobs : dataset_export_jobs option; [@ocaml.doc "The list of dataset export jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_export_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of dataset export jobs to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListDatasetExportJobs] for getting the next \
         set of dataset export jobs (if they exist).\n"]
  dataset_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset to list the dataset export jobs for.\n"]
}
[@@ocaml.doc ""]

type nonrec data_deletion_job_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a data deletion job fails, provides the reason why.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) the data deletion job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the data deletion job.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the data deletion job.\n\n\
        \ A data deletion job can have one of the following statuses:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING > IN_PROGRESS > COMPLETED -or- FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  job_name : name option; [@ocaml.doc "The name of the data deletion job.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group the job deleted records from.\n"]
  data_deletion_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the data deletion job.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a data deletion job. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html}DescribeDataDeletionJob} \
   API operation.\n"]

type nonrec data_deletion_jobs = data_deletion_job_summary list [@@ocaml.doc ""]

type nonrec list_data_deletion_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of data deletion jobs (if they exist).\n"]
  data_deletion_jobs : data_deletion_jobs option; [@ocaml.doc "The list of data deletion jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_data_deletion_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of data deletion jobs to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to [ListDataDeletionJobs] for getting the next \
         set of jobs (if they exist).\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group to list data deletion jobs for.\n"]
}
[@@ocaml.doc ""]

type nonrec campaign_summary = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a campaign fails, the reason behind the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the campaign was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the campaign was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the campaign.\n\n\
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
        \  "]
  campaign_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign.\n"]
  name : name option; [@ocaml.doc "The name of the campaign.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a campaign. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \
   API.\n"]

type nonrec campaigns = campaign_summary list [@@ocaml.doc ""]

type nonrec list_campaigns_response = {
  next_token : next_token option;
      [@ocaml.doc "A token for getting the next set of campaigns (if they exist).\n"]
  campaigns : campaigns option; [@ocaml.doc "A list of the campaigns.\n"]
}
[@@ocaml.doc ""]

type nonrec list_campaigns_request = {
  max_results : max_results option; [@ocaml.doc "The maximum number of campaigns to return.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from the previous call to \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html}ListCampaigns} \
         for getting the next set of campaigns (if they exist).\n"]
  solution_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution to list the campaigns for. When a solution \
         is not specified, all the campaigns associated with the account are listed.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_segment_job_summary = {
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version used by the batch segment job to \
         generate batch segments.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the batch segment job failed, the reason for the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the batch segment job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The time at which the batch segment job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the batch segment job. The status is one of the following values:\n\n\
        \ {ul\n\
        \       {-  PENDING\n\
        \           \n\
        \            }\n\
        \       {-  IN PROGRESS\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE\n\
        \           \n\
        \            }\n\
        \       {-  CREATE FAILED\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_name : name option; [@ocaml.doc "The name of the batch segment job.\n"]
  batch_segment_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the batch segment job.\n"]
}
[@@ocaml.doc
  "A truncated version of the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_BatchSegmentJob.html}BatchSegmentJob} \
   datatype. \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListBatchSegmentJobs.html}ListBatchSegmentJobs} \
   operation returns a list of batch segment job summaries.\n"]

type nonrec batch_segment_jobs = batch_segment_job_summary list [@@ocaml.doc ""]

type nonrec list_batch_segment_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is [null] when there are \
         no more results to return.\n"]
  batch_segment_jobs : batch_segment_jobs option;
      [@ocaml.doc "A list containing information on each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_batch_segment_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of batch segment job results to return in each page. The default value \
         is 100.\n"]
  next_token : next_token option; [@ocaml.doc "The token to request the next page of results.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version that the batch segment jobs used \
         to generate batch segments.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_inference_job_mode =
  | THEME_GENERATION [@ocaml.doc ""]
  | BATCH_INFERENCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_inference_job_summary = {
  batch_inference_job_mode : batch_inference_job_mode option; [@ocaml.doc "The job's mode.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc "The ARN of the solution version used by the batch inference job.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the batch inference job failed, the reason for the failure.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the batch inference job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The time at which the batch inference job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the batch inference job. The status is one of the following values:\n\n\
        \ {ul\n\
        \       {-  PENDING\n\
        \           \n\
        \            }\n\
        \       {-  IN PROGRESS\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE\n\
        \           \n\
        \            }\n\
        \       {-  CREATE FAILED\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_name : name option; [@ocaml.doc "The name of the batch inference job.\n"]
  batch_inference_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the batch inference job.\n"]
}
[@@ocaml.doc
  "A truncated version of the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_BatchInferenceJob.html}BatchInferenceJob}. \
   The \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListBatchInferenceJobs.html}ListBatchInferenceJobs} \
   operation returns a list of batch inference job summaries.\n"]

type nonrec batch_inference_jobs = batch_inference_job_summary list [@@ocaml.doc ""]

type nonrec list_batch_inference_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is [null] when there are \
         no more results to return.\n"]
  batch_inference_jobs : batch_inference_jobs option;
      [@ocaml.doc "A list containing information on each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_batch_inference_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of batch inference job results to return in each page. The default \
         value is 100.\n"]
  next_token : next_token option; [@ocaml.doc "The token to request the next page of results.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version from which the batch inference \
         jobs were created.\n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec ingestion_mode = ALL [@ocaml.doc ""] | PUT [@ocaml.doc ""] | BULK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_solution_metrics_response = {
  metrics : metrics option;
      [@ocaml.doc
        "The metrics for the solution version. For more information, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/working-with-training-metrics.html} \
         Evaluating a solution version with metrics }.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc "The same solution version ARN as specified in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_solution_metrics_request = {
  solution_version_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version for which to get metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_expression = string [@@ocaml.doc ""]

type nonrec filter = {
  status : status option; [@ocaml.doc "The status of the filter.\n"]
  filter_expression : filter_expression option;
      [@ocaml.doc
        "Specifies the type of item interactions to filter out of recommendation results. The \
         filter expression must follow specific format rules. For information about filter \
         expression structure and syntax, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/filter-expressions.html}Filter \
         expressions}.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the filter failed, the reason for its failure.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The ARN of the dataset group to which the filter belongs.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the filter was last updated.\n"]
  creation_date_time : date option; [@ocaml.doc "The time at which the filter was created.\n"]
  filter_arn : arn option; [@ocaml.doc "The ARN of the filter.\n"]
  name : name option; [@ocaml.doc "The name of the filter.\n"]
}
[@@ocaml.doc
  "Contains information on a recommendation filter, including its ARN, status, and filter \
   expression.\n"]

type nonrec featurization_parameters = (parameter_name * parameter_value) list [@@ocaml.doc ""]

type nonrec feature_transformation = {
  status : status option;
      [@ocaml.doc
        "The status of the feature transformation.\n\n\
        \ A feature transformation can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  last_updated_date_time : date option;
      [@ocaml.doc "The last update date and time (in Unix time) of the feature transformation.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the feature transformation.\n"]
  default_parameters : featurization_parameters option;
      [@ocaml.doc "Provides the default parameters for feature transformation.\n"]
  feature_transformation_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the FeatureTransformation object.\n"]
  name : name option; [@ocaml.doc "The name of the feature transformation.\n"]
}
[@@ocaml.doc
  "Provides feature transformation information. Feature transformation is the process of modifying \
   raw input data into a form more suitable for model training.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec event_tracker = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the event tracker was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the event tracker was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the event tracker.\n\n\
        \ An event tracker can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that receives the event data.\n"]
  tracking_id : tracking_id option;
      [@ocaml.doc
        "The ID of the event tracker. Include this ID in requests to the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
         API.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account that owns the event tracker.\n"]
  event_tracker_arn : arn option; [@ocaml.doc "The ARN of the event tracker.\n"]
  name : name option; [@ocaml.doc "The name of the event tracker.\n"]
}
[@@ocaml.doc "Provides information about an event tracker.\n"]

type nonrec docker_ur_i = string [@@ocaml.doc ""]

type nonrec describe_solution_version_response = {
  solution_version : solution_version option; [@ocaml.doc "The solution version.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_solution_version_request = {
  solution_version_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the solution version.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_solution_response = {
  solution : solution option; [@ocaml.doc "An object that describes the solution.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_solution_request = {
  solution_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the solution to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec avro_schema = string [@@ocaml.doc ""]

type nonrec dataset_schema = {
  domain : domain option;
      [@ocaml.doc
        "The domain of a schema that you created for a dataset in a Domain dataset group.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the schema was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the schema was created.\n"]
  schema : avro_schema option; [@ocaml.doc "The schema.\n"]
  schema_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the schema.\n"]
  name : name option; [@ocaml.doc "The name of the schema.\n"]
}
[@@ocaml.doc
  "Describes the schema for a dataset. For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

type nonrec describe_schema_response = {
  schema : dataset_schema option; [@ocaml.doc "The requested schema.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_schema_request = {
  schema_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the schema to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recommender_response = {
  recommender : recommender option; [@ocaml.doc "The properties of the recommender.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recommender_request = {
  recommender_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recipe_response = {
  recipe : recipe option; [@ocaml.doc "An object that describes the recipe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recipe_request = {
  recipe_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the recipe to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metric_attribution_response = {
  metric_attribution : metric_attribution option;
      [@ocaml.doc "The details of the metric attribution.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metric_attribution_request = {
  metric_attribution_arn : arn; [@ocaml.doc "The metric attribution's Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_filter_response = {
  filter : filter option; [@ocaml.doc "The filter's details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_filter_request = {
  filter_arn : arn; [@ocaml.doc "The ARN of the filter to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_feature_transformation_response = {
  feature_transformation : feature_transformation option;
      [@ocaml.doc "A listing of the FeatureTransformation properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_feature_transformation_request = {
  feature_transformation_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the feature transformation to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_tracker_response = {
  event_tracker : event_tracker option; [@ocaml.doc "An object that describes the event tracker.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_tracker_request = {
  event_tracker_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the event tracker to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_update_summary = {
  last_updated_date_time : date option;
      [@ocaml.doc "The last update date and time (in Unix time) of the dataset.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the dataset update.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If updating a dataset fails, provides the reason why.\n"]
  status : status option; [@ocaml.doc "The status of the dataset update. \n"]
  schema_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the schema that replaced the previous schema of the \
         dataset.\n"]
}
[@@ocaml.doc "Describes an update to a dataset.\n"]

type nonrec dataset = {
  tracking_id : tracking_id option;
      [@ocaml.doc
        "The ID of the event tracker for an Action interactions dataset. You specify the tracker's \
         ID in the [PutActionInteractions] API operation. Amazon Personalize uses it to direct new \
         data to the Action interactions dataset in your dataset group.\n"]
  latest_dataset_update : dataset_update_summary option;
      [@ocaml.doc "Describes the latest update to the dataset.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "A time stamp that shows when the dataset was updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the dataset.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset.\n\n\
        \ A dataset can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  schema_arn : arn option; [@ocaml.doc "The ARN of the associated schema.\n"]
  dataset_type : dataset_type option;
      [@ocaml.doc
        "One of the following values:\n\n\
        \ {ul\n\
        \       {-  Interactions\n\
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
        \       {-  Action_Interactions\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
  dataset_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset that you want metadata for.\n"]
  name : name option; [@ocaml.doc "The name of the dataset.\n"]
}
[@@ocaml.doc "Provides metadata for a dataset.\n"]

type nonrec describe_dataset_response = {
  dataset : dataset option; [@ocaml.doc "A listing of the dataset's properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_request = {
  dataset_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec data_source = {
  data_location : s3_location option;
      [@ocaml.doc
        "For dataset import jobs, the path to the Amazon S3 bucket where the data that you want to \
         upload to your dataset is stored. For data deletion jobs, the path to the Amazon S3 \
         bucket that stores the list of records to delete. \n\n\
        \  For example: \n\
        \ \n\
        \   [s3://bucket-name/folder-name/fileName.csv] \n\
        \  \n\
        \   If your CSV files are in a folder in your Amazon S3 bucket and you want your import \
         job or data deletion job to consider multiple files, you can specify the path to the \
         folder. With a data deletion job, Amazon Personalize uses all files in the folder and any \
         sub folder. Use the following syntax with a [/] after the folder name:\n\
        \   \n\
        \     [s3://bucket-name/folder-name/] \n\
        \    "]
}
[@@ocaml.doc
  "Describes the data source that contains the data to upload to a dataset, or the list of records \
   to delete from Amazon Personalize.\n"]

type nonrec dataset_import_job = {
  publish_attribution_metrics_to_s3 : boolean_ option;
      [@ocaml.doc "Whether the job publishes metrics to Amazon S3 for a metric attribution.\n"]
  import_mode : import_mode option;
      [@ocaml.doc "The import mode used by the dataset import job to import new records.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If a dataset import job fails, provides the reason why.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) the dataset was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the dataset import job.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset import job.\n\n\
        \ A dataset import job can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  role_arn : arn option;
      [@ocaml.doc
        "The ARN of the IAM role that has permissions to read from the Amazon S3 data source.\n"]
  data_source : data_source option;
      [@ocaml.doc "The Amazon S3 bucket that contains the training data to import.\n"]
  dataset_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset that receives the imported data.\n"]
  dataset_import_job_arn : arn option; [@ocaml.doc "The ARN of the dataset import job.\n"]
  job_name : name option; [@ocaml.doc "The name of the import job.\n"]
}
[@@ocaml.doc
  "Describes a job that imports training data from a data source (Amazon S3 bucket) to an Amazon \
   Personalize dataset. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob}.\n\n\
  \ A dataset import job can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec describe_dataset_import_job_response = {
  dataset_import_job : dataset_import_job option;
      [@ocaml.doc
        "Information about the dataset import job, including the status.\n\n\
        \ The status is one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING\n\
        \            \n\
        \             }\n\
        \        {-  CREATE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE\n\
        \            \n\
        \             }\n\
        \        {-  CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_import_job_request = {
  dataset_import_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_group = {
  domain : domain option; [@ocaml.doc "The domain of a Domain dataset group.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If creating a dataset group fails, provides the reason why.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The last update date and time (in Unix time) of the dataset group.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the dataset group.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used to encrypt \
         the datasets.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the Identity and Access Management (IAM) role that has permissions to access \
         the Key Management Service (KMS) key. Supplying an IAM role is only valid when also \
         specifying a KMS key.\n"]
  status : status option;
      [@ocaml.doc
        "The current status of the dataset group.\n\n\
        \ A dataset group can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
  name : name option; [@ocaml.doc "The name of the dataset group.\n"]
}
[@@ocaml.doc
  "A dataset group is a collection of related datasets (Item interactions, Users, Items, Actions, \
   Action interactions). You create a dataset group by calling \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup}. \
   You then create a dataset and add it to a dataset group by calling \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}. The \
   dataset group is used to create and train a solution by calling \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}. A \
   dataset group can contain only one of each type of dataset.\n\n\
  \ You can specify an Key Management Service (KMS) key to encrypt the datasets in the group.\n\
  \ "]

type nonrec describe_dataset_group_response = {
  dataset_group : dataset_group option; [@ocaml.doc "A listing of the dataset group's properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_group_request = {
  dataset_group_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_export_job_output = { s3_data_destination : s3_data_config [@ocaml.doc ""] }
[@@ocaml.doc "The output configuration parameters of a dataset export job.\n"]

type nonrec dataset_export_job = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a dataset export job fails, provides the reason why.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc
        "The date and time (in Unix time) the status of the dataset export job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the dataset export job.\n"]
  job_output : dataset_export_job_output option;
      [@ocaml.doc
        "The path to the Amazon S3 bucket where the job's output is stored. For example:\n\n\
        \  [s3://bucket-name/folder-name/] \n\
        \ "]
  status : status option;
      [@ocaml.doc
        "The status of the dataset export job.\n\n\
        \ A dataset export job can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data \
         to your output Amazon S3 bucket.\n"]
  ingestion_mode : ingestion_mode option;
      [@ocaml.doc
        "The data to export, based on how you imported the data. You can choose to export [BULK] \
         data that you imported using a dataset import job, [PUT] data that you imported \
         incrementally (using the console, PutEvents, PutUsers and PutItems operations), or [ALL] \
         for both types. The default value is [PUT]. \n"]
  dataset_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset to export.\n"]
  dataset_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset export job.\n"]
  job_name : name option; [@ocaml.doc "The name of the export job.\n"]
}
[@@ocaml.doc
  "Describes a job that exports a dataset to an Amazon S3 bucket. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html}CreateDatasetExportJob}.\n\n\
  \ A dataset export job can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec describe_dataset_export_job_response = {
  dataset_export_job : dataset_export_job option;
      [@ocaml.doc
        "Information about the dataset export job, including the status.\n\n\
        \ The status is one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING\n\
        \            \n\
        \             }\n\
        \        {-  CREATE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        {-  ACTIVE\n\
        \            \n\
        \             }\n\
        \        {-  CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_export_job_request = {
  dataset_export_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset export job to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec data_deletion_job = {
  failure_reason : failure_reason option;
      [@ocaml.doc "If a data deletion job fails, provides the reason why.\n"]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) the data deletion job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The creation date and time (in Unix time) of the data deletion job.\n"]
  num_deleted : integer option; [@ocaml.doc "The number of records deleted by a COMPLETED job.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the data deletion job.\n\n\
        \ A data deletion job can have one of the following statuses:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING > IN_PROGRESS > COMPLETED -or- FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that has permissions to read from the \
         Amazon S3 data source.\n"]
  data_source : data_source option; [@ocaml.doc ""]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group the job deletes records from.\n"]
  data_deletion_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the data deletion job.\n"]
  job_name : name option; [@ocaml.doc "The name of the data deletion job.\n"]
}
[@@ocaml.doc
  "Describes a job that deletes all references to specific users from an Amazon Personalize \
   dataset group in batches. For information about creating a data deletion job, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html}Deleting users}.\n"]

type nonrec describe_data_deletion_job_response = {
  data_deletion_job : data_deletion_job option;
      [@ocaml.doc
        "Information about the data deletion job, including the status.\n\n\
        \ The status is one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        {-  COMPLETED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_data_deletion_job_request = {
  data_deletion_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the data deletion job.\n"]
}
[@@ocaml.doc ""]

type nonrec campaign_update_summary = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the campaign update was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the campaign update was created.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If a campaign update fails, the reason behind the failure.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the campaign update.\n\n\
        \ A campaign update can be in one of the following states:\n\
        \ \n\
        \  {ul\n\
        \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
        \            \n\
        \             }\n\
        \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  campaign_config : campaign_config option; [@ocaml.doc ""]
  min_provisioned_tp_s : transactions_per_second option;
      [@ocaml.doc
        "Specifies the requested minimum provisioned transactions (recommendations) per second \
         that Amazon Personalize will support.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deployed solution version.\n"]
}
[@@ocaml.doc
  "Provides a summary of the properties of a campaign update. For a complete listing, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \
   API.\n"]

type nonrec campaign = {
  latest_campaign_update : campaign_update_summary option;
      [@ocaml.doc
        "Provides a summary of the properties of a campaign update. For a complete listing, call \
         the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \
         API.\n\n\
        \  The [latestCampaignUpdate] field is only returned when the campaign has had at least \
         one [UpdateCampaign] call. \n\
        \  \n\
        \   "]
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the campaign was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix format) that the campaign was created.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If a campaign fails, the reason behind the failure.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the campaign.\n\n\
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
        \  "]
  campaign_config : campaign_config option;
      [@ocaml.doc "The configuration details of a campaign.\n"]
  min_provisioned_tp_s : transactions_per_second option;
      [@ocaml.doc
        "Specifies the requested minimum provisioned transactions (recommendations) per second. A \
         high [minProvisionedTPS] will increase your bill. We recommend starting with 1 for \
         [minProvisionedTPS] (the default). Track your usage using Amazon CloudWatch metrics, and \
         increase the [minProvisionedTPS] as necessary.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the solution version the campaign uses.\n"]
  campaign_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign. \n"]
  name : name option; [@ocaml.doc "The name of the campaign.\n"]
}
[@@ocaml.doc
  "An object that describes the deployment of a solution version. For more information on \
   campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n"]

type nonrec describe_campaign_response = {
  campaign : campaign option;
      [@ocaml.doc
        " The [latestCampaignUpdate] field is only returned when the campaign has had at least one \
         [UpdateCampaign] call. \n\
        \ \n\
        \   The properties of the campaign.\n\
        \   \n\
        \     The [latestCampaignUpdate] field is only returned when the campaign has had at least \
         one [UpdateCampaign] call.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec describe_campaign_request = {
  campaign_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_segment_job_input = { s3_data_source : s3_data_config [@ocaml.doc ""] }
[@@ocaml.doc "The input configuration of a batch segment job.\n"]

type nonrec batch_segment_job_output = { s3_data_destination : s3_data_config [@ocaml.doc ""] }
[@@ocaml.doc "The output configuration parameters of a batch segment job.\n"]

type nonrec batch_segment_job = {
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the batch segment job last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The time at which the batch segment job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the batch segment job. The status is one of the following values:\n\n\
        \ {ul\n\
        \       {-  PENDING\n\
        \           \n\
        \            }\n\
        \       {-  IN PROGRESS\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE\n\
        \           \n\
        \            }\n\
        \       {-  CREATE FAILED\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the Amazon Identity and Access Management (IAM) role that requested the batch \
         segment job.\n"]
  job_output : batch_segment_job_output option;
      [@ocaml.doc
        "The Amazon S3 bucket that contains the output data generated by the batch segment job.\n"]
  job_input : batch_segment_job_input option;
      [@ocaml.doc
        "The Amazon S3 path that leads to the input data used to generate the batch segment job.\n"]
  num_results : num_batch_results option;
      [@ocaml.doc
        "The number of predicted users generated by the batch segment job for each line of input \
         data. The maximum number of users per segment is 5 million.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version used by the batch segment job to \
         generate batch segments.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the batch segment job failed, the reason for the failure.\n"]
  filter_arn : arn option; [@ocaml.doc "The ARN of the filter used on the batch segment job.\n"]
  batch_segment_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the batch segment job.\n"]
  job_name : name option; [@ocaml.doc "The name of the batch segment job.\n"]
}
[@@ocaml.doc "Contains information on a batch segment job.\n"]

type nonrec describe_batch_segment_job_response = {
  batch_segment_job : batch_segment_job option;
      [@ocaml.doc "Information on the specified batch segment job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_batch_segment_job_request = {
  batch_segment_job_arn : arn; [@ocaml.doc "The ARN of the batch segment job to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_inference_job_input = {
  s3_data_source : s3_data_config;
      [@ocaml.doc
        "The URI of the Amazon S3 location that contains your input data. The Amazon S3 bucket \
         must be in the same region as the API endpoint you are calling.\n"]
}
[@@ocaml.doc "The input configuration of a batch inference job.\n"]

type nonrec batch_inference_job_output = {
  s3_data_destination : s3_data_config;
      [@ocaml.doc
        "Information on the Amazon S3 bucket in which the batch inference job's output is stored.\n"]
}
[@@ocaml.doc "The output configuration parameters of a batch inference job.\n"]

type nonrec batch_inference_job_config = {
  ranking_influence : ranking_influence option;
      [@ocaml.doc
        "A map of ranking influence values for POPULARITY and FRESHNESS. For each key, specify a \
         numerical value between 0.0 and 1.0 that determines how much influence that ranking \
         factor has on the final recommendations. A value closer to 1.0 gives more weight to the \
         factor, while a value closer to 0.0 reduces its influence.\n"]
  item_exploration_config : hyper_parameters option;
      [@ocaml.doc
        "A string to string map specifying the exploration configuration hyperparameters, \
         including [explorationWeight] and [explorationItemAgeCutOff], you want to use to \
         configure the amount of item exploration Amazon Personalize uses when recommending items. \
         See \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html}User-Personalization}.\n"]
}
[@@ocaml.doc "The configuration details of a batch inference job.\n"]

type nonrec batch_inference_job = {
  last_updated_date_time : date option;
      [@ocaml.doc "The time at which the batch inference job was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The time at which the batch inference job was created.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the batch inference job. The status is one of the following values:\n\n\
        \ {ul\n\
        \       {-  PENDING\n\
        \           \n\
        \            }\n\
        \       {-  IN PROGRESS\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE\n\
        \           \n\
        \            }\n\
        \       {-  CREATE FAILED\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  theme_generation_config : theme_generation_config option;
      [@ocaml.doc "The job's theme generation settings.\n"]
  batch_inference_job_mode : batch_inference_job_mode option; [@ocaml.doc "The job's mode.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the Amazon Identity and Access Management (IAM) role that requested the batch \
         inference job.\n"]
  batch_inference_job_config : batch_inference_job_config option;
      [@ocaml.doc "A string to string map of the configuration details of a batch inference job.\n"]
  job_output : batch_inference_job_output option;
      [@ocaml.doc
        "The Amazon S3 bucket that contains the output data generated by the batch inference job.\n"]
  job_input : batch_inference_job_input option;
      [@ocaml.doc
        "The Amazon S3 path that leads to the input data used to generate the batch inference job.\n"]
  num_results : num_batch_results option;
      [@ocaml.doc
        "The number of recommendations generated by the batch inference job. This number includes \
         the error messages generated for failed input records.\n"]
  solution_version_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version from which the batch inference job \
         was created.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "If the batch inference job failed, the reason for the failure.\n"]
  filter_arn : arn option; [@ocaml.doc "The ARN of the filter used on the batch inference job.\n"]
  batch_inference_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the batch inference job.\n"]
  job_name : name option; [@ocaml.doc "The name of the batch inference job.\n"]
}
[@@ocaml.doc "Contains information on a batch inference job.\n"]

type nonrec describe_batch_inference_job_response = {
  batch_inference_job : batch_inference_job option;
      [@ocaml.doc "Information on the specified batch inference job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_batch_inference_job_request = {
  batch_inference_job_arn : arn; [@ocaml.doc "The ARN of the batch inference job to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec algorithm_image = {
  docker_ur_i : docker_ur_i;
      [@ocaml.doc "The URI of the Docker container for the algorithm image.\n"]
  name : name option; [@ocaml.doc "The name of the algorithm image.\n"]
}
[@@ocaml.doc "Describes an algorithm image.\n"]

type nonrec default_integer_hyper_parameter_range = {
  is_tunable : tunable option; [@ocaml.doc "Indicates whether the hyperparameter is tunable.\n"]
  max_value : integer_max_value option;
      [@ocaml.doc "The maximum allowable value for the hyperparameter.\n"]
  min_value : integer_min_value option;
      [@ocaml.doc "The minimum allowable value for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc
  "Provides the name and default range of a integer-valued hyperparameter and whether the \
   hyperparameter is tunable. A tunable hyperparameter can have its value determined during \
   hyperparameter optimization (HPO).\n"]

type nonrec default_integer_hyper_parameter_ranges = default_integer_hyper_parameter_range list
[@@ocaml.doc ""]

type nonrec default_continuous_hyper_parameter_range = {
  is_tunable : tunable option; [@ocaml.doc "Whether the hyperparameter is tunable.\n"]
  max_value : continuous_max_value option;
      [@ocaml.doc "The maximum allowable value for the hyperparameter.\n"]
  min_value : continuous_min_value option;
      [@ocaml.doc "The minimum allowable value for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc
  "Provides the name and default range of a continuous hyperparameter and whether the \
   hyperparameter is tunable. A tunable hyperparameter can have its value determined during \
   hyperparameter optimization (HPO).\n"]

type nonrec default_continuous_hyper_parameter_ranges =
  default_continuous_hyper_parameter_range list
[@@ocaml.doc ""]

type nonrec default_categorical_hyper_parameter_range = {
  is_tunable : tunable option; [@ocaml.doc "Whether the hyperparameter is tunable.\n"]
  values : categorical_values option;
      [@ocaml.doc "A list of the categories for the hyperparameter.\n"]
  name : parameter_name option; [@ocaml.doc "The name of the hyperparameter.\n"]
}
[@@ocaml.doc
  "Provides the name and default range of a categorical hyperparameter and whether the \
   hyperparameter is tunable. A tunable hyperparameter can have its value determined during \
   hyperparameter optimization (HPO).\n"]

type nonrec default_categorical_hyper_parameter_ranges =
  default_categorical_hyper_parameter_range list
[@@ocaml.doc ""]

type nonrec default_hyper_parameter_ranges = {
  categorical_hyper_parameter_ranges : default_categorical_hyper_parameter_ranges option;
      [@ocaml.doc "The categorical hyperparameters and their default ranges.\n"]
  continuous_hyper_parameter_ranges : default_continuous_hyper_parameter_ranges option;
      [@ocaml.doc "The continuous hyperparameters and their default ranges.\n"]
  integer_hyper_parameter_ranges : default_integer_hyper_parameter_ranges option;
      [@ocaml.doc "The integer-valued hyperparameters and their default ranges.\n"]
}
[@@ocaml.doc
  "Specifies the hyperparameters and their default ranges. Hyperparameters can be categorical, \
   continuous, or integer-valued.\n"]

type nonrec algorithm = {
  last_updated_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the algorithm was last updated.\n"]
  creation_date_time : date option;
      [@ocaml.doc "The date and time (in Unix time) that the algorithm was created.\n"]
  role_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the role.\n"]
  training_input_mode : training_input_mode option; [@ocaml.doc "The training input mode.\n"]
  default_resource_config : resource_config option;
      [@ocaml.doc
        "Specifies the default maximum number of training jobs and parallel training jobs.\n"]
  default_hyper_parameter_ranges : default_hyper_parameter_ranges option;
      [@ocaml.doc
        "Specifies the default hyperparameters, their ranges, and whether they are tunable. A \
         tunable hyperparameter can have its value determined during hyperparameter optimization \
         (HPO).\n"]
  default_hyper_parameters : hyper_parameters option;
      [@ocaml.doc "Specifies the default hyperparameters.\n"]
  algorithm_image : algorithm_image option;
      [@ocaml.doc "The URI of the Docker container for the algorithm image.\n"]
  algorithm_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the algorithm.\n"]
  name : name option; [@ocaml.doc "The name of the algorithm.\n"]
}
[@@ocaml.doc "Describes a custom algorithm.\n"]

type nonrec describe_algorithm_response = {
  algorithm : algorithm option; [@ocaml.doc "A listing of the properties of the algorithm.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_algorithm_request = {
  algorithm_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the algorithm to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_solution_request = {
  solution_arn : arn; [@ocaml.doc "The ARN of the solution to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_schema_request = {
  schema_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the schema to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_recommender_request = {
  recommender_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_metric_attribution_request = {
  metric_attribution_arn : arn; [@ocaml.doc "The metric attribution's Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_filter_request = {
  filter_arn : arn; [@ocaml.doc "The ARN of the filter to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_tracker_request = {
  event_tracker_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the event tracker to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_request = {
  dataset_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_group_request = {
  dataset_group_arn : arn; [@ocaml.doc "The ARN of the dataset group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_campaign_request = {
  campaign_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_solution_version_response = {
  solution_version_arn : arn option; [@ocaml.doc "The ARN of the new solution version.\n"]
}
[@@ocaml.doc ""]

type nonrec create_solution_version_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the solution version.\n"]
  training_mode : training_mode option;
      [@ocaml.doc
        "The scope of training to be performed when creating the solution version. The default is \
         [FULL]. This creates a completely new model based on the entirety of the training data \
         from the datasets in your dataset group. \n\n\
        \ If you use \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html}User-Personalization}, \
         you can specify a training mode of [UPDATE]. This updates the model to consider new items \
         for recommendations. It is not a full retraining. You should still complete a full \
         retraining weekly. If you specify [UPDATE], Amazon Personalize will stop automatic \
         updates for the solution version. To resume updates, create a new solution with training \
         mode set to [FULL] and deploy it in a campaign. For more information about automatic \
         updates, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/use-case-recipe-features.html#maintaining-with-automatic-updates}Automatic \
         updates}. \n\
        \ \n\
        \  The [UPDATE] option can only be used when you already have an active solution version \
         created from the input solution using the [FULL] option and the input solution was \
         trained with the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html}User-Personalization} \
         recipe or the legacy \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-hrnn-coldstart.html}HRNN-Coldstart} \
         recipe.\n\
        \  "]
  solution_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution containing the training configuration \
         information.\n"]
  name : name option; [@ocaml.doc "The name of the solution version.\n"]
}
[@@ocaml.doc ""]

type nonrec create_solution_response = {
  solution_arn : arn option; [@ocaml.doc "The ARN of the solution.\n"]
}
[@@ocaml.doc ""]

type nonrec create_solution_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the solution.\n"]
  solution_config : solution_config option;
      [@ocaml.doc
        "The configuration properties for the solution. When [performAutoML] is set to true, \
         Amazon Personalize only evaluates the [autoMLConfig] section of the solution \
         configuration.\n\n\
        \  Amazon Personalize doesn't support configuring the [hpoObjective] at this time.\n\
        \  \n\
        \   "]
  event_type : event_type option;
      [@ocaml.doc
        "When your have multiple event types (using an [EVENT_TYPE] schema field), this parameter \
         specifies which event type (for example, 'click' or 'like') is used for training the \
         model.\n\n\
        \ If you do not provide an [eventType], Amazon Personalize will use all interactions for \
         training with equal weight regardless of type.\n\
        \ "]
  dataset_group_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that provides the training data.\n"]
  recipe_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the recipe to use for model training. This is required \
         when [performAutoML] is false. For information about different Amazon Personalize recipes \
         and their ARNs, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/working-with-predefined-recipes.html}Choosing \
         a recipe}. \n"]
  perform_incremental_update : perform_incremental_update option;
      [@ocaml.doc
        "Whether to perform incremental training updates on your model. When enabled, this allows \
         the model to learn from new data more frequently without requiring full retraining, which \
         enables near real-time personalization. This parameter is supported only for solutions \
         that use the semantic-similarity recipe.\n"]
  perform_auto_training : perform_auto_training option;
      [@ocaml.doc
        "Whether the solution uses automatic training to create new solution versions (trained \
         models). The default is [True] and the solution automatically creates new solution \
         versions every 7 days. You can change the training frequency by specifying a \
         [schedulingExpression] in the [AutoTrainingConfig] as part of solution configuration. For \
         more information about automatic training, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html}Configuring \
         automatic training}.\n\n\
        \  Automatic solution version creation starts within one hour after the solution is \
         ACTIVE. If you manually create a solution version within the hour, the solution skips the \
         first automatic training. \n\
        \ \n\
        \   After training starts, you can get the solution version's Amazon Resource Name (ARN) \
         with the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \
         API operation. To get its status, use the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \n\
        \  "]
  perform_auto_m_l : perform_auto_m_l option;
      [@ocaml.doc
        " We don't recommend enabling automated machine learning. Instead, match your use case to \
         the available Amazon Personalize recipes. For more information, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/working-with-predefined-recipes.html}Choosing \
         a recipe}.\n\
        \ \n\
        \   Whether to perform automated machine learning (AutoML). The default is [false]. For \
         this case, you must specify [recipeArn].\n\
        \   \n\
        \    When set to [true], Amazon Personalize analyzes your training data and selects the \
         optimal USER_PERSONALIZATION recipe and hyperparameters. In this case, you must omit \
         [recipeArn]. Amazon Personalize determines the optimal recipe by running tests with \
         different values for the hyperparameters. AutoML lengthens the training process as \
         compared to selecting a specific recipe.\n\
        \    "]
  perform_hp_o : boolean_ option;
      [@ocaml.doc
        "Whether to perform hyperparameter optimization (HPO) on the specified or selected recipe. \
         The default is [false].\n\n\
        \ When performing AutoML, this parameter is always [true] and you should not set it to \
         [false].\n\
        \ "]
  name : name; [@ocaml.doc "The name for the solution.\n"]
}
[@@ocaml.doc ""]

type nonrec create_schema_response = {
  schema_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the created schema.\n"]
}
[@@ocaml.doc ""]

type nonrec create_schema_request = {
  domain : domain option;
      [@ocaml.doc
        "The domain for the schema. If you are creating a schema for a dataset in a Domain dataset \
         group, specify the domain you chose when you created the Domain dataset group.\n"]
  schema : avro_schema; [@ocaml.doc "A schema in Avro JSON format.\n"]
  name : name; [@ocaml.doc "The name for the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec create_recommender_response = {
  recommender_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the recommender.\n"]
}
[@@ocaml.doc ""]

type nonrec create_recommender_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the recommender.\n"]
  recommender_config : recommender_config option;
      [@ocaml.doc "The configuration details of the recommender.\n"]
  recipe_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the recipe that the recommender will use. For a \
         recommender, a recipe is a Domain dataset group use case. Only Domain dataset group use \
         cases can be used to create a recommender. For information about use cases see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/domain-use-cases.html}Choosing \
         recommender use cases}. \n"]
  dataset_group_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the destination domain dataset group for the recommender.\n"]
  name : name; [@ocaml.doc "The name of the recommender.\n"]
}
[@@ocaml.doc ""]

type nonrec create_metric_attribution_response = {
  metric_attribution_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the new metric attribution.\n"]
}
[@@ocaml.doc ""]

type nonrec create_metric_attribution_request = {
  metrics_output_config : metric_attribution_output;
      [@ocaml.doc "The output configuration details for the metric attribution.\n"]
  metrics : metric_attributes;
      [@ocaml.doc
        "A list of metric attributes for the metric attribution. Each metric attribute specifies \
         an event type to track and a function. Available functions are [SUM()] or \
         [SAMPLECOUNT()]. For SUM() functions, provide the dataset type (either Interactions or \
         Items) and column to sum as a parameter. For example SUM(Items.PRICE).\n"]
  dataset_group_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the destination dataset group for the metric attribution.\n"]
  name : name; [@ocaml.doc "A name for the metric attribution.\n"]
}
[@@ocaml.doc ""]

type nonrec create_filter_response = {
  filter_arn : arn option; [@ocaml.doc "The ARN of the new filter.\n"]
}
[@@ocaml.doc ""]

type nonrec create_filter_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the filter.\n"]
  filter_expression : filter_expression;
      [@ocaml.doc
        "The filter expression defines which items are included or excluded from recommendations. \
         Filter expression must follow specific format rules. For information about filter \
         expression structure and syntax, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/filter-expressions.html}Filter \
         expressions}.\n"]
  dataset_group_arn : arn;
      [@ocaml.doc "The ARN of the dataset group that the filter will belong to.\n"]
  name : name; [@ocaml.doc "The name of the filter to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_tracker_response = {
  tracking_id : tracking_id option;
      [@ocaml.doc
        "The ID of the event tracker. Include this ID in requests to the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
         API.\n"]
  event_tracker_arn : arn option; [@ocaml.doc "The ARN of the event tracker.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_tracker_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the event tracker.\n"]
  dataset_group_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that receives the event data.\n"]
  name : name; [@ocaml.doc "The name for the event tracker.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_response = {
  dataset_arn : arn option; [@ocaml.doc "The ARN of the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the dataset.\n"]
  dataset_type : dataset_type;
      [@ocaml.doc
        "The type of dataset.\n\n\
        \ One of the following (case insensitive) values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Interactions\n\
        \            \n\
        \             }\n\
        \        {-  Items\n\
        \            \n\
        \             }\n\
        \        {-  Users\n\
        \            \n\
        \             }\n\
        \        {-  Actions\n\
        \            \n\
        \             }\n\
        \        {-  Action_Interactions\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  dataset_group_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group to add the dataset to.\n"]
  schema_arn : arn;
      [@ocaml.doc
        "The ARN of the schema to associate with the dataset. The schema defines the dataset fields.\n"]
  name : name; [@ocaml.doc "The name for the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_import_job_response = {
  dataset_import_job_arn : arn option; [@ocaml.doc "The ARN of the dataset import job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_import_job_request = {
  publish_attribution_metrics_to_s3 : boolean_ option;
      [@ocaml.doc
        "If you created a metric attribution, specify whether to publish metrics for this import \
         job to Amazon S3\n"]
  import_mode : import_mode option;
      [@ocaml.doc
        "Specify how to add the new records to an existing dataset. The default import mode is \
         [FULL]. If you haven't imported bulk records into the dataset previously, you can only \
         specify [FULL].\n\n\
        \ {ul\n\
        \       {-  Specify [FULL] to overwrite all existing bulk data in your dataset. Data you \
         imported individually is not replaced.\n\
        \           \n\
        \            }\n\
        \       {-  Specify [INCREMENTAL] to append the new records to the existing data in your \
         dataset. Amazon Personalize replaces any record with the same ID with the new one.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the dataset import job.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role that has permissions to read from the Amazon S3 data source.\n"]
  data_source : data_source;
      [@ocaml.doc "The Amazon S3 bucket that contains the training data to import.\n"]
  dataset_arn : arn; [@ocaml.doc "The ARN of the dataset that receives the imported data.\n"]
  job_name : name; [@ocaml.doc "The name for the dataset import job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_group_response = {
  domain : domain option; [@ocaml.doc "The domain for the new Domain dataset group.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the new dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_group_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the dataset group.\n"]
  domain : domain option;
      [@ocaml.doc
        "The domain of the dataset group. Specify a domain to create a Domain dataset group. The \
         domain you specify determines the default schemas for datasets and the use cases \
         available for recommenders. If you don't specify a domain, you create a Custom dataset \
         group with solution versions that you deploy with a campaign. \n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a Key Management Service (KMS) key used to encrypt the \
         datasets.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the Identity and Access Management (IAM) role that has permissions to access \
         the Key Management Service (KMS) key. Supplying an IAM role is only valid when also \
         specifying a KMS key.\n"]
  name : name; [@ocaml.doc "The name for the new dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_export_job_response = {
  dataset_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset export job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_export_job_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the dataset export job.\n"]
  job_output : dataset_export_job_output;
      [@ocaml.doc "The path to the Amazon S3 bucket where the job's output is stored.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data \
         to your output Amazon S3 bucket.\n"]
  ingestion_mode : ingestion_mode option;
      [@ocaml.doc
        "The data to export, based on how you imported the data. You can choose to export only \
         [BULK] data that you imported using a dataset import job, only [PUT] data that you \
         imported incrementally (using the console, PutEvents, PutUsers and PutItems operations), \
         or [ALL] for both types. The default value is [PUT]. \n"]
  dataset_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset that contains the data to export.\n"]
  job_name : name; [@ocaml.doc "The name for the dataset export job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_deletion_job_response = {
  data_deletion_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the data deletion job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_deletion_job_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the data deletion job.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that has permissions to read from the \
         Amazon S3 data source.\n"]
  data_source : data_source;
      [@ocaml.doc
        "The Amazon S3 bucket that contains the list of userIds of the users to delete.\n"]
  dataset_group_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that has the datasets you want to \
         delete records from.\n"]
  job_name : name; [@ocaml.doc "The name for the data deletion job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_campaign_response = {
  campaign_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the campaign.\n"]
}
[@@ocaml.doc ""]

type nonrec create_campaign_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the campaign.\n"]
  campaign_config : campaign_config option;
      [@ocaml.doc "The configuration details of a campaign.\n"]
  min_provisioned_tp_s : transactions_per_second option;
      [@ocaml.doc
        "Specifies the requested minimum provisioned transactions (recommendations) per second \
         that Amazon Personalize will support. A high [minProvisionedTPS] will increase your bill. \
         We recommend starting with 1 for [minProvisionedTPS] (the default). Track your usage \
         using Amazon CloudWatch metrics, and increase the [minProvisionedTPS] as necessary.\n"]
  solution_version_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the trained model to deploy with the campaign. To \
         specify the latest solution version of your solution, specify the ARN of your {i \
         solution} in [SolutionArn/$LATEST] format. You must use this format if you set \
         [syncWithLatestSolutionVersion] to [True] in the \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CampaignConfig.html}CampaignConfig}. \
         \n\n\
        \  To deploy a model that isn't the latest solution version of your solution, specify the \
         ARN of the solution version. \n\
        \ \n\
        \   For more information about automatic campaign updates, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update}Enabling \
         automatic campaign updates}. \n\
        \  "]
  name : name;
      [@ocaml.doc
        "A name for the new campaign. The campaign name must be unique within your account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_segment_job_response = {
  batch_segment_job_arn : arn option; [@ocaml.doc "The ARN of the batch segment job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_segment_job_request = {
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the batch segment job.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the Amazon Identity and Access Management role that has permissions to read \
         and write to your input and output Amazon S3 buckets respectively.\n"]
  job_output : batch_segment_job_output;
      [@ocaml.doc "The Amazon S3 path for the bucket where the job's output will be stored.\n"]
  job_input : batch_segment_job_input;
      [@ocaml.doc "The Amazon S3 path for the input data used to generate the batch segment job.\n"]
  num_results : num_batch_results option;
      [@ocaml.doc
        "The number of predicted users generated by the batch segment job for each line of input \
         data. The maximum number of users per segment is 5 million.\n"]
  filter_arn : arn option;
      [@ocaml.doc
        "The ARN of the filter to apply to the batch segment job. For more information on using \
         filters, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/filter-batch.html}Filtering batch \
         recommendations}.\n"]
  solution_version_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version you want the batch segment job to \
         use to generate batch segments.\n"]
  job_name : name; [@ocaml.doc "The name of the batch segment job to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_inference_job_response = {
  batch_inference_job_arn : arn option; [@ocaml.doc "The ARN of the batch inference job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_inference_job_request = {
  theme_generation_config : theme_generation_config option;
      [@ocaml.doc
        "For theme generation jobs, specify the name of the column in your Items dataset that \
         contains each item's name.\n"]
  batch_inference_job_mode : batch_inference_job_mode option;
      [@ocaml.doc
        "The mode of the batch inference job. To generate descriptive themes for groups of similar \
         items, set the job mode to [THEME_GENERATION]. If you don't want to generate themes, use \
         the default [BATCH_INFERENCE].\n\n\
        \  When you get batch recommendations with themes, you will incur additional costs. For \
         more information, see {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize \
         pricing}. \n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} to \
         apply to the batch inference job.\n"]
  batch_inference_job_config : batch_inference_job_config option;
      [@ocaml.doc "The configuration details of a batch inference job.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the Amazon Identity and Access Management role that has permissions to read \
         and write to your input and output Amazon S3 buckets respectively.\n"]
  job_output : batch_inference_job_output;
      [@ocaml.doc "The path to the Amazon S3 bucket where the job's output will be stored.\n"]
  job_input : batch_inference_job_input;
      [@ocaml.doc
        "The Amazon S3 path that leads to the input file to base your recommendations on. The \
         input material must be in JSON format.\n"]
  num_results : num_batch_results option;
      [@ocaml.doc "The number of recommendations to retrieve.\n"]
  filter_arn : arn option;
      [@ocaml.doc
        "The ARN of the filter to apply to the batch inference job. For more information on using \
         filters, see \
         {{:https://docs.aws.amazon.com/personalize/latest/dg/filter-batch.html}Filtering batch \
         recommendations}.\n"]
  solution_version_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the solution version that will be used to generate the \
         batch inference recommendations.\n"]
  job_name : name; [@ocaml.doc "The name of the batch inference job to create.\n"]
}
[@@ocaml.doc ""]
