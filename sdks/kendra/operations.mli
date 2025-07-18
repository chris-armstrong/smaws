open Types
module AssociateEntitiesToExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_entities_to_experience_request ->
        (associate_entities_to_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Grants users or groups in your IAM Identity Center identity source access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module AssociatePersonasToEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_personas_to_entities_request ->
        (associate_personas_to_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Defines the specific permissions of users or groups in your IAM Identity Center identity source with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module BatchDeleteDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_document_request ->
        (batch_delete_document_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes one or more documents from an index. The documents must have been added with the [BatchPutDocument] API.\n\n The documents are deleted asynchronously. You can see the progress of the deletion by using Amazon Web Services CloudWatch. Any error messages related to the processing of the batch are sent to your Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] API to monitor the progress of deleting your documents.\n \n  Deleting documents from an index using [BatchDeleteDocument] could take up to an hour or more, depending on the number of documents you want to delete.\n  "]
module BatchDeleteFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_featured_results_set_request ->
        (batch_delete_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes one or more sets of featured results. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module BatchGetDocumentStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_document_status_request ->
        (batch_get_document_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the indexing status for one or more documents submitted with the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html} BatchPutDocument} API.\n\n When you use the [BatchPutDocument] API, documents are indexed asynchronously. You can use the [BatchGetDocumentStatus] API to get the current status of a list of documents so that you can determine if they have been successfully indexed.\n \n  You can also use the [BatchGetDocumentStatus] API to check the status of the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html} BatchDeleteDocument} API. When a document is deleted from the index, Amazon Kendra returns [NOT_FOUND] as the status.\n  "]
module BatchPutDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_put_document_request ->
        (batch_put_document_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds one or more documents to an index.\n\n The [BatchPutDocument] API enables you to ingest inline documents or a set of documents stored in an Amazon S3 bucket. Use this API to ingest your text and unstructured text into an index, add custom attributes to the documents, and to attach an access control list to the documents added to the index.\n \n  The documents are indexed asynchronously. You can see the progress of the batch using Amazon Web Services CloudWatch. Any error messages related to processing the batch are sent to your Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] API to monitor the progress of indexing your documents.\n  \n   For an example of ingesting inline documents using Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-binary-doc.html}Adding files directly to an index}.\n   "]
