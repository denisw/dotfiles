set cindent

" Use four-space indentation by default for C/C++ code.
set tabstop=4 shiftwidth=4

" Do not indent namespace declaration bodies.
" https://stackoverflow.com/questions/2549019
set cinoptions+=N-s

" Do not indent visibility labels in classes.
" https://stackoverflow.com/questions/7622564
set cinoptions+=g0
