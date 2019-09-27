# Vim 8 package handling with git submodules

Vim 8 provides package handline mechanisms that replace Pathogen and other package handlers. These files use the Vim 8 folder structure for vim packages.

## Getting Started

These notes show how to use these files to update a new vim user and how to update any included vim plugins.

### Prerequisites

Plugin files are now stored in ~/.vim/pack/my-plugins/start. Additional plugins can be stored in ~/.vim/pack/my-plugins/opt for ad-hoc use.

Note that I chose the name "my-plugins". Vim 8 doesn't care what that folder is named.

### Installing

Update your local copies of the plugins.

 git submodule update --remote --merge

Then copy the .vim folder into $HOME.

To verify vim is loading the plugins type ":scriptnames" from within vim.

### Updating

Add a new package with:

 git submodule init
 git submodule add https://github.com/vim-airline/vim-airline.git vim/.vim/pack/my-plugins/start/vim-airline
 git add .gitmodules vim/.vim/pack/my-plugins/start/vim-airlinm
 git commit

To remove a package:

 git submodule deinit vim/.vim/pack/my-plugins/start/vim-airline
 git rm vim/.vim/pack/my-plugins/start/vim-airline
 rm -Rf .git/modules/vim/.vim/pack/my-plugins/start/vim-airline
 git commit

## Authors

* **Darryl Martin** - Based off of George Ornbo's article at https://shapeshed.com/vim-packages.
