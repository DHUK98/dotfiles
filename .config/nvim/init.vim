let mapleader = " "
let maplocalleader = "-"
set updatetime=100
autocmd InsertEnter * norm zz

set relativenumber
set cursorline
set cursorcolumn 
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set copyindent

let g:python_host_prog = '/usr/bin/python3'

vmap <Tab> >gv
vmap <S-Tab> <gv

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pipenv run python' shellescape(@%, 1)<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
	if (match(a:key,'[jk]'))
	    wincmd v
	else
	    wincmd s
	endif
	exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
" vimwiki
set nocompatible
filetype plugin on
syntax on

" easymotion
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>w <Plug>(easymotion-bd-w)

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" coc
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <Leader>g <Plug>(coc-format)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" nerdcommenter
let g:NERDToggleCheckAllLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" fzf
map <C-f> :Files<CR>

" gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd guifg=#009900
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" airline
let g:airline_theme = "gruvbox"
let g:airline#extensions#hunks#enabled = 1 

" tagbars
nmap <F8> :TagbarToggle<CR>

call plug#begin("~/.local/share/nvim/plugged")

Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf',{'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'numirias/semshi'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vimwiki/vimwiki'

call plug#end()

colorscheme gruvbox
set nu
