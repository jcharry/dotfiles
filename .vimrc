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

" Syntax
Plugin 'Raimondi/delimitMate'               " Automatically add closing brackets, quotes, etc in insert mode
Plugin 'Valloric/MatchTagAlways'            " Highlight html tags - https://github.com/Valloric/MatchTagAlways
Plugin 'alvan/vim-closetag'                 " Autoclose (x)html tags
Plugin 'mxw/vim-jsx'                        " JSX syntax highlighting and formatting - https://github.com/mxw/vim-jsx
Plugin 'othree/html5.vim'                   " Omnicomplete function for html
Plugin 'pangloss/vim-javascript'            " Javascript syntax highlighting
Plugin 'plasticboy/vim-markdown'            " Markdown support - https://github.com/plasticboy/vim-markdown

" Completion, Linters, etc.
Plugin 'benjie/neomake-local-eslint.vim'    " Allows for use of local .eslintrc
Plugin 'w0rp/ale'                           " Linter - alternative to Neomake

" Utilities, Mappings
Plugin 'FooSoft/vim-argwrap'                " unwrap dictionaries, datastructures, etc
Plugin 'aperezdc/vim-template'              " Templates for new files
Plugin 'easymotion/vim-easymotion'          " Change standard search functionality
Plugin 'elzr/vim-json'                      " Makes working with JSON nice
" Plugin 'scrooloose/nerdTree'                " File system explorer
Plugin 'tpope/vim-vinegar'                  " In window file explorer
Plugin 'scrooloose/nerdcommenter'           " Quick code commenting - https://github.com/scrooloose/nerdcommenter
Plugin 'tpope/vim-repeat'                   " Make the . key do more
Plugin 'tpope/vim-surround'                 " Surround words with things
Plugin 'christoomey/vim-system-copy'        " Make copying to system clipboard less dumb - https://github.com/christoomey/vim-system-copy
Plugin 'vim-scripts/BufOnly.vim'            " use <leader>bd to delete all buffers but current one
Plugin 'godlygeek/tabular'                  " Making tables is a breeze

" Grepping and File Finder
Plugin 'junegunn/fzf'                       " fuzzy file finder - use with :FZF
Plugin 'mileszs/ack.vim'                    " Ack search (faster grep)

" Git integration
Plugin 'airblade/vim-gitgutter'             " Show git diffs in gutter
Plugin 'tpope/vim-fugitive'                 " Git wrapper

" UI
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'            " Status Bar prettify
Plugin 'vim-airline/vim-airline-themes'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'               " Autocompletion
Plugin 'marijnh/tern_for_vim'               " Code analyzer for JS

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

" Get rid of that annyoing error bell
set noerrorbells visualbell t_vb=

" Remap leader
let mapleader = ","
let g:deoplete#enable_at_startup = 1

" Add shortcut to edit .vimrc
nnoremap <Leader>ev :vsplit /Users/jcharry/.vimrc<cr>

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set t_Co=256
set encoding=utf-8

" Jump managing
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nnoremap <leader>j :call GotoJump()<CR>

" Python highlighting
let python_highlight_all=1

" Solarized stuff
set background=light
colorscheme solarized

set ts=4 sw=4 et

" Column highlighting
highlight ColorColumn guibg=#eee8d5
set colorcolumn=80,120

"Yank an entire file with 'yaf'
onoremap af :<C-u>normal! ggvG<CR>

" Print current file path with a simple keystroke
nnoremap <leader>sp :echo @%<cr>

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
" set guifont=Monaco:h13

" Set tabs and spaces
" set background=dark
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
" set smarttab
" set smartindent
set backspace=indent,eol,start "make backspace work like most programs

" disable swap files, potentially causing an issue, but what issue? I have no idea. Shit.
set noswapfile

" ack.vim settings
" Use ag with ack.vim instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" :Ack! will prevent jumping to first result automatically, Map this shit
nnoremap <leader>se :Ack!<Space>

" Fugitive.vim Settings
" Open vim diffs in a vertical split
set diffopt+=vertical

" append to vim runtimepath
set runtimepath^=~/.vim/bundle/vimball

" Delete all buffers except the current one
nnoremap <leader>bd :BufOnly<cr>

" -------------------------------------------------- "
" --------------------- HELPERS ---------------------- "
" -------------------------------------------------- "
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

" remove all trailing white space from a file
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Format an entire file
nmap _= :call Preserve("normal gg=G")<CR>

" Remove trailing spaces on save
if has("autocmd")
  autocmd BufWritePre *.py,*.js,*.jsx,*.cpp,*.h :call Preserve("%s/\\s\\+$//e")
endif

" -------------------------------------------------- "
" --------------------- NOTES ---------------------- "
" -------------------------------------------------- "
" Plugin Notes
" surround.vim
"   ysiw <stuff> - insert stuff around word
"   in visual mode - S <stuff> - surrounds word
"   cs"' - changes surroundign " to '
"   cs'<p> - changes surrouding ' to html <p> tags
"   ds" - deletes surrounding "



" -------------------------------------------------- "
" -------------------- SETTINGS -------------------- "
" -------------------------------------------------- "
" Handle long lines elegantly
set wrap
set textwidth=119
set formatoptions=qrn1

set virtualedit=all " Virtual edit allows for moving cursor over non-real characters
set wildmenu " Wildmenu allows for tab completing of files and commands
set title " Allow vim to set terminal title
set cpoptions+=$ " When using change 'c' add '$' to end of change location
" ----------------- Relative Line Numbering ----------------- "
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


