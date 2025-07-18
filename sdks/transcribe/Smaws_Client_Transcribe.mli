(** 
    Transcribe client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vocabulary_state =
  | FAILED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec language_code =
  | ZU_ZA [@ocaml.doc ""]
  | WO_SN [@ocaml.doc ""]
  | UZ_UZ [@ocaml.doc ""]
  | UK_UA [@ocaml.doc ""]
  | UG_CN [@ocaml.doc ""]
  | TT_RU [@ocaml.doc ""]
  | TL_PH [@ocaml.doc ""]
  | SW_UG [@ocaml.doc ""]
  | SW_TZ [@ocaml.doc ""]
  | SW_RW [@ocaml.doc ""]
  | SW_KE [@ocaml.doc ""]
  | SW_BI [@ocaml.doc ""]
  | SU_ID [@ocaml.doc ""]
  | SR_RS [@ocaml.doc ""]
  | SO_SO [@ocaml.doc ""]
  | SL_SI [@ocaml.doc ""]
  | SK_SK [@ocaml.doc ""]
  | SI_LK [@ocaml.doc ""]
  | RW_RW [@ocaml.doc ""]
  | RO_RO [@ocaml.doc ""]
  | PS_AF [@ocaml.doc ""]
  | PL_PL [@ocaml.doc ""]
  | PA_IN [@ocaml.doc ""]
  | OR_IN [@ocaml.doc ""]
  | NO_NO [@ocaml.doc ""]
  | MT_MT [@ocaml.doc ""]
  | MR_IN [@ocaml.doc ""]
  | MN_MN [@ocaml.doc ""]
  | ML_IN [@ocaml.doc ""]
  | MK_MK [@ocaml.doc ""]
  | MI_NZ [@ocaml.doc ""]
  | MHR_RU [@ocaml.doc ""]
  | LV_LV [@ocaml.doc ""]
  | LT_LT [@ocaml.doc ""]
  | LG_IN [@ocaml.doc ""]
  | KY_KG [@ocaml.doc ""]
  | KN_IN [@ocaml.doc ""]
  | KK_KZ [@ocaml.doc ""]
  | KAB_DZ [@ocaml.doc ""]
  | KA_GE [@ocaml.doc ""]
  | IS_IS [@ocaml.doc ""]
  | HY_AM [@ocaml.doc ""]
  | HU_HU [@ocaml.doc ""]
  | HR_HR [@ocaml.doc ""]
  | HA_NG [@ocaml.doc ""]
  | GU_IN [@ocaml.doc ""]
  | GL_ES [@ocaml.doc ""]
  | FI_FI [@ocaml.doc ""]
  | EU_ES [@ocaml.doc ""]
  | ET_ET [@ocaml.doc ""]
  | EL_GR [@ocaml.doc ""]
  | CY_WL [@ocaml.doc ""]
  | CS_CZ [@ocaml.doc ""]
  | CKB_IR [@ocaml.doc ""]
  | CKB_IQ [@ocaml.doc ""]
  | CA_ES [@ocaml.doc ""]
  | BS_BA [@ocaml.doc ""]
  | BN_IN [@ocaml.doc ""]
  | BG_BG [@ocaml.doc ""]
  | BE_BY [@ocaml.doc ""]
  | BA_RU [@ocaml.doc ""]
  | AZ_AZ [@ocaml.doc ""]
  | AST_ES [@ocaml.doc ""]
  | AB_GE [@ocaml.doc ""]
  | SV_SE [@ocaml.doc ""]
  | VI_VN [@ocaml.doc ""]
  | EN_NZ [@ocaml.doc ""]
  | EN_ZA [@ocaml.doc ""]
  | TH_TH [@ocaml.doc ""]
  | ZH_TW [@ocaml.doc ""]
  | ZH_CN [@ocaml.doc ""]
  | TR_TR [@ocaml.doc ""]
  | TE_IN [@ocaml.doc ""]
  | TA_IN [@ocaml.doc ""]
  | RU_RU [@ocaml.doc ""]
  | PT_PT [@ocaml.doc ""]
  | PT_BR [@ocaml.doc ""]
  | NL_NL [@ocaml.doc ""]
  | MS_MY [@ocaml.doc ""]
  | KO_KR [@ocaml.doc ""]
  | JA_JP [@ocaml.doc ""]
  | IT_IT [@ocaml.doc ""]
  | ID_ID [@ocaml.doc ""]
  | HI_IN [@ocaml.doc ""]
  | HE_IL [@ocaml.doc ""]
  | FR_FR [@ocaml.doc ""]
  | FR_CA [@ocaml.doc ""]
  | FA_IR [@ocaml.doc ""]
  | ES_US [@ocaml.doc ""]
  | ES_ES [@ocaml.doc ""]
  | EN_WL [@ocaml.doc ""]
  | EN_US [@ocaml.doc ""]
  | EN_IN [@ocaml.doc ""]
  | EN_IE [@ocaml.doc ""]
  | EN_GB [@ocaml.doc ""]
  | EN_AU [@ocaml.doc ""]
  | EN_AB [@ocaml.doc ""]
  | DE_DE [@ocaml.doc ""]
  | DE_CH [@ocaml.doc ""]
  | DA_DK [@ocaml.doc ""]
  | AR_SA [@ocaml.doc ""]
  | AR_AE [@ocaml.doc ""]
  | AF_ZA [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec vocabulary_info =
  {
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartTranscriptionJob] request.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your custom vocabulary. Each custom vocabulary must contain terms in only one language.\n\n A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English ([en-US]), you can only apply this custom vocabulary to files that contain English audio.\n "];
  vocabulary_name: string option
    [@ocaml.doc
      "A unique name, chosen by you, for your custom vocabulary. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides information about a custom vocabulary, including the language of the custom vocabulary, when it was last modified, its name, and the processing state.\n"]
type nonrec vocabulary_filter_info =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary filter was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code that represents the language of the entries in your vocabulary filter. Each custom vocabulary filter must contain terms in only one language.\n\n A custom vocabulary filter can only be used to transcribe files in the same language as the filter. For example, if you create a custom vocabulary filter using US English ([en-US]), you can only apply this filter to files that contain English audio.\n \n  For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n  "];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "A unique name, chosen by you, for your custom vocabulary filter. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides information about a custom vocabulary filter, including the language of the filter, when it was last modified, and its name.\n"]
type nonrec vocabulary_filter_method =
  | TAG [@ocaml.doc ""]
  | MASK [@ocaml.doc ""]
  | REMOVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartTranscriptionJob] request.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary was last updated.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary.\n"];
  vocabulary_name: string option
    [@ocaml.doc "The name of the updated custom vocabulary.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec update_vocabulary_request =
  {
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary). If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  vocabulary_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt] \n \n  Note that if you include [VocabularyFileUri] in your request, you cannot use the [Phrases] flag; you must choose one or the other.\n  "];
  phrases: string list option
    [@ocaml.doc
      "Use this parameter if you want to update your custom vocabulary by including all desired terms, as comma-separated values, within your request. The other option for updating your custom vocabulary is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the [VocabularyFileUri] parameter.\n\n Note that if you include [Phrases] in your request, you cannot use [VocabularyFileUri]; you must choose one or the other.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language of the entries in the custom vocabulary you want to update. Each custom vocabulary must contain terms in only one language.\n\n A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English ([en-US]), you can only apply this custom vocabulary to files that contain English audio.\n \n  For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n  "];
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom vocabulary you want to update. Custom vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec update_vocabulary_filter_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary filter was last updated.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary filter.\n"];
  vocabulary_filter_name: string option
    [@ocaml.doc "The name of the updated custom vocabulary filter.\n"]}
[@@ocaml.doc ""]
type nonrec update_vocabulary_filter_request =
  {
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary filter). If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  vocabulary_filter_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI must be located in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt] \n \n  Note that if you include [VocabularyFilterFileUri] in your request, you cannot use [Words]; you must choose one or the other.\n  "];
  words: string list option
    [@ocaml.doc
      "Use this parameter if you want to update your custom vocabulary filter by including all desired terms, as comma-separated values, within your request. The other option for updating your vocabulary filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the [VocabularyFilterFileUri] parameter.\n\n Note that if you include [Words] in your request, you cannot use [VocabularyFilterFileUri]; you must choose one or the other.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  "];
  vocabulary_filter_name: string
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to update. Custom vocabulary filter names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec not_found_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "We can't find the requested resource. Check that the specified name is correct and try your request again.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You've either sent too many requests or your input file is too long. Wait before retrying your request, or use a smaller file and try your request again.\n"]
type nonrec internal_failure_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "There was an internal error. Check the error message, correct the issue, and try your request again.\n"]
type nonrec bad_request_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Your request didn't pass one or more validation tests. This can occur when the entity you're trying to delete doesn't exist or if it's in a non-terminal state (such as [IN PROGRESS]). See the exception message field for more information.\n"]
type nonrec conflict_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A resource already exists with this name. Resource names must be unique within an Amazon Web Services account.\n"]
type nonrec update_medical_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom medical vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartMedicalTranscriptionJob] request.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom medical vocabulary was last updated.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom medical vocabulary. US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n"];
  vocabulary_name: string option
    [@ocaml.doc "The name of the updated custom medical vocabulary.\n"]}
