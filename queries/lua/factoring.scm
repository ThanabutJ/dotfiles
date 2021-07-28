;; Grabs all the local variable declarations.  This is useful for scope
;; variable passing.  Which variables do we need to pass to the extracted
;; function?
((local_variable_declaration
  (variable_declarator
   (identifier) @definition.local_var)))


;; grabs all the arguments that are passed into the function.  Needed for
;; function extraction, 106
((parameters
    (identifier) @definition.function_argument))

;; This is for function scope finding
(function) @definition.scope
(local_function) @definition.scope
(function_definition) @definition.scope


