set nocompatible
execute pathogen#infect()
call pathogen#incubate()
call pathogen#helptags() "call this when installing new plugins
syntax on
filetype plugin indent on

let mapleader=","

" colorscheme ir_black
colorscheme defnoche
set background=dark

" vim static clojure
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

set concealcursor=nvci
set hidden
set modelines=1
set showmode
set showcmd             " Show (partial) command in status line
set ruler
set relativenumber
set switchbuf=useopen,usetab
set autowrite
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set autoindent smartindent
"set backspace=indent,eol,start
"set noerrorbells
"set scrolloff=5
"set wildmenu
"set wildmode=list:longest
""set cursorline
set vb t_vb=
set guioptions-=r
set guioptions-=l
set guifont=Menlo:h13

set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set timeoutlen=500   " # of ms to wait on key command seq
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
imap kk <Esc>
imap jj <Esc>
imap kj <Esc>
"nnoremap <tab> %
"vnoremap <tab> %

set virtualedit=

" Make whitespace visibility toggleable
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>v :set nolist!<CR>

" Close current buffer, but not the split/window
nmap <leader>d :b#<bar>bd#<CR>

" Activate clojure ns
" Marks current spot, moves to top of 
" file, selects about form, sends it 
" to the repl pane, then moves back
" to original spot
nmap <leader>n mtggvab,<CR>'t

" Move to next window
" nmap <leader>w <c-w><c-w>

" Quieten prompts
set shortmess=atI

" Store temp files outside of our work projects
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set nowrap
set formatoptions=qrn1

" DATE
imap <leader>t <c-r>=strftime("%Y%m%d")<cr>
nmap <leader>t i<c-r>=strftime("%Y%m%d")<cr><Esc>
" nmap <leader>D i<c-r>=strftime("%Y-%m-%d %H:%M")<cr><Esc>
nmap <leader>T i<c-r>=strftime("%FT%T%z")<cr><Esc>

" Tmuxify...
let g:tmuxify_pane_split = '-v'
let g:tmuxify_global_maps = 1

nno ,x <esc>
ino ,x <esc>
" ino kj <esc>
cno ,x <c-c>
" cno kj <c-c>
"nmap ; :
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>i
imap <leader>s <Esc>:w<CR>i
imap <leader>S <Esc>:wa<CR>i
nmap <leader>s :w<CR>
nmap <leader>S :wa<CR>

map <leader>a :A<CR>
" map <leader>av :AV<CR>
" map <leader>an :IHN<CR>

nmap <leader>c :
nmap <leader>l <C-W>l
nmap <leader>h <C-W>h
nmap <leader>k <C-W>k
nmap <leader>j <C-W>j

map <silent> <leader><Enter> ,ms<cr>
" map <silent> <leader>, ,ms<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <silent> <C-S-Down> <c-w>J
nnoremap <silent> <C-S-Up> <c-w>K
nnoremap <silent> <C-S-Right> <c-w>L

" Scroll faster
nnoremap <C-e> 2j2<C-e>
nnoremap <C-y> 2k2<C-y>
vnoremap <C-e> 2j2<C-e>
vnoremap <C-y> 2k2<C-y>

" Training wheels - disable arrowkeys!
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

nmap <c-g> :b1<cr>
nmap <c-x><c-c> :b2<cr>
nmap <c-x><c-g> :b3<cr>
nmap <c-x><c-h> :b4<cr>
nmap <c-x><c-j> :b5<cr>
nmap <c-x><c-k> :b6<cr>
" nmap <c-x><c-m> :make -j6<cr>
" imap <c-x><c-m> <Esc>:w<cr>:make -j6<cr>
" nmap <c-x><c-r> :!src/x3x<cr>
" nmap <c-x><c-x> :wall<cr>:make -j4<cr>:!src/x3x<cr>
" imap <c-x><c-x> <Esc>:wall<cr>:make -j4<cr>:!src/x3x<cr>
nmap <c-x><c-m> :!./fips build<cr>
imap <c-x><c-m> <Esc>:w<cr>:!./fips build<cr>
nmap <c-x><c-r> :!./fips run x3x-sapp<cr>
nmap <c-x><c-x> :wall<cr>:!./fips build<cr>:!./fips run x3x-sapp<cr>
imap <c-x><c-x> <Esc>:wall<cr>:!./fips build<cr>:!./fips run x3x-sapp<cr>
nmap <c-x><c-s> :wall<cr>
imap <c-x><c-s> <Esc>:wall<cr>i
" nmap <c-x><c-x> mzv(((((<c-c><c-c>`z
" nmap <c-x><c-b> :update<bar>make -j4<cr>
" nmap <c-x><c-x> mzv(((((<c-c><c-c>`z
" nmap <c-x><c-b> :update<bar>make -j4<cr>

" Delete trailing whitespace
autocmd FileType clojure autocmd BufWritePre <buffer> %s/\s\+$//e

autocmd FileType c setlocal commentstring=//%s

augroup filetype
  au Syntax scm runtime! syntax/scheme.vim
  au! BufRead,BufNewFile *.proto setfiletype proto
  au BufRead,BufNewFile *.md set filetype=markdown
  au BufRead,BufNewFile *.md.html set filetype=markdown
  au BufRead,BufNewFile *.mana set filetype=clojure
  au BufRead,BufNewFile *.ava  set filetype=clojure
  au BufRead,BufNewFile *.mu  set filetype=clojure
  au BufRead,BufNewFile *.v  set filetype=clojure
  au BufRead,BufNewFile *.clj set filetype=clojure
  au BufRead,BufNewFile *.cljs set filetype=clojure
  au BufRead,BufNewFile *.cljx set filetype=clojure
  " au BufRead,BufNewFile *cljs call PareditInitBuffer()
augroup end
"au VimEnter * syntax keyword Statement lambda conceal cchar=λ
"au VimEnter * hi! link Conceal Statement
"au VimEnter * set conceallevel=2
"au Syntax * syn keyword Operator lambda conceal cchar=λ
"au Syntax * syn keyword Operator lambda conceal cchar=λ
"au Syntax * syn keyword Operator define conceal cchar=∷

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif
