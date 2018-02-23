if !1 | finish | endif  " Skip initial for vim-tiny or vim-small

if has('vim_starting')
  " vint: -ProhibitSetNoCompatible
  set nocompatible  " [nocp] Be iMproved
endif

" (plugin) Plug
" =============

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'justinmk/molokai'
Plug 'blueyed/vim-diminactive'
Plug 'qpkorr/vim-bufkill'
Plug 'itchyny/lightline.vim'
Plug 'coderifous/textobj-word-column.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'goldie-lin/vim-gtags'
Plug 'goldie-lin/vim-gtags-cscope'
Plug 'osyo-manga/vim-over'
Plug 'easymotion/vim-easymotion'
Plug 'google/vim-searchindex'
Plug 'haya14busa/incsearch.vim'
Plug 'thinca/vim-visualstar'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tommcdo/vim-lion'
Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'nhooyr/neoman.vim'
Plug 'zdict/zdict.vim'
Plug 'yuratomo/w3m.vim'
Plug 'vim-utils/vim-g2'
Plug 'vim-utils/vim-troll-stopper', { 'for': [ 'c', 'cpp', 'java', 'python', 'perl', 'sh', 'awk', 'sed', 'vim' ] }
Plug 'hotoo/pangu.vim'
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
Plug 'AndrewRadev/switch.vim'
"Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chrisbra/Recover.vim'
Plug 'wincent/terminus'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/syntastic'
Plug 'metakirby5/codi.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ynkdir/vim-vimlparser'
Plug 'ap/vim-css-color'
Plug 'kergoth/aftersyntaxc.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shirk/vim-gas'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'dzeban/vim-log-syntax'
Plug 'thinca/vim-logcat'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'fedorov7/vim-uefi', { 'for': [ 'uefi', 'uni', 'vfr', 'kss', 'inform', 'c.doxygen' ] }
Plug 'bazelbuild/vim-ft-bzl'
Plug 'tmux-plugins/vim-tmux'
call plug#end()

" Vim encoding
" ============

set encoding=utf-8  " [enc] Set encoding used inside Vim (buffers, registers, expressions, text stored in 'viminfo')
set fileencoding=utf-8  " [fenc] Set default encoding for reading file
" [fencs] Set support encodings for reading file (default setting:ucs-bom,utf-8,default,latin1)
set fileencodings=ucs-bom,utf-8,default,big5,gb2312,gbk,latin1
scriptencoding utf-8  " [scripte] Specify the character encoding used in this script.

" Vim options
" ===========

syntax on  " Enable syntax highlighting
set nobackup  " [nobk] Do not make a backup file
"set visualbell  " [vb] Error bells are displayed visually (flash screen)
set virtualedit=block  " [ve] Allow moving cursor outside the actual text in visual block mode
set splitbelow  " [sb] Split a window will put the new window below the current one
set splitright  " [spr] Split a window will put the new window right of the current one
set fillchars+=vert:│  " [fcs] Character of vertical separators, set to '│' (\u2502) as same as tmux.
set hlsearch  " [hls] Highlight search
set incsearch  " [is] Search as you type instantly
set ignorecase  " [ic] Ignore case when search
set smartcase  " [scs] Ignore case if pattern is all lowercase, case-sensitive otherwise
set showmode  " [smd] Show current mode (INSERT|REPLACE|VISUAL) in last line
set showmatch  " [sm] Show (flash) match `([{' after input `([{', beep if not found
set showcmd  " [sc] Show incomplete command in the lower right corner
set ruler  " [ru] Show coordinates of mouse cursor always
set list  " See the difference between tabs and spaces and trailing blanks
set nocursorline  " [cul] Highlight the screen line of the cursor with CursorLine (FIXME: slow down console drawing, so disabled temporarily.)
"set number  " [nu] Show line number in front of each line.
set norelativenumber  " [rnu] Show line number relative to the line with the cursor in front of each line. (FIXME: slow down console drawing, so disabled temporarily.)
set sidescroll=1  " [ss] The minimal number of columns to scroll horizontally. (It will slow down console drawing.)
set tabpagemax=24  " [tpm] Max number of tab pages (default: 10)
set updatetime=300  " [ut] Swap file update interval (ms) (default: 4000)
"set noendofline binary  " [noeol] Save a file without terminator after last line
set laststatus=2  " Fix for (plugin) Lightline (MUST before color scheme setting)
set rtp+=~/.fzf  " Add for (plugin) fzf

