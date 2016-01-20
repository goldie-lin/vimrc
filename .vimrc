if !1 | finish | endif  " Skip initial for vim-tiny or vim-small

if has('vim_starting')
  set nocompatible  " [nocp] Be iMproved
endif

" (plugin) Plug
" =============

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'goldie-lin/vim-gtags'
Plug 'goldie-lin/vim-gtags-cscope'
Plug 'haya14busa/incsearch.vim'
Plug 'thinca/vim-visualstar'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-tbone'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'lilydjwg/fcitx.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'kergoth/aftersyntaxc.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'goldie-lin/vim-dts'
Plug 'dzeban/vim-log-syntax'
Plug 'thinca/vim-logcat'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'TluxGhelew/vim-vimperator'
Plug 'tmux-plugins/vim-tmux'
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
set nobackup  " [nobk] Do not make a backup file
"set visualbell  " [vb] Error bells are displayed visually (flash screen)
set virtualedit=block  " [ve] Allow moving cursor outside the actual text in visual block mode
set splitbelow  " [sb] Split a window will put the new window below the current one
set splitright  " [spr] Split a window will put the new window right of the current one
set hlsearch  " [hls] Highlight search
set incsearch  " [is] Search as you type instantly
set ignorecase  " [ic] Ignore case when search
set smartcase  " [scs] Ignore case if pattern is all lowercase, case-sensitive otherwise
set showmode  " [smd] Show current mode (INSERT|REPLACE|VISUAL) in last line
set showmatch  " [sm] Show (flash) match `([{' after input `([{', beep if not found
set showcmd  " [sc] Show incomplete command in the lower right corner
set ruler  " [ru] Show coordinates of mouse cursor always
set list  " See the difference between tabs and spaces and trailing blanks
set cursorline  " [cul] Highlight the screen line of the cursor with CursorLine
set number  " [nu] Show line number in front of each line.
"set relativenumber  " [rnu] Show line number relative to the line with the cursor in front of each line.
set tabpagemax=24  " [tpm] Max number of tab pages (default: 10)
"set noendofline binary  " [noeol] Save a file without terminator after last line
set laststatus=2  " Fix for (plugin) Lightline (MUST before color scheme setting)
set rtp+=~/.fzf  " Add for (plugin) fzf

set autoindent  " [ai] Enable autoindent
set copyindent  " [ci] Copy previous line indentation on autoindent
set smartindent  " [si] Enable smartindent

"set expandtab  " [et] Replace tab with spaces automatically
"set smarttab  " [sta] Tab in front of a line inserts blanks according to shiftwidth.
"set shiftwidth=4  " [sw] Set indent width is equal to 4 space chars
"set tabstop=4  " [ts] Set tab width is equal to 4 space chars, affect existing text displays
" [sts] Set softtab width is equal to 4 space chars, affect hitting tab in insert mode
" If (softtabstop < tabstop) && (expandtab is not set), use combination of tabs and spaces to desired spacing.
" If (softtabstop == tabstop) && (expandtab is not set), always use tabs.
" If (expandtab is set), always use appropriate number of spaces.
"set softtabstop=4

" [bs] Backspace works in insert mode, see ":h 'backspace'" for detail.
set backspace=indent,eol,start

set wildmenu  " [wmnu] Show wildmenu during tab auto-completion
" [wim] Enable command line tab auto-completioni
" (on 1st tab) List all matched completions.
" (on 2nd tab) Show wildmenu and following tabs cycle through matches.
set wildmode=list:longest,full
" [wig] Ignore these files when completing names and in explorer
set wildignore=CVS,.svn,.hg,.bzr,.git,.repo,*.o,*.a,*.class,*.pyc,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Vim color scheme and font
" =========================

" (plugin) molokai: bring 256 color as close as possible to default dark GUI.
let g:rehash256 = 1

if has("gui_running")  " for GVim
  colorscheme molokai
  set columns=100 lines=32  " default window size
  set t_Co=256  " color mode: 256
  set guifont=Terminus\ 10,AR\ PL\ UMing\ TW\ 10  " font and fone-size
  set guifontwide=AR\ PL\ UMing\ TW\ 10  " font-wide as CJK font size as above line
else  " for terminal Vim
  colorscheme molokai
  set t_Co=256  " color mode: 256
endif

" Vim highlight color
" ===================

