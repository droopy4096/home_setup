set bg=dark
set foldmethod=syntax
set foldlevel=2
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
filetype indent on
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=indent
au FileType rst setlocal nonumber
au FileType text setlocal nonumber
au FileType markdown setlocal nonumber

" Dark Magic: https://linuxaria.com/howto/use-vim-at-its-best-to-edit-your-puppet-manifests
let g:pathogen_disabled = ['vim-fugitive', 'tabular', 'tcomment_vim', 'vim-markdown']
" source /Users/dmakovey/work/vim/vimrc-puppet/.vimrc
let g:syntastic_puppet_puppetlint_args="--no-trailing_whitespace-check --no-2sp_soft_tabs-check"
let g:syntastic_puppet_puppet_exec="/opt/puppetlabs/bin/puppet"
let g:syntastic_yaml_checkers=['yamllint']
" AirlineToggleWhitespace

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <F3> <Plug>NERDTreeTabsToggle<CR>


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
