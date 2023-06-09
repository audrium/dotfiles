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
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
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

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status bar
Plug 'itchyny/lightline.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Wiki
Plug 'vimwiki/vimwiki'
    let g:vimwiki_list = [{'path': '~/Documents/notes',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

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
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

" Linter
"Plug 'w0rp/ale'
    "" Use only flake8 linter for Python for now
    "let g:ale_linters = {
        "\ 'python': ['flake8'],
        "\ }
    "let g:ale_fixers = {
        "\ 'javascript': ['prettier'],
        "\ 'python': ['black'],
        "\ '*': ['remove_trailing_lines', 'trim_whitespace'],
        "\ }
    "let g:ale_lint_delay = 1000
    "let g:ale_open_list = 1
    "let g:ale_lint_on_save = 1
    "let g:ale_lint_on_text_changed = 0
    "let g:ale_sign_error = '❌'
    "let g:ale_sign_warning = '⚠️'

call plug#end()
