syntax on
set number

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
set linespace=5
filetype plugin indent on

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 indentkeys-=0# indentkeys-=<:>
autocmd FileType yml setlocal ts=2 sts=2 sw=2 indentkeys-=0# indentkeys-=<:>
autocmd FileType make setlocal noexpandtab
autocmd FileType asm setlocal ts=2 sts=0 sw=4 syntax=nasm

" showmatch
set showmatch
set matchtime=3

" remove trailing spaces using F5 key on normal mode
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


" lightline
set noshowmode

" indentLine
let g:indentLine_setColors = 0

" vue
let g:vue_disable_pre_processors=1
let g:javascript_plugin_jsdoc=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0

" netrw
let g:netrw_liststyle=3

"
" plugins
"
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'posva/vim-vue'
call plug#end()