" Map Ctrl-c to new-line and indent
imap <C-c> <CR><Esc>O

" -------------------------------------------------- "
" -------------------- MAPPINGS -------------------- "
" -------------------------------------------------- "
" Highlight trailing spaces
" set list
" Toggle hidden characters on or off
nmap <leader>l :set list!<CR>
" set listchars=tab:>,trail:\
set listchars=tab:▸\ ,trail:\

" ----------------- fzf ----------------- "
" Load FZF with ,f
nnoremap <leader>f :FZF<cr>
" ----------------- WINDOW MOVEMENT ----------------- "
" Map comma to Ctrl-W to for Window operations
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L
nnoremap <leader>H <C-W>H
nnoremap <leader>w <C-W>w
nnoremap <leader>_ <C-W>_
nnoremap <leader>\| <C-W>\|
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
" Un-highlight after search
nnoremap <leader><space> :noh<cr>
" ----------------- FAST-ESCAPE ----------------- "
" Ensures that no remapping of esc in insert mode delays getting
" back into normal mode
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" ----------------- JAVASCRIPT HELPERS ----------------- "
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap clw yiwocll<Esc>pyiwPli, <Esc>bbysiw'
nmap cll console.log();<Esc>==f(a
" Delete all debugger; statements
nnoremap <leader>dd :call Preserve("g/debugger/d")<CR>



" -------------------------------------------------- "
" ----------------- PLUGIN CONFIGS ----------------- "
" -------------------------------------------------- "
" ----------------- pangloss/vim-javascript ----------------- "
let g:javascript_plugin_flow=1
" ----------------- prettier/vim-prettier ----------------- "
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" none|es5|all
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|postcss|json|graphql
"g:prettier#config#parser = 'flow'
" ----------------- alvan/vim-closetag ----------------- "
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press > in these files, this plugin will try to close the current tag.
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 0

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
" ----------------- plasticboy/vim-markdown ----------------- "
"let vim_markdown_preview_toggle=0
"let vim_markdown_preview_browser='Google Chrome'
" let g:vim_markdown_folding_disabled = 1 " vim-markdown disable folding
" ----------------- Valloric/MatchTagAlways ----------------- "
let g:mta_use_matchparen_group = 0
let g:mta_filetypes = { 'jsx': 1, 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'html.handlebars': 1}
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" ----------------- vim-airline/vim-airline ----------------- "
" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

let g:airline_detect_spell=0
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#format = 1
let g:airline_section_x = ''
let g:airline_section_y = ''

let g:airline#extensions#tabline#buffers_label = 'b'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}

" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'

" Airline YCM config
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
" ----------------- marijnh/tern_for_vim ----------------- "
" Tern-for-vim - http://usevim.com/2013/05/24/tern/
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
" ----------------- scrooloose/nerdcommenter ----------------- "
let g:NERDSpaceDelims=1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs=0 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign='left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCustomDelimiters={ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*','rightAlt': '*/}' }, } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines=1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDMenuMode=2 " Enable nerd menu
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
" ----------------- scrooloose/nerdTree ----------------- "
" easier reload
" nnoremap <Leader>nt :NERDTree<CR>
" autocmd vimenter * NERDTree
" autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" map <C-n> :NERDTreeToggle<CR>
"
" " Shortcut to change working directory to universal repo
" nnoremap <leader>wd :NERDTree /Users/jcharry/repos/squarespace-v6/site-server/src/main/webapp/universal<CR>
"
" " Close all open buffers on entering a window if the only
" " buffer that's left is the NERDTree buffer
" function! s:CloseIfOnlyNerdTreeLeft()
"   if exists("t:NERDTreeBufName")
"     if bufwinnr(t:NERDTreeBufName) != -1
"       if winnr("$") == 1
"         q
"       endif
"     endif
"   endif
" endfunction
" function! GetCurrentContent()
"   let l:content = getline(0,line("$"))
"   let l:result = 0
"   for l:temp in l:content
"     if strlen(l:temp)> 0
"       let l:result = 1
"       break
"     endif
"   endfor
"   if l:result == 0
"     let l:extension = expand("%:c")
"
"     exe 'Template .' . l:extension
"   endif
" endfunction
" autocmd BufEnter * call GetCurrentContent()
" ----------------- airblade/vim-gitgutter ----------------- "
" Vim GitGutter Settings
nnoremap <leader>gt :GitGutterLineHighlightsToggle<cr>
set updatetime=1000
" ----------------- Raimondi/delimitMate ----------------- "
" DelimitMate Settings
let g:delimitMate_expand_cr=1

" Need to ignore <>, otherwise, combined with html closetag-vim, it
" puts an extra >
let g:delimitMate_matchpairs = "(:),[:],{:}"
" ----------------- w0rp/ale ----------------- "
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}
let g:ale_lint_on_text_changed='always'
let g:ale_lint_delay=700

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'

" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

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
" ----------------- mxw/vim-jsx ----------------- "
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" ----------------- FooSoft/vim-argwrap ----------------- "
nnoremap <silent> <leader>a :ArgWrap<CR>
" ----------------- easymotion/vim-easymotion ----------------- "
" Override default search in favor of easymotion's search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

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


" Load folds automatically on startup
set foldcolumn=1
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufWritePre *.* mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END

if has('mouse')
  set mouse=a
endif

" So webpack hot reload will work with vim
" has to do with how VIM saves files, sometimes saving
" directly to a file, othertimes renaming the old file
" and writes a new one
set backupcopy=yes

