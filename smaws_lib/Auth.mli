type t = Auth_common.t

exception AuthError of string

type resolver = unit -> t

module Environment = Auth_from_environment
module Dummy = Auth_from_dummy
module Profile = Auth_from_profile_generic
