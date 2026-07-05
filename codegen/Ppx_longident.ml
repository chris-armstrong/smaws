(* Portable shim: ppxlib uses Astlib.Longident.t internally, which differs
   from OCaml 5.4+'s Longident.t (Ldot/Lapply use loc-wrapped arguments in
   5.4+). Use this module in place of Longident when building ppxlib AST nodes. *)
include Ppxlib.Longident

let unflatten names =
  let rec go acc = function [] -> Some acc | s :: rest -> go (Ldot (acc, s)) rest in
  match names with [] -> None | head :: tail -> go (Lident head) tail
