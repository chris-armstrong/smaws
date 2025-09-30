module Context = Context_Miou

let rng : Mirage_crypto_rng_miou_unix.rng option ref = ref None

let init () =
  rng := Some (Mirage_crypto_rng_miou_unix.initialize (module Mirage_crypto_rng.Fortuna))

let shutdown () =
  Option.iter (fun rng -> Mirage_crypto_rng_miou_unix.kill rng) !rng;
  rng := None
