open Base

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none
let lident_noloc name = Location.mknoloc (Longident.Lident name)

let make_lident ~names =
  match names with
  | [] -> failwith "Empty list of names"
  | [ name ] -> Longident.Lident name
  | head :: tail ->
      let lident = Longident.Lident head in
      List.fold tail ~init:lident ~f:(fun acc name -> Longident.Ldot (acc, name))

let stri_open names =
  B.pstr_open
    (B.open_infos ~expr:(B.pmod_ident (Location.mknoloc (make_lident ~names))) ~override:Fresh)

let sigi_open names =
  B.psig_open (B.open_infos ~expr:(Location.mknoloc (make_lident ~names)) ~override:Fresh)

let exp_ident name = B.pexp_ident (lident_noloc name)
let exp_str name = B.pexp_constant (Pconst_string (name, loc, None))

let exp_fun arg_name arg_type exp =
  B.pexp_fun Nolabel None
    (B.ppat_constraint
       (B.ppat_var (Location.mknoloc arg_name))
       (B.ptyp_constr (lident_noloc arg_type) []))
    exp

let exp_fun_untyped arg_name exp =
  B.pexp_fun Nolabel None (B.ppat_var (Location.mknoloc arg_name)) exp

let const_str s = B.pexp_constant (Pconst_string (s, loc, None))
