""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ System options

" Reset default options, use noncompatible vim mode
" (better to make it the first command of vimrc)
set nocompatible

" Ensure magic is enabled to avoid compatability problems (on by default)
set magic

" Allow hidden buffers
set hidden

" Write file automatically
set autowrite
" Try to read file automatically
set autoread

" Disable backup files
" set nobackup
" List of directories for backup files
set backupdir=./.backup,~/.backup,.,/tmp

" Set vim history length
set history=1000

" ignore equals characters in filenames allowing better filename completion with
" CTRL-X, CTRL-F
set isfname-==

" enable file-specific settings
set modeline

" Faster tty-refresh (check with remote editing)
set ttyfast

" Use Unicode by default (perhaps, not for all terminals)
set encoding=utf-8

" Automatically save files before make, etc
set autowrite

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Indents

set whichwrap+=<,>,[,]

filetype plugin indent on

" Indent tabs by 4 (default
set shiftwidth=4 softtabstop=4 tabstop=4
" Replace tabs with spaces by default
set expandtab

"set smartindent
"set cindent

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Editing

" Enable incremental search, ignore case by default
set ignorecase hlsearch smartcase

" Use g-modifier in s/../../g by default
"set gdefault

set showmatch matchtime=5

" set foldmethod=syntax
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=99 " Do not close folds when opening new file

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

" Register OCaml extensions
autocmd BufRead,BufNewFile *.ml,*.mli compiler ocaml
autocmd BufRead,BufNewFile *.atd set filetype=ocaml

" Nifty hack to read pdf/doc from vim
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
autocmd BufReadPost *.doc silent %!antiword "%"

set completeopt=menuone,menu,longest,preview

set formatoptions+=n " recognize numbered lists
set formatoptions+=j " remove a comment leader when joining lines
set formatoptions-=ro " do not insert comment leader on <ENTER> or 'o'

" Where to search for a file (dir of the current file, then current dir, then everything beneath)
set path=.,,**

" Automatically append current directory when opening new files
"set autochdir

autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Visual appearance

set listchars=tab:»·,trail:·,precedes:<,extends:>
set list

" Do not wrap lines by default
set nowrap

" Enable wildmenu
set wildchar=<Tab> wildmenu wildmode=full
set wildignore=*.o,*.a,*.class,*.so,*.obj,*.swp,*.pyc,*.bak,*.byte,*.native,*.annot,*.cm[a-z],*.cmti

