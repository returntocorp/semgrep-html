(* Generated by ocaml-tree-sitter. *)
(*
   html grammar

   entrypoint: fragment
*)

open! Sexplib.Conv
open Tree_sitter_run

type semgrep_metavariable = Token.t
[@@deriving sexp_of]

type script_start_tag_name = Token.t
[@@deriving sexp_of]

type attribute_name = Token.t (* pattern "[^<>\"'/=\\s]+" *)
[@@deriving sexp_of]

type style_start_tag_name = Token.t
[@@deriving sexp_of]

type start_tag_name = Token.t
[@@deriving sexp_of]

type doctype = Token.t (* pattern [Dd][Oo][Cc][Tt][Yy][Pp][Ee] *)
[@@deriving sexp_of]

type raw_text = Token.t
[@@deriving sexp_of]

type pat_98d585a = Token.t (* pattern "[^\"]+" *)
[@@deriving sexp_of]

type erroneous_end_tag_name = Token.t
[@@deriving sexp_of]

type implicit_end_tag = Token.t
[@@deriving sexp_of]

type pat_03aa317 = Token.t (* pattern [^>]+ *)
[@@deriving sexp_of]

type pat_58fbb2e = Token.t (* pattern "[^']+" *)
[@@deriving sexp_of]

type end_tag_name = Token.t
[@@deriving sexp_of]

type text = Token.t (* pattern [^<>]+ *)
[@@deriving sexp_of]

type attribute_value = Token.t (* pattern "[^<>\"'=\\s]+" *)
[@@deriving sexp_of]

type semgrep_end_tag = (
    Token.t (* "</" *) * semgrep_metavariable (*tok*) * Token.t (* ">" *)
)
[@@deriving sexp_of]

type quoted_attribute_value = [
    `SQUOT_opt_pat_58fbb2e_SQUOT of (
        Token.t (* "'" *)
      * pat_58fbb2e (*tok*) option
      * Token.t (* "'" *)
    )
  | `DQUOT_opt_pat_98d585a_DQUOT of (
        Token.t (* "\"" *)
      * pat_98d585a (*tok*) option
      * Token.t (* "\"" *)
    )
]
[@@deriving sexp_of]

type end_tag = (
    Token.t (* "</" *) * end_tag_name (*tok*) * Token.t (* ">" *)
)
[@@deriving sexp_of]

type attribute = (
    attribute_name (*tok*)
  * (
        Token.t (* "=" *)
      * [
            `Attr_value of attribute_value (*tok*)
          | `Quoted_attr_value of quoted_attribute_value
        ]
    )
      option
)
[@@deriving sexp_of]

type script_start_tag = (
    Token.t (* "<" *)
  * script_start_tag_name (*tok*)
  * attribute list (* zero or more *)
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type semgrep_start_tag = (
    Token.t (* "<" *)
  * semgrep_metavariable (*tok*)
  * attribute list (* zero or more *)
  * Token.t (* "/>" *)
)
[@@deriving sexp_of]

type start_tag = (
    Token.t (* "<" *)
  * start_tag_name (*tok*)
  * attribute list (* zero or more *)
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type style_start_tag = (
    Token.t (* "<" *)
  * style_start_tag_name (*tok*)
  * attribute list (* zero or more *)
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type element = [
    `Semg_elem of (semgrep_start_tag * fragment * semgrep_end_tag)
  | `Start_tag_rep_node_choice_end_tag of (
        start_tag
      * fragment
      * [ `End_tag of end_tag | `Impl_end_tag of implicit_end_tag (*tok*) ]
    )
  | `Self_clos_tag of (
        Token.t (* "<" *)
      * start_tag_name (*tok*)
      * attribute list (* zero or more *)
      * Token.t (* "/>" *)
    )
]

and fragment = node list (* zero or more *)

and node = [
    `Doct_ of (
        Token.t (* "<!" *) * doctype (*tok*) * pat_03aa317 (*tok*)
      * Token.t (* ">" *)
    )
  | `Text of text (*tok*)
  | `Elem of element
  | `Script_elem of (script_start_tag * raw_text (*tok*) option * end_tag)
  | `Style_elem of (style_start_tag * raw_text (*tok*) option * end_tag)
  | `Errons_end_tag of (
        Token.t (* "</" *) * erroneous_end_tag_name (*tok*)
      * Token.t (* ">" *)
    )
]
[@@deriving sexp_of]

type comment (* inlined *) = Token.t
[@@deriving sexp_of]

type erroneous_end_tag (* inlined *) = (
    Token.t (* "</" *) * erroneous_end_tag_name (*tok*) * Token.t (* ">" *)
)
[@@deriving sexp_of]

type doctype_ (* inlined *) = (
    Token.t (* "<!" *) * doctype (*tok*) * pat_03aa317 (*tok*)
  * Token.t (* ">" *)
)
[@@deriving sexp_of]

type self_closing_tag (* inlined *) = (
    Token.t (* "<" *)
  * start_tag_name (*tok*)
  * attribute list (* zero or more *)
  * Token.t (* "/>" *)
)
[@@deriving sexp_of]

type script_element (* inlined *) = (
    script_start_tag
  * raw_text (*tok*) option
  * end_tag
)
[@@deriving sexp_of]

type style_element (* inlined *) = (
    style_start_tag
  * raw_text (*tok*) option
  * end_tag
)
[@@deriving sexp_of]

type semgrep_element (* inlined *) = (
    semgrep_start_tag * fragment * semgrep_end_tag
)
[@@deriving sexp_of]

let dump_tree root =
  sexp_of_fragment root
  |> Print_sexp.to_stdout
