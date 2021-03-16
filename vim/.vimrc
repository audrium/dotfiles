source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/settings.vim
source ~/.dotfiles/vim/keybindings.vim

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

