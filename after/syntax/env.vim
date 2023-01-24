if exists('b:current_syntax') | finish|  endif

syntax keyword envExport export nextgroup=envKey
syntax match envKey "\w\+" nextgroup=envAssign
syntax match envAssign "=" contained nextgroup=envValue
syntax match envValue "." contained conceal cchar=* nextgroup=envValue

hi def link envExport Keyword
hi def link envKey Identifier
hi def link envAssignment Operator
hi def link envValue String

let b:current_syntax = 'env'
