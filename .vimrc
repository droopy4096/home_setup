set bg=dark
colo darkblue
" set foldmethod=indent
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
filetype indent on
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=indent
au FileType rst setlocal nonumber
au FileType text setlocal nonumber
au FileType markdown setlocal nonumber


" http://vim.wikia.com/wiki/Example_vimrc
set hidden
set wildmenu
set showcmd
" set hlsearch
set laststatus=2
set visualbell
set number 
set list

" open all windows side-by-side
" since we use dwm plugin
all