[@@ocaml.doc ""]
type nonrec update_medical_vocabulary_request =
  {
  vocabulary_file_uri: string
    [@ocaml.doc
      "The Amazon S3 location of the text file that contains your custom medical vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt] \n "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language of the entries in the custom vocabulary you want to update. US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n"];
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom medical vocabulary you want to update. Custom medical vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec absolute_time_range =
  {
  last: int option
    [@ocaml.doc
      "The time, in milliseconds, from the specified value until the end of your media file. Amazon Transcribe searches for your specified criteria in this time segment.\n"];
  first: int option
    [@ocaml.doc
      "The time, in milliseconds, from the start of your media file until the specified value. Amazon Transcribe searches for your specified criteria in this time segment.\n"];
  end_time: int option
    [@ocaml.doc
      "The time, in milliseconds, when Amazon Transcribe stops searching for the specified criteria in your audio. If you include [EndTime] in your request, you must also include [StartTime].\n"];
  start_time: int option
    [@ocaml.doc
      "The time, in milliseconds, when Amazon Transcribe starts searching for the specified criteria in your audio. If you include [StartTime] in your request, you must also include [EndTime].\n"]}
[@@ocaml.doc
  "A time range, in milliseconds, between two points in your media file.\n\n You can use [StartTime] and [EndTime] to search a custom segment. For example, setting [StartTime] to 10000 and [EndTime] to 50000 only searches for your specified criteria in the audio contained between the 10,000 millisecond mark and the 50,000 millisecond mark of your media file. You must use [StartTime] and [EndTime] as a set; that is, if you include one, you must include both.\n \n  You can use also [First] to search from the start of the audio until the time that you specify, or [Last] to search from the time that you specify until the end of the audio. For example, setting [First] to 50000 only searches for your specified criteria in the audio contained between the start of the media file to the 50,000 millisecond mark. You can use [First] and [Last] independently of each other.\n  \n   If you prefer to use percentage instead of milliseconds, see .\n   "]
type nonrec relative_time_range =
  {
  last: int option
    [@ocaml.doc
      "The time, in percentage, from the specified value until the end of your media file. Amazon Transcribe searches for your specified criteria in this time segment.\n"];
  first: int option
    [@ocaml.doc
      "The time, in percentage, from the start of your media file until the specified value. Amazon Transcribe searches for your specified criteria in this time segment.\n"];
  end_percentage: int option
    [@ocaml.doc
      "The time, in percentage, when Amazon Transcribe stops searching for the specified criteria in your media file. If you include [EndPercentage] in your request, you must also include [StartPercentage].\n"];
  start_percentage: int option
    [@ocaml.doc
      "The time, in percentage, when Amazon Transcribe starts searching for the specified criteria in your media file. If you include [StartPercentage] in your request, you must also include [EndPercentage].\n"]}
[@@ocaml.doc
  "A time range, in percentage, between two points in your media file.\n\n You can use [StartPercentage] and [EndPercentage] to search a custom segment. For example, setting [StartPercentage] to 10 and [EndPercentage] to 50 only searches for your specified criteria in the audio contained between the 10 percent mark and the 50 percent mark of your media file.\n \n  You can use also [First] to search from the start of the media file until the time that you specify. Or use [Last] to search from the time that you specify until the end of the media file. For example, setting [First] to 10 only searches for your specified criteria in the audio contained in the first 10 percent of the media file.\n  \n   If you prefer to use milliseconds instead of percentage, see .\n   "]
type nonrec non_talk_time_filter =
  {
  negate: bool option
    [@ocaml.doc
      "Set to [TRUE] to flag periods of speech. Set to [FALSE] to flag periods of silence\n"];
  relative_time_range: relative_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for a period of silence. See for more detail.\n"];
  absolute_time_range: absolute_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for a period of silence. See for more detail.\n"];
  threshold: int option
    [@ocaml.doc
      "Specify the duration, in milliseconds, of the period of silence that you want to flag. For example, you can flag a silent period that lasts 30,000 milliseconds.\n"]}
[@@ocaml.doc
  "Flag the presence or absence of periods of silence in your Call Analytics transcription output.\n\n Rules using [NonTalkTimeFilter] are designed to match:\n \n  {ul\n        {-  The presence of silence at specified periods throughout the call\n            \n             }\n        {-  The presence of speech at specified periods throughout the call\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec participant_role =
  | CUSTOMER [@ocaml.doc ""]
  | AGENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec interruption_filter =
  {
  negate: bool option
    [@ocaml.doc
      "Set to [TRUE] to flag speech that does not contain interruptions. Set to [FALSE] to flag speech that contains interruptions.\n"];
  relative_time_range: relative_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for an interruption. See for more detail.\n"];
  absolute_time_range: absolute_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for an interruption. See for more detail.\n"];
  participant_role: participant_role option
    [@ocaml.doc
      "Specify the interrupter that you want to flag. Omitting this parameter is equivalent to specifying both participants.\n"];
  threshold: int option
    [@ocaml.doc
      "Specify the duration of the interruptions in milliseconds. For example, you can flag speech that contains more than 10,000 milliseconds of interruptions.\n"]}
[@@ocaml.doc
  "Flag the presence or absence of interruptions in your Call Analytics transcription output.\n\n Rules using [InterruptionFilter] are designed to match:\n \n  {ul\n        {-  Instances where an agent interrupts a customer\n            \n             }\n        {-  Instances where a customer interrupts an agent\n            \n             }\n        {-  Either participant interrupting the other\n            \n             }\n        {-  A lack of interruptions\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec transcript_filter_type =
  | EXACT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec transcript_filter =
  {
  targets: string list
    [@ocaml.doc "Specify the phrases that you want to flag.\n"];
  negate: bool option
    [@ocaml.doc
      "Set to [TRUE] to flag the absence of the phrase that you specified in your request. Set to [FALSE] to flag the presence of the phrase that you specified in your request.\n"];
  participant_role: participant_role option
    [@ocaml.doc
      "Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying both participants.\n"];
  relative_time_range: relative_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for the specified key words or phrases. See for more detail.\n"];
  absolute_time_range: absolute_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for the specified key words or phrases. See for more detail.\n"];
  transcript_filter_type: transcript_filter_type
    [@ocaml.doc
      "Flag the presence or absence of an exact match to the phrases that you specify. For example, if you specify the phrase \"speak to a manager\" as your [Targets] value, only that exact phrase is flagged.\n\n Note that semantic matching is not supported. For example, if your customer says \"speak to {i the} manager\", instead of \"speak to {i a} manager\", your content is not flagged.\n "]}
[@@ocaml.doc
  "Flag the presence or absence of specific words or phrases detected in your Call Analytics transcription output.\n\n Rules using [TranscriptFilter] are designed to match:\n \n  {ul\n        {-  Custom words or phrases spoken by the agent, the customer, or both\n            \n             }\n        {-  Custom words or phrases {b not} spoken by the agent, the customer, or either\n            \n             }\n        {-  Custom words or phrases that occur at a specific time frame\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html#tca-rules-stream}Rule criteria for streaming categories} for usage examples.\n   "]
type nonrec sentiment_value =
  | MIXED [@ocaml.doc ""]
  | NEUTRAL [@ocaml.doc ""]
  | NEGATIVE [@ocaml.doc ""]
  | POSITIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sentiment_filter =
  {
  negate: bool option
    [@ocaml.doc
      "Set to [TRUE] to flag the sentiments that you didn't include in your request. Set to [FALSE] to flag the sentiments that you specified in your request.\n"];
  participant_role: participant_role option
    [@ocaml.doc
      "Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying both participants.\n"];
  relative_time_range: relative_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for the specified sentiments. See for more detail.\n"];
  absolute_time_range: absolute_time_range option
    [@ocaml.doc
      "Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for the specified sentiments. See for more detail.\n"];
  sentiments: sentiment_value list
    [@ocaml.doc "Specify the sentiments that you want to flag.\n"]}[@@ocaml.doc
                                                                    "Flag the presence or absence of specific sentiments detected in your Call Analytics transcription output.\n\n Rules using [SentimentFilter] are designed to match:\n \n  {ul\n        {-  The presence or absence of a positive sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a negative sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a neutral sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a mixed sentiment felt by the customer, the agent, or both at specified points in the call\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec rule =
  | SentimentFilter of sentiment_filter
  [@ocaml.doc
    "Flag the presence or absence of specific sentiments in your Call Analytics transcription output. Refer to for more detail.\n"]
  | TranscriptFilter of transcript_filter
  [@ocaml.doc
    "Flag the presence or absence of specific words or phrases in your Call Analytics transcription output. Refer to for more detail.\n"]
  | InterruptionFilter of interruption_filter
  [@ocaml.doc
    "Flag the presence or absence of interruptions in your Call Analytics transcription output. Refer to for more detail.\n"]
  | NonTalkTimeFilter of non_talk_time_filter
  [@ocaml.doc
    "Flag the presence or absence of periods of silence in your Call Analytics transcription output. Refer to for more detail.\n"]
[@@ocaml.doc
  "A rule is a set of criteria that you can specify to flag an attribute in your Call Analytics output. Rules define a Call Analytics category.\n\n Rules can include these parameters: , , , and .\n \n  To learn more about Call Analytics rules and categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n  \n   To learn more about Call Analytics, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.\n   "]
type nonrec input_type =
  | POST_CALL [@ocaml.doc ""]
  | REAL_TIME [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec category_properties =
  {
  input_type: input_type option
    [@ocaml.doc
      "The input type associated with the specified category. [POST_CALL] refers to a category that is applied to batch transcriptions; [REAL_TIME] refers to a category that is applied to streaming transcriptions.\n"];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics category was last updated.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-05T12:45:32.691000-07:00] represents 12:45 PM UTC-7 on May 5, 2022.\n "];
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics category was created.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  rules: rule list option
    [@ocaml.doc
      "The rules used to define a Call Analytics category. Each category can have between 1 and 20 rules.\n"];
  category_name: string option
    [@ocaml.doc
      "The name of the Call Analytics category. Category names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides you with the properties of the Call Analytics category you specified in your request. This includes the list of rules that define the specified category.\n"]
type nonrec update_call_analytics_category_response =
  {
  category_properties: category_properties option
    [@ocaml.doc
      "Provides you with the properties of the Call Analytics category you specified in your [UpdateCallAnalyticsCategory] request.\n"]}
[@@ocaml.doc ""]
type nonrec update_call_analytics_category_request =
  {
  input_type: input_type option
    [@ocaml.doc
      "Choose whether you want to update a real-time or a post-call category. The input type you specify must match the input type specified when the category was created. For example, if you created a category with the [POST_CALL] input type, you must use [POST_CALL] as the input type when updating this category.\n"];
  rules: rule list
    [@ocaml.doc
      "The rules used for the updated Call Analytics category. The rules you provide in this field replace the ones that are currently being used in the specified category.\n"];
  category_name: string
    [@ocaml.doc
      "The name of the Call Analytics category you want to update. Category names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc
      "Removes the specified tag keys from the specified Amazon Transcribe resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to remove tags from. ARNs have the format [arn:partition:service:region:account-id:resource-type/resource-id].\n\n For example, [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].\n \n  Valid values for [resource-type] are: [transcription-job], [medical-transcription-job], [vocabulary], [medical-vocabulary], [vocabulary-filter], and [language-model].\n  "]}
[@@ocaml.doc ""]
type nonrec type_ =
  | DICTATION [@ocaml.doc ""]
  | CONVERSATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec transcription_job_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec output_location_type =
  | SERVICE_BUCKET [@ocaml.doc ""]
  | CUSTOMER_BUCKET [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec redaction_type =
  | PII [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec redaction_output =
  | REDACTED_AND_UNREDACTED [@ocaml.doc ""]
  | REDACTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec pii_entity_type =
  | ALL [@ocaml.doc ""]
  | SSN [@ocaml.doc ""]
  | PHONE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | ADDRESS [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | PIN [@ocaml.doc ""]
  | CREDIT_DEBIT_EXPIRY [@ocaml.doc ""]
  | CREDIT_DEBIT_CVV [@ocaml.doc ""]
  | CREDIT_DEBIT_NUMBER [@ocaml.doc ""]
  | BANK_ROUTING [@ocaml.doc ""]
  | BANK_ACCOUNT_NUMBER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec content_redaction =
  {
  pii_entity_types: pii_entity_type list option
    [@ocaml.doc
      "Specify which types of personally identifiable information (PII) you want to redact in your transcript. You can include as many types as you'd like, or you can select [ALL]. If you do not include [PiiEntityTypes] in your request, all PII is redacted.\n"];
  redaction_output: redaction_output
    [@ocaml.doc
      "Specify if you want only a redacted transcript, or if you want a redacted and an unredacted transcript.\n\n When you choose [redacted] Amazon Transcribe creates only a redacted transcript.\n \n  When you choose [redacted_and_unredacted] Amazon Transcribe creates a redacted and an unredacted transcript (as two separate files).\n  "];
  redaction_type: redaction_type
    [@ocaml.doc
      "Specify the category of information you want to redact; [PII] (personally identifiable information) is the only valid value. You can use [PiiEntityTypes] to choose which types of PII you want to redact. If you do not include [PiiEntityTypes] in your request, all PII is redacted.\n"]}
[@@ocaml.doc
  "Makes it possible to redact or flag specified personally identifiable information (PII) in your transcript. If you use [ContentRedaction], you must also include the sub-parameters: [RedactionOutput] and [RedactionType]. You can optionally include [PiiEntityTypes] to choose which types of PII you want to redact.\n"]
type nonrec model_settings =
  {
  language_model_name: string option
    [@ocaml.doc
      "The name of the custom language model you want to use when processing your transcription job. Note that custom language model names are case sensitive.\n\n The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages do not match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.\n "]}
[@@ocaml.doc
  "Provides the name of the custom language model that was included in the specified transcription job.\n\n Only use [ModelSettings] with the [LanguageModelName] sub-parameter if you're {b not} using automatic language identification (). If using [LanguageIdSettings] in your request, this parameter contains a [LanguageModelName] sub-parameter.\n "]
type nonrec language_code_item =
  {
  duration_in_seconds: float option
    [@ocaml.doc
      "Provides the total time, in seconds, each identified language is spoken in your media.\n"];
  language_code: language_code option
    [@ocaml.doc
      "Provides the language code for each language identified in your media.\n"]}
[@@ocaml.doc
  "Provides information on the speech contained in a discreet utterance when multi-language identification is enabled in your request. This utterance represents a block of speech consisting of one language, preceded or followed by a block of speech in a different language.\n"]
type nonrec toxicity_category =
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec toxicity_detection_settings =
  {
  toxicity_categories: toxicity_category list
    [@ocaml.doc
      " If you include [ToxicityDetection] in your transcription request, you must also include [ToxicityCategories]. The only accepted value for this parameter is [ALL].\n"]}
[@@ocaml.doc
  "Contains [ToxicityCategories], which is a required parameter if you want to enable toxicity detection ([ToxicityDetection]) in your transcription request.\n"]
type nonrec transcription_job_summary =
  {
  toxicity_detection: toxicity_detection_settings list option
    [@ocaml.doc
      "Indicates whether toxicity detection was enabled for the specified transcription job.\n"];
  language_codes: language_code_item list option
    [@ocaml.doc
      "The language codes used to create your transcription job. This parameter is used with multi-language identification. For single-language identification, the singular version of this parameter, [LanguageCode], is present.\n"];
  identified_language_score: float option
    [@ocaml.doc
      "The confidence score associated with the language identified in your media file.\n\n Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.\n "];
  identify_multiple_languages: bool option
    [@ocaml.doc
      "Indicates whether automatic multi-language identification was enabled ([TRUE]) for the specified transcription job.\n"];
  identify_language: bool option
    [@ocaml.doc
      "Indicates whether automatic language identification was enabled ([TRUE]) for the specified transcription job.\n"];
  model_settings: model_settings option [@ocaml.doc ""];
  content_redaction: content_redaction option
    [@ocaml.doc "The content redaction settings of the transcription job.\n"];
  output_location_type: output_location_type option
    [@ocaml.doc
      "Indicates where the specified transcription output is stored.\n\n If the value is [CUSTOMER_BUCKET], the location is the Amazon S3 bucket you specified using the [OutputBucketName] parameter in your request. If you also included [OutputKey] in your request, your output is located in the path you specified in your request.\n \n  If the value is [SERVICE_BUCKET], the location is a service-managed Amazon S3 bucket. To access a transcript stored in a service-managed bucket, use the URI shown in the [TranscriptFileUri] or [RedactedTranscriptFileUri] field.\n  "];
  failure_reason: string option
    [@ocaml.doc
      "If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  transcription_job_status: transcription_job_status option
    [@ocaml.doc
      "Provides the status of your transcription job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri] (or [RedactedTranscriptFileUri], if you requested transcript redaction). If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  language_code: language_code option
    [@ocaml.doc "The language code used to create your transcription.\n"];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified transcription job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time your transcription job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified transcription job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  transcription_job_name: string option
    [@ocaml.doc
      "The name of the transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a specific transcription job.\n"]
type nonrec media_format =
  | M4A [@ocaml.doc ""]
  | WEBM [@ocaml.doc ""]
  | AMR [@ocaml.doc ""]
  | OGG [@ocaml.doc ""]
  | FLAC [@ocaml.doc ""]
  | WAV [@ocaml.doc ""]
  | MP4 [@ocaml.doc ""]
  | MP3 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec media =
  {
  redacted_media_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the media file you want to redact. For example:\n\n {ul\n       {-   [s3://DOC-EXAMPLE-BUCKET/my-media-file.flac] \n           \n            }\n       {-   [s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac] \n           \n            }\n       }\n   Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web Services Region where you're making your transcription request.\n   \n      [RedactedMediaFileUri] produces a redacted audio file in addition to a redacted transcript. It is only supported for Call Analytics ([StartCallAnalyticsJob]) transcription requests.\n     \n      "];
  media_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the media file you want to transcribe. For example:\n\n {ul\n       {-   [s3://DOC-EXAMPLE-BUCKET/my-media-file.flac] \n           \n            }\n       {-   [s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac] \n           \n            }\n       }\n   Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web Services Region where you're making your transcription request.\n   "]}
[@@ocaml.doc
  "Describes the Amazon S3 location of the media file you want to use in your request.\n\n For information on supported media formats, refer to the [MediaFormat] parameter or the {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio}Media formats} section in the Amazon S3 Developer Guide.\n "]
type nonrec transcript =
  {
  redacted_transcript_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of your redacted transcript. You can use this URI to access or download your transcript.\n\n If you included [OutputBucketName] in your transcription job request, this is the URI of that bucket. If you also included [OutputKey] in your request, your output is located in the path you specified in your request.\n \n  If you didn't include [OutputBucketName] in your transcription job request, your transcript is stored in a service-managed bucket, and [RedactedTranscriptFileUri] provides you with a temporary URI you can use for secure access to your transcript.\n  \n    Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an [AccesDenied] error, you can get a new temporary URI by running a [GetTranscriptionJob] or [ListTranscriptionJob] request.\n    \n     "];
  transcript_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of your transcript. You can use this URI to access or download your transcript.\n\n If you included [OutputBucketName] in your transcription job request, this is the URI of that bucket. If you also included [OutputKey] in your request, your output is located in the path you specified in your request.\n \n  If you didn't include [OutputBucketName] in your transcription job request, your transcript is stored in a service-managed bucket, and [TranscriptFileUri] provides you with a temporary URI you can use for secure access to your transcript.\n  \n    Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an [AccesDenied] error, you can get a new temporary URI by running a [GetTranscriptionJob] or [ListTranscriptionJob] request.\n    \n     "]}
[@@ocaml.doc
  "Provides you with the Amazon S3 URI you can use to access your transcript.\n"]
type nonrec settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option
    [@ocaml.doc
      "Specify how you want your custom vocabulary filter applied to your transcript.\n\n To replace words with [***], choose [mask].\n \n  To delete words, choose [remove].\n  \n   To flag words without changing them, choose [tag].\n   "];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to use in your transcription job request. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.\n\n Note that if you include [VocabularyFilterName] in your request, you must also include [VocabularyFilterMethod].\n "];
  max_alternatives: int option
    [@ocaml.doc
      "Indicate the maximum number of alternative transcriptions you want Amazon Transcribe to include in your transcript.\n\n If you select a number greater than the number of alternative transcriptions generated by Amazon Transcribe, only the actual number of alternative transcriptions are included.\n \n  If you include [MaxAlternatives] in your request, you must also include [ShowAlternatives] with a value of [true].\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html}Alternative transcriptions}.\n   "];
  show_alternatives: bool option
    [@ocaml.doc
      "To include alternative transcriptions within your transcription output, include [ShowAlternatives] in your transcription request.\n\n If you have multi-channel audio and do not enable channel identification, your audio is transcribed in a continuous manner and your transcript does not separate the speech by channel.\n \n  If you include [ShowAlternatives], you must also include [MaxAlternatives], which is the maximum number of alternative transcriptions you want Amazon Transcribe to generate.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html}Alternative transcriptions}.\n   "];
  channel_identification: bool option
    [@ocaml.doc
      "Enables channel identification in multi-channel audio.\n\n Channel identification transcribes the audio on each channel independently, then appends the output for each channel into one transcript.\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html}Transcribing multi-channel audio}.\n  "];
  max_speaker_labels: int option
    [@ocaml.doc
      "Specify the maximum number of speakers you want to partition in your media.\n\n Note that if your media contains more speakers than the specified number, multiple speakers are treated as a single speaker.\n \n  If you specify the [MaxSpeakerLabels] field, you must set the [ShowSpeakerLabels] field to true.\n  "];
  show_speaker_labels: bool option
    [@ocaml.doc
      "Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels the speech from individual speakers in your media file.\n\n If you enable [ShowSpeakerLabels] in your request, you must also include [MaxSpeakerLabels].\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html}Partitioning speakers (diarization)}.\n  "];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you want to use in your transcription job request. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your transcription job.\n"]
type nonrec job_execution_settings =
  {
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin]. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n \n  Note that if you include [DataAccessRoleArn] in your request, you must also include [AllowDeferredExecution].\n  "];
  allow_deferred_execution: bool option
    [@ocaml.doc
      "Makes it possible to enable job queuing when your concurrent request limit is exceeded. When [AllowDeferredExecution] is set to [true], transcription job requests are placed in a queue until the number of jobs falls below the concurrent request limit. If [AllowDeferredExecution] is set to [false] and the number of transcription job requests exceed the concurrent request limit, you get a [LimitExceededException] error.\n\n If you include [AllowDeferredExecution] in your request, you must also include [DataAccessRoleArn].\n "]}
[@@ocaml.doc
  "Makes it possible to control how your transcription job is processed. Currently, the only [JobExecutionSettings] modification you can choose is enabling job queueing using the [AllowDeferredExecution] sub-parameter.\n\n If you include [JobExecutionSettings] in your request, you must also include the sub-parameters: [AllowDeferredExecution] and [DataAccessRoleArn].\n "]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "The second part of a key:value pair that forms a tag associated with a given resource. For example, in the tag [Department:Sales], the value is 'Sales'.\n\n Note that you can set the value of a tag to an empty string, but you can't set the value of a tag to null. Omitting the tag value is the same as using an empty string.\n "];
  key: string
    [@ocaml.doc
      "The first part of a key:value pair that forms a tag associated with a given resource. For example, in the tag [Department:Sales], the key is 'Department'.\n"]}
[@@ocaml.doc
  "Adds metadata, in the form of a key:value pair, to the specified resource.\n\n For example, you could add the tag [Department:Sales] to a resource to indicate that it pertains to your organization's sales department. You can also use tags for tag-based access control.\n \n  To learn more about tagging, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n  "]
type nonrec subtitle_format =
  | SRT [@ocaml.doc ""]
  | VTT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec subtitles_output =
  {
  output_start_index: int option
    [@ocaml.doc
      "Provides the start index value for your subtitle files. If you did not specify a value in your request, the default value of [0] is used.\n"];
  subtitle_file_uris: string list option
    [@ocaml.doc
      "The Amazon S3 location of your transcript. You can use this URI to access or download your subtitle file. Your subtitle file is stored in the same location as your transcript. If you specified both WebVTT and SubRip subtitle formats, two URIs are provided.\n\n If you included [OutputBucketName] in your transcription job request, this is the URI of that bucket. If you also included [OutputKey] in your request, your output is located in the path you specified in your request.\n \n  If you didn't include [OutputBucketName] in your transcription job request, your subtitle file is stored in a service-managed bucket, and [TranscriptFileUri] provides you with a temporary URI you can use for secure access to your subtitle file.\n  \n    Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an [AccesDenied] error, you can get a new temporary URI by running a [GetTranscriptionJob] or [ListTranscriptionJob] request.\n    \n     "];
  formats: subtitle_format list option
    [@ocaml.doc
      "Provides the format of your subtitle files. If your request included both WebVTT ([vtt]) and SubRip ([srt]) formats, both formats are shown.\n"]}
[@@ocaml.doc
  "Provides information about your subtitle file, including format, start index, and Amazon S3 location.\n"]
type nonrec language_id_settings =
  {
  language_model_name: string option
    [@ocaml.doc
      "The name of the custom language model you want to use when processing your transcription job. Note that custom language model names are case sensitive.\n\n The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages do not match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.\n "];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to use when processing your transcription job. Custom vocabulary filter names are case sensitive.\n\n The language of the specified custom vocabulary filter must match the language code that you specify in your transcription request. If the languages do not match, the custom vocabulary filter isn't applied. There are no errors or warnings associated with a language mismatch.\n \n  Note that if you include [VocabularyFilterName] in your request, you must also include [VocabularyFilterMethod].\n  "];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you want to use when processing your transcription job. Custom vocabulary names are case sensitive.\n\n The language of the specified custom vocabulary must match the language code that you specify in your transcription request. If the languages do not match, the custom vocabulary isn't applied. There are no errors or warnings associated with a language mismatch.\n "]}
[@@ocaml.doc
  "If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]). Note that multi-language identification ([IdentifyMultipleLanguages]) doesn't support custom language models.\n\n  [LanguageIdSettings] supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.\n \n  It's recommended that you include [LanguageOptions] when using [LanguageIdSettings] to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in [en-US] but Amazon Transcribe determines that the language spoken in your media is [en-AU], your custom vocabulary {i is not} applied to your transcription. If you include [LanguageOptions] and include [en-US] as the only English language dialect, your custom vocabulary {i is} applied to your transcription.\n  \n   If you want to include a custom language model with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [LanguageModelName] sub-parameter. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [VocabularyName] or [VocabularyFilterName] (or both) sub-parameter.\n   "]
type nonrec language_id_settings_map =
  (language_code * language_id_settings) list[@@ocaml.doc ""]
type nonrec transcription_job =
  {
  toxicity_detection: toxicity_detection_settings list option
    [@ocaml.doc
      "Provides information about the toxicity detection settings applied to your transcription.\n"];
  language_id_settings: language_id_settings_map option
    [@ocaml.doc
      "Provides the name and language of all custom language models, custom vocabularies, and custom vocabulary filters that you included in your request.\n"];
  subtitles: subtitles_output option
    [@ocaml.doc
      "Indicates whether subtitles were generated with your transcription.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tags, each in the form of a key:value pair, assigned to the specified transcription job.\n"];
  language_codes: language_code_item list option
    [@ocaml.doc
      "The language codes used to create your transcription job. This parameter is used with multi-language identification. For single-language identification requests, refer to the singular version of this parameter, [LanguageCode].\n"];
  identified_language_score: float option
    [@ocaml.doc
      "The confidence score associated with the language identified in your media file.\n\n Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.\n "];
  language_options: language_code list option
    [@ocaml.doc
      "Provides the language codes you specified in your request.\n"];
  identify_multiple_languages: bool option
    [@ocaml.doc
      "Indicates whether automatic multi-language identification was enabled ([TRUE]) for the specified transcription job.\n"];
  identify_language: bool option
    [@ocaml.doc
      "Indicates whether automatic language identification was enabled ([TRUE]) for the specified transcription job.\n"];
  content_redaction: content_redaction option
    [@ocaml.doc
      "Indicates whether redaction was enabled in your transcript.\n"];
  job_execution_settings: job_execution_settings option
    [@ocaml.doc
      "Provides information about how your transcription job was processed. This parameter shows if your request was queued and what data access role was used.\n"];
  model_settings: model_settings option
    [@ocaml.doc
      "Provides information on the custom language model you included in your request.\n"];
  settings: settings option
    [@ocaml.doc
      "Provides information on any additional settings that were included in your request. Additional settings include channel identification, alternative transcriptions, speaker partitioning, custom vocabularies, and custom vocabulary filters.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job request failed.\n\n The [FailureReason] field contains one of the following values:\n \n  {ul\n        {-   [Unsupported media format].\n            \n             The media format specified in [MediaFormat] isn't valid. Refer to refer to the [MediaFormat] parameter for a list of supported formats.\n             \n              }\n        {-   [The media format provided does not match the detected media\n                        format].\n            \n             The media format specified in [MediaFormat] doesn't match the format of the input file. Check the media format of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid sample rate for audio file].\n            \n             The sample rate specified in [MediaSampleRateHertz] isn't valid. The sample rate must be between 8,000 and 48,000 hertz.\n             \n              }\n        {-   [The sample rate provided does not match the detected sample\n                    rate].\n            \n             The sample rate specified in [MediaSampleRateHertz] doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid file size: file size too large].\n            \n             The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        {-   [Invalid number of channels: number of channels too large].\n            \n             Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        }\n  "];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified transcription job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified transcription job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified transcription job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  transcript: transcript option
    [@ocaml.doc
      "Provides you with the Amazon S3 URI you can use to access your transcript.\n"];
  media: media option
    [@ocaml.doc
      "Provides the Amazon S3 location of the media file you used in your request.\n"];
  media_format: media_format option
    [@ocaml.doc "The format of the input media file.\n"];
  media_sample_rate_hertz: int option
    [@ocaml.doc
      "The sample rate, in hertz, of the audio track in your input media file.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your transcription job. This parameter is used with single-language identification. For multi-language identification requests, refer to the plural version of this parameter, [LanguageCodes].\n"];
  transcription_job_status: transcription_job_status option
    [@ocaml.doc
      "Provides the status of the specified transcription job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri] (or [RedactedTranscriptFileUri], if you requested transcript redaction). If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  transcription_job_name: string option
    [@ocaml.doc
      "The name of the transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a transcription job.\n\n To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].\n  "]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource you want to tag. ARNs have the format [arn:partition:service:region:account-id:resource-type/resource-id].\n\n For example, [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].\n \n  Valid values for [resource-type] are: [transcription-job], [medical-transcription-job], [vocabulary], [medical-vocabulary], [vocabulary-filter], and [language-model].\n  "]}
[@@ocaml.doc ""]
type nonrec start_transcription_job_response =
  {
  transcription_job: transcription_job option
    [@ocaml.doc
      "Provides detailed information about the current transcription job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec kms_encryption_context_map = (string * string) list[@@ocaml.doc
                                                                 ""]
type nonrec subtitles =
  {
  output_start_index: int option
    [@ocaml.doc
      "Specify the starting value that is assigned to the first subtitle segment.\n\n The default start index for Amazon Transcribe is [0], which differs from the more widely used standard of [1]. If you're uncertain which value to use, we recommend choosing [1], as this may improve compatibility with other services.\n "];
  formats: subtitle_format list option
    [@ocaml.doc
      "Specify the output format for your subtitle file; if you select both WebVTT ([vtt]) and SubRip ([srt]) formats, two output files are generated.\n"]}
[@@ocaml.doc
  "Generate subtitles for your media file with your transcription request.\n\n You can choose a start index of 0 or 1, and you can specify either WebVTT or SubRip (or both) as your output format.\n \n  Note that your subtitle files are placed in the same location as your transcription output.\n  "]
type nonrec start_transcription_job_request =
  {
  toxicity_detection: toxicity_detection_settings list option
    [@ocaml.doc
      "Enables toxic speech detection in your transcript. If you include [ToxicityDetection] in your request, you must also include [ToxicityCategories].\n\n For information on the types of toxic speech Amazon Transcribe can detect, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/toxic-language.html}Detecting toxic speech}.\n "];
  language_id_settings: language_id_settings_map option
    [@ocaml.doc
      "If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]). Note that multi-language identification ([IdentifyMultipleLanguages]) doesn't support custom language models.\n\n  [LanguageIdSettings] supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.\n \n  It's recommended that you include [LanguageOptions] when using [LanguageIdSettings] to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in [en-US] but Amazon Transcribe determines that the language spoken in your media is [en-AU], your custom vocabulary {i is not} applied to your transcription. If you include [LanguageOptions] and include [en-US] as the only English language dialect, your custom vocabulary {i is} applied to your transcription.\n  \n   If you want to include a custom language model with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [LanguageModelName] sub-parameter. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [VocabularyName] or [VocabularyFilterName] (or both) sub-parameter.\n   "];
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new transcription job at the time you start this new job.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  subtitles: subtitles option
    [@ocaml.doc
      "Produces subtitle files for your input media. You can specify WebVTT (*.vtt) and SubRip (*.srt) formats.\n"];
  language_options: language_code list option
    [@ocaml.doc
      "You can specify two or more language codes that represent the languages you think may be present in your media. Including more than five is not recommended. If you're unsure what languages are present, do not include this parameter.\n\n If you include [LanguageOptions] in your request, you must also include [IdentifyLanguage].\n \n  For more information, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages}.\n  \n   To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file must be encoded at a sample rate of 16,000 Hz or higher.\n   "];
  identify_multiple_languages: bool option
    [@ocaml.doc
      "Enables automatic multi-language identification in your transcription job request. Use this parameter if your media file contains more than one language. If your media contains only one language, use [IdentifyLanguage] instead.\n\n If you include [IdentifyMultipleLanguages], you can optionally include a list of language codes, using [LanguageOptions], that you think may be present in your media file. Including [LanguageOptions] restricts [IdentifyLanguage] to only the language options that you specify, which can improve transcription accuracy.\n \n  If you want to apply a custom vocabulary or a custom vocabulary filter to your automatic language identification request, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName] and [VocabularyFilterName]). If you include [LanguageIdSettings], also include [LanguageOptions].\n  \n   Note that you must include one of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages] in your request. If you include more than one of these parameters, your transcription job fails.\n   "];
  identify_language: bool option
    [@ocaml.doc
      "Enables automatic language identification in your transcription job request. Use this parameter if your media file contains only one language. If your media contains multiple languages, use [IdentifyMultipleLanguages] instead.\n\n If you include [IdentifyLanguage], you can optionally include a list of language codes, using [LanguageOptions], that you think may be present in your media file. Including [LanguageOptions] restricts [IdentifyLanguage] to only the language options that you specify, which can improve transcription accuracy.\n \n  If you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter to your automatic language identification request, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]). If you include [LanguageIdSettings], also include [LanguageOptions].\n  \n   Note that you must include one of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages] in your request. If you include more than one of these parameters, your transcription job fails.\n   "];
  content_redaction: content_redaction option
    [@ocaml.doc
      "Makes it possible to redact or flag specified personally identifiable information (PII) in your transcript. If you use [ContentRedaction], you must also include the sub-parameters: [RedactionOutput] and [RedactionType]. You can optionally include [PiiEntityTypes] to choose which types of PII you want to redact. If you do not include [PiiEntityTypes] in your request, all PII is redacted.\n"];
  job_execution_settings: job_execution_settings option
    [@ocaml.doc
      "Makes it possible to control how your transcription job is processed. Currently, the only [JobExecutionSettings] modification you can choose is enabling job queueing using the [AllowDeferredExecution] sub-parameter.\n\n If you include [JobExecutionSettings] in your request, you must also include the sub-parameters: [AllowDeferredExecution] and [DataAccessRoleArn].\n "];
  model_settings: model_settings option
    [@ocaml.doc
      "Specify the custom language model you want to include with your transcription job. If you include [ModelSettings] in your request, you must include the [LanguageModelName] sub-parameter.\n\n For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html}Custom language models}.\n "];
  settings: settings option
    [@ocaml.doc
      "Specify additional optional settings in your request, including channel identification, alternative transcriptions, speaker partitioning. You can use that to apply custom vocabularies and vocabulary filters.\n\n If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but {b do not} want to use automatic language identification, use [Settings] with the [VocabularyName] or [VocabularyFilterName] (or both) sub-parameter.\n \n  If you're using automatic language identification with your request and want to include a custom language model, a custom vocabulary, or a custom vocabulary filter, use instead the  parameter with the [LanguageModelName], [VocabularyName] or [VocabularyFilterName] sub-parameters.\n  "];
  kms_encryption_context: kms_encryption_context_map option
    [@ocaml.doc
      "A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data. For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context}KMS encryption context} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html}Asymmetric keys in KMS}.\n"];
  output_encryption_kms_key_id: string option
    [@ocaml.doc
      "The KMS key you want to use to encrypt your transcription output.\n\n If using a key located in the {b current} Amazon Web Services account, you can specify your KMS key in one of four ways:\n \n  {ol\n        {-  Use the KMS key ID itself. For example, [1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use an alias for the KMS key ID. For example, [alias/ExampleAlias].\n            \n             }\n        {-  Use the Amazon Resource Name (ARN) for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n            \n             }\n        }\n   If using a key located in a {b different} Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:\n   \n    {ol\n          {-  Use the ARN for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n              \n               }\n          {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n              \n               }\n          }\n   If you do not specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).\n   \n    If you specify a KMS key to encrypt your output, you must also specify an output location using the [OutputLocation] parameter.\n    \n     Note that the role making the request must have permission to use the specified KMS key.\n     "];
  output_key: string option
    [@ocaml.doc
      "Use in combination with [OutputBucketName] to specify the output location of your transcript and, optionally, a unique name for your output file. The default name for your transcription output is the same as the name you specified for your transcription job ([TranscriptionJobName]).\n\n Here are some examples of how you can use [OutputKey]:\n \n  {ul\n        {-  If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName] and 'my-transcript.json' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript.json].\n            \n             }\n        {-  If you specify 'my-first-transcription' as the [TranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName], and 'my-transcript' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json].\n            \n             }\n        {-  If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName] and 'test-files/my-transcript.json' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json].\n            \n             }\n        {-  If you specify 'my-first-transcription' as the [TranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName], and 'test-files/my-transcript' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json].\n            \n             }\n        }\n   If you specify the name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.\n   "];
  output_bucket_name: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where you want your transcription output stored. Do not include the [S3://] prefix of the specified bucket.\n\n If you want your output to go to a sub-folder of this bucket, specify it using the [OutputKey] parameter; [OutputBucketName] only accepts the name of a bucket.\n \n  For example, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET], set [OutputBucketName] to [DOC-EXAMPLE-BUCKET]. However, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET/test-files/], set [OutputBucketName] to [DOC-EXAMPLE-BUCKET] and [OutputKey] to [test-files/].\n  \n   Note that Amazon Transcribe must have permission to use the specified location. You can change Amazon S3 permissions using the {{:https://console.aws.amazon.com/s3}Amazon Web Services Management Console}. See also {{:https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user}Permissions Required for IAM User Roles}.\n   \n    If you do not specify [OutputBucketName], your transcript is placed in a service-managed Amazon S3 bucket and you are provided with a URI to access your transcript.\n    "];
  media: media
    [@ocaml.doc
      "Describes the Amazon S3 location of the media file you want to use in your request.\n"];
  media_format: media_format option
    [@ocaml.doc "Specify the format of your input media file.\n"];
  media_sample_rate_hertz: int option
    [@ocaml.doc
      "The sample rate, in hertz, of the audio track in your input media file.\n\n If you do not specify the media sample rate, Amazon Transcribe determines it for you. If you specify the sample rate, it must match the rate detected by Amazon Transcribe. If there's a mismatch between the value that you specify and the value detected, your job fails. In most cases, you can omit [MediaSampleRateHertz] and let Amazon Transcribe determine the sample rate.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code that represents the language spoken in the input media file.\n\n If you're unsure of the language spoken in your media file, consider using [IdentifyLanguage] or [IdentifyMultipleLanguages] to enable automatic language identification.\n \n  Note that you must include one of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages] in your request. If you include more than one of these parameters, your transcription job fails.\n  \n   For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n   \n     To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file must be encoded at a sample rate of 16,000 Hz or higher.\n     \n      "];
  transcription_job_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your transcription job. The name that you specify is also used as the default name of your transcription output file. If you want to specify a different name for your transcription output, use the [OutputKey] parameter.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec medical_transcript =
  {
  transcript_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of your transcript. You can use this URI to access or download your transcript.\n\n Note that this is the Amazon S3 location you specified in your request using the [OutputBucketName] parameter.\n "]}
[@@ocaml.doc
  "Provides you with the Amazon S3 URI you can use to access your transcript.\n"]
type nonrec medical_transcription_setting =
  {
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you want to use when processing your medical transcription job. Custom vocabulary names are case sensitive.\n\n The language of the specified custom vocabulary must match the language code that you specify in your transcription request. If the languages do not match, the custom vocabulary isn't applied. There are no errors or warnings associated with a language mismatch. US English ([en-US]) is the only valid language for Amazon Transcribe Medical.\n "];
  max_alternatives: int option
    [@ocaml.doc
      "Indicate the maximum number of alternative transcriptions you want Amazon Transcribe Medical to include in your transcript.\n\n If you select a number greater than the number of alternative transcriptions generated by Amazon Transcribe Medical, only the actual number of alternative transcriptions are included.\n \n  If you include [MaxAlternatives] in your request, you must also include [ShowAlternatives] with a value of [true].\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html}Alternative transcriptions}.\n   "];
  show_alternatives: bool option
    [@ocaml.doc
      "To include alternative transcriptions within your transcription output, include [ShowAlternatives] in your transcription request.\n\n If you include [ShowAlternatives], you must also include [MaxAlternatives], which is the maximum number of alternative transcriptions you want Amazon Transcribe Medical to generate.\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html}Alternative transcriptions}.\n  "];
  channel_identification: bool option
    [@ocaml.doc
      "Enables channel identification in multi-channel audio.\n\n Channel identification transcribes the audio on each channel independently, then appends the output for each channel into one transcript.\n \n  If you have multi-channel audio and do not enable channel identification, your audio is transcribed in a continuous manner and your transcript does not separate the speech by channel.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html}Transcribing multi-channel audio}.\n   "];
  max_speaker_labels: int option
    [@ocaml.doc
      "Specify the maximum number of speakers you want to partition in your media.\n\n Note that if your media contains more speakers than the specified number, multiple speakers are treated as a single speaker.\n \n  If you specify the [MaxSpeakerLabels] field, you must set the [ShowSpeakerLabels] field to true.\n  "];
  show_speaker_labels: bool option
    [@ocaml.doc
      "Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels the speech from individual speakers in your media file.\n\n If you enable [ShowSpeakerLabels] in your request, you must also include [MaxSpeakerLabels].\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html}Partitioning speakers (diarization)}.\n  "]}
[@@ocaml.doc
  "Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your medical transcription job.\n"]
type nonrec medical_content_identification_type =
  | PHI [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec specialty =
  | PRIMARYCARE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec medical_transcription_job =
  {
  tags: tag list option
    [@ocaml.doc
      "The tags, each in the form of a key:value pair, assigned to the specified medical transcription job.\n"];
  type_: type_ option
    [@ocaml.doc
      "Indicates whether the input media is a dictation or a conversation, as specified in the [StartMedicalTranscriptionJob] request.\n"];
  specialty: specialty option
    [@ocaml.doc
      "Describes the medical specialty represented in your media.\n"];
  content_identification_type: medical_content_identification_type option
    [@ocaml.doc
      "Indicates whether content identification was enabled for your transcription request.\n"];
  settings: medical_transcription_setting option
    [@ocaml.doc
      "Provides information on any additional settings that were included in your request. Additional settings include channel identification, alternative transcriptions, speaker partitioning, custom vocabularies, and custom vocabulary filters.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job request failed.\n\n The [FailureReason] field contains one of the following values:\n \n  {ul\n        {-   [Unsupported media format].\n            \n             The media format specified in [MediaFormat] isn't valid. Refer to refer to the [MediaFormat] parameter for a list of supported formats.\n             \n              }\n        {-   [The media format provided does not match the detected media\n                        format].\n            \n             The media format specified in [MediaFormat] doesn't match the format of the input file. Check the media format of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid sample rate for audio file].\n            \n             The sample rate specified in [MediaSampleRateHertz] isn't valid. The sample rate must be between 16,000 and 48,000 hertz.\n             \n              }\n        {-   [The sample rate provided does not match the detected sample\n                    rate].\n            \n             The sample rate specified in [MediaSampleRateHertz] doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid file size: file size too large].\n            \n             The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        {-   [Invalid number of channels: number of channels too large].\n            \n             Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        }\n  "];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified medical transcription job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified medical transcription job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified medical transcription job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  transcript: medical_transcript option
    [@ocaml.doc
      "Provides you with the Amazon S3 URI you can use to access your transcript.\n"];
  media: media option [@ocaml.doc ""];
  media_format: media_format option
    [@ocaml.doc "The format of the input media file.\n"];
  media_sample_rate_hertz: int option
    [@ocaml.doc
      "The sample rate, in hertz, of the audio track in your input media file.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your medical transcription job. US English ([en-US]) is the only supported language for medical transcriptions.\n"];
  transcription_job_status: transcription_job_status option
    [@ocaml.doc
      "Provides the status of the specified medical transcription job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  medical_transcription_job_name: string option
    [@ocaml.doc
      "The name of the medical transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a medical transcription job.\n\n To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "]
type nonrec start_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option
    [@ocaml.doc
      "Provides detailed information about the current medical transcription job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec start_medical_transcription_job_request =
  {
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new medical transcription job at the time you start this new job.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  type_: type_
    [@ocaml.doc
      "Specify whether your input media contains only one person ([DICTATION]) or contains a conversation between two people ([CONVERSATION]).\n\n For example, [DICTATION] could be used for a medical professional wanting to transcribe voice memos; [CONVERSATION] could be used for transcribing the doctor-patient dialogue during the patient's office visit.\n "];
  specialty: specialty
    [@ocaml.doc
      "Specify the predominant medical specialty represented in your media. For batch transcriptions, [PRIMARYCARE] is the only valid value. If you require additional specialties, refer to .\n"];
  content_identification_type: medical_content_identification_type option
    [@ocaml.doc
      "Labels all personal health information (PHI) identified in your transcript. For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html}Identifying personal health information (PHI) in a transcription}.\n"];
  settings: medical_transcription_setting option
    [@ocaml.doc
      "Specify additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your transcription job.\n"];
  kms_encryption_context: kms_encryption_context_map option
    [@ocaml.doc
      "A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data. For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context}KMS encryption context} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html}Asymmetric keys in KMS}.\n"];
  output_encryption_kms_key_id: string option
    [@ocaml.doc
      "The KMS key you want to use to encrypt your medical transcription output.\n\n If using a key located in the {b current} Amazon Web Services account, you can specify your KMS key in one of four ways:\n \n  {ol\n        {-  Use the KMS key ID itself. For example, [1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use an alias for the KMS key ID. For example, [alias/ExampleAlias].\n            \n             }\n        {-  Use the Amazon Resource Name (ARN) for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n            \n             }\n        }\n   If using a key located in a {b different} Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:\n   \n    {ol\n          {-  Use the ARN for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n              \n               }\n          {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n              \n               }\n          }\n   If you do not specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).\n   \n    If you specify a KMS key to encrypt your output, you must also specify an output location using the [OutputLocation] parameter.\n    \n     Note that the role making the request must have permission to use the specified KMS key.\n     "];
  output_key: string option
    [@ocaml.doc
      "Use in combination with [OutputBucketName] to specify the output location of your transcript and, optionally, a unique name for your output file. The default name for your transcription output is the same as the name you specified for your medical transcription job ([MedicalTranscriptionJobName]).\n\n Here are some examples of how you can use [OutputKey]:\n \n  {ul\n        {-  If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName] and 'my-transcript.json' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript.json].\n            \n             }\n        {-  If you specify 'my-first-transcription' as the [MedicalTranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName], and 'my-transcript' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json].\n            \n             }\n        {-  If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName] and 'test-files/my-transcript.json' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json].\n            \n             }\n        {-  If you specify 'my-first-transcription' as the [MedicalTranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName], and 'test-files/my-transcript' as the [OutputKey], your transcription output path is [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json].\n            \n             }\n        }\n   If you specify the name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.\n   "];
  output_bucket_name: string
    [@ocaml.doc
      "The name of the Amazon S3 bucket where you want your medical transcription output stored. Do not include the [S3://] prefix of the specified bucket.\n\n If you want your output to go to a sub-folder of this bucket, specify it using the [OutputKey] parameter; [OutputBucketName] only accepts the name of a bucket.\n \n  For example, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET], set [OutputBucketName] to [DOC-EXAMPLE-BUCKET]. However, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET/test-files/], set [OutputBucketName] to [DOC-EXAMPLE-BUCKET] and [OutputKey] to [test-files/].\n  \n   Note that Amazon Transcribe must have permission to use the specified location. You can change Amazon S3 permissions using the {{:https://console.aws.amazon.com/s3}Amazon Web Services Management Console}. See also {{:https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user}Permissions Required for IAM User Roles}.\n   "];
  media: media [@ocaml.doc ""];
  media_format: media_format option
    [@ocaml.doc "Specify the format of your input media file.\n"];
  media_sample_rate_hertz: int option
    [@ocaml.doc
      "The sample rate, in hertz, of the audio track in your input media file.\n\n If you do not specify the media sample rate, Amazon Transcribe Medical determines it for you. If you specify the sample rate, it must match the rate detected by Amazon Transcribe Medical; if there's a mismatch between the value that you specify and the value detected, your job fails. Therefore, in most cases, it's advised to omit [MediaSampleRateHertz] and let Amazon Transcribe Medical determine the sample rate.\n "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language spoken in the input media file. US English ([en-US]) is the only valid value for medical transcription jobs. Any other value you enter for language code results in a [BadRequestException] error.\n"];
  medical_transcription_job_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your medical transcription job. The name that you specify is also used as the default name of your transcription output file. If you want to specify a different name for your transcription output, use the [OutputKey] parameter.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec medical_scribe_job_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec medical_scribe_language_code =
  | EN_US [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec medical_scribe_output =
  {
  clinical_document_uri: string
    [@ocaml.doc "Holds the Amazon S3 URI for the Clinical Document.\n"];
  transcript_file_uri: string
    [@ocaml.doc "Holds the Amazon S3 URI for the Transcript.\n"]}[@@ocaml.doc
                                                                   "The location of the output of your Medical Scribe job. [ClinicalDocumentUri] holds the Amazon S3 URI for the Clinical Document and [TranscriptFileUri] holds the Amazon S3 URI for the Transcript.\n"]
type nonrec medical_scribe_settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option
    [@ocaml.doc
      "Specify how you want your custom vocabulary filter applied to your transcript.\n\n To replace words with [***], choose [mask].\n \n  To delete words, choose [remove].\n  \n   To flag words without changing them, choose [tag].\n   "];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to include in your Medical Scribe request. Custom vocabulary filter names are case sensitive.\n\n Note that if you include [VocabularyFilterName] in your request, you must also include [VocabularyFilterMethod].\n "];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you want to include in your Medical Scribe request. Custom vocabulary names are case sensitive.\n"];
  channel_identification: bool option
    [@ocaml.doc
      "Enables channel identification in multi-channel audio.\n\n Channel identification transcribes the audio on each channel independently, then appends the output for each channel into one transcript.\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html}Transcribing multi-channel audio}.\n  "];
  max_speaker_labels: int option
    [@ocaml.doc
      "Specify the maximum number of speakers you want to partition in your media.\n\n Note that if your media contains more speakers than the specified number, multiple speakers are treated as a single speaker.\n \n  If you specify the [MaxSpeakerLabels] field, you must set the [ShowSpeakerLabels] field to true.\n  "];
  show_speaker_labels: bool option
    [@ocaml.doc
      "Enables speaker partitioning (diarization) in your Medical Scribe output. Speaker partitioning labels the speech from individual speakers in your media file.\n\n If you enable [ShowSpeakerLabels] in your request, you must also include [MaxSpeakerLabels].\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html}Partitioning speakers (diarization)}.\n  "]}
[@@ocaml.doc
  "Makes it possible to control how your Medical Scribe job is processed using a [MedicalScribeSettings] object. Specify [ChannelIdentification] if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if [ChannelIdentification] and [ChannelDefinitions] are not set. One and only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set. If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use [Settings] to specify a vocabulary or vocabulary filter or both using [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must be specified if [VocabularyFilterName] is set. \n"]
type nonrec medical_scribe_participant_role =
  | CLINICIAN [@ocaml.doc ""]
  | PATIENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec medical_scribe_channel_definition =
  {
  participant_role: medical_scribe_participant_role
    [@ocaml.doc
      "Specify the participant that you want to flag. The options are [CLINICIAN] and [PATIENT] \n"];
  channel_id: int
    [@ocaml.doc "Specify the audio channel you want to define.\n"]}[@@ocaml.doc
                                                                    "Indicates which speaker is on which channel. The options are [CLINICIAN] and [PATIENT] \n"]
type nonrec medical_scribe_job =
  {
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to the Medica Scribe job.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  channel_definitions: medical_scribe_channel_definition list option
    [@ocaml.doc
      "Makes it possible to specify which speaker is on which channel. For example, if the clinician is the first participant to speak, you would set [ChannelId] of the first [ChannelDefinition] in the list to [0] (to indicate the first channel) and [ParticipantRole] to [CLINICIAN] (to indicate that it's the clinician speaking). Then you would set the [ChannelId] of the second [ChannelDefinition] in the list to [1] (to indicate the second channel) and [ParticipantRole] to [PATIENT] (to indicate that it's the patient speaking). \n"];
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files, write to the output bucket, and use your KMS key if supplied. If the role that you specify doesn\226\128\153t have the appropriate permissions your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  settings: medical_scribe_settings option
    [@ocaml.doc
      "Makes it possible to control how your Medical Scribe job is processed using a [MedicalScribeSettings] object. Specify [ChannelIdentification] if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if [ChannelIdentification] and [ChannelDefinitions] are not set. One and only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set. If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use [Settings] to specify a vocabulary or vocabulary filter or both using [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must be specified if [VocabularyFilterName] is set. \n"];
  failure_reason: string option
    [@ocaml.doc
      "If [MedicalScribeJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Medical Scribe job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Medical Scribe job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time your Medical Scribe job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  medical_scribe_output: medical_scribe_output option
    [@ocaml.doc
      "The location of the output of your Medical Scribe job. [ClinicalDocumentUri] holds the Amazon S3 URI for the Clinical Document and [TranscriptFileUri] holds the Amazon S3 URI for the Transcript.\n"];
  media: media option [@ocaml.doc ""];
  language_code: medical_scribe_language_code option
    [@ocaml.doc
      "The language code used to create your Medical Scribe job. US English ([en-US]) is the only supported language for Medical Scribe jobs. \n"];
  medical_scribe_job_status: medical_scribe_job_status option
    [@ocaml.doc
      "Provides the status of the specified Medical Scribe job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [MedicalScribeOutput] If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n "];
  medical_scribe_job_name: string option
    [@ocaml.doc
      "The name of the Medical Scribe job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a Medical Scribe job.\n\n To view the status of the specified Medical Scribe job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the locations specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n "]
type nonrec start_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option
    [@ocaml.doc
      "Provides detailed information about the current Medical Scribe job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec start_medical_scribe_job_request =
  {
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to the Medica Scribe job.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  channel_definitions: medical_scribe_channel_definition list option
    [@ocaml.doc
      "Makes it possible to specify which speaker is on which channel. For example, if the clinician is the first participant to speak, you would set [ChannelId] of the first [ChannelDefinition] in the list to [0] (to indicate the first channel) and [ParticipantRole] to [CLINICIAN] (to indicate that it's the clinician speaking). Then you would set the [ChannelId] of the second [ChannelDefinition] in the list to [1] (to indicate the second channel) and [ParticipantRole] to [PATIENT] (to indicate that it's the patient speaking). \n"];
  settings: medical_scribe_settings
    [@ocaml.doc
      "Makes it possible to control how your Medical Scribe job is processed using a [MedicalScribeSettings] object. Specify [ChannelIdentification] if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if [ChannelIdentification] and [ChannelDefinitions] are not set. One and only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set. If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use [Settings] to specify a vocabulary or vocabulary filter or both using [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must be specified if [VocabularyFilterName] is set. \n"];
  data_access_role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files, write to the output bucket, and use your KMS key if supplied. If the role that you specify doesn\226\128\153t have the appropriate permissions your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  kms_encryption_context: kms_encryption_context_map option
    [@ocaml.doc
      "A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data. For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context}KMS encryption context} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html}Asymmetric keys in KMS}.\n"];
  output_encryption_kms_key_id: string option
    [@ocaml.doc
      "The KMS key you want to use to encrypt your Medical Scribe output.\n\n If using a key located in the {b current} Amazon Web Services account, you can specify your KMS key in one of four ways:\n \n  {ol\n        {-  Use the KMS key ID itself. For example, [1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use an alias for the KMS key ID. For example, [alias/ExampleAlias].\n            \n             }\n        {-  Use the Amazon Resource Name (ARN) for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n            \n             }\n        }\n   If using a key located in a {b different} Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:\n   \n    {ol\n          {-  Use the ARN for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n              \n               }\n          {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n              \n               }\n          }\n   If you do not specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).\n   \n    Note that the role specified in the [DataAccessRoleArn] request parameter must have permission to use the specified KMS key.\n    "];
  output_bucket_name: string
    [@ocaml.doc
      "The name of the Amazon S3 bucket where you want your Medical Scribe output stored. Do not include the [S3://] prefix of the specified bucket.\n\n Note that the role specified in the [DataAccessRoleArn] request parameter must have permission to use the specified location. You can change Amazon S3 permissions using the {{:https://console.aws.amazon.com/s3}Amazon Web Services Management Console}. See also {{:https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user}Permissions Required for IAM User Roles}.\n "];
  media: media [@ocaml.doc ""];
  medical_scribe_job_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your Medical Scribe job.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec call_analytics_job_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec call_analytics_feature =
  | GENERATIVE_SUMMARIZATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec call_analytics_skipped_reason_code =
  | FAILED_SAFETY_GUIDELINES [@ocaml.doc ""]
  | INSUFFICIENT_CONVERSATION_CONTENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec call_analytics_skipped_feature =
  {
  message: string option
    [@ocaml.doc
      "Contains additional information or a message explaining why a specific analytics feature was skipped during the analysis of a call analytics job.\n"];
  reason_code: call_analytics_skipped_reason_code option
    [@ocaml.doc
      "Provides a code indicating the reason why a specific analytics feature was skipped during the analysis of a call analytics job.\n"];
  feature: call_analytics_feature option
    [@ocaml.doc
      "Indicates the type of analytics feature that was skipped during the analysis of a call analytics job.\n"]}
[@@ocaml.doc
  "Represents a skipped analytics feature during the analysis of a call analytics job.\n\n The [Feature] field indicates the type of analytics feature that was skipped.\n \n  The [Message] field contains additional information or a message explaining why the analytics feature was skipped.\n  \n   The [ReasonCode] field provides a code indicating the reason why the analytics feature was skipped.\n   "]
type nonrec call_analytics_job_details =
  {
  skipped: call_analytics_skipped_feature list option
    [@ocaml.doc
      "Contains information about any skipped analytics features during the analysis of a call analytics job.\n\n This array lists all the analytics features that were skipped, along with their corresponding reason code and message.\n "]}
[@@ocaml.doc
  "Contains details about a call analytics job, including information about skipped analytics features.\n"]
type nonrec summarization =
  {
  generate_abstractive_summary: bool
    [@ocaml.doc
      "Enables Generative call summarization in your Call Analytics request\n\n Generative call summarization provides a summary of the transcript including important components discussed in the conversation.\n \n  For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-enable-summarization.html}Enabling generative call summarization}.\n  "]}
[@@ocaml.doc
  "Contains [GenerateAbstractiveSummary], which is a required parameter if you want to enable Generative call summarization in your Call Analytics request.\n"]
type nonrec call_analytics_job_settings =
  {
  summarization: summarization option
    [@ocaml.doc
      "Contains [GenerateAbstractiveSummary], which is a required parameter if you want to enable Generative call summarization in your Call Analytics request.\n"];
  language_id_settings: language_id_settings_map option
    [@ocaml.doc
      "If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]).\n\n  [LanguageIdSettings] supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.\n \n  It's recommended that you include [LanguageOptions] when using [LanguageIdSettings] to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in [en-US] but Amazon Transcribe determines that the language spoken in your media is [en-AU], your custom vocabulary {i is not} applied to your transcription. If you include [LanguageOptions] and include [en-US] as the only English language dialect, your custom vocabulary {i is} applied to your transcription.\n  \n   If you want to include a custom language model, custom vocabulary, or custom vocabulary filter with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [LanguageModelName], [VocabularyName], or [VocabularyFilterName] sub-parameters.\n   \n    For a list of languages supported with Call Analytics, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages and language-specific features}.\n    "];
  language_options: language_code list option
    [@ocaml.doc
      "You can specify two or more language codes that represent the languages you think may be present in your media. Including more than five is not recommended. If you're unsure what languages are present, do not include this parameter.\n\n Including language options can improve the accuracy of language identification.\n \n  For a list of languages supported with Call Analytics, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n  \n   To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file must be encoded at a sample rate of 16,000 Hz or higher.\n   "];
  content_redaction: content_redaction option [@ocaml.doc ""];
  language_model_name: string option
    [@ocaml.doc
      "The name of the custom language model you want to use when processing your Call Analytics job. Note that custom language model names are case sensitive.\n\n The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages do not match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.\n "];
  vocabulary_filter_method: vocabulary_filter_method option
    [@ocaml.doc
      "Specify how you want your custom vocabulary filter applied to your transcript.\n\n To replace words with [***], choose [mask].\n \n  To delete words, choose [remove].\n  \n   To flag words without changing them, choose [tag].\n   "];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to include in your Call Analytics transcription request. Custom vocabulary filter names are case sensitive.\n\n Note that if you include [VocabularyFilterName] in your request, you must also include [VocabularyFilterMethod].\n "];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you want to include in your Call Analytics transcription request. Custom vocabulary names are case sensitive.\n"]}
[@@ocaml.doc
  "Provides additional optional settings for your request, including content redaction, automatic language identification; allows you to apply custom language models, custom vocabulary filters, and custom vocabularies.\n"]
type nonrec channel_definition =
  {
  participant_role: participant_role option
    [@ocaml.doc
      "Specify the speaker you want to define. Omitting this parameter is equivalent to specifying both participants.\n"];
  channel_id: int option
    [@ocaml.doc "Specify the audio channel you want to define.\n"]}[@@ocaml.doc
                                                                    "Makes it possible to specify which speaker is on which channel. For example, if your agent is the first participant to speak, you would set [ChannelId] to [0] (to indicate the first channel) and [ParticipantRole] to [AGENT] (to indicate that it's the agent speaking).\n"]
type nonrec call_analytics_job =
  {
  channel_definitions: channel_definition list option
    [@ocaml.doc "Indicates which speaker is on which channel.\n"];
  settings: call_analytics_job_settings option
    [@ocaml.doc
      "Provides information on any additional settings that were included in your request. Additional settings include content redaction and language identification settings.\n"];
  identified_language_score: float option
    [@ocaml.doc
      "The confidence score associated with the language identified in your media file.\n\n Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.\n "];
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) you included in your request.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [CallAnalyticsJobStatus] is [FAILED], [FailureReason] contains information about why the Call Analytics job request failed.\n\n The [FailureReason] field contains one of the following values:\n \n  {ul\n        {-   [Unsupported media format].\n            \n             The media format specified in [MediaFormat] isn't valid. Refer to refer to the [MediaFormat] parameter for a list of supported formats.\n             \n              }\n        {-   [The media format provided does not match the detected media\n                        format].\n            \n             The media format specified in [MediaFormat] doesn't match the format of the input file. Check the media format of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid sample rate for audio file].\n            \n             The sample rate specified in [MediaSampleRateHertz] isn't valid. The sample rate must be between 8,000 and 48,000 hertz.\n             \n              }\n        {-   [The sample rate provided does not match the detected sample\n                    rate].\n            \n             The sample rate specified in [MediaSampleRateHertz] doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.\n             \n              }\n        {-   [Invalid file size: file size too large].\n            \n             The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        {-   [Invalid number of channels: number of channels too large].\n            \n             Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe}Service quotas}.\n             \n              }\n        }\n  "];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  transcript: transcript option [@ocaml.doc ""];
  media: media option
    [@ocaml.doc
      "Provides the Amazon S3 location of the media file you used in your Call Analytics request.\n"];
  media_format: media_format option
    [@ocaml.doc "The format of the input media file.\n"];
  media_sample_rate_hertz: int option
    [@ocaml.doc
      "The sample rate, in hertz, of the audio track in your input media file.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your Call Analytics job. For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n\n If you do not know the language spoken in your media file, you can omit this field and let Amazon Transcribe automatically identify the language of your media. To improve the accuracy of language identification, you can include several language codes and Amazon Transcribe chooses the closest match for your transcription.\n "];
  call_analytics_job_details: call_analytics_job_details option
    [@ocaml.doc
      "Provides detailed information about a call analytics job, including information about skipped analytics features.\n"];
  call_analytics_job_status: call_analytics_job_status option
    [@ocaml.doc
      "Provides the status of the specified Call Analytics job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri] (or [RedactedTranscriptFileUri], if you requested transcript redaction). If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  call_analytics_job_name: string option
    [@ocaml.doc
      "The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a Call Analytics job.\n\n To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].\n  \n   If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in the [RedactedMediaFileUri] field of your response.\n   "]
type nonrec start_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option
    [@ocaml.doc
      "Provides detailed information about the current Call Analytics job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec start_call_analytics_job_request =
  {
  channel_definitions: channel_definition list option
    [@ocaml.doc
      "Makes it possible to specify which speaker is on which channel. For example, if your agent is the first participant to speak, you would set [ChannelId] to [0] (to indicate the first channel) and [ParticipantRole] to [AGENT] (to indicate that it's the agent speaking).\n"];
  settings: call_analytics_job_settings option
    [@ocaml.doc
      "Specify additional optional settings in your request, including content redaction; allows you to apply custom language models, vocabulary filters, and custom vocabularies to your Call Analytics job.\n"];
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  output_encryption_kms_key_id: string option
    [@ocaml.doc
      "The KMS key you want to use to encrypt your Call Analytics output.\n\n If using a key located in the {b current} Amazon Web Services account, you can specify your KMS key in one of four ways:\n \n  {ol\n        {-  Use the KMS key ID itself. For example, [1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use an alias for the KMS key ID. For example, [alias/ExampleAlias].\n            \n             }\n        {-  Use the Amazon Resource Name (ARN) for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n            \n             }\n        {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n            \n             }\n        }\n   If using a key located in a {b different} Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:\n   \n    {ol\n          {-  Use the ARN for the KMS key ID. For example, [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].\n              \n               }\n          {-  Use the ARN for the KMS key alias. For example, [arn:aws:kms:region:account-ID:alias/ExampleAlias].\n              \n               }\n          }\n   If you do not specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).\n   \n    If you specify a KMS key to encrypt your output, you must also specify an output location using the [OutputLocation] parameter.\n    \n     Note that the role making the request must have permission to use the specified KMS key.\n     "];
  output_location: string option
    [@ocaml.doc
      "The Amazon S3 location where you want your Call Analytics transcription output stored. You can use any of the following formats to specify the output location:\n\n {ol\n       {-  s3://DOC-EXAMPLE-BUCKET\n           \n            }\n       {-  s3://DOC-EXAMPLE-BUCKET/my-output-folder/\n           \n            }\n       {-  s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json\n           \n            }\n       }\n   Unless you specify a file name (option 3), the name of your output file has a default value that matches the name you specified for your transcription job using the [CallAnalyticsJobName] parameter.\n   \n    You can specify a KMS key to encrypt your output using the [OutputEncryptionKMSKeyId] parameter. If you do not specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption.\n    \n     If you do not specify [OutputLocation], your transcript is placed in a service-managed Amazon S3 bucket and you are provided with a URI to access your transcript.\n     "];
  media: media
    [@ocaml.doc
      "Describes the Amazon S3 location of the media file you want to use in your Call Analytics request.\n"];
  call_analytics_job_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your Call Analytics job.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec list_vocabulary_filters_response =
  {
  vocabulary_filters: vocabulary_filter_info list option
    [@ocaml.doc
      "Provides information about the custom vocabulary filters that match the criteria specified in your request.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec list_vocabulary_filters_request =
  {
  name_contains: string option
    [@ocaml.doc
      "Returns only the custom vocabulary filters that contain the specified string. The search is not case sensitive.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of custom vocabulary filters to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListVocabularyFilters] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec list_vocabularies_response =
  {
  vocabularies: vocabulary_info list option
    [@ocaml.doc
      "Provides information about the custom vocabularies that match the criteria specified in your request.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: vocabulary_state option
    [@ocaml.doc
      "Lists all custom vocabularies that have the status specified in your request. Vocabularies are ordered by creation date, with the newest vocabulary first.\n"]}
[@@ocaml.doc ""]
type nonrec list_vocabularies_request =
  {
  name_contains: string option
    [@ocaml.doc
      "Returns only the custom vocabularies that contain the specified string. The search is not case sensitive.\n"];
  state_equals: vocabulary_state option
    [@ocaml.doc
      "Returns only custom vocabularies with the specified state. Vocabularies are ordered by creation date, with the newest vocabulary first. If you do not include [StateEquals], all custom medical vocabularies are returned.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of custom vocabularies to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListVocabularies] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec list_transcription_jobs_response =
  {
  transcription_job_summaries: transcription_job_summary list option
    [@ocaml.doc "Provides a summary of information about each result.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: transcription_job_status option
    [@ocaml.doc
      "Lists all transcription jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.\n"]}
[@@ocaml.doc ""]
type nonrec list_transcription_jobs_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of transcription jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListTranscriptionJobs] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  job_name_contains: string option
    [@ocaml.doc
      "Returns only the transcription jobs that contain the specified string. The search is not case sensitive.\n"];
  status: transcription_job_status option
    [@ocaml.doc
      "Returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you do not include [Status], all transcription jobs are returned.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option
    [@ocaml.doc
      "Lists all tags associated with the given transcription job, vocabulary, model, or resource.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) specified in your request.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_arn: string
    [@ocaml.doc
      "Returns a list of all tags associated with the specified Amazon Resource Name (ARN). ARNs have the format [arn:partition:service:region:account-id:resource-type/resource-id].\n\n For example, [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].\n \n  Valid values for [resource-type] are: [transcription-job], [medical-transcription-job], [vocabulary], [medical-vocabulary], [vocabulary-filter], and [language-model].\n  "]}
[@@ocaml.doc ""]
type nonrec list_medical_vocabularies_response =
  {
  vocabularies: vocabulary_info list option
    [@ocaml.doc
      "Provides information about the custom medical vocabularies that match the criteria specified in your request.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: vocabulary_state option
    [@ocaml.doc
      "Lists all custom medical vocabularies that have the status specified in your request. Custom vocabularies are ordered by creation date, with the newest vocabulary first.\n"]}
[@@ocaml.doc ""]
type nonrec list_medical_vocabularies_request =
  {
  name_contains: string option
    [@ocaml.doc
      "Returns only the custom medical vocabularies that contain the specified string. The search is not case sensitive.\n"];
  state_equals: vocabulary_state option
    [@ocaml.doc
      "Returns only custom medical vocabularies with the specified state. Custom vocabularies are ordered by creation date, with the newest vocabulary first. If you do not include [StateEquals], all custom medical vocabularies are returned.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of custom medical vocabularies to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListMedicalVocabularies] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec medical_transcription_job_summary =
  {
  type_: type_ option
    [@ocaml.doc
      "Indicates whether the input media is a dictation or a conversation, as specified in the [StartMedicalTranscriptionJob] request.\n"];
  content_identification_type: medical_content_identification_type option
    [@ocaml.doc
      "Labels all personal health information (PHI) identified in your transcript. For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html}Identifying personal health information (PHI) in a transcription}.\n"];
  specialty: specialty option
    [@ocaml.doc
      "Provides the medical specialty represented in your media.\n"];
  output_location_type: output_location_type option
    [@ocaml.doc
      "Indicates where the specified medical transcription output is stored.\n\n If the value is [CUSTOMER_BUCKET], the location is the Amazon S3 bucket you specified using the [OutputBucketName] parameter in your request. If you also included [OutputKey] in your request, your output is located in the path you specified in your request.\n \n  If the value is [SERVICE_BUCKET], the location is a service-managed Amazon S3 bucket. To access a transcript stored in a service-managed bucket, use the URI shown in the [TranscriptFileUri] field.\n  "];
  failure_reason: string option
    [@ocaml.doc
      "If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  transcription_job_status: transcription_job_status option
    [@ocaml.doc
      "Provides the status of your medical transcription job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your medical transcription. US English ([en-US]) is the only supported language for medical transcriptions.\n"];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified medical transcription job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time your medical transcription job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified medical transcription job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  medical_transcription_job_name: string option
    [@ocaml.doc
      "The name of the medical transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a specific medical transcription job.\n"]
type nonrec list_medical_transcription_jobs_response =
  {
  medical_transcription_job_summaries:
    medical_transcription_job_summary list option
    [@ocaml.doc "Provides a summary of information about each result.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: transcription_job_status option
    [@ocaml.doc
      "Lists all medical transcription jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.\n"]}
[@@ocaml.doc ""]
type nonrec list_medical_transcription_jobs_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of medical transcription jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListMedicalTranscriptionJobs] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  job_name_contains: string option
    [@ocaml.doc
      "Returns only the medical transcription jobs that contain the specified string. The search is not case sensitive.\n"];
  status: transcription_job_status option
    [@ocaml.doc
      "Returns only medical transcription jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you do not include [Status], all medical transcription jobs are returned.\n"]}
[@@ocaml.doc ""]
type nonrec medical_scribe_job_summary =
  {
  failure_reason: string option
    [@ocaml.doc
      "If [MedicalScribeJobStatus] is [FAILED], [FailureReason] contains information about why the transcription job failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  medical_scribe_job_status: medical_scribe_job_status option
    [@ocaml.doc
      "Provides the status of the specified Medical Scribe job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [MedicalScribeOutput] If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n "];
  language_code: medical_scribe_language_code option
    [@ocaml.doc
      "The language code used to create your Medical Scribe job. US English ([en-US]) is the only supported language for Medical Scribe jobs. \n"];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Medical Scribe job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time your Medical Scribe job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Medical Scribe job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  medical_scribe_job_name: string option
    [@ocaml.doc
      "The name of the Medical Scribe job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a specific Medical Scribe job.\n"]
type nonrec list_medical_scribe_jobs_response =
  {
  medical_scribe_job_summaries: medical_scribe_job_summary list option
    [@ocaml.doc "Provides a summary of information about each result.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: medical_scribe_job_status option
    [@ocaml.doc
      "Lists all Medical Scribe jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.\n"]}
[@@ocaml.doc ""]
type nonrec list_medical_scribe_jobs_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of Medical Scribe jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListMedicalScribeJobs] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  job_name_contains: string option
    [@ocaml.doc
      "Returns only the Medical Scribe jobs that contain the specified string. The search is not case sensitive.\n"];
  status: medical_scribe_job_status option
    [@ocaml.doc
      "Returns only Medical Scribe jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you do not include [Status], all Medical Scribe jobs are returned.\n"]}
[@@ocaml.doc ""]
type nonrec clm_language_code =
  | JA_JP [@ocaml.doc ""]
  | DE_DE [@ocaml.doc ""]
  | EN_AU [@ocaml.doc ""]
  | EN_GB [@ocaml.doc ""]
  | ES_US [@ocaml.doc ""]
  | HI_IN [@ocaml.doc ""]
  | EN_US [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec base_model_name =
  | WIDE_BAND [@ocaml.doc ""]
  | NARROW_BAND [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec model_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec input_data_config =
  {
  data_access_role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  tuning_data_s3_uri: string option
    [@ocaml.doc
      "The Amazon S3 location (URI) of the text files you want to use to tune your custom language model.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-model-tuning-data/] \n "];
  s3_uri: string
    [@ocaml.doc
      "The Amazon S3 location (URI) of the text files you want to use to train your custom language model.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-model-training-data/] \n "]}
[@@ocaml.doc
  "Contains the Amazon S3 location of the training data you want to use to create a new custom language model, and permissions to access this location.\n\n When using [InputDataConfig], you must include these sub-parameters: [S3Uri] and [DataAccessRoleArn]. You can optionally include [TuningDataS3Uri].\n "]
type nonrec language_model =
  {
  input_data_config: input_data_config option
    [@ocaml.doc
      "The Amazon S3 location of the input files used to train and tune your custom language model, in addition to the data access role ARN (Amazon Resource Name) that has permissions to access these data.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [ModelStatus] is [FAILED], [FailureReason] contains information about why the custom language model request failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  upgrade_availability: bool option
    [@ocaml.doc
      "Shows if a more current base model is available for use with the specified custom language model.\n\n If [false], your custom language model is using the most up-to-date base model.\n \n  If [true], there is a newer base model available than the one your language model is using.\n  \n   Note that to update a base model, you must recreate the custom language model using the new base model. Base model upgrades for existing custom language models are not supported.\n   "];
  model_status: model_status option
    [@ocaml.doc
      "The status of the specified custom language model. When the status displays as [COMPLETED] the model is ready for use.\n"];
  base_model_name: base_model_name option
    [@ocaml.doc
      "The Amazon Transcribe standard language model, or base model, used to create your custom language model.\n"];
  language_code: clm_language_code option
    [@ocaml.doc
      "The language code used to create your custom language model. Each custom language model must contain terms in only one language, and the language you select for your custom language model must match the language of your training and tuning data.\n\n For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. Note that US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n "];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom language model was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom language model was created.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  model_name: string option
    [@ocaml.doc
      "A unique name, chosen by you, for your custom language model.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.\n "]}
[@@ocaml.doc
  "Provides information about a custom language model, including:\n\n {ul\n       {-  The base model name\n           \n            }\n       {-  When the model was created\n           \n            }\n       {-  The location of the files used to train the model\n           \n            }\n       {-  When the model was last modified\n           \n            }\n       {-  The name you chose for the model\n           \n            }\n       {-  The model's language\n           \n            }\n       {-  The model's processing state\n           \n            }\n       {-  Any available upgrades for the base model\n           \n            }\n       }\n  "]
type nonrec list_language_models_response =
  {
  models: language_model list option
    [@ocaml.doc
      "Provides information about the custom language models that match the criteria specified in your request.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec list_language_models_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of custom language models to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListLanguageModels] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  name_contains: string option
    [@ocaml.doc
      "Returns only the custom language models that contain the specified string. The search is not case sensitive.\n"];
  status_equals: model_status option
    [@ocaml.doc
      "Returns only custom language models with the specified status. Language models are ordered by creation date, with the newest model first. If you do not include [StatusEquals], all custom language models are returned.\n"]}
[@@ocaml.doc ""]
type nonrec call_analytics_job_summary =
  {
  failure_reason: string option
    [@ocaml.doc
      "If [CallAnalyticsJobStatus] is [FAILED], [FailureReason] contains information about why the Call Analytics job failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  call_analytics_job_details: call_analytics_job_details option
    [@ocaml.doc
      "Provides detailed information about a call analytics job, including information about skipped analytics features.\n"];
  call_analytics_job_status: call_analytics_job_status option
    [@ocaml.doc
      "Provides the status of your Call Analytics job.\n\n If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri] (or [RedactedTranscriptFileUri], if you requested transcript redaction). If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code used to create your Call Analytics transcription.\n"];
  completion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics job finished processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:33:13.922000-07:00] represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time your Call Analytics job began processing.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.789000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified Call Analytics job request was made.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.\n "];
  call_analytics_job_name: string option
    [@ocaml.doc
      "The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "Provides detailed information about a specific Call Analytics job.\n"]
type nonrec list_call_analytics_jobs_response =
  {
  call_analytics_job_summaries: call_analytics_job_summary list option
    [@ocaml.doc "Provides a summary of information about each result.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  status: call_analytics_job_status option
    [@ocaml.doc
      "Lists all Call Analytics jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.\n"]}
[@@ocaml.doc ""]
type nonrec list_call_analytics_jobs_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of Call Analytics jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListCallAnalyticsJobs] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"];
  job_name_contains: string option
    [@ocaml.doc
      "Returns only the Call Analytics jobs that contain the specified string. The search is not case sensitive.\n"];
  status: call_analytics_job_status option
    [@ocaml.doc
      "Returns only Call Analytics jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you do not include [Status], all Call Analytics jobs are returned.\n"]}
[@@ocaml.doc ""]
type nonrec list_call_analytics_categories_response =
  {
  categories: category_properties list option
    [@ocaml.doc
      "Provides detailed information about your Call Analytics categories, including all the rules associated with each category.\n"];
  next_token: string option
    [@ocaml.doc
      "If [NextToken] is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the [NextToken] parameter in your results output, then run your request again including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec list_call_analytics_categories_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of Call Analytics categories to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you do not specify a value, a default of 5 is used.\n"];
  next_token: string option
    [@ocaml.doc
      "If your [ListCallAnalyticsCategories] request returns more results than can be displayed, [NextToken] is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including [NextToken] with the value of the copied string. Repeat as needed to view all your results.\n"]}
[@@ocaml.doc ""]
type nonrec get_vocabulary_filter_response =
  {
  download_uri: string option
    [@ocaml.doc
      "The Amazon S3 location where the custom vocabulary filter is stored; use this URI to view or download the custom vocabulary filter.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary filter was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary filter.\n"];
  vocabulary_filter_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary filter you requested information about.\n"]}
[@@ocaml.doc ""]
type nonrec get_vocabulary_filter_request =
  {
  vocabulary_filter_name: string
    [@ocaml.doc
      "The name of the custom vocabulary filter you want information about. Custom vocabulary filter names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_vocabulary_response =
  {
  download_uri: string option
    [@ocaml.doc
      "The Amazon S3 location where the custom vocabulary is stored; use this URI to view or download the custom vocabulary.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [VocabularyState] is [FAILED], [FailureReason] contains information about why the custom vocabulary request failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom vocabulary was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartTranscriptionJob] request.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary.\n"];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom vocabulary you requested information about.\n"]}
[@@ocaml.doc ""]
type nonrec get_vocabulary_request =
  {
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom vocabulary you want information about. Custom vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_transcription_job_response =
  {
  transcription_job: transcription_job option
    [@ocaml.doc
      "Provides detailed information about the specified transcription job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec get_transcription_job_request =
  {
  transcription_job_name: string
    [@ocaml.doc
      "The name of the transcription job you want information about. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_vocabulary_response =
  {
  download_uri: string option
    [@ocaml.doc
      "The Amazon S3 location where the specified custom medical vocabulary is stored; use this URI to view or download the custom vocabulary.\n"];
  failure_reason: string option
    [@ocaml.doc
      "If [VocabularyState] is [FAILED], [FailureReason] contains information about why the custom medical vocabulary request failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the specified custom medical vocabulary was last modified.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom medical vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartMedicalTranscriptionJob] request.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom medical vocabulary. US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n"];
  vocabulary_name: string option
    [@ocaml.doc
      "The name of the custom medical vocabulary you requested information about.\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_vocabulary_request =
  {
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom medical vocabulary you want information about. Custom medical vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option
    [@ocaml.doc
      "Provides detailed information about the specified medical transcription job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_transcription_job_request =
  {
  medical_transcription_job_name: string
    [@ocaml.doc
      "The name of the medical transcription job you want information about. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option
    [@ocaml.doc
      "Provides detailed information about the specified Medical Scribe job, including job status and, if applicable, failure reason\n"]}
[@@ocaml.doc ""]
type nonrec get_medical_scribe_job_request =
  {
  medical_scribe_job_name: string
    [@ocaml.doc
      "The name of the Medical Scribe job you want information about. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option
    [@ocaml.doc
      "Provides detailed information about the specified Call Analytics job, including job status and, if applicable, failure reason.\n"]}
[@@ocaml.doc ""]
type nonrec get_call_analytics_job_request =
  {
  call_analytics_job_name: string
    [@ocaml.doc
      "The name of the Call Analytics job you want information about. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec get_call_analytics_category_response =
  {
  category_properties: category_properties option
    [@ocaml.doc
      "Provides you with the properties of the Call Analytics category you specified in your [GetCallAnalyticsCategory] request.\n"]}
[@@ocaml.doc ""]
type nonrec get_call_analytics_category_request =
  {
  category_name: string
    [@ocaml.doc
      "The name of the Call Analytics category you want information about. Category names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec describe_language_model_response =
  {
  language_model: language_model option
    [@ocaml.doc
      "Provides information about the specified custom language model.\n\n This parameter also shows if the base language model you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.\n \n  If you tried to create a new custom language model and the request wasn't successful, you can use this [DescribeLanguageModel] to help identify the reason for this failure.\n  "]}
[@@ocaml.doc ""]
type nonrec describe_language_model_request =
  {
  model_name: string
    [@ocaml.doc
      "The name of the custom language model you want information about. Model names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_vocabulary_filter_request =
  {
  vocabulary_filter_name: string
    [@ocaml.doc
      "The name of the custom vocabulary filter you want to delete. Custom vocabulary filter names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_vocabulary_request =
  {
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom vocabulary you want to delete. Custom vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_transcription_job_request =
  {
  transcription_job_name: string
    [@ocaml.doc
      "The name of the transcription job you want to delete. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_medical_vocabulary_request =
  {
  vocabulary_name: string
    [@ocaml.doc
      "The name of the custom medical vocabulary you want to delete. Custom medical vocabulary names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_medical_transcription_job_request =
  {
  medical_transcription_job_name: string
    [@ocaml.doc
      "The name of the medical transcription job you want to delete. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_medical_scribe_job_request =
  {
  medical_scribe_job_name: string
    [@ocaml.doc
      "The name of the Medical Scribe job you want to delete. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_language_model_request =
  {
  model_name: string
    [@ocaml.doc
      "The name of the custom language model you want to delete. Model names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_call_analytics_job_request =
  {
  call_analytics_job_name: string
    [@ocaml.doc
      "The name of the Call Analytics job you want to delete. Job names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec delete_call_analytics_category_request =
  {
  category_name: string
    [@ocaml.doc
      "The name of the Call Analytics category you want to delete. Category names are case sensitive.\n"]}
[@@ocaml.doc ""]
type nonrec create_vocabulary_filter_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time you created your custom vocabulary filter.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary filter.\n"];
  vocabulary_filter_name: string option
    [@ocaml.doc "The name you chose for your custom vocabulary filter.\n"]}
[@@ocaml.doc ""]
type nonrec create_vocabulary_filter_request =
  {
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary filter). If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary filter at the time you create this new vocabulary filter.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  vocabulary_filter_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI must be located in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt] \n \n  Note that if you include [VocabularyFilterFileUri] in your request, you cannot use [Words]; you must choose one or the other.\n  "];
  words: string list option
    [@ocaml.doc
      "Use this parameter if you want to create your custom vocabulary filter by including all desired terms, as comma-separated values, within your request. The other option for creating your vocabulary filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the [VocabularyFilterFileUri] parameter.\n\n Note that if you include [Words] in your request, you cannot use [VocabularyFilterFileUri]; you must choose one or the other.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language of the entries in your vocabulary filter. Each custom vocabulary filter must contain terms in only one language.\n\n A custom vocabulary filter can only be used to transcribe files in the same language as the filter. For example, if you create a custom vocabulary filter using US English ([en-US]), you can only apply this filter to files that contain English audio.\n \n  For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n  "];
  vocabulary_filter_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your new custom vocabulary filter.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom vocabulary filter with the same name as an existing custom vocabulary filter, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec create_vocabulary_response =
  {
  failure_reason: string option
    [@ocaml.doc
      "If [VocabularyState] is [FAILED], [FailureReason] contains information about why the custom vocabulary request failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time you created your custom vocabulary.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartTranscriptionJob] request.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom vocabulary.\n"];
  vocabulary_name: string option
    [@ocaml.doc "The name you chose for your custom vocabulary.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_vocabulary_request =
  {
  data_access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary). If the role that you specify doesn\226\128\153t have the appropriate permissions to access the specified Amazon S3 location, your request fails.\n\n IAM role ARNs have the format [arn:partition:iam::account:role/role-name-with-path]. For example: [arn:aws:iam::111122223333:role/Admin].\n \n  For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs}.\n  "];
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary at the time you create this new custom vocabulary.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  vocabulary_file_uri: string option
    [@ocaml.doc
      "The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt] \n \n  Note that if you include [VocabularyFileUri] in your request, you cannot use the [Phrases] flag; you must choose one or the other.\n  "];
  phrases: string list option
    [@ocaml.doc
      "Use this parameter if you want to create your custom vocabulary by including all desired terms, as comma-separated values, within your request. The other option for creating your custom vocabulary is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the [VocabularyFileUri] parameter.\n\n Note that if you include [Phrases] in your request, you cannot use [VocabularyFileUri]; you must choose one or the other.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language of the entries in your custom vocabulary. Each custom vocabulary must contain terms in only one language.\n\n A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English ([en-US]), you can only apply this custom vocabulary to files that contain English audio.\n \n  For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table.\n  "];
  vocabulary_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your new custom vocabulary.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom vocabulary with the same name as an existing custom vocabulary, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec create_medical_vocabulary_response =
  {
  failure_reason: string option
    [@ocaml.doc
      "If [VocabularyState] is [FAILED], [FailureReason] contains information about why the medical transcription job request failed. See also: {{:https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html}Common Errors}.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time you created your custom medical vocabulary.\n\n Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on May 4, 2022.\n "];
  vocabulary_state: vocabulary_state option
    [@ocaml.doc
      "The processing state of your custom medical vocabulary. If the state is [READY], you can use the custom vocabulary in a [StartMedicalTranscriptionJob] request.\n"];
  language_code: language_code option
    [@ocaml.doc
      "The language code you selected for your custom medical vocabulary. US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n"];
  vocabulary_name: string option
    [@ocaml.doc "The name you chose for your custom medical vocabulary.\n"]}
[@@ocaml.doc ""]
type nonrec create_medical_vocabulary_request =
  {
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new custom medical vocabulary at the time you create this new custom vocabulary.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  vocabulary_file_uri: string
    [@ocaml.doc
      "The Amazon S3 location (URI) of the text file that contains your custom medical vocabulary. The URI must be in the same Amazon Web Services Region as the resource you're calling.\n\n Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt] \n "];
  language_code: language_code
    [@ocaml.doc
      "The language code that represents the language of the entries in your custom vocabulary. US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n"];
  vocabulary_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your new custom medical vocabulary.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom medical vocabulary with the same name as an existing custom medical vocabulary, you get a [ConflictException] error.\n "]}
[@@ocaml.doc ""]
type nonrec create_language_model_response =
  {
  model_status: model_status option
    [@ocaml.doc
      "The status of your custom language model. When the status displays as [COMPLETED], your model is ready to use.\n"];
  input_data_config: input_data_config option
    [@ocaml.doc
      "Lists your data access role ARN (Amazon Resource Name) and the Amazon S3 locations you provided for your training ([S3Uri]) and tuning ([TuningDataS3Uri]) data.\n"];
  model_name: string option
    [@ocaml.doc "The name of your custom language model.\n"];
  base_model_name: base_model_name option
    [@ocaml.doc
      "The Amazon Transcribe standard language model, or base model, you specified when creating your custom language model.\n"];
  language_code: clm_language_code option
    [@ocaml.doc
      "The language code you selected for your custom language model.\n"]}
[@@ocaml.doc ""]
type nonrec create_language_model_request =
  {
  tags: tag list option
    [@ocaml.doc
      "Adds one or more custom tags, each in the form of a key:value pair, to a new custom language model at the time you create this new model.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "];
  input_data_config: input_data_config
    [@ocaml.doc
      "Contains the Amazon S3 location of the training data you want to use to create a new custom language model, and permissions to access this location.\n\n When using [InputDataConfig], you must include these sub-parameters: [S3Uri], which is the Amazon S3 location of your training data, and [DataAccessRoleArn], which is the Amazon Resource Name (ARN) of the role that has permission to access your specified Amazon S3 location. You can optionally include [TuningDataS3Uri], which is the Amazon S3 location of your tuning data. If you specify different Amazon S3 locations for training and tuning data, the ARN you use must have permissions to access both locations.\n "];
  model_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your custom language model.\n\n This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom language model with the same name as an existing custom language model, you get a [ConflictException] error.\n "];
  base_model_name: base_model_name
    [@ocaml.doc
      "The Amazon Transcribe standard language model, or base model, used to create your custom language model. Amazon Transcribe offers two options for base models: Wideband and Narrowband.\n\n If the audio you want to transcribe has a sample rate of 16,000 Hz or greater, choose [WideBand]. To transcribe audio with a sample rate less than 16,000 Hz, choose [NarrowBand].\n "];
  language_code: clm_language_code
    [@ocaml.doc
      "The language code that represents the language of your model. Each custom language model must contain terms in only one language, and the language you select for your custom language model must match the language of your training and tuning data.\n\n For a list of supported languages and their associated language codes, refer to the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. Note that US English ([en-US]) is the only language supported with Amazon Transcribe Medical.\n \n  A custom language model can only be used to transcribe files in the same language as the model. For example, if you create a custom language model using US English ([en-US]), you can only apply this model to files that contain English audio.\n  "]}
[@@ocaml.doc ""]
type nonrec create_call_analytics_category_response =
  {
  category_properties: category_properties option
    [@ocaml.doc
      "Provides you with the properties of your new category, including its associated rules.\n"]}
[@@ocaml.doc ""]
type nonrec create_call_analytics_category_request =
  {
  input_type: input_type option
    [@ocaml.doc
      "Choose whether you want to create a real-time or a post-call category for your Call Analytics transcription.\n\n Specifying [POST_CALL] assigns your category to post-call transcriptions; categories with this input type cannot be applied to streaming (real-time) transcriptions.\n \n  Specifying [REAL_TIME] assigns your category to streaming transcriptions; categories with this input type cannot be applied to post-call transcriptions.\n  \n   If you do not include [InputType], your category is created as a post-call category by default.\n   "];
  rules: rule list
    [@ocaml.doc
      "Rules define a Call Analytics category. When creating a new category, you must create between 1 and 20 rules for that category. For each rule, you specify a filter you want applied to the attributes of a call. For example, you can choose a sentiment filter that detects if a customer's sentiment was positive during the last 30 seconds of the call.\n"];
  category_name: string
    [@ocaml.doc
      "A unique name, chosen by you, for your Call Analytics category. It's helpful to use a detailed naming system that will make sense to you in the future. For example, it's better to use [sentiment-positive-last30seconds] for a category over a generic name like [test-category].\n\n Category names are case sensitive.\n "]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_vocabulary_info :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> vocabulary_info
val make_vocabulary_filter_info :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string -> unit -> vocabulary_filter_info
val make_update_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> update_vocabulary_response
val make_update_vocabulary_request :
  ?data_access_role_arn:string ->
    ?vocabulary_file_uri:string ->
      ?phrases:string list ->
        language_code:language_code ->
          vocabulary_name:string -> unit -> update_vocabulary_request
val make_update_vocabulary_filter_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string ->
        unit -> update_vocabulary_filter_response
val make_update_vocabulary_filter_request :
  ?data_access_role_arn:string ->
    ?vocabulary_filter_file_uri:string ->
      ?words:string list ->
        vocabulary_filter_name:string ->
          unit -> update_vocabulary_filter_request
val make_update_medical_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> update_medical_vocabulary_response
val make_update_medical_vocabulary_request :
  vocabulary_file_uri:string ->
    language_code:language_code ->
      vocabulary_name:string -> unit -> update_medical_vocabulary_request
val make_absolute_time_range :
  ?last:int ->
    ?first:int ->
      ?end_time:int -> ?start_time:int -> unit -> absolute_time_range
val make_relative_time_range :
  ?last:int ->
    ?first:int ->
      ?end_percentage:int ->
        ?start_percentage:int -> unit -> relative_time_range
val make_non_talk_time_filter :
  ?negate:bool ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?threshold:int -> unit -> non_talk_time_filter
val make_interruption_filter :
  ?negate:bool ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?participant_role:participant_role ->
          ?threshold:int -> unit -> interruption_filter
val make_transcript_filter :
  ?negate:bool ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          targets:string list ->
            transcript_filter_type:transcript_filter_type ->
              unit -> transcript_filter
val make_sentiment_filter :
  ?negate:bool ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          sentiments:sentiment_value list -> unit -> sentiment_filter
val make_category_properties :
  ?input_type:input_type ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?create_time:CoreTypes.Timestamp.t ->
        ?rules:rule list ->
          ?category_name:string -> unit -> category_properties
val make_update_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> update_call_analytics_category_response
val make_update_call_analytics_category_request :
  ?input_type:input_type ->
    rules:rule list ->
      category_name:string -> unit -> update_call_analytics_category_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_content_redaction :
  ?pii_entity_types:pii_entity_type list ->
    redaction_output:redaction_output ->
      redaction_type:redaction_type -> unit -> content_redaction
val make_model_settings :
  ?language_model_name:string -> unit -> model_settings
val make_language_code_item :
  ?duration_in_seconds:float ->
    ?language_code:language_code -> unit -> language_code_item
val make_toxicity_detection_settings :
  toxicity_categories:toxicity_category list ->
    unit -> toxicity_detection_settings
val make_transcription_job_summary :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_codes:language_code_item list ->
      ?identified_language_score:float ->
        ?identify_multiple_languages:bool ->
          ?identify_language:bool ->
            ?model_settings:model_settings ->
              ?content_redaction:content_redaction ->
                ?output_location_type:output_location_type ->
                  ?failure_reason:string ->
                    ?transcription_job_status:transcription_job_status ->
                      ?language_code:language_code ->
                        ?completion_time:CoreTypes.Timestamp.t ->
                          ?start_time:CoreTypes.Timestamp.t ->
                            ?creation_time:CoreTypes.Timestamp.t ->
                              ?transcription_job_name:string ->
                                unit -> transcription_job_summary
val make_media :
  ?redacted_media_file_uri:string -> ?media_file_uri:string -> unit -> media
val make_transcript :
  ?redacted_transcript_file_uri:string ->
    ?transcript_file_uri:string -> unit -> transcript
val make_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
    ?vocabulary_filter_name:string ->
      ?max_alternatives:int ->
        ?show_alternatives:bool ->
          ?channel_identification:bool ->
            ?max_speaker_labels:int ->
              ?show_speaker_labels:bool ->
                ?vocabulary_name:string -> unit -> settings
val make_job_execution_settings :
  ?data_access_role_arn:string ->
    ?allow_deferred_execution:bool -> unit -> job_execution_settings
val make_tag : value:string -> key:string -> unit -> tag
val make_subtitles_output :
  ?output_start_index:int ->
    ?subtitle_file_uris:string list ->
      ?formats:subtitle_format list -> unit -> subtitles_output
val make_language_id_settings :
  ?language_model_name:string ->
    ?vocabulary_filter_name:string ->
      ?vocabulary_name:string -> unit -> language_id_settings
val make_transcription_job :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_id_settings:language_id_settings_map ->
      ?subtitles:subtitles_output ->
        ?tags:tag list ->
          ?language_codes:language_code_item list ->
            ?identified_language_score:float ->
              ?language_options:language_code list ->
                ?identify_multiple_languages:bool ->
                  ?identify_language:bool ->
                    ?content_redaction:content_redaction ->
                      ?job_execution_settings:job_execution_settings ->
                        ?model_settings:model_settings ->
                          ?settings:settings ->
                            ?failure_reason:string ->
                              ?completion_time:CoreTypes.Timestamp.t ->
                                ?creation_time:CoreTypes.Timestamp.t ->
                                  ?start_time:CoreTypes.Timestamp.t ->
                                    ?transcript:transcript ->
                                      ?media:media ->
                                        ?media_format:media_format ->
                                          ?media_sample_rate_hertz:int ->
                                            ?language_code:language_code ->
                                              ?transcription_job_status:transcription_job_status
                                                ->
                                                ?transcription_job_name:string
                                                  ->
                                                  unit -> transcription_job
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_start_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> start_transcription_job_response
val make_subtitles :
  ?output_start_index:int ->
    ?formats:subtitle_format list -> unit -> subtitles
val make_start_transcription_job_request :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_id_settings:language_id_settings_map ->
      ?tags:tag list ->
        ?subtitles:subtitles ->
          ?language_options:language_code list ->
            ?identify_multiple_languages:bool ->
              ?identify_language:bool ->
                ?content_redaction:content_redaction ->
                  ?job_execution_settings:job_execution_settings ->
                    ?model_settings:model_settings ->
                      ?settings:settings ->
                        ?kms_encryption_context:kms_encryption_context_map ->
                          ?output_encryption_kms_key_id:string ->
                            ?output_key:string ->
                              ?output_bucket_name:string ->
                                ?media_format:media_format ->
                                  ?media_sample_rate_hertz:int ->
                                    ?language_code:language_code ->
                                      media:media ->
                                        transcription_job_name:string ->
                                          unit ->
                                            start_transcription_job_request
val make_medical_transcript :
  ?transcript_file_uri:string -> unit -> medical_transcript
val make_medical_transcription_setting :
  ?vocabulary_name:string ->
    ?max_alternatives:int ->
      ?show_alternatives:bool ->
        ?channel_identification:bool ->
          ?max_speaker_labels:int ->
            ?show_speaker_labels:bool ->
              unit -> medical_transcription_setting
val make_medical_transcription_job :
  ?tags:tag list ->
    ?type_:type_ ->
      ?specialty:specialty ->
        ?content_identification_type:medical_content_identification_type ->
          ?settings:medical_transcription_setting ->
            ?failure_reason:string ->
              ?completion_time:CoreTypes.Timestamp.t ->
                ?creation_time:CoreTypes.Timestamp.t ->
                  ?start_time:CoreTypes.Timestamp.t ->
                    ?transcript:medical_transcript ->
                      ?media:media ->
                        ?media_format:media_format ->
                          ?media_sample_rate_hertz:int ->
                            ?language_code:language_code ->
                              ?transcription_job_status:transcription_job_status
                                ->
                                ?medical_transcription_job_name:string ->
                                  unit -> medical_transcription_job
val make_start_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> start_medical_transcription_job_response
val make_start_medical_transcription_job_request :
  ?tags:tag list ->
    ?content_identification_type:medical_content_identification_type ->
      ?settings:medical_transcription_setting ->
        ?kms_encryption_context:kms_encryption_context_map ->
          ?output_encryption_kms_key_id:string ->
            ?output_key:string ->
              ?media_format:media_format ->
                ?media_sample_rate_hertz:int ->
                  type_:type_ ->
                    specialty:specialty ->
                      output_bucket_name:string ->
                        media:media ->
                          language_code:language_code ->
                            medical_transcription_job_name:string ->
                              unit -> start_medical_transcription_job_request
val make_medical_scribe_output :
  clinical_document_uri:string ->
    transcript_file_uri:string -> unit -> medical_scribe_output
val make_medical_scribe_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
    ?vocabulary_filter_name:string ->
      ?vocabulary_name:string ->
        ?channel_identification:bool ->
          ?max_speaker_labels:int ->
            ?show_speaker_labels:bool -> unit -> medical_scribe_settings
val make_medical_scribe_channel_definition :
  participant_role:medical_scribe_participant_role ->
    channel_id:int -> unit -> medical_scribe_channel_definition
val make_medical_scribe_job :
  ?tags:tag list ->
    ?channel_definitions:medical_scribe_channel_definition list ->
      ?data_access_role_arn:string ->
        ?settings:medical_scribe_settings ->
          ?failure_reason:string ->
            ?completion_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?start_time:CoreTypes.Timestamp.t ->
                  ?medical_scribe_output:medical_scribe_output ->
                    ?media:media ->
                      ?language_code:medical_scribe_language_code ->
                        ?medical_scribe_job_status:medical_scribe_job_status
                          ->
                          ?medical_scribe_job_name:string ->
                            unit -> medical_scribe_job
val make_start_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> start_medical_scribe_job_response
val make_start_medical_scribe_job_request :
  ?tags:tag list ->
    ?channel_definitions:medical_scribe_channel_definition list ->
      ?kms_encryption_context:kms_encryption_context_map ->
        ?output_encryption_kms_key_id:string ->
          settings:medical_scribe_settings ->
            data_access_role_arn:string ->
              output_bucket_name:string ->
                media:media ->
                  medical_scribe_job_name:string ->
                    unit -> start_medical_scribe_job_request
val make_call_analytics_skipped_feature :
  ?message:string ->
    ?reason_code:call_analytics_skipped_reason_code ->
      ?feature:call_analytics_feature ->
        unit -> call_analytics_skipped_feature
val make_call_analytics_job_details :
  ?skipped:call_analytics_skipped_feature list ->
    unit -> call_analytics_job_details
val make_summarization :
  generate_abstractive_summary:bool -> unit -> summarization
val make_call_analytics_job_settings :
  ?summarization:summarization ->
    ?language_id_settings:language_id_settings_map ->
      ?language_options:language_code list ->
        ?content_redaction:content_redaction ->
          ?language_model_name:string ->
            ?vocabulary_filter_method:vocabulary_filter_method ->
              ?vocabulary_filter_name:string ->
                ?vocabulary_name:string ->
                  unit -> call_analytics_job_settings
val make_channel_definition :
  ?participant_role:participant_role ->
    ?channel_id:int -> unit -> channel_definition
val make_call_analytics_job :
  ?channel_definitions:channel_definition list ->
    ?settings:call_analytics_job_settings ->
      ?identified_language_score:float ->
        ?data_access_role_arn:string ->
          ?failure_reason:string ->
            ?completion_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?start_time:CoreTypes.Timestamp.t ->
                  ?transcript:transcript ->
                    ?media:media ->
                      ?media_format:media_format ->
                        ?media_sample_rate_hertz:int ->
                          ?language_code:language_code ->
                            ?call_analytics_job_details:call_analytics_job_details
                              ->
                              ?call_analytics_job_status:call_analytics_job_status
                                ->
                                ?call_analytics_job_name:string ->
                                  unit -> call_analytics_job
val make_start_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> start_call_analytics_job_response
val make_start_call_analytics_job_request :
  ?channel_definitions:channel_definition list ->
    ?settings:call_analytics_job_settings ->
      ?data_access_role_arn:string ->
        ?output_encryption_kms_key_id:string ->
          ?output_location:string ->
            media:media ->
              call_analytics_job_name:string ->
                unit -> start_call_analytics_job_request
val make_list_vocabulary_filters_response :
  ?vocabulary_filters:vocabulary_filter_info list ->
    ?next_token:string -> unit -> list_vocabulary_filters_response
val make_list_vocabulary_filters_request :
  ?name_contains:string ->
    ?max_results:int ->
      ?next_token:string -> unit -> list_vocabulary_filters_request
val make_list_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
    ?next_token:string ->
      ?status:vocabulary_state -> unit -> list_vocabularies_response
val make_list_vocabularies_request :
  ?name_contains:string ->
    ?state_equals:vocabulary_state ->
      ?max_results:int ->
        ?next_token:string -> unit -> list_vocabularies_request
val make_list_transcription_jobs_response :
  ?transcription_job_summaries:transcription_job_summary list ->
    ?next_token:string ->
      ?status:transcription_job_status ->
        unit -> list_transcription_jobs_response
val make_list_transcription_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:transcription_job_status ->
          unit -> list_transcription_jobs_request
val make_list_tags_for_resource_response :
  ?tags:tag list ->
    ?resource_arn:string -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_medical_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
    ?next_token:string ->
      ?status:vocabulary_state -> unit -> list_medical_vocabularies_response
val make_list_medical_vocabularies_request :
  ?name_contains:string ->
    ?state_equals:vocabulary_state ->
      ?max_results:int ->
        ?next_token:string -> unit -> list_medical_vocabularies_request
val make_medical_transcription_job_summary :
  ?type_:type_ ->
    ?content_identification_type:medical_content_identification_type ->
      ?specialty:specialty ->
        ?output_location_type:output_location_type ->
          ?failure_reason:string ->
            ?transcription_job_status:transcription_job_status ->
              ?language_code:language_code ->
                ?completion_time:CoreTypes.Timestamp.t ->
                  ?start_time:CoreTypes.Timestamp.t ->
                    ?creation_time:CoreTypes.Timestamp.t ->
                      ?medical_transcription_job_name:string ->
                        unit -> medical_transcription_job_summary
val make_list_medical_transcription_jobs_response :
  ?medical_transcription_job_summaries:medical_transcription_job_summary list
    ->
    ?next_token:string ->
      ?status:transcription_job_status ->
        unit -> list_medical_transcription_jobs_response
val make_list_medical_transcription_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:transcription_job_status ->
          unit -> list_medical_transcription_jobs_request
val make_medical_scribe_job_summary :
  ?failure_reason:string ->
    ?medical_scribe_job_status:medical_scribe_job_status ->
      ?language_code:medical_scribe_language_code ->
        ?completion_time:CoreTypes.Timestamp.t ->
          ?start_time:CoreTypes.Timestamp.t ->
            ?creation_time:CoreTypes.Timestamp.t ->
              ?medical_scribe_job_name:string ->
                unit -> medical_scribe_job_summary
val make_list_medical_scribe_jobs_response :
  ?medical_scribe_job_summaries:medical_scribe_job_summary list ->
    ?next_token:string ->
      ?status:medical_scribe_job_status ->
        unit -> list_medical_scribe_jobs_response
val make_list_medical_scribe_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:medical_scribe_job_status ->
          unit -> list_medical_scribe_jobs_request
val make_input_data_config :
  ?tuning_data_s3_uri:string ->
    data_access_role_arn:string -> s3_uri:string -> unit -> input_data_config
val make_language_model :
  ?input_data_config:input_data_config ->
    ?failure_reason:string ->
      ?upgrade_availability:bool ->
        ?model_status:model_status ->
          ?base_model_name:base_model_name ->
            ?language_code:clm_language_code ->
              ?last_modified_time:CoreTypes.Timestamp.t ->
                ?create_time:CoreTypes.Timestamp.t ->
                  ?model_name:string -> unit -> language_model
val make_list_language_models_response :
  ?models:language_model list ->
    ?next_token:string -> unit -> list_language_models_response
val make_list_language_models_request :
  ?max_results:int ->
    ?next_token:string ->
      ?name_contains:string ->
        ?status_equals:model_status -> unit -> list_language_models_request
val make_call_analytics_job_summary :
  ?failure_reason:string ->
    ?call_analytics_job_details:call_analytics_job_details ->
      ?call_analytics_job_status:call_analytics_job_status ->
        ?language_code:language_code ->
          ?completion_time:CoreTypes.Timestamp.t ->
            ?start_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?call_analytics_job_name:string ->
                  unit -> call_analytics_job_summary
val make_list_call_analytics_jobs_response :
  ?call_analytics_job_summaries:call_analytics_job_summary list ->
    ?next_token:string ->
      ?status:call_analytics_job_status ->
        unit -> list_call_analytics_jobs_response
val make_list_call_analytics_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:call_analytics_job_status ->
          unit -> list_call_analytics_jobs_request
val make_list_call_analytics_categories_response :
  ?categories:category_properties list ->
    ?next_token:string -> unit -> list_call_analytics_categories_response
val make_list_call_analytics_categories_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_call_analytics_categories_request
val make_get_vocabulary_filter_response :
  ?download_uri:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_filter_name:string ->
          unit -> get_vocabulary_filter_response
val make_get_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit -> get_vocabulary_filter_request
val make_get_vocabulary_response :
  ?download_uri:string ->
    ?failure_reason:string ->
      ?last_modified_time:CoreTypes.Timestamp.t ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:string -> unit -> get_vocabulary_response
val make_get_vocabulary_request :
  vocabulary_name:string -> unit -> get_vocabulary_request
val make_get_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> get_transcription_job_response
val make_get_transcription_job_request :
  transcription_job_name:string -> unit -> get_transcription_job_request
val make_get_medical_vocabulary_response :
  ?download_uri:string ->
    ?failure_reason:string ->
      ?last_modified_time:CoreTypes.Timestamp.t ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:string ->
              unit -> get_medical_vocabulary_response
val make_get_medical_vocabulary_request :
  vocabulary_name:string -> unit -> get_medical_vocabulary_request
val make_get_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> get_medical_transcription_job_response
val make_get_medical_transcription_job_request :
  medical_transcription_job_name:string ->
    unit -> get_medical_transcription_job_request
val make_get_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> get_medical_scribe_job_response
val make_get_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit -> get_medical_scribe_job_request
val make_get_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> get_call_analytics_job_response
val make_get_call_analytics_job_request :
  call_analytics_job_name:string -> unit -> get_call_analytics_job_request
val make_get_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> get_call_analytics_category_response
val make_get_call_analytics_category_request :
  category_name:string -> unit -> get_call_analytics_category_request
val make_describe_language_model_response :
  ?language_model:language_model -> unit -> describe_language_model_response
val make_describe_language_model_request :
  model_name:string -> unit -> describe_language_model_request
val make_delete_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit -> delete_vocabulary_filter_request
val make_delete_vocabulary_request :
  vocabulary_name:string -> unit -> delete_vocabulary_request
val make_delete_transcription_job_request :
  transcription_job_name:string -> unit -> delete_transcription_job_request
val make_delete_medical_vocabulary_request :
  vocabulary_name:string -> unit -> delete_medical_vocabulary_request
val make_delete_medical_transcription_job_request :
  medical_transcription_job_name:string ->
    unit -> delete_medical_transcription_job_request
val make_delete_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit -> delete_medical_scribe_job_request
val make_delete_language_model_request :
  model_name:string -> unit -> delete_language_model_request
val make_delete_call_analytics_job_response : unit -> unit
val make_delete_call_analytics_job_request :
  call_analytics_job_name:string -> unit -> delete_call_analytics_job_request
val make_delete_call_analytics_category_response : unit -> unit
val make_delete_call_analytics_category_request :
  category_name:string -> unit -> delete_call_analytics_category_request
val make_create_vocabulary_filter_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string ->
        unit -> create_vocabulary_filter_response
val make_create_vocabulary_filter_request :
  ?data_access_role_arn:string ->
    ?tags:tag list ->
      ?vocabulary_filter_file_uri:string ->
        ?words:string list ->
          language_code:language_code ->
            vocabulary_filter_name:string ->
              unit -> create_vocabulary_filter_request
val make_create_vocabulary_response :
  ?failure_reason:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:string -> unit -> create_vocabulary_response
val make_create_vocabulary_request :
  ?data_access_role_arn:string ->
    ?tags:tag list ->
      ?vocabulary_file_uri:string ->
        ?phrases:string list ->
          language_code:language_code ->
            vocabulary_name:string -> unit -> create_vocabulary_request
val make_create_medical_vocabulary_response :
  ?failure_reason:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:string ->
            unit -> create_medical_vocabulary_response
val make_create_medical_vocabulary_request :
  ?tags:tag list ->
    vocabulary_file_uri:string ->
      language_code:language_code ->
        vocabulary_name:string -> unit -> create_medical_vocabulary_request
val make_create_language_model_response :
  ?model_status:model_status ->
    ?input_data_config:input_data_config ->
      ?model_name:string ->
        ?base_model_name:base_model_name ->
          ?language_code:clm_language_code ->
            unit -> create_language_model_response
val make_create_language_model_request :
  ?tags:tag list ->
    input_data_config:input_data_config ->
      model_name:string ->
        base_model_name:base_model_name ->
          language_code:clm_language_code ->
            unit -> create_language_model_request
val make_create_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> create_call_analytics_category_response
val make_create_call_analytics_category_request :
  ?input_type:input_type ->
    rules:rule list ->
      category_name:string -> unit -> create_call_analytics_category_request(** {1:operations Operations} *)

module CreateCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_call_analytics_category_request ->
        (create_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new Call Analytics category.\n\n All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.\n \n  When creating a new category, you can use the [InputType] parameter to label the category as a [POST_CALL] or a [REAL_TIME] category. [POST_CALL] categories can only be applied to post-call transcriptions and [REAL_TIME] categories can only be applied to real-time transcriptions. If you do not include [InputType], your category is created as a [POST_CALL] category by default.\n  \n   Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .\n   \n    To update an existing category, see .\n    \n     To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n     "]
module CreateLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_language_model_request ->
        (create_language_model_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom language model.\n\n When creating a new custom language model, you must specify:\n \n  {ul\n        {-  If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model\n            \n             }\n        {-  The location of your training and tuning files (this must be an Amazon S3 URI)\n            \n             }\n        {-  The language of your model\n            \n             }\n        {-  A unique name for your model\n            \n             }\n        }\n  "]
module CreateMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_medical_vocabulary_request ->
        (create_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom medical vocabulary.\n\n Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the [Phrases] flag; [CreateMedicalVocabulary] does not support the [Phrases] flag and only accepts vocabularies in table format.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.\n   "]
module CreateVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_request ->
        (create_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom vocabulary.\n\n When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the [Phrases] flag.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.\n   "]
module CreateVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_filter_request ->
        (create_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom vocabulary filter.\n\n You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html}Vocabulary filtering}.\n   "]
module DeleteCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_category_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using [CategoryName]. Category names are case sensitive.\n"]
module DeleteCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using [CallAnalyticsJobName]. Job names are case sensitive.\n"]
module DeleteLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_language_model_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using [ModelName]. custom language model names are case sensitive.\n"]
module DeleteMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_scribe_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using [MedicalScribeJobName]. Job names are case sensitive.\n"]
module DeleteMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_transcription_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using [MedicalTranscriptionJobName]. Job names are case sensitive.\n"]
module DeleteMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_vocabulary_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.\n"]
module DeleteTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_transcription_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a transcription job. To use this operation, specify the name of the job you want to delete using [TranscriptionJobName]. Job names are case sensitive.\n"]
module DeleteVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.\n"]
module DeleteVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_filter_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using [VocabularyFilterName]. Custom vocabulary filter names are case sensitive.\n"]
module DescribeLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_language_model_request ->
        (describe_language_model_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom language model.\n\n This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.\n \n  If you tried to create a new custom language model and the request wasn't successful, you can use [DescribeLanguageModel] to help identify the reason for this failure.\n  "]
module GetCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_category_request ->
        (get_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Call Analytics category.\n\n To get a list of your Call Analytics categories, use the operation.\n "]
module GetCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_job_request ->
        (get_call_analytics_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Call Analytics job.\n\n To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].\n  \n   If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in [RedactedMediaFileUri].\n   \n    To get a list of your Call Analytics jobs, use the operation.\n    "]
module GetMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_scribe_job_request ->
        (get_medical_scribe_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Medical Scribe job.\n\n To view the status of the specified medical transcription job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n \n  To get a list of your Medical Scribe jobs, use the operation.\n  "]
module GetMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_transcription_job_request ->
        (get_medical_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified medical transcription job.\n\n To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  To get a list of your medical transcription jobs, use the operation.\n  "]
module GetMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_vocabulary_request ->
        (get_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom medical vocabulary.\n\n To view the status of the specified custom medical vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your vocabulary failed.\n \n  To get a list of your custom medical vocabularies, use the operation.\n  "]
module GetTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_transcription_job_request ->
        (get_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified transcription job.\n\n To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].\n  \n   To get a list of your transcription jobs, use the operation.\n   "]
module GetVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_request ->
        (get_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom vocabulary.\n\n To view the status of the specified custom vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your custom vocabulary failed.\n \n  To get a list of your custom vocabularies, use the operation.\n  "]
module GetVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_filter_request ->
        (get_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom vocabulary filter.\n\n To get a list of your custom vocabulary filters, use the operation.\n "]
module ListCallAnalyticsCategories :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_categories_request ->
        (list_call_analytics_categories_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Call Analytics categories, including all rules that make up each category.\n\n To get detailed information about a specific Call Analytics category, use the operation.\n "]
module ListCallAnalyticsJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_jobs_request ->
        (list_call_analytics_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.\n\n To get detailed information about a specific Call Analytics job, use the operation.\n "]
module ListLanguageModels :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_language_models_request ->
        (list_language_models_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.\n\n To get detailed information about a specific custom language model, use the operation.\n "]
module ListMedicalScribeJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_scribe_jobs_request ->
        (list_medical_scribe_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.\n\n To get detailed information about a specific Medical Scribe job, use the operation.\n "]
module ListMedicalTranscriptionJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_transcription_jobs_request ->
        (list_medical_transcription_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.\n\n To get detailed information about a specific medical transcription job, use the operation.\n "]
module ListMedicalVocabularies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_vocabularies_request ->
        (list_medical_vocabularies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.\n\n To get detailed information about a specific custom medical vocabulary, use the operation.\n "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Lists all tags associated with the specified transcription job, vocabulary, model, or resource.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "]
module ListTranscriptionJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_transcription_jobs_request ->
        (list_transcription_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.\n\n To get detailed information about a specific transcription job, use the operation.\n "]
module ListVocabularies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabularies_request ->
        (list_vocabularies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.\n\n To get detailed information about a specific custom vocabulary, use the operation.\n "]
module ListVocabularyFilters :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabulary_filters_request ->
        (list_vocabulary_filters_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.\n\n To get detailed information about a specific custom vocabulary filter, use the operation.\n "]
module StartCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_call_analytics_job_request ->
        (start_call_analytics_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.\n\n In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.\n \n  If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n  \n   To make a [StartCallAnalyticsJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n   \n    Note that job queuing is enabled by default for Call Analytics jobs.\n    \n     You must include the following parameters in your [StartCallAnalyticsJob] request:\n     \n      {ul\n            {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n                \n                 }\n            {-   [CallAnalyticsJobName]: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.\n                \n                 }\n            {-   [DataAccessRoleArn]: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.\n                \n                 }\n            {-   [Media] ([MediaFileUri] or [RedactedMediaFileUri]): The Amazon S3 location of your media file.\n                \n                 }\n            }\n    With Call Analytics, you can redact the audio contained in your media file by including [RedactedMediaFileUri], instead of [MediaFileUri], to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the [RedactedMediaFileUri] field of your response.\n    \n     "]
module StartMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_scribe_job_request ->
        (start_medical_scribe_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes patient-clinician conversations and generates clinical notes. \n\n Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html}Amazon Web Services HealthScribe}.\n \n  To make a [StartMedicalScribeJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n  \n   You must include the following parameters in your [StartMedicalTranscriptionJob] request:\n   \n    {ul\n          {-   [DataAccessRoleArn]: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in [Media], write permission on the Amazon S3 bucket specified in [OutputBucketName], and full permissions on the KMS key specified in [OutputEncryptionKMSKeyId] (if set). The role should also allow [transcribe.amazonaws.com] to assume it. \n              \n               }\n          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n              \n               }\n          {-   [MedicalScribeJobName]: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.\n              \n               }\n          {-   [OutputBucketName]: The Amazon S3 bucket where you want your output files stored.\n              \n               }\n          {-   [Settings]: A [MedicalScribeSettings] obect that must set exactly one of [ShowSpeakerLabels] or [ChannelIdentification] to true. If [ShowSpeakerLabels] is true, [MaxSpeakerLabels] must also be set. \n              \n               }\n          {-   [ChannelDefinitions]: A [MedicalScribeChannelDefinitions] array should be set if and only if the [ChannelIdentification] value of [Settings] is set to true. \n              \n               }\n          }\n  "]
module StartMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_transcription_job_request ->
        (start_medical_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.\n\n In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html}How Amazon Transcribe Medical works}.\n \n  To make a [StartMedicalTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n  \n   You must include the following parameters in your [StartMedicalTranscriptionJob] request:\n   \n    {ul\n          {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n              \n               }\n          {-   [MedicalTranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.\n              \n               }\n          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n              \n               }\n          {-   [LanguageCode]: This must be [en-US].\n              \n               }\n          {-   [OutputBucketName]: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include [OutputKey].\n              \n               }\n          {-   [Specialty]: This must be [PRIMARYCARE].\n              \n               }\n          {-   [Type]: Choose whether your audio is a conversation or a dictation.\n              \n               }\n          }\n  "]
module StartTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_transcription_job_request ->
        (start_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.\n\n To make a [StartTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n \n  You must include the following parameters in your [StartTranscriptionJob] request:\n  \n   {ul\n         {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n             \n              }\n         {-   [TranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.\n             \n              }\n         {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n             \n              }\n         {-  One of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages]: If you know the language of your media file, specify it using the [LanguageCode] parameter; you can find all valid language codes in the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. If you do not know the languages spoken in your media, use either [IdentifyLanguage] or [IdentifyMultipleLanguages] and let Amazon Transcribe identify the languages for you.\n             \n              }\n         }\n  "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Removes the specified tags from the specified Amazon Transcribe resource.\n\n If you include [UntagResource] in your request, you must also include [ResourceArn] and [TagKeys].\n "]
module UpdateCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_call_analytics_category_request ->
        (update_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates the specified Call Analytics category with new rules. Note that the [UpdateCallAnalyticsCategory] operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.\n\n To create a new category, see .\n "]
module UpdateMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_medical_vocabulary_request ->
        (update_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.\n"]
module UpdateVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_request ->
        (update_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.\n"]
module UpdateVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_filter_request ->
        (update_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.\n"]