set statusline=%02n:%<%f\ %h%m%r%{GetPasteFlag()}%{fugitive#statusline()}\ %Y%=%-14.(%l/%L,%c%V%)\ %P

" Disable beep on errorneous actions
set noerrorbells
set novisualbell " it disables bells since t_vb is cleared
set t_vb=

" Mouse support
"set mouse=a
set mousehide

" Rewrite terminal title
set title

" Keep 2 lines of context when scrolling
set scrolloff=2

" GUI configuration
if has("gui_running")
    set guioptions=aegit

    "set guifont=Monospace\ 9 " this is good for my ux31a laptop
    set guifont=Monospace\ 10 " this is good for the machine @ ahrefs
    "set guifont=Inconsolata\ Medium\ 12
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
" {{{ Mappings

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

nmap <silent> <C-N> :set invnumber<CR>

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

" Build integration
nnoremap <silent> <F5> :make<CR>
nnoremap <silent> <C-F5> :make test<CR>

" F8 - error navigation
nnoremap <F8> :cnext<CR>
nnoremap <S-F8> :cprev<CR>

" NERD tree
nnoremap <silent> <F10> :NERDTreeToggle<CR>

" Use F11 for paste mode switch
set pastetoggle=<A-F11>
" force CTRL-L after F11 to update status line
nnoremap <silent> <A-F11> <A-F11><C-L>

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

let mapleader=' '
let maplocalleader=' '

" Easy window navigation (SPACE h/j/k/l)
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>w <C-W>v<C-W>l " open v-split and switch to it

" Resize splits
nnoremap <silent> <leader>L :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> <leader>H :exe "vertical resize " . (winwidth(0) * 5/6)<CR>

" Fast switching between header/source files
nmap <leader>aa :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Abbreviations

autocmd FileType cpp inoreabbrev <silent> <buffer> //-- //--------------------------------------
autocmd FileType cpp inoreabbrev <silent> <buffer> //// ////////////////////////////////////////////////////////////////////////////////<CR><CR><UP>
autocmd FileType cpp inoreabbrev <silent> <buffer> //== //======================================
autocmd FileType cpp inoreabbrev <silent> <buffer> #### ########################################<CR>#<CR>#<UP>
autocmd FileType cpp inoreabbrev <silent> <buffer> /** /**<CR><CR>/<UP> TODO(sergey):
autocmd FileType cpp inoreabbrev <silent> <buffer> todo // TODO(sergey):
autocmd FileType cpp inoreabbrev <silent> <buffer> ifndef #ifndef<CR>#define<CR><CR>#endif<UP><UP><UP><END>
autocmd FileType cpp inoreabbrev <silent> <buffer> ifdef #ifdef<CR>#endif<UP><END>

autocmd FileType ocaml inoreabbrev <silent> <buffer> todo (* TODO(sergey): *)<LEFT><LEFT><LEFT>

cabbrev tabv tab sview +setlocal\ nomodifiable

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

" Disable DrawIt to avoid mapping conflicts with OCaml bindings
let g:loaded_DrawItPlugin = "DISABLE"

" Start pathogen
execute pathogen#helptags()
execute pathogen#infect()

" Use man page lookup ':Man [<section>] <title>'
runtime! ftplugin/man.vim

" Automatically regenerate helptags
"helptags $HOME/.vim/doc

"
" BufExplorer
"
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='name'
let g:bufExplorerShowDirectories=1

"
" Merlin (Additional support for OCaml)
"
let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=".g:opamshare."/merlin/vim"
execute "helptags ".g:opamshare."/merlin/vim/doc"
nnoremap <LocalLeader>d :MerlinLocate<CR>
autocmd FileType ocaml nnoremap <C-L> :MerlinClearEnclosing<CR>:nohl<CR><C-L>
autocmd FileType ocaml call SuperTabSetDefaultCompletionType("<C-X><C-O>")

"
" Zenburn (colorscheme)
"
let g:zenburn_high_Contrast=1
"let g:zenburn_transparent=1
"let g:zenburn_alternate_Visual=1

"
" FuzzyFinder
"
let g:fuf_file_exclude = '\v\~$|\.(a|so|o|exe|dll|bak|orig|swp|cm.+|annot|byte|native)$|(^|[/\\])(_o?build|\.(hg|git|bzr))($|[/\\])'
nmap <C-F> :FufFile **/<CR>
nmap <C-K> :FufLine<CR>
nmap <C-B> :FufBuffer<CR>

" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Syntax highlighting

" Choose background style
"set background=dark
set background=light

syntax on

" Use full color
set t_Co=256

" Select colorscheme
"colorscheme torte
"colorscheme desert
"colorscheme molokai
"colorscheme zenburn
colorscheme wombat256mod

"let xterm16_colormap = 'allblue'
"let xterm16_brightness = 'high'
"let xterm16bg_Normal = 'none'
"colorscheme xterm16

" Highlight too long lines
"highlight OverLength ctermbg=grey ctermfg=cyan guibg=grey guifg=cyan
highlight OverLength ctermbg=black ctermfg=grey guibg=black guifg=grey
match OverLength /\%141v.*/

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Host specific config

"let hostfile = $HOME . '/.vimrc-' . substitute(hostname(), "\\..*", "", "")
"if filereadable(hostfile)
"    exe 'source ' . hostfile
"endif

" }}}
