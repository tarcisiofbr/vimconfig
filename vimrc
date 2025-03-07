"! Plugins  -------------------------------------------------------------------

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vim-which-key'

call plug#end()

"! Configs  -------------------------------------------------------------------

syntax enable
colorscheme monokai
" colorscheme desert
set number relativenumber
let mapleader=" "
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}
let g:lsp_diagnostics_enabled = 0
set tabstop=4 shiftwidth=4
set expandtab
set colorcolumn=80
set scrolloff=10
set hidden
highlight ColorColumn ctermbg=4

"! Bindings  ------------------------------------------------------------------
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nmap <leader>n :NERDTree<CR>:set number relativenumber<CR>
nmap <leader>t :NERDTreeToggle<CR>:set number relativenumber<CR>
" nmap <leader>f :NERDTreeFind<CR>
nmap <leader>e :e 
nmap <leader>w <C-w>
nmap <leader>bd :bd<CR>
nmap <leader>src :w<CR>:source ~/.vimrc<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>ff :Files<CR>
nmap <leader>fl :BLines<CR> 
nmap <leader>fg :Rg
nmap <leader>' <C-^>
nmap <C-j> 5<C-e>
nmap <C-k> 5<C-y>
nmap <leader>m :terminal<CR>
nmap <leader>c :e ~/.vimrc<CR>

""! Section bindings  ---------------------------------------------------------

" Create section in file
nmap <leader>si i.<ESC>gcclC! <ESC>100i-<ESC>0lli  <ESC>i
" Clip extra '-' at the end of section
nmap <leader>sc 80\|C<ESC>0
" Printing all sections 
nmap <leader>sp :let @" = expand("%")<CR>:terminal<CR>grep "#!" <C-w>"0<CR>exit

""! R binds -------------------------------------------------------------------
nmap <leader>ro :terminal<CR>conda activate bioinfo<CR>R<CR><C-w>w<C-w>r
nmap <leader>rv :vsplit<CR><C-w>w:terminal<CR><C-w>w:q<CR>conda activate bioinfo<CR>R<CR><C-w>w
nmap <leader>rl yy<C-w>w<C-w>"0<CR><C-w>wj
nmap <leader>rr yy<C-w>w<C-w>"0<CR><C-w>w
nmap <leader>rh viwy<C-w>whead(<C-w>"0)<CR><C-w>w
nmap <leader>rq <C-w>wq(save="no")<CR><C-d>
nmap <leader>rk V}y<C-w>w<C-w>"0<CR><C-w>w}
vmap <leader>rb y<C-w>w<C-w>"0<CR><C-w>w
imap <C-]> <Esc>a %>% 
imap <C-f> <Esc>a %in% 
imap <C-_> <Esc>a <- 

""! Python binds  -------------------------------------------------------------

" The execution commands from R binds work as well
nmap <leader>pp :terminal<CR>conda activate bioinfo<CR>ipython --no-autoindent<CR><C-w>w<C-w>r
nmap <leader>pv :vsplit<CR><C-w>w:terminal<CR><C-w>w:q<CR>conda activate bioinfo<CR>ipython --no-autoindent<CR><C-w>w
nmap <leader>pq <C-w>wexit()<CR><C-w>w<C-w>wexit<CR>
nmap <leader>ph viwy<C-w>w<C-w>"0.head()<CR><C-w>w

"! FIXES  ---------------------------------------------------------------------

" Color thing fix
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

