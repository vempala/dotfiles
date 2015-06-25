"" ============================================================================
""                                Environment
"" ============================================================================
function! GetPlatform()
    if has('win32') || has('win64')
        return "Windows"
    elseif has("unix")
        return substitute(system("uname"), "\n", "", "g")
    else
        return "Unknown"
    endif
endfunction

function! GetBBENV()
    if has("unix")
        return substitute(system("echo $BBENV"), "\n", "", "g")
    else
        return ""
    endif
endfunction


"" ============================================================================
""                           Changing Directories
"" ============================================================================
function! Cdscraper()
    cd ~/mbig/scrape.git/msgscrape/scraper
    pwd
endfunction

function! Cdgit()
    cd ~/mbig/scrape.git
    pwd
endfunction

function! Cdfile()
    cd %:h
    pwd
endfunction


"" ============================================================================
""                          Searching for Makefile
"" ============================================================================
function! MakefileSearch()
    cd %:h
    pwd
    let ct = 0

    while(ct < 5 && ((len(split(globpath('.', 'Makefile'), '\n')) == 0) && (len(split(globpath('.', 'GNUmakefile'), '\n')) == 0)))
        cd ..
        pwd
        let ct += 1
    endwhile
endfunction

"" ============================================================================
""                             Classifier Stuff
"" ============================================================================
function! CleanupLabelHelper()
    " Cleanup tabs and column headers
    %s/\t/ /ge
    %s/\s*$//ge
    normal! gg2dd

    " Trim all of the features (currently 2)
    %s/^[0-9]*\s*[0-9]*\s*//ge

    %sort
endfunction

"" ============================================================================
""                      Restoring Screen Size/Position
"" ============================================================================
if has("gui_running")
    function! ScreenFilename()
        if has('amiga')
            return "s:.vimsize"
        elseif has('win32')
            return $HOME.'\_vimsize'
        else
            return $HOME.'/.vimsize'
        endif
    endfunction

    function! ScreenRestore()
        " Restore window size (columns and lines) and position
        " from values stored in vimsize file.
        " Must set font first so columns and lines are based on font size.
        let f = ScreenFilename()
        if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            for line in readfile(f)
                let sizepos = split(line)
                if len(sizepos) == 5 && sizepos[0] == vim_instance
                    silent! exec "set columns=".sizepos[1]." lines=".sizepos[2]
                    silent! exec "winpos ".sizepos[3]." ".sizepos[4]
                    return
                endif
            endfor
        endif
    endfunction

    function! ScreenSave()
        " Save window size and position.
        if has("gui_running") && g:screen_size_restore_pos
            let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
            let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                        \ (getwinposx()<0?0:getwinposx()) . ' ' .
                        \ (getwinposy()<0?0:getwinposy())
            let f = ScreenFilename()
            if filereadable(f)
                let lines = readfile(f)
                call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
                call add(lines, data)
            else
                let lines = [data]
            endif
            call writefile(lines, f)
        endif
    endfunction

    if !exists('g:screen_size_restore_pos')
        let g:screen_size_restore_pos = 1
    endif
    if !exists('g:screen_size_by_vim_instance')
        let g:screen_size_by_vim_instance = 1
    endif
    autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
    autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


"" ============================================================================
""                     Makefile -I to YCM Flag Formatter
"" ============================================================================
function! YcmIncludeFlagFormatter()
    let startLine = line('.')
    let paths = split(getline('.'))
    let ct = 0
    for path in paths
        if(path =~ '-I.*')
            let ct += 1
            let inc = "'" . path . "',"
            put=inc
        endif
    endfor

    let endLine = startLine + ct
    let sortCmd = ":" . startLine . "," . endLine . "sort u"
    exec sortCmd
endfunction

"" ============================================================================
""                       Sort Section Until Blank Line
"" ============================================================================
function! SortSection()
    let startLine = line('.')
    let curLine = startLine

    while(getline(curLine+1) != "")
        let curLine += 1
    endwhile

    call setline(startLine, sort(getline(startLine, curLine)))
endfunction