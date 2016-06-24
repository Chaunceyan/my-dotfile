set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" PowerLine, a status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Using git inside Vim
Plugin 'tpope/vim-fugitive'
" Super Search
Plugin 'kien/ctrlp.vim'
" Nerd tree
Plugin 'scrooloose/nerdtree'
" Color scheme
Plugin 'flazz/vim-colorschemes'
" Method folding plugin
Plugin 'tmhedberg/SimpylFold'
" Auto complete
Bundle 'Valloric/YouCompleteMe'
" Handle indentation properly
Plugin 'vim-scripts/indentpython.vim'
" Syntastic checking plugin
Plugin 'scrooloose/syntastic'
" PEP8 checking plugin
Plugin 'nvie/vim-flake8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Split configuration
set splitbelow
set splitright
" Syntastic Highlighting
syntax on
let python_highlight_all=1
colorscheme molokai
" Synatstic error checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Nerd tree remap
map <C-n> :NERDTreeToggle<CR>
" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" Simply fold config
let g:SimplyFold_docstring_preview=1
set tabstop=4
set smartindent
set encoding=utf-8
set laststatus=2 " For powerline to show up
set nu " Line number
set clipboard=unnamed " System clipboard
" Python dev
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
" Web dev
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
