type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You aren't authorized to perform the action. Use the Amazon Resource Name (ARN) of an \
   authorized user or IAM role to perform the operation.\n"]

type nonrec adapter_version = string [@@ocaml.doc ""]

type nonrec adapter_page = string [@@ocaml.doc ""]

type nonrec adapter_pages = adapter_page list [@@ocaml.doc ""]

type nonrec adapter_id = string [@@ocaml.doc ""]

type nonrec adapter = {
  adapter_id : adapter_id; [@ocaml.doc "A unique identifier for the adapter resource.\n"]
  pages : adapter_pages option;
      [@ocaml.doc
        "Pages is a parameter that the user inputs to specify which pages to apply an adapter to. \
         The following is a list of rules for using this parameter.\n\n\
        \ {ul\n\
        \       {-  If a page is not specified, it is set to [\\[\"1\"\\]] by default.\n\
        \           \n\
        \            }\n\
        \       {-  The following characters are allowed in the parameter's string: [0 1 2 3 4 5 6 \
         7 8 9 - *]. No whitespace is allowed.\n\
        \           \n\
        \            }\n\
        \       {-  When using * to indicate all pages, it must be the only element in the list.\n\
        \           \n\
        \            }\n\
        \       {-  You can use page intervals, such as [\\[\"1-3\", \"1-1\", \"4-*\"\\]]. Where \
         [*] indicates last page of document.\n\
        \           \n\
        \            }\n\
        \       {-  Specified pages must be greater than 0 and less than or equal to the number of \
         pages in the document.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  version : adapter_version; [@ocaml.doc "A string that identifies the version of the adapter.\n"]
}
[@@ocaml.doc
  "An adapter selected for use when analyzing documents. Contains an adapter ID and a version \
   number. Contains information on pages selected for analysis when analyzing documents \
   asychronously.\n"]

type nonrec adapter_description = string [@@ocaml.doc ""]

type nonrec feature_type =
  | TABLES [@ocaml.doc ""]
  | FORMS [@ocaml.doc ""]
  | QUERIES [@ocaml.doc ""]
  | SIGNATURES [@ocaml.doc ""]
  | LAYOUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec feature_types = feature_type list [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec adapter_name = string [@@ocaml.doc ""]

type nonrec adapter_overview = {
  adapter_id : adapter_id option; [@ocaml.doc "A unique identifier for the adapter resource.\n"]
  adapter_name : adapter_name option; [@ocaml.doc "A string naming the adapter resource.\n"]
  creation_time : date_time option; [@ocaml.doc "The date and time that the adapter was created.\n"]
  feature_types : feature_types option;
      [@ocaml.doc "The feature types that the adapter is operating on.\n"]
}
[@@ocaml.doc
  "Contains information on the adapter, including the adapter ID, Name, Creation time, and feature \
   types.\n"]

type nonrec adapter_list = adapter_overview list [@@ocaml.doc ""]

type nonrec s3_object_version = string [@@ocaml.doc ""]

type nonrec s3_object_name = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_object = {
  bucket : s3_bucket option;
      [@ocaml.doc
        "The name of the S3 bucket. Note that the # character is not valid in the file name.\n"]
  name : s3_object_name option;
      [@ocaml.doc
        "The file name of the input document. Image files may be in PDF, TIFF, JPEG, or PNG format.\n"]
  version : s3_object_version option;
      [@ocaml.doc "If the bucket has versioning enabled, you can specify the object version. \n"]
}
[@@ocaml.doc
  "The S3 bucket name and file name that identifies the document.\n\n\
  \ The AWS Region for the S3 bucket that contains the document must match the Region that you use \
   for Amazon Textract operations.\n\
  \ \n\
  \  For Amazon Textract to process a file in an S3 bucket, the user must have permission to \
   access the S3 bucket and file. \n\
  \  "]

type nonrec adapter_version_dataset_config = {
  manifest_s3_object : s3_object option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The dataset configuration options for a given version of an adapter. Can include an Amazon S3 \
   bucket if specified.\n"]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec evaluation_metric = {
  f1_score : float_ option; [@ocaml.doc "The F1 score for an adapter version.\n"]
  precision : float_ option; [@ocaml.doc "The Precision score for an adapter version.\n"]
  recall : float_ option; [@ocaml.doc "The Recall score for an adapter version.\n"]
}
[@@ocaml.doc "The evaluation metrics (F1 score, Precision, and Recall) for an adapter version.\n"]

type nonrec adapter_version_evaluation_metric = {
  baseline : evaluation_metric option;
      [@ocaml.doc "The F1 score, precision, and recall metrics for the baseline model.\n"]
  adapter_version : evaluation_metric option;
      [@ocaml.doc "The F1 score, precision, and recall metrics for the baseline model.\n"]
  feature_type : feature_type option;
      [@ocaml.doc "Indicates the feature type being analyzed by a given adapter version.\n"]
}
[@@ocaml.doc
  "Contains information on the metrics used to evalute the peformance of a given adapter version. \
   Includes data for baseline model performance and individual adapter version perfromance.\n"]

type nonrec adapter_version_evaluation_metrics = adapter_version_evaluation_metric list
[@@ocaml.doc ""]

type nonrec adapter_version_status_message = string [@@ocaml.doc ""]

type nonrec adapter_version_status =
  | ACTIVE [@ocaml.doc ""]
  | AT_RISK [@ocaml.doc ""]
  | DEPRECATED [@ocaml.doc ""]
  | CREATION_ERROR [@ocaml.doc ""]
  | CREATION_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec adapter_version_overview = {
  adapter_id : adapter_id option;
      [@ocaml.doc "A unique identifier for the adapter associated with a given adapter version.\n"]
  adapter_version : adapter_version option;
      [@ocaml.doc "An identified for a given adapter version.\n"]
  creation_time : date_time option;
      [@ocaml.doc "The date and time that a given adapter version was created.\n"]
  feature_types : feature_types option;
      [@ocaml.doc "The feature types that the adapter version is operating on.\n"]
  status : adapter_version_status option;
      [@ocaml.doc "Contains information on the status of a given adapter version.\n"]
  status_message : adapter_version_status_message option;
      [@ocaml.doc "A message explaining the status of a given adapter vesion.\n"]
}
[@@ocaml.doc
  "Summary info for an adapter version. Contains information on the AdapterId, AdapterVersion, \
   CreationTime, FeatureTypes, and Status.\n"]

type nonrec adapter_version_list = adapter_version_overview list [@@ocaml.doc ""]

type nonrec adapters = adapter list [@@ocaml.doc ""]

type nonrec adapters_config = {
  adapters : adapters;
      [@ocaml.doc "A list of adapters to be used when analyzing the specified document.\n"]
}
[@@ocaml.doc
  "Contains information about adapters used when analyzing a document, with each adapter specified \
   using an AdapterId and version\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec unsupported_document_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The format of the input document isn't supported. Documents for operations can be in PNG, JPEG, \
   PDF, or TIFF format.\n"]

type nonrec throttling_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Amazon Textract is temporarily unable to process the request. Try your call again.\n"]

type nonrec provisioned_throughput_exceeded_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The number of requests exceeded your throughput limit. If you want to increase this limit, \
   contact Amazon Textract.\n"]

type nonrec invalid_s3_object_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Amazon Textract is unable to access the S3 object that's specified in the request. for more \
   information, \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html}Configure Access to \
   Amazon S3} For troubleshooting information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/troubleshooting.html}Troubleshooting Amazon \
   S3} \n"]

type nonrec invalid_parameter_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An input parameter violated a constraint. For example, in synchronous operations, an \
   [InvalidParameterException] exception occurs when neither of the [S3Object] or [Bytes] values \
   are supplied in the [Document] request parameter. Validate your parameter before calling the \
   API operation again.\n"]

type nonrec internal_server_error = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Amazon Textract experienced a service issue. Try your call again.\n"]

type nonrec human_loop_quota_exceeded_exception = {
  resource_type : string_ option; [@ocaml.doc "The resource type.\n"]
  quota_code : string_ option; [@ocaml.doc "The quota code.\n"]
  service_code : string_ option; [@ocaml.doc "The service code.\n"]
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates you have exceeded the maximum number of active human in the loop workflows available\n"]

type nonrec document_too_large_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The document can't be processed because it's too large. The maximum document size for \
   synchronous operations 10 MB. The maximum document size for asynchronous operations is 500 MB \
   for PDF files.\n"]

type nonrec bad_document_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Amazon Textract isn't able to read the document. For more information on the document limits in \
   Amazon Textract, see [limits].\n"]

type nonrec synthesized_json_human_loop_activation_conditions_evaluation_results = string
[@@ocaml.doc ""]

type nonrec human_loop_activation_reason = string [@@ocaml.doc ""]

type nonrec human_loop_activation_reasons = human_loop_activation_reason list [@@ocaml.doc ""]

type nonrec human_loop_arn = string [@@ocaml.doc ""]

type nonrec human_loop_activation_output = {
  human_loop_arn : human_loop_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the HumanLoop created.\n"]
  human_loop_activation_reasons : human_loop_activation_reasons option;
      [@ocaml.doc "Shows if and why human review was needed.\n"]
  human_loop_activation_conditions_evaluation_results :
    synthesized_json_human_loop_activation_conditions_evaluation_results option;
      [@ocaml.doc
        "Shows the result of condition evaluations, including those conditions which activated a \
         human review.\n"]
}
[@@ocaml.doc
  "Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input \
   did not trigger human review.\n"]

type nonrec query_page = string [@@ocaml.doc ""]

type nonrec query_pages = query_page list [@@ocaml.doc ""]

type nonrec query_input = string [@@ocaml.doc ""]

type nonrec query = {
  text : query_input;
      [@ocaml.doc
        "Question that Amazon Textract will apply to the document. An example would be \"What is \
         the customer's SSN?\"\n"]
  alias : query_input option; [@ocaml.doc "Alias attached to the query, for ease of location.\n"]
  pages : query_pages option;
      [@ocaml.doc
        "Pages is a parameter that the user inputs to specify which pages to apply a query to. The \
         following is a list of rules for using this parameter.\n\n\
        \ {ul\n\
        \       {-  If a page is not specified, it is set to [\\[\"1\"\\]] by default.\n\
        \           \n\
        \            }\n\
        \       {-  The following characters are allowed in the parameter's string: [0 1 2 3 4 5 6 \
         7 8 9 - *]. No whitespace is allowed.\n\
        \           \n\
        \            }\n\
        \       {-  When using * to indicate all pages, it must be the only element in the list.\n\
        \           \n\
        \            }\n\
        \       {-  You can use page intervals, such as [\\[\226\128\1561-3\226\128\157, \
         \226\128\1561-1\226\128\157, \226\128\1564-*\226\128\157\\]]. Where [*] indicates last \
         page of document.\n\
        \           \n\
        \            }\n\
        \       {-  Specified pages must be greater than 0 and less than or equal to the number of \
         pages in the document.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Each query contains the question you want to ask in the Text and the alias you want to associate.\n"]

type nonrec u_integer = int [@@ocaml.doc ""]

type nonrec selection_status = SELECTED [@ocaml.doc ""] | NOT_SELECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_type =
  | KEY [@ocaml.doc ""]
  | VALUE [@ocaml.doc ""]
  | COLUMN_HEADER [@ocaml.doc ""]
  | TABLE_TITLE [@ocaml.doc ""]
  | TABLE_FOOTER [@ocaml.doc ""]
  | TABLE_SECTION_TITLE [@ocaml.doc ""]
  | TABLE_SUMMARY [@ocaml.doc ""]
  | STRUCTURED_TABLE [@ocaml.doc ""]
  | SEMI_STRUCTURED_TABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_types = entity_type list [@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec id_list = non_empty_string list [@@ocaml.doc ""]

type nonrec relationship_type =
  | VALUE [@ocaml.doc ""]
  | CHILD [@ocaml.doc ""]
  | COMPLEX_FEATURES [@ocaml.doc ""]
  | MERGED_CELL [@ocaml.doc ""]
  | TITLE [@ocaml.doc ""]
  | ANSWER [@ocaml.doc ""]
  | TABLE [@ocaml.doc ""]
  | TABLE_TITLE [@ocaml.doc ""]
  | TABLE_FOOTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec relationship = {
  type_ : relationship_type option;
      [@ocaml.doc
        "The type of relationship between the blocks in the IDs array and the current block. The \
         following list describes the relationship types that can be returned. \n\n\
        \ {ul\n\
        \       {-   {i VALUE} - A list that contains the ID of the VALUE block that's associated \
         with the KEY of a key-value pair.\n\
        \           \n\
        \            }\n\
        \       {-   {i CHILD} - A list of IDs that identify blocks found within the current block \
         object. For example, WORD blocks have a CHILD relationship to the LINE block type.\n\
        \           \n\
        \            }\n\
        \       {-   {i MERGED_CELL} - A list of IDs that identify each of the MERGED_CELL block \
         types in a table.\n\
        \           \n\
        \            }\n\
        \       {-   {i ANSWER} - A list that contains the ID of the QUERY_RESULT block \
         that\226\128\153s associated with the corresponding QUERY block. \n\
        \           \n\
        \            }\n\
        \       {-   {i TABLE} - A list of IDs that identify associated TABLE block types. \n\
        \           \n\
        \            }\n\
        \       {-   {i TABLE_TITLE} - A list that contains the ID for the TABLE_TITLE block type \
         in a table. \n\
        \           \n\
        \            }\n\
        \       {-   {i TABLE_FOOTER} - A list of IDs that identify the TABLE_FOOTER block types \
         in a table. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ids : id_list option;
      [@ocaml.doc
        "An array of IDs for related blocks. You can get the type of the relationship from the \
         [Type] element.\n"]
}
[@@ocaml.doc
  "Information about how blocks are related to each other. A [Block] object contains 0 or more \
   [Relation] objects in a list, [Relationships]. For more information, see [Block].\n\n\
  \ The [Type] element provides the type of the relationship for all blocks in the [IDs] array. \n\
  \ "]

type nonrec relationship_list = relationship list [@@ocaml.doc ""]

type nonrec angle = float [@@ocaml.doc ""]

type nonrec point = {
  x : float_ option; [@ocaml.doc "The value of the X coordinate for a point on a [Polygon].\n"]
  y : float_ option; [@ocaml.doc "The value of the Y coordinate for a point on a [Polygon].\n"]
}
[@@ocaml.doc
  "The X and Y coordinates of a point on a document page. The X and Y values that are returned are \
   ratios of the overall document page size. For example, if the input document is 700 x 200 and \
   the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on \
   the document page.\n\n\
  \ An array of [Point] objects, [Polygon], is returned by [DetectDocumentText]. [Polygon] \
   represents a fine-grained polygon around detected text. For more information, see Geometry in \
   the Amazon Textract Developer Guide. \n\
  \ "]

type nonrec polygon = point list [@@ocaml.doc ""]

type nonrec bounding_box = {
  width : float_ option;
      [@ocaml.doc "The width of the bounding box as a ratio of the overall document page width.\n"]
  height : float_ option;
      [@ocaml.doc
        "The height of the bounding box as a ratio of the overall document page height.\n"]
  left : float_ option;
      [@ocaml.doc
        "The left coordinate of the bounding box as a ratio of overall document page width.\n"]
  top : float_ option;
      [@ocaml.doc
        "The top coordinate of the bounding box as a ratio of overall document page height.\n"]
}
[@@ocaml.doc
  "The bounding box around the detected page, text, key-value pair, table, table cell, or \
   selection element on a document page. The [left] (x-coordinate) and [top] (y-coordinate) are \
   coordinates that represent the top and left sides of the bounding box. Note that the upper-left \
   corner of the image is the origin (0,0). \n\n\
  \ The [top] and [left] values returned are ratios of the overall document page size. For \
   example, if the input image is 700 x 200 pixels, and the top-left coordinate of the bounding \
   box is 350 x 50 pixels, the API returns a [left] value of 0.5 (350/700) and a [top] value of \
   0.25 (50/200).\n\
  \ \n\
  \  The [width] and [height] values represent the dimensions of the bounding box as a ratio of \
   the overall document page dimension. For example, if the document page size is 700 x 200 \
   pixels, and the bounding box width is 70 pixels, the width returned is 0.1. \n\
  \  "]

type nonrec geometry = {
  bounding_box : bounding_box option;
      [@ocaml.doc
        "An axis-aligned coarse representation of the location of the recognized item on the \
         document page.\n"]
  polygon : polygon option;
      [@ocaml.doc "Within the bounding box, a fine-grained polygon around the recognized item.\n"]
  rotation_angle : angle option;
      [@ocaml.doc "Provides a numerical value corresponding to the rotation of the text.\n"]
}
[@@ocaml.doc
  "Information about where the following items are located on a document page: detected page, \
   text, key-value pairs, tables, table cells, and selection elements.\n"]

type nonrec text_type = HANDWRITING [@ocaml.doc ""] | PRINTED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec percent = float [@@ocaml.doc ""]

type nonrec block_type =
  | KEY_VALUE_SET [@ocaml.doc ""]
  | PAGE [@ocaml.doc ""]
  | LINE [@ocaml.doc ""]
  | WORD [@ocaml.doc ""]
  | TABLE [@ocaml.doc ""]
  | CELL [@ocaml.doc ""]
  | SELECTION_ELEMENT [@ocaml.doc ""]
  | MERGED_CELL [@ocaml.doc ""]
  | TITLE [@ocaml.doc ""]
  | QUERY [@ocaml.doc ""]
  | QUERY_RESULT [@ocaml.doc ""]
  | SIGNATURE [@ocaml.doc ""]
  | TABLE_TITLE [@ocaml.doc ""]
  | TABLE_FOOTER [@ocaml.doc ""]
  | LAYOUT_TEXT [@ocaml.doc ""]
  | LAYOUT_TITLE [@ocaml.doc ""]
  | LAYOUT_HEADER [@ocaml.doc ""]
  | LAYOUT_FOOTER [@ocaml.doc ""]
  | LAYOUT_SECTION_HEADER [@ocaml.doc ""]
  | LAYOUT_PAGE_NUMBER [@ocaml.doc ""]
  | LAYOUT_LIST [@ocaml.doc ""]
  | LAYOUT_FIGURE [@ocaml.doc ""]
  | LAYOUT_TABLE [@ocaml.doc ""]
  | LAYOUT_KEY_VALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec block = {
  block_type : block_type option;
      [@ocaml.doc
        "The type of text item that's recognized. In operations for text detection, the following \
         types are returned:\n\n\
        \ {ul\n\
        \       {-   {i PAGE} - Contains a list of the LINE [Block] objects that are detected on a \
         document page.\n\
        \           \n\
        \            }\n\
        \       {-   {i WORD} - A word detected on a document page. A word is one or more ISO \
         basic Latin script characters that aren't separated by spaces.\n\
        \           \n\
        \            }\n\
        \       {-   {i LINE} - A string of space-delimited, contiguous words that are detected on \
         a document page.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   In text analysis operations, the following types are returned:\n\
        \   \n\
        \    {ul\n\
        \          {-   {i PAGE} - Contains a list of child [Block] objects that are detected on a \
         document page.\n\
        \              \n\
        \               }\n\
        \          {-   {i KEY_VALUE_SET} - Stores the KEY and VALUE [Block] objects for linked \
         text that's detected on a document page. Use the [EntityType] field to determine if a \
         KEY_VALUE_SET object is a KEY [Block] object or a VALUE [Block] object. \n\
        \              \n\
        \               }\n\
        \          {-   {i WORD} - A word that's detected on a document page. A word is one or \
         more ISO basic Latin script characters that aren't separated by spaces.\n\
        \              \n\
        \               }\n\
        \          {-   {i LINE} - A string of tab-delimited, contiguous words that are detected \
         on a document page.\n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE} - A table that's detected on a document page. A table is \
         grid-based information with two or more rows or columns, with a cell span of one row and \
         one column each. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_TITLE} - The title of a table. A title is typically a line of \
         text above or below a table, or embedded as the first row of a table. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_FOOTER} - The footer associated with a table. A footer is \
         typically a line or lines of text below a table or embedded as the last row of a table. \n\
        \              \n\
        \               }\n\
        \          {-   {i CELL} - A cell within a detected table. The cell is the parent of the \
         block that contains the text in the cell.\n\
        \              \n\
        \               }\n\
        \          {-   {i MERGED_CELL} - A cell in a table whose content spans more than one row \
         or column. The [Relationships] array for this cell contain data from individual cells.\n\
        \              \n\
        \               }\n\
        \          {-   {i SELECTION_ELEMENT} - A selection element such as an option button \
         (radio button) or a check box that's detected on a document page. Use the value of \
         [SelectionStatus] to determine the status of the selection element.\n\
        \              \n\
        \               }\n\
        \          {-   {i SIGNATURE} - The location and confidence score of a signature detected \
         on a document page. Can be returned as part of a Key-Value pair or a detected cell.\n\
        \              \n\
        \               }\n\
        \          {-   {i QUERY} - A question asked during the call of AnalyzeDocument. Contains \
         an alias and an ID that attaches it to its answer.\n\
        \              \n\
        \               }\n\
        \          {-   {i QUERY_RESULT} - A response to a question asked during the call of \
         analyze document. Comes with an alias and ID for ease of locating in a response. Also \
         contains location and confidence score.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following BlockTypes are only returned for Amazon Textract Layout.\n\
        \   \n\
        \    {ul\n\
        \          {-   [LAYOUT_TITLE] - The main title of the document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_HEADER] - Text located in the top margin of the document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_FOOTER] - Text located in the bottom margin of the document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_SECTION_HEADER] - The titles of sections within a document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_PAGE_NUMBER] - The page number of the documents.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_LIST] - Any information grouped together in list form. \n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_FIGURE] - Indicates the location of an image in a document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_TABLE] - Indicates the location of a table in the document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_KEY_VALUE] - Indicates the location of form key-values in a \
         document.\n\
        \              \n\
        \               }\n\
        \          {-   [LAYOUT_TEXT] - Text that is present typically as a part of paragraphs in \
         documents.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  confidence : percent option;
      [@ocaml.doc
        "The confidence score that Amazon Textract has in the accuracy of the recognized text and \
         the accuracy of the geometry points around the recognized text.\n"]
  text : string_ option;
      [@ocaml.doc "The word or line of text that's recognized by Amazon Textract. \n"]
  text_type : text_type option;
      [@ocaml.doc
        "The kind of text that Amazon Textract has detected. Can check for handwritten text and \
         printed text.\n"]
  row_index : u_integer option;
      [@ocaml.doc
        "The row in which a table cell is located. The first row position is 1. [RowIndex] isn't \
         returned by [DetectDocumentText] and [GetDocumentTextDetection].\n"]
  column_index : u_integer option;
      [@ocaml.doc
        "The column in which a table cell appears. The first column position is 1. [ColumnIndex] \
         isn't returned by [DetectDocumentText] and [GetDocumentTextDetection].\n"]
  row_span : u_integer option;
      [@ocaml.doc
        "The number of rows that a table cell spans. [RowSpan] isn't returned by \
         [DetectDocumentText] and [GetDocumentTextDetection].\n"]
  column_span : u_integer option;
      [@ocaml.doc
        "The number of columns that a table cell spans. [ColumnSpan] isn't returned by \
         [DetectDocumentText] and [GetDocumentTextDetection]. \n"]
  geometry : geometry option;
      [@ocaml.doc
        "The location of the recognized text on the image. It includes an axis-aligned, coarse \
         bounding box that surrounds the text, and a finer-grain polygon for more accurate spatial \
         information. \n"]
  id : non_empty_string option;
      [@ocaml.doc
        "The identifier for the recognized text. The identifier is only unique for a single \
         operation. \n"]
  relationships : relationship_list option;
      [@ocaml.doc
        "A list of relationship objects that describe how blocks are related to each other. For \
         example, a LINE block object contains a CHILD relationship type with the WORD blocks that \
         make up the line of text. There aren't Relationship objects in the list for relationships \
         that don't exist, such as when the current block has no child blocks.\n"]
  entity_types : entity_types option;
      [@ocaml.doc
        "The type of entity. \n\n\
        \ The following entity types can be returned by FORMS analysis:\n\
        \ \n\
        \  {ul\n\
        \        {-   {i KEY} - An identifier for a field on the document.\n\
        \            \n\
        \             }\n\
        \        {-   {i VALUE} - The field text.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following entity types can be returned by TABLES analysis:\n\
        \   \n\
        \    {ul\n\
        \          {-   {i COLUMN_HEADER} - Identifies a cell that is a header of a column. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_TITLE} - Identifies a cell that is a title within the table. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_SECTION_TITLE} - Identifies a cell that is a title of a section \
         within a table. A section title is a cell that typically spans an entire row above a \
         section. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_FOOTER} - Identifies a cell that is a footer of a table. \n\
        \              \n\
        \               }\n\
        \          {-   {i TABLE_SUMMARY} - Identifies a summary cell of a table. A summary cell \
         can be a row of a table or an additional, smaller table that contains summary information \
         for another table. \n\
        \              \n\
        \               }\n\
        \          {-   {i STRUCTURED_TABLE } - Identifies a table with column headers where the \
         content of each row corresponds to the headers. \n\
        \              \n\
        \               }\n\
        \          {-   {i SEMI_STRUCTURED_TABLE} - Identifies a non-structured table. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    [EntityTypes] isn't returned by [DetectDocumentText] and [GetDocumentTextDetection].\n\
        \   "]
  selection_status : selection_status option;
      [@ocaml.doc
        "The selection status of a selection element, such as an option button or check box. \n"]
  page : u_integer option;
      [@ocaml.doc
        "The page on which a block was detected. [Page] is returned by synchronous and \
         asynchronous operations. Page values greater than 1 are only returned for multipage \
         documents that are in PDF or TIFF format. A scanned image (JPEG/PNG) provided to an \
         asynchronous operation, even if it contains multiple document pages, is considered a \
         single-page document. This means that for scanned images the value of [Page] is always 1. \n"]
  query : query option; [@ocaml.doc "\n"]
}
[@@ocaml.doc
  "A [Block] represents items that are recognized in a document within a group of pixels close to \
   each other. The information returned in a [Block] object depends on the type of operation. In \
   text detection for documents (for example [DetectDocumentText]), you get information about the \
   detected words and lines of text. In text analysis (for example [AnalyzeDocument]), you can \
   also get information about the fields, tables, and selection elements that are detected in the \
   document.\n\n\
  \ An array of [Block] objects is returned by both synchronous and asynchronous operations. In \
   synchronous operations, such as [DetectDocumentText], the array of [Block] objects is the \
   entire set of results. In asynchronous operations, such as [GetDocumentAnalysis], the array is \
   returned over one or more responses.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html}How Amazon Textract Works}.\n\
  \  "]

type nonrec block_list = block list [@@ocaml.doc ""]

type nonrec document_metadata = {
  pages : u_integer option; [@ocaml.doc "The number of pages that are detected in the document.\n"]
}
[@@ocaml.doc "Information about the input document.\n"]

type nonrec analyze_document_response = {
  document_metadata : document_metadata option;
      [@ocaml.doc "Metadata about the analyzed document. An example is the number of pages.\n"]
  blocks : block_list option;
      [@ocaml.doc "The items that are detected and analyzed by [AnalyzeDocument].\n"]
  human_loop_activation_output : human_loop_activation_output option;
      [@ocaml.doc "Shows the results of the human in the loop evaluation.\n"]
  analyze_document_model_version : string_ option;
      [@ocaml.doc "The version of the model used to analyze the document.\n"]
}
[@@ocaml.doc ""]

type nonrec queries = query list [@@ocaml.doc ""]

type nonrec queries_config = { queries : queries [@ocaml.doc "\n"] } [@@ocaml.doc "\n"]

type nonrec content_classifier =
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION [@ocaml.doc ""]
  | FREE_OF_ADULT_CONTENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec content_classifiers = content_classifier list [@@ocaml.doc ""]

type nonrec human_loop_data_attributes = {
  content_classifiers : content_classifiers option;
      [@ocaml.doc
        "Sets whether the input image is free of personally identifiable information or adult \
         content.\n"]
}
[@@ocaml.doc
  "Allows you to set attributes of the image. Currently, you can declare an image as free of \
   personally identifiable information and adult content. \n"]

type nonrec flow_definition_arn = string [@@ocaml.doc ""]

type nonrec human_loop_name = string [@@ocaml.doc ""]

type nonrec human_loop_config = {
  human_loop_name : human_loop_name;
      [@ocaml.doc
        "The name of the human workflow used for this image. This should be kept unique within a \
         region.\n"]
  flow_definition_arn : flow_definition_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the flow definition.\n"]
  data_attributes : human_loop_data_attributes option;
      [@ocaml.doc "Sets attributes of the input data.\n"]
}
[@@ocaml.doc
  "Sets up the human review workflow the document will be sent to if one of the conditions is met. \
   You can also set certain attributes of the image before review. \n"]

type nonrec image_blob = bytes [@@ocaml.doc ""]

type nonrec document = {
  bytes : image_blob option;
      [@ocaml.doc
        "A blob of base64-encoded document bytes. The maximum size of a document that's provided \
         in a blob of bytes is 5 MB. The document bytes must be in PNG or JPEG format.\n\n\
        \ If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode \
         image bytes passed using the [Bytes] field. \n\
        \ "]
  s3_object : s3_object option;
      [@ocaml.doc
        "Identifies an S3 object as the document source. The maximum size of a document that's \
         stored in an S3 bucket is 5 MB.\n"]
}
[@@ocaml.doc
  "The input document, either as bytes or as an S3 object.\n\n\
  \ You pass image bytes to an Amazon Textract API operation by using the [Bytes] property. For \
   example, you would use the [Bytes] property to pass a document loaded from a local file system. \
   Image bytes passed by using the [Bytes] property must be base64 encoded. Your code might not \
   need to encode document file bytes if you're using an AWS SDK to call Amazon Textract API \
   operations. \n\
  \ \n\
  \  You pass images stored in an S3 bucket to an Amazon Textract API operation by using the \
   [S3Object] property. Documents stored in an S3 bucket don't need to be base64 encoded.\n\
  \  \n\
  \   The AWS Region for the S3 bucket that contains the S3 object must match the AWS Region that \
   you use for Amazon Textract operations.\n\
  \   \n\
  \    If you use the AWS CLI to call Amazon Textract operations, passing image bytes using the \
   Bytes property isn't supported. You must first upload the document to an Amazon S3 bucket, and \
   then call the operation using the S3Object property.\n\
  \    \n\
  \     For Amazon Textract to process an S3 object, the user must have permission to access the \
   S3 object. \n\
  \     "]

type nonrec analyze_document_request = {
  document : document;
      [@ocaml.doc
        "The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI \
         to call Amazon Textract operations, you can't pass image bytes. The document must be an \
         image in JPEG, PNG, PDF, or TIFF format.\n\n\
        \ If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode \
         image bytes that are passed using the [Bytes] field. \n\
        \ "]
  feature_types : feature_types;
      [@ocaml.doc
        "A list of the types of analysis to perform. Add TABLES to the list to return information \
         about the tables that are detected in the input document. Add FORMS to return detected \
         form data. Add SIGNATURES to return the locations of detected signatures. Add LAYOUT to \
         the list to return information about the layout of the document. All lines and words \
         detected in the document are included in the response (including text that isn't related \
         to the value of [FeatureTypes]). \n"]
  human_loop_config : human_loop_config option;
      [@ocaml.doc
        "Sets the configuration for the human in the loop workflow for analyzing documents.\n"]
  queries_config : queries_config option;
      [@ocaml.doc
        "Contains Queries and the alias for those Queries, as determined by the input. \n"]
  adapters_config : adapters_config option;
      [@ocaml.doc "Specifies the adapter to be used when analyzing a document.\n"]
}
[@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec expense_group_property = {
  types : string_list option;
      [@ocaml.doc "Informs you on whether the expense group is a name or an address.\n"]
  id : string_ option;
      [@ocaml.doc "Provides a group Id number, which will be the same for each in the group.\n"]
}
[@@ocaml.doc
  "Shows the group that a certain key belongs to. This helps differentiate between names and \
   addresses for different organizations, that can be hard to determine via JSON response.\n"]

type nonrec expense_group_property_list = expense_group_property list [@@ocaml.doc ""]

type nonrec expense_currency = {
  code : string_ option;
      [@ocaml.doc
        "Currency code for detected currency. the current supported codes are:\n\n\
        \ {ul\n\
        \       {-  USD\n\
        \           \n\
        \            }\n\
        \       {-  EUR\n\
        \           \n\
        \            }\n\
        \       {-  GBP\n\
        \           \n\
        \            }\n\
        \       {-  CAD\n\
        \           \n\
        \            }\n\
        \       {-  INR\n\
        \           \n\
        \            }\n\
        \       {-  JPY\n\
        \           \n\
        \            }\n\
        \       {-  CHF\n\
        \           \n\
        \            }\n\
        \       {-  AUD\n\
        \           \n\
        \            }\n\
        \       {-  CNY\n\
        \           \n\
        \            }\n\
        \       {-  BZR\n\
        \           \n\
        \            }\n\
        \       {-  SEK\n\
        \           \n\
        \            }\n\
        \       {-  HKD\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  confidence : percent option; [@ocaml.doc "Percentage confideence in the detected currency.\n"]
}
[@@ocaml.doc "Returns the kind of currency detected.\n"]

type nonrec expense_detection = {
  text : string_ option; [@ocaml.doc "The word or line of text recognized by Amazon Textract\n"]
  geometry : geometry option; [@ocaml.doc ""]
  confidence : percent option; [@ocaml.doc "The confidence in detection, as a percentage\n"]
}
[@@ocaml.doc
  "An object used to store information about the Value or Label detected by Amazon Textract.\n"]

type nonrec expense_type = {
  text : string_ option; [@ocaml.doc "The word or line of text detected by Amazon Textract.\n"]
  confidence : percent option; [@ocaml.doc "The confidence of accuracy, as a percentage.\n"]
}
[@@ocaml.doc "An object used to store information about the Type detected by Amazon Textract.\n"]

type nonrec expense_field = {
  type_ : expense_type option;
      [@ocaml.doc
        "The implied label of a detected element. Present alongside LabelDetection for explicit \
         elements.\n"]
  label_detection : expense_detection option;
      [@ocaml.doc "The explicitly stated label of a detected element.\n"]
  value_detection : expense_detection option;
      [@ocaml.doc "The value of a detected element. Present in explicit and implicit elements.\n"]
  page_number : u_integer option; [@ocaml.doc "The page number the value was detected on.\n"]
  currency : expense_currency option;
      [@ocaml.doc
        "Shows the kind of currency, both the code and confidence associated with any monatary \
         value detected.\n"]
  group_properties : expense_group_property_list option;
      [@ocaml.doc
        "Shows which group a response object belongs to, such as whether an address line belongs \
         to the vendor's address or the recipent's address.\n"]
}
[@@ocaml.doc
  "Breakdown of detected information, seperated into the catagories Type, LabelDetection, and \
   ValueDetection\n"]

type nonrec expense_field_list = expense_field list [@@ocaml.doc ""]

type nonrec line_item_fields = {
  line_item_expense_fields : expense_field_list option;
      [@ocaml.doc "ExpenseFields used to show information from detected lines on a table.\n"]
}
[@@ocaml.doc
  "A structure that holds information about the different lines found in a document's tables.\n"]

type nonrec line_item_list = line_item_fields list [@@ocaml.doc ""]

type nonrec line_item_group = {
  line_item_group_index : u_integer option;
      [@ocaml.doc
        "The number used to identify a specific table in a document. The first table encountered \
         will have a LineItemGroupIndex of 1, the second 2, etc.\n"]
  line_items : line_item_list option;
      [@ocaml.doc "The breakdown of information on a particular line of a table. \n"]
}
[@@ocaml.doc
  "A grouping of tables which contain LineItems, with each table identified by the table's \
   [LineItemGroupIndex].\n"]

type nonrec line_item_group_list = line_item_group list [@@ocaml.doc ""]

type nonrec expense_document = {
  expense_index : u_integer option;
      [@ocaml.doc
        "Denotes which invoice or receipt in the document the information is coming from. First \
         document will be 1, the second 2, and so on.\n"]
  summary_fields : expense_field_list option;
      [@ocaml.doc "Any information found outside of a table by Amazon Textract.\n"]
  line_item_groups : line_item_group_list option;
      [@ocaml.doc "Information detected on each table of a document, seperated into [LineItems].\n"]
  blocks : block_list option;
      [@ocaml.doc
        "This is a block object, the same as reported when DetectDocumentText is run on a \
         document. It provides word level recognition of text.\n"]
}
[@@ocaml.doc "The structure holding all the information returned by AnalyzeExpense\n"]

type nonrec expense_document_list = expense_document list [@@ocaml.doc ""]

type nonrec analyze_expense_response = {
  document_metadata : document_metadata option; [@ocaml.doc ""]
  expense_documents : expense_document_list option;
      [@ocaml.doc "The expenses detected by Amazon Textract.\n"]
}
[@@ocaml.doc ""]

type nonrec analyze_expense_request = { document : document [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec value_type = DATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec normalized_value = {
  value : string_ option;
      [@ocaml.doc "The value of the date, written as Year-Month-DayTHour:Minute:Second.\n"]
  value_type : value_type option;
      [@ocaml.doc "The normalized type of the value detected. In this case, DATE.\n"]
}
[@@ocaml.doc
  "Contains information relating to dates in a document, including the type of value, and the value.\n"]

type nonrec analyze_id_detections = {
  text : string_; [@ocaml.doc "Text of either the normalized field or value associated with it.\n"]
  normalized_value : normalized_value option;
      [@ocaml.doc
        "Only returned for dates, returns the type of value detected and the date written in a \
         more machine readable way.\n"]
  confidence : percent option; [@ocaml.doc "The confidence score of the detected text.\n"]
}
[@@ocaml.doc "Used to contain the information detected by an AnalyzeID operation.\n"]

type nonrec identity_document_field = {
  type_ : analyze_id_detections option; [@ocaml.doc ""]
  value_detection : analyze_id_detections option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Structure containing both the normalized type of the extracted information and the text \
   associated with it. These are extracted as Type and Value respectively.\n"]

type nonrec identity_document_field_list = identity_document_field list [@@ocaml.doc ""]

type nonrec identity_document = {
  document_index : u_integer option;
      [@ocaml.doc
        "Denotes the placement of a document in the IdentityDocument list. The first document is \
         marked 1, the second 2 and so on.\n"]
  identity_document_fields : identity_document_field_list option;
      [@ocaml.doc
        "The structure used to record information extracted from identity documents. Contains both \
         normalized field and value of the extracted text.\n"]
  blocks : block_list option;
      [@ocaml.doc "Individual word recognition, as returned by document detection.\n"]
}
[@@ocaml.doc "The structure that lists each document processed in an AnalyzeID operation.\n"]

type nonrec identity_document_list = identity_document list [@@ocaml.doc ""]

type nonrec analyze_id_response = {
  identity_documents : identity_document_list option;
      [@ocaml.doc
        "The list of documents processed by AnalyzeID. Includes a number denoting their place in \
         the list and the response structure for the document.\n"]
  document_metadata : document_metadata option; [@ocaml.doc ""]
  analyze_id_model_version : string_ option;
      [@ocaml.doc "The version of the AnalyzeIdentity API being used to process documents.\n"]
}
[@@ocaml.doc ""]

type nonrec document_pages = document list [@@ocaml.doc ""]

type nonrec analyze_id_request = {
  document_pages : document_pages; [@ocaml.doc "The document being passed to AnalyzeID.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_update = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Updating or deleting a resource can cause an inconsistent state.\n"]

type nonrec validation_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " Indicates that a request was not valid. Check request for proper formatting. \n"]

type nonrec service_quota_exceeded_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Returned when a request cannot be completed as it would exceed a maximum service quota.\n"]

type nonrec limit_exceeded_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An Amazon Textract service limit was exceeded. For example, if you start too many asynchronous \
   jobs concurrently, calls to start operations ([StartDocumentTextDetection], for example) raise \
   a LimitExceededException exception (HTTP status code: 400) until the number of concurrently \
   running jobs is below the Amazon Textract service limit. \n"]

type nonrec idempotent_parameter_mismatch_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A [ClientRequestToken] input parameter was reused with an operation, but at least one of the \
   other input parameters is different from the previous call to the operation. \n"]

type nonrec create_adapter_response = {
  adapter_id : adapter_id option;
      [@ocaml.doc "A string containing the unique ID for the adapter that has been created.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec create_adapter_request = {
  adapter_name : adapter_name;
      [@ocaml.doc "The name to be assigned to the adapter being created.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token is used to recognize the request. If the same token is used with \
         multiple CreateAdapter requests, the same session is returned. This token is employed to \
         avoid unintentionally creating the same session multiple times.\n"]
  description : adapter_description option;
      [@ocaml.doc "The description to be assigned to the adapter being created.\n"]
  feature_types : feature_types;
      [@ocaml.doc
        "The type of feature that the adapter is being trained on. Currrenly, supported feature \
         types are: [QUERIES] \n"]
  auto_update : auto_update option;
      [@ocaml.doc "Controls whether or not the adapter should automatically update.\n"]
  tags : tag_map option; [@ocaml.doc "A list of tags to be added to the adapter.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " Returned when an operation tried to access a nonexistent resource. \n"]

type nonrec invalid_kms_key_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Indicates you do not have decrypt permissions with the KMS key entered, or the KMS key was \
   entered incorrectly. \n"]

type nonrec create_adapter_version_response = {
  adapter_id : adapter_id option;
      [@ocaml.doc
        "A string containing the unique ID for the adapter that has received a new version.\n"]
  adapter_version : adapter_version option;
      [@ocaml.doc "A string describing the new version of the adapter.\n"]
}
[@@ocaml.doc ""]

type nonrec output_config = {
  s3_bucket : s3_bucket; [@ocaml.doc "The name of the bucket your output will go to.\n"]
  s3_prefix : s3_object_name option;
      [@ocaml.doc
        "The prefix of the object key that the output will be saved to. When not enabled, the \
         prefix will be \226\128\156textract_output\".\n"]
}
[@@ocaml.doc
  "Sets whether or not your output will go to a user created bucket. Used to set the name of the \
   bucket, and the prefix on the output file.\n\n\
  \  [OutputConfig] is an optional parameter which lets you adjust where your output will be \
   placed. By default, Amazon Textract will store the results internally and can only be accessed \
   by the Get API operations. With [OutputConfig] enabled, you can set the name of the bucket the \
   output will be sent to the file prefix of the results where you can download your results. \
   Additionally, you can set the [KMSKeyID] parameter to a customer master key (CMK) to encrypt \
   your output. Without this parameter set Amazon Textract will encrypt server-side using the AWS \
   managed CMK for Amazon S3.\n\
  \ \n\
  \  Decryption of Customer Content is necessary for processing of the documents by Amazon \
   Textract. If your account is opted out under an AI services opt out policy then all unencrypted \
   Customer Content is immediately and permanently deleted after the Customer Content has been \
   processed by the service. No copy of of the output is retained by Amazon Textract. For \
   information about how to opt out, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html} \
   Managing AI services opt-out policy. } \n\
  \  \n\
  \   For more information on data privacy, see the \
   {{:https://aws.amazon.com/compliance/data-privacy-faq/}Data Privacy FAQ}.\n\
  \   "]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec create_adapter_version_request = {
  adapter_id : adapter_id;
      [@ocaml.doc
        "A string containing a unique ID for the adapter that will receive a new version.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token is used to recognize the request. If the same token is used with \
         multiple CreateAdapterVersion requests, the same session is returned. This token is \
         employed to avoid unintentionally creating the same session multiple times.\n"]
  dataset_config : adapter_version_dataset_config;
      [@ocaml.doc
        "Specifies a dataset used to train a new adapter version. Takes a ManifestS3Object as the \
         value.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt \
         your documents.\n"]
  output_config : output_config; [@ocaml.doc ""]
  tags : tag_map option;
      [@ocaml.doc
        "A set of tags (key-value pairs) that you want to attach to the adapter version. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_adapter_response = unit [@@ocaml.doc ""]

type nonrec delete_adapter_request = {
  adapter_id : adapter_id;
      [@ocaml.doc "A string containing a unique ID for the adapter to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_adapter_version_response = unit [@@ocaml.doc ""]

type nonrec delete_adapter_version_request = {
  adapter_id : adapter_id;
      [@ocaml.doc "A string containing a unique ID for the adapter version that will be deleted.\n"]
  adapter_version : adapter_version; [@ocaml.doc "Specifies the adapter version to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_document_text_response = {
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Metadata about the document. It contains the number of pages that are detected in the \
         document.\n"]
  blocks : block_list option;
      [@ocaml.doc
        "An array of [Block] objects that contain the text that's detected in the document.\n"]
  detect_document_text_model_version : string_ option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec detect_document_text_request = {
  document : document;
      [@ocaml.doc
        "The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI \
         to call Amazon Textract operations, you can't pass image bytes. The document must be an \
         image in JPEG or PNG format.\n\n\
        \ If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode \
         image bytes that are passed using the [Bytes] field. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detected_signature = {
  page : u_integer option; [@ocaml.doc "The page a detected signature was found on.\n"]
}
[@@ocaml.doc "A structure that holds information regarding a detected signature on a page.\n"]

type nonrec detected_signature_list = detected_signature list [@@ocaml.doc ""]

type nonrec undetected_signature = {
  page : u_integer option; [@ocaml.doc "The page where a signature was expected but not found.\n"]
}
[@@ocaml.doc
  "A structure containing information about an undetected signature on a page where it was \
   expected but not found.\n"]

type nonrec undetected_signature_list = undetected_signature list [@@ocaml.doc ""]

type nonrec page_list = u_integer list [@@ocaml.doc ""]

type nonrec split_document = {
  index : u_integer option;
      [@ocaml.doc "The index for a given document in a DocumentGroup of a specific Type.\n"]
  pages : page_list option;
      [@ocaml.doc
        "An array of page numbers for a for a given document, ordered by logical boundary.\n"]
}
[@@ocaml.doc "Contains information about the pages of a document, defined by logical boundary.\n"]

type nonrec split_document_list = split_document list [@@ocaml.doc ""]

type nonrec document_group = {
  type_ : non_empty_string option;
      [@ocaml.doc
        "The type of document that Amazon Textract has detected. See \
         {{:https://docs.aws.amazon.com/textract/latest/dg/lending-response-objects.html}Analyze \
         Lending Response Objects} for a list of all types returned by Textract.\n"]
  split_documents : split_document_list option;
      [@ocaml.doc
        "An array that contains information about the pages of a document, defined by logical \
         boundary.\n"]
  detected_signatures : detected_signature_list option;
      [@ocaml.doc "A list of the detected signatures found in a document group.\n"]
  undetected_signatures : undetected_signature_list option;
      [@ocaml.doc "A list of any expected signatures not found in a document group.\n"]
}
[@@ocaml.doc "Summary information about documents grouped by the same document type.\n"]

type nonrec document_group_list = document_group list [@@ocaml.doc ""]

type nonrec document_location = {
  s3_object : s3_object option;
      [@ocaml.doc "The Amazon S3 bucket that contains the input document.\n"]
}
[@@ocaml.doc
  "The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous \
   operations.\n\n\
  \ The input document can be an image file in JPEG or PNG format. It can also be a file in PDF \
   format.\n\
  \ "]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec signature_detection = {
  confidence : percent option;
      [@ocaml.doc
        "The confidence, from 0 to 100, in the predicted values for a detected signature.\n"]
  geometry : geometry option; [@ocaml.doc ""]
}
[@@ocaml.doc "Information regarding a detected signature on a page.\n"]

type nonrec signature_detection_list = signature_detection list [@@ocaml.doc ""]

type nonrec lending_detection = {
  text : string_ option;
      [@ocaml.doc "The text extracted for a detected value in a lending document.\n"]
  selection_status : selection_status option;
      [@ocaml.doc
        "The selection status of a selection element, such as an option button or check box.\n"]
  geometry : geometry option; [@ocaml.doc ""]
  confidence : percent option;
      [@ocaml.doc "The confidence level for the text of a detected value in a lending document.\n"]
}
[@@ocaml.doc "The results extracted for a lending document.\n"]

type nonrec lending_detection_list = lending_detection list [@@ocaml.doc ""]

type nonrec lending_field = {
  type_ : string_ option; [@ocaml.doc "The type of the lending document.\n"]
  key_detection : lending_detection option; [@ocaml.doc ""]
  value_detections : lending_detection_list option;
      [@ocaml.doc "An array of LendingDetection objects.\n"]
}
[@@ocaml.doc
  "Holds the normalized key-value pairs returned by AnalyzeDocument, including the document type, \
   detected text, and geometry.\n"]

type nonrec lending_field_list = lending_field list [@@ocaml.doc ""]

type nonrec lending_document = {
  lending_fields : lending_field_list option; [@ocaml.doc "An array of LendingField objects.\n"]
  signature_detections : signature_detection_list option;
      [@ocaml.doc "A list of signatures detected in a lending document.\n"]
}
[@@ocaml.doc "Holds the structured data returned by AnalyzeDocument for lending documents.\n"]

type nonrec extraction = {
  lending_document : lending_document option;
      [@ocaml.doc "Holds the structured data returned by AnalyzeDocument for lending documents.\n"]
  expense_document : expense_document option; [@ocaml.doc ""]
  identity_document : identity_document option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Contains information extracted by an analysis operation after using StartLendingAnalysis.\n"]

type nonrec extraction_list = extraction list [@@ocaml.doc ""]

type nonrec get_adapter_response = {
  adapter_id : adapter_id option;
      [@ocaml.doc "A string identifying the adapter that information has been retrieved for.\n"]
  adapter_name : adapter_name option; [@ocaml.doc "The name of the requested adapter.\n"]
  creation_time : date_time option;
      [@ocaml.doc "The date and time the requested adapter was created at.\n"]
  description : adapter_description option;
      [@ocaml.doc "The description for the requested adapter.\n"]
  feature_types : feature_types option;
      [@ocaml.doc "List of the targeted feature types for the requested adapter.\n"]
  auto_update : auto_update option;
      [@ocaml.doc "Binary value indicating if the adapter is being automatically updated or not.\n"]
  tags : tag_map option;
      [@ocaml.doc
        "A set of tags (key-value pairs) associated with the adapter that has been retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_adapter_request = {
  adapter_id : adapter_id; [@ocaml.doc "A string containing a unique ID for the adapter.\n"]
}
[@@ocaml.doc ""]

type nonrec get_adapter_version_response = {
  adapter_id : adapter_id option;
      [@ocaml.doc "A string containing a unique ID for the adapter version being retrieved.\n"]
  adapter_version : adapter_version option;
      [@ocaml.doc "A string containing the adapter version that has been retrieved.\n"]
  creation_time : date_time option; [@ocaml.doc "The time that the adapter version was created.\n"]
  feature_types : feature_types option;
      [@ocaml.doc "List of the targeted feature types for the requested adapter version.\n"]
  status : adapter_version_status option;
      [@ocaml.doc "The status of the adapter version that has been requested.\n"]
  status_message : adapter_version_status_message option;
      [@ocaml.doc "A message that describes the status of the requested adapter version.\n"]
  dataset_config : adapter_version_dataset_config option;
      [@ocaml.doc
        "Specifies a dataset used to train a new adapter version. Takes a ManifestS3Objec as the \
         value.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt \
         your documents.\n"]
  output_config : output_config option; [@ocaml.doc ""]
  evaluation_metrics : adapter_version_evaluation_metrics option;
      [@ocaml.doc
        "The evaluation metrics (F1 score, Precision, and Recall) for the requested version, \
         grouped by baseline metrics and adapter version.\n"]
  tags : tag_map option;
      [@ocaml.doc "A set of tags (key-value pairs) that are associated with the adapter version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_adapter_version_request = {
  adapter_id : adapter_id;
      [@ocaml.doc
        "A string specifying a unique ID for the adapter version you want to retrieve information \
         for.\n"]
  adapter_version : adapter_version;
      [@ocaml.doc "A string specifying the adapter version you want to retrieve information for.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_job_id_exception = {
  message : string_ option; [@ocaml.doc ""]
  code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "An invalid job identifier was passed to an asynchronous analysis operation.\n"]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec pages = u_integer list [@@ocaml.doc ""]

type nonrec warning = {
  error_code : error_code option; [@ocaml.doc "The error code for the warning.\n"]
  pages : pages option; [@ocaml.doc "A list of the pages that the warning applies to.\n"]
}
[@@ocaml.doc
  "A warning about an issue that occurred during asynchronous text analysis \
   ([StartDocumentAnalysis]) or asynchronous document text detection \
   ([StartDocumentTextDetection]). \n"]

type nonrec warnings = warning list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec job_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PARTIAL_SUCCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_document_analysis_response = {
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Information about a document that Amazon Textract processed. [DocumentMetadata] is \
         returned in every page of paginated responses from an Amazon Textract video operation.\n"]
  job_status : job_status option; [@ocaml.doc "The current status of the text detection job.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Textract returns this token. You can use this token \
         in the subsequent request to retrieve the next set of text detection results.\n"]
  blocks : block_list option; [@ocaml.doc "The results of the text-analysis operation.\n"]
  warnings : warnings option;
      [@ocaml.doc "A list of warnings that occurred during the document-analysis operation.\n"]
  status_message : status_message option;
      [@ocaml.doc
        "Returns if the detection job could not be completed. Contains explanation for what error \
         occured.\n"]
  analyze_document_model_version : string_ option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec get_document_analysis_request = {
  job_id : job_id;
      [@ocaml.doc
        "A unique identifier for the text-detection job. The [JobId] is returned from \
         [StartDocumentAnalysis]. A [JobId] value is only valid for 7 days.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value that you \
         can specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 \
         results is returned. The default value is 1,000.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more blocks to retrieve), \
         Amazon Textract returns a pagination token in the response. You can use this pagination \
         token to retrieve the next set of blocks.\n"]
}
[@@ocaml.doc ""]

type nonrec get_document_text_detection_response = {
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Information about a document that Amazon Textract processed. [DocumentMetadata] is \
         returned in every page of paginated responses from an Amazon Textract video operation.\n"]
  job_status : job_status option; [@ocaml.doc "The current status of the text detection job.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Textract returns this token. You can use this token \
         in the subsequent request to retrieve the next set of text-detection results.\n"]
  blocks : block_list option; [@ocaml.doc "The results of the text-detection operation.\n"]
  warnings : warnings option;
      [@ocaml.doc
        "A list of warnings that occurred during the text-detection operation for the document.\n"]
  status_message : status_message option;
      [@ocaml.doc
        "Returns if the detection job could not be completed. Contains explanation for what error \
         occured. \n"]
  detect_document_text_model_version : string_ option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec get_document_text_detection_request = {
  job_id : job_id;
      [@ocaml.doc
        "A unique identifier for the text detection job. The [JobId] is returned from \
         [StartDocumentTextDetection]. A [JobId] value is only valid for 7 days.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results \
         is returned. The default value is 1,000.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more blocks to retrieve), \
         Amazon Textract returns a pagination token in the response. You can use this pagination \
         token to retrieve the next set of blocks.\n"]
}
[@@ocaml.doc ""]

type nonrec get_expense_analysis_response = {
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Information about a document that Amazon Textract processed. [DocumentMetadata] is \
         returned in every page of paginated responses from an Amazon Textract operation.\n"]
  job_status : job_status option; [@ocaml.doc "The current status of the text detection job.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Textract returns this token. You can use this token \
         in the subsequent request to retrieve the next set of text-detection results.\n"]
  expense_documents : expense_document_list option;
      [@ocaml.doc "The expenses detected by Amazon Textract.\n"]
  warnings : warnings option;
      [@ocaml.doc
        "A list of warnings that occurred during the text-detection operation for the document.\n"]
  status_message : status_message option;
      [@ocaml.doc
        "Returns if the detection job could not be completed. Contains explanation for what error \
         occured. \n"]
  analyze_expense_model_version : string_ option;
      [@ocaml.doc "The current model version of AnalyzeExpense.\n"]
}
[@@ocaml.doc ""]

type nonrec get_expense_analysis_request = {
  job_id : job_id;
      [@ocaml.doc
        "A unique identifier for the text detection job. The [JobId] is returned from \
         [StartExpenseAnalysis]. A [JobId] value is only valid for 7 days.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 20. If you specify a value greater than 20, a maximum of 20 results is \
         returned. The default value is 20.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more blocks to retrieve), \
         Amazon Textract returns a pagination token in the response. You can use this pagination \
         token to retrieve the next set of blocks.\n"]
}
[@@ocaml.doc ""]

type nonrec prediction = {
  value : non_empty_string option; [@ocaml.doc "The predicted value of a detected object.\n"]
  confidence : percent option; [@ocaml.doc "Amazon Textract's confidence in its predicted value.\n"]
}
[@@ocaml.doc
  "Contains information regarding predicted values returned by Amazon Textract operations, \
   including the predicted value and the confidence in the predicted value.\n"]

type nonrec prediction_list = prediction list [@@ocaml.doc ""]

type nonrec page_classification = {
  page_type : prediction_list;
      [@ocaml.doc
        "The class, or document type, assigned to a detected Page object. The class, or document \
         type, assigned to a detected Page object.\n"]
  page_number : prediction_list;
      [@ocaml.doc
        " The page number the value was detected on, relative to Amazon Textract's starting \
         position.\n"]
}
[@@ocaml.doc
  "The class assigned to a Page object detected in an input document. Contains information \
   regarding the predicted type/class of a document's page and the page number that the Page \
   object was detected on.\n"]

type nonrec lending_result = {
  page : u_integer option;
      [@ocaml.doc "The page number for a page, with regard to whole submission.\n"]
  page_classification : page_classification option;
      [@ocaml.doc "The classifier result for a given page.\n"]
  extractions : extraction_list option;
      [@ocaml.doc
        "An array of Extraction to hold structured data. e.g. normalized key value pairs instead \
         of raw OCR detections .\n"]
}
[@@ocaml.doc "Contains the detections for each page analyzed through the Analyze Lending API.\n"]

type nonrec lending_result_list = lending_result list [@@ocaml.doc ""]

type nonrec get_lending_analysis_response = {
  document_metadata : document_metadata option; [@ocaml.doc ""]
  job_status : job_status option; [@ocaml.doc " The current status of the lending analysis job.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Textract returns this token. You can use this token \
         in the subsequent request to retrieve the next set of lending results.\n"]
  results : lending_result_list option;
      [@ocaml.doc
        " Holds the information returned by one of AmazonTextract's document analysis operations \
         for the pinstripe.\n"]
  warnings : warnings option;
      [@ocaml.doc " A list of warnings that occurred during the lending analysis operation. \n"]
  status_message : status_message option;
      [@ocaml.doc
        " Returns if the lending analysis job could not be completed. Contains explanation for \
         what error occurred. \n"]
  analyze_lending_model_version : string_ option;
      [@ocaml.doc " The current model version of the Analyze Lending API.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lending_analysis_request = {
  job_id : job_id;
      [@ocaml.doc
        "A unique identifier for the lending or text-detection job. The [JobId] is returned from \
         [StartLendingAnalysis]. A [JobId] value is only valid for 7 days.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value that you \
         can specify is 30. If you specify a value greater than 30, a maximum of 30 results is \
         returned. The default value is 30.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete, Amazon Textract returns a pagination token in \
         the response. You can use this pagination token to retrieve the next set of lending \
         results.\n"]
}
[@@ocaml.doc ""]

type nonrec undetected_document_type_list = non_empty_string list [@@ocaml.doc ""]

type nonrec lending_summary = {
  document_groups : document_group_list option;
      [@ocaml.doc "Contains an array of all DocumentGroup objects.\n"]
  undetected_document_types : undetected_document_type_list option;
      [@ocaml.doc "UndetectedDocumentTypes.\n"]
}
[@@ocaml.doc "Contains information regarding DocumentGroups and UndetectedDocumentTypes.\n"]

type nonrec get_lending_analysis_summary_response = {
  document_metadata : document_metadata option; [@ocaml.doc ""]
  job_status : job_status option; [@ocaml.doc " The current status of the lending analysis job. \n"]
  summary : lending_summary option;
      [@ocaml.doc " Contains summary information for documents grouped by type.\n"]
  warnings : warnings option;
      [@ocaml.doc "A list of warnings that occurred during the lending analysis operation.\n"]
  status_message : status_message option;
      [@ocaml.doc
        "Returns if the lending analysis could not be completed. Contains explanation for what \
         error occurred.\n"]
  analyze_lending_model_version : string_ option;
      [@ocaml.doc "The current model version of the Analyze Lending API.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lending_analysis_summary_request = {
  job_id : job_id;
      [@ocaml.doc
        " A unique identifier for the lending or text-detection job. The [JobId] is returned from \
         StartLendingAnalysis. A [JobId] value is only valid for 7 days.\n"]
}
[@@ocaml.doc ""]

type nonrec job_tag = string [@@ocaml.doc ""]

type nonrec list_adapter_versions_response = {
  adapter_versions : adapter_version_list option;
      [@ocaml.doc
        "Adapter versions that match the filtering criteria specified when calling ListAdapters.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "Identifies the next page of results to return when listing adapter versions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_adapter_versions_request = {
  adapter_id : adapter_id option;
      [@ocaml.doc
        "A string containing a unique ID for the adapter to match for when listing adapter versions.\n"]
  after_creation_time : date_time option;
      [@ocaml.doc
        "Specifies the lower bound for the ListAdapterVersions operation. Ensures \
         ListAdapterVersions returns only adapter versions created after the specified creation \
         time.\n"]
  before_creation_time : date_time option;
      [@ocaml.doc
        "Specifies the upper bound for the ListAdapterVersions operation. Ensures \
         ListAdapterVersions returns only adapter versions created after the specified creation \
         time.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return when listing adapter versions.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "Identifies the next page of results to return when listing adapter versions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_adapters_response = {
  adapters : adapter_list option;
      [@ocaml.doc
        "A list of adapters that matches the filtering criteria specified when calling ListAdapters.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "Identifies the next page of results to return when listing adapters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_adapters_request = {
  after_creation_time : date_time option;
      [@ocaml.doc
        "Specifies the lower bound for the ListAdapters operation. Ensures ListAdapters returns \
         only adapters created after the specified creation time.\n"]
  before_creation_time : date_time option;
      [@ocaml.doc
        "Specifies the upper bound for the ListAdapters operation. Ensures ListAdapters returns \
         only adapters created before the specified creation time.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return when listing adapters.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "Identifies the next page of results to return when listing adapters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_map option;
      [@ocaml.doc "A set of tags (key-value pairs) that are part of the requested resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) that specifies the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec sns_topic_arn = string [@@ocaml.doc ""]

type nonrec notification_channel = {
  sns_topic_arn : sns_topic_arn;
      [@ocaml.doc "The Amazon SNS topic that Amazon Textract posts the completion status to.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract publishing \
         permissions to the Amazon SNS topic. \n"]
}
[@@ocaml.doc
  "The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes \
   the completion status of an asynchronous document operation. \n"]

type nonrec start_document_analysis_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the document text detection job. Use [JobId] to identify the job in a \
         subsequent call to [GetDocumentAnalysis]. A [JobId] value is only valid for 7 days.\n"]
}
[@@ocaml.doc ""]

type nonrec start_document_analysis_request = {
  document_location : document_location;
      [@ocaml.doc "The location of the document to be processed.\n"]
  feature_types : feature_types;
      [@ocaml.doc
        "A list of the types of analysis to perform. Add TABLES to the list to return information \
         about the tables that are detected in the input document. Add FORMS to return detected \
         form data. To perform both types of analysis, add TABLES and FORMS to [FeatureTypes]. All \
         lines and words detected in the document are included in the response (including text \
         that isn't related to the value of [FeatureTypes]). \n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "The idempotent token that you use to identify the start request. If you use the same \
         token with multiple [StartDocumentAnalysis] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidentally started more than \
         once. For more information, see \
         {{:https://docs.aws.amazon.com/textract/latest/dg/api-async.html}Calling Amazon Textract \
         Asynchronous Operations}.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier that you specify that's included in the completion notification published \
         to the Amazon SNS topic. For example, you can use [JobTag] to identify the type of \
         document that the completion notification corresponds to (such as a tax form or a \
         receipt).\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status \
         of the operation to. \n"]
  output_config : output_config option;
      [@ocaml.doc
        "Sets if the output will go to a customer defined bucket. By default, Amazon Textract will \
         save the results internally to be accessed by the GetDocumentAnalysis operation.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The KMS key used to encrypt the inference results. This can be in either Key ID or Key \
         Alias format. When a KMS key is provided, the KMS key will be used for server-side \
         encryption of the objects in the customer bucket. When this parameter is not enabled, the \
         result will be encrypted server side,using SSE-S3.\n"]
  queries_config : queries_config option; [@ocaml.doc ""]
  adapters_config : adapters_config option;
      [@ocaml.doc "Specifies the adapter to be used when analyzing a document.\n"]
}
[@@ocaml.doc ""]

type nonrec start_document_text_detection_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier of the text detection job for the document. Use [JobId] to identify the \
         job in a subsequent call to [GetDocumentTextDetection]. A [JobId] value is only valid for \
         7 days.\n"]
}
[@@ocaml.doc ""]

type nonrec start_document_text_detection_request = {
  document_location : document_location;
      [@ocaml.doc "The location of the document to be processed.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "The idempotent token that's used to identify the start request. If you use the same token \
         with multiple [StartDocumentTextDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidentally started more than \
         once. For more information, see \
         {{:https://docs.aws.amazon.com/textract/latest/dg/api-async.html}Calling Amazon Textract \
         Asynchronous Operations}.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier that you specify that's included in the completion notification published \
         to the Amazon SNS topic. For example, you can use [JobTag] to identify the type of \
         document that the completion notification corresponds to (such as a tax form or a \
         receipt).\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status \
         of the operation to. \n"]
  output_config : output_config option;
      [@ocaml.doc
        "Sets if the output will go to a customer defined bucket. By default Amazon Textract will \
         save the results internally to be accessed with the GetDocumentTextDetection operation.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The KMS key used to encrypt the inference results. This can be in either Key ID or Key \
         Alias format. When a KMS key is provided, the KMS key will be used for server-side \
         encryption of the objects in the customer bucket. When this parameter is not enabled, the \
         result will be encrypted server side,using SSE-S3.\n"]
}
[@@ocaml.doc ""]

type nonrec start_expense_analysis_response = {
  job_id : job_id option;
      [@ocaml.doc
        "A unique identifier for the text detection job. The [JobId] is returned from \
         [StartExpenseAnalysis]. A [JobId] value is only valid for 7 days.\n"]
}
[@@ocaml.doc ""]

type nonrec start_expense_analysis_request = {
  document_location : document_location;
      [@ocaml.doc "The location of the document to be processed.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "The idempotent token that's used to identify the start request. If you use the same token \
         with multiple [StartDocumentTextDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidentally started more than \
         once. For more information, see \
         {{:https://docs.aws.amazon.com/textract/latest/dg/api-async.html}Calling Amazon Textract \
         Asynchronous Operations} \n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's included in the completion notification published to the \
         Amazon SNS topic. For example, you can use [JobTag] to identify the type of document that \
         the completion notification corresponds to (such as a tax form or a receipt).\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status \
         of the operation to. \n"]
  output_config : output_config option;
      [@ocaml.doc
        "Sets if the output will go to a customer defined bucket. By default, Amazon Textract will \
         save the results internally to be accessed by the [GetExpenseAnalysis] operation.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The KMS key used to encrypt the inference results. This can be in either Key ID or Key \
         Alias format. When a KMS key is provided, the KMS key will be used for server-side \
         encryption of the objects in the customer bucket. When this parameter is not enabled, the \
         result will be encrypted server side,using SSE-S3.\n"]
}
[@@ocaml.doc ""]

type nonrec start_lending_analysis_response = {
  job_id : job_id option;
      [@ocaml.doc
        "A unique identifier for the lending or text-detection job. The [JobId] is returned from \
         [StartLendingAnalysis]. A [JobId] value is only valid for 7 days.\n"]
}
[@@ocaml.doc ""]

type nonrec start_lending_analysis_request = {
  document_location : document_location; [@ocaml.doc ""]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "The idempotent token that you use to identify the start request. If you use the same \
         token with multiple [StartLendingAnalysis] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidentally started more than \
         once. For more information, see \
         {{:https://docs.aws.amazon.com/textract/latest/dg/api-sync.html}Calling Amazon Textract \
         Asynchronous Operations}.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier that you specify to be included in the completion notification published to \
         the Amazon SNS topic. For example, you can use [JobTag] to identify the type of document \
         that the completion notification corresponds to (such as a tax form or a receipt).\n"]
  notification_channel : notification_channel option; [@ocaml.doc ""]
  output_config : output_config option; [@ocaml.doc ""]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The KMS key used to encrypt the inference results. This can be in either Key ID or Key \
         Alias format. When a KMS key is provided, the KMS key will be used for server-side \
         encryption of the objects in the customer bucket. When this parameter is not enabled, the \
         result will be encrypted server side, using SSE-S3. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) that specifies the resource to be tagged.\n"]
  tags : tag_map;
      [@ocaml.doc "A set of tags (key-value pairs) that you want to assign to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec update_adapter_response = {
  adapter_id : adapter_id option;
      [@ocaml.doc "A string containing a unique ID for the adapter that has been updated.\n"]
  adapter_name : adapter_name option;
      [@ocaml.doc "A string containing the name of the adapter that has been updated.\n"]
  creation_time : date_time option;
      [@ocaml.doc
        "An object specifying the creation time of the the adapter that has been updated.\n"]
  description : adapter_description option;
      [@ocaml.doc "A string containing the description of the adapter that has been updated.\n"]
  feature_types : feature_types option;
      [@ocaml.doc "List of the targeted feature types for the updated adapter.\n"]
  auto_update : auto_update option;
      [@ocaml.doc "The auto-update status of the adapter that has been updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_adapter_request = {
  adapter_id : adapter_id;
      [@ocaml.doc "A string containing a unique ID for the adapter that will be updated.\n"]
  description : adapter_description option;
      [@ocaml.doc "The new description to be applied to the adapter.\n"]
  adapter_name : adapter_name option; [@ocaml.doc "The new name to be applied to the adapter.\n"]
  auto_update : auto_update option;
      [@ocaml.doc "The new auto-update status to be applied to the adapter.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) that specifies the resource to be untagged.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "Specifies the tags to be removed from the resource specified by the ResourceARN.\n"]
}
[@@ocaml.doc ""]
