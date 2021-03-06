"" ============================================================================
""                                 Settings
"" ============================================================================
set nocompatible

"" encoding
scriptencoding utf-8
set encoding=utf-8

" =============================================================================
"                                   GVim
" =============================================================================
if has("gui_running")
    set guioptions-=M    " Don't load Menu bar
    colorscheme desert
else
    set t_Co=256
    colorscheme Tomorrow-Night-Eighties
endif

"" ============================================================================
""                                  Globals
"" ============================================================================
" Determine Environment
let g:platform=GetPlatform()
let g:bbenv=GetBBENV()

" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos=1

"" ============================================================================
""                            Editing and Moving
"" ============================================================================
syntax on
set autoindent
" copy the previous indentation on autoindenting
set copyindent
set cindent

" make backspace traverse between lines
set backspace=indent,eol,start

" oh no, mouse
set mouse=a

" Backup directory for swp files
set noswapfile
set directory=""

" runtime path search for Ex
set ru

" Fixing tabs
set tabstop=4
set expandtab
set shiftwidth=4
" makes indenting a multiple of shiftwidth
set shiftround
" make backspace eat a tab worth of spaces
set smarttab

" Allow switching off modified buffers without warning
set hidden

" Autosave before :make and other commands; autoreload when file mod
set autowrite
" automatically reload file on change
set autoread

" Configure the :make command
set makeprg=make

" Set path for file searches
set path+=/home/ysenyuta/mbig/**

" Ignore whitespace on diffs
set diffopt+=iwhite

" Smart case sensitivity
set ignorecase
set smartcase

" Fix background color
set t_ut=

" When multiple completions are possible, show all
set wildmenu

" Complete only up to point of ambiguity, like the shell does
set wildmode=list:longest

" Ignoring files (see :help wildignore)
set wildignore+=*.o,*.d,00*,nohup.out,tags,.hs-tags,*.hi,*.gcno,*.gcda,*.fasl,*.pyc

" Extend functionality of the % key's matching
runtime macros/matchit.vim

" Tool to use for Grepper
set grepprg="git"

" What to use for gq
set formatprg=par\ -w80

" Additional words for the spell checker
set spellfile=~/.vim/spell/extra-words.add

" stores undo state even when files are closed (in undodir)
if !isdirectory($HOME . '/.vim/backups')
    call mkdir($HOME . '/.vim/backups', 'p')
endif
set undodir=~/.vim/backups
set undofile

" allow for scrolling to next/prev line with left/right
set whichwrap+=<,>,h,l,[,]

" This shortens about every message to a minimum and thus avoids scrolling within
" the output of messages and the 'press a key' prompt that goes with these
set shm=at

" kartik
" stop autoindent from messing up pastes
set pastetoggle=<F3>

"" ============================================================================
""                                Appearance
"" ============================================================================
set guifont=Cousine\ for\ Powerline\ Regular\ 10

" Show line numbers
set number
set relativenumber

" show the cursor position
set ruler

" no linewrap
set nowrap

" Show tab and trailing whitespace characters
set listchars=tab:>-,trail:-
set list!

" Make splitting more natural
set splitright
set splitbelow

" Splits (don't) resize on open/close
set noequalalways

" Incremental Search and Highlighting Results
set incsearch
set hlsearch

" Always show status bar
set laststatus=2

" Set the folding method
set foldmethod=manual
set foldnestmax=3
set foldminlines=10

" double click to highlight all occurrences
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

" no beeps or flashes
set t_vb=

" Number of lines to scroll past when the cursor scrolls off the screen
set scrolloff=5

" allow for splits to take entire window
set winminwidth=0
set winminheight=0

" kartik

" Always show the tab line (it has the file name in it)
set showtabline=2

" kartik -- Pipe | for insert mode and "block" for normal/command mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" kartikherehere
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

" KARTIK

" Disable tmux navigator when zooming the Vim pane
" Keeps all navigation within Vim until the tmux pane is explicitly unzoomed
let g:tmux_navigator_disable_when_zoomed = 1

" For vim-diminactive, set the "out of focus" color to slightly darker gray
" (237) than that for tmux (240)
hi ColorColumn term=reverse ctermbg=237

" colors for Folds
" Foreground
" Pink
" hi Folded ctermfg=176
" Blue
hi Folded ctermfg=68
" Background
" Black
hi Folded ctermbg=0
"" ============================================================================
""                               Auto Commands
"" ============================================================================
" Automatically open the QuickFix Window after a make
autocmd QuickFixCmdPost *make* cwindow

" Make
autocmd FileType make setlocal noexpandtab shiftwidth=8

" XML
autocmd FileType xml setlocal equalprg=xmllint\ --format\ -

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set commentstring to not be /* for cpp
autocmd FileType cpp setlocal commentstring=//\ %s

"" ============================================================================
""                               Performance
"" ============================================================================
" Syntax highlighting slows things down a lot for long lines
set synmaxcol=200


