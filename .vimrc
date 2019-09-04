execute pathogen#infect()

" srcery 
set t_Co=256
colorscheme srcery

" lightline
set noshowmode

syntax on

" tabs/spaces setup
set tabstop=4
set shiftwidth=2
set expandtab
set smarttab

" wrap long lines
set wrap
set linebreak

" keep three lines above/below cursor when scrolling
set scrolloff=3
filetype plugin indent on
set number

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType go setlocal ts=2 sts=2 sw=2

" showmatch
set showmatch
set matchtime=3

" remove trailing spaces using F5 key on normal mode
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

let g:javascript_plugin_jsdoc = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

let g:srcery_italic = 1
