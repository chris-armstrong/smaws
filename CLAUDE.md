# Overview

This is a set of tools for generating AWS SDks from Smithy definitions to OCaml. It incorporates a completely new implementation of the Smithy protocol.
## Hints

* The dune output directory `_build` is where all build artifacts are written. It is NOT in the search path of ripgrep by default because it is in the `.gitignore` file. You MUST manually add it to your search path if you are looking for generated code, because generated code will be written to `_build`. 
* You MUST add a dune statement for ad-hoc tests or executables. DO NOT call ocaml compiler directly
* Ad-hoc tests SHOULD be left in place and be updated as the code changes. They MUST be added as dune statements to compile and run them
* You SHOULD use the (modules ...) dune clause to specify the modules that are part of the library or executable so that you can have multiple dune target rules in the same directory.
* You MUST use a todo or checklist file to keep track of changes you have made. You MUST update this file after each step
* DO NOT try and call the ocaml compiler (ocamlc, ocamlopt) or the Ocaml top-level (ocaml) directly. Always use dune to register a new file.
* DO NOT try and verify if code works by calling the ocaml compiler directly - this does not help. You instead should try other approaches, such as type-annotating your input and output variables.
* DO NOT add new libraries to the project without asking first
* You SHOULD write concise but comprehensive commit messages
* DO NOT commit code yourself - leave this to the developer
* NEVER rebase or squash commits. DO NOT edit the commit history 
* You MUST use `dune fmt` to format code once it is confirmed working and before committing code
* The naming convention for OCaml code is snake_case for all functions and types
* The naming convention for module files is snake_case. You can refer to them by uppercasing the first letter e.g. some_module.ml is `Some_module` in the code
* Use CamelCase for type constructors
* You MUST pause after each step or phase. DO NOT continue to future steps or skip steps without the developer's approval 
* You SHOULD use the `Stdio` module to read and write to the console if `open Base` is in the file. Jane Street's `base` library obscures the `Stdlib` and hides input/output channel functions which can be  found in `Stdio`.


## Libraries
* yojson - json parsing
* xmlm - xml parsing
* base - OCaml standard library support (except in awssdklib / Smaws_Lib which must only use the OCaml standard library)
* digestif - cryptographic hash functions
* eio-ssl - SSL support
* uri - URI parsing
* logs - logging
* httpun - HTTP client
* httpun-eio - HTTP client
* ptime - time support
* ppx_deriving - support for deriving
* alcotest - testing

## Tools
* dune - build system
   + `dune build` builds everything - use it to verify code compiles after making changes
   + `dune fmt` formats the code - this should be done after making any changes to the code
   + `dune exec ./path/to/executable.exe` runs the executable defined in dune by an `(executable (name executable)...)` clause
   + `dune runtest` is an alias for running all the tests in the project
   + `dune exec ./path/to/executable.exe` runs the specific test defined in dune by an `(tests (name executable)...)` or `(test (names executable ...) ...)` clause
   + all of dunes artifacts are stored in the `_build/<context>` directory in the root of the project, with a layout that mirrors the project. For example, an executable defined in `bin/something.ml` will output to `_build/default/bin/something.exe` (assuming the default build context, which is implied)
* git is used for source code control
* opam is used for package management
* ocamlformat - use it to format code
* ripgrep - use it to search code (remember that the _build directory is not in the search path)
* jq is available for json search and manipulation
* fd is available for searching for filenames

## Repository structure

* api-models-aws/models/<model-name>/<model_name>/service/<version>/<model_name>-<version>.json - the Smithy definitions (git submodule)
* awssdklib - aka Smaws_Lib, the supprot library for Smaws used in generated code
* bin/AwsGenerator.ml - the main code generator used to make the sdks
* codegen - aka Parselib
* codegen/ast - the AST for Smithy
* codegen/codegen - code generation for the SDKs
* codegen/parse - parsing smithy definitions from json
* library_test - tests for Parselib
* model_tests - testing code for Smithy protocol definitions (in progress)
* sdkgen - the SDK generator high-level code and entry-points
* sdks - generated sdks
