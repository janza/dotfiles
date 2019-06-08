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
" Plug 'mattn/emmet-vim'

" Plug 'alvan/vim-closetag'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Plug 'Yggdroot/indentLine'
Plug 'kassio/neoterm'
" Plug 'kristijanhusak/vim-carbon-now-sh'

Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'

Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'


Plug 'AndrewRadev/splitjoin.vim'

" Plug 'sjl/gundo.vim', { 'on':  'GundoShow' }

" Plug 'google/vim-maktaba'
" Plug 'janza/vim-coverage'
" Plug 'google/vim-syncopate'
" Plug 'google/vim-glaive'

" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'posva/vim-vue'

Plug 'shime/vim-livedown', { 'on':  'LivedownToggle' }

Plug 'nelsyeung/twig.vim'

" Plug 'vim-airline/vim-airline'
" Plug 'liuchengxu/eleline.vim'

Plug 'fatih/vim-go'

" Plug 'juanpabloaj/vim-istanbul', { 'for': 'javascript' }

Plug 'vim-scripts/php-annotations-syntax', { 'for': 'php' }

Plug 'janko-m/vim-test' " , { 'on': ['TestNearest', 'TestFile'] }
" Plug 'metakirby5/codi.vim'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'leafgarland/typescript-vim'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:netrw_dirhistmax = 0

set background=dark

set title

" syntax sync minlines=256
" set synmaxcol=256 " Syntax highlight max cols
set scrolloff=999
set modeline
set backspace=2		" allow backspacing over everything in insert mode
" set whichwrap+=<,>,h,l
set nojoinspaces
set shortmess+=cT

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
" set fillchars+=vert:│
set foldmethod=manual

set wildoptions=pum
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

" silent! call glaive#Install()

let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_improved_warnings = 0
let g:gruvbox_improved_strings = 0
let g:gruvbox_invert_selection = 0
let g:gruvbox_italic = 1
colorscheme gruvbox

let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'GruvboxBlue'],
	\ 'fg+':     ['fg', 'GruvboxGreen'],
	\ 'bg+':     ['bg', 'GruvboxBg1'],
	\ 'hl+':     ['fg', 'GruvboxGreen'],
	\ 'info':    ['fg', 'GruvboxGreen'],
	\ 'prompt':  ['fg', 'GruvboxBlue'],
	\ 'header':  ['fg', 'GruvboxBlue'],
	\ 'pointer': ['fg', 'Error'],
	\ 'marker':  ['fg', 'Error'],
	\ 'spinner': ['fg', 'Statement'],
	\ }

let g:neoterm_shell = "zsh"
let g:neoterm_size = 13
let g:neoterm_autoscroll = 1
let g:neoterm_autojump = 1
let g:neoterm_default_mod = ':rightbelow'
" nnoremap <silent> ,<Tab> :call neoterm#close()<cr>

let g:jsx_ext_required = 0

function! s:switch_dir(directory)
  execute ':e' fnameescape(a:directory)
  execute ':cd' fnameescape(a:directory)
endfunction

command! -nargs=* Fasd
      \ call fzf#run({'source': 'fasd -l -d', 'sink': function('<sid>switch_dir')})

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

nmap ggv :execute "!git-view % " . line(".")<CR>
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#ebdbb2 guibg=#282828


let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 1
" let g:gitgutter_diff_args = '-w'
let g:gitgutter_grep = 'rg'

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='┃'
let g:gitgutter_sign_removed_first_line='┃'
let g:gitgutter_sign_modified_removed='┃'

nmap gm :LivedownToggle<CR>
map '' ysiw'

noremap 0 ^

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>
let test#strategy = "neoterm"
let g:test#runner_commands = ['pytest', 'Phpunit', 'Jest']

function! TestTransform(cmd) abort
  let mydirname = split(getcwd(), '/')[-1]
  if filereadable("pyproject.toml")
    return 'poetry run '.a:cmd
  endif
  if getftype(expand('~/.virtualenvs/'.mydirname)) == "dir"
    return 'workon '.mydirname.'; PYTHONPATH='.getcwd().' '.a:cmd
  endif
  " if filereadable("composer.json")
  "   return '$(composer config bin-dir)/'.a:cmd
  " endi
  return 'PYTHONPATH='.getcwd().' '.a:cmd
endfunction

let g:test#custom_transformations = {'custom': function('TestTransform')}
let g:test#transformation = 'custom'

nmap <C-F> :Rg<space>

