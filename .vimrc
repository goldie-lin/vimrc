if !1 | finish | endif  " Skip initial for vim-tiny or vim-small

if has('vim_starting')
  set nocompatible  " [nocp] Be iMproved
endif

" (plugin) Plug
" =============

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
"Plug 'goldie-lin/autoload_cscope.vim'
Plug 'goldie-lin/vim-gtags'
Plug 'goldie-lin/vim-gtags-cscope'
Plug 'mileszs/ack.vim'
Plug 'tjennings/git-grep-vim'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'kergoth/aftersyntaxc.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'goldie-lin/vim-dts'
Plug 'thinca/vim-logcat'
Plug 'Matt-Deacalion/vim-systemd-syntax'
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

" change linenumber column color
highlight LineNr ctermfg=DarkBlue ctermbg=Grey guifg=DarkBlue guibg=Grey

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
function! GetGooglePythonIndent(lnum)
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

" ':Unix2Dos' and ':Dos2Unix' commands
function! s:Unix2Dos()
  update
  edit ++ff=dos
endfunction
function! s:Dos2Unix()
  call s:Unix2Dos()
  setlocal ff=unix
endfunction
command! -nargs=0 Unix2Dos call s:Unix2Dos()
command! -nargs=0 Dos2Unix call s:Dos2Unix()

" ':w!!' to afterward sudo vim file if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" always jump to the last cursor position when open file
autocmd! BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

" ':Rpdf' to view PDF (required package 'pdftotext' (poppler-utils))
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" ':DiffOrig' to see the diff between current buffer and file it was loaded from
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

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

" toggle textwidth and colorcolumn
let s:TWCC = "N"
function! ToggleTWCC()
  if exists('+colorcolumn')
    "highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
    if s:TWCC == "Y"
      set textwidth=0
      set colorcolumn=
      let s:TWCC = "N"
    else
      set textwidth=80  " (customizable)
      set colorcolumn=+1  " highlight 'one' column after 'textwidth'
      let s:TWCC = "Y"
    endif
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
let g:vim_markdown_folding_disabled=1  " disable folding

" (plugin) GitGutter
let g:gitgutter_escape_grep = 1  " use raw grep, if you have 'grep' alias
let g:gitgutter_override_sign_column_highlight = 0  " customise sign column's background color
highlight SignColumn ctermbg=DarkGrey guibg=DarkGrey

" (plugin) cscope
" Note: FIXME: the location list is still very buggy on multiple tab pages.
"let g:autocscope_use_quickfix = 1
"let g:autocscope_use_location_instead = 0  " disabled, keep using quickfix list

" (plugin) gtags
"let g:Gtags_Result = "ctags-x"  " tag format (old, for fallback)
let g:Gtags_Result = "ctags-mod"  " tag format (new, required GNU GLOBAL v6.0+)
let g:Gtags_VerticalWindow = 0  " set to 1 will open windows vitically, otherwise horizontal
let g:Gtags_Auto_Map = 0  " do not use suggested (built-in) key-mapping
let g:Gtags_Auto_Update = 0  " do not keep tag files up-to-date automatically (slow down the file writting)
let g:Gtags_No_Auto_Jump = 0  " jump to the first tag at the time of search (find definition more effective)

" (plugin) gtags-cscope
set cscopeprg=gtags-cscope
set cscopetag
set cscopetagorder=0
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-  " you can open quickfix list manually by typing ':cw'
let g:GtagsCscope_Auto_Load = 1  " auto load gtags for cscope database connection
let g:GtagsCscope_Auto_Map = 0  " do not use the default (built-in) key/mouse mapping
let g:GtagsCscope_Use_Old_Key_Map = 0  " do not use the old key/mouse mapping
let g:GtagsCscope_Quiet = 1  " do not show error message when it failed to load gtags
let g:GtagsCscope_Ignore_Case = 0  " do not ignore letter case when searching
let g:GtagsCscope_Absolute_Path = 0  " do not use absolute path name
let g:GtagsCscope_Keep_Alive = 0  " do not deterring interruption

" Custom hotkey shortcuts
" =======================

" toggle-and-show the 'paste' option
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" toggle textwidth and colorcolumn (custom function)
map <F3> :call ToggleTWCC()<CR>

" toggle mouse mode (custom function)
map <F4> :call ToggleMouseMode()<CR>

" toggle the 'linenumber' option
nnoremap <F5> :set number!<CR>

" toggle the 'linewrap' option
nnoremap <F6> :set wrap!<CR>

" (plugin) Tagbar
nmap <F9> :TagbarToggle<CR>

" (plugin) gtags
noremap <C-\><C-]> :GtagsCursor<CR>

" (plugin) gtags-cscope
:nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
:nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
:nmap <C-\><C-n> :cn<CR>
:nmap <C-\><C-p> :cp<CR>
:nmap <C-\><C-\><C-]> :cs find d <C-R>=expand("<cword>")<CR>:<C-R>=line('.')<CR>:%<CR>

" Custom abbreviations
" ====================

:ab asap as soon as possible
