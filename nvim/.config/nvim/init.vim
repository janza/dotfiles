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
"
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'

Plug 'alvan/vim-closetag'

Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)', 'EasyAlign' ] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'kassio/neoterm'

Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'leafgarland/typescript-vim'

Plug 'svermeulen/vim-easyclip'
Plug 'w0rp/ale'

Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'wellle/targets.vim'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

Plug 'AndrewRadev/splitjoin.vim'

Plug 'sjl/gundo.vim', { 'on':  'GundoShow' }

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}

" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" Plug 'Shougo/echodoc.vim'

Plug 'shime/vim-livedown', { 'on':  'LivedownToggle' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }

Plug 'nelsyeung/twig.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'vim-airline/vim-airline'

Plug 'fatih/vim-go'

Plug 'juanpabloaj/vim-istanbul', { 'for': 'javascript' }

Plug 'vim-scripts/php-annotations-syntax'

Plug 'cespare/vim-toml'
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile'] }

" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'

" Plug 'leafgarland/typescript-vim'

Plug 'janza/vim-hackatime'

" Plug 'posva/vim-vue'

call plug#end()

let g:netrw_dirhistmax = 0

set background=dark

" syntax sync minlines=256
" set synmaxcol=256 " Syntax highlight max cols
set scrolloff=999
set modeline
set backspace=2		" allow backspacing over everything in insert mode
" set whichwrap+=<,>,h,l
set nojoinspaces

set nobackup
set nowritebackup
" set noswapfile
set gdefault
set hidden
set undofile

set ignorecase
set smartcase
set completeopt-=preview " disable popup on top
set tabstop=4
set shiftwidth=4
set expandtab
set noautoindent
" set showcmd
" set nostartofline
set clipboard+=unnamedplus
set autowriteall
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
set iskeyword-=.
set termguicolors
let mapleader=","
let g:mapleader=","
set fillchars+=vert:│
set foldmethod=manual

set wildmode=list:longest
set wildignore=*.o,*.obj,*~
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
  set inccommand=nosplit  " substitution previews
endif

let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
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

" let g:go_fmt_fail_silently                = 1
let g:jsx_ext_required = 0

map <leader>f :ALEFix<CR>

command! -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column -S --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview('up:30%'), 1)

nmap ga <Plug>(EasyAlign)
nmap ggv :execute "!git-view % " . line(".")<CR>

let g:enable_bold_font = 1

let g:neoterm_size = 13

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

let g:airline#extensions#ale#enabled = 1

nmap gm :LivedownToggle<CR>
map '' ysiw'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap 0 ^

nmap <Tab> :Ttoggle<CR>
vnoremap <silent> <Tab> :TREPLSendSelection<CR>
let g:neoterm_autoscroll = 1
" nnoremap <silent> ,<Tab> :call neoterm#close()<cr>

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
hi! link ALEInfoSign GruvboxBlueSign

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⏺'

let g:ale_linters = {
      \'go': ['gometalinter'],
      \'javascript.jsx': ['standard'],
      \'javascript': ['standard'],
      \}

let g:ale_fixers = {
      \   'javascript': ['prettier_standard'],
      \   'go': ['goimports'],
      \ }

let g:ale_javascript_prettier_standard_executable = 'prettier-standard'
let g:ale_javascript_prettier_standard_use_global = 1

let g:ale_go_goimports_executable = 'goimports'
let g:ale_go_goimports_use_global = 1
" let g:ale_fix_on_save = 1

let g:ale_php_phpstan_level = 1

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 1

" autocmd FileType php LanguageClientStart
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_autoStart = 1

" let g:LanguageClient_serverCommands = {
"       \ 'javascript': ['javascript-typescript-stdio'],
"       \ }


" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

autocmd FileType javascript setlocal formatprg=eslint-fix-stdin
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

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
