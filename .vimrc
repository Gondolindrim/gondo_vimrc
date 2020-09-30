set number
syntax enable
set background=dark
colorscheme solarized
set foldmethod=marker

" Setting fold text. This was based on the code in https://vim.fandom.com/wiki/Customize_text_for_closed_folds (accessed sept 30, 2020) and adapted
set foldtext=MyFoldText()
function MyFoldText()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = " > "
" let fdnfo = prefix . "(" . string(v:foldlevel) . "," . string(foldlinecount) . ")"
  let fdnfo = prefix . "(" . string(v:foldlevel) . ")"
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction

" Removes the underlines from the foldtext to make for a cleaner visualization
hi Folded cterm=bold