" change linenumber column color
"highlight LineNr ctermfg=DarkBlue ctermbg=Grey guifg=DarkBlue guibg=Grey
"highlight CursorLineNr ctermfg=Black ctermbg=Grey guifg=Black guibg=Grey

" change colorcolumn column color for one column after textwidth
"highlight ColorColumn ctermbg=DarkGrey guibg=DarkGrey

" change hls color
"highlight Search term=reverse cterm=none ctermfg=DarkBlue ctermbg=Yellow gui=none guifg=wheat guibg=peru

" change vimdiff highlight color
"highlight DiffAdd    term=reverse cterm=bold ctermfg=White     ctermbg=DarkGreen gui=bold guifg=White     guibg=DarkGreen
"highlight DiffDelete term=reverse cterm=none ctermfg=Black     ctermbg=DarkGrey  gui=none guifg=Black     guibg=DarkGrey
"highlight DiffChange term=reverse cterm=bold ctermfg=LightGrey ctermbg=DarkBlue  gui=bold guifg=LightGrey guibg=DarkBlue
"highlight DiffText   term=reverse cterm=bold ctermfg=Red       ctermbg=Blue      gui=bold guifg=Red       guibg=Blue

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkCyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif

" change C syntax highlight for (plugin) aftersyntaxc.vim
" make Operator has different color with Keywords.
highlight cOperator term=none cterm=none ctermfg=Yellow ctermbg=bg gui=none guifg=Yellow guibg=bg
" make Delimiter has different color with indentLine, and darker.
highlight Delimiter term=none cterm=none ctermfg=DarkBlue ctermbg=bg gui=none guifg=DarkBlue guibg=bg

" Vim filetype
" ============

" filetype-specific settings
filetype on         " enable filetype detection
filetype indent on  " enable filetype-specific indenting
filetype plugin on  " enable filetype-specific plugins

" custom filetype remaps
autocmd BufNewFile,BufRead *.jsm set filetype=javascript
autocmd BufNewFile,BufRead *.rc  set filetype=sh
autocmd BufNewFile,BufRead *.aidl set filetype=java

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

" If doing a diff. Upon writing changes to file, automatically update the differences
" Ref: http://vim.wikia.com/wiki/Update_the_diff_view_automatically
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" automatically open quickfix/location window if found any issue
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" automatically spell check
autocmd FileType gitcommit setlocal spell

" toggle mouse mode
function! ToggleMouseMode()
  if empty(&mouse)
    set mouse=a
  else
    set mouse=
  endif
endfunction

" toggle linenumber
function! ToggleLineNumber()
  if !&number && !&relativenumber
    set number
  elseif !&relativenumber
    set relativenumber
  else
    set nonumber
    set norelativenumber
  endif
endfunction

" toggle textwidth and colorcolumn
let s:TWCC = "N"
function! ToggleTWCC()
  if exists('+colorcolumn')
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

" Vim plugin
" ==========

" (plugin) Lightline
" Depend_and_integrate_with: Fugitive, Syntastic.
set noshowmode  " do not show mode message on the last line
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }

" (plugin) Markdown
let g:vim_markdown_initial_foldlevel=1  " set initial foldlevel
let g:vim_markdown_folding_disabled=1  " disable folding
let g:vim_markdown_no_default_key_mappings = 1  " disable default key mappings

" (plugin) Grepper
let g:grepper = {
  \ 'quickfix':  1,
  \ 'open':      1,
  \ 'switch':    1,
  \ 'jump':      0,
  \ 'cword':     0,
  \ 'next_tool': '<Tab>',
  \ 'tools':     ['git', 'ag', 'grep'],
  \ }

" (plugin) signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1

" (plugin) Tagbar
let g:tagbar_compact = 1  " omit short help at the top
let g:tagbar_width = 30  " default: 40
let g:tagbar_indent = 1  " default: 2

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
let g:Gtags_Close_When_Single = 1  " close quickfix windows in case of single tag

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

