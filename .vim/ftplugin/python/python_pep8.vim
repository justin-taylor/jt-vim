" Only do this when not done yet for this buffer
if exists("b:loaded_py_pep8")
  finish
endif

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent

let b:loaded_py_pep8 = 1
