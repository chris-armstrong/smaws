let generate output_fmt =
  Fmt.pf output_fmt "include Types@\n";
  Fmt.pf output_fmt "include Builders@\n";
  Fmt.pf output_fmt "include Operations@\n"

let generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context output_fmt =
  Gen_doc.module_doc ~name ~service ~operation_shapes ~structure_shapes output_fmt;
  Fmt.pf output_fmt "open Smaws_Lib@\n@\n";
  Fmt.pf output_fmt "(** {1:types Types} *)@\n@\n";
  Gen_types.generate_mli ~name ~service ~structure_shapes ~alias_context ~no_open:true output_fmt;
  Fmt.pf output_fmt "(** {1:builders Builders} *)@\n@\n";
  Gen_builders.generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
    ~no_open:true output_fmt;
  Fmt.pf output_fmt "(** {1:operations Operations} *)@\n@\n";
  Gen_operations.generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
    ~no_open:true output_fmt
