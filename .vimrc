

call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'puremourning/vimspector'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()


" keybinds
inoremap <C-e> <C-o>A

inoremap <C-b> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-f> <C-o>l






syntax enable
colorscheme monokai

set ai!
set showmatch
set tabstop=4
set autoindent
set cindent
set smartindent
set shiftwidth=4
set nu!
set mouse=a
set ignorecase
set nocompatible
set clipboard+=unnamed
set encoding=utf-8
set hlsearch
set incsearch
set rnu

"fix monokai scrolling issue
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen."
	set t_ut=
endif

" coc.nvim
set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.

map <C-n> :NERDTreeToggle<CR>


" asynctasks config
let g:asyncrun_open = 6







" tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '~/.globalrc'

" gutentags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