set breakindent  " [bri] Every wrapped line will continue visually indented.
set breakindentopt=sbr  " [briopt] Settings for 'breakindent'.
let &showbreak = '↪> '  " [sbr] String to put at the start of lines that have been wrapped.

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

" [bs] Backspace works in insert mode, see `:h 'backspace'` for detail.
set backspace=indent,eol,start

set wildmenu  " [wmnu] Show wildmenu during tab auto-completion
" [wim] Enable command line tab auto-completioni
" (on 1st tab) List all matched completions.
" (on 2nd tab) Show wildmenu and following tabs cycle through matches.
set wildmode=list:longest,full
" [wig] Ignore these files when completing names and in explorer
set wildignore=CVS,.svn,.hg,.bzr,.git,.repo,*.o,*.a,*.class,*.pyc,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" folding settings
set foldmethod=marker  " [fdm] enable fold marker, i.e., '{{{' and '}}}'. (default: manual)

" enable some of neovim-specific options.
if has('nvim')
  set inccommand=nosplit  " [icm] Shows the effects of a command incrementally, as you type.
  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1  " (neovim) enable auto-change cursor shape, for nvim <= v0.1.7.
  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0  " (neovim) disable auto-change cursor shape, for nvim <= v0.1.7.
  "set guicursor=  " (neovim) disable auto-change cursor shape, for nvim >= v0.2.
endif

