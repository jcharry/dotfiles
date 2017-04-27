autocmd!
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PLUGINS I ADDED!
Plugin 'jelera/vim-javascript-syntax'       " Javascript syntax highlighting
Plugin 'pangloss/vim-javascript'            " Javascript syntax highlighting
Plugin 'nathanaelkane/vim-indent-guides'    " Javascript indenting
Plugin 'Raimondi/delimitMate'               " Automatically add closing brackets, quotes, etc in insert mode
Plugin 'FooSoft/vim-argwrap'                "unwrap dictionaries, datastructures, etc
Plugin 'neomake/neomake'                    " Neovim syntax checker
Plugin 'benjie/neomake-local-eslint.vim'    " Allows for use of local .eslintrc
Plugin 'scrooloose/nerdTree'                " File system explorer
Plugin 'scrooloose/nerdcommenter'           " Quick code commenting
Plugin 'Valloric/YouCompleteMe'             " Autocompletion
Plugin 'moll/vim-node'                      " Allows opening required node modules with 'gf'
Plugin 'othree/html5-syntax.vim'            " Html syntax highlighter
Plugin 'othree/html5.vim'                   " Omnicomplete function for html
Plugin 'mustache/vim-mustache-handlebars'   " help with Handlebars
Plugin 'marijnh/tern_for_vim'               " Code analyzer for JS
Plugin 'Valloric/MatchTagAlways'            " Highlight html tags
Plugin 'aperezdc/vim-template'              " Templates for new files
Plugin 'tpope/vim-surround'                 " Surround words with things
Plugin 'tpope/vim-repeat'                   " Make the . key do more
Plugin 'tpope/vim-fugitive'                 " Git wrapper
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " Easily insert html tags
Plugin 'mxw/vim-jsx'                        " JSX syntax highlighting and formatting
" Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'nvie/vim-flake8'                    " Python style checker
Plugin 'hynek/vim-python-pep8-indent'       " Python indenting
Plugin 'elzr/vim-json'                      " Makes working with JSON nice
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'godlygeek/tabular'                  " Allows for easily aligning text
Plugin 'plasticboy/vim-markdown'            " Markdown highlighting
Plugin 'easymotion/vim-easymotion'          " Change standard search functionality
Plugin 'mileszs/ack.vim'                    " Ack search (faster grep)
" Plugin 'jmcantrell/vim-virtualenv'          " Activate and deactivate virtualenvs from within vim
" Plugin 'vim-airline/vim-airline'            " Status Bar prettify
" Plugin 'vim-airline/vim-airline-themes'
"Plugin 'wincent/command-t'
Plugin 'alvan/vim-closetag'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wikitopian/hardmode'                " HARD MODE
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Remap leader
let mapleader = ","

" Add shortcut to edit .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>

"set t_Co=256
syntax enable
set background=dark
" set encoding=utf-8

" Python highlighting
let python_highlight_all=1

if has("gui_running")
colorscheme solarized
let g:solarized_termtrans=0
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
endif

" Solarized stuff
"let g:solarized_termtrans = 1
set t_Co=256
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" vim-indent-guides options
set ts=4 sw=4 et
let g:indent_guides_auto_colors=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=lightgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray


"filetype on
"Yank an entire file with 'yaf'
onoremap af :<C-u>normal! ggvG<CR>

" Allows you to easily replace the current word and all its occurrences.
" Replace through whole document
nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
" Replace just on current line
nnoremap <Leader>rw :s/\<<C-r><C-w>\>/
" Replace highlighted word through whole document
vnoremap <Leader>ra y:%s/<C-r>"/
" Replace highlighted word through line
vnoremap <Leader>rw y:s/<C-r>"/

" Replace tabs with four spaces. Make sure that there is a tab character between
" the first pair of slashes when you copy this mapping into your .vimrc!
nnoremap <Leader>rts :%s/\t/    /g<CR>

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
"vnoremap < <gv
"vnoremap > >gv<Paste>

" Handlebars treated as html for syntax coloring
au BufReadPost *.handlebars set syntax=html

" Map j and k to gj and gk to more easily work with wrapped lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Remove whitespace at end of lines upon saving
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Font
set guifont=Monaco:h13

" Set tabs and spaces
set background=dark
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" set smarttab
" set smartindent
set backspace=indent,eol,start "make backspace work like most programs


" Source local .vimrc if available in working directory
"set exrc

" Add some extra security for local .vimrc files
"set secure

" Highlight trailing spaces
" set list
" Toggle hidden characters on or off
nmap <leader>l :set list!<CR>
" set listchars=tab:>,trail:\
set listchars=tab:▸\ ,trail:\ 

if has("autocmd")
    autocmd BufWritePre *.py,*.js,*.jsx,*.cpp,*.h :call Preserve("%s/\\s\\+$//e")
endif

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Delete all debugger; statements
nnoremap <leader>dd :call Preserve("g/debugger/d")<CR>

" Map Ctrl-c to new-line and indent
imap <C-c> <CR><Esc>O

