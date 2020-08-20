""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" VIM config file - Jonny Saykosy
" Plugins managed by vimplug: https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on

set encoding=UTF-8
set mouse=a
set nocompatible
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set autoindent              " Indent a new line the same amount as the previous one
set foldmethod=manual		    " Lines folding method
set signcolumn=yes
set splitbelow splitright
set path+=**				        " Searches current directory recursively.
set wildmenu				        " Display all matches when tab complete.
set incsearch
set hlsearch                " Highlight search results
set nobackup
set noswapfile
set number relativenumber
set timeoutlen=1000 ttimeoutlen=0
set colorcolumn=81
set cursorline
set autochdir
" set tags^=.git/tags;~		    " Look for ctags file in .git/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab

set shiftwidth=2
set tabstop=2

" Expandtab option sets 1 tab == 4 spaces
" It is needed for good indentations in Python and vim-indent-guides plugin
set expandtab

" Filetype indent
autocmd FileType c,cpp,asm setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType go,python setlocal shiftwidth=4 tabstop=4

" Cursorline highlighting
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Optionnal Plugins
" Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'                     " Language highlighting pack
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Themes Plugins
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'				          " Airline

" Essential Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto-completion
Plug 'honza/vim-snippets' 						          " Snippets
Plug 'scrooloose/nerdtree'				              " NERDTree
Plug 'kien/ctrlp.vim' 							            " Ctrl+P fuzzy finder
Plug 'pbondoer/vim-42header' 					          " 42 Header
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter' 					        " Git diff indicators
Plug 'jiangmiao/auto-pairs' 					          " Autopairing brackets, parentheses, etc
Plug 'ntpeters/vim-better-whitespace' 			    " Highlight trailing whitespaces in red

Plug 'ryanoasis/vim-devicons' 					        " Filetype icons. Always load this plugin as the very last

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B4252 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3B4252 ctermbg=0
set statusline+=%{gutentags#statusline()}

" settings for vimtex
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
         \ 'build_dir' : 'build',
         \}
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" settings for markdown-preview
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/jonny/.scripts/github-markdown.css'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving between buffers
nnoremap <C-W><C-H> :bprevious<CR>
nnoremap <C-W><C-L> :bnext<CR>
nnoremap <C-W><C-D> :bd<CR>
nnoremap <C-W><C-O> :%bd\|e#\|bd#<CR>

" Moving between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctags search in CtrlP
nnoremap <leader>. :CtrlPTag<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Indent guides toggle
nmap <F5> :IndentGuidesToggle<CR>

" Toggle markdown preview in browser
nmap <F2> <Plug>MarkdownPreviewToggle

" Hit return in normal mode to disable highlighting word
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Enable/disable cursorline
nnoremap <Leader>c :set cursorline!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim general configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme and colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
colorscheme nord

" Same background as terminal
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE

" It is necessary for vim true colors in Tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
silent! call airline#extensions#whitespace#disable()

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

" automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Removes pipes | that act as seperators on splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fillchars+=vert:\ 
