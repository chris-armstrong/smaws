(* Unsigned 64-bit integer backed by [Int64].

   The bits are stored unchanged in an [Int64.t]; "unsigned" only affects
   comparison, division/remainder, and string conversion. Arithmetic that
   already operates mod 2^64 ([add]/[sub]/[mul]/shifts/logical) delegates to
   [Int64] directly. *)

type t = Int64.t

let zero = 0L
let one = 1L
let max_int = -1L
let min_int = 0L
let of_int64 x = x
let to_int64 x = x
let of_int32 x = Int64.of_int32 x
let of_int n = if n < 0 then raise (Invalid_argument "UInt64.of_int: negative") else Int64.of_int n
let int_max = Int64.of_int Stdlib.max_int

let to_int x =
  (* unsigned compare against the largest value representable as an OCaml int *)
  if Int64.compare (Int64.add x Int64.min_int) (Int64.add int_max Int64.min_int) > 0 then
    raise (Invalid_argument "UInt64.to_int: overflow")
  else Int64.to_int x

(* Unsigned compare: flip the sign bit (add [min_int], the sign bit) so the
   signed [Int64.compare] orders the bits as unsigned. *)
let compare x y = Int64.compare (Int64.add x Int64.min_int) (Int64.add y Int64.min_int)
let equal x y = Int64.equal x y
let lt x y = compare x y < 0
let le x y = compare x y <= 0
let gt x y = compare x y > 0
let ge x y = compare x y >= 0
let add = Int64.add
let sub = Int64.sub
let mul = Int64.mul
let succ x = Int64.add x 1L
let pred x = Int64.sub x 1L
let shift_left = Int64.shift_left
let shift_right = Int64.shift_right_logical
let logand = Int64.logand
let logor = Int64.logor
let logxor = Int64.logxor
let lognot = Int64.lognot

(* Unsigned (quotient, remainder) via bit-by-bit shift-subtract with a 65-bit
   running remainder ([r_hi] is the carry bit, [r_lo] the low 64 bits). The
   invariant [r < y] (hence [r_hi = 0]) holds at the start of each iteration, so
   [r_hi] only ever carries the single bit shifted out of [r_lo]. *)
let udivmod x y =
  if Int64.equal y 0L then raise Division_by_zero
  else (
    let q = ref 0L in
    let r_hi = ref 0 in
    let r_lo = ref 0L in
    for i = 63 downto 0 do
      let carry = Int64.to_int (Int64.shift_right_logical !r_lo 63) in
      r_lo :=
        Int64.logor (Int64.shift_left !r_lo 1) (Int64.logand (Int64.shift_right_logical x i) 1L);
      r_hi := carry;
      (* [r = r_hi * 2^64 + r_lo]; [r >= y] iff the carry is set, or [r_lo >= y]
         (unsigned) when the carry is clear. *)
      let ge =
        !r_hi > 0 || Int64.compare (Int64.add !r_lo Int64.min_int) (Int64.add y Int64.min_int) >= 0
      in
      if ge then begin
        (* Subtracting [y] from a value in [y, 2y) leaves [r < y]; the borrow
           always clears the carry. *)
        r_lo := Int64.sub !r_lo y;
        r_hi := 0;
        q := Int64.logor !q (Int64.shift_left 1L i)
      end
    done;
    (!q, !r_lo))

let div x y = fst (udivmod x y)
let rem x y = snd (udivmod x y)

let to_string x =
  if Int64.equal x 0L then "0"
  else (
    let buf = Buffer.create 20 in
    let v = ref x in
    while not (Int64.equal !v 0L) do
      let q, r = udivmod !v 10L in
      Buffer.add_char buf (Char.chr (Char.code '0' + Int64.to_int r));
      v := q
    done;
    let n = Buffer.length buf in
    let s = Buffer.contents buf in
    String.init n (fun i -> s.[n - 1 - i]))

let of_string s =
  let n = String.length s in
  if n = 0 then raise (Invalid_argument "UInt64.of_string: empty")
  else (
    let acc = ref 0L in
    String.iter
      (fun c ->
        match c with
        | '0' .. '9' ->
            let d = Int64.of_int (Char.code c - Char.code '0') in
            acc := Int64.add (Int64.mul !acc 10L) d
        | _ -> raise (Invalid_argument "UInt64.of_string: non-digit"))
      s;
    !acc)

let high x = Int64.to_int32 (Int64.shift_right_logical x 32)
let low x = Int64.to_int32 x
let word32_mask = 0xFFFFFFFFL
let high_word_mask = Int64.shift_left word32_mask 32

let set_high x h =
  Int64.logor
    (Int64.shift_left (Int64.logand (Int64.of_int32 h) word32_mask) 32)
    (Int64.logand x word32_mask)

let set_low x l =
  Int64.logor (Int64.logand (Int64.of_int32 l) word32_mask) (Int64.logand x high_word_mask)

let to_bytes x =
  let b = Bytes.create 8 in
  for i = 0 to 7 do
    Bytes.set_uint8 b i (Int64.to_int (Int64.logand (Int64.shift_right_logical x (i * 8)) 0xFFL))
  done;
  b

let of_bytes b =
  if Bytes.length b <> 8 then raise (Invalid_argument "UInt64.of_bytes: need 8 bytes")
  else (
    let acc = ref 0L in
    for i = 0 to 7 do
      acc := Int64.logor !acc (Int64.shift_left (Int64.of_int (Bytes.get_uint8 b i)) (i * 8))
    done;
    !acc)

let get_byte x i = Int64.to_int (Int64.logand (Int64.shift_right_logical x (i * 8)) 0xFFL)

let set_byte x i v =
  Int64.logor
    (Int64.logand x (Int64.lognot (Int64.shift_left 0xFFL (i * 8))))
    (Int64.shift_left (Int64.of_int v) (i * 8))
