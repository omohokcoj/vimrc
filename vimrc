call plug#begin()

" Good looking bottom :)
Plug 'vim-airline/vim-airline'
" Themes
Plug 'vim-airline/vim-airline-themes'
" Lucius theme
Plug 'jonathanfilip/vim-lucius'
" Commenting and uncommenting stuff
Plug 'tomtom/tcomment_vim'
" Easy motion for easy motion
Plug 'Lokaltog/vim-easymotion'
" Automatically save changes to disk
Plug '907th/vim-auto-save'
" Silver searcher
Plug 'rking/ag.vim'
" Line movings
Plug 't9md/vim-textmanip'
" Git diff
Plug 'airblade/vim-gitgutter'
" Git commands
Plug 'tpope/vim-fugitive'
" Github
Plug 'tpope/vim-rhubarb'
" History
Plug 'sjl/gundo.vim'
" Stedier moving
Plug 'chaoren/vim-wordmotion'
" Tabulations
Plug 'godlygeek/tabular'
" Repeater required by Easyclip
Plug 'tpope/vim-repeat'
" Better clipboard
Plug 'svermeulen/vim-easyclip'
" Copy path
Plug 'omohokcoj/copypath.vim'
" Trailing whitespace highlight
Plug 'bronson/vim-trailing-whitespace'
" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Send command to tmux
Plug 'jgdavey/tslime.vim'
" Restore cursor position
Plug 'farmergreg/vim-lastplace'
" Netrw improved
Plug 'tpope/vim-vinegar'
" Languageserver client
Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax highlight
Plug 'slim-template/vim-slim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'thoughtbot/vim-rspec'

call plug#end()

colorscheme lucius
let g:airline_theme='lucius'
let g:lucius_style = 'dark'
let g:lucius_no_term_bg = 1

set clipboard=unnamed,unnamedplus

filetype plugin indent on " Enable filetype-specific indenting and plugins
syntax on                 " Enable syntax highlighting
syntax enable             " Syntax highlighting and theme

" autoindent with two spaces, always expand tabs
set ai sw=2 sts=2 et

" speed
set lazyredraw
set synmaxcol=256

" Lovely linenumbers
set number

" Searching
set incsearch
set ignorecase
set smartcase

" Autocomplete
set pumheight=20

" To display the status line always
set laststatus=2

" https://github.com/neoclide/coc.nvim#example-vim-configuration
" <TAB>: completion.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" send to tmux panel
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

map <silent><leader>] :History<cr>
nnoremap <silent> <C-p> :FZF<CR>

autocmd BufWritePost * GitGutter
nnoremap <Leader>c :GitGutterUndoHunk<cr>
nnoremap <Leader>p :GitGutterPreviewHunk<cr>

let g:vue_disable_pre_processors = 1
autocmd FileType vue syntax sync fromstart

let g:airline_powerline_fonts=1

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Sane ag command
let g:ag_prg='ag --nocolor --nogroup --column'
" Do not show mapping message
let g:ag_mapping_message = 0

" Move line with Ctrl
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" easy-motion keys
" nmap . <Plug>(easymotion-s2)
nmap , <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

set tags=./tags; " Set tags directory

" BACKUP / TMP FILES
set backupdir^=~/.vim/backup/
set backup

" Save your swp files to a less annoying place than the current directory.
set directory=~/.vim/swap/

" undofile - This allows you to use undos after exiting and restarting
set undodir=~/.vim/undo/
set undofile

" Disable sound
set noerrorbells visualbell t_vb=

if has('nvim')
  set viminfo+=n~/.config/nvim/viminfo
else
  set viminfo+=n~/.vim/viminfo
endif

" remove search heightlight on esc
nnoremap <silent><esc><esc> :noh<return>

" fzf panel size
let g:fzf_layout = { 'down': '~30%' }

" netrw settings
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_localrmdir='rm -rf'

" rspec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>r :call RunNearestSpec()<CR>

" netrw mapping
autocmd FileType netrw nmap <buffer> h -
autocmd FileType netrw nmap <buffer> l <cr>
autocmd FileType netrw nnoremap <silent><buffer> <c-l> :TmuxNavigateRight<cr>

" Open nertw on vim load
autocmd VimEnter * if !argc() | Explore | endif

highlight DiffAdded ctermfg=2 ctermbg=238
highlight DiffRemoved ctermfg=1 ctermbg=238
highlight GitGutterAdd ctermfg=2 ctermbg=238
highlight GitGutterChange ctermfg=3 ctermbg=238
highlight GitGutterDelete ctermfg=1 ctermbg=238
highlight CocFloating ctermfg=253 ctermbg=238
highlight CocErrorSign ctermfg=Red ctermbg=238
highlight CocWarningSign ctermfg=Brown ctermbg=238
highlight CocInfoSign ctermfg=Yellow ctermbg=238
highlight CocHintSign ctermfg=Blue ctermbg=238
