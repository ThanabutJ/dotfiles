"let g:floaterm_wintype='split'
let g:floaterm_height=0.7
let g:floaterm_width=0.8
nnoremap <silent> <F9> :FloatermToggle main<cr><C-\><C-n>:FloatermUpdate --wintype=split --height=0.4<cr>
tnoremap <silent> <F9> <C-\><C-n>:FloatermToggle<cr>
"nnoremap <silent> <F8> :FloatermToggle main<cr><C-\><C-n>:FloatermUpdate --wintype=float position=center --height=1 --width=1<cr>
nnoremap <silent> <F8> :FloatermToggle<cr> 
tnoremap <silent> <F8> <C-\><C-n>:FloatermToggle<cr>
nnoremap <silent> <F11> :FloatermHide!<cr>
tnoremap <silent> <F11> <C-\><C-n>:FloatermHide!<cr>
"nnoremap <silent> <F12> :FloatermNew --wintype=split --height=0.4 --name=bot<cr>
nnoremap <silent> <F3> :FloatermPrev<CR>
tnoremap <silent> <F3> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F4> :FloatermNext<CR>
tnoremap <silent> <F4> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermKill<CR>
nnoremap <silent> <leader>tg :FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=lg lazygit<cr>
nnoremap <silent> <leader>td :FloatermNew --height=0.9 --width=0.8 --autoclose=2 --autohide=2 --name=ld cd ../.. ; lazydocker<cr>
