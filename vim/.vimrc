set nocompatible              "
filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jgdavey/tslime.vim'
Plugin 'jgdavey/vim-turbux'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
" Plugin 'tpope/vim-commentary'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'taglist.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
" Plugin 'scrooloose/syntastic'

" ===== rails-specific =====
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'thoughtbot/vim-rspec'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'AndrewRadev/vim-eco'
Plugin 'ngmy/vim-rubocop'
" =========================

" ===== Elixir  =====
Plugin 'elixir-lang/vim-elixir'
" ===================


" All of your Plugins must be added before the following line
call vundle#end()


" ========================= Plugin config =======================

" === Airline ===
set laststatus=2                            " always show the status line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
" === Airline ===

" === CtrlP ===
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|node_modules$\|deps$\|_build$',
  \ 'file': '\v\.(so\.?\d*|log)$'
  \ }
" === CtrlP ===

" === Tagbar  ===
nmap <F8> :TagbarToggle<CR>
" === Tagbar ===

" === TSlime, Vim-RSpec ===
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" === TSlime, Vim-RSpec ===

" ========================= Plugin config =======================


" ========================= General settings =======================
filetype plugin indent on                   " activates filetype detection
syntax on                                   " activates syntax highlighting among other things
set encoding=utf-8                          " use utf-8 for character representation
set fileencoding=utf-8                      " save files in utf-8
set omnifunc=syntaxcomplete#Complete        " set omnicomplete function
set hidden                                  " hides buffers instead of closing them
set t_Co=256                                " enable 256 color support
set timeoutlen=250                          " Reduce default timeout after ESC
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/coverage/*    " Don't show these files in choice
set tags+=gems.tags                         " Use gems' ctags as well
set iskeyword+=                             " Don't treat dash as keyword separator
set ttyfast                                 " faster scrolling
set noswapfile                              " do not create swap files
set pastetoggle=<F2>                        " switch off autoformatting on paste
set list listchars=tab:▸\ ,trail:.,precedes:<,extends:> " mark formatting characters eol:¬,
set nostartofline                           " Keep cursor position on buffer change etc.

" Colors

" === Solarized ===
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=0
" let g:solarized_visibility low
" colorscheme solarized

" === Gruvbox ===
" set background=dark
" let g:gruvbox_termcolors=256
" let g:gruvbox_italic=0
" colorscheme gruvbox

" colorscheme wombat256mod
colorscheme summerfruit256mod

" Line wrapping
set nowrap                                  " do not wrap long lines automatically...
set textwidth=80                            " ...after 79 characters
set formatoptions=qrn1                      " defines how Vim formats text

" Line numbers
set number                                  " Line numbers on
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <F7> :call NumberToggle()<cr>

" Command line
set showcmd                                 " display incomplete commands
set noshowmode                              " Airline plugin shows mode instead
set wildmenu                                " Show completion menu on command line
set wildmode=list:longest                   " Style of completion menu

" Whitespace
set tabstop=2                               " visual width of a tab in columns
set shiftwidth=2                            " indentation step in columns
set softtabstop=2                           " insert this many columns in Insert mode
set expandtab                               " use spaces, not tabs
set backspace=indent,eol,start              " backspace through everything in insert mode
set scrolloff=3                             " keep this many lines in view when scrolling

autocmd FileType javascript,eruby setlocal shiftwidth=4 tabstop=4 softtabstop=4  " different indentation settings depending on file type

" Search
set hlsearch                                " highlight matches
set incsearch                               " incremental searching
set ignorecase                              " searches are case insensitive...
set smartcase                               " ... unless they contain at least one capital letter

" Splits
set splitbelow                              " open new horz split below instead of default above
set splitright                              " open new vert split right instead of default left

" Autosave
au FocusLost * silent! wa                   " Save all buffers on focus lost. Does not apply to new and readonly buffers
set autowriteall                            " Save all buffers on buffer switch

" Tag list
let Tlist_GainFocus_On_ToggleOpen=1         " Focus taglist window on toggle open

" Syntastic config
" let g:syntastic_javascript_checkers = ["eslint"]     " Javascript only
" let g:syntastic_javascript_eslint_exec = 'eslint_d'  " Using eslint daemon

" ========================= General settings =======================


" ========================= Key remappings =======================

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" switch buffers faster
nnoremap <S-Right> :bnext<CR>
nnoremap <S-Left> :bprevious<CR>

" switch off arrow keys to learn Vim way
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle tag list pane
nnoremap <silent> <F6> :TlistToggle<CR>

" Switch off search highlights
nnoremap <F12> :nohl<cr>

" Snippets
imap ;bp binding.pry<esc>
imap ;db debugger;<esc>
map <Leader>er i<%  %><esc>hhi
map <Leader>ere i<%=  %><esc>hhi

" make navigation work on screen lines
nnoremap j gj
nnoremap k gk

" Keep selection after indenting
vnoremap < <gv
vnoremap > >gv

let mapleader = "\<Space>"
nnoremap <tab> %
vnoremap <tab> %

" open .vimrc in a vertical split
nnoremap <leader>rc :tabnew<CR>:e $MYVIMRC<cr>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ========================= Key remappings =======================
