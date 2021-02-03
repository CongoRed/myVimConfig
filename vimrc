syntax on
set number
set cursorline
set showcmd
set wildmenu
set tabstop=2
"隐藏滚动条
set guioptions-=r
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏
set showtabline=0

set nowrap	    "不折行
set hlsearch	"高亮搜索项
set scrolloff=5	"距离底顶5行
set showmatch	"括号匹配
set ignorecase	"忽略大小写
set cindent		"以C方式缩进

map Q :q<CR>
map S :w<CR>
map R :source $MYVIMRC<CR>
map <F3> :TagbarToogle<CR>
map <F2> :NERDTreeMirror<CR>

"快速编译运行
map <F5> :call CompileRunGcc()<CR>

func CompileRunGcc()
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 

"插件管理
call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'connorholyday/vim-snazzy'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/syntastic'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-markdown'
	Plug 'jamshedvesuna/vim-markdown-preview'
call plug#end()

"背景颜色配置
color snazzy

"NERDTree配置
map <F2> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=15
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.git$']


"airline options
let g:airline_powerline_fonts=1
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set ambiwidth=double "防止特殊符号无法正常显示
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled=1 "顶部tab显示"
nmap <tab> :bn<cr> "设置tab键映射"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = '  ¶'
let g:airline_symbols.linenr = ' ⭡ '
let g:airline_left_sep = ' ▶'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = ''
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme = 'angr'
let g:airline#extensions#whitespace#enabled = 0


"Tagbar配置
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=15

"vim-markdown 配置
let g:markdown_minlines = 100

"Syntastic配置
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
"" Use pylint to check python files.
"let g:syntastic_python_checkers = ['pylint']
"map <F5> :SyntasticToggleMode<CR> :SyntasticCheck<CR>
"" Ignore warnings about newlines trailing.
"let g:syntastic_quiet_messages = { 'regex': ['trailing-newlines', 'invalid-name',
    "\'too-many-lines', 'too-many-instance-attributes', 'too-many-public-methods',
    "\'too-many-locals', 'too-many-branches'] }
