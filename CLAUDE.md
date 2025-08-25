# Overview

This is a set of tools for generating AWS SDks from Smithy definitions to OCaml. It incorporates a completely new implementation of the Smithy protocol.

## Rules

* Don't add new libraries to the project without asking first
* Commit messages can be suggested first but seek confirmation before making commits
* Never rebase or squash commits
* Use `dune fmt` to format code once it is confirmed working and before committing code
* Naming convention for OCaml code is snake_case for all functions and types
* Use CamelCase for type constructors
* Modules should be Snake_case (with a capital letter for the first letter but snaked otherwise. Its filename is just snake case (OCaml capitalises the first letter when referring to the corresponding module in code)
* Never use git or commit changes or modify the git history
* Stop after each phase to give the developer a chance to review the code and commit it themselves

### Refactoring code

* Write a plan or design document to the @refactoring/ directory e.g. `refactoring/namespace.md`
* Before starting a refactoring, create a corresponding todo file in the @refactoring/ directory with `.todo.md` extension e.g. `refactoring/namespace.todo.md`
* After making a change, update the todo file

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
* git 
* opam is used for package management
* ocamlformat - use it to format code

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
