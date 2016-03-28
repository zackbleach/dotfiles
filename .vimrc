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
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'scrooloose/nerdtree', 
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'frankier/neovim-colors-solarized-truecolor-only'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'Valloric/YouCompleteMe'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'kien/rainbow_parentheses.vim', {'for': 'clojure'}
    Plug 'Lokaltog/vim-easymotion'
    Plug 'chrisbra/csv.vim', {'for': 'csv'}
    Plug 'tpope/vim-abolish'
    Plug 'fs111/pydoc.vim', {'for': 'python'}
    Plug 'greyblake/vim-preview'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'bling/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'kirstein/ctrlp-register'
    Plug 'rking/ag.vim'
    Plug 'bkad/CamelCaseMotion'
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-surround'
    Plug 'tommcdo/vim-exchange'
    Plug 'xolox/vim-misc'
    Plug 'mattn/gist-vim'
    Plug 'mattn/webapi-vim'
    Plug 'fisadev/vim-isort', {'for': 'python'}
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'einars/js-beautify', {'for': 'javascript'}
    Plug 'JarrodCTaylor/vim-python-test-runner', {'for': 'python'}
    Plug 'python-rope/ropevim', {'for': 'python'}
    Plug 'will133/vim-dirdiff'
    Plug 'jpalardy/vim-slime', {'for': 'clojure'}
    Plug 'tpope/vim-obsession'
    Plug 'benmills/vimux'
    Plug 'benekastah/neomake'
    Plug 'mhinz/vim-grepper'
    Plug 'kana/vim-textobj-user'
    Plug 'bps/vim-textobj-python', {'for': 'python'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fireplace', {'for': 'clojure'}
    Plug 'chazy/cscope_maps'
    Plug 'chriskempson/base16-vim'
    Plug 'rizzatti/dash.vim'
    Plug 'tpope/vim-classpath'
    Plug 'ensime/ensime-vim', {'for': 'scala'}
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
    Plug 'w0ng/vim-hybrid'
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'idanarye/vim-merginal'
    Plug 'tpope/vim-rhubarb'
    Plug 'jceb/vim-orgmode'
    Plug 'MattesGroeger/vim-bookmarks'

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
" color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let g:solarized_termtrans=1
" let g:solarized_contrast="medium"
" let g:solarized_termcolors=16
" set background=dark
:syntax enable

" other
:set ruler
"}}}

" Neomake {{{

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

let g:neomake_error_sign = {
       \ 'text': 'E>',
       \ 'texthl': 'SignError',
       \ }

let g:neomake_warning_sign = {
       \ 'text': 'W>',
       \ 'texthl': 'SignWarning',
       \ }

autocmd! InsertLeave,TextChanged,BufWritePost *.py update | :Neomake
autocmd! BufWritePost *.rb update | :Neomake

" custom highlght groups for linters
highlight SignError ctermfg=1 
highlight SignWarning ctermfg=3 

highlight SignColumn ctermbg=0
highlight Error ctermbg=0
" }}}

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

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>


" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" tab remapping
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>

" }}}
" NERDTree {{{
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <c-n> :e $PWD<CR>
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeHijackNetrw=1

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '^target$']

"}}}

" YouCompleteMe {{{
"
"
let g:ycm_seed_identifiers_with_syntax = 1
" dont want any random buffers popping up
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" prevent interference with eclim locate buffer"
let g:ycm_filetype_blacklist = {
    \ 'locate_prompt' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'text' : 1,
\}
" j and k for autocomplete
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))
" tab through autocomplete suggestions
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"}}}


nnoremap <leader>ag  :Grepper! -tool ag  -open -switch<cr>

" Tag bar toggle
nnoremap <C-O> :TagbarToggle<CR>

" Snippets
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<c- >"

"how do I
map <Leader>? <Plug>Howdoi


" Markdown Preview
nnoremap <Leader>pf :Preview<CR>

" Eclipse like line swapping
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
       
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> ˚ :call <SID>swap_up()<CR>
noremap <silent> ∆ :call <SID>swap_down()<CR>

"Python Stuff
map <Leader>pp :w<CR> :!python %<CR>
let g:pydoc_cmd = 'python -m pydoc'

" Java Stuff
map <Leader>mcp :Mvn clean package -DskipTests=true<CR>
map <Leader>mci :Mvn clean install -DskipTests=true<CR>
nnoremap <Leader>ma :Mvn dependency:analyze<CR>

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