" (plugin) syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1  " always stick any detected errors into location list
let g:syntastic_auto_loc_list = 1  " automatically open and close location list when issue detected and cleaned
let g:syntastic_check_on_open = 0  " do not check when open file
let g:syntastic_check_on_wq = 0  " do not check when you typed :wq, :x, and :ZZ
let g:syntastic_auto_jump = 0  " do not automatically jump to the first detected issue
let g:syntastic_aggregate_errors = 1  " apply all checkers and aggregate all errors found
" check setting for filetype 'sh':
let g:syntastic_sh_checkers = [ "bashate", "shellcheck", "sh" ]
let g:syntastic_sh_bashate_post_args = "-i E003"  " ignore strict 4 spaces indent
let g:syntastic_sh_shellcheck_post_args = "-e SC1091"  " ignore sourcing external files
" check setting for filetype 'c':
let g:syntastic_c_checkers = [ "sparse", "gcc", "cppcheck" ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_sparse_post_args = "-gcc-base-dir " .
    \ system("gcc -v 2>&1 | sed -n '/^Reading specs/ { s#.* /#/#; s#/[^/]*$##; p; }'")
let g:syntastic_splint_config_file = ".syntastic_c_config"
let g:syntastic_sparse_config_file = ".syntastic_c_config"
" check setting for filetype 'python':
let g:syntastic_python_checkers = [ "python", "flake8" ]
let g:syntastic_python_flake8_post_args = "--ignore E111,E114"  " ignore strict 4 spaces indent
let g:syntastic_python_pylint_post_args = "--disable=bad-indentation"  " ignore strict 4 spaces indent

" (plugin) terminus
" disable TerminusFocusReporting to prevent trigger the :checktime command
" that will interfere tmux highlighting the window activity in status line.
let g:TerminusFocusReporting = 0

" (plugin) visualstar
let g:visualstar_extra_commands = "zzzv"  " keep search results appear in the middle of the screen

" (plugin) EasyAlign
" start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" (plugin) indentLine
let g:indentLine_char = '┆'

" Custom hotkey shortcuts
" =======================

" keep search results appear in the middle of the screen
" Ref: http://vim.wikia.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen#Simple_mappings
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" keep jump to previous and next cursor positions appear in the middle of the screen too
" Ref: http://stackoverflow.com/questions/2372584/auto-zz-in-vim-after-a-jump/2373510#2373510
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" keep the cursor in place while joining lines with J
" Ref: http://blog.sanctum.geek.nz/vim-annoyances/
nnoremap J mzJ`z

" disable Q for Ex-mode that I never use
nnoremap Q <Nop>

" disable <F1> for help, :h[elp] is more useful for the experienced user
nnoremap <F1> <Nop>
inoremap <F1> <Nop>

" browse the input history in command mode
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" toggle-and-show the 'paste' option
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" toggle textwidth and colorcolumn (custom function)
nnoremap <F3> :call ToggleTWCC()<CR>

" toggle mouse mode (custom function)
nnoremap <F4> :call ToggleMouseMode()<CR>

" toggle line number (custom function)
nnoremap <F5> :call ToggleLineNumber()<CR>

" toggle the 'linewrap' option
nnoremap <F6> :set wrap!<CR>

" (plugin) Tagbar
nmap <F7> :TagbarToggle<CR>

" (plugin) syntastic
nnoremap <F8> :SyntasticToggleMode\|SyntasticReset<CR>
nnoremap <F9> :SyntasticCheck gcc<CR>
nnoremap <F10> :SyntasticCheck cppcheck<CR>
nnoremap <F11> :SyntasticCheck checkpatch<CR>
nnoremap <F12> :SyntasticCheck javac<CR>

" (plugin) incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
let g:incsearch#separate_highlight = 1

" (plugin) Grepper
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <Leader>g :Grepper! -tool git<CR>
nnoremap <Leader>G :Grepper! -tool ag<CR>
nnoremap <Leader>* :Grepper! -cword!<CR>

" (plugin) fzf-vim
" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" (plugin) gtags
noremap <C-\><C-]> :GtagsCursor<CR>

" (plugin) gtags-cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\><C-n> :cn<CR>
nmap <C-\><C-p> :cp<CR>
nmap <C-\><C-\><C-]> :cs find d <C-R>=expand("<cword>")<CR>:<C-R>=line('.')<CR>:%<CR>

" (plugin) vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-b><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-b><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-b><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-b><C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-b><C-\> :TmuxNavigatePrevious<CR>

" Custom abbreviations
" ====================

iabbrev asap       as soon as possible
iabbrev beacuse    because
iabbrev becuase    because
iabbrev defualt    default
iabbrev Defualt    Default
iabbrev emial      email
iabbrev Emial      Email
