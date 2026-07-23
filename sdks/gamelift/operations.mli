open Types

module GetComputeAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_compute_access_input ->
    ( get_compute_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_compute_access_input ->
    ( get_compute_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Requests authorization to remotely connect to a hosting resource in a Amazon GameLift Servers \
   managed fleet. This operation is not used with Amazon GameLift Servers Anywhere fleets.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   Provide the fleet ID and compute name. The compute name varies depending on the type of fleet.\n\
  \   \n\
  \    {ul\n\
  \          {-  For a compute in a managed EC2 fleet, provide an instance ID. Each instance in \
   the fleet is a compute.\n\
  \              \n\
  \               }\n\
  \          {-  For a compute in a managed container fleet, provide a compute name. In a \
   container fleet, each game server container group on a fleet instance is assigned a compute \
   name. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation returns a set of temporary Amazon Web Services credentials, \
   including a two-part access key and a session token.\n\
  \    \n\
  \     {ul\n\
  \           {-  With a managed EC2 fleet (where compute type is [EC2]), use these credentials \
   with Amazon EC2 Systems Manager (SSM) to start a session with the compute. For more details, \
   see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html#sessions-start-cli} \
   Starting a session (CLI)} in the {i Amazon EC2 Systems Manager User Guide}.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module GetComputeAuthToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_compute_auth_token_input ->
    ( get_compute_auth_token_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_compute_auth_token_input ->
    ( get_compute_auth_token_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Requests an authentication token from Amazon GameLift Servers for a compute resource in an \
   Amazon GameLift Servers fleet. Game servers that are running on the compute use this token to \
   communicate with the Amazon GameLift Servers service, such as when calling the Amazon GameLift \
   Servers server SDK action [InitSDK()]. Authentication tokens are valid for a limited time span, \
   so you need to request a fresh token before the current token expires.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  For managed EC2 fleets (compute type [EC2]), auth token retrieval and refresh is \
   handled automatically. All game servers that are running on all fleet instances have access to \
   a valid auth token.\n\
  \             \n\
  \              }\n\
  \         {-  For Anywhere fleets (compute type [ANYWHERE]), if you're using the Amazon GameLift \
   Servers Agent, auth token retrieval and refresh is handled automatically for any compute where \
   the Agent is running. If you're not using the Agent, create a mechanism to retrieve and refresh \
   auth tokens for computes that are running game server processes.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-anywhere.html}Create \
   an Anywhere fleet} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-testing.html}Test \
   your integration} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk.html}Server \
   SDK reference guides} (for version 5.x)\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module GetGameSessionLogUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_game_session_log_url_input ->
    ( get_game_session_log_url_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_game_session_log_url_input ->
    ( get_game_session_log_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves the location of stored game session logs for a specified game session on Amazon \
   GameLift Servers managed fleets. When a game session is terminated, Amazon GameLift Servers \
   automatically stores the logs in Amazon S3 and retains them for 14 days. Use this URL to \
   download the logs.\n\
  \ \n\
  \   See the \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_gamelift}Amazon \
   Web Services Service Limits} page for maximum log file sizes. Log files that exceed this limit \
   are not saved.\n\
  \   \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module GetInstanceAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_instance_access_input ->
    ( get_instance_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_instance_access_input ->
    ( get_instance_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Requests authorization to remotely connect to an instance in an Amazon GameLift Servers \
   managed fleet. Use this operation to connect to instances with game servers that use Amazon \
   GameLift Servers server SDK 4.x or earlier. To connect to instances with game servers that use \
   server SDK 5.x or later, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess}.\n\
  \ \n\
  \  To request access to an instance, specify IDs for the instance and the fleet it belongs to. \
   You can retrieve instance IDs for a fleet by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeInstances.html}DescribeInstances} \
   with the fleet ID. \n\
  \  \n\
  \   If successful, this operation returns an IP address and credentials. The returned \
   credentials match the operating system of the instance, as follows: \n\
  \   \n\
  \    {ul\n\
  \          {-  For a Windows instance: returns a user name and secret (password) for use with a \
   Windows Remote Desktop client. \n\
  \              \n\
  \               }\n\
  \          {-  For a Linux instance: returns a user name and secret (RSA private key) for use \
   with an SSH client. You must save the secret to a [.pem] file. If you're using the CLI, see the \
   example \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess.html#API_GetInstanceAccess_Examples} \
   Get credentials for a Linux instance} for tips on automatically saving the secret to a [.pem] \
   file. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Learn more} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html}Remotely \
   connect to fleet instances} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html}Debug \
   fleet issues} \n\
  \     \n\
  \       {b Related actions} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module GetPlayerConnectionDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidGameSessionStatusException of invalid_game_session_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_player_connection_details_input ->
    ( get_player_connection_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_player_connection_details_input ->
    ( get_player_connection_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (server SDK 5.x or later), Container\n\n\
  \ Retrieves connection details for game clients to connect to game sessions. \n\
  \ \n\
  \   {b Player gateway benefits:} DDoS protection with negligible impact to latency. \n\
  \  \n\
  \   To enable player gateway on your fleet, set [PlayerGatewayMode] to [ENABLED] or [REQUIRED] \
   when calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateFleet.html}CreateFleet} \
   or \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerFleet.html}CreateContainerFleet}.\n\
  \   \n\
  \     {b How to use:} After creating a game session and adding players, call this operation with \
   the game session ID and player IDs. When player gateway is enabled, the response includes \
   connection endpoints and player gateway tokens that your game clients can use to connect to the \
   game session through player gateway. To learn more about player gateway integration, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/ddos-protection-intro.html}DDoS \
   protection with Amazon GameLift Servers player gateway}.\n\
  \    \n\
  \     When player gateway is disabled or in locations where player gateway is not supported, \
   this operation returns game server connection information without player gateway tokens, so \
   that your game clients directly connect to the game server endpoint.\n\
  \     "]

module ListAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_input ->
    ( list_aliases_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_input ->
    ( list_aliases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves all aliases for this Amazon Web Services account. You can filter the result set by \
   alias name and/or routing strategy type. Use the pagination parameters to retrieve results in \
   sequential pages.\n\
  \ \n\
  \   Returned aliases are not listed in any particular order.\n\
  \   \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module ListBuilds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_builds_input ->
    ( list_builds_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_builds_input ->
    ( list_builds_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves build resources for all builds associated with the Amazon Web Services account in \
   use. You can limit results to builds that are in a specific status by using the [Status] \
   parameter. Use the pagination parameters to retrieve results in \n\
  \ \n\
  \   Build resources are not listed in any particular order.\n\
  \   \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html} \
   Upload a Custom Server Build} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module ListCompute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compute_input ->
    ( list_compute_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compute_input ->
    ( list_compute_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves information on the compute resources in an Amazon GameLift Servers fleet. Use the \
   pagination parameters to retrieve results in a set of sequential pages.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Retrieve a list of all computes in a fleet. Specify a fleet ID. \n\
  \             \n\
  \              }\n\
  \         {-  Retrieve a list of all computes in a specific fleet location. Specify a fleet ID \
   and location.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation returns information on a set of computes. Depending on the \
   type of fleet, the result includes the following information: \n\
  \    \n\
  \     {ul\n\
  \           {-  For a managed EC2 fleet (compute type [EC2]), this operation returns information \
   about the EC2 instance. Compute names are EC2 instance IDs.\n\
  \               \n\
  \                }\n\
  \           {-  For an Anywhere fleet (compute type [ANYWHERE]), this operation returns compute \
   names and details from when the compute was registered with [RegisterCompute]. This includes \
   [GameLiftServiceSdkEndpoint] or [GameLiftAgentEndpoint].\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module ListContainerFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_fleets_input ->
    ( list_container_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_fleets_input ->
    ( list_container_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves a collection of container fleet resources in an Amazon Web Services Region. For \
   fleets that have multiple locations, this operation retrieves fleets based on their home Region \
   only.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get a list of all fleets. Call this operation without specifying a container group \
   definition. \n\
  \             \n\
  \              }\n\
  \         {-  Get a list of fleets filtered by container group definition. Provide the container \
   group definition name or ARN value.\n\
  \             \n\
  \              }\n\
  \         {-  To get a list of all Amazon GameLift Servers Realtime fleets with a specific \
   configuration script, provide the script ID. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, this operation returns a collection of container fleets that match the \
   request parameters. A NextToken value is also returned if there are more result pages to \
   retrieve.\n\
  \    \n\
  \      Fleet IDs are returned in no particular order.\n\
  \      \n\
  \       "]

module ListContainerGroupDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_group_definitions_input ->
    ( list_container_group_definitions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_group_definitions_input ->
    ( list_container_group_definitions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves container group definitions for the Amazon Web Services account and Amazon Web \
   Services Region. Use the pagination parameters to retrieve results in a set of sequential pages.\n\
  \ \n\
  \  This operation returns only the latest version of each definition. To retrieve all versions \
   of a container group definition, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitionVersions.html}ListContainerGroupDefinitionVersions}.\n\
  \  \n\
  \    {b Request options:} \n\
  \   \n\
  \    {ul\n\
  \          {-  Retrieve the most recent versions of all container group definitions. \n\
  \              \n\
  \               }\n\
  \          {-  Retrieve the most recent versions of all container group definitions, filtered by \
   type. Specify the container group type to filter on. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results:} \n\
  \   \n\
  \    If successful, this operation returns the complete properties of a set of container group \
   definition versions that match the request.\n\
  \    \n\
  \      This operation returns the list of container group definitions in no particular order. \n\
  \      \n\
  \       "]

module ListContainerGroupDefinitionVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_group_definition_versions_input ->
    ( list_container_group_definition_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_group_definition_versions_input ->
    ( list_container_group_definition_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves all versions of a container group definition. Use the pagination parameters to \
   retrieve results in a set of sequential pages.\n\
  \ \n\
  \   {b Request options:} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get all versions of a specified container group definition. Specify the container \
   group definition name or ARN value. (If the ARN value has a version number, it's ignored.)\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results:} \n\
  \   \n\
  \    If successful, this operation returns the complete properties of a set of container group \
   definition versions that match the request.\n\
  \    \n\
  \      This operation returns the list of container group definitions in descending version \
   order (latest first). \n\
  \      \n\
  \         {b Learn more} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/containers-create-groups.html}Manage \
   a container group definition} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \  "]

module ListFleetDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fleet_deployments_input ->
    ( list_fleet_deployments_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fleet_deployments_input ->
    ( list_fleet_deployments_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves a collection of container fleet deployments in an Amazon Web Services Region. Use \
   the pagination parameters to retrieve results as a set of sequential pages. \n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get a list of all deployments. Call this operation without specifying a fleet ID. \n\
  \             \n\
  \              }\n\
  \         {-  Get a list of all deployments for a fleet. Specify the container fleet ID or ARN \
   value.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation returns a list of deployments that match the request \
   parameters. A NextToken value is also returned if there are more result pages to retrieve.\n\
  \    \n\
  \      Deployments are returned starting with the latest.\n\
  \      \n\
  \       "]

module ListFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fleets_input ->
    ( list_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fleets_input ->
    ( list_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves a collection of fleet resources in an Amazon Web Services Region. You can filter the \
   result set to find only those fleets that are deployed with a specific build or script. For \
   fleets that have multiple locations, this operation retrieves fleets based on their home Region \
   only.\n\
  \ \n\
  \  You can use operation in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To get a list of all fleets in a Region, don't provide a build or script identifier.\n\
  \             \n\
  \              }\n\
  \         {-  To get a list of all fleets where a specific game build is deployed, provide the \
   build ID.\n\
  \             \n\
  \              }\n\
  \         {-  To get a list of all Amazon GameLift Servers Realtime fleets with a specific \
   configuration script, provide the script ID. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, this operation returns a list of fleet IDs that match the request \
   parameters. A NextToken value is also returned if there are more result pages to retrieve.\n\
  \    \n\
  \      Fleet IDs are returned in no particular order.\n\
  \      \n\
  \       "]

module ListGameServerGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_game_server_groups_input ->
    ( list_game_server_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_game_server_groups_input ->
    ( list_game_server_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Lists a game server groups.\n\
  \ "]

module ListGameServers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_game_servers_input ->
    ( list_game_servers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_game_servers_input ->
    ( list_game_servers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Retrieves information on all game servers that are currently active in a specified game server \
   group. You can opt to sort the list by game server age. Use the pagination parameters to \
   retrieve results in a set of sequential segments. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \   "]

module ListLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_locations_input ->
    ( list_locations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_locations_input ->
    ( list_locations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Lists all custom and Amazon Web Services locations where Amazon GameLift Servers can host game \
   servers. This operation also returns UDP ping beacon information for locations, which you can \
   use to measure network latency between player devices and potential hosting locations.\n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html}Service \
   locations} \n\
  \   "]

module ListScripts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scripts_input ->
    ( list_scripts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scripts_input ->
    ( list_scripts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves script records for all Realtime scripts that are associated with the Amazon Web \
   Services account in use. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html}Amazon \
   GameLift Servers Amazon GameLift Servers Realtime} \n\
  \   \n\
  \     {b Related actions} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves all tags assigned to a Amazon GameLift Servers resource. Use resource tags to \
   organize Amazon Web Services resources for a range of purposes. This operation handles the \
   permissions necessary to manage tags for Amazon GameLift Servers resources that support tagging.\n\
  \ \n\
  \  To list tags for a resource, specify the unique ARN value for the resource.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
   Services Resources} in the {i Amazon Web Services General Reference} \n\
  \    \n\
  \      {{:http://aws.amazon.com/answers/account-management/aws-tagging-strategies/} Amazon Web \
   Services Tagging Strategies} \n\
  \     \n\
  \       {b Related actions} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module PutScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_input ->
    ( put_scaling_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_input ->
    ( put_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Creates or updates a scaling policy for a fleet. Scaling policies are used to automatically \
   scale a fleet's hosting capacity to meet player demand. An active scaling policy instructs \
   Amazon GameLift Servers to track a fleet metric and automatically change the fleet's capacity \
   when a certain threshold is reached. There are two types of scaling policies: target-based and \
   rule-based. Use a target-based policy to quickly and efficiently manage fleet scaling; this \
   option is the most commonly used. Use rule-based policies when you need to exert fine-grained \
   control over auto-scaling. \n\
  \ \n\
  \  Fleets can have multiple scaling policies of each type in force at the same time; you can \
   have one target-based policy, one or multiple rule-based scaling policies, or both. We \
   recommend caution, however, because multiple auto-scaling policies can have unintended \
   consequences.\n\
  \  \n\
  \   Learn more about how to work with auto-scaling in \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-autoscaling.html}Set Up \
   Fleet Automatic Scaling}.\n\
  \   \n\
  \     {b Target-based policy} \n\
  \    \n\
  \     A target-based policy tracks a single metric: PercentAvailableGameSessions. This metric \
   tells us how much of a fleet's hosting capacity is ready to host game sessions but is not \
   currently in use. This is the fleet's buffer; it measures the additional player demand that the \
   fleet could handle at current capacity. With a target-based policy, you set your ideal buffer \
   size and leave it to Amazon GameLift Servers to take whatever action is needed to maintain that \
   target. \n\
  \     \n\
  \      For example, you might choose to maintain a 10% buffer for a fleet that has the capacity \
   to host 100 simultaneous game sessions. This policy tells Amazon GameLift Servers to take \
   action whenever the fleet's available capacity falls below or rises above 10 game sessions. \
   Amazon GameLift Servers will start new instances or stop unused instances in order to return to \
   the 10% buffer. \n\
  \      \n\
  \       To create or update a target-based policy, specify a fleet ID and name, and set the \
   policy type to \"TargetBased\". Specify the metric to track (PercentAvailableGameSessions) and \
   reference a [TargetConfiguration] object with your desired buffer value. Exclude all other \
   parameters. On a successful request, the policy name is returned. The scaling policy is \
   automatically in force as soon as it's successfully created. If the fleet's auto-scaling \
   actions are temporarily suspended, the new policy will be in force once the fleet actions are \
   restarted.\n\
  \       \n\
  \         {b Rule-based policy} \n\
  \        \n\
  \         A rule-based policy tracks specified fleet metric, sets a threshold value, and \
   specifies the type of action to initiate when triggered. With a rule-based policy, you can \
   select from several available fleet metrics. Each policy specifies whether to scale up or scale \
   down (and by how much), so you need one policy for each type of action. \n\
  \         \n\
  \          For example, a policy may make the following statement: \"If the percentage of idle \
   instances is greater than 20% for more than 15 minutes, then reduce the fleet capacity by 10%.\"\n\
  \          \n\
  \           A policy's rule statement has the following structure:\n\
  \           \n\
  \            If [\\[MetricName\\]] is [\\[ComparisonOperator\\]] [\\[Threshold\\]] for \
   [\\[EvaluationPeriods\\]] minutes, then [\\[ScalingAdjustmentType\\]] to/by \
   [\\[ScalingAdjustment\\]].\n\
  \            \n\
  \             To implement the example, the rule statement would look like this:\n\
  \             \n\
  \              If [\\[PercentIdleInstances\\]] is [\\[GreaterThanThreshold\\]] [\\[20\\]] for \
   [\\[15\\]] minutes, then [\\[PercentChangeInCapacity\\]] to/by [\\[10\\]].\n\
  \              \n\
  \               To create or update a scaling policy, specify a unique combination of name and \
   fleet ID, and set the policy type to \"RuleBased\". Specify the parameter values for a policy \
   rule statement. On a successful request, the policy name is returned. Scaling policies are \
   automatically in force as soon as they're successfully created. If the fleet's auto-scaling \
   actions are temporarily suspended, the new policy will be in force once the fleet actions are \
   restarted.\n\
  \               "]

module RegisterCompute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotReadyException of not_ready_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_compute_input ->
    ( register_compute_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_compute_input ->
    ( register_compute_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Anywhere, Container\n\n\
  \ Registers a compute resource in an Amazon GameLift Servers Anywhere fleet. \n\
  \ \n\
  \  For an Anywhere fleet that's running the Amazon GameLift Servers Agent, the Agent handles all \
   compute registry tasks for you. For an Anywhere fleet that doesn't use the Agent, call this \
   operation to register fleet computes.\n\
  \  \n\
  \   To register a compute, give the compute a name (must be unique within the fleet) and specify \
   the compute resource's DNS name or IP address. Provide a fleet ID and a fleet location to \
   associate with the compute being registered. You can optionally include the path to a TLS \
   certificate on the compute resource.\n\
  \   \n\
  \    If successful, this operation returns compute details, including an Amazon GameLift Servers \
   SDK endpoint or Agent endpoint. Game server processes running on the compute can use this \
   endpoint to communicate with the Amazon GameLift Servers service. Each server process includes \
   the SDK endpoint in its call to the Amazon GameLift Servers server SDK action [InitSDK()]. \n\
  \    \n\
  \     To view compute details, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeCompute.html}DescribeCompute} \
   with the compute name. \n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-anywhere.html}Create \
   an Anywhere fleet} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-testing.html}Test \
   your integration} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk.html}Server \
   SDK reference guides} (for version 5.x)\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module RegisterGameServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_game_server_input ->
    ( register_game_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_game_server_input ->
    ( register_game_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Creates a new game server resource and notifies Amazon GameLift Servers FleetIQ that the game \
   server is ready to host gameplay and players. This operation is called by a game server process \
   that is running on an instance in a game server group. Registering game servers enables Amazon \
   GameLift Servers FleetIQ to track available game servers and enables game clients and services \
   to claim a game server for a new game session. \n\
  \ \n\
  \  To register a game server, identify the game server group and instance where the game server \
   is running, and provide a unique identifier for the game server. You can also include \
   connection and game server data.\n\
  \  \n\
  \   Once a game server is successfully registered, it is put in status [AVAILABLE]. A request to \
   register a game server may fail if the instance it is running on is in the process of shutting \
   down as part of instance balancing or scale-down activity. \n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \     "]

module RequestUploadCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_upload_credentials_input ->
    ( request_upload_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    request_upload_credentials_input ->
    ( request_upload_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves a fresh set of credentials for use when uploading a new set of game build files to \
   Amazon GameLift Servers's Amazon S3. This is done as part of the build creation process; see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateBuild.html}CreateBuild}.\n\
  \ \n\
  \  To request new credentials, specify the build ID as returned with an initial [CreateBuild] \
   request. If successful, a new set of credentials are returned, along with the S3 storage \
   location associated with the build ID.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build} \
   Create a Build with Files in S3} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module ResolveAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resolve_alias_input ->
    ( resolve_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resolve_alias_input ->
    ( resolve_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Attempts to retrieve a fleet ID that is associated with an alias. Specify a unique alias \
   identifier.\n\
  \ \n\
  \  If the alias has a [SIMPLE] routing strategy, Amazon GameLift Servers returns a fleet ID. If \
   the alias has a [TERMINAL] routing strategy, the result is a [TerminalRoutingStrategyException].\n\
  \  \n\
  \    {b Related actions} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module ResumeGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_game_server_group_input ->
    ( resume_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_game_server_group_input ->
    ( resume_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Reinstates activity on a game server group after it has been suspended. A game server group \
   might be suspended by the \
   {{:gamelift/latest/apireference/API_SuspendGameServerGroup.html}SuspendGameServerGroup} \
   operation, or it might be suspended involuntarily due to a configuration problem. In the second \
   case, you can manually resume activity on the group once the configuration problem has been \
   resolved. Refer to the game server group status and status reason for more information on why \
   group activity is suspended.\n\
  \ \n\
  \  To resume activity, specify a game server group ARN and the type of activity to be resumed. \
   If successful, a [GameServerGroup] object is returned showing that the resumed activity is no \
   longer listed in [SuspendedActions]. \n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \    "]

module SearchGameSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_game_sessions_input ->
    ( search_game_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_game_sessions_input ->
    ( search_game_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves all active game sessions that match a set of search criteria and sorts them into a \
   specified order. \n\
  \ \n\
  \  This operation is not designed to continually track game session status because that practice \
   can cause you to exceed your API limit and generate errors. Instead, configure an Amazon Simple \
   Notification Service (Amazon SNS) topic to receive notifications from a matchmaker or a game \
   session placement queue.\n\
  \  \n\
  \   When searching for game sessions, you specify exactly where you want to search and provide a \
   search filter expression, a sort expression, or both. A search request can search only one \
   fleet, but it can search all of a fleet's locations. \n\
  \   \n\
  \    This operation can be used in the following ways: \n\
  \    \n\
  \     {ul\n\
  \           {-  To search all game sessions that are currently running on all locations in a \
   fleet, provide a fleet or alias ID. This approach returns game sessions in the fleet's home \
   Region and all remote locations that fit the search criteria.\n\
  \               \n\
  \                }\n\
  \           {-  To search all game sessions that are currently running on a specific fleet \
   location, provide a fleet or alias ID and a location name. For location, you can specify a \
   fleet's home Region or any remote location.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [GameSession] object is returned for each game session that matches the \
   request. Search finds game sessions that are in [ACTIVE] status only. To retrieve information \
   on game sessions in other statuses, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeGameSessions.html}DescribeGameSessions}.\n\
  \    \n\
  \     To set search and sort criteria, create a filter expression using the following game \
   session attributes. For game session search examples, see the Examples section of this topic.\n\
  \     \n\
  \      {ul\n\
  \            {-   {b gameSessionId} -- An identifier for the game session that is unique across \
   all regions. You must use the full ARN value. \n\
  \                \n\
  \                 }\n\
  \            {-   {b gameSessionName} -- Name assigned to a game session. Game session names do \
   not need to be unique to a game session.\n\
  \                \n\
  \                 }\n\
  \            {-   {b gameSessionProperties} -- A set of key-value pairs that can store custom \
   data in a game session. For example: [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. The \
   filter expression must specify the \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameProperty}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameProperty} \
   -- a [Key] and a string [Value] to search for the game sessions.\n\
  \                \n\
  \                 For example, to search for the above key-value pair, specify the following \
   search filter: [gameSessionProperties.difficulty = \"novice\"]. All game property values are \
   searched as strings.\n\
  \                 \n\
  \                   For examples of searching game sessions, see the ones below, and also see \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#game-properties-search}Search \
   game sessions by game property}. \n\
  \                  \n\
  \                    {ul\n\
  \                          {-  Avoid using periods (\".\") in property keys if you plan to \
   search for game sessions by properties. Property keys containing periods cannot be searched and \
   will be filtered out from search results due to search index limitations.\n\
  \                              \n\
  \                               }\n\
  \                          {-  If you use SearchGameSessions API, there is a limit of 500 game \
   property keys across all game sessions and all fleets per region. If the limit is exceeded, \
   there will potentially be game session entries missing from SearchGameSessions API results.\n\
  \                              \n\
  \                               }\n\
  \                          \n\
  \             }\n\
  \               }\n\
  \            {-   {b maximumSessions} -- Maximum number of player sessions allowed for a game \
   session.\n\
  \                \n\
  \                 }\n\
  \            {-   {b creationTimeMillis} -- Value indicating when a game session was created. It \
   is expressed in Unix time as milliseconds.\n\
  \                \n\
  \                 }\n\
  \            {-   {b playerSessionCount} -- Number of players currently connected to a game \
   session. This value changes rapidly as players join the session or drop out.\n\
  \                \n\
  \                 }\n\
  \            {-   {b hasAvailablePlayerSessions} -- Boolean value indicating whether a game \
   session has reached its maximum number of players. It is highly recommended that all search \
   requests include this filter attribute to optimize search performance and return only sessions \
   that players can join. \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \    Returned values for [playerSessionCount] and [hasAvailablePlayerSessions] change quickly as \
   players join sessions and others drop out. Results should be considered a snapshot in time. Be \
   sure to refresh search results often, and handle sessions that fill up before a player can \
   join. \n\
  \    \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module StartFleetActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_actions_input ->
    ( start_fleet_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_actions_input ->
    ( start_fleet_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Resumes certain types of activity on fleet instances that were suspended with \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StopFleetActions.html}StopFleetActions}. \
   For multi-location fleets, fleet actions are managed separately for each location. Currently, \
   this operation is used to restart a fleet's auto-scaling activity.\n\
  \ \n\
  \  This operation can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To restart actions on instances in the fleet's home Region, provide a fleet ID and \
   the type of actions to resume. \n\
  \             \n\
  \              }\n\
  \         {-  To restart actions on instances in one of the fleet's remote locations, provide a \
   fleet ID, a location name, and the type of actions to resume. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   If successful, Amazon GameLift Servers once again initiates scaling events as triggered by \
   the fleet's scaling policies. If actions on the fleet location were never stopped, this \
   operation will have no effect.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module StartGameSessionPlacement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_game_session_placement_input ->
    ( start_game_session_placement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_game_session_placement_input ->
    ( start_game_session_placement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Makes a request to start a new game session using a game session queue. When processing a \
   placement request, Amazon GameLift Servers looks for the best possible available resource to \
   host the game session, based on how the queue is configured to prioritize factors such as \
   resource cost, latency, and location. After selecting an available resource, Amazon GameLift \
   Servers prompts the resource to start a game session. A placement request can include a list of \
   players to create a set of player sessions. The request can also include information to pass to \
   the new game session, such as to specify a game map or other options.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   Use this operation to make the following types of requests. \n\
  \   \n\
  \    {ul\n\
  \          {-  Request a placement using the queue's default prioritization process (see the \
   default prioritization described in \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_PriorityConfiguration.html}PriorityConfiguration}). \
   Include these required parameters:\n\
  \              \n\
  \               {ul\n\
  \                     {-   [GameSessionQueueName] \n\
  \                         \n\
  \                          }\n\
  \                     {-   [MaximumPlayerSessionCount] \n\
  \                         \n\
  \                          }\n\
  \                     {-   [PlacementID] \n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            }\n\
  \          {-  Request a placement and prioritize based on latency. Include these parameters:\n\
  \              \n\
  \               {ul\n\
  \                     {-  Required parameters [GameSessionQueueName], \
   [MaximumPlayerSessionCount], [PlacementID].\n\
  \                         \n\
  \                          }\n\
  \                     {-   [PlayerLatencies]. Include a set of latency values for destinations \
   in the queue. When a request includes latency data, Amazon GameLift Servers automatically \
   reorder the queue's locations priority list based on lowest available latency values. If a \
   request includes latency data for multiple players, Amazon GameLift Servers calculates each \
   location's average latency for all players and reorders to find the lowest latency across all \
   players. \n\
  \                         \n\
  \                          }\n\
  \                     {-  Don't include [PriorityConfigurationOverride].\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            {ul\n\
  \                  {-  Prioritize based on a custom list of locations. If you're using a queue \
   that's configured to prioritize location first (see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_PriorityConfiguration.html}PriorityConfiguration} \
   for game session queues), you can optionally use the {i PriorityConfigurationOverride} \
   parameter to substitute a different location priority list for this placement request. Amazon \
   GameLift Servers searches each location on the priority override list to find an available \
   hosting resource for the new game session. Specify a fallback strategy to use in the event that \
   Amazon GameLift Servers fails to place the game session in any of the locations on the override \
   list. \n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \           }\n\
  \            }\n\
  \          {-  Request a placement and prioritized based on a custom list of locations. \n\
  \              \n\
  \               }\n\
  \          {-  You can request new player sessions for a group of players. Include the {i \
   DesiredPlayerSessions} parameter and include at minimum a unique player ID for each. You can \
   also include player-specific data to pass to the new game session. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Result} \n\
  \   \n\
  \    If successful, this operation generates a new game session placement request and adds it to \
   the game session queue for processing. You can track the status of individual placement \
   requests by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeGameSessionPlacement.html}DescribeGameSessionPlacement} \
   or by monitoring queue notifications. When the request status is [FULFILLED], a new game \
   session has started and the placement request is updated with connection information for the \
   game session (IP address and port). If the request included player session data, Amazon \
   GameLift Servers creates a player session for each player ID in the request.\n\
  \    \n\
  \     The request results in a [InvalidRequestException] in the following situations:\n\
  \     \n\
  \      {ul\n\
  \            {-  If the request includes both {i PlayerLatencies} and {i \
   PriorityConfigurationOverride} parameters.\n\
  \                \n\
  \                 }\n\
  \            {-  If the request includes the {i PriorityConfigurationOverride} parameter and \
   specifies a queue that doesn't prioritize locations.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   Amazon GameLift Servers continues to retry each placement request until it reaches the \
   queue's timeout setting. If a request times out, you can resubmit the request to the same queue \
   or try a different queue. \n\
  \   "]

module StartMatchBackfill : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_match_backfill_input ->
    ( start_match_backfill_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_match_backfill_input ->
    ( start_match_backfill_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Finds new players to fill open slots in currently running game sessions. The backfill match \
   process is essentially identical to the process of forming new matches. Backfill requests use \
   the same matchmaker that was used to make the original match, and they provide matchmaking data \
   for all players currently in the game session. FlexMatch uses this information to select new \
   players so that backfilled match continues to meet the original match requirements. \n\
  \ \n\
  \  When using FlexMatch with Amazon GameLift Servers managed hosting, you can request a backfill \
   match from a client service by calling this operation with a [GameSessions] ID. You also have \
   the option of making backfill requests directly from your game server. In response to a \
   request, FlexMatch creates player sessions for the new players, updates the [GameSession] \
   resource, and sends updated matchmaking data to the game server. You can request a backfill \
   match at any point after a game session is started. Each game session can have only one active \
   backfill request at a time; a subsequent request automatically replaces the earlier request.\n\
  \  \n\
  \   When using FlexMatch as a standalone component, request a backfill match by calling this \
   operation without a game session identifier. As with newly formed matches, matchmaking results \
   are returned in a matchmaking event so that your game can update the game session that is being \
   backfilled.\n\
  \   \n\
  \    To request a backfill match, specify a unique ticket ID, the original matchmaking \
   configuration, and matchmaking data for all current players in the game session being \
   backfilled. Optionally, specify the [GameSession] ARN. If successful, a match backfill ticket \
   is created and returned with status set to QUEUED. Track the status of backfill tickets using \
   the same method for tracking tickets for new matches.\n\
  \    \n\
  \     Only game sessions created by FlexMatch are supported for match backfill.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html} \
   Backfill existing games with FlexMatch} \n\
  \       \n\
  \         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html} \
   Matchmaking events} (reference)\n\
  \        \n\
  \          {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html} \
   How Amazon GameLift Servers FlexMatch works} \n\
  \         "]

module StartMatchmaking : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_matchmaking_input ->
    ( start_matchmaking_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_matchmaking_input ->
    ( start_matchmaking_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Uses FlexMatch to create a game match for a group of players based on custom matchmaking \
   rules. With games that use Amazon GameLift Servers managed hosting, this operation also \
   triggers Amazon GameLift Servers to find hosting resources and start a new game session for the \
   new match. Each matchmaking request includes information on one or more players and specifies \
   the FlexMatch matchmaker to use. When a request is for multiple players, FlexMatch attempts to \
   build a match that includes all players in the request, placing them in the same team and \
   finding additional players as needed to fill the match. \n\
  \ \n\
  \  To start matchmaking, provide a unique ticket ID, specify a matchmaking configuration, and \
   include the players to be matched. You must also include any player attributes that are \
   required by the matchmaking configuration's rule set. If successful, a matchmaking ticket is \
   returned with status set to [QUEUED]. \n\
  \  \n\
  \   Track matchmaking events to respond as needed and acquire game session connection \
   information for successfully completed matches. Ticket status updates are tracked using event \
   notification through Amazon Simple Notification Service, which is defined in the matchmaking \
   configuration.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html} Add \
   FlexMatch to a game client} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html} \
   Set Up FlexMatch event notification} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html} How \
   Amazon GameLift Servers FlexMatch works} \n\
  \       "]

module StopFleetActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_actions_input ->
    ( stop_fleet_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_actions_input ->
    ( stop_fleet_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Suspends certain types of activity in a fleet location. Currently, this operation is used to \
   stop auto-scaling activity. For multi-location fleets, fleet actions are managed separately for \
   each location. \n\
  \ \n\
  \  Stopping fleet actions has several potential purposes. It allows you to temporarily stop \
   auto-scaling activity but retain your scaling policies for use in the future. For \
   multi-location fleets, you can set up fleet-wide auto-scaling, and then opt out of it for \
   certain locations. \n\
  \  \n\
  \   This operation can be used in the following ways: \n\
  \   \n\
  \    {ul\n\
  \          {-  To stop actions on instances in the fleet's home Region, provide a fleet ID and \
   the type of actions to suspend. \n\
  \              \n\
  \               }\n\
  \          {-  To stop actions on instances in one of the fleet's remote locations, provide a \
   fleet ID, a location name, and the type of actions to suspend. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If successful, Amazon GameLift Servers no longer initiates scaling events except in response \
   to manual changes using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateFleetCapacity.html}UpdateFleetCapacity}. \
   To restart fleet actions again, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartFleetActions.html}StartFleetActions}.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers Fleets} \n\
  \     "]

module StopGameSessionPlacement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_game_session_placement_input ->
    ( stop_game_session_placement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_game_session_placement_input ->
    ( stop_game_session_placement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Cancels a game session placement that's in [PENDING] status. To stop a placement, provide the \
   placement ID value. \n\
  \ \n\
  \  Results\n\
  \  \n\
  \   If successful, this operation removes the placement request from the queue and moves the \
   [GameSessionPlacement] to [CANCELLED] status.\n\
  \   \n\
  \    This operation results in an [InvalidRequestExecption] (400) error if a game session has \
   already been created for this placement. You can clean up an unneeded game session by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_TerminateGameSession}TerminateGameSession}.\n\
  \    "]

module StopMatchmaking : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_matchmaking_input ->
    ( stop_matchmaking_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_matchmaking_input ->
    ( stop_matchmaking_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Cancels a matchmaking ticket or match backfill ticket that is currently being processed. To \
   stop the matchmaking operation, specify the ticket ID. If successful, work on the ticket is \
   stopped, and the ticket status is changed to [CANCELLED].\n\
  \ \n\
  \  This call is also used to turn off automatic backfill for an individual game session. This is \
   for game sessions that are created with a matchmaking configuration that has automatic backfill \
   enabled. The ticket ID is included in the [MatchmakerData] of an updated game session object, \
   which is provided to the game server.\n\
  \  \n\
  \    If the operation is successful, the service sends back an empty JSON struct with the HTTP \
   200 response (not an empty HTTP body).\n\
  \    \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html} Add \
   FlexMatch to a game client} \n\
  \       "]

module SuspendGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    suspend_game_server_group_input ->
    ( suspend_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    suspend_game_server_group_input ->
    ( suspend_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Temporarily stops activity on a game server group without terminating instances or the game \
   server group. You can restart activity by calling \
   {{:gamelift/latest/apireference/API_ResumeGameServerGroup.html}ResumeGameServerGroup}. You can \
   suspend the following activity:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Instance type replacement} - This activity evaluates the current game hosting \
   viability of all Spot instance types that are defined for the game server group. It updates the \
   Auto Scaling group to remove nonviable Spot Instance types, which have a higher chance of game \
   server interruptions. It then balances capacity across the remaining viable Spot Instance \
   types. When this activity is suspended, the Auto Scaling group continues with its current \
   balance, regardless of viability. Instance protection, utilization metrics, and capacity \
   scaling activities continue to be active. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   To suspend activity, specify a game server group ARN and the type of activity to be \
   suspended. If successful, a [GameServerGroup] object is returned showing that the activity is \
   listed in [SuspendedActions].\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \     "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Assigns a tag to an Amazon GameLift Servers resource. You can use tags to organize resources, \
   create IAM permissions policies to manage access to groups of resources, customize Amazon Web \
   Services cost breakdowns, and more. This operation handles the permissions necessary to manage \
   tags for Amazon GameLift Servers resources that support tagging.\n\
  \ \n\
  \  To add a tag to a resource, specify the unique ARN value for the resource and provide a tag \
   list containing one or more tags. The operation succeeds even if the list includes tags that \
   are already assigned to the resource. \n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
   Services Resources} in the {i Amazon Web Services General Reference} \n\
  \    \n\
  \      {{:http://aws.amazon.com/answers/account-management/aws-tagging-strategies/} Amazon Web \
   Services Tagging Strategies} \n\
  \     \n\
  \       {b Related actions} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module TerminateGameSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidGameSessionStatusException of invalid_game_session_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `NotReadyException of not_ready_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_game_session_input ->
    ( terminate_game_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_game_session_input ->
    ( terminate_game_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Ends a game session that's currently in progress. Use this action to terminate any game \
   session that isn't in [ERROR] status. Terminating a game session is the most efficient way to \
   free up a server process when it's hosting a game session that's in a bad state or not ending \
   properly. You can use this action to terminate a game session that's being hosted on any type \
   of Amazon GameLift Servers fleet compute, including computes for managed EC2, managed \
   container, and Anywhere fleets. The game server must be integrated with Amazon GameLift Servers \
   server SDK 5.x or greater.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   Request termination for a single game session. Provide the game session ID and the \
   termination mode. There are two potential methods for terminating a game session:\n\
  \   \n\
  \    {ul\n\
  \          {-  Initiate a graceful termination using the normal game session shutdown sequence. \
   With this mode, the Amazon GameLift Servers service prompts the server process that's hosting \
   the game session by calling the server SDK callback method [OnProcessTerminate()]. The callback \
   implementation is part of the custom game server code. It might involve a variety of actions to \
   gracefully end a game session, such as notifying players, before stopping the server process.\n\
  \              \n\
  \               }\n\
  \          {-  Force an immediate game session termination. With this mode, the Amazon GameLift \
   Servers service takes action to stop the server process, which ends the game session without \
   the normal game session shutdown sequence. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, game session termination is initiated. During this activity, the game \
   session status is changed to [TERMINATING]. When completed, the server process that was hosting \
   the game session has been stopped and replaced with a new server process that's ready to host a \
   new game session. The old game session's status is changed to [TERMINATED] with a status reason \
   that indicates the termination method used.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html}Add \
   Amazon GameLift Servers to your game server} \n\
  \      \n\
  \       Amazon GameLift Servers server SDK 5 reference guide for [OnProcessTerminate()] \
   ({{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-server-sdk5-cpp-initsdk.html}C++}) \
   ({{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-server-sdk5-csharp-initsdk.html}C#}) \
   ({{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-server-sdk5-unreal-initsdk.html}Unreal}) \
   ({{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-server-sdk-go-initsdk.html}Go}) \n\
  \       "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Removes a tag assigned to a Amazon GameLift Servers resource. You can use resource tags to \
   organize Amazon Web Services resources for a range of purposes. This operation handles the \
   permissions necessary to manage tags for Amazon GameLift Servers resources that support tagging.\n\
  \ \n\
  \  To remove a tag from a resource, specify the unique ARN value for the resource and provide a \
   string list containing one or more tags to remove. This operation succeeds even if the list \
   includes tags that aren't assigned to the resource.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
   Services Resources} in the {i Amazon Web Services General Reference} \n\
  \    \n\
  \      {{:http://aws.amazon.com/answers/account-management/aws-tagging-strategies/} Amazon Web \
   Services Tagging Strategies} \n\
  \     \n\
  \       {b Related actions} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module UpdateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_alias_input ->
    ( update_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_alias_input ->
    ( update_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Updates properties for an alias. Specify the unique identifier of the alias to be updated and \
   the new property values.\n\
  \ \n\
  \  When reassigning an alias to a new fleet, provide an updated routing strategy. If successful, \
   the updated alias record is returned.\n\
  \  \n\
  \    {b Related actions} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module UpdateBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_build_input ->
    ( update_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_build_input ->
    ( update_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Updates metadata in a build resource, including the build name and version. To update the \
   metadata, specify the build ID to update and provide the new values. If successful, a build \
   object containing the updated metadata is returned.\n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html} \
   Upload a Custom Server Build} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module UpdateContainerFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `NotReadyException of not_ready_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_fleet_input ->
    ( update_container_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_fleet_input ->
    ( update_container_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Updates the properties of a managed container fleet. Depending on the properties being \
   updated, this operation might initiate a fleet deployment. You can track deployments for a \
   fleet using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetDeployment.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetDeployment.html}.\n\
  \ \n\
  \   A managed fleet's runtime environment, which depends on the fleet's Amazon Machine Image \
   \\{AMI\\} version, can't be updated. You must create a new fleet. As a best practice, we \
   recommend replacing your managed fleets every 30 days to maintain a secure and up-to-date \
   runtime environment for your hosted game servers. For guidance, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/security-best-practices.html} \
   Security best practices for Amazon GameLift Servers}.\n\
  \   \n\
  \      {b Request options} \n\
  \     \n\
  \      As with CreateContainerFleet, many fleet properties use common defaults or are calculated \
   based on the fleet's container group definitions. \n\
  \      \n\
  \       {ul\n\
  \             {-  Update fleet properties that result in a fleet deployment. Include only those \
   properties that you want to change. Specify deployment configuration settings.\n\
  \                 \n\
  \                  }\n\
  \             {-  Update fleet properties that don't result in a fleet deployment. Include only \
   those properties that you want to change.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   Changes to the following properties initiate a fleet deployment: \n\
  \   \n\
  \    {ul\n\
  \          {-   [GameServerContainerGroupDefinition] \n\
  \              \n\
  \               }\n\
  \          {-   [PerInstanceContainerGroupDefinition] \n\
  \              \n\
  \               }\n\
  \          {-   [GameServerContainerGroupsPerInstance] \n\
  \              \n\
  \               }\n\
  \          {-   [InstanceInboundPermissions] \n\
  \              \n\
  \               }\n\
  \          {-   [InstanceConnectionPortRange] \n\
  \              \n\
  \               }\n\
  \          {-   [LogConfiguration] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation updates the container fleet resource, and might initiate a \
   new deployment of fleet resources using the deployment configuration provided. A deployment \
   replaces existing fleet instances with new instances that are deployed with the updated fleet \
   properties. The fleet is placed in [UPDATING] status until the deployment is complete, then \
   return to [ACTIVE]. \n\
  \    \n\
  \     You can have only one update deployment active at a time for a fleet. If a second update \
   request initiates a deployment while another deployment is in progress, the first deployment is \
   cancelled.\n\
  \     "]

module UpdateContainerGroupDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_group_definition_input ->
    ( update_container_group_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_group_definition_input ->
    ( update_container_group_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Updates properties in an existing container group definition. This operation doesn't replace \
   the definition. Instead, it creates a new version of the definition and saves it separately. \
   You can access all versions that you choose to retain.\n\
  \ \n\
  \  The only property you can't update is the container group type.\n\
  \  \n\
  \    {b Request options:} \n\
  \   \n\
  \    {ul\n\
  \          {-  Update based on the latest version of the container group definition. Specify the \
   container group definition name only, or use an ARN value without a version number. Provide \
   updated values for the properties that you want to change only. All other values remain the \
   same as the latest version.\n\
  \              \n\
  \               }\n\
  \          {-  Update based on a specific version of the container group definition. Specify the \
   container group definition name and a source version number, or use an ARN value with a version \
   number. Provide updated values for the properties that you want to change only. All other \
   values remain the same as the source version.\n\
  \              \n\
  \               }\n\
  \          {-  Change a game server container definition. Provide a complete set of container \
   definitions, including the updated definition.\n\
  \              \n\
  \               }\n\
  \          {-  Add or change a support container definition. Provide a complete set of container \
   definitions, including the updated definition.\n\
  \              \n\
  \               }\n\
  \          {-  Remove a support container definition. Provide a complete set of container \
   definitions, excluding the definition to remove. If the container group has only one support \
   container definition, provide an empty set.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results:} \n\
  \   \n\
  \    If successful, this operation returns the complete properties of the new container group \
   definition version.\n\
  \    \n\
  \     If the container group definition version is used in an active fleets, the update \
   automatically initiates a new fleet deployment of the new version. You can track a fleet's \
   deployments using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListFleetDeployments.html}ListFleetDeployments}.\n\
  \     "]

module UpdateFleetAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_attributes_input ->
    ( update_fleet_attributes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_attributes_input ->
    ( update_fleet_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Updates a fleet's mutable attributes, such as game session protection and resource creation \
   limits.\n\
  \ \n\
  \  To update fleet attributes, specify the fleet ID and the property values that you want to \
   change. If successful, Amazon GameLift Servers returns the identifiers for the updated fleet.\n\
  \  \n\
  \    A managed fleet's runtime environment, which depends on the fleet's Amazon Machine Image \
   \\{AMI\\} version, can't be updated. You must create a new fleet. As a best practice, we \
   recommend replacing your managed fleets every 30 days to maintain a secure and up-to-date \
   runtime environment for your hosted game servers. For guidance, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/security-best-practices.html} \
   Security best practices for Amazon GameLift Servers}.\n\
  \    \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \       "]

module UpdateFleetCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_capacity_input ->
    ( update_fleet_capacity_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_capacity_input ->
    ( update_fleet_capacity_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Updates capacity settings for a managed EC2 fleet or managed container fleet. For these \
   fleets, you adjust capacity by changing the number of instances in the fleet. Fleet capacity \
   determines the number of game sessions and players that the fleet can host based on its \
   configuration. For fleets with multiple locations, use this operation to manage capacity \
   settings in each location individually.\n\
  \ \n\
  \  {ul\n\
  \        {-  Minimum/maximum size: Set hard limits on the number of Amazon EC2 instances \
   allowed. If Amazon GameLift Servers receives a request--either through manual update or \
   automatic scaling--it won't change the capacity to a value outside of this range.\n\
  \            \n\
  \             }\n\
  \        {-  Desired capacity: As an alternative to automatic scaling, manually set the number \
   of Amazon EC2 instances to be maintained. Before changing a fleet's desired capacity, check the \
   maximum capacity of the fleet's Amazon EC2 instance type by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeEC2InstanceLimits.html}DescribeEC2InstanceLimits}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   To update capacity for a fleet's home Region, or if the fleet has no remote locations, omit \
   the [Location] parameter. The fleet must be in [ACTIVE] status. \n\
  \   \n\
  \    To update capacity for a fleet's remote location, set the [Location] parameter to the \
   location to update. The location must be in [ACTIVE] status.\n\
  \    \n\
  \     If successful, Amazon GameLift Servers updates the capacity settings and returns the \
   identifiers for the updated fleet and/or location. If a requested change to desired capacity \
   exceeds the instance type's limit, the [LimitExceeded] exception occurs. \n\
  \     \n\
  \      Updates often prompt an immediate change in fleet capacity, such as when current capacity \
   is different than the new desired capacity or outside the new limits. In this scenario, Amazon \
   GameLift Servers automatically initiates steps to add or remove instances in the fleet \
   location. You can track a fleet's current capacity by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetCapacity.html}DescribeFleetCapacity} \
   or \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html}DescribeFleetLocationCapacity}.\n\
  \      \n\
  \        Use ManagedCapacityConfiguration with the \"SCALE_TO_AND_FROM_ZERO\" \
   ZeroCapacityStrategy to enable Amazon GameLift Servers to fully manage the MinSize value, \
   switching between 0 and 1 based on game session activity. This is ideal for eliminating compute \
   costs during periods of no game activity. It is particularly beneficial during development when \
   you're away from your desk, iterating on builds for extended periods, in production \
   environments serving low-traffic locations, or for games with long, predictable downtime \
   windows. By automatically managing capacity between 0 and 1 instances, you avoid paying for \
   idle instances while maintaining the ability to serve game sessions when demand arrives. Note \
   that while scale-out is triggered immediately upon receiving a game session request, actual \
   game session availability depends on your server process startup time, so this approach works \
   best with multi-location Fleets where cold-start latency is tolerable. With a \"MANUAL\" \
   ZeroCapacityStrategy Amazon GameLift Servers will not modify Fleet MinSize values automatically \
   and will not scale out from zero instances in response to game sessions. This is configurable \
   per-location.\n\
  \       \n\
  \         {b Learn more} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-manage-capacity.html}Scaling \
   fleet capacity} \n\
  \         "]

module UpdateFleetPortSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_port_settings_input ->
    ( update_fleet_port_settings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_port_settings_input ->
    ( update_fleet_port_settings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Updates permissions that allow inbound traffic to connect to game sessions in the fleet. \n\
  \ \n\
  \  To update settings, specify the fleet ID to be updated and specify the changes to be made. \
   List the permissions you want to add in [InboundPermissionAuthorizations], and permissions you \
   want to remove in [InboundPermissionRevocations]. Permissions to be removed must match existing \
   fleet permissions. \n\
  \  \n\
  \   If successful, the fleet identifiers for the updated fleet are returned. For fleets with \
   remote locations, port setting updates can take time to propagate across all locations. You can \
   check the status of updates in each location by calling [DescribeFleetPortSettings] with a \
   location name.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module UpdateGameServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_game_server_input ->
    ( update_game_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_game_server_input ->
    ( update_game_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Updates information about a registered game server to help Amazon GameLift Servers FleetIQ \
   track game server availability. This operation is called by a game server process that is \
   running on an instance in a game server group. \n\
  \ \n\
  \  Use this operation to update the following types of game server information. You can make all \
   three types of updates in the same request:\n\
  \  \n\
  \   {ul\n\
  \         {-  To update the game server's utilization status from [AVAILABLE] (when the game \
   server is available to be claimed) to [UTILIZED] (when the game server is currently hosting \
   games). Identify the game server and game server group and specify the new utilization status. \
   You can't change the status from to [UTILIZED] to [AVAILABLE] .\n\
  \             \n\
  \              }\n\
  \         {-  To report health status, identify the game server and game server group and set \
   health check to [HEALTHY]. If a game server does not report health status for a certain length \
   of time, the game server is no longer considered healthy. As a result, it will be eventually \
   deregistered from the game server group to avoid affecting utilization metrics. The best \
   practice is to report health every 60 seconds.\n\
  \             \n\
  \              }\n\
  \         {-  To change game server metadata, provide updated game server data.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Once a game server is successfully updated, the relevant statuses and timestamps are updated.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \     "]

module UpdateGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_game_server_group_input ->
    ( update_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_game_server_group_input ->
    ( update_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Updates Amazon GameLift Servers FleetIQ-specific properties for a game server group. Many Auto \
   Scaling group properties are updated on the Auto Scaling group directly, including the launch \
   template, Auto Scaling policies, and maximum/minimum/desired instance counts.\n\
  \ \n\
  \  To update the game server group, specify the game server group ID and provide the updated \
   values. Before applying the updates, the new values are validated to ensure that Amazon \
   GameLift Servers FleetIQ can continue to perform instance balancing activity. If successful, a \
   [GameServerGroup] object is returned.\n\
  \  \n\
  \    Target tracking Auto Scaling policies on the Auto Scaling group cannot be updated through \
   the Amazon Web Services Management Console. Instead, use the Amazon Elastic Compute Cloud Auto \
   Scaling {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutScalingPolicy.html} \
   [PutScalingPolicy] } API action to update these policies.\n\
  \    \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \       "]

module UpdateGameSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidGameSessionStatusException of invalid_game_session_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `NotReadyException of not_ready_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_game_session_input ->
    ( update_game_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_game_session_input ->
    ( update_game_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Updates the mutable properties of a game session. \n\
  \ \n\
  \  To update a game session, specify the game session ID and the values you want to change. \n\
  \  \n\
  \   If successful, the updated [GameSession] object is returned. \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module UpdateGameSessionQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_game_session_queue_input ->
    ( update_game_session_queue_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_game_session_queue_input ->
    ( update_game_session_queue_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Updates the configuration of a game session queue, which determines how the queue processes \
   new game session requests. To update settings, specify the queue name to be updated and provide \
   the new settings. When updating destinations, provide a complete list of destinations. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-intro.html} Using \
   Multi-Region Queues} \n\
  \   "]

module UpdateMatchmakingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_matchmaking_configuration_input ->
    ( update_matchmaking_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_matchmaking_configuration_input ->
    ( update_matchmaking_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Updates settings for a FlexMatch matchmaking configuration. These changes affect all matches \
   and game sessions that are created after the update. To update settings, specify the \
   configuration name to be updated and provide the new settings. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html} \
   Design a FlexMatch matchmaker} \n\
  \   "]

module UpdateRuntimeConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_runtime_configuration_input ->
    ( update_runtime_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_runtime_configuration_input ->
    ( update_runtime_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Updates the runtime configuration for the specified fleet. The runtime configuration tells \
   Amazon GameLift Servers how to launch server processes on computes in managed EC2 and Anywhere \
   fleets. You can update a fleet's runtime configuration at any time after the fleet is created; \
   it does not need to be in [ACTIVE] status.\n\
  \ \n\
  \  To update runtime configuration, specify the fleet ID and provide a [RuntimeConfiguration] \
   with an updated set of server process configurations.\n\
  \  \n\
  \   If successful, the fleet's runtime configuration settings are updated. Fleet computes that \
   run game server processes regularly check for and receive updated runtime configurations. The \
   computes immediately take action to comply with the new configuration by launching new server \
   processes or by not replacing existing processes when they shut down. Updating a fleet's \
   runtime configuration never affects existing server processes.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module UpdateScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_script_input ->
    ( update_script_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_script_input ->
    ( update_script_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Updates Realtime script metadata and content.\n\
  \ \n\
  \  To update script metadata, specify the script ID and provide updated name and/or version \
   values. \n\
  \  \n\
  \   To update script content, provide an updated zip file by pointing to either a local file or \
   an Amazon S3 bucket location. You can use either method regardless of how the original script \
   was uploaded. Use the {i Version} parameter to track updates to the script.\n\
  \   \n\
  \    If the call is successful, the updated metadata is stored in the script record and a \
   revised script is uploaded to the Amazon GameLift Servers service. Once the script is updated \
   and acquired by a fleet instance, the new version is used for all new game sessions. \n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html}Amazon \
   GameLift Servers Amazon GameLift Servers Realtime} \n\
  \      \n\
  \        {b Related actions} \n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \        "]

module ValidateMatchmakingRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_matchmaking_rule_set_input ->
    ( validate_matchmaking_rule_set_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_matchmaking_rule_set_input ->
    ( validate_matchmaking_rule_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Validates the syntax of a matchmaking rule or rule set. This operation checks that the rule \
   set is using syntactically correct JSON and that it conforms to allowed property expressions. \
   To validate syntax, provide a rule set JSON string.\n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html}Build a rule \
   set} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeVpcPeeringConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_peering_connections_input ->
    ( describe_vpc_peering_connections_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_peering_connections_input ->
    ( describe_vpc_peering_connections_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves information on VPC peering connections. Use this operation to get peering \
   information for all fleets or for one specific fleet ID. \n\
  \ \n\
  \  To retrieve connection information, call this operation from the Amazon Web Services account \
   that is used to manage the Amazon GameLift Servers fleets. Specify a fleet ID or leave the \
   parameter empty to retrieve all connection records. If successful, the retrieved information \
   includes both active and pending connections. Active connections identify the IpV4 CIDR block \
   that the VPC uses to connect. \n\
  \  \n\
  \    {b Related actions} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module DescribeVpcPeeringAuthorizations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_peering_authorizations_input ->
    ( describe_vpc_peering_authorizations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_peering_authorizations_input ->
    ( describe_vpc_peering_authorizations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves valid VPC peering authorizations that are pending for the Amazon Web Services \
   account. This operation returns all VPC peering authorizations and requests for peering. This \
   includes those initiated and received by this account. \n\
  \ \n\
  \   {b Related actions} \n\
  \  \n\
  \    \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \   "]

module DescribeScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_script_input ->
    ( describe_script_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_script_input ->
    ( describe_script_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves properties for a Realtime script. \n\
  \ \n\
  \  To request a script record, specify the script ID. If successful, an object containing the \
   script properties is returned.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html}Amazon \
   GameLift Servers Amazon GameLift Servers Realtime} \n\
  \    \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module DescribeScalingPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_policies_input ->
    ( describe_scaling_policies_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_policies_input ->
    ( describe_scaling_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves all scaling policies applied to a fleet.\n\
  \ \n\
  \  To get a fleet's scaling policies, specify the fleet ID. You can filter this request by \
   policy status, such as to retrieve only active scaling policies. Use the pagination parameters \
   to retrieve results as a set of sequential pages. If successful, set of [ScalingPolicy] objects \
   is returned for the fleet.\n\
  \  \n\
  \   A fleet may have all of its scaling policies suspended. This operation does not affect the \
   status of the scaling policies, which remains ACTIVE.\n\
  \   "]

module DescribeRuntimeConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_runtime_configuration_input ->
    ( describe_runtime_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_runtime_configuration_input ->
    ( describe_runtime_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves a fleet's runtime configuration settings. The runtime configuration determines which \
   server processes run, and how, on computes in the fleet. For managed EC2 fleets, the runtime \
   configuration describes server processes that run on each fleet instance. You can update a \
   fleet's runtime configuration at any time using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateRuntimeConfiguration.html}UpdateRuntimeConfiguration}.\n\
  \ \n\
  \  To get the current runtime configuration for a fleet, provide the fleet ID. \n\
  \  \n\
  \   If successful, a [RuntimeConfiguration] object is returned for the requested fleet. If the \
   requested fleet has been deleted, the result set is empty.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html}Running \
   multiple processes on a fleet} \n\
  \      "]

module DescribePlayerSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_player_sessions_input ->
    ( describe_player_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_player_sessions_input ->
    ( describe_player_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves properties for one or more player sessions. \n\
  \ \n\
  \  This action can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To retrieve a specific player session, provide the player session ID only.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve all player sessions in a game session, provide the game session ID only.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve all player sessions for a specific player, provide a player ID only.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To request player sessions, specify either a player session ID, game session ID, or player \
   ID. You can filter this request by player session status. If you provide a specific \
   [PlayerSessionId] or [PlayerId], Amazon GameLift Servers ignores the filter criteria. Use the \
   pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [PlayerSession] object is returned for each session that matches the \
   request.\n\
  \    \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module DescribeMatchmakingRuleSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_rule_sets_input ->
    ( describe_matchmaking_rule_sets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_rule_sets_input ->
    ( describe_matchmaking_rule_sets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves the details for FlexMatch matchmaking rule sets. You can request all existing rule \
   sets for the Region, or provide a list of one or more rule set names. When requesting multiple \
   items, use the pagination parameters to retrieve results as a set of sequential pages. If \
   successful, a rule set is returned for each requested name. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html}Build a rule \
   set} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeMatchmakingConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_configurations_input ->
    ( describe_matchmaking_configurations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_configurations_input ->
    ( describe_matchmaking_configurations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves the details of FlexMatch matchmaking configurations. \n\
  \ \n\
  \  This operation offers the following options: (1) retrieve all matchmaking configurations, (2) \
   retrieve configurations for a specified list, or (3) retrieve all configurations that use a \
   specified rule set name. When requesting multiple items, use the pagination parameters to \
   retrieve results as a set of sequential pages. \n\
  \  \n\
  \   If successful, a configuration is returned for each requested name. When specifying a list \
   of names, only configurations that currently exist are returned. \n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/matchmaker-build.html} \
   Setting up FlexMatch matchmakers} \n\
  \     "]

module DescribeMatchmaking : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_input ->
    ( describe_matchmaking_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_matchmaking_input ->
    ( describe_matchmaking_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves one or more matchmaking tickets. Use this operation to retrieve ticket information, \
   including--after a successful match is made--connection information for the resulting new game \
   session. \n\
  \ \n\
  \  To request matchmaking tickets, provide a list of up to 10 ticket IDs. If the request is \
   successful, a ticket object is returned for each requested ID that currently exists.\n\
  \  \n\
  \   This operation is not designed to be continually called to track matchmaking ticket status. \
   This practice can cause you to exceed your API limit, which results in errors. Instead, as a \
   best practice, set up an Amazon Simple Notification Service to receive notifications, and \
   provide the topic ARN in the matchmaking configuration.\n\
  \   \n\
  \    \n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html} Add \
   FlexMatch to a game client} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html} \
   Set Up FlexMatch event notification} \n\
  \       "]

module DescribeInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instances_input ->
    ( describe_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instances_input ->
    ( describe_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:}EC2, Container\n\n\
  \ Retrieves information about the EC2 instances in an Amazon GameLift Servers managed fleet, \
   including instance ID, connection data, and status. You can use this operation with a \
   multi-location fleet to get location-specific instance information. As an alternative, use the \
   operations \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute}https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute} \
   and \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeCompute}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeCompute} \
   to retrieve information for compute resources, including EC2 and Anywhere fleets.\n\
  \ \n\
  \  You can call this operation in the following ways:\n\
  \  \n\
  \   {ul\n\
  \         {-  To get information on all instances in a fleet's home Region, specify the fleet ID.\n\
  \             \n\
  \              }\n\
  \         {-  To get information on all instances in a fleet's remote location, specify the \
   fleet ID and location name.\n\
  \             \n\
  \              }\n\
  \         {-  To get information on a specific instance in a fleet, specify the fleet ID and \
   instance ID.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, this operation returns [Instance] objects for each requested instance, \
   listed in no particular order. If you call this operation for an Anywhere fleet, you receive an \
   InvalidRequestException.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html}Remotely \
   connect to fleet instances} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html}Debug \
   fleet issues} \n\
  \       \n\
  \         {b Related actions} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \         "]

module DescribeGameSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_sessions_input ->
    ( describe_game_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_sessions_input ->
    ( describe_game_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves a set of one or more game sessions in a specific fleet location. You can optionally \
   filter the results by current game session status.\n\
  \ \n\
  \  This operation can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To retrieve all game sessions that are currently running on all locations in a \
   fleet, provide a fleet or alias ID, with an optional status filter. This approach returns all \
   game sessions in the fleet's home Region and all remote locations.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve all game sessions that are currently running on a specific fleet \
   location, provide a fleet or alias ID and a location name, with optional status filter. The \
   location can be the fleet's home Region or any remote location.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve a specific game session, provide the game session ID. This approach \
   looks for the game session ID in all fleets that reside in the Amazon Web Services Region \
   defined in the request.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [GameSession] object is returned for each game session that matches the \
   request.\n\
  \    \n\
  \     This operation is not designed to be continually called to track game session status. This \
   practice can cause you to exceed your API limit, which results in errors. Instead, you must \
   configure an Amazon Simple Notification Service (SNS) topic to receive notifications from \
   FlexMatch or queues. Continuously polling with [DescribeGameSessions] should only be used for \
   games in development with low game session usage. \n\
  \     \n\
  \       {i Available in Amazon GameLift Servers Local.} \n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-find}Find \
   a game session} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \         "]

module DescribeGameSessionQueues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_queues_input ->
    ( describe_game_session_queues_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_queues_input ->
    ( describe_game_session_queues_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves the properties for one or more game session queues. When requesting multiple queues, \
   use the pagination parameters to retrieve results as a set of sequential pages. When specifying \
   a list of queues, objects are returned only for queues that currently exist in the Region.\n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-console.html} View \
   Your Queues} \n\
  \   "]

module DescribeGameSessionPlacement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_placement_input ->
    ( describe_game_session_placement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_placement_input ->
    ( describe_game_session_placement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves information, including current status, about a game session placement request. \n\
  \ \n\
  \  To get game session placement details, specify the placement ID.\n\
  \  \n\
  \   This operation is not designed to be continually called to track game session status. This \
   practice can cause you to exceed your API limit, which results in errors. Instead, you must \
   configure an Amazon Simple Notification Service (SNS) topic to receive notifications from \
   FlexMatch or queues. Continuously polling with [DescribeGameSessionPlacement] should only be \
   used for games in development with low game session usage. For a reference implementation of \
   event-based game session placement tracking, see \
   {{:https://github.com/amazon-gamelift/amazon-gamelift-toolkit/tree/main/event-based-session-placement} \
   Event-based game session placement guidance} in the Amazon GameLift Toolkit.\n\
  \   "]

module DescribeGameSessionDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_details_input ->
    ( describe_game_session_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_session_details_input ->
    ( describe_game_session_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves additional game session properties, including the game session protection policy in \
   force, a set of one or more game sessions in a specific fleet location. You can optionally \
   filter the results by current game session status.\n\
  \ \n\
  \  This operation can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To retrieve details for all game sessions that are currently running on all \
   locations in a fleet, provide a fleet or alias ID, with an optional status filter. This \
   approach returns details from the fleet's home Region and all remote locations.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve details for all game sessions that are currently running on a specific \
   fleet location, provide a fleet or alias ID and a location name, with optional status filter. \
   The location can be the fleet's home Region or any remote location.\n\
  \             \n\
  \              }\n\
  \         {-  To retrieve details for a specific game session, provide the game session ID. This \
   approach looks for the game session ID in all fleets that reside in the Amazon Web Services \
   Region defined in the request.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [GameSessionDetail] object is returned for each game session that matches \
   the request.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-find}Find \
   a game session} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module DescribeGameServerInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_instances_input ->
    ( describe_game_server_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_instances_input ->
    ( describe_game_server_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Retrieves status information about the Amazon EC2 instances associated with a Amazon GameLift \
   Servers FleetIQ game server group. Use this operation to detect when instances are active or \
   not available to host new game servers.\n\
  \ \n\
  \  To request status for all instances in the game server group, provide a game server group ID \
   only. To request status for specific instances, provide the game server group ID and one or \
   more instance IDs. Use the pagination parameters to retrieve results in sequential segments. If \
   successful, a collection of [GameServerInstance] objects is returned. \n\
  \  \n\
  \   This operation is not designed to be called with every game server claim request; this \
   practice can cause you to exceed your API limit, which results in errors. Instead, as a best \
   practice, cache the results and refresh your cache no more than once every 10 seconds.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \     "]

module DescribeGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_group_input ->
    ( describe_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_group_input ->
    ( describe_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Retrieves information on a game server group. This operation returns only properties related \
   to Amazon GameLift Servers FleetIQ. To view or update properties for the corresponding Auto \
   Scaling group, such as launch template, auto scaling policies, and maximum/minimum group size, \
   access the Auto Scaling group directly.\n\
  \ \n\
  \  To get attributes for a game server group, provide a group name or ARN value. If successful, \
   a [GameServerGroup] object is returned.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \    "]

module DescribeGameServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_input ->
    ( describe_game_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_game_server_input ->
    ( describe_game_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Retrieves information for a registered game server. Information includes game server status, \
   health check info, and the instance that the game server is running on. \n\
  \ \n\
  \  To retrieve game server information, specify the game server ID. If successful, the requested \
   game server object is returned. \n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \    "]

module DescribeFleetUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_utilization_input ->
    ( describe_fleet_utilization_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_utilization_input ->
    ( describe_fleet_utilization_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Retrieves utilization statistics for one or more fleets. Utilization data provides a snapshot \
   of how the fleet's hosting resources are currently being used. For fleets with remote \
   locations, this operation retrieves data for the fleet's home Region only. See \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationUtilization.html}DescribeFleetLocationUtilization} \
   to get utilization statistics for a fleet's remote locations.\n\
  \ \n\
  \  This operation can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To get utilization data for one or more specific fleets, provide a list of fleet \
   IDs or fleet ARNs. \n\
  \             \n\
  \              }\n\
  \         {-  To get utilization data for all fleets, do not provide a fleet identifier. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   When requesting multiple fleets, use the pagination parameters to retrieve results as a set \
   of sequential pages. \n\
  \   \n\
  \    If successful, a \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_FleetUtilization.html}FleetUtilization} \
   object is returned for each requested fleet ID, unless the fleet identifier is not found. Each \
   fleet utilization object includes a [Location] property, which is set to the fleet's home \
   Region. \n\
  \    \n\
  \      Some API operations may limit the number of fleet IDs allowed in one request. If a \
   request exceeds this limit, the request fails and the error message includes the maximum \
   allowed.\n\
  \      \n\
  \         {b Learn more} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting up \
   Amazon GameLift Servers Fleets} \n\
  \         \n\
  \           \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet}GameLift \
   Metrics for Fleets} \n\
  \          "]

module DescribeFleetPortSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_port_settings_input ->
    ( describe_fleet_port_settings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_port_settings_input ->
    ( describe_fleet_port_settings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Retrieves a fleet's inbound connection permissions. Connection permissions specify IP \
   addresses and port settings that incoming traffic can use to access server processes in the \
   fleet. Game server processes that are running in the fleet must use a port that falls within \
   this range. \n\
  \ \n\
  \  Use this operation in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To retrieve the port settings for a fleet, identify the fleet's unique identifier. \n\
  \             \n\
  \              }\n\
  \         {-  To check the status of recent updates to a fleet remote location, specify the \
   fleet ID and a location. Port setting updates can take time to propagate across all locations. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   If successful, a set of [IpPermission] objects is returned for the requested fleet ID. When \
   specifying a location, this operation returns a pending status. If the requested fleet has been \
   deleted, the result set is empty.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module DescribeFleetLocationUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_utilization_input ->
    ( describe_fleet_location_utilization_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_utilization_input ->
    ( describe_fleet_location_utilization_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves current usage data for a fleet location. Utilization data provides a snapshot of \
   current game hosting activity at the requested location. Use this operation to retrieve \
   utilization information for a fleet's remote location or home Region (you can also retrieve \
   home Region utilization by calling [DescribeFleetUtilization]).\n\
  \ \n\
  \  To retrieve utilization data, identify a fleet and location. \n\
  \  \n\
  \   If successful, a [FleetUtilization] object is returned for the requested fleet location. \n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
   Amazon GameLift Servers service locations} for managed hosting\n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet}GameLift \
   metrics for fleets} \n\
  \       "]

module DescribeFleetLocationCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_capacity_input ->
    ( describe_fleet_location_capacity_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_capacity_input ->
    ( describe_fleet_location_capacity_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Retrieves the resource capacity settings for a fleet location. The data returned includes the \
   current capacity (number of EC2 instances) and some scaling settings for the requested fleet \
   location. For a managed container fleet, this operation also returns counts for game server \
   container groups.\n\
  \ \n\
  \  Use this operation to retrieve capacity information for a fleet's remote location or home \
   Region (you can also retrieve home Region capacity by calling [DescribeFleetCapacity]).\n\
  \  \n\
  \   To retrieve capacity data, identify a fleet and location. \n\
  \   \n\
  \    If successful, a [FleetCapacity] object is returned for the requested fleet location. \n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
   Amazon GameLift Servers service locations} for managed hosting\n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet}GameLift \
   metrics for fleets} \n\
  \        "]

module DescribeFleetLocationAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_attributes_input ->
    ( describe_fleet_location_attributes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_location_attributes_input ->
    ( describe_fleet_location_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Retrieves information on a fleet's remote locations, including life-cycle status and any \
   suspended fleet activity. \n\
  \ \n\
  \  This operation can be used in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To get data for specific locations, provide a fleet identifier and a list of \
   locations. Location data is returned in the order that it is requested. \n\
  \             \n\
  \              }\n\
  \         {-  To get data for all locations, provide a fleet identifier only. Location data is \
   returned in no particular order. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   When requesting attributes for multiple locations, use the pagination parameters to retrieve \
   results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [LocationAttributes] object is returned for each requested location. If \
   the fleet does not have a requested location, no information is returned. \n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
   Amazon GameLift Servers service locations} for managed hosting\n\
  \       "]

module DescribeFleetEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_events_input ->
    ( describe_fleet_events_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_events_input ->
    ( describe_fleet_events_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves entries from a fleet's event log. Fleet events are initiated by changes in status, \
   such as during fleet creation and termination, changes in capacity, etc. If a fleet has \
   multiple locations, events are also initiated by changes to status and capacity in remote \
   locations.\n\
  \ \n\
  \  You can specify a time range to limit the result set. Use the pagination parameters to \
   retrieve results as a set of sequential pages. \n\
  \  \n\
  \   If successful, a collection of event log entries matching the request are returned.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module DescribeFleetDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_deployment_input ->
    ( describe_fleet_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_deployment_input ->
    ( describe_fleet_deployment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves information about a managed container fleet deployment. \n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get information about the latest deployment for a specific fleet. Provide the \
   fleet ID or ARN.\n\
  \             \n\
  \              }\n\
  \         {-   Get information about a specific deployment. Provide the fleet ID or ARN and the \
   deployment ID.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, a [FleetDeployment] object is returned.\n\
  \    "]

module DescribeFleetCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_capacity_input ->
    ( describe_fleet_capacity_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_capacity_input ->
    ( describe_fleet_capacity_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Retrieves the resource capacity settings for one or more fleets. For a container fleet, this \
   operation also returns counts for game server container groups.\n\
  \ \n\
  \  With multi-location fleets, this operation retrieves data for the fleet's home Region only. \
   To retrieve capacity for remote locations, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html}.\n\
  \  \n\
  \   This operation can be used in the following ways: \n\
  \   \n\
  \    {ul\n\
  \          {-  To get capacity data for one or more specific fleets, provide a list of fleet IDs \
   or fleet ARNs. \n\
  \              \n\
  \               }\n\
  \          {-  To get capacity data for all fleets, do not provide a fleet identifier. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   When requesting multiple fleets, use the pagination parameters to retrieve results as a set \
   of sequential pages. \n\
  \   \n\
  \    If successful, a [FleetCapacity] object is returned for each requested fleet ID. Each \
   [FleetCapacity] object includes a [Location] property, which is set to the fleet's home Region. \
   Capacity values are returned only for fleets that currently exist.\n\
  \    \n\
  \      Some API operations may limit the number of fleet IDs that are allowed in one request. If \
   a request exceeds this limit, the request fails and the error message includes the maximum \
   allowed.\n\
  \      \n\
  \         {b Learn more} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting up \
   Amazon GameLift Servers fleets} \n\
  \         \n\
  \           \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet}GameLift \
   metrics for fleets} \n\
  \          "]

module DescribeFleetAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_attributes_input ->
    ( describe_fleet_attributes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_attributes_input ->
    ( describe_fleet_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere\n\n\
  \ Retrieves core fleet-wide properties for fleets in an Amazon Web Services Region. Properties \
   include the computing hardware and deployment configuration for instances in the fleet.\n\
  \ \n\
  \  You can use this operation in the following ways: \n\
  \  \n\
  \   {ul\n\
  \         {-  To get attributes for specific fleets, provide a list of fleet IDs or fleet ARNs.\n\
  \             \n\
  \              }\n\
  \         {-  To get attributes for all fleets, do not provide a fleet identifier.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   When requesting attributes for multiple fleets, use the pagination parameters to retrieve \
   results as a set of sequential pages. \n\
  \   \n\
  \    If successful, a [FleetAttributes] object is returned for each fleet requested, unless the \
   fleet identifier is not found. \n\
  \    \n\
  \      Some API operations limit the number of fleet IDs that allowed in one request. If a \
   request exceeds this limit, the request fails and the error message contains the maximum \
   allowed number.\n\
  \      \n\
  \         {b Learn more} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting up \
   Amazon GameLift Servers fleets} \n\
  \         "]

module DescribeEC2InstanceLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ec2_instance_limits_input ->
    ( describe_ec2_instance_limits_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ec2_instance_limits_input ->
    ( describe_ec2_instance_limits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves the instance limits and current utilization for an Amazon Web Services Region or \
   location. Instance limits control the number of instances, per instance type, per location, \
   that your Amazon Web Services account can use. Learn more at \
   {{:http://aws.amazon.com/ec2/instance-types/}Amazon EC2 Instance Types}. The information \
   returned includes the maximum number of instances allowed and your account's current usage \
   across all fleets. This information can affect your ability to scale your Amazon GameLift \
   Servers fleets. You can request a limit increase for your account by using the {b Service \
   limits} page in the Amazon GameLift Servers console.\n\
  \ \n\
  \  Instance limits differ based on whether the instances are deployed in a fleet's home Region \
   or in a remote location. For remote locations, limits also differ based on the combination of \
   home Region and remote location. All requests must specify an Amazon Web Services Region \
   (either explicitly or as your default settings). To get the limit for a remote location, you \
   must also specify the location. To learn more about how Amazon GameLift Servers handles \
   locations, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}Amazon \
   GameLift Servers service locations}. For example, the following requests all return different \
   results: \n\
  \  \n\
  \   {ul\n\
  \         {-  Request specifies the Region [ap-northeast-1] with no location. The result is \
   limits and usage data on all of the fleets that reside in [ap-northeast-1], for all instance \
   types that are deployed in [ap-northeast-1]. \n\
  \             \n\
  \              }\n\
  \         {-  Request specifies the Region [ap-northeast-1] with location [us-west-2]. The \
   result is limits and usage data on all of the fleets that reside in [ap-northeast-1], for all \
   instance types that are deployed in [us-west-2].\n\
  \             \n\
  \              }\n\
  \         {-  Request specifies the Region [us-east-1] with location [ap-northeast-1]. The \
   result is limits and usage data on all of the fleets that reside in [us-east-1], for all \
   instance types that are deployed in [ap-northeast-1]. These limits do not affect fleets in any \
   other Regions that deploy instances to [ap-northeast-1].\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   This operation can be used in the following ways:\n\
  \   \n\
  \    {ul\n\
  \          {-  To get limit and usage data for all instance types that are deployed in an Amazon \
   Web Services Region by fleets that reside in the same Region: Specify the Region only. \
   Optionally, specify a single instance type to retrieve information for.\n\
  \              \n\
  \               }\n\
  \          {-  To get limit and usage data for all instance types that are deployed to a remote \
   location by fleets that reside in different Amazon Web Services Region: Provide both the Amazon \
   Web Services Region and the remote location. Optionally, specify a single instance type to \
   retrieve information for.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If successful, an [EC2InstanceLimits] object is returned with limits and usage data for each \
   requested instance type.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module DescribeContainerGroupPortMappings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_group_port_mappings_input ->
    ( describe_container_group_port_mappings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_group_port_mappings_input ->
    ( describe_container_group_port_mappings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves the port mappings for a container group running on a container fleet. Port mappings \
   show how container ports are mapped to connection ports on the fleet instance. Use this \
   operation to find the connection port for a specific container on a fleet instance.\n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get port mappings for a game server container group. Provide the fleet ID, set \
   [ContainerGroupType] to [GAME_SERVER], and specify the [ComputeName] for the game server \
   container group.\n\
  \             \n\
  \              }\n\
  \         {-  Get port mappings for a per-instance container group. Provide the fleet ID, set \
   [ContainerGroupType] to [PER_INSTANCE], and specify the [InstanceId] for the instance.\n\
  \             \n\
  \              }\n\
  \         {-  Optionally filter results to a single container by providing a [ContainerName].\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results} \n\
  \   \n\
  \    This operation returns the fleet ID, fleet ARN, location, container group definition ARN, \
   container group type, compute name (for game server container groups), instance ID, and a list \
   of [ContainerGroupPortMapping] objects. Each object contains the container name, runtime ID, \
   and a list of port mappings that show how container ports map to connection ports on the \
   instance.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/containers-remote-access.html}Connect \
   to containers} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/containers-create-groups.html}Create \
   a container group definition} \n\
  \       "]

module DescribeContainerGroupDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_group_definition_input ->
    ( describe_container_group_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_group_definition_input ->
    ( describe_container_group_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves the properties of a container group definition, including all container definitions \
   in the group. \n\
  \ \n\
  \   {b Request options:} \n\
  \  \n\
  \   {ul\n\
  \         {-  Retrieve the latest version of a container group definition. Specify the container \
   group definition name only, or use an ARN value without a version number.\n\
  \             \n\
  \              }\n\
  \         {-  Retrieve a particular version. Specify the container group definition name and a \
   version number, or use an ARN value that includes the version number.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results:} \n\
  \   \n\
  \    If successful, this operation returns the complete properties of a container group \
   definition version.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/containers-create-groups.html}Manage \
   a container group definition} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module DescribeContainerFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_fleet_input ->
    ( describe_container_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_fleet_input ->
    ( describe_container_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Retrieves the properties for a container fleet. When requesting attributes for multiple \
   fleets, use the pagination parameters to retrieve results as a set of sequential pages. \n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   {ul\n\
  \         {-  Get container fleet properties for a single fleet. Provide either the fleet ID or \
   ARN value. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, a [ContainerFleet] object is returned. This object includes the fleet \
   properties, including information about the most recent deployment.\n\
  \    \n\
  \      Some API operations limit the number of fleet IDs that allowed in one request. If a \
   request exceeds this limit, the request fails and the error message contains the maximum \
   allowed number.\n\
  \      \n\
  \       "]

module DescribeCompute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_compute_input ->
    ( describe_compute_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_compute_input ->
    ( describe_compute_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves properties for a specific compute resource in an Amazon GameLift Servers fleet. You \
   can list all computes in a fleet by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute.html}ListCompute}. \n\
  \ \n\
  \   {b Request options} \n\
  \  \n\
  \   Provide the fleet ID and compute name. The compute name varies depending on the type of fleet.\n\
  \   \n\
  \    {ul\n\
  \          {-  For a compute in a managed EC2 fleet, provide an instance ID. Each instance in \
   the fleet is a compute.\n\
  \              \n\
  \               }\n\
  \          {-  For a compute in a managed container fleet, provide a compute name. In a \
   container fleet, each game server container group on a fleet instance is assigned a compute \
   name.\n\
  \              \n\
  \               }\n\
  \          {-  For a compute in an Anywhere fleet, provide a registered compute name. Anywhere \
   fleet computes are created when you register a hosting resource with the fleet.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation returns details for the requested compute resource. Depending \
   on the fleet's compute type, the result includes the following information: \n\
  \    \n\
  \     {ul\n\
  \           {-  For a managed EC2 fleet, this operation returns information about the EC2 \
   instance.\n\
  \               \n\
  \                }\n\
  \           {-  For an Anywhere fleet, this operation returns information about the registered \
   compute.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DescribeBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_build_input ->
    ( describe_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_build_input ->
    ( describe_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Retrieves properties for a custom game build. To request a build resource, specify a build ID. \
   If successful, an object containing the build properties is returned.\n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \    {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html} \
   Upload a Custom Server Build} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module DescribeAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_alias_input ->
    ( describe_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_alias_input ->
    ( describe_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Retrieves properties for an alias. This operation returns all alias metadata and settings. To \
   get an alias's target fleet ID only, use [ResolveAlias]. \n\
  \ \n\
  \  To get alias properties, specify the alias ID. If successful, the requested alias record is \
   returned.\n\
  \  \n\
  \    {b Related actions} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module DeregisterGameServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_game_server_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_game_server_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Removes the game server from a game server group. As a result of this operation, the \
   deregistered game server can no longer be claimed and will not be returned in a list of active \
   game servers. \n\
  \ \n\
  \  To deregister a game server, specify the game server group and game server ID. If successful, \
   this operation emits a CloudWatch event with termination timestamp and reason.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \    "]

module DeregisterCompute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_compute_input ->
    ( deregister_compute_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_compute_input ->
    ( deregister_compute_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Anywhere\n\n\
  \ Removes a compute resource from an Anywhere fleet. Deregistered computes can no longer host \
   game sessions through Amazon GameLift Servers. Use this operation with an Anywhere fleet that \
   doesn't use the Amazon GameLift Servers Agent For Anywhere fleets with the Agent, the Agent \
   handles all compute registry tasks for you. \n\
  \ \n\
  \  To deregister a compute, call this operation from the compute that's being deregistered and \
   specify the compute name and the fleet ID. \n\
  \  "]

module DeleteVpcPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_peering_connection_input ->
    ( delete_vpc_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_peering_connection_input ->
    ( delete_vpc_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Removes a VPC peering connection. To delete the connection, you must have a valid \
   authorization for the VPC peering connection that you want to delete.. \n\
  \ \n\
  \  Once a valid authorization exists, call this operation from the Amazon Web Services account \
   that is used to manage the Amazon GameLift Servers fleets. Identify the connection to delete by \
   the connection ID and fleet ID. If successful, the connection is removed. \n\
  \  \n\
  \    {b Related actions} \n\
  \   \n\
  \     \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \    "]

module DeleteVpcPeeringAuthorization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_peering_authorization_input ->
    ( delete_vpc_peering_authorization_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_peering_authorization_input ->
    ( delete_vpc_peering_authorization_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Cancels a pending VPC peering authorization for the specified VPC. If you need to delete an \
   existing VPC peering connection, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DeleteVpcPeeringConnection.html}DeleteVpcPeeringConnection}.\n\
  \ \n\
  \   {b Related actions} \n\
  \  \n\
  \    \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \   "]

module DeleteScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_script_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_script_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Deletes a Realtime script. This operation permanently deletes the script record. If script \
   files were uploaded, they are also deleted (files stored in an S3 bucket are not deleted). \n\
  \ \n\
  \  To delete a script, specify the script ID. Before deleting a script, be sure to terminate all \
   fleets that are deployed with the script being deleted. Fleet instances periodically check for \
   script updates, and if the script record no longer exists, the instance will go into an error \
   state and be unable to host game sessions.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html}Amazon \
   GameLift Servers Amazon GameLift Servers Realtime} \n\
  \    \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module DeleteScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Deletes a fleet scaling policy. Once deleted, the policy is no longer in force and Amazon \
   GameLift Servers removes all record of it. To delete a scaling policy, specify both the scaling \
   policy name and the fleet ID it is associated with.\n\
  \ \n\
  \  To temporarily suspend scaling policies, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StopFleetActions.html}StopFleetActions}. \
   This operation suspends all policies for the fleet.\n\
  \  "]

module DeleteMatchmakingRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_matchmaking_rule_set_input ->
    ( delete_matchmaking_rule_set_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_matchmaking_rule_set_input ->
    ( delete_matchmaking_rule_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Deletes an existing matchmaking rule set. To delete the rule set, provide the rule set name. \
   Rule sets cannot be deleted if they are currently being used by a matchmaking configuration. \n\
  \ \n\
  \   {b Learn more} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html}Build a rule \
   set} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DeleteMatchmakingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_matchmaking_configuration_input ->
    ( delete_matchmaking_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_matchmaking_configuration_input ->
    ( delete_matchmaking_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Permanently removes a FlexMatch matchmaking configuration. To delete, specify the \
   configuration name. A matchmaking configuration cannot be deleted if it is being used in any \
   active matchmaking tickets.\n\
  \ "]

module DeleteLocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_location_input ->
    ( delete_location_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_location_input ->
    ( delete_location_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Anywhere\n\n\
  \ Deletes a custom location.\n\
  \ \n\
  \  Before deleting a custom location, review any fleets currently using the custom location and \
   deregister the location if it is in use. For more information, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DeregisterCompute.html}DeregisterCompute}.\n\
  \  "]

module DeleteGameSessionQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_game_session_queue_input ->
    ( delete_game_session_queue_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_game_session_queue_input ->
    ( delete_game_session_queue_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Deletes a game session queue. Once a queue is successfully deleted, unfulfilled \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartGameSessionPlacement.html}StartGameSessionPlacement} \
   requests that reference the queue will fail. To delete a queue, specify the queue name.\n\
  \ "]

module DeleteGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_game_server_group_input ->
    ( delete_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_game_server_group_input ->
    ( delete_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Terminates a game server group and permanently deletes the game server group record. You have \
   several options for how these resources are impacted when deleting the game server group. \
   Depending on the type of delete operation selected, this operation might affect these resources:\n\
  \ \n\
  \  {ul\n\
  \        {-  The game server group\n\
  \            \n\
  \             }\n\
  \        {-  The corresponding Auto Scaling group\n\
  \            \n\
  \             }\n\
  \        {-  All game servers that are currently running in the group\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   To delete a game server group, identify the game server group to delete and specify the type \
   of delete operation to initiate. Game server groups can only be deleted if they are in [ACTIVE] \
   or [ERROR] status.\n\
  \   \n\
  \    If the delete request is successful, a series of operations are kicked off. The game server \
   group status is changed to [DELETE_SCHEDULED], which prevents new game servers from being \
   registered and stops automatic scaling activity. Once all game servers in the game server group \
   are deregistered, Amazon GameLift Servers FleetIQ can begin deleting resources. If any of the \
   delete operations fail, the game server group is placed in [ERROR] status.\n\
  \    \n\
  \     Amazon GameLift Servers FleetIQ emits delete events to Amazon CloudWatch.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \       "]

module DeleteFleetLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_locations_input ->
    ( delete_fleet_locations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_locations_input ->
    ( delete_fleet_locations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Removes locations from a multi-location fleet. When deleting a location, all game server \
   process and all instances that are still active in the location are shut down. \n\
  \ \n\
  \  To delete fleet locations, identify the fleet ID and provide a list of the locations to be \
   deleted. \n\
  \  \n\
  \   If successful, GameLift sets the location status to [DELETING], and begins to shut down \
   existing server processes and terminate instances in each location being deleted. When \
   completed, the location status changes to [TERMINATED].\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers fleets} \n\
  \     "]

module DeleteFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Deletes all resources and information related to a fleet and shuts down any currently running \
   fleet instances, including those in remote locations.\n\
  \ \n\
  \   If the fleet being deleted has a VPC peering connection, you first need to get a valid \
   authorization (good for 24 hours) by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateVpcPeeringAuthorization.html}CreateVpcPeeringAuthorization}. \
   You don't need to explicitly delete the VPC peering connection.\n\
  \   \n\
  \     To delete a fleet, specify the fleet ID to be terminated. During the deletion process, the \
   fleet status is changed to [DELETING]. When completed, the status switches to [TERMINATED] and \
   the fleet event [FLEET_DELETED] is emitted.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up Amazon GameLift Servers Fleets} \n\
  \       "]

module DeleteContainerGroupDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_group_definition_input ->
    ( delete_container_group_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_group_definition_input ->
    ( delete_container_group_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \  {b Request options:} \n\
  \ \n\
  \  Deletes a container group definition. \n\
  \  \n\
  \   {ul\n\
  \         {-  Delete an entire container group definition, including all versions. Specify the \
   container group definition name, or use an ARN value without the version number.\n\
  \             \n\
  \              }\n\
  \         {-  Delete a particular version. Specify the container group definition name and a \
   version number, or use an ARN value that includes the version number.\n\
  \             \n\
  \              }\n\
  \         {-  Keep the newest versions and delete all older versions. Specify the container \
   group definition name and the number of versions to retain. For example, set \
   [VersionCountToRetain] to 5 to delete all but the five most recent versions.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    {b Result} \n\
  \   \n\
  \    If successful, Amazon GameLift Servers removes the container group definition versions that \
   you request deletion for. This request will fail for any requested versions if the following is \
   true: \n\
  \    \n\
  \     {ul\n\
  \           {-  If the version is being used in an active fleet\n\
  \               \n\
  \                }\n\
  \           {-  If the version is being deployed to a fleet in a deployment that's currently in \
   progress.\n\
  \               \n\
  \                }\n\
  \           {-  If the version is designated as a rollback definition in a fleet deployment \
   that's currently in progress.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/containers-create-groups.html}Manage \
   a container group definition} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DeleteContainerFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_fleet_input ->
    ( delete_container_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_fleet_input ->
    ( delete_container_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Deletes all resources and information related to a container fleet and shuts down currently \
   running fleet instances, including those in remote locations. The container fleet must be in \
   [ACTIVE] status to be deleted.\n\
  \ \n\
  \  To delete a fleet, specify the fleet ID to be terminated. During the deletion process, the \
   fleet status is changed to [DELETING]. \n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting up \
   Amazon GameLift Servers Fleets} \n\
  \    "]

module DeleteBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_build_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_build_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Deletes a build. This operation permanently deletes the build resource and any uploaded build \
   files. Deleting a build does not affect the status of any active fleets using the build, but \
   you can no longer create new fleets with the deleted build.\n\
  \ \n\
  \  To delete a build, specify the build ID. \n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html} \
   Upload a Custom Server Build} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module DeleteAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_alias_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_alias_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Deletes an alias. This operation removes all record of the alias. Game clients attempting to \
   access a server process using the deleted alias receive an error. To delete an alias, specify \
   the alias ID to be deleted.\n\
  \ \n\
  \   {b Related actions} \n\
  \  \n\
  \    \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \   "]

module CreateVpcPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_peering_connection_input ->
    ( create_vpc_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_peering_connection_input ->
    ( create_vpc_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Establishes a VPC peering connection between a virtual private cloud (VPC) in an Amazon Web \
   Services account with the VPC for your Amazon GameLift Servers fleet. VPC peering enables the \
   game servers on your fleet to communicate directly with other Amazon Web Services resources. \
   You can peer with VPCs in any Amazon Web Services account that you have access to, including \
   the account that you use to manage your Amazon GameLift Servers fleets. You cannot peer with \
   VPCs that are in different Regions. For more information, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC Peering with \
   Amazon GameLift Servers Fleets}.\n\
  \ \n\
  \  Before calling this operation to establish the peering connection, you first need to use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateVpcPeeringAuthorization.html}CreateVpcPeeringAuthorization} \
   and identify the VPC you want to peer with. Once the authorization for the specified VPC is \
   issued, you have 24 hours to establish the connection. These two operations handle all tasks \
   necessary to peer the two VPCs, including acceptance, updating routing tables, etc. \n\
  \  \n\
  \   To establish the connection, call this operation from the Amazon Web Services account that \
   is used to manage the Amazon GameLift Servers fleets. Identify the following values: (1) The ID \
   of the fleet you want to be enable a VPC peering connection for; (2) The Amazon Web Services \
   account with the VPC that you want to peer with; and (3) The ID of the VPC you want to peer \
   with. This operation is asynchronous. If successful, a connection request is created. You can \
   use continuous polling to track the request's status using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeVpcPeeringConnections.html}DescribeVpcPeeringConnections} \
   , or by monitoring fleet events for success or failure using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetEvents.html}DescribeFleetEvents} \
   . \n\
  \   \n\
  \     Amazon GameLift Servers uses the caller's credentials to update peer-VPC resources. The \
   IAM user that calls this operation must have the following Amazon EC2 permissions enabled:\n\
  \     \n\
  \      {ul\n\
  \            {-   [ec2:AcceptVpcPeeringConnection] \n\
  \                \n\
  \                 }\n\
  \            {-   [ec2:AuthorizeSecurityGroupEgress] \n\
  \                \n\
  \                 }\n\
  \            {-   [ec2:AuthorizeSecurityGroupIngress] \n\
  \                \n\
  \                 }\n\
  \            {-   [ec2:CreateRoute] \n\
  \                \n\
  \                 }\n\
  \            {-   [ec2:DescribeRouteTables] \n\
  \                \n\
  \                 }\n\
  \            {-   [ec2:DescribeSecurityGroups] \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \     {b Related actions} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module CreateVpcPeeringAuthorization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_peering_authorization_input ->
    ( create_vpc_peering_authorization_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_peering_authorization_input ->
    ( create_vpc_peering_authorization_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2\n\n\
  \ Requests authorization to create or delete a peer connection between the VPC for your Amazon \
   GameLift Servers fleet and a virtual private cloud (VPC) in your Amazon Web Services account. \
   VPC peering enables the game servers on your fleet to communicate directly with other Amazon \
   Web Services resources. After you've received authorization, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateVpcPeeringConnection.html}CreateVpcPeeringConnection} \
   to establish the peering connection. For more information, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC Peering with \
   Amazon GameLift Servers Fleets}.\n\
  \ \n\
  \  You can peer with VPCs that are owned by any Amazon Web Services account you have access to, \
   including the account that you use to manage your Amazon GameLift Servers fleets. You cannot \
   peer with VPCs that are in different Regions.\n\
  \  \n\
  \   To request authorization to create a connection, call this operation from the Amazon Web \
   Services account with the VPC that you want to peer to your Amazon GameLift Servers fleet. For \
   example, to enable your game servers to retrieve data from a DynamoDB table, use the account \
   that manages that DynamoDB resource. Identify the following values: (1) The ID of the VPC that \
   you want to peer with, and (2) the ID of the Amazon Web Services account that you use to manage \
   Amazon GameLift Servers. If successful, VPC peering is authorized for the specified VPC. \n\
  \   \n\
  \    To request authorization to delete a connection, call this operation from the Amazon Web \
   Services account with the VPC that is peered with your Amazon GameLift Servers fleet. Identify \
   the following values: (1) VPC ID that you want to delete the peering connection for, and (2) ID \
   of the Amazon Web Services account that you use to manage Amazon GameLift Servers. \n\
  \    \n\
  \     The authorization remains valid for 24 hours unless it is canceled. You must create or \
   delete the peering connection while the authorization is valid. \n\
  \     \n\
  \       Amazon GameLift Servers uses the caller's credentials to update peer-VPC resources. The \
   IAM user that calls this operation must have the following Amazon EC2 permissions enabled:\n\
  \       \n\
  \        {ul\n\
  \              {-   [ec2:AcceptVpcPeeringConnection] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:AuthorizeSecurityGroupEgress] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:AuthorizeSecurityGroupIngress] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:CreateRoute] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:DescribeRouteTables] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:DescribeSecurityGroups] \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \     {b Related actions} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module CreateScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_script_input ->
    ( create_script_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_script_input ->
    ( create_script_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere\n\n\
  \ Creates a new script record for your Amazon GameLift Servers Realtime script. Realtime scripts \
   are JavaScript that provide configuration settings and optional custom game logic for your \
   game. The script is deployed when you create a Amazon GameLift Servers Realtime fleet to host \
   your game sessions. Script logic is executed during an active game session. \n\
  \ \n\
  \  To create a new script record, specify a script name and provide the script file(s). The \
   script files and all dependencies must be zipped into a single file. You can pull the zip file \
   from either of these locations: \n\
  \  \n\
  \   {ul\n\
  \         {-  A locally available directory. Use the {i ZipFile} parameter for this option.\n\
  \             \n\
  \              }\n\
  \         {-  An Amazon Simple Storage Service (Amazon S3) bucket under your Amazon Web Services \
   account. Use the {i StorageLocation} parameter for this option. You'll need to have an Identity \
   Access Management (IAM) role that allows the Amazon GameLift Servers service to access your S3 \
   bucket. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   If the call is successful, a new script record is created with a unique script ID. If the \
   script file is provided as a local file, the file is uploaded to an Amazon GameLift \
   Servers-owned S3 bucket and the script record's storage location reflects this location. If the \
   script file is provided as an S3 bucket, Amazon GameLift Servers accesses the file at this \
   storage location as needed for deployment.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html}Amazon \
   GameLift Servers Amazon GameLift Servers Realtime} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html}Set \
   Up a Role for Amazon GameLift Servers Access} \n\
  \      \n\
  \        {b Related actions} \n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \        "]

module CreatePlayerSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GameSessionFullException of game_session_full_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidGameSessionStatusException of invalid_game_session_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_player_sessions_input ->
    ( create_player_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GameSessionFullException of game_session_full_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_player_sessions_input ->
    ( create_player_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GameSessionFullException of game_session_full_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Reserves open slots in a game session for a group of players. New player sessions can be \
   created in any game session with an open slot that is in [ACTIVE] status and has a player \
   creation policy of [ACCEPT_ALL]. To add a single player to a game session, use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreatePlayerSession.html}CreatePlayerSession} \n\
  \ \n\
  \  To create player sessions, specify a game session ID and a list of player IDs. Optionally, \
   provide a set of player data for each player ID. \n\
  \  \n\
  \   If successful, a slot is reserved in the game session for each player, and new \
   [PlayerSession] objects are returned with player session IDs. Each player references their \
   player session ID when sending a connection request to the game session, and the game server \
   can use it to validate the player reservation with the Amazon GameLift Servers service. Player \
   sessions cannot be updated.\n\
  \   \n\
  \    The maximum number of players per game session is 200. It is not adjustable. \n\
  \    \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module CreatePlayerSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GameSessionFullException of game_session_full_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidGameSessionStatusException of invalid_game_session_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_player_session_input ->
    ( create_player_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GameSessionFullException of game_session_full_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_player_session_input ->
    ( create_player_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GameSessionFullException of game_session_full_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidGameSessionStatusException of invalid_game_session_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Reserves an open player slot in a game session for a player. New player sessions can be \
   created in any game session with an open slot that is in [ACTIVE] status and has a player \
   creation policy of [ACCEPT_ALL]. You can add a group of players to a game session with \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreatePlayerSessions.html}CreatePlayerSessions} \
   . \n\
  \ \n\
  \  To create a player session, specify a game session ID, player ID, and optionally a set of \
   player data. \n\
  \  \n\
  \   If successful, a slot is reserved in the game session for the player and a new \
   [PlayerSessions] object is returned with a player session ID. The player references the player \
   session ID when sending a connection request to the game session, and the game server can use \
   it to validate the player reservation with the Amazon GameLift Servers service. Player sessions \
   cannot be updated. \n\
  \   \n\
  \    The maximum number of players per game session is 200. It is not adjustable. \n\
  \    \n\
  \      {b Related actions} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \      "]

module CreateMatchmakingRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_matchmaking_rule_set_input ->
    ( create_matchmaking_rule_set_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_matchmaking_rule_set_input ->
    ( create_matchmaking_rule_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Creates a new rule set for FlexMatch matchmaking. A rule set describes the type of match to \
   create, such as the number and size of teams. It also sets the parameters for acceptable player \
   matches, such as minimum skill level or character type.\n\
  \ \n\
  \  To create a matchmaking rule set, provide unique rule set name and the rule set body in JSON \
   format. Rule sets must be defined in the same Region as the matchmaking configuration they are \
   used with.\n\
  \  \n\
  \   Since matchmaking rule sets cannot be edited, it is a good idea to check the rule set syntax \
   using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ValidateMatchmakingRuleSet.html}ValidateMatchmakingRuleSet} \
   before creating a new rule set.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html}Build a rule \
   set} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html}Design a \
   matchmaker} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-intro.html}Matchmaking with \
   FlexMatch} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module CreateMatchmakingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_matchmaking_configuration_input ->
    ( create_matchmaking_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_matchmaking_configuration_input ->
    ( create_matchmaking_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Defines a new matchmaking configuration for use with FlexMatch. Whether your are using \
   FlexMatch with Amazon GameLift Servers hosting or as a standalone matchmaking service, the \
   matchmaking configuration sets out rules for matching players and forming teams. If you're also \
   using Amazon GameLift Servers hosting, it defines how to start game sessions for each match. \
   Your matchmaking system can use multiple configurations to handle different game scenarios. All \
   matchmaking requests identify the matchmaking configuration to use and provide player \
   attributes consistent with that configuration. \n\
  \ \n\
  \  To create a matchmaking configuration, you must provide the following: configuration name and \
   FlexMatch mode (with or without Amazon GameLift Servers hosting); a rule set that specifies how \
   to evaluate players and find acceptable matches; whether player acceptance is required; and the \
   maximum time allowed for a matchmaking attempt. When using FlexMatch with Amazon GameLift \
   Servers hosting, you also need to identify the game session queue to use when starting a game \
   session for the match.\n\
  \  \n\
  \   In addition, you must set up an Amazon Simple Notification Service topic to receive \
   matchmaking notifications. Provide the topic ARN in the matchmaking configuration.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html} \
   Design a FlexMatch matchmaker} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html} \
   Set up FlexMatch event notification} \n\
  \      "]

module CreateLocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_input ->
    ( create_location_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_input ->
    ( create_location_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Anywhere\n\n\
  \ Creates a custom location for use in an Anywhere fleet.\n\
  \ "]

module CreateGameSessionQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_game_session_queue_input ->
    ( create_game_session_queue_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_game_session_queue_input ->
    ( create_game_session_queue_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Creates a placement queue that processes requests for new game sessions. A queue uses FleetIQ \
   algorithms to locate the best available placement locations for a new game session, and then \
   prompts the game server process to start a new game session.\n\
  \ \n\
  \  A game session queue is configured with a set of destinations (Amazon GameLift Servers fleets \
   or aliases) that determine where the queue can place new game sessions. These destinations can \
   span multiple Amazon Web Services Regions, can use different instance types, and can include \
   both Spot and On-Demand fleets. If the queue includes multi-location fleets, the queue can \
   place game sessions in any of a fleet's remote locations.\n\
  \  \n\
  \   You can configure a queue to determine how it selects the best available placement for a new \
   game session. Queues can prioritize placement decisions based on a combination of location, \
   hosting cost, and player latency. You can set up the queue to use the default prioritization or \
   provide alternate instructions using [PriorityConfiguration].\n\
  \   \n\
  \     {b Request options} \n\
  \    \n\
  \     Use this operation to make these common types of requests. \n\
  \     \n\
  \      {ul\n\
  \            {-  Create a queue with the minimum required parameters.\n\
  \                \n\
  \                 {ul\n\
  \                       {-   [Name] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [Destinations] (This parameter isn't required, but a queue can't \
   make placements without at least one destination.)\n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            {-  Create a queue with placement notification. Queues that have high placement \
   activity must use a notification system, such as with Amazon Simple Notification Service \
   (Amazon SNS) or Amazon CloudWatch.\n\
  \                \n\
  \                 {ul\n\
  \                       {-  Required parameters [Name] and [Destinations] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [NotificationTarget] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            {-  Create a queue with custom prioritization settings. These custom settings \
   replace the default prioritization configuration for a queue.\n\
  \                \n\
  \                 {ul\n\
  \                       {-  Required parameters [Name] and [Destinations] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [PriorityConfiguration] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            {-  Create a queue with special rules for processing player latency data.\n\
  \                \n\
  \                 {ul\n\
  \                       {-  Required parameters [Name] and [Destinations] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [PlayerLatencyPolicies] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation returns a new [GameSessionQueue] object with an assigned \
   queue ARN. Use the queue's name or ARN when submitting new game session requests with \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartGameSessionPlacement.html}StartGameSessionPlacement} \
   or \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartMatchmaking.html}StartMatchmaking}. \n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-design.html} Design \
   a game session queue} \n\
  \      \n\
  \        {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-creating.html} \
   Create a game session queue} \n\
  \       \n\
  \         {b Related actions} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateGameSessionQueue.html}CreateGameSessionQueue} \
   | \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeGameSessionQueues.html}DescribeGameSessionQueues} \
   | \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateGameSessionQueue.html}UpdateGameSessionQueue} \
   | \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DeleteGameSessionQueue.html}DeleteGameSessionQueue} \
   | \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \         "]

module CreateGameSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `FleetCapacityExceededException of fleet_capacity_exceeded_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_game_session_input ->
    ( create_game_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `FleetCapacityExceededException of fleet_capacity_exceeded_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_game_session_input ->
    ( create_game_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `FleetCapacityExceededException of fleet_capacity_exceeded_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TerminalRoutingStrategyException of terminal_routing_strategy_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Creates a multiplayer game session for players in a specific fleet location. This operation \
   prompts an available server process to start a game session and retrieves connection \
   information for the new game session. As an alternative, consider using the Amazon GameLift \
   Servers game session placement feature with \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartGameSessionPlacement.html}StartGameSessionPlacement}, \
   which uses the FleetIQ algorithm and queues to optimize the placement process.\n\
  \ \n\
  \  When creating a game session, you specify exactly where you want to place it and provide a \
   set of game session configuration settings. The target fleet must be in [ACTIVE] status. \n\
  \  \n\
  \   You can use this operation in the following ways: \n\
  \   \n\
  \    {ul\n\
  \          {-  To create a game session on an instance in a fleet's home Region, provide a fleet \
   or alias ID along with your game session configuration. \n\
  \              \n\
  \               }\n\
  \          {-  To create a game session on an instance in a fleet's remote location, provide a \
   fleet or alias ID and a location name, along with your game session configuration. \n\
  \              \n\
  \               }\n\
  \          {-  To create a game session on an instance in an Anywhere fleet, specify the fleet's \
   custom location.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If successful, Amazon GameLift Servers initiates a workflow to start a new game session and \
   returns a [GameSession] object containing the game session configuration and status. When the \
   game session status is [ACTIVE], it is updated with connection information and you can create \
   player sessions for the game session. By default, newly created game sessions are open to new \
   players. You can restrict new player access by using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateGameSession.html}UpdateGameSession} \
   to change the game session's player session creation policy.\n\
  \   \n\
  \    Amazon GameLift Servers retains logs for active for 14 days. To access the logs, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetGameSessionLogUrl.html}GetGameSessionLogUrl} \
   to download the log files.\n\
  \    \n\
  \      {i Available in Amazon GameLift Servers Local.} \n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
   a game session} \n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \        "]

module CreateGameServerGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_game_server_group_input ->
    ( create_game_server_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_game_server_group_input ->
    ( create_game_server_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Creates a Amazon GameLift Servers FleetIQ game server group for managing game hosting on a \
   collection of Amazon Elastic Compute Cloud instances for game hosting. This operation creates \
   the game server group, creates an Auto Scaling group in your Amazon Web Services account, and \
   establishes a link between the two groups. You can view the status of your game server groups \
   in the Amazon GameLift Servers console. Game server group metrics and events are emitted to \
   Amazon CloudWatch.\n\
  \ \n\
  \  Before creating a new game server group, you must have the following: \n\
  \  \n\
  \   {ul\n\
  \         {-  An Amazon Elastic Compute Cloud launch template that specifies how to launch \
   Amazon Elastic Compute Cloud instances with your game server build. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html} Launching an \
   Instance from a Launch Template} in the {i Amazon Elastic Compute Cloud User Guide}. \n\
  \             \n\
  \              }\n\
  \         {-  An IAM role that extends limited access to your Amazon Web Services account to \
   allow Amazon GameLift Servers FleetIQ to create and interact with the Auto Scaling group. For \
   more information, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-iam-permissions-roles.html}Create \
   IAM roles for cross-service interaction} in the {i Amazon GameLift Servers FleetIQ Developer \
   Guide}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To create a new game server group, specify a unique group name, IAM role and Amazon Elastic \
   Compute Cloud launch template, and provide a list of instance types that can be used in the \
   group. You must also set initial maximum and minimum limits on the group's instance count. You \
   can optionally set an Auto Scaling policy with target tracking based on a Amazon GameLift \
   Servers FleetIQ metric.\n\
  \   \n\
  \    Once the game server group and corresponding Auto Scaling group are created, you have full \
   access to change the Auto Scaling group's configuration as needed. Several properties that are \
   set when creating a game server group, including maximum/minimum size and auto-scaling policy \
   settings, must be updated directly in the Auto Scaling group. Keep in mind that some Auto \
   Scaling group properties are periodically updated by Amazon GameLift Servers FleetIQ as part of \
   its balancing activities to optimize for availability and cost.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \       {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon \
   GameLift Servers FleetIQ Guide} \n\
  \      "]

module CreateFleetLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidFleetStatusException of invalid_fleet_status_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `NotReadyException of not_ready_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_locations_input ->
    ( create_fleet_locations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_locations_input ->
    ( create_fleet_locations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidFleetStatusException of invalid_fleet_status_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Container\n\n\
  \ Adds remote locations to an EC2 and begins populating the new locations with instances. The \
   new instances conform to the fleet's instance type, auto-scaling, and other configuration \
   settings.\n\
  \ \n\
  \   You can't add remote locations to a fleet that resides in an Amazon Web Services Region that \
   doesn't support multiple locations. Fleets created prior to March 2021 can't support multiple \
   locations.\n\
  \   \n\
  \     To add fleet locations, specify the fleet to be updated and provide a list of one or more \
   locations. \n\
  \     \n\
  \      If successful, this operation returns the list of added locations with their status set \
   to [NEW]. Amazon GameLift Servers initiates the process of starting an instance in each added \
   location. You can track the status of each new location by monitoring location creation events \
   using \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetEvents.html}DescribeFleetEvents}.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \         \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting up \
   fleets} \n\
  \        \n\
  \          \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-editing.html#fleets-update-locations}Update \
   fleet locations} \n\
  \         \n\
  \           {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
   Amazon GameLift Servers service locations} for managed hosting.\n\
  \          "]

module CreateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `NotReadyException of not_ready_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_input ->
    ( create_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_input ->
    ( create_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `NotReadyException of not_ready_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Creates a fleet of compute resources to host your game servers. Use this operation to set up a \
   fleet for the following compute types: \n\
  \ \n\
  \   {b Managed EC2 fleet} \n\
  \  \n\
  \   An EC2 fleet is a set of Amazon Elastic Compute Cloud (Amazon EC2) instances. Your game \
   server build is deployed to each fleet instance. Amazon GameLift Servers manages the fleet's \
   instances and controls the lifecycle of game server processes, which host game sessions for \
   players. EC2 fleets can have instances in multiple locations. Each instance in the fleet is \
   designated a [Compute].\n\
  \   \n\
  \    To create an EC2 fleet, provide these required parameters:\n\
  \    \n\
  \     {ul\n\
  \           {-  Either [BuildId] or [ScriptId] \n\
  \               \n\
  \                }\n\
  \           {-   [ComputeType] set to [EC2] (the default value)\n\
  \               \n\
  \                }\n\
  \           {-   [EC2InboundPermissions] \n\
  \               \n\
  \                }\n\
  \           {-   [EC2InstanceType] \n\
  \               \n\
  \                }\n\
  \           {-   [FleetType] \n\
  \               \n\
  \                }\n\
  \           {-   [Name] \n\
  \               \n\
  \                }\n\
  \           {-   [RuntimeConfiguration] with at least one [ServerProcesses] configuration\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   If successful, this operation creates a new fleet resource and places it in [NEW] status \
   while Amazon GameLift Servers initiates the \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-all.html#fleets-creation-workflow}fleet \
   creation workflow}. To debug your fleet, fetch logs, view performance metrics or other actions \
   on the fleet, create a development fleet with port 22/3389 open. As a best practice, we \
   recommend opening ports for remote access only when you need them and closing them when you're \
   finished. \n\
  \   \n\
  \    When the fleet status is ACTIVE, you can adjust capacity settings and turn autoscaling \
   on/off for each location.\n\
  \    \n\
  \      A managed fleet's runtime environment depends on the Amazon Machine Image (AMI) version \
   it uses. When a new fleet is created, Amazon GameLift Servers assigns the latest available AMI \
   version to the fleet, and all compute instances in that fleet are deployed with that version. \
   To update the AMI version, you must create a new fleet. As a best practice, we recommend \
   replacing your managed fleets every 30 days to maintain a secure and up-to-date runtime \
   environment for your hosted game servers. For guidance, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/security-best-practices.html} \
   Security best practices for Amazon GameLift Servers}.\n\
  \      \n\
  \         {b Anywhere fleet} \n\
  \        \n\
  \         An Anywhere fleet represents compute resources that are not owned or managed by Amazon \
   GameLift Servers. You might create an Anywhere fleet with your local machine for testing, or \
   use one to host game servers with on-premises hardware or other game hosting solutions. \n\
  \         \n\
  \          To create an Anywhere fleet, provide these required parameters:\n\
  \          \n\
  \           {ul\n\
  \                 {-   [ComputeType] set to [ANYWHERE] \n\
  \                     \n\
  \                      }\n\
  \                 {-   [Locations] specifying a custom location\n\
  \                     \n\
  \                      }\n\
  \                 {-   [Name] \n\
  \                     \n\
  \                      }\n\
  \                 }\n\
  \   If successful, this operation creates a new fleet resource and places it in [ACTIVE] status. \
   You can register computes with a fleet in [ACTIVE] status. \n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Setting \
   up fleets} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html#fleets-creating-debug-creation}Debug \
   fleet creation issues} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html}Multi-location \
   fleets} \n\
  \       "]

module CreateContainerGroupDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_container_group_definition_input ->
    ( create_container_group_definition_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_container_group_definition_input ->
    ( create_container_group_definition_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Creates a [ContainerGroupDefinition] that describes a set of containers for hosting your game \
   server with Amazon GameLift Servers managed containers hosting. An Amazon GameLift Servers \
   container group is similar to a container task or pod. Use container group definitions when you \
   create a container fleet with \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerFleet.html}CreateContainerFleet}. \n\
  \ \n\
  \  A container group definition determines how Amazon GameLift Servers deploys your containers \
   to each instance in a container fleet. You can maintain multiple versions of a container group \
   definition.\n\
  \  \n\
  \   There are two types of container groups:\n\
  \   \n\
  \    {ul\n\
  \          {-  A {b game server container group} has the containers that run your game server \
   application and supporting software. A game server container group can have these container \
   types:\n\
  \              \n\
  \               {ul\n\
  \                     {-  Game server container. This container runs your game server. You can \
   define one game server container in a game server container group.\n\
  \                         \n\
  \                          }\n\
  \                     {-  Support container. This container runs software in parallel with your \
   game server. You can define up to 8 support containers in a game server group.\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            When building a game server container group definition, you can choose to bundle \
   your game server executable and all dependent software into a single game server container. \
   Alternatively, you can separate the software into one game server container and one or more \
   support containers.\n\
  \            \n\
  \             On a container fleet instance, a game server container group can be deployed \
   multiple times (depending on the compute resources of the instance). This means that all \
   containers in the container group are replicated together.\n\
  \             \n\
  \              }\n\
  \          {-  A {b per-instance container group} has containers for processes that aren't \
   replicated on a container fleet instance. This might include background services, logging, test \
   processes, or processes that need to persist independently of the game server container group. \
   When building a per-instance container group, you can define up to 10 support containers.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    This operation requires Identity and Access Management (IAM) permissions to access \
   container images in Amazon ECR repositories. See \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-iam-policy-examples.html} \
   IAM permissions for Amazon GameLift Servers} for help setting the appropriate permissions.\n\
  \    \n\
  \       {b Request options} \n\
  \      \n\
  \       Use this operation to make the following types of requests. You can specify values for \
   the minimum required parameters and customize optional values later.\n\
  \       \n\
  \        {ul\n\
  \              {-  Create a game server container group definition. Provide the following \
   required parameter values:\n\
  \                  \n\
  \                   {ul\n\
  \                         {-   [Name] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [ContainerGroupType] ([GAME_SERVER])\n\
  \                             \n\
  \                              }\n\
  \                         {-   [OperatingSystem] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [TotalMemoryLimitMebibytes] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [TotalVcpuLimit] \n\
  \                             \n\
  \                              }\n\
  \                         {-  At least one [GameServerContainerDefinition] \n\
  \                             \n\
  \                              {ul\n\
  \                                    {-   [ContainerName] \n\
  \                                        \n\
  \                                         }\n\
  \                                    {-   [ImageUrl] \n\
  \                                        \n\
  \                                         }\n\
  \                                    {-   [PortConfiguration] \n\
  \                                        \n\
  \                                         }\n\
  \                                    {-   [ServerSdkVersion] \n\
  \                                        \n\
  \                                         }\n\
  \                                    \n\
  \                          }\n\
  \                           }\n\
  \                         \n\
  \               }\n\
  \                }\n\
  \              {-  Create a per-instance container group definition. Provide the following \
   required parameter values:\n\
  \                  \n\
  \                   {ul\n\
  \                         {-   [Name] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [ContainerGroupType] ([PER_INSTANCE])\n\
  \                             \n\
  \                              }\n\
  \                         {-   [OperatingSystem] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [TotalMemoryLimitMebibytes] \n\
  \                             \n\
  \                              }\n\
  \                         {-   [TotalVcpuLimit] \n\
  \                             \n\
  \                              }\n\
  \                         {-  At least one [SupportContainerDefinition] \n\
  \                             \n\
  \                              {ul\n\
  \                                    {-   [ContainerName] \n\
  \                                        \n\
  \                                         }\n\
  \                                    {-   [ImageUrl] \n\
  \                                        \n\
  \                                         }\n\
  \                                    \n\
  \                          }\n\
  \                           }\n\
  \                         \n\
  \               }\n\
  \                }\n\
  \              }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this request creates a [ContainerGroupDefinition] resource and assigns a \
   unique ARN value. You can update most properties of a container group definition by calling \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition}, \
   and optionally save the update as a new version.\n\
  \    "]

module CreateContainerFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_container_fleet_input ->
    ( create_container_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_container_fleet_input ->
    ( create_container_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} Container\n\n\
  \ Creates a managed fleet of Amazon Elastic Compute Cloud (Amazon EC2) instances to host your \
   containerized game servers. Use this operation to define how to deploy a container architecture \
   onto each fleet instance and configure fleet settings. You can create a container fleet in any \
   Amazon Web Services Regions that Amazon GameLift Servers supports for multi-location fleets. A \
   container fleet can be deployed to a single location or multiple locations. Container fleets \
   are deployed with Amazon Linux 2023 as the instance operating system.\n\
  \ \n\
  \  Define the fleet's container architecture using container group definitions. Each fleet can \
   have one of the following container group types:\n\
  \  \n\
  \   {ul\n\
  \         {-  The game server container group runs your game server build and dependent \
   software. Amazon GameLift Servers deploys one or more replicas of this container group to each \
   fleet instance. The number of replicas depends on the computing capabilities of the fleet \
   instance in use. \n\
  \             \n\
  \              }\n\
  \         {-  An optional per-instance container group might be used to run other software that \
   only needs to run once per instance, such as background services, logging, or test processes. \
   One per-instance container group is deployed to each fleet instance. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Each container group can include the definition for one or more containers. A container \
   definition specifies a container image that is stored in an Amazon Elastic Container Registry \
   (Amazon ECR) public or private repository.\n\
  \   \n\
  \     {b Request options} \n\
  \    \n\
  \     Use this operation to make the following types of requests. Most fleet settings have \
   default values, so you can create a working fleet with a minimal configuration and default \
   values, which you can customize later.\n\
  \     \n\
  \      {ul\n\
  \            {-  Create a fleet with no container groups. You can configure a container fleet \
   and then add container group definitions later. In this scenario, no fleet instances are \
   deployed, and the fleet can't host game sessions until you add a game server container group \
   definition. Provide the following required parameter values:\n\
  \                \n\
  \                 {ul\n\
  \                       {-   [FleetRoleArn] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            {-  Create a fleet with a game server container group. Provide the following \
   required parameter values:\n\
  \                \n\
  \                 {ul\n\
  \                       {-   [FleetRoleArn] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [GameServerContainerGroupDefinitionName] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            {-  Create a fleet with a game server container group and a per-instance container \
   group. Provide the following required parameter values:\n\
  \                \n\
  \                 {ul\n\
  \                       {-   [FleetRoleArn] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [GameServerContainerGroupDefinitionName] \n\
  \                           \n\
  \                            }\n\
  \                       {-   [PerInstanceContainerGroupDefinitionName] \n\
  \                           \n\
  \                            }\n\
  \                       \n\
  \             }\n\
  \              }\n\
  \            }\n\
  \    {b Results} \n\
  \   \n\
  \    If successful, this operation creates a new container fleet resource, places it in \
   [PENDING] status, and initiates the \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-all.html#fleets-creation-workflow}fleet \
   creation workflow}. For fleets with container groups, this workflow starts a fleet deployment \
   and transitions the status to [ACTIVE]. Fleets without a container group are placed in \
   [CREATED] status.\n\
  \    \n\
  \     You can update most of the properties of a fleet, including container group definitions, \
   and deploy the update across all fleet instances. Use \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerFleet.html}UpdateContainerFleet} \
   to deploy a new game server version update across the container fleet. \n\
  \     \n\
  \       A managed fleet's runtime environment depends on the Amazon Machine Image (AMI) version \
   it uses. When a new fleet is created, Amazon GameLift Servers assigns the latest available AMI \
   version to the fleet, and all compute instances in that fleet are deployed with that version. \
   To update the AMI version, you must create a new fleet. As a best practice, we recommend \
   replacing your managed fleets every 30 days to maintain a secure and up-to-date runtime \
   environment for your hosted game servers. For guidance, see \
   {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/security-best-practices.html} \
   Security best practices for Amazon GameLift Servers}.\n\
  \       \n\
  \        "]

module CreateBuild : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_build_input ->
    ( create_build_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_build_input ->
    ( create_build_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere\n\n\
  \ Creates a new Amazon GameLift Servers build resource for your game server binary files. \
   Combine game server binaries into a zip file for use with Amazon GameLift Servers. \n\
  \ \n\
  \   When setting up a new game build for Amazon GameLift Servers, we recommend using the CLI \
   command {b  \
   {{:https://docs.aws.amazon.com/cli/latest/reference/gamelift/upload-build.html}upload-build} }. \
   This helper command combines two tasks: (1) it uploads your build files from a file directory \
   to an Amazon GameLift Servers Amazon S3 location, and (2) it creates a new build resource.\n\
  \   \n\
  \     You can use the [CreateBuild] operation in the following scenarios:\n\
  \     \n\
  \      {ul\n\
  \            {-  Create a new game build with build files that are in an Amazon S3 location \
   under an Amazon Web Services account that you control. To use this option, you give Amazon \
   GameLift Servers access to the Amazon S3 bucket. With permissions in place, specify a build \
   name, operating system, and the Amazon S3 storage location of your game build.\n\
  \                \n\
  \                 }\n\
  \            {-  Upload your build files to a Amazon GameLift Servers Amazon S3 location. To use \
   this option, specify a build name and operating system. This operation creates a new build \
   resource and also returns an Amazon S3 location with temporary access credentials. Use the \
   credentials to manually upload your build files to the specified Amazon S3 location. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadingObjects.html}Uploading Objects} in \
   the {i Amazon S3 Developer Guide}. After you upload build files to the Amazon GameLift Servers \
   Amazon S3 location, you can't update them. \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   If successful, this operation creates a new build resource with a unique build ID and places \
   it in [INITIALIZED] status. A build must be in [READY] status before you can create fleets with \
   it.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html}Uploading \
   Your Game} \n\
  \     \n\
  \       \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build} \
   Create a Build with Files in Amazon S3} \n\
  \      \n\
  \        \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \       "]

module CreateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TaggingFailedException of tagging_failed_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_alias_input ->
    ( create_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_alias_input ->
    ( create_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TaggingFailedException of tagging_failed_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Creates an alias for a fleet. In most situations, you can use an alias ID in place of a fleet \
   ID. An alias provides a level of abstraction for a fleet that is useful when redirecting player \
   traffic from one fleet to another, such as when updating your game build. \n\
  \ \n\
  \  Amazon GameLift Servers supports two types of routing strategies for aliases: simple and \
   terminal. A simple alias points to an active fleet. A terminal alias is used to display \
   messaging or link to a URL instead of routing players to an active fleet. For example, you \
   might use a terminal alias when a game version is no longer supported and you want to direct \
   players to an upgrade site. \n\
  \  \n\
  \   To create a fleet alias, specify an alias name, routing strategy, and optional description. \
   Each simple alias can point to only one fleet, but a fleet can have multiple aliases. If \
   successful, a new alias record is returned, including an alias ID and an ARN. You can reassign \
   an alias to another fleet by calling [UpdateAlias].\n\
  \   \n\
  \     {b Related actions} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

module ClaimGameServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `OutOfCapacityException of out_of_capacity_exception
    | `UnauthorizedException of unauthorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    claim_game_server_input ->
    ( claim_game_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `OutOfCapacityException of out_of_capacity_exception
      | `UnauthorizedException of unauthorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    claim_game_server_input ->
    ( claim_game_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `OutOfCapacityException of out_of_capacity_exception
      | `UnauthorizedException of unauthorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2 (FleetIQ)\n\n\
  \ Locates an available game server and temporarily reserves it to host gameplay and players. \
   This operation is called from a game client or client service (such as a matchmaker) to request \
   hosting resources for a new game session. In response, Amazon GameLift Servers FleetIQ locates \
   an available game server, places it in [CLAIMED] status for 60 seconds, and returns connection \
   information that players can use to connect to the game server. \n\
  \ \n\
  \  To claim a game server, identify a game server group. You can also specify a game server ID, \
   although this approach bypasses Amazon GameLift Servers FleetIQ placement optimization. \
   Optionally, include game data to pass to the game server at the start of a game session, such \
   as a game map or player information. Add filter options to further restrict how a game server \
   is chosen, such as only allowing game servers on [ACTIVE] instances to be claimed.\n\
  \  \n\
  \   When a game server is successfully claimed, connection information is returned. A claimed \
   game server's utilization status remains [AVAILABLE] while the claim status is set to [CLAIMED] \
   for up to 60 seconds. This time period gives the game server time to update its status to \
   [UTILIZED] after players join. If the game server's status is not updated within 60 seconds, \
   the game server reverts to unclaimed status and is available to be claimed by another request. \
   The claim time period is a fixed value and is not configurable.\n\
  \   \n\
  \    If you try to claim a specific game server, this request will fail in the following cases:\n\
  \    \n\
  \     {ul\n\
  \           {-  If the game server utilization status is [UTILIZED].\n\
  \               \n\
  \                }\n\
  \           {-  If the game server claim status is [CLAIMED].\n\
  \               \n\
  \                }\n\
  \           {-  If the game server is running on an instance in [DRAINING] status and the \
   provided filter option does not allow placing on [DRAINING] instances.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html}Amazon GameLift \
   Servers FleetIQ Guide} \n\
  \    "]

module AcceptMatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidRequestException of invalid_request_exception
    | `NotFoundException of not_found_exception
    | `UnsupportedRegionException of unsupported_region_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_match_input ->
    ( accept_match_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_match_input ->
    ( accept_match_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidRequestException of invalid_request_exception
      | `NotFoundException of not_found_exception
      | `UnsupportedRegionException of unsupported_region_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b This API works with the following fleet types:} EC2, Anywhere, Container\n\n\
  \ Registers a player's acceptance or rejection of a proposed FlexMatch match. A matchmaking \
   configuration may require player acceptance; if so, then matches built with that configuration \
   cannot be completed unless all players accept the proposed match within a specified time limit. \n\
  \ \n\
  \  When FlexMatch builds a match, all the matchmaking tickets involved in the proposed match are \
   placed into status [REQUIRES_ACCEPTANCE]. This is a trigger for your game to get acceptance \
   from all players in each ticket. Calls to this action are only valid for tickets that are in \
   this status; calls for tickets not in this status result in an error.\n\
  \  \n\
  \   To register acceptance, specify the ticket ID, one or more players, and an acceptance \
   response. When all players have accepted, Amazon GameLift Servers advances the matchmaking \
   tickets to status [PLACING], and attempts to create a new game session for the match. \n\
  \   \n\
  \    If any player rejects the match, or if acceptances are not received before a specified \
   timeout, the proposed match is dropped. Each matchmaking ticket in the failed match is handled \
   as follows: \n\
  \    \n\
  \     {ul\n\
  \           {-  If the ticket has one or more players who rejected the match or failed to \
   respond, the ticket status is set [CANCELLED] and processing is terminated.\n\
  \               \n\
  \                }\n\
  \           {-  If all players in the ticket accepted the match, the ticket status is returned \
   to [SEARCHING] to find a new match. \n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b Learn more} \n\
  \   \n\
  \     {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html} Add \
   FlexMatch to a game client} \n\
  \    \n\
  \      {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html} \
   FlexMatch events} (reference)\n\
  \     "]
