set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " Keep Plugin commands between vundle#begin/end.
Plugin 'VundleVim/Vundle.vim'
let python_highlight_all=1

"Plugin 'scrooloose/nerdtree'

"install Ctags

"Plugin 'dhruvasagar/vim-table-mode'
" " making tables & stuff
Plugin 'vimwiki/vimwiki'
" " Note taker + the vimwiki plugin allows to write documentation
" " + links to other self-written wikis

" For web langs
Plugin 'mattn/emmet-vim'

" Plugins needed for vim-snipmate - make snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Status bar + file search
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

" Finish quotes, brackets, etc.
Plugin 'raimondi/delimitmate'

" Some vimscript utility
Plugin 'L9'

" C support
Plugin 'c.vim'

" Go support
Plugin 'fatih/vim-go'

" Visuals
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

" Autocomplete
Plugin 'valloric/youcompleteme'

"Plugin 'sirver/ultisnips'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set smartindent

set nowrap
set wildignore=*.pyc,*.swp,*.class,*.o

set autoindent
set showmode
set showcmd
set ruler

set ttyfast

set wildmenu
set laststatus=2


" Ignore case when searching
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault

set incsearch
set showmatch
set hlsearch

set nu
set hidden

set noerrorbells
set visualbell

" Remap leader
let mapleader = ","
let g:mapleader = ","

set lazyredraw

" Open explorer in vertical split
map <silent> <F8> :vs +Explore<CR>


au FocusLost * :wa

" for faster save
nnoremap ; :


autocmd FileType html,css EmmetInstall
autocmd FileType javascript,java,c nnoremap <buffer> <localleader>c I//<Esc>
autocmd FileType python nnoremap <buffer> <localleader>c I#<Esc>

" Sourcing and editing .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Surround word with some symbols
nnoremap <leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
nnoremap <leader>' viw<Esc>a'<Esc>hbi'<Esc>lel
nnoremap <leader>( viw<Esc>a)<Esc>hbi(<Esc>lel
nnoremap <leader>) viw<Esc>a)<Esc>hbi(<Esc>lel
nnoremap <leader>{ viw<Esc>a}<Esc>hbi{<Esc>lel
nnoremap <leader>} viw<Esc>a}<Esc>hbi{<Esc>lel
nnoremap <leader>[ viw<Esc>a]<Esc>hbi[<Esc>lel
nnoremap <leader>] viw<Esc>a]<Esc>hbi[<Esc>lel
nnoremap <leader>< viw<Esc>a><Esc>hbi<<Esc>lel
nnoremap <leader>> viw<Esc>a><Esc>hbi<<Esc>lel

" add semicolumn at end of line
inoremap scc <Esc>mqA;<Esc>'q

" Copy into system clipboard
vmap <C-c> "+y


" Move to start and end of line
nnoremap <S-H> <S-^>
nnoremap <S-L> <S-$>
vnoremap <S-H> <S-^>
vnoremap <S-L> <S-$>

" Missclick doesnt trigger help
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

nnoremap j gj
nnoremap k gk

" Alternative exit to normal mode
inoremap jk <Esc>

" Faster exit
cnoremap q1 q!

" Save with Ctrl+S
inoremap <C-S> <Esc>:Update<CR>


"" Abbreviations 
iabbrev retunr return
iabbrev teh the
iabbrev @@ kopotuwka@gmail.com
iabbrev ssig Dong Son Trinh<cr>kopotuwka@gmail.com<cr>


" Actually makes newline without breaking at cursor
inoremap <C-o> <Esc>o

" doesnt quite work
imap <C-cr> <Esc>o
inoremap <C-BS> <C-W>

" For indentation
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Moving between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Reset search
nmap <silent> ,/ :nohlsearch<cr>

" HTML
autocmd BufWritePre *.html :normal! gg=G
autocmd BufWritePre,BufRead *.html setlocal nowrap

" Emmet settings for xml, html, php
let g:user_emmet_settings = {
\ 'php' : {
\   'extends' : 'html',
\ },
\ 'xml' : {
\   'extends' : 'html',
\ },
\ 'html' : {
\   'extends' : 'html',
\ },
\}


" Theme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"


" YouCompleteMe settings
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 2


"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
syntax enable
if v:progname =~? "evim"
    finish
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file (restore to previous version)
    set undofile		" keep an undo file (undo changes after closing)
endif

set history=50		" keep 50 lines of command line history

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Enable mouse
if has('mouse')
    set mouse=a
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

      augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Completion functions
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

" The matchit plugin makes the % command work better
packadd matchit

" Vimwiki
let g:vimwiki_list = [{'path': '~/VimWiki/vimwiki'}]
let g:vimwiki_text_ignore_newline=0
let g:vimwiki_list_ignore_newline=0
nmap <leader>_ <Plug>VimwikiSplitLink
nmap <leader><Bar> <Plug>VimwikiVSplitLink

" Ctrlp editing file options
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'OpenMulti()': ['<cr>'],
    \ }

" Tmux integration
if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
            call system("tmux select-pane -" . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif
