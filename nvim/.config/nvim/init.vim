let g:python3_host_prog = '/usr/bin/python'

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
" Plug 'smallwat3r/vim-efficient'
" Plug 'habamax/vim-colors-lessthan'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'vimwiki/vimwiki', { 'on':  'VimwikiIndex', 'for': 'wiki' }

" Plug 'vim-airline/vim-airline'

" Plug 'airblade/vim-rooter'
Plug 'kassio/neoterm'

" Plug 'kristijanhusak/vim-carbon-now-sh'
"
" Plug 'https://git.sr.ht/~leon_plickat/paige'

Plug 'airblade/vim-gitgutter'
" Plug 'sheerun/vim-polyglot'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'

" Plug 'w0rp/ale'
" Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Plug 'jceb/vim-orgmode'


Plug 'AndrewRadev/splitjoin.vim'

" Plug 'sjl/gundo.vim', { 'on':  'GundoShow' }

" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
" Plug 'posva/vim-vue'

Plug 'shime/vim-livedown', { 'on':  'LivedownToggle' }

" Plug 'nelsyeung/twig.vim'

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'vim-scripts/php-annotations-syntax', { 'for': 'php' }

Plug 'janko-m/vim-test' " , { 'on': ['TestNearest', 'TestFile'] }
" Plug 'metakirby5/codi.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:netrw_dirhistmax = 0

" Fix bg colors in kitty
let &t_ut=''

set title
" syntax sync minlines=256
" set synmaxcol=256 " Syntax highlight max cols
set scrolloff=999
set modeline
set backspace=2		" allow backspacing over everything in insert mode
" set whichwrap+=<,>,h,l
set nojoinspaces
set shortmess+=cT

set laststatus=2

set noswapfile
set nowritebackup
set nobackup
" set backupcopy=auto
if has("patch-8.1.0251")
  " consolidate the writebackups -- not a big
  " deal either way, since they usually get deleted
  set backupdir^=~/.vim/backup//
end
set undofile
set undodir^=~/.vim/undo//

set gdefault
set hidden

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

set updatetime=300
set signcolumn=yes

" set wildoptions=pum
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
  set inccommand=nosplit  " substitution previews
endif

" silent! call glaive#Install()
"
" let g:gruvbox_sign_column = 'bg0'
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'
" let g:gruvbox_improved_warnings = 0
" let g:gruvbox_improved_strings = 0
" let g:gruvbox_invert_selection = 0
" let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox

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

let g:fzf_tags_command = 'rg --files | ctags --links=no -L-'

command! -nargs=* Fasd
      \ call fzf#run({'source': 'fasd -l -d', 'sink': function('<sid>switch_dir')})

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

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

" nnoremap d "_d
" nnoremap dd "_dd

map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>
let test#strategy = "neoterm"
" let test#runner_commands = ['unittest', 'Phpunit', 'Jest', 'bddscenario']
let test#enabled_runners = ['php#phpunit', 'python#pyunit', 'javascript.jsx#jest', 'javascript#jest', 'bddscenario#pybdd']

function! TestTransform(cmd) abort
  let mydirname = split(getcwd(), '/')[-1]
  if filereadable("pyproject.toml")
    return 'poetry run '.a:cmd
  endif
  if getftype(expand('~/.virtualenvs/'.mydirname)) == "dir"
    return 'PYTHONPATH='.getcwd().' '.a:cmd
  endif
  if filereadable("composer.json")
    return 'PATH="$(composer config bin-dir)/:$PATH"; '.a:cmd
  endi
  return a:cmd
endfunction

let g:test#javascript#jest#file_pattern = '\v(test|spec)\.(js|jsx|coffee|ts|tsx)$'
let g:test#custom_transformations = {'custom': function('TestTransform')}
let g:test#transformation = 'custom'
let test#custom_runners = {'bddscenario': ['pybdd']}

autocmd Bufenter *.scenario set ft=bddscenario
autocmd Bufenter *.tsx set ft=typescript


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
nnoremap <c-g> :Tags<cr>
nnoremap <c-o> :GFiles?<CR>
nnoremap <c-l> :Buffers<CR>
nnoremap <c-k> :Fasd<cr>
nnoremap <c-t> :History<CR>
nnoremap <C-F> :Rg<space>
" nmap <C-F> :Rg<space>

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
" nnoremap <leader>/ :call gruvbox#hls_hide()<CR>

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

autocmd FileType javascript setlocal formatprg=eslint-fix-stdin

" LSP-NVIM
"
lua <<EOF
require'nvim_lsp'.pyls.setup{
settings = {
plugins = {
        pyls_mypy = {
            enabled = true;
        };
    };
}
}
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.gopls.setup{}
require'nvim_lsp'.intelephense.setup{}
EOF

let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'typescript' : [
			\	{'complete_items': ['ts']}
			\	],
			\'c' : [
			\	{'complete_items': ['ts']}
			\	],
			\'python' : [
			\	{'complete_items': ['lsp', 'ts']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
			\}

" COMPLETION-NVIM
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" COMPLETION-NVIM-END


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
  incremental_selection = {
      enable = true,
  }
}
EOF


" nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" command! -nargs=0 Format :call CocAction('format')
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" nmap <leader>d :call CocAction('doHover')<cr>
" xmap <leader>f  <Plug>(coc-format)
" nmap <leader>f  <Plug>(coc-format)
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " let g:coc_snippet_next = '<TAB>'
" " let g:coc_snippet_prev = '<S-TAB>'
" nmap <silent> [l <Plug>(coc-diagnostic-prev)
" nmap <silent> ]l <Plug>(coc-diagnostic-next)
" nmap <silent> <A-k> <Plug>(coc-diagnostic-prev)
" nmap <silent> <A-j> <Plug>(coc-diagnostic-next)


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
  exe ":w! " . localPaste . pasteName
  exe ":close"
  call system("rsync -a " . localPaste . " " . remotePublic)
  call system("rm " . localPaste)
  redraw!

  let @+ = remotePasteUrl . "/" . pasteName

  set clipboard+=unnamedplus

endfun
