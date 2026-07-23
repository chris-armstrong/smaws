open Types

module CreateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_input ->
    ( create_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_input ->
    ( create_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a compute fleet.\n"]

module CreateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_input ->
    ( create_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_input ->
    ( create_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a build project.\n"]

module CreateReportGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_report_group_input ->
    ( create_report_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_report_group_input ->
    ( create_report_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a report group. A report group contains a collection of reports. \n"]

module CreateWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `OAuthProviderException of o_auth_provider_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_webhook_input ->
    ( create_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_webhook_input ->
    ( create_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For an existing CodeBuild build project that has its source code stored in a GitHub or \
   Bitbucket repository, enables CodeBuild to start rebuilding the source code every time a code \
   change is pushed to the repository.\n\n\
  \  If you enable webhooks for an CodeBuild project, and the project is used as a build step in \
   CodePipeline, then two identical builds are created for each commit. One build is triggered \
   through webhooks, and one through CodePipeline. Because billing is on a per-build basis, you \
   are billed for both builds. Therefore, if you are using CodePipeline, we recommend that you \
   disable webhooks in CodeBuild. In the CodeBuild console, clear the Webhook box. For more \
   information, see step 5 in \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console}Change \
   a Build Project's Settings}.\n\
  \  \n\
  \   "]

module DeleteBuildBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_build_batch_input ->
    ( delete_build_batch_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_build_batch_input ->
    ( delete_build_batch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a batch build.\n"]

module DeleteFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_input ->
    ( delete_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_input ->
    ( delete_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a compute fleet. When you delete a compute fleet, its builds are not deleted.\n"]

module DeleteProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_input ->
    ( delete_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_input ->
    ( delete_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes a build project. When you delete a project, its builds are not deleted. \n"]

module DeleteReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_report_input ->
    ( delete_report_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_report_input ->
    ( delete_report_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes a report. \n"]

module DeleteReportGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_report_group_input ->
    ( delete_report_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_report_group_input ->
    ( delete_report_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a report group. Before you delete a report group, you must delete its reports. \n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_input ->
    ( delete_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_input ->
    ( delete_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes a resource policy that is identified by its resource ARN. \n"]

module DeleteSourceCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_source_credentials_input ->
    ( delete_source_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_source_credentials_input ->
    ( delete_source_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. \n"]

module DeleteWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `OAuthProviderException of o_auth_provider_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For an existing CodeBuild build project that has its source code stored in a GitHub or \
   Bitbucket repository, stops CodeBuild from rebuilding the source code every time a code change \
   is pushed to the repository.\n"]

module DescribeCodeCoverages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_code_coverages_input ->
    ( describe_code_coverages_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_code_coverages_input ->
    ( describe_code_coverages_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves one or more code coverage reports.\n"]

module DescribeTestCases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_test_cases_input ->
    ( describe_test_cases_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_test_cases_input ->
    ( describe_test_cases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns a list of details about test cases for a report. \n"]

module GetReportGroupTrend : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_report_group_trend_input ->
    ( get_report_group_trend_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_report_group_trend_input ->
    ( get_report_group_trend_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Analyzes and accumulates test report values for the specified test reports.\n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Gets a resource policy that is identified by its resource ARN. \n"]

module ImportSourceCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_source_credentials_input ->
    ( import_source_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_source_credentials_input ->
    ( import_source_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Imports the source repository credentials for an CodeBuild project that has its source code \
   stored in a GitHub, GitHub Enterprise, GitLab, GitLab Self Managed, or Bitbucket repository. \n"]

module InvalidateProjectCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    invalidate_project_cache_input ->
    ( invalidate_project_cache_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    invalidate_project_cache_input ->
    ( invalidate_project_cache_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Resets the cache for a project.\n"]

module ListBuildBatches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_build_batches_input ->
    ( list_build_batches_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_build_batches_input ->
    ( list_build_batches_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the identifiers of your build batches in the current region.\n"]

module ListBuildBatchesForProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_build_batches_for_project_input ->
    ( list_build_batches_for_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_build_batches_for_project_input ->
    ( list_build_batches_for_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the identifiers of the build batches for a specific project.\n"]

module ListBuilds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_builds_input ->
    ( list_builds_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_builds_input ->
    ( list_builds_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of build IDs, with each build ID representing a single build.\n"]

module ListBuildsForProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_builds_for_project_input ->
    ( list_builds_for_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_builds_for_project_input ->
    ( list_builds_for_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of build identifiers for the specified build project, with each build identifier \
   representing a single build.\n"]

module ListCommandExecutionsForSandbox : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_command_executions_for_sandbox_input ->
    ( list_command_executions_for_sandbox_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_command_executions_for_sandbox_input ->
    ( list_command_executions_for_sandbox_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of command executions for a sandbox.\n"]

module ListCuratedEnvironmentImages : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_curated_environment_images_input ->
    (list_curated_environment_images_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_curated_environment_images_input ->
    ( list_curated_environment_images_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about Docker images that are managed by CodeBuild.\n"]

module ListFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fleets_input ->
    ( list_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fleets_input ->
    ( list_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of compute fleet names with each compute fleet name representing a single compute \
   fleet.\n"]

module ListProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_projects_input ->
    ( list_projects_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_projects_input ->
    ( list_projects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of build project names, with each build project name representing a single build \
   project.\n"]

module ListReportGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_report_groups_input ->
    ( list_report_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_report_groups_input ->
    ( list_report_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets a list ARNs for the report groups in the current Amazon Web Services account. \n"]

module ListReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reports_input ->
    ( list_reports_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reports_input ->
    ( list_reports_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of ARNs for the reports in the current Amazon Web Services account. \n"]

module ListReportsForReportGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reports_for_report_group_input ->
    ( list_reports_for_report_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reports_for_report_group_input ->
    ( list_reports_for_report_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns a list of ARNs for the reports that belong to a [ReportGroup]. \n"]

module ListSandboxes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sandboxes_input ->
    ( list_sandboxes_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sandboxes_input ->
    ( list_sandboxes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of sandboxes.\n"]

module ListSandboxesForProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sandboxes_for_project_input ->
    ( list_sandboxes_for_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sandboxes_for_project_input ->
    ( list_sandboxes_for_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of sandboxes for a given project.\n"]

module ListSharedProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_shared_projects_input ->
    ( list_shared_projects_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_shared_projects_input ->
    ( list_shared_projects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets a list of projects that are shared with other Amazon Web Services accounts or users. \n"]

module ListSharedReportGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_shared_report_groups_input ->
    ( list_shared_report_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_shared_report_groups_input ->
    ( list_shared_report_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets a list of report groups that are shared with other Amazon Web Services accounts or users. \n"]

module ListSourceCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_source_credentials_input ->
    ( list_source_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_source_credentials_input ->
    ( list_source_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns a list of [SourceCredentialsInfo] objects. \n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_input ->
    ( put_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_input ->
    ( put_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Stores a resource policy for the ARN of a [Project] or [ReportGroup] object. \n"]

module RetryBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retry_build_input ->
    ( retry_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retry_build_input ->
    ( retry_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restarts a build.\n"]

module RetryBuildBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retry_build_batch_input ->
    ( retry_build_batch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retry_build_batch_input ->
    ( retry_build_batch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restarts a failed batch build. Only batch builds that have failed can be retried.\n"]

module StartBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_build_input ->
    ( start_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_build_input ->
    ( start_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts running a build with the settings defined in the project. These setting include: how to \
   run a build, where to get the source code, which build environment to use, which build commands \
   to run, and where to store the build output.\n\n\
  \ You can also start a build run by overriding some of the build settings in the project. The \
   overrides only apply for that specific start build request. The settings in the project are \
   unaltered.\n\
  \ "]

module StartBuildBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_build_batch_input ->
    ( start_build_batch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_build_batch_input ->
    ( start_build_batch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a batch build for a project.\n"]

module StartCommandExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_command_execution_input ->
    ( start_command_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_command_execution_input ->
    ( start_command_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a command execution.\n"]

module StartSandbox : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountSuspendedException of account_suspended_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_sandbox_input ->
    ( start_sandbox_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountSuspendedException of account_suspended_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_sandbox_input ->
    ( start_sandbox_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountSuspendedException of account_suspended_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a sandbox.\n"]

module StartSandboxConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_sandbox_connection_input ->
    ( start_sandbox_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_sandbox_connection_input ->
    ( start_sandbox_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a sandbox connection.\n"]

module StopBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_build_input ->
    ( stop_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_build_input ->
    ( stop_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Attempts to stop running a build.\n"]

module StopBuildBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_build_batch_input ->
    ( stop_build_batch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_build_batch_input ->
    ( stop_build_batch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a running batch build.\n"]

module StopSandbox : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_sandbox_input ->
    ( stop_sandbox_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_sandbox_input ->
    ( stop_sandbox_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a sandbox.\n"]

module UpdateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccountLimitExceededException of account_limit_exceeded_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_input ->
    ( update_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_input ->
    ( update_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountLimitExceededException of account_limit_exceeded_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a compute fleet.\n"]

module UpdateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_project_input ->
    ( update_project_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_project_input ->
    ( update_project_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the settings of a build project.\n"]

module UpdateProjectVisibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_project_visibility_input ->
    ( update_project_visibility_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_project_visibility_input ->
    ( update_project_visibility_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the public visibility for a project. The project's build results, logs, and artifacts \
   are available to the general public. For more information, see \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/public-builds.html}Public build \
   projects} in the {i CodeBuild User Guide}.\n\n\
  \  The following should be kept in mind when making your projects public:\n\
  \  \n\
  \   {ul\n\
  \         {-  All of a project's build results, logs, and artifacts, including builds that were \
   run when the project was private, are available to the general public.\n\
  \             \n\
  \              }\n\
  \         {-  All build logs and artifacts are available to the public. Environment variables, \
   source code, and other sensitive information may have been output to the build logs and \
   artifacts. You must be careful about what information is output to the build logs. Some best \
   practice are:\n\
  \             \n\
  \              {ul\n\
  \                    {-  Do not store sensitive values in environment variables. We recommend \
   that you use an Amazon EC2 Systems Manager Parameter Store or Secrets Manager to store \
   sensitive values.\n\
  \                        \n\
  \                         }\n\
  \                    {-  Follow \
   {{:https://docs.aws.amazon.com/codebuild/latest/userguide/webhooks.html#webhook-best-practices}Best \
   practices for using webhooks} in the {i CodeBuild User Guide} to limit which entities can \
   trigger a build, and do not store the buildspec in the project itself, to ensure that your \
   webhooks are as secure as possible.\n\
  \                        \n\
  \                         }\n\
  \                    \n\
  \          }\n\
  \           }\n\
  \         {-  A malicious user can use public builds to distribute malicious artifacts. We \
   recommend that you review all pull requests to verify that the pull request is a legitimate \
   change. We also recommend that you validate any artifacts with their checksums to make sure \
   that the correct artifacts are being downloaded.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module UpdateReportGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_report_group_input ->
    ( update_report_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_report_group_input ->
    ( update_report_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates a report group. \n"]

module UpdateWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `OAuthProviderException of o_auth_provider_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_webhook_input ->
    ( update_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_webhook_input ->
    ( update_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OAuthProviderException of o_auth_provider_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates the webhook associated with an CodeBuild build project. \n\n\
  \   If you use Bitbucket for your repository, [rotateSecret] is ignored. \n\
  \  \n\
  \   "]

module BatchGetSandboxes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_sandboxes_input ->
    ( batch_get_sandboxes_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_sandboxes_input ->
    ( batch_get_sandboxes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the sandbox status.\n"]

module BatchGetReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_reports_input ->
    ( batch_get_reports_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_reports_input ->
    ( batch_get_reports_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns an array of reports. \n"]

module BatchGetReportGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_report_groups_input ->
    ( batch_get_report_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_report_groups_input ->
    ( batch_get_report_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns an array of report groups. \n"]

module BatchGetProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_projects_input ->
    ( batch_get_projects_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_projects_input ->
    ( batch_get_projects_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more build projects.\n"]

module BatchGetFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_fleets_input ->
    ( batch_get_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_fleets_input ->
    ( batch_get_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more compute fleets.\n"]

module BatchGetCommandExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_command_executions_input ->
    ( batch_get_command_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_command_executions_input ->
    ( batch_get_command_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the command executions.\n"]

module BatchGetBuilds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_builds_input ->
    ( batch_get_builds_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_builds_input ->
    ( batch_get_builds_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more builds.\n"]

module BatchGetBuildBatches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_build_batches_input ->
    ( batch_get_build_batches_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_build_batches_input ->
    ( batch_get_build_batches_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about one or more batch builds.\n"]

module BatchDeleteBuilds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_builds_input ->
    ( batch_delete_builds_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_builds_input ->
    ( batch_delete_builds_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more builds.\n"]