module ClearQuerySuggestions :
sig
  val request :
    Smaws_Lib.Context.t ->
      clear_query_suggestions_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Clears existing query suggestions from an index.\n\n This deletes existing suggestions only, not the queries in the query log. After you clear suggestions, Amazon Kendra learns new suggestions based on new queries added to the query log from the time you cleared suggestions. If you do not see any new suggestions, then please allow Amazon Kendra to collect enough queries to learn new suggestions.\n \n   [ClearQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module CreateAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_control_configuration_request ->
        (create_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an access configuration for your documents. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n You can use this to re-configure your existing document level access control without indexing all of your documents again. For example, your index contains top-secret company documents that only certain employees or users should access. One of these users leaves the company or switches to a team that should be blocked from accessing top-secret documents. The user still has access to top-secret documents because the user had access when your documents were previously indexed. You can create a specific access control configuration for the user with deny access. You can later update the access control configuration to allow access if the user returns to the company and re-joins the 'top-secret' team. You can re-configure access control for your documents as circumstances change.\n \n  To apply your access control configuration to certain documents, you call the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API with the [AccessControlConfigurationId] included in the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} object. If you use an S3 bucket as a data source, you update the [.metadata.json] with the [AccessControlConfigurationId] and synchronize your data source. Amazon Kendra currently only supports access control configuration for S3 data sources and documents indexed using the [BatchPutDocument] API.\n  "]
module CreateDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_data_source_request ->
        (create_data_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a data source connector that you want to use with an Amazon Kendra index.\n\n You specify a name, data source connector type and description for your data source. You also specify configuration information for the data source connector.\n \n   [CreateDataSource] is a synchronous operation. The operation returns 200 if the data source was successfully created. Otherwise, an exception is raised.\n  \n   For an example of creating an index and data source using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python SDK}. For an example of creating an index and data source using the Java SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n   "]
module CreateExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_experience_request ->
        (create_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Kendra experience such as a search application. For more information on creating a search application experience, including using the Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module CreateFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_faq_request ->
        (create_faq_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a set of frequently ask questions (FAQs) using a specified FAQ file stored in an Amazon S3 bucket.\n\n Adding FAQs to an index is an asynchronous operation.\n \n  For an example of adding an FAQ to an index using Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html#using-faq-file}Using your FAQ file}.\n  "]
module CreateFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_featured_results_set_request ->
        (create_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `FeaturedResultsConflictException of
              featured_results_conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a set of featured results to display at the top of the search results page. Featured results are placed above all other results for certain queries. You map specific queries to specific documents for featuring in the results. If a query contains an exact match, then one or more specific documents are featured in the search results.\n\n You can create up to 50 sets of featured results per index. You can request to increase this limit by contacting {{:http://aws.amazon.com/contact-us/}Support}.\n "]
module CreateIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_index_request ->
        (create_index_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Kendra index. Index creation is an asynchronous API. To determine if index creation has completed, check the [Status] field returned from a call to [DescribeIndex]. The [Status] field is set to [ACTIVE] when the index is ready to use.\n\n Once the index is active, you can index your documents using the [BatchPutDocument] API or using one of the supported {{:https://docs.aws.amazon.com/kendra/latest/dg/data-sources.html}data sources}.\n \n  For an example of creating an index and data source using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python SDK}. For an example of creating an index and data source using the Java SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n  "]
module CreateQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_query_suggestions_block_list_request ->
        (create_query_suggestions_block_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a block list to exlcude certain queries from suggestions.\n\n Any query that contains words or phrases specified in the block list is blocked or filtered out from being shown as a suggestion.\n \n  You need to provide the file location of your block list text file in your S3 bucket. In your text file, enter each block word or phrase on a separate line.\n  \n   For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n   \n     [CreateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n    \n     For an example of creating a block list for query suggestions using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist}Query suggestions block list}.\n     "]
module CreateThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_thesaurus_request ->
        (create_thesaurus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a thesaurus for an index. The thesaurus contains a list of synonyms in Solr format.\n\n For an example of adding a thesaurus file to an index, see {{:https://docs.aws.amazon.com/kendra/latest/dg/index-synonyms-adding-thesaurus-file.html}Adding custom synonyms to an index}.\n "]
module DeleteAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_configuration_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an access control configuration that you created for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module DeleteDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_data_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an Amazon Kendra data source connector. An exception is not thrown if the data source is already being deleted. While the data source is being deleted, the [Status] field returned by a call to the [DescribeDataSource] API is set to [DELETING]. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html}Deleting Data Sources}.\n\n Deleting an entire data source or re-syncing your index after deleting specific documents from a data source could take up to an hour or more, depending on the number of documents you want to delete.\n "]
module DeleteExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_experience_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DeleteFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_faq_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Removes an FAQ from an index.\n"]
module DeleteIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_index_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an Amazon Kendra index. An exception is not thrown if the index is already being deleted. While the index is being deleted, the [Status] field returned by a call to the [DescribeIndex] API is set to [DELETING].\n"]
module DeletePrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_principal_mapping_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a group so that all users and sub groups that belong to the group can no longer access documents only available to that group.\n\n For example, after deleting the group \"Summer Interns\", all interns who belonged to that group no longer see intern-only documents in their search results.\n \n  If you want to delete or replace users or sub groups of a group, you need to use the [PutPrincipalMapping] operation. For example, if a user in the group \"Engineering\" leaves the engineering team and another user takes their place, you provide an updated list of users or sub groups that belong to the \"Engineering\" group when calling [PutPrincipalMapping]. You can update your internal list of users or sub groups and input this list when calling [PutPrincipalMapping].\n  \n    [DeletePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n   "]
module DeleteQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_query_suggestions_block_list_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a block list used for query suggestions for an index.\n\n A deleted block list might not take effect right away. Amazon Kendra needs to refresh the entire suggestions list to add back the queries that were previously blocked.\n \n   [DeleteQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DeleteThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_thesaurus_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Deletes an Amazon Kendra thesaurus. \n"]
module DescribeAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_access_control_configuration_request ->
        (describe_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about an access control configuration that you created for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module DescribeDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_data_source_request ->
        (describe_data_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about an Amazon Kendra data source connector.\n"]
module DescribeExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_experience_request ->
        (describe_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DescribeFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_faq_request ->
        (describe_faq_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about an FAQ list.\n"]
module DescribeFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_featured_results_set_request ->
        (describe_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about a set of featured results. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module DescribeIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_index_request ->
        (describe_index_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about an Amazon Kendra index.\n"]
module DescribePrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_principal_mapping_request ->
        (describe_principal_mapping_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Describes the processing of [PUT] and [DELETE] actions for mapping users to their groups. This includes information on the status of actions currently processing or yet to be processed, when actions were last updated, when actions were received by Amazon Kendra, the latest action that should process and apply after other actions, and useful error messages if an action could not be processed.\n\n  [DescribePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module DescribeQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_block_list_request ->
        (describe_query_suggestions_block_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about a block list used for query suggestions for an index.\n\n This is used to check the current settings that are applied to a block list.\n \n   [DescribeQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DescribeQuerySuggestionsConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_config_request ->
        (describe_query_suggestions_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information on the settings of query suggestions for an index.\n\n This is used to check the current settings applied to query suggestions.\n \n   [DescribeQuerySuggestionsConfig] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DescribeThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_thesaurus_request ->
        (describe_thesaurus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about an Amazon Kendra thesaurus.\n"]
module DisassociateEntitiesFromExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_entities_from_experience_request ->
        (disassociate_entities_from_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Prevents users or groups in your IAM Identity Center identity source from accessing your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DisassociatePersonasFromEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_personas_from_entities_request ->
        (disassociate_personas_from_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes the specific permissions of users or groups in your IAM Identity Center identity source with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module GetQuerySuggestions :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_suggestions_request ->
        (get_query_suggestions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Fetches the queries that are suggested to your users.\n\n  [GetQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module GetSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshots_request ->
        (get_snapshots_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves search metrics data. The data provides a snapshot of how your users interact with your search application and how effective the application is.\n"]
module ListAccessControlConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_configurations_request ->
        (list_access_control_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists one or more access control configurations for an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module ListDataSourceSyncJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_source_sync_jobs_request ->
        (list_data_source_sync_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets statistics about synchronizing a data source connector.\n"]
module ListDataSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_sources_request ->
        (list_data_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the data source connectors that you have created.\n"]
module ListEntityPersonas :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_entity_personas_request ->
        (list_entity_personas_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists specific permissions of users and groups with access to your Amazon Kendra experience.\n"]
module ListExperienceEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_experience_entities_request ->
        (list_experience_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists users or groups in your IAM Identity Center identity source that are granted access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module ListExperiences :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_experiences_request ->
        (list_experiences_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists one or more Amazon Kendra experiences. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module ListFaqs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_faqs_request ->
        (list_faqs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets a list of FAQ lists associated with an index.\n"]
module ListFeaturedResultsSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_featured_results_sets_request ->
        (list_featured_results_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists all your sets of featured results for a given index. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module ListGroupsOlderThanOrderingId :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_older_than_ordering_id_request ->
        (list_groups_older_than_ordering_id_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Provides a list of groups that are mapped to users before a given ordering or timestamp identifier.\n\n  [ListGroupsOlderThanOrderingId] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module ListIndices :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_indices_request ->
        (list_indices_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the Amazon Kendra indexes that you created.\n"]
module ListQuerySuggestionsBlockLists :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_query_suggestions_block_lists_request ->
        (list_query_suggestions_block_lists_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists the block lists used for query suggestions for an index.\n\n For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n \n   [ListQuerySuggestionsBlockLists] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets a list of tags associated with a specified resource. Indexes, FAQs, and data sources can have tags associated with them.\n"]
module ListThesauri :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_thesauri_request ->
        (list_thesauri_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the thesauri for an index.\n"]
module PutPrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_principal_mapping_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Maps users to their groups so that you only need to provide the user ID when you issue the query.\n\n You can also map sub groups to groups. For example, the group \"Company Intellectual Property Teams\" includes sub groups \"Research\" and \"Engineering\". These sub groups include their own list of users or people who work in these teams. Only users who work in research and engineering, and therefore belong in the intellectual property group, can see top-secret company documents in their search results.\n \n  This is useful for user context filtering, where search results are filtered based on the user or their group access to documents. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}Filtering on user context}.\n  \n   If more than five [PUT] actions for a group are currently processing, a validation exception is thrown.\n   "]
module Query :
sig
  val request :
    Smaws_Lib.Context.t ->
      query_request ->
        (query_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Searches an index given an input query.\n\n  If you are working with large language models (LLMs) or implementing retrieval augmented generation (RAG) systems, you can use Amazon Kendra's {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Retrieve.html}Retrieve} API, which can return longer semantically relevant passages. We recommend using the [Retrieve] API instead of filing a service limit increase to increase the [Query] API document excerpt length.\n  \n    You can configure boosting or relevance tuning at the query level to override boosting at the index level, filter based on document fields/attributes and faceted search, and filter based on the user or their group access to documents. You can also include certain fields in the response that might provide useful additional information.\n    \n     A query response contains three types of results.\n     \n      {ul\n            {-  Relevant suggested answers. The answers can be either a text excerpt or table excerpt. The answer can be highlighted in the excerpt.\n                \n                 }\n            {-  Matching FAQs or questions-answer from your FAQ file.\n                \n                 }\n            {-  Relevant documents. This result type includes an excerpt of the document with the document title. The searched terms can be highlighted in the excerpt.\n                \n                 }\n            }\n   You can specify that the query return only one type of result using the [QueryResultTypeFilter] parameter. Each query returns the 100 most relevant results. If you filter result type to only question-answers, a maximum of four results are returned. If you filter result type to only answers, a maximum of three results are returned.\n   "]
module Retrieve :
sig
  val request :
    Smaws_Lib.Context.t ->
      retrieve_request ->
        (retrieve_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Retrieves relevant passages or text excerpts given an input query.\n\n This API is similar to the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Query.html}Query} API. However, by default, the [Query] API only returns excerpt passages of up to 100 token words. With the [Retrieve] API, you can retrieve longer passages of up to 200 token words and up to 100 semantically relevant passages. This doesn't include question-answer or FAQ type responses from your index. The passages are text excerpts that can be semantically extracted from multiple documents and multiple parts of the same document. If in extreme cases your documents produce zero passages using the [Retrieve] API, you can alternatively use the [Query] API and its types of responses.\n \n  You can also do the following:\n  \n   {ul\n         {-  Override boosting at the index level\n             \n              }\n         {-  Filter based on document fields or attributes\n             \n              }\n         {-  Filter based on the user or their group access to documents\n             \n              }\n         {-  View the confidence score bucket for a retrieved passage result. The confidence bucket provides a relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the query.\n             \n               Confidence score buckets are currently available only for English.\n               \n                 }\n         }\n   You can also include certain fields in the response that might provide useful additional information.\n   \n    The [Retrieve] API shares the number of {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_CapacityUnitsConfiguration.html}query capacity units} that you set for your index. For more information on what's included in a single capacity unit and the default base capacity for an index, see {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting capacity}.\n    "]
module StartDataSourceSyncJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_data_source_sync_job_request ->
        (start_data_source_sync_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Starts a synchronization job for a data source connector. If a synchronization job is already in progress, Amazon Kendra returns a [ResourceInUseException] exception.\n\n Re-syncing your data source with your index after modifying, adding, or deleting documents from your data source respository could take up to an hour or more, depending on the number of documents to sync.\n "]
module StopDataSourceSyncJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_data_source_sync_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Stops a synchronization job that is currently running. You can't stop a scheduled synchronization job.\n"]
module SubmitFeedback :
sig
  val request :
    Smaws_Lib.Context.t ->
      submit_feedback_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Enables you to provide feedback to Amazon Kendra to improve the performance of your index.\n\n  [SubmitFeedback] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds the specified tag to the specified index, FAQ, or data source resource. If the tag already exists, the existing value is replaced with the new value.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Removes a tag from an index, FAQ, or a data source.\n"]
module UpdateAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_control_configuration_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an access control configuration for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n You can update an access control configuration you created without indexing all of your documents again. For example, your index contains top-secret company documents that only certain employees or users should access. You created an 'allow' access control configuration for one user who recently joined the 'top-secret' team, switching from a team with 'deny' access to top-secret documents. However, the user suddenly returns to their previous team and should no longer have access to top secret documents. You can update the access control configuration to re-configure access control for your documents as circumstances change.\n \n  You call the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API to apply the updated access control configuration, with the [AccessControlConfigurationId] included in the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} object. If you use an S3 bucket as a data source, you synchronize your data source to apply the [AccessControlConfigurationId] in the [.metadata.json] file. Amazon Kendra currently only supports access control configuration for S3 data sources and documents indexed using the [BatchPutDocument] API.\n  "]
module UpdateDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_data_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an Amazon Kendra data source connector.\n"]
module UpdateExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_experience_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module UpdateFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_featured_results_set_request ->
        (update_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `FeaturedResultsConflictException of
              featured_results_conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a set of featured results. Features results are placed above all other results for certain queries. You map specific queries to specific documents for featuring in the results. If a query contains an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module UpdateIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_index_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an Amazon Kendra index.\n"]
module UpdateQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_block_list_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a block list used for query suggestions for an index.\n\n Updates to a block list might not take effect right away. Amazon Kendra needs to refresh the entire suggestions list to apply any updates to the block list. Other changes not related to the block list apply immediately.\n \n  If a block list is updating, then you need to wait for the first update to finish before submitting another update.\n  \n   Amazon Kendra supports partial updates, so you only need to provide the fields you want to update.\n   \n     [UpdateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n    "]
module UpdateQuerySuggestionsConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_config_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates the settings of query suggestions for an index.\n\n Amazon Kendra supports partial updates, so you only need to provide the fields you want to update.\n \n  If an update is currently processing, you need to wait for the update to finish before making another update.\n  \n   Updates to query suggestions settings might not take effect right away. The time for your updated settings to take effect depends on the updates made and the number of search queries in your index.\n   \n    You can still enable/disable query suggestions at any time.\n    \n      [UpdateQuerySuggestionsConfig] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n     "]
module UpdateThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_thesaurus_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates a thesaurus for an index.\n"]