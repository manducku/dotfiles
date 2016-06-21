set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'junegunn/seoul256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
"it`s NerdTree 
Plugin 'scrooloose/nerdtree'
"auto complete Plugin 
Plugin 'AutoComplPop'
"tag List Plugin
Plugin 'taglist-plus'
"emmet
Plugin 'mattn/emmet-vim'
"indent guide
Plugin 'nathanaelkane/vim-indent-guides'
"light line 
Plugin 'itchyny/lightline.vim'
"hybrid vim 
Plugin 'w0ng/vim-hybrid'
"youcomplete 
"Plugin 'valloric/youcompleteme'
"Supertab 
Plugin 'ervandew/supertab'
"vim tmux controller
Plugin 'christoomey/vim-tmux-navigator'
"vim git gutter reveal"
Plugin 'airblade/vim-gitgutter'
"tmuxline setup
Plugin 'edkolev/tmuxline.vim'

"monokai 
Plugin 'rickharris/vim-monokai'

"silver searcher"
Plugin 'gabesoft/vim-ags'

"jedi vim 
Plugin 'davidhalter/jedi-vim'
"material design 
Plugin 'jdkanani/vim-material-theme'
Plugin 'ervandew/ag'
Plugin 'walm/jshint.vim'
Plugin 'mxw/vim-jsx'
Plugin 'nlknguyen/copy-cut-paste.vim'
Plugin 'marijnh/tern_for_vim'

Plugin 'shougo/neocomplete.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"Nerd Tree Setting
let NERDTreeWinPos = "left"

"Shortcut Matching 
nmap <F7> :NERDTree<CR>
nmap <F8> :TlistToggle<CR>
nmap <F9> <leader>ig <CR>
nmap <F2> :set paste<CR>
nmap <F3> :set nopaste<CR>
inoremap jj <Esc>
filetype on

" ctag path config	 
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0

"Tlist setting 
let Tlist_Use_Right_Window = 1
"vim config
set nu
set smartindent
set hlsearch
set ignorecase
set tabstop=4
set shiftwidth=4

"vim theme 
syntax enable
set background=dark
colorscheme monokai 

"vim git gutter config  
let g:gitgutter_avoid_cmd_prompt_on_windows = 0

"vim indent configured
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"vim tmux setting 
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = "monokai"
let g:tmuxline_preset = 'full'

Plugin 'wakatime/vim-wakatime'


let g:copy_cut_paste_no_mappings = 1

"neocomplete setting
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

set clipboard=unnamed