"let g:loaded_vimballPlugin = 1
" append to vim runtimepath
set runtimepath^=~/.vim/bundle/vimball

" Pyclewn
" let g:pyclewn_terminal = "xterm, -e"

" vim-easymotion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)

" Override default search in favor of easymotion's search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


"
" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"" JSX in JS files
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_python_checkers = ['pep8']

"" Don't check html files unless I explicity ask for it: i.e. :SyntasticCheck
"let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Neomake Settings
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_jsx_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }

let g:neomake_python_flake8_maker = {
\ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
\ 'errorformat':
    \ '%E%f:%l: could not compile,%-Z%p^,' .
    \ '%A%f:%l:%c: %t%n %m,' .
    \ '%A%f:%l: %t%n %m,' .
    \ '%-G%.%#',
\ }
let g:neomake_python_enabled_makers = ['flake8']

"let g:neomake_python_pylint_exe = 'pylint2'

"let g:neomake_python_
autocmd! BufWritePre * Neomake
let g:neomake_open_list = 2
"let g:neomake_verbose = 3

" CPP Makers
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]

" Neomake maps   ]
function! LocationNext()
try
    lnext
catch
    try | lfirst | catch | endtry
endtry
endfunction

" Toggle the quickfix window open or close
" Try closing a window and check if the number
" of open buffers changes, if not, then open
" the window, otherwise close it
function! ToggleNeomakeWindow()
" Get open buffers
let old_last_winnr = winnr('$')
lclose
if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    lopen
endif
endfunction

" Neomake - Tab goes to next error
nnoremap <Tab> :call LocationNext()<cr>
nnoremap <Leader><Tab> :call ToggleNeomakeWindow()<cr>



" Relative line numbering, handle switching between windows
set number
if has('autocmd')
augroup vimrc_linenumbering
autocmd!
autocmd WinLeave *
           \ if &number |
           \   set norelativenumber |
           \ endif
autocmd BufWinEnter *
           \ if &number |
           \   set relativenumber |
           \ endif
autocmd WinEnter *
           \ if &number |
           \   set relativenumber |
           \ endif
autocmd VimEnter *
           \ if &number |
           \   set relativenumber |
           \ endif
augroup END
endif
set autoread

"NERDTree
" easier reload
nnoremap <Leader>nt :NERDTree<CR>
autocmd vimenter * NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
map <C-n> :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
        if winnr("$") == 1
            q
        endif
    endif
endif
endfunction
function! GetCurrentContent()
let l:content = getline(0,line("$"))
let l:result = 0
for l:temp in l:content
    if strlen(l:temp)> 0
        let l:result = 1
        break
    endif
endfor
if l:result == 0
    let l:extension = expand("%:c")

    exe 'Template .' . l:extension
endif
endfunction
autocmd BufEnter * call GetCurrentContent()

" DelimitMate Settings
let g:delimitMate_expand_cr=1
" let g:delimitMate_expand_cr=0

" Need to ignore <>, otherwise, combined with html closetag-vim, it
" puts an extra >
let g:delimitMate_matchpairs = "(:),[:],{:}"


" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters={ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*','rightAlt': '*/}' }, }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines=1

" Enable nerd menu
let g:NERDMenuMode=2

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Tern-for-vim - http://usevim.com/2013/05/24/tern/
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" ArgWrap mapping
nnoremap <silent> <leader>a :ArgWrap<CR>

" Airline
" set encoding=utf-8
set ambiwidth=double
let g:bufferline_echo = 0
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'solarized'
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
set laststatus=2
let g:airline#extensions#whitespace#enabled = 1
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if ! has('gui_running')
set ttimeoutlen=10
augroup FastEscape
autocmd!
au InsertEnter * set timeoutlen=0
au InsertLeave * set timeoutlen=1000
augroup END
endif

" let g:airline_mode_map = {
"   \ '__' : '-',
"   \ 'n'  : 'N',
"   \ 'i'  : 'I',
"   \ 'R'  : 'R',
"   \ 'c'  : 'C',
"   \ 'v'  : 'V',
"   \ 'V'  : 'V',
"   \ '' : 'V',
"   \ 's'  : 'S',
"   \ 'S'  : 'S',
"   \ '' : 'S',
"   \ }
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Other
" Set line number color
" highlight LineNr guifg=#555555


" Text wrapping on .txt files
au BufNewFile,BufRead *.txt set wrap
au BufNewFile,BufRead *.txt set linebreak
au BufNewFile,BufRead *.txt set breakindent
" Spell checking on text files
au BufNewFile,BufRead *.txt set spell spelllang=en_us

" Handle long lines elegantly
set wrap
set textwidth=79
set formatoptions=qrn1

" When using change 'c' add '$' to end of change location
set cpoptions+=$

" Jump to matching tags?
let g:mta_use_matchparen_group = 0
let g:mta_filetypes = { 'jsx': 1, 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'html.handlebars': 1}
nnoremap <leader>% :MtaJumpToOtherTag<cr>



