noremap <C-J>  <C-W>j
noremap <C-K>    <C-W>k
noremap <C-H>  <C-W>h
noremap <C-L> <C-W>l


" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 定义快捷键的前缀，即<Leader>，默认为"\"
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的文件类型加载对应的插件
filetype plugin on

" 配色方案
" set background=light
set t_Co=256
colorscheme molokai
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 显示行号
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
 
"-------------------------------------------折叠----------------------
" 基于缩进或语法进行代码折叠
set foldenable              " 开始折叠
set foldmethod=indent       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=0             " 设置折叠层数为
set foldlevelstart=1        " 打开文件是默认折叠代码的层数,1时仅主干不折叠;



" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'gmarik/Vundle.vim' 
Plugin 'universal-ctags/ctags'
Plugin 'vim-scripts/winmanager'
Plugin 'taglist.vim'
Plugin 'vim-scripts/vimprj'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'kshenoy/vim-signature' 
Plugin 'ruben2020/codequery'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/echofunc'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'derekwyatt/vim-fswitch'
cal  vundle#end()
filetype plugin indent on

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"=====================================================================插件=============================================================
"-------------------------------------------tab 操作----------------------
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


"-------------------------------------------Echofunc (echofunc.vim)----------------------
"let g:EchoFuncKeyNext='<S-n>'
"let g:EchoFuncKeyPrev='<S-p>'
let g:EchoFuncAutoStartBalloonDeclaration = 1"


"-------------------------------------------nerdcommenter----------------------
"<leader>cc  "加注释 cu 去掉注释
"<leader>cu
"
"<leader>c<space>    "加上/解开注释, 智能判断
"<leader>cy          "先复制, 再注解(p可以进行黏贴)


"-------------------------------------------tagbar----------------------
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
"-------------------------------------------tagbar----------------------
" 设置显示／隐藏标签列表子窗口的快捷键。速记：symbol list
nnoremap <Leader>sl :TagbarToggle<CR> 

" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_right=1 

" 设置标签子窗口的宽度 
let tagbar_width=20
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>"
"-------------------------------------------nerdtree.vim----------------------
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=30
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
"是否显示行号"
let NERDTreeShowLineNumbers=1
"是否显示书签"
let NERDTreeShowBookmarks=1 
"打开文件后, 关闭NERDTrre窗口"
"let NERDTreeQuitOnOpen=1
"高亮NERDTrre窗口的当前行"
let NERDTreeHighlightCursorline=1

" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"-------------------------------------------MiniBufExplorer----------------------
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
noremap <Leader>bn :MBEbn<CR>
noremap <Leader>bp :MBEbp<CR>
noremap <Leader>bd :MBEbd<CR>

let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchWindows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2"


"-------------------------------------------winManager----------------------
"let g:winManagerWindowLayout="FileExplorer|TagList"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:NERDTree_title="[NERDTree]"

map <Leader>wl :WMToggle<CR>

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
    return 1  
endfunction

"自动开启,可以选择开启vim即启用winmanaer，那么将需要将vimmanager.vim中的AutoOpenWinManger的注释取消。  
let g:AutoOpenWinManager = 1

"自动退出Winmanager
autocmd bufenter * if (winnr("$") == 2 &&exists("b:NERDTreeType")&&b:NERDTreeType == "primary")  | qa | endif


" Note 除了要设置上述操作外，还需要在plugin/winmanager.vim
" 文件的最后中添加下述
" "自动打开Winmanager
" if g:AutoOpenWinManager
"     autocmd VimEnter *  nested  call  s:StartWindowsManager()|q|3wincmd w "此处的3还是4或者其它数字，需要用户自己去计算下;
" endif
 
"-------------------------------------------taglist.vim---------------------->>
noremap <F8> :!ctags -R --langmap=c++:+.mm  --c++-kinds=+p --fields=+iaS --extra=+q  <CR>
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Window =1            "在左侧窗口中显示taglist窗口
let Tlist_Auto_Open=1

let Tlist_Show_Menu=1                   "显示taglist菜单


nmap fj g]
nmap ff <C-T>

noremap <F11> :TlistToggle<CR>

let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Use_Right_Window = 1

"-------------------------------------------YouCompleteMe.vim----------------------
" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1

"解决YCM core library compiled for Python 2 but loaded in Python 3. Set the
"'g:ycm_server_python_interpreter' option to a Python 2 interpreter path
let g:ycm_path_to_python_interpreter='/usr/bin/python'

" 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
set tags=tags
set tags+=./tags " 表示在当前工作目录下搜索tags文件
set tags+=~/.vim/stdcpp.tags
set tags+=~/.vim/sys_tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap gd :YcmCompleter GoTo<CR>

"-------------------------------------------cscope----------------------
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

" The following maps all invoke one of the following cscope search types:
 "
 "   's'   symbol: find all references to the token under cursor
 "   'g'   global: find global definition(s) of the token under cursor
 "   'c'   calls:  find all calls to the function name under cursor
 "   't'   text:   find all instances of the text under cursor
 "   'e'   egrep:  egrep search for the word under cursor
 "   'f'   file:   open the filename under cursor
 "   'i'   includes: find files that include the filename under cursor
 "   'd'   called: find functions that function under cursor calls
 "
 " Below are three sets of the maps: one set that just jumps to your
 " search result, one that splits the existing vim window horizontally and
 " diplays your search result in the new window, and one that does the same
 " thing, but does a vertical split instead (vim 6 only).
 "
 " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
 " unlikely that you need their default mappings (CTRL-\'s default use is
 " as part of CTRL-\ CTRL-N typemap, which basically just does the same
 " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
 " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
 " of these maps to use other keys.  One likely candidate is 'CTRL-_'
 " (which also maps to CTRL-/, which is easier to type).  By default it is
 " used to switch between Hebrew and English keyboard mode.
 "
 " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
 " that searches over '#include <time.h>" return only references to
 " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
 " files that contain 'time.h' as part of their name).


" To do the first type of search, hit 'CTRL-\', followed by one of the
"cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
" Note: *****************************
" nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" VIM中操作时，按下 CTRL+\+g, 是没作用。实际是先按ctrl不放，按\键，同时放开，快速按g键！
 
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>    


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>    

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>   
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>   
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>   
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>   
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>   
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>   
nmap <C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>   


" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>   
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"调整窗口大小
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>



"-------------------------------------------vim-indent-guides----------------------
" 随 vim 自启动
 let g:indent_guides_enable_on_vim_startup=1
 " 从第二层开始可视化显示缩进
 let g:indent_guides_start_level=2
 " 色块宽度
 let g:indent_guides_guide_size=1
 " 快捷键 i 开/关缩进可视化
 :nmap <silent> <Leader>i <Plug>IndentGuidesToggle"
