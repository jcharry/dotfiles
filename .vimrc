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
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
"Plugin 'scrooloose/syntastic'
Plugin 'FooSoft/vim-argwrap'                "unwrap dictionaries, datastructures, etc
Plugin 'neomake/neomake'
Plugin 'benjie/neomake-local-eslint.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'moll/vim-node'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'   "help with Handlebars
Plugin 'marijnh/tern_for_vim'               "Code analyzer for JS
Plugin 'aperezdc/vim-template'              "Templates for new files
Plugin 'tpope/vim-surround'                 "Surround words with quotes,
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  "Easily insert html tags
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'nvie/vim-flake8'
Plugin 'elzr/vim-json'
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'easymotion/vim-easymotion'
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"set t_Co=256
syntax enable
set background=dark

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
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized


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
set backspace=2 " make backspace work like most other apps
set expandtab

" Highlight trailing spaces
set list
set listchars+=trail:\ 


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
nmap s <Plug>(easymotion-overwin-f)
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
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


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
"let g:jsx_ext_required = 0 " Allow JSX in normal JS files
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
cnoremap nt NERDTree
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

" Tern-for-vim - http://usevim.com/2013/05/24/tern/
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" ArgWrap mapping
nnoremap <silent> <leader>a :ArgWrap<CR>

" Other 
" Set line number color
"highlight LineNr guifg=#555555


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
let g:closetag_html_style=1
source ~/.vim/scripts/closetag.vim

" Plugin Notes
" surround.vim
"   ysiw <stuff> - insert stuff around word
"   in visual mode - S <stuff> - surrounds word
"   cs"' - changes surroundign " to '
"   cs'<p> - changes surrouding ' to html <p> tags
"   ds" - deletes surrounding "

" Map comma to Ctrl-W to for Window operations
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
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

" Save a file with leader-s
nnoremap <leader>s :wa<cr>

" Virtual edit allows for moving cursor over non-real characters
set virtualedit=all

" Wildmenu allows for tab completing of files and commands
set wildmenu

" Set colors for status line and cursor
hi StatusLine ctermfg=darkgreen ctermbg=black
hi Cursor guibg=lightgreen guifg=lightgreen

" Highlight Search Results
"set hlsearch
" Highlight first instance of search pattern while typing
"set incsearch
" Map <leader><space> to quickly un-highlight
nnoremap <leader><space> :noh<cr>

" Disable backspace behavior
"set backspace=

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

" YCM Debugging
let g:ycm_server_python_interpreter = '/usr/bin/python'


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
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "h", "l"])
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

DisableNonCountedBasicMotions