" Eclim {{{
" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavaSearchSingleResult = 'edit'
let g:EclimValidateSortResults = 'severity'
nnoremap <Leader>jc :JavaCorrect<CR>
nnoremap <Leader>jf :%JavaFormat<CR>
nnoremap <Leader>jg :JavaSearchContext<CR>
nnoremap <Leader>ji :JavaImport<CR>
nnoremap <Leader>jo :JavaImportOrganize<CR>
nnoremap <Leader>jd :JavaDocPreview<CR>
nnoremap <Leader>jr :JavaRename
nnoremap <Leader>l :lopen<CR>
nnoremap <Leader>jn :lnext<CR>
nnoremap <Leader>jp :lprev<CR>
nnoremap <Leader>q :lclose<CR>
nnoremap <Leader>jh :JavaHierarchy<CR>
nnoremap <Leader>jch :JavaCallHierarchy<CR>
nnoremap <Leader>j :JUnit<CR>
nnoremap <Leader>J :Java<CR>
noremap <Leader>jgs :JavaGetSet<CR>

let g:EclimHighlightWarning = 'SignWarning'
let g:EclimHighlightError = 'SignError'

"}}}

"Fugitive Remaps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>

"" auto java folding - thanks Edd
autocmd FileType java call Java_Config()

function! Java_Config()
    setlocal foldmethod=expr
    setlocal foldexpr=Java_Folding(v:lnum)
endfunction

function! Java_Folding(lnum)
    let line = getline(a:lnum)
    if line =~ '\v^\s*$'
        return '-1'
    elseif line =~ '\v^import\s+.*'
        if line =~ '\v^import\s+static\s+.*' "dont fold static imports
            return '0'
        endif
        return 1
    endif
    return '0'
endfunction


" Take left away side bar
:set guioptions-=L

" Terminal vim to be a bit more like MacVim
:set clipboard=unnamed
:set mouse=a
:set laststatus=2

noremap <Leader>c :Commentary<CR>
vnoremap <Leader>c :'<,'> Commentary<CR>

noremap <Leader>gg :GitGutterToggle<CR>

vmap < <gv
vmap > >gv

set diffopt+=vertical

noremap <Leader>` <C-^>
let g:calendar_google_calendar =1

map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b

let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ /usr/local/bin/scalariform.jar\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout
let g:tagbar_iconchars = ['▸', '▾']

nnoremap <Leader>t :Ag 'todo\|fixme' -i<CR>

let g:airline_powerline_fonts = 1
set guifont=Monaco\ for\ Powerline:h12
let g:yankring_replace_n_nkey = 'π'
let g:yankring_replace_n_pkey = 'ø'

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500
let g:nerdtree_tabs_open_on_gui_startup=0
noremap <Leader>y :YRShow<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

function! GetStaticImportJava()
    let @i = system("ag " . shellescape(expand('<cword>')) . " --java --nofilename | grep 'import static' | head -n1")
    let saved_view = winsaveview()
    call cursor (2, 0)
    normal! "ip
    call winrestview(saved_view)
    :JavaImportOrganize
    :echom 'Added import: ' . @i 
endfunction

noremap <Leader>si :call GetStaticImportJava()<CR>

" set scrolloff=999
" set sidescrolloff=999
"
noremap <Leader>sp :setlocal spell! spelllang=en_gb<CR>
let g:notes_directories = ['~/Documents/Notes']

" Switch between light and dark solarized
map <Leader>bc :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set fillchars+=vert:\ 
highlight Vertsplit ctermbg=10

let g:tmux_navigator_no_mappings = 10
nnoremap <Leader>jsf :call JsBeautify()<cr>

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''


nnoremap <Leader>ll :ll<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

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

" Shell ------------------------------------------------------------------- {{{

function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell

" }}}
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ycm_server_python_interpreter = '/usr/local/bin/python'


if has('nvim')
 nmap <BS> <C-h>
endif
set fillchars=vert:\ 
hi VertSplit ctermbg=NONE guibg=NONE


nnoremap <leader>ef :Eval<cr>

autocmd BufWritePost *.scala :EnTypeCheck
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

nnoremap \ :FzfAg<CR>

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

set guioptions-=r 
