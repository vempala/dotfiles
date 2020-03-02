"" ============================================================================
""                             All Mode Mappings
"" ============================================================================
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"" ============================================================================
""                           Insert Mode Mappings
"" ============================================================================
" Leaving insert mode with some ups and downs
" inoremap jj <Esc>
" inoremap jk <Esc>
" Interferes with typing "kartik", followed by kj or kk
" inoremap kj <Esc>
" inoremap kk <Esc>
inoremap jf <Esc>
inoremap fj <Esc>

"" ============================================================================
""                        Normal/Visual Mode Mappings
"" ============================================================================
" If hl search is off, starting a new search or moving enables it
" remove zz if the jumps are too much
nnoremap * :set hlsearch<CR>*zz
nnoremap # :set hlsearch<CR>#zz
nnoremap n :set hlsearch<CR>nzz
nnoremap N :set hlsearch<CR>Nzz

" search highlights incrementally everywhere instead of just the first match
map / :set hlsearch<CR><Plug>(incsearch-forward)
map ? :set hlsearch<CR><Plug>(incsearch-backward)

" Basically you press * or # to search for the current selection
vnoremap <silent> * y:let @/ = @"<CR>n:set hlsearch<CR>
vnoremap <silent> # y:let @? = @"<CR>n:set hlsearch<CR>

" select everything
" nmap <C-A> ggVG
" move to left tab (indirectly via BTT)
nnoremap <C-M-h> gT
" move to right tab (indirectly via BTT)
nnoremap <C-M-l> gt
" move to last active tab (indirectly via BTT)
" https://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
" https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
if !exists('g:lasttab')
    let g:lasttab = 1
endif
nnoremap <C-M-k> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Swap to last buffer
nnoremap <silent> <F8> :b#<CR>

" yank from cursor to end of line
nnoremap Y y$

" replay @q macro for each line of a visual selection
vnoremap Q :normal @q<CR>

" qq to record, Q to replay
nnoremap Q @q

" resize splits easily
nnoremap <silent> <Tab>h :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <Tab>j :<C-U>ObviousResizeDown<CR>
nnoremap <silent> <Tab>k :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <Tab>l :<C-U>ObviousResizeRight<CR>

"" =============================================================================
""                           Command Mode Mappings
"" =============================================================================
" Now we don't have to move our fingers so far when we want to scroll through
" the command history; also, don't forget the q: command (see :h q: for more
" info)
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

"" ============================================================================
""                         Leader Mappings (Sorted)
"" ============================================================================
" Also use spacebar as a leader
let mapleader = "\<Space>"