" Allow for jumping to corresponding HTML elements
runtime macros/matchit.vim

" Use Ctrl-_ to add closing HTML tag
" let g:closetag_html_style=1
" source ~/.vim/scripts/closetag.vim
"
" closetag-vim settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" Plugin Notes
" surround.vim
"   ysiw <stuff> - insert stuff around word
"   in visual mode - S <stuff> - surrounds word
"   cs"' - changes surroundign " to '
"   cs'<p> - changes surrouding ' to html <p> tags
"   ds" - deletes surrounding "

" Map comma to Ctrl-W to for Window operations
" nnoremap <leader>j <C-W>j
" nnoremap <leader>k <C-W>k
" nnoremap <leader>l <C-W>l
" nnoremap <leader>h <C-W>h
" nnoremap <C-h> <C-W>h
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L
nnoremap <leader>H <C-W>H
nnoremap <leader>w <C-W>w
nnoremap <leader>_ <C-W>_
nnoremap <leader>\| <C-W>\|
"nnoremap <leader>r <C-W>r
"nnoremap <leader>R <C-W>R
"nnoremap <leader>x <C-W>x
nnoremap <leader>= <C-W>=
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

if has('nvim')
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
endif

" Save a file with leader-s
nnoremap <leader>sa :wa<cr>


" Virtual edit allows for moving cursor over non-real characters
set virtualedit=all

" Wildmenu allows for tab completing of files and commands
set wildmenu

" Set colors for status line and cursor
hi StatusLine ctermfg=black ctermbg=white
" hi Cursor guibg=lightgreen guifg=lightgreen
" hi Cursor guibg=white guifg=orange
" hi Cursor guibg=lightgreen guifg=magenta

" Highlight Search Results
"set hlsearch
" Highlight first instance of search pattern while typing
"set incsearch
" Map <leader><space> to quickly un-highlight
nnoremap <leader><space> :noh<cr>

" Disable backspace behavior
" set backspace=

" Markdown for vim plugin
"let vim_markdown_preview_toggle=0
"let vim_markdown_preview_browser='Google Chrome'
let g:vim_markdown_folding_disabled = 1 " vim-markdown disable folding

" Allow vim to set terminal title
set title

" Toggle spellcheck
" nmap <silent> <leader>s :set invspell<CR>

" Reload vimrc Automatically
autocmd BufWritePost .vimrc source %

" Shortcut to reload vimrc from vim
cnoremap vimrc source ~/.vimrc


" Get rid of that annyoing error bell
set noerrorbells visualbell t_vb=

" Sparkup - for shortening typing html
" use Ctrl-e while in insert mode to complete element
" Can chain commands like so:
"    <ul>
        "<li class="item-1"></li>
        "<li class="item-2"></li>
        "<li class="item-3"></li>
    "</ul>

" Find all todos
command Todo vimgrep TODO\|FIXME\|XXX/j ** | cw
" command -nargs=1 Todo execute 'noautocmd vimgrep /TODO\|FIXME\|XXX <args>/**/*.js'
" command -nargs=1 -complete=file Todo execute "Ags" 'TODO\|FIXME\|XXX' <f-args>

" Fold stuff
set foldcolumn=1
" save folds across sessions
"augroup AutoSaveFolds
    "autocmd!
    "autocmd BufWinLeave *.* mkview 1
    "autocmd BufWinEnter *.* silent loadview 1
    "autocmd BufWinLeave .* mkview 1
    "autocmd BufWinEnter .* silent loadview 1
"augroup END

" YCM
let g:ycm_server_python_interpreter = '/usr/local/bin/python'
let g:ycm_python_binary_path = 'usr/local/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_cache_omnifunc = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2

let g:ycm_key_detailed_diagnostics = ''
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'



let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" So webpack hot reload will work with vim
" has to do with how VIM saves files, sometimes saving
" directly to a file, othertimes renaming the old file
" and writes a new one
set backupcopy=yes

" TO GET ME TO USE COUNTED MOVEMENTS
function! DisableIfNonCounted(move) range
    if v:count
        return a:move
    else
        " You can make this do something annoying like:
           " echoerr "Count required!"
           " sleep 2
        return ""
    endif
endfunction

function! SetDisablingOfBasicMotionsIfNonCounted(on)
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k"])
    if a:on
        for key in keys_to_disable
            execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
        endfor
        let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
        let g:is_non_counted_basic_motions_disabled = 1
    else
        for key in keys_to_disable
            try
                execute "unmap " . key
            catch /E31:/
            endtry
        endfor
        let g:is_non_counted_basic_motions_disabled = 0
    endif
endfunction

function! ToggleDisablingOfBasicMotionsIfNonCounted()
    let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
    if is_disabled
        call SetDisablingOfBasicMotionsIfNonCounted(0)
    else
        call SetDisablingOfBasicMotionsIfNonCounted(1)
    endif
endfunction

command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)

nnoremap <Leader>tog :ToggleDisablingOfNonCountedBasicMotions<cr>

DisableNonCountedBasicMotions
