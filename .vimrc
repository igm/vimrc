set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'  
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
  
call plug#end()

colorscheme seoul256
" proper font selection
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Monospace\ 12
		" set guifont=Inconsolata\ 14
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
endif

set guioptions-=LlRrb " remove scrollbars from macvim
set guioptions=m

filetype plugin indent on

set number
set relativenumber
set cursorline  
set hidden     " we can change buffers without saving them
set nowrap
set nosmarttab
set nostartofline
set hlsearch
set incsearch
set splitright " new vsplits are to the right
set splitbelow " new splits are down
set autoread
set backspace=indent,eol,start
set laststatus=2 " always show the status line
set noswapfile 
set completeopt=longest,menuone


set listchars=tab:→\ ,trail:·,eol:¶ 

let mapleader = "\<Space>" " Yep, space as my leader.
nnoremap <silent> <C-L> :nohlsearch<cr>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>d :bd<cr>
nnoremap * *<c-o>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NERDTree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent><F2> :NERDTreeFocus<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" noremap <esc>t :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDChristmasTree = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin', '\.bin',  '\.so', '\.dll']
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SuperTab                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Syntastic                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_go_checkers = ['go']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               GoDev settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
" let g:go_list_type = "quickfix"
" set updatetime=250

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Golang keymaps                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <D-B> :GoDef<cr> 
noremap <C-H> :GoImplements<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TagBar                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <silent> <F3> :TagbarOpen fj<CR>
noremap <silent> <F3> :TagbarOpenAutoClose<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
