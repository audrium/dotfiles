filetype plugin indent on

" Set color theme
syntax on

" Use the terminal background color for onedark theme
autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" } })
colorscheme onedark

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Set lightline
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction
let g:lightline = {'colorscheme': 'onedark'}

set hidden

" Always show statusbar
set laststatus=2

" Flash instead of beep
set visualbell

" Reduce updatetime for faster GitGutter response
set updatetime=100

" Display line numbers
set number

" Highlight all search results
set hlsearch

" Auto-indent new lines
set autoindent

" Use spaces instead of tabs
set expandtab
set tabstop=4
set softtabstop=4

" Number of auto-indent spaces
set shiftwidth=4

" Use system clipboard
set clipboard=unnamedplus

set encoding=UTF-8
set colorcolumn=80
set viminfo='25,\"50,n~/.viminfo

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" Mouse
set ttymouse=xterm2
set mouse=a
