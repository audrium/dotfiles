# dotfiles
Audrius dotfiles

- Clone this repo
    ```
    cd $HOME
    git clone git@github.com:audrium/dotfiles .dotfiles
    ```

- Install needed packages
    ```
    sudo apt install guake vim zsh
    ```

- Install zsh plugin manager antibody
    ```
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
    ```

- Create symlinks for needed packages
    ```
    stow git vim zsh
    ```

- Load guake settings
    ```
    guake --restore-preferences guake/prefs.guake
    ```