" Returns true if the given file belongs to your test runner
function! test#bddscenario#pybdd#test_file(file) abort
  return a:file =~# '\v\.scenario$'
endfunction


" Returns test runner's arguments which will run the current file and/or line
function! test#bddscenario#pybdd#build_position(type, position) abort
  return [fnamemodify(fnamemodify(a:position['file'], ":r"), ":t")]
endfunction


" Returns processed args (if you need to do any processing)
function! test#bddscenario#pybdd#build_args(args) abort
  echo a:args
  return a:args
endfunction


" Returns the executable of your test runner
function! test#bddscenario#pybdd#executable() abort
  return 'bddtest'
  " return 'RUN_SPECIFIC_TEST_CASE='.fnamemodify(a:file, ":t").' python -c "from src.tests.bdd.test_bdd import TestBdd; unittest.main()"'
endfunction
