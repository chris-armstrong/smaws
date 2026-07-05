(** Unsigned 64-bit integer.

    Backed by [Int64] with unsigned semantics, so the full [0 .. 2^64 - 1] range
    is representable. Pure OCaml (no C): arithmetic wraps modulo 2^64 like
    [Int64]; division/remainder/comparison/string conversion interpret the bits as
    unsigned. *)

type t

(** {1 Constants} *)

val zero : t
val one : t
val max_int : t
(** [max_int = 2^64 - 1] (all bits set). *)

val min_int : t
(** [min_int = 0]. *)

(** {1 Conversions} *)

val of_int64 : Int64.t -> t
val to_int64 : t -> Int64.t
val of_int32 : Int32.t -> t
val of_int : int -> t
(** [of_int n] raises [Invalid_argument] if [n < 0]. *)

val to_int : t -> int
(** [to_int t] raises [Invalid_argument] if [t] exceeds the range of OCaml [int]. *)

val of_string : string -> t
(** Decimal, unsigned. Raises [Invalid_argument] on empty / non-digit / negative
    input. *)

val to_string : t -> string
(** Decimal, unsigned. *)

(** {1 Word access} *)

val high : t -> Int32.t
(** Top 32 bits. *)

val low : t -> Int32.t
(** Bottom 32 bits. *)

val set_high : t -> Int32.t -> t
val set_low : t -> Int32.t -> t

val to_bytes : t -> bytes
(** 8 bytes, little-endian. *)

val of_bytes : bytes -> t
(** 8 bytes, little-endian; raises [Invalid_argument] unless the length is 8. *)

val get_byte : t -> int -> int
(** [get_byte t i] returns byte [i] (0..7, little-endian) as 0..255. *)

val set_byte : t -> int -> int -> t

(** {1 Arithmetic} *)

val add : t -> t -> t
val sub : t -> t -> t
val mul : t -> t -> t
val div : t -> t -> t
(** Raises [Division_by_zero]. *)

val rem : t -> t -> t
(** Raises [Division_by_zero]. *)

val succ : t -> t
val pred : t -> t

(** {1 Comparison and logic} *)

val compare : t -> t -> int
val equal : t -> t -> bool
val lt : t -> t -> bool
val le : t -> t -> bool
val gt : t -> t -> bool
val ge : t -> t -> bool

val shift_left : t -> int -> t
val shift_right : t -> int -> t
(** Logical (unsigned) right shift. *)

val logand : t -> t -> t
val logor : t -> t -> t
val logxor : t -> t -> t
val lognot : t -> t