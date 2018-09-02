"""""""""""""""""""""""""""""""""""""""
"          Vundle 
"""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
syntax on
filetype off                  " required

"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/a.vim'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-scripts/taglist.vim'

Plugin 'brookhong/cscope.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'davidhalter/jedi-vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'mileszs/ack.vim'

Plugin 'fatih/vim-go'

Plugin 'KabbAmine/zeavim.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"          Basic setting 
"""""""""""""""""""""""""""""""""""""""

set autoindent " always set autoindenting on 

set tabstop=4 "让一个tab等于4个空格
set softtabstop=4 "输入tab时实际占有的空格数
set shiftwidth=4 "reindent操作（<<和>>）时缩进的空格数
"set expandtab "输入tab时自动将其转化为空格

set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配

"字体的设置
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替哦
set gfw=幼圆:h10:cGB2312

"编码设置
set encoding=utf-8 "vim内部编码格式，设为utf-8有助于提高vim识别文件正确的准确性
set fenc=utf-8 "新建的文件编码默认为utf-8
set fileencodings=utf-8,cp936,ucs-bom "让vim按照utf-8,gbk,utf-8(没有头)的顺序识别文件

"默认以双字节处理特殊字符
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

"不自动设置字节序标记，因为并非所有编辑器都可以识别字节序标记
set nobomb

"显示行数
set number

"令vim使用256色
set t_Co=256

"设置tags选项为当前目录下的tags文件
set tags=tags

"将session文件所在的目录自动设为当前工作目录
set sessionoptions-=curdir
set sessionoptions+=sesdir

"令会话文件能被windows和unix中的vim共同使用
"把文件名中的'\'替换为'/'
set sessionoptions+=slash

"把会话文件的换行符保存成unix格式
set sessionoptions+=unix

"设置配色方案为test
colorscheme test
"colorscheme molokai 
"colorscheme desert

"Set mapleader
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
"            Basic mapping 
""""""""""""""""""""""""""""""""""""""
"Fast reloading of the .vimrc
noremap <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editting of the .vimrc
noremap <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is editted, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"后一个标签页
noremap <silent> <leader>nn :tabn<cr>

"前一个标签页
noremap <silent> <leader>p :tabp<cr>

"查看所有标签页
noremap <silent> <leader>a :tabs<cr>

"关闭其他标签页
noremap <silent> <leader>o :tabo<cr>

"关闭当前的标签页
noremap <silent> <leader>c :tabc<cr>

"建立对指定文件新的标签页
noremap <silent> <leader>ne :tabnew

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"      Ctags
"""""""""""""""""""""""""""""""""
"按Ctrl+<F12>生成当前目录的tags文件
"生成tags文件后，移动光标到某个元素，CTRL+]进行跳转，CTRL+o回退
"noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
noremap <silent> <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"      Tag list 
"""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口，缺省为左侧
"let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

"按<F9>打开/关闭Taglist窗口
noremap <silent> <F9> :TlistToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"     Cscope setting 
"""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set nocsverb
    "add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

noremap <silent> <leader>fa :cs add cscope.out<CR>
noremap <silent> <leader>fk :cs kill -1<CR>
noremap <silent> <leader>fu :cs kill -1<CR>:cs add cscope.out<CR>

noremap <silent> <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap <silent> <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
noremap <silent> <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>

"noremap <C-F11> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py" > cscope.files && cscope -bq<cr>
noremap <silent> <F11> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py" > cscope.files && cscope -bq<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"      Quickfix window
"""""""""""""""""""""""""""""""""
noremap <silent> <leader>cw :botright cw<CR>
noremap <silent> <leader>co :ccl<CR>
noremap <C-n> :cnext<CR>
noremap <C-p> :cprev<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"       BufExplorer
"""""""""""""""""""""""""""""""""
"Enable default key mappings
let g:bufExplorerDisableDefaultKeyMapping = 0

"Do not show default help.
let g:bufExplorerDefaultHelp = 0

"Show relative paths.
let g:bufExplorerShowRelativePath = 1

"Sort by most recently used.
let g:bufExplorerSortBy = 'mru'

"Split left
let g:bufExplorerSplitRight = 0

"Split vertically
"let g:bufExplorerSplitVertical = 1

"Vsplit width
let g:bufExplorerSplitVertSize = 25

"Split below
let g:bufExplorerSplitBelow = 1

"Hsplit width
let g:bufExplorerSplitHorzSize = 10

"按<F8>打开/关闭BufExplorer窗口
noremap <silent> <F8> :BufExplorer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
"          YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe needs to be compiled before work.
"cd ~/.vim/bundle/YouCompleteMe
"./install.sh --clang-completer
"the way to install clang: 
"http://blog.csdn.net/firebird321/article/details/48528569

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_auto_trigger = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_confirm_extra_conf = 0

"turn off YCM"
noremap <silent> <leader>y :let g:ycm_auto_trigger = 0<CR> 
"turn on YCM"
noremap <silent> <leader>Y :let g:ycm_auto_trigger = 1<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"           NERDTree
"""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos='right'

"noremap <C-F10> :NERDTreeToggle<CR>
noremap <silent> <F10> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"           NERD_commenter
"""""""""""""""""""""""""""""""""""""""
let NERDShutUp=1

",cm：多行注释，类似C++的/**/，,cu是取消注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"           ack.vim -> the silver searcher ag
"""""""""""""""""""""""""""""""""""""""
"let g:ackprg = 'ag -S --nocolor --nogroup --column --ignore sitedata --ignore image --ignore "tags"'

let g:ackprg = 'ag --vimgrep --ignore sitedata --ignore image --ignore "tags" --ignore "*.out" --ignore "cscope*"'

noremap <silent> <leader>ag :Ack <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"           zeavim.vim
"""""""""""""""""""""""""""""""""""""""
nmap gzz <Plug>Zeavim
vmap gzz <Plug>ZVVisSelection
nmap <leader>z <Plug>ZVKeyDocset
nmap gZ <Plug>ZVKeyDocset<CR>
nmap gz <Plug>ZVOperator
"let g:zv_keep_focus = 0
"let g:zv_zeal_args = '--style=gtk+'
"let g:zv_file_types = {
"            \   'help'                : 'vim',
"            \   'javascript'          : 'javascript,nodejs',
"            \   'python'              : 'python_3',
"            \   '\v^(G|g)ulpfile\.js' : 'gulp,javascript,nodejs',
"            \ }

"""""""""""""""""""""""""""""""""""""""""""
"        a.vim
".cpp和.h文件快速切换
"（1）:A，直接打开.cpp和.h对应的文件
"（2）:AV，打开.cpp和.h对应的文件，并且分屏
"
"       
"        
"Vim多行缩进技巧
"1.按v进入visual状态，选择多行，用>或<缩进或缩出
"
"2.通常根据语言特征使用自动缩进排版：在命令状态下对当前行用== （连按=两次）,
"或对多行用n==（n是自然数）表示自动缩进从当前行起的下面n行。你可以试试把代码
"缩进任意打乱再用n==排版，相当于一般IDE里的code format。使用gg=G可对整篇代码进行排版。 
"