" try to enable 24bit true color if supported.
if &term !~? 'rxvt'  " ignore unsupported terminals.
  if has('nvim')
    set termguicolors  " [tgc] Uses highlight-guifg and highlight-guibg attributes in the terminal (thus using 24-bit color).
    "let $NVIM_TUI_ENABLE_TRUE_COLOR = 1  " (neovim) enable 24bit true color support. (deprecated and ignored after 2016-05-11, PR#4690.)
  elseif has('patch-7.4.1778')
    set termguicolors  " [tgc] Uses highlight-guifg and highlight-guibg attributes in the terminal (thus using 24-bit color).
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" try to use 256color instead of 88color if terminal supported explicitly.
if &term =~? '256color'
  set t_Co=256
endif

" Vim color scheme and font
" =========================

if has('gui_running')  " GVim
  set columns=100 lines=32  " default window size
  if has('gui_gtk2') ||  has('gui_gtk3')  " GTK2 or GTK 3
    set guifont=Fira\ Code\ 9
    let g:rehash256 = 1
    colorscheme molokai
  elseif has('x11')  " GTK1
    set guifont=-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*
    let g:rehash256 = 1
    colorscheme molokai
  elseif has('gui_win32') || has('gui_win32')  " Windows (Win32 or Win64)
    set guifont=Consolas:h12:cANSI
    colorscheme Tomorrow-Night-Eighties
  endif
else  " (console) Vim
  let g:rehash256 = 1
  colorscheme molokai
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

" highlight leading and trailing whitespaces
highlight ExtraLeadingWhitespaces  ctermfg=238 ctermbg=17 guifg=#444444 guibg=#00005F
highlight ExtraTrailingWhitespaces ctermfg=213 ctermbg=52 guifg=#FF87FF guibg=#5F0000
function! HLExtraWhitespaces()
  let l:hl_extra_whitespaces_buftypes_blacklist =
    \ [ 'help', 'quickfix', 'nofile', 'nowrite', 'acwrite' ]
  let l:hl_extra_whitespaces_filetypes_blacklist =
    \ [ 'help', 'qf', 'man', 'neoman', 'taglist', 'tagbar' ]
  if index(l:hl_extra_whitespaces_buftypes_blacklist, &buftype) >= 0
    \ || index(l:hl_extra_whitespaces_filetypes_blacklist, &filetype) >= 0
    match  none
    2match none
  else
    if &filetype !=# 'diff'
      match  ExtraLeadingWhitespaces  /\(^\s*\)\@<=\t\+/
      2match ExtraTrailingWhitespaces /\s\+$/
    else
      match  ExtraLeadingWhitespaces  /\(^[ +-]\s*\)\@<=\t\+/
      2match ExtraTrailingWhitespaces /^\@<!\s\+$\|^\t\s*$/
    endif
  endif
endfunction
augroup hl_extra_whitespaces
  autocmd BufEnter * call HLExtraWhitespaces()
augroup end

" change C syntax highlight for (plugin) aftersyntaxc.vim
" make Operator has different color with Keywords.
highlight cOperator term=none cterm=none ctermfg=Yellow gui=none guifg=#FFDF5F
" make Delimiter has different color with indentLine, and darker.
highlight Delimiter term=none cterm=none ctermfg=DarkBlue gui=none guifg=#0097FF

" (plugin) vim-troll-stopper
highlight TrollStopper ctermbg=Red guibg=#FF0000

" (plugin) syntastic
"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
highlight SyntasticErrorSig         ctermfg=213 ctermbg=160 guifg=#FF87FF guibg=#D70000
highlight SyntasticWarningSign      ctermfg=229 ctermbg=136 guifg=#FFFFAF guibg=#AF8700
highlight SyntasticStyleErrorSign   ctermfg=213 ctermbg=160 guifg=#FF87FF guibg=#D70000
highlight SyntasticStyleWarningSign ctermfg=229 ctermbg=136 guifg=#FFFFAF guibg=#AF8700

" Vim filetype
" ============

" filetype-specific settings
" enable filetype-specific plugins, filetype-specific indenting, and filetype detection.
filetype plugin indent on

" custom filetype remaps
autocmd BufNewFile,BufRead *.jsm set filetype=javascript
autocmd BufNewFile,BufRead *.rc  set filetype=sh
autocmd BufNewFile,BufRead *.aidl set filetype=java
autocmd BufRead,BufNewFile Android.bp set filetype=bzl

" Custom functions/scripts
" ========================

" remove trailing whitespaces when writing a buffer, but not for '.diff' files
" From: Vigil
"function! RemoveTrailingWhitespace()
"  if &ft !=# 'diff'
"    let b:curcol = col('.')
"    let b:curline = line('.')
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
  let [l:par_line, l:par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
    \ "line('.') < " . (a:lnum - s:maxoff) . ' ? dummy :'
    \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
    \ . " =~ '\\(Comment\\|String\\)$'")
  if l:par_line > 0
    call cursor(l:par_line, 1)
    if l:par_col != col('$') - 1
      return l:par_col
    endif
  endif
  return GetPythonIndent(a:lnum)
endfunction
let g:pyindent_nested_paren = '&sw*2'
let g:pyindent_open_paren = '&sw*2'

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
  \ if line("'\"") > 0 && line ("'\"") <= line('$') |
  \   exe "normal g'\"" |
  \ endif

" but, always start git commit message with the cursor in the first line
autocmd BufEnter *
  \ if &filetype == 'gitcommit' |
  \   call setpos('.', [0, 1, 1]) |
  \ endif

" (plugin) committia
" add hook function when git commit.
"
" you can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto
"
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " additional settings.
  setlocal spell

  " if no commit message, start with insert mode.
  if a:info.vcs ==# 'git' && getline(1) ==# ''
      startinsert
  end

  " scroll the diff window from insert mode.
  " map <C-n> and <C-p>
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" ':Rpdf' to view PDF (required package 'pdftotext' (poppler-utils))
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" ':DiffOrig' to see the diff between current buffer and file it was loaded from
if !exists(':DiffOrig')
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
let s:TWCC = 'N'
function! ToggleTWCC()
  if exists('+colorcolumn')
    if s:TWCC ==# 'Y'
      set textwidth=0
      set colorcolumn=
      let s:TWCC = 'N'
    else
      set textwidth=80  " (customizable)
      set colorcolumn=+1  " highlight 'one' column after 'textwidth'
      let s:TWCC = 'Y'
    endif
  endif
endfunction

" Vim syntax
" ==========

" (syntax) C/C++ enhancement
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Vim plugin
" ==========

" (plugin) vim-plug
delc PlugUpgrade  " Delete command, since I don't use it anymore.

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
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
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
let g:lightline.component = {
  \ 'lineinfo': '%3l/%L:%-2v'
  \ }

" (plugin) Markdown
let g:vim_markdown_initial_foldlevel = 1  " set initial foldlevel
let g:vim_markdown_folding_disabled = 1  " disable folding
let g:vim_markdown_no_default_key_mappings = 1  " disable default key mappings
let g:vim_markdown_new_list_item_indent = 2  " number of spaces of new list item indent
let g:vim_markdown_conceal = 0  " disable conceal regardless of 'conceallevel' setting
let g:vim_markdown_fenced_languages = [ 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'csharp=cs' ]  " use different name from filetype

" (plugin) Grepper
let g:grepper = {
  \ 'quickfix':  1,
  \ 'open':      1,
  \ 'switch':    1,
  \ 'jump':      0,
  \ 'cword':     0,
  \ 'prompt':    1,
  \ 'simple_prompt': 1,
  \ 'highlight': 1,
  \ 'buffer':    0,
  \ 'buffers':   0,
  \ 'next_tool': '<Tab>',
  \ 'tools':     ['git', 'ag', 'rg', 'grep'],
  \ }

" (plugin) gitgutter
let g:gitgutter_max_signs = 1000  " (default: 500)
let g:gitgutter_realtime = 0  " trade speed for accuracy
let g:gitgutter_eager = 0  " trade speed for accuracy

" (plugin) Tagbar
let g:tagbar_compact = 1  " omit short help at the top
let g:tagbar_width = 30  " default: 40
let g:tagbar_indent = 1  " default: 2
let g:tagbar_sort = 0  " don't sort the tags (default: 1)
"autocmd CursorMoved * silent! TagbarShowTag  " instant update tag highlight during moving cursor.

" (plugin) cscope
" Note: FIXME: the location list is still very buggy on multiple tab pages.
"let g:autocscope_use_quickfix = 1
"let g:autocscope_use_location_instead = 0  " disabled, keep using quickfix list

" (plugin) gtags
"let g:Gtags_Result = 'ctags-x'  " tag format (old, for fallback)
let g:Gtags_Result = 'ctags-mod'  " tag format (new, required GNU GLOBAL v6.0+)
let g:Gtags_OpenQuickfixWindow = 1  " open quickfix window if avaliable
let g:Gtags_VerticalWindow = 0  " set to 1 will open windows vitically, otherwise horizontal
let g:Gtags_Auto_Map = 0  " do not use suggested (built-in) key-mapping
let g:Gtags_Auto_Update = 0  " do not keep tag files up-to-date automatically (slow down the file writting)
let g:Gtags_No_Auto_Jump = 0  " jump to the first tag at the time of search (find definition more effective)
let g:Gtags_Close_When_Single = 1  " close quickfix windows in case of single tag

" (plugin) gtags-cscope
set tags+=./tags,./TAGS,tags,TAGS;/
set tagstack
set cscopeprg=gtags-cscope
"set cscopetag
set cscopeverbose
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
" syntax/style error/warning symbol
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = 'S✗'
let g:syntastic_style_warning_symbol = 'S⚠'
" check setting for filetype 'sh':
let g:syntastic_sh_checkers = [ 'bashate', 'shellcheck' ]
let g:syntastic_sh_bashate_post_args = '-i E002,E003,E006,E040'  " ignore intent hard tabs, strict 4 spaces indent, lines longer than 79, syntax errors reported by `bash -n`.
let g:syntastic_sh_shellcheck_post_args = '-e SC1091'  " ignore sourcing external files
" check setting for filetype 'c':
let g:syntastic_c_checkers = [ 'sparse', 'gcc', 'cppcheck' ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_sparse_post_args = '-gcc-base-dir ' .
  \ system("gcc -v 2>&1 | sed -n '/^Reading specs/ { s#.* /#/#; s#/[^/]*$##; p; }'")
let g:syntastic_splint_config_file = '.syntastic_c_config'
let g:syntastic_sparse_config_file = '.syntastic_c_config'
" check setting for filetype 'python':
let g:syntastic_python_checkers = [ 'python', 'flake8' ]
let g:syntastic_python_flake8_post_args = '--ignore E111,E114'  " ignore strict 4 spaces indent
let g:syntastic_python_pylint_post_args = '--disable=bad-indentation'  " ignore strict 4 spaces indent
" check setting for filetype 'vim':
let g:syntastic_vim_checkers = [ 'vint' ]
" check setting for filetype 'markdown':
let g:syntastic_markdown_checkers = [ 'mdl' ]
let g:syntastic_markdown_mdl_exec = 'markdownlint'
let g:syntastic_markdown_mdl_args = ''
" check setting for filetype 'lua':
let g:syntastic_lua_checkers = [ 'luacheck', 'luac' ]

" (plugin) YouCompleteMe
let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'taglist' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1,
  \ 'infolog' : 1,
  \ 'mail' : 1
  \ }
let g:ycm_key_list_select_completion = [ '<C-n>', '<Tab>', '<Down>' ]
let g:ycm_key_list_previous_completion = [ '<C-p>', '<S-Tab>', '<Up>' ]
let g:ycm_key_invoke_completion = '<C-Space>'

" (plugin) UltiSnips
let g:UltiSnipsSnippetDirectories=[ 'UltiSnips', 'ultisnips_my' ]
let g:UltiSnipsExpandTrigger = '<C-e>'  " not '<Tab>' to make sure no conflict with YouCompleteMe
let g:UltiSnipsListSnippets = '<C-S-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'  " be careful, do not conflict with YouCompleteMe
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'  " be careful, do not conflict with YouCompleteMe
let g:UltiSnipsEditSplit = 'vertical'

" (plugin) switch.vim
" Ref: https://blog.othree.net/log/2017/11/16/naming-cases/
" Definitions are based on above link with my additional modifications.
"   1. camelCase -> PascalCase
"   2. PascalCase -> snake_case
"   3. snake_case -> MACRO_CASE
"   4. MACRO_CASE -> Title_Caps_Snake_Case (added)
"   5. Title_Caps_Snake_Case -> lisp-case (added)
"   6. lisp-case -> COBOL-CASE (added)
"   7. COBOL-CASE -> Train-Case (added)
"   8. Train-Case -> camelCase (added)
let g:switch_custom_definitions =
  \ [
  \   {
  \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
  \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
  \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
  \     '\<\(\u\+\)\(\(_\u\+\)\+\)\>': "\\=substitute(submatch(1), '\\(\\u\\)\\(\\u*\\)', '\\1\\L\\2', 'g') . substitute(submatch(2), '_\\(\\u\\)\\(\\u*\\)', '_\\1\\L\\2', 'g')",
  \     '\<\(\u\l\+\)\(\(_\u\l*\)\+\)\>': "\\=tolower(submatch(1)) . substitute(submatch(2), '_\\(\\u\\l*\\)', '-\\L\\1', 'g')",
  \     '\<\(\l\+\)\(-\l\+\)\+\>': '\U\0',
  \     '\<\(\u\+\)\(\(-\u\+\)\+\)\>': "\\=substitute(submatch(1), '\\(\\u\\)\\(\\u*\\)', '\\1\\L\\2', 'g') . substitute(submatch(2), '-\\(\\u\\)\\(\\u*\\)', '-\\1\\L\\2', 'g')",
  \     '\<\(\u\l\+\)\(\(-\u\l\+\)\+\)\>': "\\=tolower(submatch(1)) . substitute(submatch(2), '-', '', 'g')",
  \     '\<\(\u\l\+\)\(-\u\l*\)\+\>': "\\=tolower(substitute(submatch(0), '-', '_', 'g'))",
  \   }
  \ ]
let g:switch_mapping = '-'
let g:switch_reverse_mapping = '+'
"let g:switch_find_smallest_match = 0

" (plugin) terminus
" disable TerminusFocusReporting to prevent trigger the :checktime command
" that will interfere tmux highlighting the window activity in status line.
let g:TerminusFocusReporting = 0

" (plugin) vim-over
let g:over#command_line#search#enable_incsearch = 0

" (plugin) visualstar
let g:visualstar_no_default_key_mappings = 1  " disable default key mappings
let g:visualstar_extra_commands = 'zzzv'  " keep search results appear in the middle of the screen

" (plugin) indentLine
let g:indentLine_enabled = 0  " (default: 1)
let g:indentLine_char = '¦'  " (default: '|')
let g:indentLine_indentLevel = 6  " (default: 10)
let g:indentLine_maxLines = 100  " (default: 3000)
let g:indentLine_faster = 1  " (default: 0)
let g:indentLine_bufNameExclude = [ 'help', 'quickfix', 'nofile', 'nowrite' ]  " (default: [])
let g:indentLine_fileTypeExclude = [ 'help', 'qf', 'man', 'neoman', 'taglist', 'tagbar', 'text', 'log', 'logcat', 'gitcommit', 'markdown' ]  " (default: [])
let g:indentLine_fileType = [ 'c', 'cpp', 'java', 'python', 'perl', 'sh' ]  " (default: [])

" (plugin) neoman
let g:neoman_find_window = 1
let g:no_neoman_maps = 1

" (plugin) diminactive
let g:diminactive_enable_focus = 1

" (plugin) vim-peekaboo
let g:peekaboo_window = 'vertical botright 30new'
let g:peekaboo_delay = 500

" (plugin) vim-table-mode
let g:table_mode_fillchar = '-'
let g:table_mode_separator = '|'
let g:table_mode_corner = '|'
let g:table_mode_corner_corner = '|'
let g:table_mode_delimiter = ','
let g:table_mode_align_char = ':'
let g:table_mode_map_prefix = '<Leader>t'
let g:table_mode_toggle_map = 'm'
let g:table_mode_realign_map = '<Leader>tr'
let g:table_mode_delete_row_map = '<Leader>tdd'
let g:table_mode_delete_column_map = '<Leader>tdc'
let g:table_mode_add_formula_map = '<Leader>tfa'
let g:table_mode_eval_formula_map = '<Leader>tfe'
let g:table_mode_echo_cell_map = '<Leader>t?'
let g:table_mode_sort_map = '<Leader>ts'

" (plugin) bufkill
let g:BufKillCreateMappings = 0  " disable default key mappings

" (plugin) fzf
let g:fzf_prefer_tmux = 1  " force fzf to prefer using tmux instead of
                           " neovim's terminal, to avoid incrementing the
                           " buffer number every time I use fzf facilities.

" Custom hotkey shortcuts
" =======================

" better j,k when line wrapped.
nnoremap j gj
nnoremap k gk

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

" browse the input history in command mode
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" add some key bindings for command mode to make it similar to bash
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" list all buffers and wait for user selection.
nnoremap <Leader>b :ls<CR>:b

" list all buffers and wait for user selection with (plugin) fzf-vim.
nnoremap <Leader>l :Buffers<CR>

" tselect
nmap <Leader>] :tselect <C-R>=expand('<cword>')<CR><CR>

