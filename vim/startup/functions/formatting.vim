" Sort all lines until a blank is encountered
function! SortSection()
    let startLine = line('.')
    let curLine = startLine

    while(getline(curLine+1) != "")
        let curLine += 1
    endwhile

    call setline(startLine, sort(getline(startLine, curLine)))
endfunction

function! FormatInPlaceJSON()
    exec "%!python -m json.tool"
endfunction

function! StripTabsAndTrailingWhitespaces()
  exec "normal ms"
  let _s=@/
  retab
  %s///ge
  %s/\s\+$//e
  let @/=_s
  exec "normal `s"
endfunction

function! RightPad(str, padSequence, desiredLen)
    let padded = a:str
    let ct = len(a:str)
    while ct < a:desiredLen
        let padded = padded . a:padSequence
        let ct += 1
    endwhile
    return padded
endfunction

" Optional argument forces a specific comment string; otherwise, uses vim's
" commentstring variable
function! CmtSection(title, ...)
    let commentChar = split(&commentstring, "%s")[0]
    if(a:0 == 1)
        let commentChar = a:1
    endif

    put!=s:CmtSection(a:title, commentChar)
endfunction

function! s:CmtSection(title, commentStr)
    let str = RightPad(a:commentStr . " ", "=", 79) . "\n"

    let startCol = s:CenteredStringStartColumn(a:title) - strlen(a:commentStr) - 1
    let str = str . RightPad(a:commentStr, " ", startCol)

    let str = str . a:title . "\n"
    let str = str . RightPad(a:commentStr . " ", "=", 79)
    return str
endfunction

" Find and return a list of [namespace string, line number] pairs
function! FindNamespaces()
    let curLine = 0
    let namespaces = []

    while(curLine < line('$'))
        if(getline(curLine) =~# '^namespace \w* \={')
            let namespaceParts = split(getline(curLine))
            if(len(namespaceParts) == 2)
                let nsName = "anonymous"
            else
                let nsName = namespaceParts[1]
            endif

            let namespaces += [[nsName, curLine]]
        endif
        let curLine += 1
    endwhile

    return namespaces
endfunction

function! FixIncludeGuard()
    " Only operate on header files
    if(expand('%:e') != 'h')
        return
    endif

    let correctGuard = 'INCLUDED_' . toupper(expand('%:t:r'))

    let curLine = 0
    let found = 0
    while(!found && curLine < line('$'))
        if(getline(curLine) =~# '^#ifndef \(INCLUDED_[A-Z_]\)')
            let incorrectGuard = (split(getline(curLine)))[1]
            exec '%s/' . incorrectGuard . '/' . correctGuard . '/ge'
            let found = 1
        endif
        let curLine += 1
    endwhile

    " BDE standard specify that #endif must not be followed by a comment
    %s/^#endif.*$/#endif/ge
endfunction

function! s:CenteredStringStartColumn(str)
    if strlen(a:str) >= 79
        return 0
    endif

    let midCol = 40
    let strMidptDist = strlen(a:str) / 2
    return midCol - strMidptDist
endfunction
