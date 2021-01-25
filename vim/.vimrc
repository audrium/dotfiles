" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Init vim-plug
call plug#begin()

" Universal set of defaults
Plug 'tpope/vim-sensible'

" Color theme
Plug 'junegunn/seoul256.vim'
    let g:seoul256_background = 235

" Intellisense
Plug 'neoclide/coc.nvim'
    let g:coc_global_extensions = [
        \ 'coc-pyright',
        \ 'coc-json',
        \ 'coc-css',
        \ 'coc-tsserver',
        \ 'coc-yaml',
     \ ]

" File explorer
Plug 'preservim/nerdtree'
    let g:NERDTreeMouseMode = 3
Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeGitStatusUseNerdFonts = 1
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Path finder
Plug 'ctrlpvim/ctrlp.vim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status bar
Plug 'itchyny/lightline.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Editing plugins
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'

" Highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'
    let g:strip_whitespace_confirm=0
    let g:strip_whitespace_on_save=1

" Tagbar
Plug 'majutsushi/tagbar'

" Python black linter
Plug 'psf/black', { 'for': 'python', 'tag': '19.10b0' }

" Collection of language packs
Plug 'sheerun/vim-polyglot'

" Linter
Plug 'w0rp/ale'
    " Use only flake8 linter for Python for now
    let g:ale_linters = {
        \ 'python': ['flake8'],
        \ }
    let g:ale_fixers = {
        \ 'javascript': ['prettier'],
        \ 'python': ['black'],
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ }
    let g:ale_lint_delay = 1000
    let g:ale_open_list = 1
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'

call plug#end()

filetype plugin indent on

" Set color theme
syntax on
colorscheme seoul256

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Set lightline to include git-branch
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ,
      \             [ 'venv', 'readonly'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'venv': 'virtualenv#statusline'
      \ },
      \ }

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
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" Copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" Move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" Goyo
nmap <leader>g :Goyo<CR>

" Tags
nmap <leader>t :TagbarToggle<CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Keep undo history across sessions by storing it in a file
" Allows open up a file and make undo operation
if has('persistent_undo')
    let undo_dir = expand('$HOME/.vim/undo_dir')
    if !isdirectory(undo_dir)
        call mkdir(undo_dir, "", 0700)
    endif
    set undodir=$HOME/.vim/undo_dir
    set undofile
endif
