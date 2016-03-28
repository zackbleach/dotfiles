filetype off            " https://github.com/gmarik/vundle/issues/16
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

"Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle 'scrooloose/nerdtree'
    Bundle 'kien/ctrlp.vim'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'mileszs/ack.vim'
    Bundle 'tpope/vim-fugitive'
    Bundle 'majutsushi/tagbar'
    Bundle 'jistr/vim-nerdtree-tabs'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'TeTrIs.vim'
    Bundle 'laurentgoudet/vim-howdoi.git'
    Bundle 'kien/rainbow_parentheses.vim.git'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'chrisbra/csv.vim'
    Bundle 'tpope/vim-abolish'
    Bundle 'scrooloose/syntastic'
    Bundle 'fs111/pydoc.vim'
    Bundle 'greyblake/vim-preview'
    Bundle 'jlanzarotta/bufexplorer'
    Bundle 'bling/vim-airline'
    " Bundle 'powerline/powerline'
    Bundle 'airblade/vim-gitgutter.git'
    Bundle 'tpope/vim-commentary.git'
    Bundle 'kirstein/ctrlp-register'
    Bundle 'tacahiroy/ctrlp-funky'
    Bundle 'rking/ag.vim'
    Bundle 'itchyny/calendar.vim'
    Bundle 'bkad/CamelCaseMotion'
    Bundle 'ConradIrwin/vim-bracketed-paste'
    Bundle 'vim-scripts/YankRing.vim'
    Bundle 'terryma/vim-expand-region'
    Bundle 'tpope/vim-surround'
    Bundle 'tommcdo/vim-exchange'
    Bundle 'justinmk/vim-sneak'
    Bundle 'matthewfranglen/vim-static-import'
    " These are the same
    Bundle 'xolox/vim-misc'
    Bundle 'xolox/vim-notes'
    Bundle 'mattn/gist-vim'
    Bundle 'mattn/webapi-vim'
    Bundle 'fisadev/vim-isort'
    Bundle 'christoomey/vim-tmux-navigator'
    Bundle 'maksimr/vim-jsbeautify'
    Bundle 'einars/js-beautify'
    Bundle 'JarrodCTaylor/vim-python-test-runner'
    Bundle 'python-rope/ropevim'
    Bundle 'will133/vim-dirdiff'
    Bundle 'jpalardy/vim-slime'
    Bundle 'tpope/vim-obsession'
    Bundle 'benmills/vimux'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif

" make Vim pretty
if &term == 'xterm' || &term == 'screen'
    set t_Co=256       " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif
let base16colorspace=256  " Access colors present in 256 colorspace


let g:solarized_termtrans=1
let g:solarized_contrast="medium"
let g:solarized_termcolors=16
" colorscheme base16-eighties
set background=dark


colorscheme solarized
:syntax enable
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
:set ruler

" dark config

" Eclim displays warnings in yellow
highlight SignError ctermfg=1 ctermbg=0
highlight SignWarning ctermfg=3 ctermbg=0
let g:EclimHighlightWarning = 'SignWarning'
let g:EclimHighlightError = 'SignError'

"  Same for syntastic
highlight link SyntasticErrorSign SignError

highlight link SyntasticWarningSign SignWarning 

highlight link SyntasticStyleErrorSign SignWarning

highlight link SyntasticStyleWarningSign SignWarning


highlight SignColumn ctermbg=0
highlight Error ctermbg=0

" Take away distacting sign column highlighting
" highlight clear SignColumn
" " Take away distracting line number highlighting
"

"" light config

" Eclim displays warnings in yellow
" highlight SignError ctermfg=1 ctermbg=7
" highlight SignWarning ctermfg=3 ctermbg=7
" let g:EclimHighlightWarning = 'SignWarning'
" let g:EclimHighlightError = 'SignError'

"  Same for syntastic
" highlight link SyntasticErrorSign SignError

" highlight link SyntasticWarningSign SignWarning 

" highlight link SyntasticStyleErrorSign SignWarning

