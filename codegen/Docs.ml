open Base
module Ast = Smithy_ast
module Parse = Smaws_parse

let sanitize str = str
(* |> String.substr_replace_all ~pattern:"\"\"\"" ~with_:"\"\\\"\"" *)
(* |> String.substr_replace_all ~pattern:"*)" ~with_:"* )" *)
(* |> String.substr_replace_all ~pattern:"(*" ~with_:"( *" *)

type doc_type = FloatingComment | ItemComment | LabelComment

let start_comment_pattern = String.Search_pattern.create "(*"
let end_comment_pattern = String.Search_pattern.create "*)"
let at_of_doc_type = function FloatingComment -> "@" | ItemComment -> "@@" | LabelComment -> "@@@"

let convert_docs traits =
  let docStrs =
    traits |> Option.value ~default:[]
    |> List.filter_map ~f:(fun trait ->
           match trait with Ast.Trait.DocumentationTrait str -> Some (sanitize str) | _ -> None)
  in
  if List.is_empty docStrs then ""
  else begin
    let docStrs = List.concat [ [ "<body>" ]; docStrs; [ "</body>" ] ] in
    let docs = String.concat docStrs ~sep:"" |> Parse.Html.html_to_odoc in
    docs
  end

let generate type_ traits =
  let docs = convert_docs traits in
  match docs with
  | "" -> None
  | str
    when String.contains str '\"'
         || String.Search_pattern.matches start_comment_pattern str
         || String.Search_pattern.matches end_comment_pattern str ->
      Some
        ("[" ^ at_of_doc_type type_ ^ "ocaml.doc {| "
        ^ String.substr_replace_all ~pattern:"|}" ~with_:"|\\}" docs
        ^ " |}]\n")
  | str -> Some ("(** " ^ docs ^ " *)\n")

let create_doc_attr ~loc doc_string =
  let open Ppxlib in
  let doc_payload =
    PStr [ Ast_builder.Default.pstr_eval ~loc (Ast_builder.Default.estring ~loc doc_string) [] ]
  in
  Ast_builder.Default.attribute ~loc ~name:(Loc.make ~loc "ocaml.doc") ~payload:doc_payload

let attach_doc_to_structure_item ~loc ~doc_string str_item =
  let open Ppxlib in
  let doc_attr = create_doc_attr ~loc doc_string in
  {
    str_item with
    pstr_desc =
      (match str_item.pstr_desc with
      | Pstr_module mb -> Pstr_module { mb with pmb_attributes = doc_attr :: mb.pmb_attributes }
      | Pstr_type (rf, type_decls) ->
          Pstr_type
            ( rf,
              List.map
                ~f:(fun td -> { td with ptype_attributes = doc_attr :: td.ptype_attributes })
                type_decls )
      | Pstr_value (rec_flag, value_bindings) ->
          Pstr_value
            ( rec_flag,
              List.map
                ~f:(fun vb -> { vb with pvb_attributes = doc_attr :: vb.pvb_attributes })
                value_bindings )
      | other -> failwith "unsupported structure item to attach documentation");
  }

(* Attach documentation to a signature item *)
let attach_doc_to_signature_item ~loc ~doc_string sig_item =
  let open Ppxlib in
  let doc_attr = create_doc_attr ~loc doc_string in
  {
    sig_item with
    psig_desc =
      (match sig_item.psig_desc with
      | Psig_module md -> Psig_module { md with pmd_attributes = doc_attr :: md.pmd_attributes }
      | Psig_modtype mtd ->
          Psig_modtype { mtd with pmtd_attributes = doc_attr :: mtd.pmtd_attributes }
      | Psig_value vd -> Psig_value { vd with pval_attributes = doc_attr :: vd.pval_attributes }
      | Psig_typext te ->
          Psig_typext { te with ptyext_attributes = doc_attr :: te.ptyext_attributes }
      | Psig_exception ed ->
          Psig_exception { ed with ptyexn_attributes = doc_attr :: ed.ptyexn_attributes }
      | Psig_recmodule mds ->
          Psig_recmodule
            (List.map ~f:(fun md -> { md with pmd_attributes = doc_attr :: md.pmd_attributes }) mds)
      | Psig_class cls ->
          Psig_class
            (List.map ~f:(fun c -> { c with pci_attributes = doc_attr :: c.pci_attributes }) cls)
      | Psig_class_type cts ->
          Psig_class_type
            (List.map ~f:(fun ct -> { ct with pci_attributes = doc_attr :: ct.pci_attributes }) cts)
      | Psig_type (rf, type_decls) ->
          Psig_type
            ( rf,
              List.map
                ~f:(fun td -> { td with ptype_attributes = doc_attr :: td.ptype_attributes })
                type_decls )
      | other ->
          failwith "Unsupported signature item to attach documentation"
          (* Handle other signature item types as needed *));
  }
