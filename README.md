# dotfiles
Audrius minimalistic dotfiles

- Clone this repo
    ```
    cd $HOME
    git clone git@github.com:audrium/dotfiles .dotfiles
    ```

- Install needed packages
    ```
    sudo apt install guake vim zsh code alacritty
    ```

- Install zsh plugin manager antibody
    ```
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
    ```

- Create symlinks for needed packages
    ```
    stow git vim zsh vscode
    ```

- Load guake settings
    ```
    guake --restore-preferences guake/prefs.guake
    ```

- Install vscode extensions
    ```
    cat vscode_extensions | xargs -L 1 code --install-extension
    ```

- Configure `regolith`
   ```
   # install regolith ppa
   # install pop-os theme
   sudo apt install regolith-look-pop-os
   regolith-look set pop-os
   regolith-look refresh
   # create symlinks for regolith configs
   stow regolith
   ```
