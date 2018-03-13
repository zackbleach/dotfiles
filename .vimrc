" vim:fdm=marker

" Sane Defaults {{{
filetype plugin indent on
:set undolevels=1000
:set relativenumber
:set number
" show spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Turn off swap files and backups
set nobackup
set noswapfile
set nowritebackup
set nowrap
" Persistent undo!!!!
set undofile
set undodir=~/.vim/undo
set viminfo='1000,f1


" turn evil tabs in to spaces and indent intelligently after curly braces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" }}}

" Plugins {{{
" set up vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" ALL THE PLUGINS
call plug#begin('~/.vim/plugged')
    " Plug 'ConradIrwin/vim-bracketed-paste'
    " Plug 'Lokaltog/vim-easymotion'
    " Plug 'MarcWeber/vim-addon-mw-utils'
    " Plug 'Valloric/YouCompleteMe'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'benekastah/neomake'
    " Plug 'bkad/CamelCaseMotion'
    " Plug 'bling/vim-airline'
    " Plug 'chazy/cscope_maps'
    " Plug 'frankier/neovim-colors-solarized-truecolor-only'
    " Plug 'greyblake/vim-preview'
    " Plug 'honza/vim-snippets'
    " Plug 'idanarye/vim-merginal'
    " Plug 'kirstein/ctrlp-register'
    " Plug 'mhinz/vim-grepper'
    " Plug 'rizzatti/dash.vim'
    " Plug 'terryma/vim-expand-region'
    " Plug 'tommcdo/vim-exchange'
    " Plug 'tomtom/tlib_vim'
    " Plug 'tpope/vim-obsession'
    " Plug 'vim-airline/vim-airline-themes'
    " Plug 'will133/vim-dirdiff'
    " Plug 'xolox/vim-misc'
    Plug 'majutsushi/tagbar'
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'JarrodCTaylor/vim-python-test-runner', {'for': 'python'}
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'SirVer/ultisnips'
    Plug 'benmills/vimux'
    Plug 'bps/vim-textobj-python', {'for': 'python'}
    Plug 'chrisbra/csv.vim', {'for': 'csv'}
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    Plug 'einars/js-beautify', {'for': 'javascript'}
    Plug 'ensime/ensime-vim', {'for': 'scala'}
    Plug 'epeli/slimux'
    Plug 'ervandew/supertab'
    Plug 'fisadev/vim-isort', {'for': 'python'}
    Plug 'fishbullet/deoplete-ruby'
    Plug 'fs111/pydoc.vim', {'for': 'python'}
    Plug 'janko-m/vim-test'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'kana/vim-textobj-user'
    Plug 'kien/rainbow_parentheses.vim', {'for': 'clojure'}
    Plug 'larrylv/vim-vroom'
    Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
    Plug 'mattn/gist-vim'
    Plug 'mattn/webapi-vim'
    Plug 'python-rope/ropevim', {'for': 'python'}
    Plug 'rking/ag.vim'
    Plug 'scrooloose/nerdtree', 
    Plug 'tpope/vim-classpath', {'for': 'scala, java, clojure'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fireplace', {'for': 'clojure'}
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'vim-utils/vim-ruby-fold', {'for': 'ruby'}
    Plug 'w0rp/ale'
    Plug 'tpope/vim-abolish'
call plug#end()

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" }}}

" Appearance {{{

if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacemacs-theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
:syntax enable

:set ruler

" Generic Remaps {{{
let mapleader=" "       " redefine leader

" make quitting less annoying
:command! Wq wq
:command! W w
:command! Q q
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

"highlight search
:set hlsearch
:nnoremap <Leader>8 :set hls! <cr>
:set incsearch

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>


" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" NERDTree {{{
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <c-n> :e $PWD<CR>
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeHijackNetrw=1

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '^target$']

"}}}

" Snippets
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsExpandTrigger = "<c-e>"

"Python Stuff
map <Leader>pp :w<CR> :!python %<CR>
let g:pydoc_cmd = 'python -m pydoc'

function! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" remove trailing whitespace
autocmd BufWritePre *.java,*.py,*.js,*.clj,*.cljs,*.rb :call <SID>StripTrailingWhitespace()
" autocmd BufWritePre *.py :Isort
nnoremap <Leader>pi :Isort<CR>

"Fugitive Remaps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>

" Terminal vim to be a bit more like MacVim
:set clipboard=unnamed
:set mouse=a
:set laststatus=1

noremap <Leader>c :Commentary<CR>
vnoremap <Leader>c :'<,'> Commentary<CR>

vmap < <gv
vmap > >gv

set diffopt+=vertical

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

noremap <Leader>sp :setlocal spell! spelllang=en_gb<CR>

let g:tmux_navigator_no_mappings = 10
:set nf=octal,hex,alpha
:let g:DirDiffExcludes = "*.pyc,*.class,*.o"
:set showcmd

let g:slime_target = "tmux"

map <Leader>vl :VimuxRunLastCommand<CR>

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
 set ttimeout
 set ttimeoutlen=0
 :tnoremap <Esc> <C-\><C-n>
endif

" ctags
nnoremap ]t :tnext<cr>
nnoremap [t :prev<cr>
nnoremap <leader>ts :ts<cr>
nnoremap <leader>ct :!ctags -R .<cr>
:set tags=tags;

" FZF
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-f> :FZF<cr>


" }}}
let g:python3_host_prog = '/usr/local/bin/python'
let g:ycm_server_python_interpreter = '/usr/local/opt/python2/bin/python2'


if has('nvim')
 nmap <BS> <C-h>
endif
set fillchars=vert:\ 
hi VertSplit ctermbg=NONE guibg=NONE

autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

set synmaxcol=100 

set re=1 

:nmap <Leader>cp :let @* = expand("%:p")<cr>

let g:github_enterprise_urls = ['https://git.corp.stripe.com']


nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

" vim test config
let test#strategy = "asyncrun"
let test#ruby#rspec#file_pattern = '**/test/*.rb'

" vroom.vim"{{{
let g:vroom_use_vimux=1
let g:vroom_map_keys=0

" Run the current file with vroom
map <leader>vs :VroomRunTestFile<CR>
" Runs the nearest test in the current file
map <leader>vn :VroomRunNearestTest<CR>
" Prompt for a command to run map
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <leader>vl :VroomRunLastTest<CR>
" Inspect runner pane map
map <leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <leader>vc :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <leader>vx :VimuxInterruptRunner<CR>

" when run unit test, also include current directory
" for bettern compatibility
if !exists("g:vroom_test_unit_command")
  let g:vroom_test_unit_command = 'ruby -Itest -I.'
endif

function! SetupVroomForPayServer()
  let g:vroom_test_unit_command = 'pay test'
  let g:vroom_use_bundle_exec = 0
endfunction

autocmd BufRead,BufNewFile */stripe/pay-server/* call SetupVroomForPayServer()
"}}}
"
"

set laststatus=1

map <Leader>sl :SlimuxREPLSendLine<CR>
vmap <Leader>sl :SlimuxREPLSendSelection<CR>
map <Leader>slb :SlimuxREPLSendBuffer<CR>

map <Leader>af :ALEFix<CR>

let g:ale_fixers = {
\    'ruby': ['rubocop'],
\}

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:gitgutter_enabled = 0

let g:deoplete#enable_at_startup = 1


let g:SuperTabClosePreviewOnPopupClose = 1

augroup filetypedetect
    au BufRead,BufNewFile *.pry setfiletype ruby
  augroup END

let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_OPTS = '--reverse'
