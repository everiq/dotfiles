""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ System options

" Reset default options, use noncompatible vim mode
" (better to make it the first command of vimrc)
set nocompatible

" Ensure magic is enabled to avoid compatability problems (on by default).
set magic

" Allow hidden buffers
set hidden

set showcmd

" Read file automatically when it has been changed outside vim
set autoread

" Write file automatically
set autowrite

" Disable backup files
" set nobackup
" List of directories for backup files
set backupdir=./.backup,~/.backup,.,/tmp

" Set vim history length
set history=50

" ignore equals characters in filenames allowing better filename completion with
" CTRL-X, CTRL-F
set isfname-==

" enable file-specific settings
set modeline

" Faster tty-refresh (check with remote editing)
set ttyfast

" Use Unicode by default (perhaps, not for all terminals)
set encoding=utf-8

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Indents

" Erase autoindents, join lines and make backspace work past insert location
set backspace=indent,eol,start

filetype plugin indent on

" Indent tabs by 5
set shiftwidth=4 softtabstop=4 tabstop=4
" Replace tabs with spaces by default
set expandtab

" Enable autoindent and smartindent
set autoindent
" set smartindent
set cindent

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Editing

" Enable incremental search, ignore case by default
set incsearch ignorecase hlsearch smartcase

" Use g-modifier in s/../../g by default
"set gdefault

set showmatch matchtime=5

" set foldmethod=syntax
set foldmethod=marker
set foldmarker={,}

" Keep track of tags
set tagstack

" Where to search for ctags index
set tags=./tags,tags,~/.TAGS,../tags,../../tags,../../../tags,../../../../tags

" No expandtab for Makefiles
autocmd FileType make setlocal noexpandtab

" Limit textwidth for text files
autocmd FileType text setlocal textwidth=78

" Automatically open and close the popup menu / preview window
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set completeopt=menuone,menu,longest,preview

set formatoptions+=n " recognize numbered lists
set formatoptions+=j " remove a comment leader when joining lines
set formatoptions-=ro " do not insert comment leader on <ENTER> or 'o'

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Visual appearance

set listchars=tab:»·,trail:·,precedes:<,extends:>
"set list

" Do not wrap lines by default
set nowrap

" Enable wildmenu
set wildchar=<Tab> wildmenu wildmode=full
set wildignore=*.o,*.a,*.class,*.so,*.obj,*.swp

" Show cursor position (not important since we override status line anyway)
set ruler

set laststatus=2
set statusline=%02n:%<%f\ %h%m%r%{GetPasteFlag()}\ %Y%=%-14.(%l/%L,%c%V%)\ %P

" Disable beep on errorneous actions
set noerrorbells
set novisualbell " it disables bells since t_vb is cleared
set t_vb=

" Rewrite terminal title
set title

" Keep 2 lines of context when scrolling
set scrolloff=2

" GUI configuration
if has("gui_running")
    set guioptions=aegit

    "set guifont=Monospace\ 9 " this is good for my ux31a laptop
    set guifont=GohuFont\ 11 " custom font from ~/.fonts
    " set guifont=Neep\ 10
endif

"if &term =~ "xterm\\|rxvt"
    " gray cursor by default
    "silent !echo -ne "\033]12;gray\x7"
    " use an orange cursor in insert mode
    "let &t_SI = "\<ESC>]12;orange\x7"
    " use a red cursor otherwise
    "let &t_EI = "\<ESC>]12;gray\x7"
    " reset cursor when vim exits
    "autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
"endif

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Syntax highlighting

" Choose background style
"set background=dark
"set background=light

syntax on

" Use full color
set t_Co=256

" Select colorscheme
"colorscheme torte
"colorscheme evening
colorscheme desert
colorscheme molokai

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Mappings

" Use F11 for paste mode switch
set pastetoggle=<F11>
" force CTRL-L after F11 to update status line
nnoremap <silent> <F11> <F11><C-L>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Move within long lines
noremap j gj
noremap k gk

" (like D=d$) Yank till EOL
map Y y$

" Use ii to cancel input mode
"imap ii <ESC>
" Nice shortcut (don't need to press shift)
map ; :

" Prettify XML
map _xml <ESC>:1,$!xmllint --format -<CR>

" Tag List
nnoremap <silent> <F9> :TlistToggle<CR>

" NERD tree
nnoremap <silent> <F10> :NERDTreeToggle<CR>

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>
nnoremap <silent> <M-F12> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <C-F12> :BufExplorerVerticalSplit<CR>

" autocomplete parenthesis, brackets and braces
"inoremap ( ()<Left>
"vnoremap ( s()<Esc>P<Right>%
"inoremap [ []<Left>
"inoremap { {}<Left>
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%

" Don't use Ex mode, use Q for formatting
map Q gq
" remap Ex-mode into reformatting the current paragraph in visual mode or the
" current paragraph in normal mode (plus following if count specified)
nnoremap Q gqap
vnoremap Q gq

" F8 - error navigation
nnoremap <F8> :cnext<CR>
nnoremap <S-F8> :cprev<CR>

let mapleader=' '

" Easy window navigation (SPACE h/j/k/l)
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>w <C-W>v<C-W>l " open v-split and switch to it

nmap <leader>aa :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>

" Clean hlsearch on CTRL-L
nnoremap <C-L> :nohl<CR><C-L>

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Abbreviations

autocmd FileType cpp inoreabbrev <silent> <buffer> //-- //--------------------------------------
autocmd FileType cpp inoreabbrev <silent> <buffer> //// ////////////////////////////////////////////////////////////////////////////////<CR><CR><UP>
autocmd FileType cpp inoreabbrev <silent> <buffer> //== //======================================
autocmd FileType cpp inoreabbrev <silent> <buffer> #### ########################################<CR>#<CR>#<UP>
autocmd FileType cpp inoreabbrev <silent> <buffer> /** /**<CR><CR>/<UP> TODO(server):
autocmd FileType cpp inoreabbrev <silent> <buffer> todo // TODO(sergey):
autocmd FileType cpp inoreabbrev <silent> <buffer> ifndef #ifndef<CR>#define<CR><CR>#endif<UP><UP><UP><END>
autocmd FileType cpp inoreabbrev <silent> <buffer> ifdef #ifdef<CR>#endif<UP><END>

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Helper functions

function! GetPasteFlag()
    if &paste
        return '[paste]'
    endif
    return ''
endfunction

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Plugins

" Use man page lookup ':Man [<section>] <title>'
runtime! ftplugin/man.vim

" Automatically regenerate helptags
helptags $HOME/.vim/doc

"
" BufExplorer
"
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='name'
let g:bufExplorerShowDirectories=1

"
" TagList
"
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Highlight_Tag_On_BufEnter = 1

" }}}

