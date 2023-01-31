source ~/.vimrc.local

"vimplug setup
call plug#begin('~/.vim/myplugins')

" Vim plugins
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'dag/vim-fish'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'



"Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-dispatch'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'
"Bundle 'majutsushi/tagbar'
"Bundle 'dag/vim-fish'
"Bundle 'kien/ctrlp.vim'
"Bundle 'rust-lang/rust.vim'
"Bundle 'rking/ag.vim'

call plug#end()

""""""""""""""""""""

let mapleader = "\<Space>"
" General
filetype off
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set shell=/bin/bash     " required when using fish
set nocompatible
set number
set splitbelow
set splitright
set ruler
set foldmethod=indent
set foldlevel=99
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=7 " light grey color column
" set scrolloff=9999      " cursor always in middle
set noswapfile
set tabstop=4 shiftwidth=4 softtabstop=4 autoindent expandtab
set hlsearch incsearch ignorecase smartcase
set mouse=a
set ttymouse=xterm2
set tags=tags;/
set cursorline
" set textwidth=80
set laststatus=2

let g:nnn#set_default_mappings = 0


set t_Co=256 " vim-airline stuff
let g:airline_theme="solarized"
hi Search cterm=NONE ctermfg=white ctermbg=blue
let NERDTreeQuitOnOpen=1


" highlights excess whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']

" nnoremap <leader>n :call NumberToggle()<cr>

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }


map <C-p> :GFiles<cr>

" jump 5 lines with C-jk
noremap <C-h> 5j
noremap <C-u> 5k

" noremap <C-h> }
" noremap <C-u> {

" easier way to go to brace
map <leader>] %
map <leader>[ %
" quickly set mark, then you can return to it with ''
map <leader>' m'
" visual select "block" chunks - any kind of structure that looks like X(){}
map     <leader>bb va{<ESC>%?(<CR>V/{<CR>%
" block-delete -- delete block chunk
map     <leader>bd <leader>bbd
" block-duplicate -- duplicate block chunk
map     <leader>bp <leader>bb<leader>vd
" edit rc - edit vimrc
map     <leader>erc :sp ~/.vimrc<cr>
" find functions in cpp file - browse through function prototype looking things
map <leader>ff /^((const )?\S+ )?\S+\(<cr>
map <leader>fF /^((const )?\S+ )?\S+\(<cr>N
map <leader>fh /^(class|struct) <cr>
map <leader>fH /^(class|struct) <cr>N
" quick bash
map     <leader>j :sh<cr>
map     <leader>m :marks<cr>
map     <leader>n :NnnPicker<cr>
" comment paragraph -- paragraph utils
map     <leader>pc vipgc
" duplicate paragraph -- paragraph utils
map     <leader>pp vip<leader>vd
" delete paragraph -- paragraph utils
" map     <leader>pd dap
nnoremap     <leader>pr /private:<cr>
" separator..
map     <leader>ps /::<cr>el<leader>\
nnoremap     <leader>pu /public:<cr>zz
" yank paragraph -- paragraph utils
map     <leader>py vipy
nnoremap <leader>pp :set paste<cr>i
nnoremap <leader>Pp :set nopaste<cr>
" rebase-pick -> change all picks to e in rebase editor
noremap <leader>rp <c-v>)kece<esc>
map     <leader>src :source ~/.vimrc<cr>
nnoremap <leader>st :call ScrollOffToggle()<cr>
"ci" .         " test-edit-string -- edit single string on this line i.e. SECTION("sdf")
noremap <leader>tes ^f
" visual duplicate -- duplicate current visual selection
noremap <leader>vd y'>o<esc>p
" clear line in esc
map     <leader>xc cc<esc>
" xxd
map     <leader>xxd :%!xxd<cr>
" xxd
map     <leader>unxxd :%!xxd -r<cr>

map <leader>\ :noh<cr>
"tet quick hl
nnoremap <leader>8 *N

inoremap jk <ESC>

" easy tab movement (yes, this overrides the emacs C-n above
nnoremap <C-n> :tabprevious<cr>
nnoremap <C-m> :tabnext<cr>

"""""""""""""""""""""""""""

" save/quit
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>
nmap <C-q> <esc>:q<cr>

" easy escape, braces
" note taking utils
inoremap jk <ESC>
inoremap ;l <CR>
inoremap kk -
inoremap jj _
inoremap []\ <esc>o{<CR>}<Esc>ko
map []\ o{<CR>}<Esc>ko


" quick ag
" nmap <leader>a :Ag<cr>

" paste


" map <leader>w <c-w><c-w>

" ----------------------------------------

" tagbar
" map <leader>x :TagbarOpenAutoClose<cr>
" map <leader>X :TagbarToggle<cr>
" map <tab> :NERDTreeToggle<cr>

" toggle scrolloff
function! ScrollOffToggle()
  if(&scrolloff == 9999)
    set scrolloff=5
  else
    set scrolloff=9999
  endif
endfunc

"wrap
function! WrapToggle()
  if(&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunc
nnoremap <leader>t :call WrapToggle()<cr>

" thanks @dbotsford!
" toggles relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    "set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