" highlight link SyntasticStyleWarningSign SignWarning


" highlight SignColumn ctermbg=7
" highlight Error ctermbg=7

" highlight clear CursorLineNr
" highlight CursorLineNr ctermbg=7

" Take away distacting sign column highlighting
" highlight clear SignColumn
" Take away distracting line number highlighting
" Remaps
let mapleader=","       " redefine leader

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

nnoremap <Leader>vrc :vsplit $MYVIMRC<CR>
nnoremap <Leader>svrc :source $MYVIMRC<CR>


" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" tab remapping
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>

" turn evil tabs in to spaces and indent intelligently after curly braces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"curly bracket l336ness
inoremap unique> { {<CR>}<Esc>ko

" Ctrlp plugin
let g:ctrlp_working_path_mode = 'ra'
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*.class,*.jar,*.html" MacOSX/Linux
nnoremap //fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_extensions = [ 'funky', 'register']
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <c-b> :CtrlPBuffer<CR>

" NERDTree shortcut
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <c-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_meaningful_tab_names = 1

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '^target$']

" Syntastic stuff
let g:syntastic_python_checkers=['flake8']
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'S>'
nnoremap <Leader>sc :SyntasticCheck<CR>

" YouCompleteMe
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
" Tag bar toggle
nnoremap <C-O> :TagbarToggle<CR>

" Snippets
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<Leader>c"

"how do I
map <Leader>? <Plug>Howdoi
map <Leader>rp :RainbowParenthesesToggle<CR>

"Easy Motion - change the default EasyMotion shading to something more readable with Solarized
" hi link EasyMotionTarget ErrorMsg
" hi link EasyMotionShade  Comment

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
        return
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
autocmd BufWritePre *.java,*.py,*.js :call <SID>StripTrailingWhitespace()
" autocmd BufWritePre *.py :Isort
nnoremap <Leader>pi :Isort<CR>

" Eclim settings
filetype plugin indent on
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


autocmd BufWritePost *.py :SyntasticCheck

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --recover --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

nnoremap <Leader>xf :PrettyXML<CR>
command! PrettyXML call DoPrettyXML()

" stop terminal output from flashing (Ack)
" set t_ti= t_te=

"output of command in scratch buffer magic
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" appropriate formatting for XML
autocmd FileType xml setlocal shiftwidth=2


" Take left away side bar
:set guioptions-=L

" Terminal vim to be a bit more like MacVim
:set clipboard=unnamed
:set mouse=a
:set laststatus=2

noremap <Leader>c :Commentary<CR>
vnoremap <Leader>c :Commentary<CR>

noremap <Leader>gg :GitGutterToggle<CR>

vmap < <gv
vmap > >gv

set diffopt+=vertical

noremap <Leader>` <C-^>
let g:calendar_google_calendar =1

map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_emap

let g:syntastic_mode_map = { "mode": "active",
                           \ "passive_filetypes": ["scala", "java"] }
let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ /usr/local/bin/scalariform.jar\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout
let g:tagbar_iconchars = ['▸', '▾']

nnoremap <Leader>t :Ag 'todo\|fixme' -i<CR>

let g:airline_powerline_fonts = 1
" set guifont=Inconsolata\ for\ Powerline
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

" sneak config
let g:sneak#streak = 1

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

nnoremap <silent> <C-h>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k>  :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nnoremap <Leader>jsf :call JsBeautify()<cr>

nnoremap <Leader>da :DjangoTestApp<CR>
nnoremap <Leader>df :DjangoTestFile<CR>
nnoremap <Leader>dc :DjangoTestClass<CR>
nnoremap <Leader>dm :DjangoTestMethod<CR>

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:syntastic_always_populate_loc_list = 1

nnoremap <Leader>ll :ll<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

:set nf=octal,hex,alpha
:let g:DirDiffExcludes = "*.pyc,*.class,*.o"
:set showcmd

let g:slime_target = "tmux"

map <Leader>vl :VimuxRunLastCommand<CR>
