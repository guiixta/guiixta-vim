set encoding=UTF-8
scriptencoding utf-8

" Abrindo o clipboard do sistema
set clipboard=unnamedplus

" Cor no texto
syntax on

" Muda o cursor para uma barra (|) no modo de inserção
let &t_SI = "\e[5 q" " insert
let &t_SR = "\e[3 q" " replace
let &t_EI = "\e[1 q" " normal

" Volta o curso ao normal apos sair do Vim
au VimLeave * silent execute "normal! :set t_be="

" Faz o Vim reconhecer o Alt mais rapidamente no terminal
set ttimeout
set ttimeoutlen=50

" Tamanho do tab
set tabstop=3
set shiftwidth=3

" Ativando numeros no vim
set number
set relativenumber

" Atalhos para 'salvar' e 'salvar e sair'
nnoremap <C-s> :w<CR>
inoremap <C-s> :w<CR>
nnoremap <C-x> :wq<CR>

" Definido <leader>
let mapleader = " "


set nocompatible
" Configurando plugins
call plug#begin()

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdtree'

Plug 'vim-python/python-syntax'

Plug 'ryanoasis/vim-devicons'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'mattn/emmet-vim'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/indentLine'

Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-fugitive'

Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Tema everforest
Plug 'sainnhe/everforest'


call plug#end()

" Ler arquivos .blade como php
"autocmd BufRead,BufNewFile *.blade.php set filetype=php 

" Atalho para copiar com wl-copy
xnoremap <silent> <leader>0 y:call system("wl-copy", getreg('"'))<CR>

" Atalho para copiar em ssh
"xnoremap <silent> <leader>0 <Plug>OSCYankVisual

" Atalho para copiar em ssh
" xnoremap <silent> <leader>0 "+y

" Atalho para abrir um terminal dentro do vim
nnoremap <leader>t :botright terminal<CR>
tnoremap <ESC> <C-\><C-n>
autocmd terminalOpen * nnoremap <buffer> <leader>t :q!<CR>

" Tema setado
colorscheme everforest

" Desativando o indicador de modo, pois utilizamos o do airline
set noshowmode

" Icons do startifyh
let g:webdevicons_enable_startify = 1

" Configuração para vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_py_git_branch = 1
nnoremap <M-Right> :bnext<CR>
nnoremap <M-Left> :bprevious<CR>
nnoremap <leader>x :bd<CR>

nnoremap <X2Mouse> :bnext<CR>
nnoremap <X1Mouse> :bprevious<CR>


" Configuração NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" Evitar que outros buffers substituan o espaço do nerdTree
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeMinimalUI = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Ctrlp
" Abrir na pasta do projeto
let g:ctrlp_working_path_mode = 'ra'
" Pastas para ignorar na buscar no .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Mostrar icones
let g:webdevicons_enable_ctrlp = 1


" Emmet Config
let g:user_emmet_mode='i'

" tab para coc não se confudir
function! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ Check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Usar <Enter> para confirmar a seleção do autocompletar COC
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_javascript = 1    

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

