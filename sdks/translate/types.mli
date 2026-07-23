type nonrec string_ = string [@@ocaml.doc ""]

type nonrec too_many_requests_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " You have made too many requests within a short period of time. Wait for a short time and then \
   try your request again.\n"]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource you are looking for has not been found. Review the resource you're looking for and \
   see if a different resource will accomplish your needs before retrying the revised request.\n"]

type nonrec limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified limit has been exceeded. Review your request and retry it with a quantity below \
   the stated limit.\n"]

type nonrec invalid_request_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The request that you made is not valid. Check your request to determine why it's not valid and \
   then retry the request. \n"]

type nonrec invalid_parameter_value_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The value of the parameter is not valid. Review the value of the parameter you are using to \
   correct it, and then retry your operation.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "An internal server error occurred. Retry your request.\n"]

type nonrec conflict_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "There was a conflict processing the request. Try your request again.\n"]

type nonrec concurrent_modification_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Another modification is being made. That modification must complete before you can make your \
   change.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec parallel_data_status =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec update_parallel_data_response = {
  name : resource_name option;
      [@ocaml.doc "The name of the parallel data resource being updated.\n"]
  status : parallel_data_status option;
      [@ocaml.doc
        "The status of the parallel data resource that you are attempting to update. Your update \
         request is accepted only if this status is either [ACTIVE] or [FAILED].\n"]
  latest_update_attempt_status : parallel_data_status option;
      [@ocaml.doc
        "The status of the parallel data update attempt. When the updated parallel data resource \
         is ready for you to use, the status is [ACTIVE].\n"]
  latest_update_attempt_at : timestamp option;
      [@ocaml.doc "The time that the most recent update was attempted.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token_string = string [@@ocaml.doc ""]

type nonrec parallel_data_format = TSV [@ocaml.doc ""] | CSV [@ocaml.doc ""] | TMX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec parallel_data_config = {
  s3_uri : s3_uri option;
      [@ocaml.doc
        "The URI of the Amazon S3 folder that contains the parallel data input file. The folder \
         must be in the same Region as the API endpoint you are calling.\n"]
  format : parallel_data_format option; [@ocaml.doc "The format of the parallel data input file.\n"]
}
[@@ocaml.doc "Specifies the format and S3 location of the parallel data input file.\n"]

type nonrec description = string [@@ocaml.doc ""]

type nonrec update_parallel_data_request = {
  name : resource_name; [@ocaml.doc "The name of the parallel data resource being updated.\n"]
  description : description option;
      [@ocaml.doc "A custom description for the parallel data resource in Amazon Translate.\n"]
  parallel_data_config : parallel_data_config;
      [@ocaml.doc "Specifies the format and S3 location of the parallel data input file.\n"]
  client_token : client_token_string;
      [@ocaml.doc
        "A unique identifier for the request. This token is automatically generated when you use \
         Amazon Translate through an AWS SDK.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the given Amazon Translate resource from which you \
         want to remove the tags. \n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The initial part of a key-value pair that forms a tag being removed from a given \
         resource. Keys must be unique and cannot be duplicated for a particular resource. \n"]
}
[@@ocaml.doc ""]

type nonrec language_code_string = string [@@ocaml.doc ""]

type nonrec unsupported_language_pair_exception = {
  message : string_ option; [@ocaml.doc ""]
  source_language_code : language_code_string option;
      [@ocaml.doc "The language code for the language of the input text. \n"]
  target_language_code : language_code_string option;
      [@ocaml.doc "The language code for the language of the translated text. \n"]
}
[@@ocaml.doc
  "Amazon Translate does not support translation from the language of the source text into the \
   requested target language. For more information, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported languages}. \n"]

type nonrec text_size_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The size of the text you submitted exceeds the size limit. Reduce the size of the text or use \
   a smaller document and then retry your request. \n"]

type nonrec service_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The Amazon Translate service is temporarily unavailable. Wait a bit and then retry your request.\n"]

type nonrec detected_language_low_confidence_exception = {
  message : string_ option; [@ocaml.doc ""]
  detected_language_code : language_code_string option;
      [@ocaml.doc "The language code of the auto-detected language from Amazon Comprehend.\n"]
}
[@@ocaml.doc
  "The confidence that Amazon Comprehend accurately detected the source language is low. If a low \
   confidence level is acceptable for your application, you can use the language in the exception \
   to call Amazon Translate again. For more information, see the \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/API_DetectDominantLanguage.html}DetectDominantLanguage} \
   operation in the {i Amazon Comprehend Developer Guide}. \n"]

type nonrec brevity = ON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec profanity = MASK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec formality = FORMAL [@ocaml.doc ""] | INFORMAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec translation_settings = {
  formality : formality option;
      [@ocaml.doc
        "You can specify the desired level of formality for translations to supported target \
         languages. The formality setting controls the level of formal language usage (also known \
         as {{:https://en.wikipedia.org/wiki/Register_(sociolinguistics)}register}) in the \
         translation output. You can set the value to informal or formal. If you don't specify a \
         value for formality, or if the target language doesn't support formality, the translation \
         will ignore the formality setting.\n\n\
        \  If you specify multiple target languages for the job, translate ignores the formality \
         setting for any unsupported target language.\n\
        \ \n\
        \  For a list of target languages that support formality, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/customizing-translations-formality.html#customizing-translations-formality-languages}Supported \
         languages} in the Amazon Translate Developer Guide.\n\
        \  "]
  profanity : profanity option;
      [@ocaml.doc
        "You can enable the profanity setting if you want to mask profane words and phrases in \
         your translation output.\n\n\
        \ To mask profane words and phrases, Amazon Translate replaces them with the grawlix \
         string \226\128\156?$#\\@$\226\128\156. This 5-character sequence is used for each \
         profane word or phrase, regardless of the length or number of words.\n\
        \ \n\
        \  Amazon Translate doesn't detect profanity in all of its supported languages. For \
         languages that don't support profanity detection, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/customizing-translations-profanity.html#customizing-translations-profanity-languages}Unsupported \
         languages} in the Amazon Translate Developer Guide.\n\
        \  \n\
        \   If you specify multiple target languages for the job, all the target languages must \
         support profanity masking. If any of the target languages don't support profanity \
         masking, the translation job won't mask profanity for any target language.\n\
        \   "]
  brevity : brevity option;
      [@ocaml.doc
        "When you turn on brevity, Amazon Translate reduces the length of the translation output \
         for most translations (when compared with the same translation with brevity turned off). \
         By default, brevity is turned off.\n\n\
        \ If you turn on brevity for a translation request with an unsupported language pair, the \
         translation proceeds with the brevity setting turned off.\n\
        \ \n\
        \  For the language pairs that brevity supports, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/customizing-translations-brevity}Using \
         brevity} in the Amazon Translate Developer Guide.\n\
        \  "]
}
[@@ocaml.doc
  "Settings to configure your translation output. You can configure the following options:\n\n\
  \ {ul\n\
  \       {-  Brevity: reduces the length of the translation output for most translations. \
   Available for [TranslateText] only.\n\
  \           \n\
  \            }\n\
  \       {-  Formality: sets the formality level of the translation output.\n\
  \           \n\
  \            }\n\
  \       {-  Profanity: masks profane words and phrases in the translation output.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec term = {
  source_text : string_ option;
      [@ocaml.doc "The source text of the term being translated by the custom terminology.\n"]
  target_text : string_ option;
      [@ocaml.doc "The target text of the term being translated by the custom terminology.\n"]
}
[@@ocaml.doc "The term being translated by the custom terminology.\n"]

type nonrec term_list = term list [@@ocaml.doc ""]

type nonrec applied_terminology = {
  name : resource_name option;
      [@ocaml.doc
        "The name of the custom terminology applied to the input text by Amazon Translate for the \
         translated text response.\n"]
  terms : term_list option;
      [@ocaml.doc
        "The specific terms of the custom terminology applied to the input text by Amazon \
         Translate for the translated text response. A maximum of 250 terms will be returned, and \
         the specific terms applied will be the first 250 terms in the source text. \n"]
}
[@@ocaml.doc
  "The custom terminology applied to the input text by Amazon Translate for the translated text \
   response. This is optional in the response and will only be present if you specified \
   terminology input in the request. Currently, only one terminology can be applied per \
   TranslateText request.\n"]

type nonrec applied_terminology_list = applied_terminology list [@@ocaml.doc ""]

type nonrec translated_text_string = string [@@ocaml.doc ""]

type nonrec translate_text_response = {
  translated_text : translated_text_string; [@ocaml.doc "The translated text.\n"]
  source_language_code : language_code_string;
      [@ocaml.doc "The language code for the language of the source text.\n"]
  target_language_code : language_code_string;
      [@ocaml.doc "The language code for the language of the target text. \n"]
  applied_terminologies : applied_terminology_list option;
      [@ocaml.doc
        "The names of the custom terminologies applied to the input text by Amazon Translate for \
         the translated text response.\n"]
  applied_settings : translation_settings option;
      [@ocaml.doc "Optional settings that modify the translation output.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_name_list = resource_name list [@@ocaml.doc ""]

type nonrec bounded_length_string = string [@@ocaml.doc ""]

type nonrec translate_text_request = {
  text : bounded_length_string;
      [@ocaml.doc
        "The text to translate. The text string can be a maximum of 10,000 bytes long. Depending \
         on your character set, this may be fewer than 10,000 characters.\n"]
  terminology_names : resource_name_list option;
      [@ocaml.doc
        "The name of a terminology list file to add to the translation job. This file provides \
         source terms and the desired translation for each term. A terminology list can contain a \
         maximum of 256 terms. You can use one custom terminology resource in your translation \
         request.\n\n\
        \ Use the [ListTerminologies] operation to get the available terminology lists.\n\
        \ \n\
        \  For more information about custom terminology lists, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/how-custom-terminology.html}Custom \
         terminology}.\n\
        \  "]
  source_language_code : language_code_string;
      [@ocaml.doc
        "The language code for the language of the source text. For a list of language codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n\n\
        \ To have Amazon Translate determine the source language of your text, you can specify \
         [auto] in the [SourceLanguageCode] field. If you specify [auto], Amazon Translate will \
         call {{:https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html}Amazon \
         Comprehend} to determine the source language.\n\
        \ \n\
        \   If you specify [auto], you must send the [TranslateText] request in a region that \
         supports Amazon Comprehend. Otherwise, the request returns an error indicating that \
         autodetect is not supported. \n\
        \   \n\
        \    "]
  target_language_code : language_code_string;
      [@ocaml.doc
        "The language code requested for the language of the target text. For a list of language \
         codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n"]
  settings : translation_settings option;
      [@ocaml.doc
        "Settings to configure your translation output. You can configure the following options:\n\n\
        \ {ul\n\
        \       {-  Brevity: reduces the length of the translated output for most translations.\n\
        \           \n\
        \            }\n\
        \       {-  Formality: sets the formality level of the output text.\n\
        \           \n\
        \            }\n\
        \       {-  Profanity: masks profane words and phrases in your translation output.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec translated_document_content = bytes [@@ocaml.doc ""]

type nonrec translated_document = {
  content : translated_document_content;
      [@ocaml.doc "The document containing the translated content.\n"]
}
[@@ocaml.doc "The translated content.\n"]

type nonrec translate_document_response = {
  translated_document : translated_document;
      [@ocaml.doc
        "The document containing the translated content. The document format matches the source \
         document format.\n"]
  source_language_code : language_code_string;
      [@ocaml.doc "The language code of the source document.\n"]
  target_language_code : language_code_string;
      [@ocaml.doc "The language code of the translated document. \n"]
  applied_terminologies : applied_terminology_list option;
      [@ocaml.doc
        "The names of the custom terminologies applied to the input text by Amazon Translate to \
         produce the translated text document.\n"]
  applied_settings : translation_settings option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec content_type = string [@@ocaml.doc ""]

type nonrec document_content = bytes [@@ocaml.doc ""]

type nonrec document = {
  content : document_content;
      [@ocaml.doc
        "The [Content]field type is Binary large object (blob). This object contains the document \
         content converted into base64-encoded binary data. If you use one of the AWS SDKs, the \
         SDK performs the Base64-encoding on this field before sending the request. \n"]
  content_type : content_type;
      [@ocaml.doc
        "Describes the format of the document. You can specify one of the following:\n\n\
        \ {ul\n\
        \       {-   [text/html] - The input data consists of HTML content. Amazon Translate \
         translates only the text in the HTML element.\n\
        \           \n\
        \            }\n\
        \       {-   [text/plain] - The input data consists of unformatted text. Amazon Translate \
         translates every character in the content. \n\
        \           \n\
        \            }\n\
        \       {-   [application/vnd.openxmlformats-officedocument.wordprocessingml.document] - \
         The input data consists of a Word document (.docx).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The content and content type of a document.\n"]

type nonrec translate_document_request = {
  document : document;
      [@ocaml.doc
        "The content and content type for the document to be translated. The document size must \
         not exceed 100 KB.\n"]
  terminology_names : resource_name_list option;
      [@ocaml.doc
        "The name of a terminology list file to add to the translation job. This file provides \
         source terms and the desired translation for each term. A terminology list can contain a \
         maximum of 256 terms. You can use one custom terminology resource in your translation \
         request.\n\n\
        \ Use the [ListTerminologies] operation to get the available terminology lists.\n\
        \ \n\
        \  For more information about custom terminology lists, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/how-custom-terminology.html}Custom \
         terminology}.\n\
        \  "]
  source_language_code : language_code_string;
      [@ocaml.doc
        "The language code for the language of the source text. For a list of supported language \
         codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n\n\
        \ To have Amazon Translate determine the source language of your text, you can specify \
         [auto] in the [SourceLanguageCode] field. If you specify [auto], Amazon Translate will \
         call {{:https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html}Amazon \
         Comprehend} to determine the source language.\n\
        \ \n\
        \   If you specify [auto], you must send the [TranslateDocument] request in a region that \
         supports Amazon Comprehend. Otherwise, the request returns an error indicating that \
         autodetect is not supported. \n\
        \   \n\
        \    "]
  target_language_code : language_code_string;
      [@ocaml.doc
        "The language code requested for the translated document. For a list of supported language \
         codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n"]
  settings : translation_settings option;
      [@ocaml.doc
        "Settings to configure your translation output. You can configure the following options:\n\n\
        \ {ul\n\
        \       {-  Brevity: not supported.\n\
        \           \n\
        \            }\n\
        \       {-  Formality: sets the formality level of the output text.\n\
        \           \n\
        \            }\n\
        \       {-  Profanity: masks profane words and phrases in your translation output.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  message : string_ option; [@ocaml.doc ""]
  resource_arn : resource_arn option; [@ocaml.doc ""]
}
[@@ocaml.doc "You have added too many tags to this resource. The maximum is 50 tags.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "The initial part of a key-value pair that forms a tag associated with a given resource. \n"]
  value : tag_value;
      [@ocaml.doc
        " The second part of a key-value pair that forms a tag associated with a given resource.\n"]
}
[@@ocaml.doc "A key-value pair that adds as a metadata to a resource used by Amazon Translate. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the given Amazon Translate resource to which you want \
         to associate the tags. \n"]
  tags : tag_list;
      [@ocaml.doc
        "Tags being associated with a specific Amazon Translate resource. There can be a maximum \
         of 50 tags (both existing and pending) associated with a specific resource.\n"]
}
[@@ocaml.doc ""]

type nonrec job_status =
  | SUBMITTED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | COMPLETED_WITH_ERROR [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec stop_text_translation_job_response = {
  job_id : job_id option; [@ocaml.doc "The job ID of the stopped batch translation job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The status of the designated job. Upon successful completion, the job's status will be \
         [STOPPED].\n"]
}
[@@ocaml.doc ""]

type nonrec stop_text_translation_job_request = {
  job_id : job_id; [@ocaml.doc "The job ID of the job to be stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec start_text_translation_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this ID with the \
         [DescribeTextTranslationJob] operation.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. Possible values include:\n\n\
        \ {ul\n\
        \       {-   [SUBMITTED] - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS] - Amazon Translate is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED_WITH_ERROR] - The job was completed with errors. The errors can be \
         analyzed in the job's output.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The job did not complete. To get details, use the \
         [DescribeTextTranslationJob] operation.\n\
        \           \n\
        \            }\n\
        \       {-   [STOP_REQUESTED] - The user who started the job has requested that it be \
         stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] - The job has been stopped.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec target_language_code_string_list = language_code_string list [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec encryption_key_i_d = string [@@ocaml.doc ""]

type nonrec encryption_key_type = KMS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_key = {
  type_ : encryption_key_type;
      [@ocaml.doc "The type of encryption key used by Amazon Translate to encrypt this object.\n"]
  id : encryption_key_i_d;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the encryption key being used to encrypt this object.\n"]
}
[@@ocaml.doc "The encryption key used to encrypt this object.\n"]

type nonrec output_data_config = {
  s3_uri : s3_uri;
      [@ocaml.doc
        "The URI of the S3 folder that contains a translation job's output file. The folder must \
         be in the same Region as the API endpoint that you are calling.\n"]
  encryption_key : encryption_key option; [@ocaml.doc ""]
}
[@@ocaml.doc "The output configuration properties for a batch translation job.\n"]

type nonrec input_data_config = {
  s3_uri : s3_uri;
      [@ocaml.doc
        "The URI of the AWS S3 folder that contains the input files. Amazon Translate translates \
         all the files in the folder and all its sub-folders. The folder must be in the same \
         Region as the API endpoint you are calling.\n"]
  content_type : content_type;
      [@ocaml.doc
        "Describes the format of the data that you submit to Amazon Translate as input. You can \
         specify one of the following multipurpose internet mail extension (MIME) types:\n\n\
        \ {ul\n\
        \       {-   [text/html]: The input data consists of one or more HTML files. Amazon \
         Translate translates only the text that resides in the [html] element in each file.\n\
        \           \n\
        \            }\n\
        \       {-   [text/plain]: The input data consists of one or more unformatted text files. \
         Amazon Translate translates every character in this type of input.\n\
        \           \n\
        \            }\n\
        \       {-   [application/vnd.openxmlformats-officedocument.wordprocessingml.document]: \
         The input data consists of one or more Word documents (.docx).\n\
        \           \n\
        \            }\n\
        \       {-   [application/vnd.openxmlformats-officedocument.presentationml.presentation]: \
         The input data consists of one or more PowerPoint Presentation files (.pptx).\n\
        \           \n\
        \            }\n\
        \       {-   [application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]: The \
         input data consists of one or more Excel Workbook files (.xlsx).\n\
        \           \n\
        \            }\n\
        \       {-   [application/x-xliff+xml]: The input data consists of one or more XML \
         Localization Interchange File Format (XLIFF) files (.xlf). Amazon Translate supports only \
         XLIFF version 1.2.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you structure your input data as HTML, ensure that you set this parameter to \
         [text/html]. By doing so, you cut costs by limiting the translation to the contents of \
         the [html] element in each file. Otherwise, if you set this parameter to [text/plain], \
         your costs will cover the translation of every character.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "The input configuration properties for requesting a batch translation job.\n"]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec start_text_translation_job_request = {
  job_name : job_name option;
      [@ocaml.doc "The name of the batch translation job to be performed.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc
        "Specifies the format and location of the input documents for the translation job.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies the S3 folder to which your job output will be saved. \n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that \
         grants Amazon Translate read access to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/identity-and-access-management.html}Identity \
         and access management }.\n"]
  source_language_code : language_code_string;
      [@ocaml.doc
        "The language code of the input language. Specify the language if all input documents \
         share the same language. If you don't know the language of the source files, or your \
         input documents contains different source languages, select [auto]. Amazon Translate auto \
         detects the source language for each input document. For a list of supported language \
         codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n"]
  target_language_codes : target_language_code_string_list;
      [@ocaml.doc
        "The target languages of the translation job. Enter up to 10 language codes. Each input \
         file is translated into each target language.\n\n\
        \ Each language code is 2 or 5 characters long. For a list of language codes, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported \
         languages}.\n\
        \ "]
  terminology_names : resource_name_list option;
      [@ocaml.doc
        "The name of a custom terminology resource to add to the translation job. This resource \
         lists examples source terms and the desired translation for each term.\n\n\
        \ This parameter accepts only one custom terminology resource.\n\
        \ \n\
        \  If you specify multiple target languages for the job, translate uses the designated \
         terminology for each requested target language that has an entry for the source term in \
         the terminology file.\n\
        \  \n\
        \   For a list of available custom terminology resources, use the [ListTerminologies] \
         operation.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/how-custom-terminology.html}Custom \
         terminology}.\n\
        \    "]
  parallel_data_names : resource_name_list option;
      [@ocaml.doc
        "The name of a parallel data resource to add to the translation job. This resource \
         consists of examples that show how you want segments of text to be translated. If you \
         specify multiple target languages for the job, the parallel data file must include \
         translations for all the target languages.\n\n\
        \ When you add parallel data to a translation job, you create an {i Active Custom \
         Translation} job. \n\
        \ \n\
        \  This parameter accepts only one parallel data resource.\n\
        \  \n\
        \    Active Custom Translation jobs are priced at a higher rate than other jobs that don't \
         use parallel data. For more information, see \
         {{:http://aws.amazon.com/translate/pricing/}Amazon Translate pricing}.\n\
        \    \n\
        \      For a list of available parallel data resources, use the [ListParallelData] \
         operation.\n\
        \      \n\
        \       For more information, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/customizing-translations-parallel-data.html} \
         Customizing your translations with parallel data}.\n\
        \       "]
  client_token : client_token_string;
      [@ocaml.doc
        "A unique identifier for the request. This token is generated for you when using the \
         Amazon Translate SDK.\n"]
  settings : translation_settings option;
      [@ocaml.doc
        "Settings to configure your translation output. You can configure the following options:\n\n\
        \ {ul\n\
        \       {-  Brevity: not supported.\n\
        \           \n\
        \            }\n\
        \       {-  Formality: sets the formality level of the output text.\n\
        \           \n\
        \            }\n\
        \       {-  Profanity: masks profane words and phrases in your translation output.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_filter_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The filter specified for the operation is not valid. Specify a different filter.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec unbounded_length_string = string [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec job_details = {
  translated_documents_count : integer option;
      [@ocaml.doc "The number of documents successfully processed during a translation job.\n"]
  documents_with_errors_count : integer option;
      [@ocaml.doc "The number of documents that could not be processed during a translation job.\n"]
  input_documents_count : integer option;
      [@ocaml.doc "The number of documents used as input in a translation job.\n"]
}
[@@ocaml.doc
  "The number of documents successfully and unsuccessfully processed during a translation job.\n"]

type nonrec text_translation_job_properties = {
  job_id : job_id option; [@ocaml.doc "The ID of the translation job.\n"]
  job_name : job_name option; [@ocaml.doc "The user-defined name of the translation job.\n"]
  job_status : job_status option; [@ocaml.doc "The status of the translation job.\n"]
  job_details : job_details option;
      [@ocaml.doc
        "The number of documents successfully and unsuccessfully processed during the translation \
         job.\n"]
  source_language_code : language_code_string option;
      [@ocaml.doc
        "The language code of the language of the source text. The language must be a language \
         supported by Amazon Translate.\n"]
  target_language_codes : target_language_code_string_list option;
      [@ocaml.doc
        "The language code of the language of the target text. The language must be a language \
         supported by Amazon Translate.\n"]
  terminology_names : resource_name_list option;
      [@ocaml.doc
        "A list containing the names of the terminologies applied to a translation job. Only one \
         terminology can be applied per [StartTextTranslationJob] request at this time.\n"]
  parallel_data_names : resource_name_list option;
      [@ocaml.doc
        "A list containing the names of the parallel data resources applied to the translation job.\n"]
  message : unbounded_length_string option;
      [@ocaml.doc
        "An explanation of any errors that may have occurred during the translation job.\n"]
  submitted_time : timestamp option;
      [@ocaml.doc "The time at which the translation job was submitted.\n"]
  end_time : timestamp option; [@ocaml.doc "The time at which the translation job ended.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input configuration properties that were specified when the job was requested.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output configuration properties that were specified when the job was requested.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that \
         granted Amazon Translate read access to the job's input data.\n"]
  settings : translation_settings option;
      [@ocaml.doc "Settings that modify the translation output.\n"]
}
[@@ocaml.doc "Provides information about a translation job.\n"]

type nonrec text_translation_job_properties_list = text_translation_job_properties list
[@@ocaml.doc ""]

type nonrec list_text_translation_jobs_response = {
  text_translation_job_properties_list : text_translation_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is [null] when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_integer = int [@@ocaml.doc ""]

type nonrec text_translation_job_filter = {
  job_name : job_name option; [@ocaml.doc "Filters the list of jobs by name.\n"]
  job_status : job_status option; [@ocaml.doc "Filters the list of jobs based by job status.\n"]
  submitted_before_time : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing and \
         returns only the jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  submitted_after_time : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing and \
         returns only the jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of translation jobs. For more information, see \
   [ListTextTranslationJobs].\n"]

type nonrec list_text_translation_jobs_request = {
  filter : text_translation_job_filter option;
      [@ocaml.doc
        "The parameters that specify which batch translation jobs to retrieve. Filters include job \
         name, job status, and submission time. You can only set one filter at a time.\n"]
  next_token : next_token option; [@ocaml.doc "The token to request the next page of results.\n"]
  max_results : max_results_integer option;
      [@ocaml.doc
        "The maximum number of results to return in each page. The default value is 100.\n"]
}
[@@ocaml.doc ""]

type nonrec terminology_data_format =
  | CSV [@ocaml.doc ""]
  | TMX [@ocaml.doc ""]
  | TSV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec directionality = UNI [@ocaml.doc ""] | MULTI [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec language_code_string_list = language_code_string list [@@ocaml.doc ""]

type nonrec terminology_arn = string [@@ocaml.doc ""]

type nonrec terminology_properties = {
  name : resource_name option; [@ocaml.doc "The name of the custom terminology.\n"]
  description : description option;
      [@ocaml.doc "The description of the custom terminology properties.\n"]
  arn : terminology_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the custom terminology. \n"]
  source_language_code : language_code_string option;
      [@ocaml.doc
        "The language code for the source text of the translation request for which the custom \
         terminology is being used.\n"]
  target_language_codes : language_code_string_list option;
      [@ocaml.doc
        "The language codes for the target languages available with the custom terminology \
         resource. All possible target languages are returned in array.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc "The encryption key for the custom terminology.\n"]
  size_bytes : integer option;
      [@ocaml.doc "The size of the file used when importing a custom terminology.\n"]
  term_count : integer option;
      [@ocaml.doc "The number of terms included in the custom terminology.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The time at which the custom terminology was created, based on the timestamp.\n"]
  last_updated_at : timestamp option;
      [@ocaml.doc
        "The time at which the custom terminology was last update, based on the timestamp.\n"]
  directionality : directionality option;
      [@ocaml.doc
        "The directionality of your terminology resource indicates whether it has one source \
         language (uni-directional) or multiple (multi-directional). \n\n\
        \  UNI  The terminology resource has one source language (the first column in a CSV file), \
         and all of its other languages are target languages.\n\
        \       \n\
        \         MULTI  Any language in the terminology resource can be the source language.\n\
        \                \n\
        \                  "]
  message : unbounded_length_string option;
      [@ocaml.doc "Additional information from Amazon Translate about the terminology resource.\n"]
  skipped_term_count : integer option;
      [@ocaml.doc
        "The number of terms in the input file that Amazon Translate skipped when you created or \
         updated the terminology resource.\n"]
  format : terminology_data_format option;
      [@ocaml.doc "The format of the custom terminology input file.\n"]
}
[@@ocaml.doc "The properties of the custom terminology.\n"]

type nonrec terminology_properties_list = terminology_properties list [@@ocaml.doc ""]

type nonrec list_terminologies_response = {
  terminology_properties_list : terminology_properties_list option;
      [@ocaml.doc "The properties list of the custom terminologies returned on the list request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " If the response to the ListTerminologies was truncated, the NextToken fetches the next \
         group of custom terminologies.\n"]
}
[@@ocaml.doc ""]

type nonrec list_terminologies_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the request to ListTerminologies was truncated, include the NextToken to \
         fetch the next group of custom terminologies. \n"]
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of custom terminologies returned per list request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags associated with the Amazon Translate resource being queried. A tag is a key-value \
         pair that adds as a metadata to a resource used by Amazon Translate. For example, a tag \
         with \"Sales\" as the key might be added to a resource to indicate its use by the sales \
         department. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the given Amazon Translate resource you are querying. \n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec parallel_data_arn = string [@@ocaml.doc ""]

type nonrec parallel_data_properties = {
  name : resource_name option;
      [@ocaml.doc "The custom name assigned to the parallel data resource.\n"]
  arn : parallel_data_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the parallel data resource.\n"]
  description : description option;
      [@ocaml.doc "The description assigned to the parallel data resource.\n"]
  status : parallel_data_status option;
      [@ocaml.doc
        "The status of the parallel data resource. When the parallel data is ready for you to use, \
         the status is [ACTIVE].\n"]
  source_language_code : language_code_string option;
      [@ocaml.doc "The source language of the translations in the parallel data file.\n"]
  target_language_codes : language_code_string_list option;
      [@ocaml.doc
        "The language codes for the target languages available in the parallel data file. All \
         possible target languages are returned as an array.\n"]
  parallel_data_config : parallel_data_config option;
      [@ocaml.doc "Specifies the format and S3 location of the parallel data input file.\n"]
  message : unbounded_length_string option;
      [@ocaml.doc
        "Additional information from Amazon Translate about the parallel data resource. \n"]
  imported_data_size : long option;
      [@ocaml.doc
        "The number of UTF-8 characters that Amazon Translate imported from the parallel data \
         input file. This number includes only the characters in your translation examples. It \
         does not include characters that are used to format your file. For example, if you \
         provided a Translation Memory Exchange (.tmx) file, this number does not include the tags.\n"]
  imported_record_count : long option;
      [@ocaml.doc
        "The number of records successfully imported from the parallel data input file.\n"]
  failed_record_count : long option;
      [@ocaml.doc
        "The number of records unsuccessfully imported from the parallel data input file.\n"]
  skipped_record_count : long option;
      [@ocaml.doc
        "The number of items in the input file that Amazon Translate skipped when you created or \
         updated the parallel data resource. For example, Amazon Translate skips empty records, \
         empty target texts, and empty lines.\n"]
  encryption_key : encryption_key option; [@ocaml.doc ""]
  created_at : timestamp option;
      [@ocaml.doc "The time at which the parallel data resource was created.\n"]
  last_updated_at : timestamp option;
      [@ocaml.doc "The time at which the parallel data resource was last updated.\n"]
  latest_update_attempt_status : parallel_data_status option;
      [@ocaml.doc "The status of the most recent update attempt for the parallel data resource.\n"]
  latest_update_attempt_at : timestamp option;
      [@ocaml.doc "The time that the most recent update was attempted.\n"]
}
[@@ocaml.doc "The properties of a parallel data resource.\n"]

type nonrec parallel_data_properties_list = parallel_data_properties list [@@ocaml.doc ""]

type nonrec list_parallel_data_response = {
  parallel_data_properties_list : parallel_data_properties_list option;
      [@ocaml.doc "The properties of the parallel data resources returned by this request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string to use in a subsequent request to get the next page of results in a paginated \
         response. This value is null if there are no additional pages.\n"]
}
[@@ocaml.doc ""]

type nonrec list_parallel_data_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A string that specifies the next page of results to return in a paginated response.\n"]
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of parallel data resources returned for each request.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_display_language_code_exception = {
  message : string_ option; [@ocaml.doc ""]
  display_language_code : language_code_string option;
      [@ocaml.doc "Language code passed in with the request.\n"]
}
[@@ocaml.doc "Requested display language code is not supported.\n"]

type nonrec display_language_code =
  | DE [@ocaml.doc ""]
  | EN [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | JA [@ocaml.doc ""]
  | KO [@ocaml.doc ""]
  | PT [@ocaml.doc ""]
  | ZH [@ocaml.doc ""]
  | ZH_TW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec localized_name_string = string [@@ocaml.doc ""]

type nonrec language = {
  language_name : localized_name_string; [@ocaml.doc "Language name of the supported language.\n"]
  language_code : language_code_string; [@ocaml.doc "Language code for the supported language.\n"]
}
[@@ocaml.doc "A supported language.\n"]

type nonrec languages_list = language list [@@ocaml.doc ""]

type nonrec list_languages_response = {
  languages : languages_list option; [@ocaml.doc "The list of supported languages.\n"]
  display_language_code : display_language_code option;
      [@ocaml.doc "The language code passed in with the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " If the response does not include all remaining results, use the NextToken in the next \
         request to fetch the next group of supported languages.\n"]
}
[@@ocaml.doc ""]

type nonrec list_languages_request = {
  display_language_code : display_language_code option;
      [@ocaml.doc
        "The language code for the language to use to display the language names in the response. \
         The language code is [en] by default. \n"]
  next_token : next_token option;
      [@ocaml.doc "Include the NextToken value to fetch the next group of supported languages. \n"]
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each response.\n"]
}
[@@ocaml.doc ""]

type nonrec terminology_data_location = {
  repository_type : string_; [@ocaml.doc "The repository type for the custom terminology data.\n"]
  location : string_;
      [@ocaml.doc
        "The Amazon S3 location of the most recent custom terminology input file that was \
         successfully imported into Amazon Translate. The location is returned as a presigned URL \
         that has a 30-minute expiration .\n\n\
        \  Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. \n\
        \  \n\
        \   CSV injection occurs when a .csv or .tsv file is altered so that a record contains \
         malicious code. The record begins with a special character, such as =, +, -, or \\@. When \
         the file is opened in a spreadsheet program, the program might interpret the record as a \
         formula and run the code within it.\n\
        \   \n\
        \    Before you download an input file from Amazon S3, ensure that you recognize the file \
         and trust its creator.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "The location of the custom terminology data.\n"]

type nonrec import_terminology_response = {
  terminology_properties : terminology_properties option;
      [@ocaml.doc "The properties of the custom terminology being imported.\n"]
  auxiliary_data_location : terminology_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of a file that provides any errors or warnings that were produced \
         by your input file. This file was created when Amazon Translate attempted to create a \
         terminology resource. The location is returned as a presigned URL to that has a 30 minute \
         expiration.\n"]
}
[@@ocaml.doc ""]

type nonrec terminology_file = bytes [@@ocaml.doc ""]

type nonrec terminology_data = {
  file : terminology_file;
      [@ocaml.doc
        "The file containing the custom terminology data. Your version of the AWS SDK performs a \
         Base64-encoding on this field before sending a request to the AWS service. Users of the \
         SDK should not perform Base64-encoding themselves.\n"]
  format : terminology_data_format; [@ocaml.doc "The data format of the custom terminology.\n"]
  directionality : directionality option;
      [@ocaml.doc
        "The directionality of your terminology resource indicates whether it has one source \
         language (uni-directional) or multiple (multi-directional).\n\n\
        \  UNI  The terminology resource has one source language (for example, the first column in \
         a CSV file), and all of its other languages are target languages. \n\
        \       \n\
        \         MULTI  Any language in the terminology resource can be the source language or a \
         target language. A single multi-directional terminology resource can be used for jobs \
         that translate different language pairs. For example, if the terminology contains English \
         and Spanish terms, it can be used for jobs that translate English to Spanish and Spanish \
         to English.\n\
        \                \n\
        \                   When you create a custom terminology resource without specifying the \
         directionality, it behaves as uni-directional terminology, although this parameter will \
         have a null value.\n\
        \                   "]
}
[@@ocaml.doc
  "The data associated with the custom terminology. For information about the custom terminology \
   file, see {{:https://docs.aws.amazon.com/translate/latest/dg/creating-custom-terminology.html} \
   Creating a Custom Terminology}.\n"]

type nonrec merge_strategy = OVERWRITE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec import_terminology_request = {
  name : resource_name; [@ocaml.doc "The name of the custom terminology being imported.\n"]
  merge_strategy : merge_strategy;
      [@ocaml.doc
        "The merge strategy of the custom terminology being imported. Currently, only the \
         OVERWRITE merge strategy is supported. In this case, the imported terminology will \
         overwrite an existing terminology of the same name.\n"]
  description : description option;
      [@ocaml.doc "The description of the custom terminology being imported.\n"]
  terminology_data : terminology_data;
      [@ocaml.doc "The terminology data for the custom terminology being imported.\n"]
  encryption_key : encryption_key option;
      [@ocaml.doc "The encryption key for the custom terminology being imported.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to be associated with this resource. A tag is a key-value pair that adds metadata to \
         a resource. Each tag key for the resource must be unique. For more information, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/tagging.html} Tagging your resources}.\n"]
}
[@@ocaml.doc ""]

type nonrec get_terminology_response = {
  terminology_properties : terminology_properties option;
      [@ocaml.doc "The properties of the custom terminology being retrieved.\n"]
  terminology_data_location : terminology_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of the most recent custom terminology input file that was \
         successfully imported into Amazon Translate. The location is returned as a presigned URL \
         that has a 30-minute expiration.\n\n\
        \  Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. \n\
        \  \n\
        \   CSV injection occurs when a .csv or .tsv file is altered so that a record contains \
         malicious code. The record begins with a special character, such as =, +, -, or \\@. When \
         the file is opened in a spreadsheet program, the program might interpret the record as a \
         formula and run the code within it.\n\
        \   \n\
        \    Before you download an input file from Amazon S3, ensure that you recognize the file \
         and trust its creator.\n\
        \    \n\
        \     "]
  auxiliary_data_location : terminology_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of a file that provides any errors or warnings that were produced \
         by your input file. This file was created when Amazon Translate attempted to create a \
         terminology resource. The location is returned as a presigned URL to that has a 30-minute \
         expiration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_terminology_request = {
  name : resource_name; [@ocaml.doc "The name of the custom terminology being retrieved.\n"]
  terminology_data_format : terminology_data_format option;
      [@ocaml.doc
        "The data format of the custom terminology being retrieved.\n\n\
        \ If you don't specify this parameter, Amazon Translate returns a file with the same \
         format as the file that was imported to create the terminology. \n\
        \ \n\
        \  If you specify this parameter when you retrieve a multi-directional terminology \
         resource, you must specify the same format as the input file that was imported to create \
         it. Otherwise, Amazon Translate throws an error.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec parallel_data_data_location = {
  repository_type : string_;
      [@ocaml.doc "Describes the repository that contains the parallel data input file.\n"]
  location : string_;
      [@ocaml.doc
        "The Amazon S3 location of the parallel data input file. The location is returned as a \
         presigned URL to that has a 30-minute expiration.\n\n\
        \  Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. \n\
        \  \n\
        \   CSV injection occurs when a .csv or .tsv file is altered so that a record contains \
         malicious code. The record begins with a special character, such as =, +, -, or \\@. When \
         the file is opened in a spreadsheet program, the program might interpret the record as a \
         formula and run the code within it.\n\
        \   \n\
        \    Before you download an input file from Amazon S3, ensure that you recognize the file \
         and trust its creator.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The location of the most recent parallel data input file that was successfully imported into \
   Amazon Translate.\n"]

type nonrec get_parallel_data_response = {
  parallel_data_properties : parallel_data_properties option;
      [@ocaml.doc "The properties of the parallel data resource that is being retrieved.\n"]
  data_location : parallel_data_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of the most recent parallel data input file that was successfully \
         imported into Amazon Translate. The location is returned as a presigned URL that has a \
         30-minute expiration.\n\n\
        \  Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. \n\
        \  \n\
        \   CSV injection occurs when a .csv or .tsv file is altered so that a record contains \
         malicious code. The record begins with a special character, such as =, +, -, or \\@. When \
         the file is opened in a spreadsheet program, the program might interpret the record as a \
         formula and run the code within it.\n\
        \   \n\
        \    Before you download an input file from Amazon S3, ensure that you recognize the file \
         and trust its creator.\n\
        \    \n\
        \     "]
  auxiliary_data_location : parallel_data_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of a file that provides any errors or warnings that were produced \
         by your input file. This file was created when Amazon Translate attempted to create a \
         parallel data resource. The location is returned as a presigned URL to that has a \
         30-minute expiration.\n"]
  latest_update_attempt_auxiliary_data_location : parallel_data_data_location option;
      [@ocaml.doc
        "The Amazon S3 location of a file that provides any errors or warnings that were produced \
         by your input file. This file was created when Amazon Translate attempted to update a \
         parallel data resource. The location is returned as a presigned URL to that has a \
         30-minute expiration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_parallel_data_request = {
  name : resource_name;
      [@ocaml.doc "The name of the parallel data resource that is being retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_text_translation_job_response = {
  text_translation_job_properties : text_translation_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with an asynchronous batch translation \
         job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_text_translation_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Translate generated for the job. The [StartTextTranslationJob] \
         operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_terminology_request = {
  name : resource_name; [@ocaml.doc "The name of the custom terminology being deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_parallel_data_response = {
  name : resource_name option;
      [@ocaml.doc "The name of the parallel data resource that is being deleted.\n"]
  status : parallel_data_status option; [@ocaml.doc "The status of the parallel data deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_parallel_data_request = {
  name : resource_name;
      [@ocaml.doc "The name of the parallel data resource that is being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec create_parallel_data_response = {
  name : resource_name option;
      [@ocaml.doc "The custom name that you assigned to the parallel data resource.\n"]
  status : parallel_data_status option;
      [@ocaml.doc
        "The status of the parallel data resource. When the resource is ready for you to use, the \
         status is [ACTIVE].\n"]
}
[@@ocaml.doc ""]

type nonrec create_parallel_data_request = {
  name : resource_name;
      [@ocaml.doc
        "A custom name for the parallel data resource in Amazon Translate. You must assign a name \
         that is unique in the account and region.\n"]
  description : description option;
      [@ocaml.doc "A custom description for the parallel data resource in Amazon Translate.\n"]
  parallel_data_config : parallel_data_config;
      [@ocaml.doc "Specifies the format and S3 location of the parallel data input file.\n"]
  encryption_key : encryption_key option; [@ocaml.doc ""]
  client_token : client_token_string;
      [@ocaml.doc
        "A unique identifier for the request. This token is automatically generated when you use \
         Amazon Translate through an AWS SDK.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to be associated with this resource. A tag is a key-value pair that adds metadata to \
         a resource. Each tag key for the resource must be unique. For more information, see \
         {{:https://docs.aws.amazon.com/translate/latest/dg/tagging.html} Tagging your resources}.\n"]
}
[@@ocaml.doc ""]