nmap ge :e <C-R>=expand("%:p:h") . "/" <CR>

hi VertSplit ctermbg=NONE guibg=NONE

let g:user_emmet_leader_key='<C-E>'

au BufWritePre * :%s/\s\+$//e  " remove trailing whitespace
au FileType twig setl sw=2 ts=2 sts=2 et
au FileType jade setl sw=2 ts=2 sts=2 et
au FileType html setl sw=2 ts=2 sts=2 et
au FileType yaml setl sw=2 ts=2 sts=2 et
au FileType htmldjango setl sw=2 ts=2 sts=2 et
au FileType javascript setl sw=2 ts=2 sts=2 et
au FileType make setl noet

""
"" Fugitive
""

nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Gstatus<cr>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>


" highlight word under cursor
nmap <leader><leader> :set hls<CR>:let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>

nnoremap <c-p> :Files<cr>
nnoremap <c-o> :GFiles?<CR>
nnoremap <c-l> :Buffers<CR>
nnoremap <c-k> :Fasd<cr>
nnoremap <c-t> :History<CR>

" search for word under cursor
nnoremap <c-d> :Rg <C-R><C-W><CR>

" map q gq
map S s$
nnoremap Y y$
nnoremap M m$

map <leader>; :call Semicolonfun()<CR>
fun! Semicolonfun()
  call setline(line('.'), substitute(getline('.'), '\s*$', ';', ''))
  return "\<End>"
endfunction

" au BufEnter * set noro

map <leader>2 :set ts=2 sw=2<cr>
map <leader>4 :set ts=4 sw=4<cr>
map <leader>q :Sayonara<CR>
map <leader>w :w<CR>
nmap <silent> <leader>l :vsplit<CR>
nmap <leader>/ :nohl<CR>
nnoremap <leader>/ :call gruvbox#hls_hide()<CR>

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

map <leader>f :ALEFix<CR>
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" let g:ale_completion_enabled = 1

let g:ale_linters = {
      \'go': ['gometalinter'],
      \'javascript.jsx': ['eslint'],
      \'javascript': ['eslint'],
      \'sass': [],
      \}

nmap <leader>d :ALEGoToDefinition<CR>


let g:ale_fixers = {
      \   'javascript': ['prettier_eslint'],
      \   'javascript.jsx': ['prettier_eslint'],
      \   'go': ['goimports'],
      \   'php': ['php_cs_fixer'],
      \   'python': ['autopep8', 'isort'],
      \ }
let g:ale_php_phpmd_ruleset = '/home/josip/.phpmd.xml'
let g:ale_lint_on_text_changed = 'never'

let g:ale_javascript_prettier_standard_executable = 'prettier-standard'
let g:ale_javascript_prettier_standard_use_global = 1

let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
let g:ale_javascript_prettier_eslint_use_global = 1

let g:ale_go_goimports_executable = 'goimports'
let g:ale_go_goimports_use_global = 1

autocmd FileType javascript setlocal formatprg=eslint-fix-stdin

" nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" command! -nargs=0 Format :call CocAction('format')
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" inoremap <silent><expr> <c-space> coc#refresh()

" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <leader>j :set ft=json<BAR>%!jq .<CR>

" read custom configuration
if filereadable(".vim.custom")
  so .vim.custom
endif

let g:html_no_progress = 1
let g:html_no_pre = 1
com! -range=% HtmlPaste <line1>,<line2>call HtmlPaste()
noremap <silent> gH :HtmlPaste<cr>
fun! HtmlPaste() range
  let localPaste = "~/.paste/"
  let remotePublic = "jjanzic.com:sites/ss"
  let remotePasteUrl = "https://puull.pw/s"

  let pasteName = system("cat /dev/urandom | base64 | head -1 | tr -dc 'a-zA-Z0-9'| cut -c'1-10'")

  set clipboard=""

  exe ":".a:firstline.",".a:lastline."TOhtml"
  exe ":%s/font-family: monospace;/font-family: inconsolata, monospace;/"
  exe ":%s/font-size: 1em;/font-size: 18px;/"
  exe ":%s/1c1c1c/1d2021/"
  exe ":%s/ffd7af/f9f5d7/"
  exe ":w! " . localPaste . pasteName
  exe ":close"
  call system("rsync -a " . localPaste . " " . remotePublic)
  call system("rm " . localPaste)
  redraw!

  let @+ = remotePasteUrl . "/" . pasteName

  set clipboard+=unnamedplus

endfun