" better indent in visual mode for repeat, keep the same selection selected in the same mode.
" Ref: https://wen00072.github.io/blog/2016/11/26/vim-setup-for-trace-c-code/
vnoremap < <gv
vnoremap > >gv

" disable <F1> for help, :h[elp] is more useful for the experienced user
"nnoremap <F1> <Nop>
"inoremap <F1> <Nop>

" insert current timestamp
nnoremap <F1>     "=strftime("%Y-%m-%d (%a) %H:%M:%S")<CR>P
inoremap <F1> <C-R>=strftime("%Y-%m-%d (%a) %H:%M:%S")<CR>

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
let g:incsearch#auto_nohlsearch = 0
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
let g:incsearch#separate_highlight = 1

" (plugin) Grepper
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool ag<CR>
nnoremap <Leader><C-g> :Grepper -tool rg<CR>
nnoremap <Leader><M-g> :Grepper -tool grep<CR>
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" (plugin) gitgutter
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" (plugin) fzf-vim
" mapping selecting mappings
nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)
" insert mode completion
imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-j> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)
" advanced customization using autoload functions
inoremap <expr> <C-x><C-k> fzf#vim#complete#word({'left': '15%'})

" (plugin) gtags
noremap <C-\><C-]> :GtagsCursor<CR>

" (plugin) gtags-cscope
nmap <C-\>s :cs find s <C-R>=expand('<cword>')<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand('<cword>')<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand('<cword>')<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand('<cword>')<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand('<cword>')<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand('<cfile>')<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand('<cfile>')<CR><CR>
nmap <C-\><C-n> :cn<CR>
nmap <C-\><C-p> :cp<CR>
nmap <C-\><C-\><C-]> :cs find d <C-R>=expand('<cword>')<CR>:<C-R>=line('.')<CR>:%<CR>

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
