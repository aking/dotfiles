call plug#begin()

Plug 'Olical/conjure'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'ntpeters/vim-airline-colornum'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tikhomirov/vim-glsl'
" Plug 'Shougo/deoplete.nvim'
" Plug 'ncm2/float-preview.nvim'
Plug 'wesgibbs/vim-irblack'
" Plug 'agude/vim-eldar'
" Plug 'gosukiwi/vim-atom-dark'

" Plug 'yantze/pt_black'

Plug 'eraserhd/parinfer-rust'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

set nocompatible
set relativenumber
set number
set splitbelow
set splitright
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set showcmd
" set concealcursor=nvci
set signcolumn=number

syntax on
" colorscheme atom-dark-256
colorscheme ir_black
" colorscheme pt_black
filetype plugin indent on

" disable sticky esc key
" if has('nvim')
  set ttimeout
  set ttimeoutlen=0
" endif

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

set hidden
set modelines=1
set backspace=2
set visualbell t_vb=
set laststatus=2
set updatetime=300
" if (has("termguicolors"))
"   set termguicolors
" endif

let mapleader = " "
let maplocalleader = " "
" set background=dark

" Timestamps
nnoremap <F5> "=strftime("[%Y-%m-%d %H:%M]")<CR>P
inoremap <F5> <C-R>=strftime("[%Y-%m-%d %H:%M]")<CR>

" set cursorline
set cursorline cursorcolumn
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" let g:deoplete#enable_at_startup = 1
" let g:python3_host_prog = '/usr/local/bin/python3'
" call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#show_splits = 1

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#fzf#enabled = 1

let g:airline_powerline_fonts = 1

nmap [b <Plug>AirlineSelectPrevTab
nmap ]b <Plug>AirlineSelectNextTab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" nmap <leader>f :FZF<CR>

" Close current buffer, but not the split/window
nmap <leader>d :b#<bar>bd#<CR>

" imap <leader>s <Esc>:w<CR>i
" imap <leader>S <Esc>:wa<CR>i
nmap <leader>s :w<CR>
nmap <leader>S :wa<CR>
nmap <leader>b :vspl term://~/Developer/scratch/xenon/fips build<CR>
nmap <leader>B :spl term://~/Developer/scratch/xenon/fips build<CR>
nmap <leader>q :q<CR>
nmap <leader><space> :wa<CR>:spl term://~/Developer/scratch/xenon/run.sh<CR>:norm G<CR>
nmap <leader><c-space> :wa<CR>:vspl term://~/Developer/scratch/xenon/run.sh<CR>:norm G<CR>

nmap <leader>wl <C-W>l
nmap <leader>wh <C-W>h
nmap <leader>wk <C-W>k
nmap <leader>wj <C-W>j

nmap <C-l> <C-W>l
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-j> <C-W>j

" nnoremap <silent> <C-Right> <c-w>l
" nnoremap <silent> <C-Left> <c-w>h
" nnoremap <silent> <C-Up> <c-w>k
" nnoremap <silent> <C-Down> <c-w>j

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]f     :<C-u>FZF<CR>
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> [fzf-p]ci    :<C-u>CocCommand fzf-preview.CocImplementations<CR>
nnoremap <silent> [fzf-p]cr    :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> [fzf-p]ct    :<C-u>CocCommand fzf-preview.CocTypeDefinitions<CR>
nnoremap <silent> [fzf-p]cd    :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>

nnoremap <silent> [fzf-p]cs    :<C-u>CocCommand clangd.switchSourceHeader<CR>
nmap <leader>h  :<C-u>CocCommand clangd.switchSourceHeader<CR>
nmap <silent> <leader>j  :<C-u>CocCommand clangd.symbolInfo<CR>
nnoremap <silent> <leader>r  :<C-u>CocCommand fzf-preview.CocReferences<CR>


" omni complete
" inoremap <Nul> <C-x><C-o>

set omnifunc=syntaxcomplete#Complete        " activate autocomplete with <C-X><C-O>, navigate with <C-N> and <C-P>
set completeopt=longest,menuone             " inserts the longest common text of all matches; and the menu will come up even if there's only one match.

" Make whitespace visibility toggleable
" set listchars=tab:>-,trail:·,eol:$
" nmap <silent> <leader>v :set nolist!<CR>

" clear search
" nnoremap <silent> <leader><space> :nohls<CR><C-L>
" nmap <silent> <leader><space> :nohls<CR>

" Clojure
let g:sexp_enable_insert_mode_mappings = 1

let g:clojure_fuzzy_indent_patterns = ['^doto', '^with', '^def', '^let', 'go-loop', 'match', '^context', '^GET', '^PUT', '^POST', '^PATCH', '^DELETE', '^ANY', 'this-as', '^are', '^dofor']
let g:clojure_align_multiline_strings = 1
let g:clojure_maxlines = 100
let g:clj_refactor_prefix_rewriting=0

" COC
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>u <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" whitespace
autocmd FileType markdown,sql,c,cpp,python,ruby,javascript,html,java,coffee,less,scss,css,clojure,yaml,make autocmd BufWritePre <buffer> :exe '%s/\s\+$//e'

autocmd FileType clojure setlocal commentstring=;;%s
autocmd FileType c setlocal commentstring=//%s
autocmd FileType cpp setlocal commentstring=//%s

augroup filetype
  au BufRead,BufNewFile *.md set filetype=markdown
  au BufRead,BufNewFile *.md.html set filetype=markdown
  au BufRead,BufNewFile *.mana set filetype=clojure
  au BufRead,BufNewFile *.ava  set filetype=clojure
  au BufRead,BufNewFile *.mu  set filetype=clojure
  au BufRead,BufNewFile *.v  set filetype=clojure
  au BufRead,BufNewFile *.clj set filetype=clojure
  au BufRead,BufNewFile *.cljs set filetype=clojure
  au BufRead,BufNewFile *.cljx set filetype=clojure
  au BufRead,BufNewFile *.xx set filetype=clojure
  au BufRead,BufNewFile *.vs,*.fs set filetype=glsl
  " au BufRead,BufNewFile *cljs call PareditInitBuffer()
augroup end

autocmd CursorHold * silent call CocActionAsync('highlight')

noremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
 function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
let g:airline_symbols.colnr = ''

" RainbowParen config
let g:rbpt_colorpairs = [
      \ ['201', '#FF00FF'],
      \ ['yellow', 'yellow'],
      \ ['cyan', 'cyan'],
      \ ['red', 'firebrick1'],
      \ ]

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
" else
"     let &t_SI = "\e[5 q"
"     let &t_EI = "\e[2 q"
" endif
