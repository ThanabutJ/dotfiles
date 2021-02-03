" FZF related
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>

" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