nnoremap <Leader><Space> :CtrlPBuffer<CR>
nnoremap <Leader>bl      :Gblame!<CR>
nnoremap <Leader>cmd     :w<CR>:VimuxPromptCommand<CR>
nnoremap <Leader>cmt     :call CmtSection("")<Left><Left>
nnoremap <Leader>cx      :!chmod a+x %<CR>
nnoremap <Leader>df      :Gdiff<CR>
nnoremap <Leader>doff    :windo diffoff<CR>
nnoremap <Leader>dom     :Gdiff origin/master<CR>
nnoremap <Leader>dt      :windo diffthis<CR>
nnoremap <Leader>dum     :Gdiff upstream/master<CR>
nnoremap <Leader>ew      <C-S-w>=
nnoremap <Leader>ff      :FSHere<CR>
nnoremap <Leader>fh      :FSSplitLeft<CR>
nnoremap <Leader>fj      :FSSplitBelow<CR>
nnoremap <Leader>fk      :FSSplitAbove<CR>
nnoremap <Leader>fl      :FSSplitRight<CR>
nnoremap <Leader>gg      :call Cdroot()<CR>:Grepper<CR>
nnoremap <Leader>goog    :VimuxRunCommand("google ".input("Google for: "))<CR>
nnoremap <Leader>h       :set hlsearch! hlsearch?<CR>
nnoremap <Leader>jc      :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jf      :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ji      :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>jj      :YcmCompleter GoTo<CR>
nnoremap <Leader>lc      `.
nnoremap <Leader>lg      :Glog<CR>
nnoremap <Leader>ll      :Limelight!!<CR>
nnoremap <Leader>m       :w<CR>:call Cdroot()<CR>:call VimuxRunCommand("clear; make -j")<CR>
nnoremap <Leader>mt      :w<CR>:call Cdroot()<CR>:call VimuxRunCommand("clear; make test -j")<CR>
nnoremap <Leader>r       :call VimuxRunCommand("!! \t")<CR>
nnoremap <Leader>so      :so %<CR>
nnoremap <Leader>sp      :setlocal spell! spelllang=en_us<CR>
nnoremap <Leader>ss      :call SortSection()<CR>
nnoremap <Leader>st      :ALEToggle<CR>
nnoremap <Leader>sw      :call WindowSwap#EasyWindowSwap()<CR>
nnoremap <Leader>t       :TagbarToggle<CR>
nnoremap <Leader>ut      :UndotreeToggle<CR>
nnoremap <Leader>uu      :PlugUpgrade<CR>:PlugUpdate<CR>
nnoremap <Leader>ve      :vsp<CR>:e %:h<CR>
nnoremap <Leader>w       :call StripTabsAndTrailingWhitespaces()<CR>:w<CR>
nnoremap <Leader>xe      :sp<CR>:e %:h<CR>
nnoremap <Leader>z       :MaximizerToggle<CR>


" =============================================================================
"                          <Plug> Leader Mappings
" =============================================================================
" jump around easier
nmap <Leader>e <Plug>(easymotion-overwin-f)

" align things from visual mode as well as a motion
xmap <Leader>ga <Plug>(EasyAlign)
nmap <Leader>ga <Plug>(EasyAlign)

" ale
" navigate syntax issues
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
nmap <silent> <Leader>N <Plug>(ale_previous_wrap)

"" =============================================================================
""                             Fix Tmux Mappings
"" =============================================================================
if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif




" KARTIK


function! Save_to_vim_clipboard_for_mac()
    "let save_pos = getpos(".")
    call writefile(getreg('"', 1, 1), "/home/kvempala/.vim_clipboard_for_mac.txt")
    "call setpos(".", save_pos)
endfunction


" mac will then ftp this file back to mac and then a shortcut will load that
" ..file into the system clipboard
" Does NOT work, control-c aborts whatever is happening in Vim
" map <C-c> :call writefile(getreg('"', 1, 1), "/home/kvempala/.vim_clipboard_for_mac.txt")<CR>'"')) " DOES NOT WORK

"WORKS!!!
nnoremap <leader>y :call writefile(getreg('"', 1, 1), "/home/kvempala/.vim_clipboard_for_mac.txt")<CR>


" Kartik
"center the window automatically around the cursor after jumping to a location with motions like n (next search pattern occurrence) or } (end of next paragraph)
nnoremap n nzz
nnoremap } }zz

"soft wrap the lines
set wrap
set linebreak
set nolist     " list disables linebreak"

"move visual-line by visual-line
nnoremap j gj
nnoremap k gk

" 'retain' old behavior
nnoremap gj j
nnoremap gk k

" ZZ and ZX as quicker alternatives to :wa and :wq 
nnoremap ZZ :wa<CR>
nnoremap ZX :wa<CR> :q<CR>
nnoremap XX :q<CR>

" The default behavior for the substitute operation, :s/pattern/replacement/, is to replace only the first occurrence of the pattern. To make it replace all occurrences on the line by default, you add the g suffix, as in  :s/pattern/replacement/g. -- or just do set gdefault
set gdefault

" D deletes from the cursor to the end of the line; C changes from the cursor to the end of the line. For some reason, however, Y yanks the entire line, both before and after the cursor. If this inconsistency bothers you, you can fix it with a remapping: 
nnoremap Y y$

" KARTIK TIPS :
" - To paste, use 'p' instead of 'P', cuz the former pastes AFTER the end of the line

" for scrolling up and down quickly
nnoremap J 7j
nnoremap K 7k
vnoremap J 7j
vnoremap K 7k

" H to go to first non-whitespace character and L to go to the last
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" unmap stuff that tmux is using
inoremap <C-H> <Nop>
inoremap <C-J> <Nop>
inoremap <C-K> <Nop>
inoremap <C-L> <Nop>

" TODO kartik first install ripgrep
" tell ack.vim to use ripgrep instead
" let g:ackprg = 'rg --vimgrep --no-heading'

" <leader>l -- gives linting results in bottom pane -- toggles too
" grep for the word under the cursor
" 1) git grep in the current project
nmap <leader>k :Ggrep! "\b<cword>\b" <CR>
" 2) regular 'grep -r' in the current folder
nmap <leader>i :Ack! "\b<cword>\b" <CR>

" open the quickfix window after :Ggrep via Fugitive --
" See https://github.com/tpope/vim-fugitive/blob/master/README.markdown#faq
" When you're done, hit XX (i.e :q)
autocmd QuickFixCmdPost *grep* cwindow


