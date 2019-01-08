set nocp

runtime! autoload/pathogen.vim
if exists('*pathogen#infect')
    execute pathogen#infect()
    call pathogen#helptags()
endif
" Only needed for Rentrak reasonably_stable_mappings.vim
if exists("g:loaded_pathogen")
    let list = []
    for dir in pathogen#split(&rtp)
        if dir !~# '/usr/share/vim/vimfiles'
            call add(list, dir)
        endif
    endfor
    let &rtp = pathogen#join(list)
endif


filetype plugin indent on
" |_ Set <Leader> to , AND \
let mapleader = "\\"
nmap , <Leader>
let maplocalleader = "-"

set exrc

if has("autocmd")
    augroup project
        autocmd!
        autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
        " HTML (.jhtml for server side)
        au BufNewFile,BufRead *.jhtml      set filetype=html
        " ProC
        au BufNewFile,BufRead *.pc      set filetype=c
        " Comment lines in Python
        au FileType python     nnoremap <buffer> <localleader>c I#<esc>
    augroup END

    " Make searching for files start in the current directory of your current file.
    autocmd BufEnter * lcd %:p:h
    " Make selecting work better when selecting parts of perl modules.
    autocmd FileType perl setlocal iskeyword-=:
endif

let &path.="/usr/local/include,"

" Will show tabs (as opposed to spaces) and trailing whitespaces.  The >> and . parts are actually special characters so copy/paste them.
set listchars=tab:»·,trail:·
" This will cause new tabs to be spaces.
set expandtab
" Make tabs be 4 chars.
set sw=4
set ts=4
" These are probably on by default but they just help with auto indenting.
set ai
set si
set smarttab
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:syntax on

" Change colorscheme if using vimdiff
if &diff
    colorscheme blue
endif

" collapse tag stuff
":so ~/collapse.vim

syntax on
set list
set hlsearch
set incsearch 
set showmatch
set nowrap
set nobackup
set hidden  " Allow files to stay open and unsaved while editing other files
set undolevels=1000
set history=1000
nmap <Space> :noh<cr>

"
"  Plugin specific settings located .vim/after/plugin
"

" Rentrak specifics
" allow ReasonableParams
hi! def link perlSubPrototypeError perlSubPrototype
let s:reasonably_stable_mappings_file = "/usr/local/etc/vimrc_files/reasonably_stable_mappings.vim"

if filereadable(s:reasonably_stable_mappings_file)
    " Add Reasonably Stable Mappings.
    execute 'source' s:reasonably_stable_mappings_file
endif


