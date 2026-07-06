type t = Uuidm.t

let to_string = Uuidm.to_string ~upper:false
let v4_state = Random.State.make_self_init ()

(** Default generator produces random version-4 UUIDs (RFC 4122). *)
let v4 () = Uuidm.v4_gen v4_state () |> to_string

(** Global generator used by generated SDKs when auto-filling idempotency tokens. Tests can override
    this to produce deterministic values. *)
let generator = ref v4

let generate () = !generator ()
let set_generator f = generator := f

let with_generator f thunk =
  let prev = !generator in
  generator := f;
  Fun.protect thunk ~finally:(fun () -> generator := prev)
