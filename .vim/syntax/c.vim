" Highlight

 syntax match _cFunction display "\w\+\s*("ms=s,me=e-1
 highlight def link _cFunction Function

 syntax match _cDefType display "\<\w\{1,}_t\>"
 highlight def link _cDefType Type

 syntax match _cUnsigned display "\<u_\w\{1,}"
 highlight def link _cUnsigned Type

 syntax match _cMacro display "\<[A-Z_][A-Z0-9_]\+\>"
 highlight def link _cMacro Constant

 syntax match _cOperator display "[-|!%&*+=<>/;,.]"
 highlight def link _cOperator Keyword

 syntax match _gcc_builtin display "__\w\+\s*"
 highlight def link _gcc_builtin StorageClass

 syntax match _nr_keyw display "elif"
 highlight def link _nr_keyw Keyword


