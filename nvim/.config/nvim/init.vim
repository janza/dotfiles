let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch' " SudoWrite
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
"
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'

" Plug 'yegappan/greplace'

Plug 'alvan/vim-closetag'
" Plug 'rliang/termedit.nvim'

Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)', 'EasyAlign' ] }
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-fnr'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'kassio/neoterm', { 'on': [ 'T', 'Tmap' ] }

Plug 'airblade/vim-gitgutter'
Plug 'isRuslan/vim-es6'
" Plug 'mxw/vim-jsx'
Plug 'svermeulen/vim-easyclip'
Plug 'w0rp/ale'

" Plug 'michaeljsmith/vim-indent-object'

Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'wellle/targets.vim'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

Plug 'AndrewRadev/splitjoin.vim'

Plug 'sbdchd/neoformat', { 'on':  'Neoformat' }
Plug 'sjl/gundo.vim', { 'on':  'GundoShow' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'flowtype/vim-flow'
" Plug 'wokalski/autocomplete-flow'

" Plug 'Shougo/neosnippet.vim'
" Plug 'honza/vim-snippets'

Plug 'shime/vim-livedown', { 'on':  'LivedownToggle' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }

Plug 'nelsyeung/twig.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'vim-airline/vim-airline'

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'juanpabloaj/vim-istanbul', { 'for': 'javascript' }

Plug 'vim-scripts/php-annotations-syntax', { 'for': 'php' }

Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile'] }

" Plug 'briancollins/vim-jst'
Plug 'elixir-lang/vim-elixir'

Plug 'janza/vim-hackatime'

call plug#end()

let g:netrw_dirhistmax = 0

set background=dark

" syntax sync minlines=256
" set synmaxcol=256 " Syntax highlight max cols
set so=999
set modeline
set modelines=4
set bs=2		" allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l
set nojoinspaces

set ignorecase
set smartcase
set completeopt-=preview " disable popup on top
set tabstop=4
set shiftwidth=4
set expandtab
set noautoindent
set showcmd
set nostartofline
set clipboard+=unnamedplus
set autowriteall
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
set iskeyword-=.
set gdefault
set hidden
set undofile
set termguicolors
let mapleader=","
let g:mapleader=","
set fillchars+=vert:│
set foldmethod=manual

set wildmode=list:longest
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=node_modules/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.class,*.jar
set wildignore+=*.pdf
set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
endif

let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

" set inccommand=nosplit

colorscheme gruvbox

let g:terminal_color_0  = '#282828'
let g:terminal_color_1  = '#cc241d'
let g:terminal_color_2  = '#98971a'
let g:terminal_color_3  = '#d79921'
let g:terminal_color_4  = '#458588'
let g:terminal_color_5  = '#b16286'
let g:terminal_color_6  = '#689d6a'
let g:terminal_color_7  = '#a89984'
let g:terminal_color_8  = '#928374'
let g:terminal_color_9  = '#fb4934'
let g:terminal_color_10 = '#b8bb26'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#83a598'
let g:terminal_color_13 = '#d3869b'
let g:terminal_color_14 = '#8ec07c'
let g:terminal_color_15 = '#ebdbb2'

let g:hackatime_InfluxHost                 = 'influx.jjanzic.com'
let g:hackatime_BasicAuth                  = substitute(system('pass show influx.jjanzic.com'), "\n", "", "")
let g:neoterm_shell                       = "zsh"
let g:coverage_json_path                  = 'coverage/json/coverage-final.json'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:go_fmt_fail_silently                = 1
let g:neoformat_javascript_prettiersingle = {
      \ 'exe': 'prettier',
      \ 'args': ['--single-quote'],
      \ }

map <leader>f :Neoformat<CR>

let g:neoformat_enabled_javascript = ['prettiereslint', 'prettiersingle']

function! s:neosnippet_complete()
    " if neosnippet#expandable_or_jumpable()
    "   return "\<Plug>(neosnippet_expand_or_jump)"
    " endif
    return "\<C-N>"
endfunction

imap <expr><TAB> <SID>neosnippet_complete()

" let g:neosnippet#enable_snipmate_compatibility = 1

command! -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column -S --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview('up:30%'), 1)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap ggv :execute "!git-view % " . line(".")<CR>


let g:enable_bold_font = 1

let g:neoterm_size = 13

" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup end

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
let g:gitgutter_diff_args = '-w'

let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }

" let g:airline_section_b = ''
" let g:airline_section_x = ''
" let g:airline_section_y = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt      = '🔒'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.notexists  = ''
let g:airline_symbols.whitespace = ''

nmap gm :LivedownToggle<CR>
map '' ysiw'

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nmap <leader>i :IstanbulHide<CR>:IstanbulShow<CR>

map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>
let test#strategy = "neovim"

let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1

" nmap     <C-F> <Plug>CtrlSFPrompt
nmap     <C-F> :Rg<space>

nmap ge :e <C-R>=expand("%:p:h") . "/" <CR>

hi VertSplit ctermbg=NONE guibg=NONE

hi! link ALEErrorSign GruvboxRedSign
hi! link ALEWarningSign GruvboxYellowSign

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 1

autocmd FileType javascript set formatprg=eslint-fix-stdin

" au BufNewFile,BufRead *.ejs set filetype=html

au BufWritePre * :%s/\s\+$//e  " remove trailing whitespace
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FileType twig setl sw=2 ts=2 sts=2 et
au FileType jade setl sw=2 ts=2 sts=2 et
au FileType html setl sw=2 ts=2 sts=2 et
au FileType yaml setl sw=2 ts=2 sts=2 et
au FileType htmldjango setl sw=2 ts=2 sts=2 et
au FileType javascript setl sw=2 ts=2 sts=2 et
au FileType make setl noet
au BufNewFile,BufRead *.es6 setlocal ft=javascript
au BufNewFile,BufRead *.tag setlocal ft=javascript


""
"" Fugitive
""

nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :Gstatus --verbose<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Git status -sb<cr>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>


" FZF stuff
let g:fzf_commits_log_options = '--oneline --color=always --format="%C(auto)%h%d %C(black)%C(bold)%an %C(auto)%s %C(black)%C(bold)%cr"'

imap <c-x><c-k> <plug>(fzf-complete-word)
nnoremap <c-p> :Files<cr>
nnoremap <c-o> :GFiles?<CR>
nnoremap <c-l> :Buffers<CR>
nnoremap <c-t> :History<CR>
nnoremap <c-g> :Commits<CR>


" search for word under cursor
nnoremap <c-d> :Rg <C-R><C-W><CR>

map q gq
map q gq
map S s$
nnoremap Y y$
nnoremap M m$

map <leader>; :call Semicolonfun()<CR>
fun! Semicolonfun()
  call setline(line('.'), substitute(getline('.'), '\s*$', ';', ''))
  return "\<End>"
endfunction

au BufEnter * set noro

map <leader>2 :set ts=2 sw=2<cr>
map <leader>4 :set ts=4 sw=4<cr>
map <leader>q :Sayonara<CR>
map <leader>w :w<CR>
nmap <silent> <leader>l :vsplit<CR>
nmap <leader>/ :nohl<CR>
noremap j gj
noremap k gk
cmap w!! :SudoWrite
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
nmap <leader>p :set paste!<BAR>set paste?<CR>
vnoremap < <gv
vnoremap > >gv


" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
