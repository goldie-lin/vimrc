if !1 | finish | endif  " Skip initial for vim-tiny or vim-small

if has('vim_starting')
  set nocompatible  " [nocp] Be iMproved
endif

" (plugin) Plug
" =============

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'kergoth/aftersyntaxc.vim'
Plug 'plasticboy/vim-markdown'
Plug 'goldie-lin/vim-dts'
Plug 'thinca/vim-logcat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'tczengming/autoload_cscope.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
call plug#end()

" Vim encoding
" ============

set encoding=utf-8  " [enc] Set encoding used inside Vim (buffers, registers, expressions, text stored in 'viminfo')
set fileencoding=utf-8  " [fenc] Set default encoding for reading file
" [fencs] Set support encodings for reading file (default setting:ucs-bom,utf-8,default,latin1)
set fileencodings=ucs-bom,utf-8,default,big5,gb2312,gbk,latin1

" Vim options
" ===========

syntax on  " Enable syntax highlighting
set visualbell  " [vb] Error bells are displayed visually (flash screen)
set hlsearch  " [hls] Highlight search
set incsearch  " [is] Search as you type instantly
set ignorecase  " [ic] Ignore case when search
set smartcase  " [scs] Ignore case if pattern is all lowercase, case-sensitive otherwise
set showmode  " [smd] Show current mode (INSERT|REPLACE|VISUAL) in last line
set showmatch  " [sm] Show (flash) match `([{' after input `([{', beep if not found
set showcmd  " [sc] Show incomplete command in the lower right corner
set ruler  " [ru] Show coordinates of mouse cursor always
set tabpagemax=24  " [tpm] Max number of tab pages (default 10)
"set noendofline binary  " [noeol] Save a file without terminator after last line
set laststatus=2  " Fix for (plugin) Lightline (MUST before color scheme setting)

set autoindent  " [ai] Enable autoindent
set copyindent  " [ci] Copy previous line indentation on autoindent
"set smartindent  " [si] Enable smartindent

"set expandtab  " [et] Replace tab with spaces automatically
"set shiftwidth=4  " [sw] Set indent width is equal to 4 space chars
"set tabstop=4  " [ts] Set tab width is equal to 4 space chars, affect existing text displays
" [sts] Set softtab width is equal to 4 space chars, affect hitting tab in insert mode
" If (softtabstop < tabstop) && (expandtab is not set), use combination of tabs and spaces to desired spacing.
" If (softtabstop == tabstop) && (expandtab is not set), always use tabs.
" If (expandtab is set), always use appropriate number of spaces.
"set softtabstop=4

" [bs] Backspace works in insert mode, e.g., not inserting a ^?, but won't
" delete over line breaks, or automatically-inserted indentation, or the place
" where insert mode started.
"   '0' is same as 'set backspace=' (Vi compatible)
"   '1' is same as 'set backspace=indent,eol'
"   '2' is same as 'set backspace=indent,eol,start'
set backspace=2

set wildmenu  " [wmnu] Show wildmenu during tab auto-completion
" [wim] Enable command line tab auto-completioni
" (on 1st tab) List all matched completions.
" (on 2nd tab) Show wildmenu and following tabs cycle through matches.
set wildmode=list:longest,full
" [wig] Ignore these files when completing names and in explorer
set wildignore=CVS,.svn,.hg,.bzr,.git,.repo,*.o,*.a,*.class,*.pyc,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Vim color scheme and font
" =========================

if has("gui_running")  " for GVim
  colorscheme desert
  set columns=100 lines=32  " default window size
  set t_Co=256  " color mode: 256
  set guifont=Terminus\ 10,AR\ PL\ UMing\ TW\ 10  " font and fone-size
  set guifontwide=AR\ PL\ UMing\ TW\ 10  " font-wide as CJK font size as above line
else  " for terminal Vim
  colorscheme desert
  set t_Co=256  " color mode: 256
endif

" Vim highlight color
" ===================

" change hls color
highlight Search term=reverse cterm=none ctermfg=DarkBlue ctermbg=Yellow gui=none guifg=wheat guibg=peru

" change vimdiff highlight color
highlight DiffAdd    term=reverse cterm=bold ctermfg=White   ctermbg=DarkGreen gui=bold guifg=bg  guibg=Green
highlight DiffDelete term=reverse cterm=none ctermfg=Black   ctermbg=Red       gui=none guifg=bg  guibg=Red
highlight DiffChange term=reverse cterm=none ctermfg=Black   ctermbg=LightBlue gui=none guifg=bg  guibg=LightBlue
highlight DiffText   term=reverse cterm=none ctermfg=DarkRed ctermbg=Blue      gui=none guifg=Red guibg=Gray

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif

" Vim filetype
" ============

" filetype-specific settings
filetype on         " enable filetype detection
filetype indent on  " enable filetype-specific indenting
filetype plugin on  " enable filetype-specific plugins

" custom filetype remaps
autocmd BufNewFile,BufRead *.jsm set filetype=javascript
autocmd BufNewFile,BufRead *.rc  set filetype=sh

" Custom functions/scripts
" ========================

" remove trailing whitespaces when writing a buffer, but not for '.diff' files
" From: Vigil
"function! RemoveTrailingWhitespace()
"  if &ft != "diff"
"    let b:curcol = col(".")
"    let b:curline = line(".")
"    silent! %s/\s\+$//
"    silent! %s/\(\s*\n\)\+\%$//
"    call cursor(b:curline, b:curcol)
"  endif
"endfunction
"autocmd BufWritePre * call RemoveTrailingWhitespace()

" indent Python in the Google way.
" Ref: http://google-styleguide.googlecode.com/svn/trunk/google_python_style.vim
setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.
function GetGooglePythonIndent(lnum)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  return GetPythonIndent(a:lnum)
endfunction
let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

" ':w!!' to afterward sudo vim file if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" always jump to the last cursor position when open file
if has("autocmd")
  autocmd! BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" ':Rpdf' to view PDF (required package 'pdftotext' (poppler-utils))
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" toggle mouse mode
let s:MouseMode = "N"
function! ToggleMouseMode()
  if s:MouseMode == "Y"
    set mouse=
    let s:MouseMode = "N"
  else
    set mouse=a
    let s:MouseMode = "Y"
  endif
endfunction

" Vim syntax
" ==========

" (syntax) DTS/DSTI (device tree files)
autocmd BufRead,BufNewFile *.dts,*.dtsi set filetype=dts

" (syntax) C/C++ enhancement
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" (syntax) Indent Guides, for `set background=dark` is used for terminal vim
highlight IndentGuidesOdd  ctermbg=black
highlight IndentGuidesEven ctermbg=darkgrey

" Vim plugin
" ==========

" (plugin) Markdown
let g:vim_markdown_initial_foldlevel=1  " set initial foldlevel
"let g:vim_markdown_folding_disabled=1  " disable folding

" Custom hotkey shortcuts
" =======================

" toggle-and-show the 'paste' option
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" toggle mouse mode (custom function)
map <F4> :call ToggleMouseMode()<CR>

" toggle the 'linenumber' option
nnoremap <F5> :set number!<CR>

" toggle the 'linewrap' option
nnoremap <F6> :set wrap!<CR>

" (plugin) Tagbar
nmap <F9> :TagbarToggle<CR>

" Custom abbreviations
" ====================

:ab asap as soon as possible
