if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

let mapleader=","

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <leader>a :cclose<CR>

set showcmd
set visualbell
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set number
set ruler
set guifont=Menlo\ Regular:h16
set colorcolumn=80
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set background=dark
set updatetime=100
"set laststatus=2
set autowrite

" color theme
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
let g:solarized_termcolors=256
colorscheme solarized

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"""""""""""""""""""""""""""""""""
" vim-go settings
"""""""""""""""""""""""""""""""""
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i  <Plug>(go-info)
autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"
let g:go_test_timeout = '10s'
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
