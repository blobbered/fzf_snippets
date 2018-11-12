" Vim global plugin for inserting templates to make coding more efficient
" Last Change: Nov 5, 2018
" Maintainer: Blobb Ered <blobbered@gmail.com>
" License:	This file is placed in the public domain.

if exists("g:loaded_codetemplates")
  finish
endif
let g:loaded_codetemplates = 1

let s:templates_dir = expand('<sfile>:p:h') . "/snippets/"

function s:FzfInsertTemplate()
  let s:selected_template = call('fzf#run', [{'dir': s:templates_dir}])[0]
  let s:filename = s:templates_dir . s:selected_template
  execute 'read' fnameescape(s:filename)
endfunction

command! FzfInsertTemplate call s:FzfInsertTemplate()
if !hasmapto('<Plug>CodeTemplatesInsert')
  map <unique> <F2>  <Plug>CodeTemplatesInsert
endif
nnoremap <unique> <script> <Plug>CodeTemplatesInsert :FzfInsertTemplate<CR>
