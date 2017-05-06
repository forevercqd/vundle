1.  Install following the steps:
    1). git clone https://github.com/forevercqd/vundle.git ~/vundle
    2). sudo cp  ~/vundle/.vim*  ~/
    3)  git clone   https://github.com/gmarik/Vundle.vim.git    ~/.vim/bundle/Vundle.vim
        note: git may failed, so execute "sudo rm -rf ~/.vim/bundle/Vundle.vim" 
    4). :vim    // 启动 vim; 
    5). 启动vim 后, 再执行 ":PluginInstall" 即可安装相应插件;
 
    经测试： mac 与 ubuntu 上均可正常运行
 
2. 安装过程中可能出现以下问题:
    1).  PluginInstall 时报错，按"l"后，显示有如下错误:
        [2017-04-09 17:40:21] $ git clone --recursive 'https://github.com/vim-scripts/taglist.vim.git' '/Users/fengyifei/.vim/bundle/taglist.vim'                                        |  1
        [2017-04-09 17:40:21] > fatal: could not create work tree dir '/Users/fengyifei/.vim/bundle/taglist.vim': Permission denied
        此时退出vim， 然后执行 sudo vim，重新再来一遍 PluginInstall；
    
    2). ：vim 时出现 以下错误：
        Error detected while processing function youcompleteme#Enable[10]..<SNR>61_SetUpPython:  line   13:
    
        解决办法：
        cd ~/.vim/bundle/YouCompleteMe
        git submodule update --init --recursive
        ./install.sh
    
    3). /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ctags: illegal option -- R                                                                                                                                                 
        usage: ctags [-BFadtuwvx] [-f tagsfile] file ...
    
        解决办法：brew install ctags-exuberant
    
    4).  无法跳转至tags 时，注意在.vimrc 中添加 
        set tags+=./tags " 表示在当前工作目录下搜索tags文件;
    
    5).  在vim中打开编辑文件命令：   
        :e! ~/.vimrc " 

    6). winManager 自动打开问题
        6.1) ~/.vimrc 中添加:
            "自动开启,可以选择开启vim即启用winmanaer，那么将需要将vimmanager.vim中的AutoOpenWinManger的注释取消。
            let g:AutoOpenWinManager = 1  "

        6.2) " Note 除了要设置上述操作外，还需要在plugin/winmanager.vim 文件的最后中添加下述
            "自动打开Winmanager
            if g:AutoOpenWinManager
                autocmd VimEnter *  nested  call s:StartWindowsManager()|q|3wincmd w // 此处的3还是4或者其它数字，需要用户自己去计算下;
            endif
            
            "自动退出Winmanager
            autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary")  | qa | endif
    7). 安装过程中出现"core library compiled for Python 2 but loaded in Python 3. Set the 'g:ycm_server_python_interpreter' option to a Python 2 interpreter path"
        解决办法是.vimrc里声明一句:
        let g:ycm_path_to_python_interpreter='/usr/bin/python'
    8). Taglist: Failed to generate tags 错误出现时：
        重新安装 ctags;
        taglist插件只支持exuberant ctags tool，不支持GNU ctags或UNIX ctags，Mac或Ubuntu下自带的并不是exuberant ctags，所以执行TlistToggle vim报错，解决方案如下：
        ubuntu 下安装:
               8.1) sudo apt-get install exuberant-ctags
               8.2) .vimrc 添加 let Tlist_Ctags_Cmd = ‘/usr/bin/ctags 


基本快捷键：
    0)  常用快捷键
        :n1,n2 co n3    : 将n1行到n2行之间的内容拷贝到第n3行下
        :n1,n2 m n3     :将n1行到n2行之间的内容移至到第n3行下
        :n1,n2 d        : 将 n1行到n2行之间的内容删除
        :n1,n2 w!command: 将文件中n1行至n2行的内容作为command的输入并执行之，
        %   跳转到配对的括号去
        [[  跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
        gD  跳转到局部变量的定义处
        ''  跳转到光标上次停靠的地方, 是两个', 而不是一个"
        mx  设置书签,x只能是a-z的26个字母
        `x  跳转到书签处("`"是1左边的键)
        >   增加缩进,"x>"表示增加以下x行的缩进
        <   减少缩进,"x<"表示减少以下x行的缩进"`")`
        "}')]]
    1） 调整窗口大小,常规模式下：
	    w= : 减小窗口高度 
	    w- : 增加窗口高度
	    w, : 减小窗口宽度
	    w. : 减小窗口宽度     
	    Ctrl+w = : 让所有屏幕一样宽度
    2) tab 间相互切换 
        ;1 : 切换至第1个tab
        ;2 : 切换至第2个tab
        ;3 : 切换至第3个tab
    3) 新建tab.
       Ctrl+t
    4) 缩进
        shift + > + >  : 向右缩进(注意Shift 不要松);
        shift + < + <  : 向右缩进;
    5) cscope 查找结果
       escope 快捷键:
       nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
       注意按下 CTRL+\+g 就是没作用。其实是先按ctrl不放，按\键，同时放开，快速按g键！
            
        1）使用下面的命令直接进入main函数定义的地方，如果有多个的话，输入索引号，回车。
                mishuang@msh:~/linux/linux0.11/source-0.11> vi -t main
        2）将光标停留在一个函数或变量上，"ctrl+]"，将直接跳转到定义该函数的地方。
        3）将光标停留在一个函数或变量上，"ctrl+＼"再输入s，这样就会出现所有调用、定义该函数的地方，输入索引号，回车即可。
        4）将光标停留在一个函数或变量上，再输入s，这样就会出现所有调用、定义该函数的地方，输入索引号，回车后会以水平方式在另外一个窗口显示。
        5）将光标停留在一个函数或变量上，再输入s，这样就会出现所有调用、定义该函数的地方，输入索引号，回车后会以垂直方式在另外一个窗口显示。
        6）ctrl+t回到原来跳转前的地方，连续按两下’’可以再回去。
    6). cpp 与 .h 间切换 
        " *.cpp 和 *.h 间切换
        nmap <silent> <Leader>sw :FSHere<cr>
    7). 正向反向跳转标签:    
        " 正向遍历同名标签
        nmap <Leader>tn :tnext<CR>
        " 反向遍历同名标签
        nmap <Leader>tp :tprevious<CR>
        
    8) 标签入栈:
        vim 中有个叫标签栈（tags stack）的机制，:tnext、:tprevious 只能遍历已经压入标签栈内的标签，
        所以在遍历前需要通过快捷键 ctrl‐] 将光标所在单词匹配的所有标签压入标签栈中，然后才能遍历。
        具体步骤为:
            先查找某符号,在让你选择标号前，先按 “ ctrl‐]”将光标所在单词匹配的所有标签压入标签栈中;
    9).多行注释
        多行注释按键操作：
        注释：Ctrl-v 进入列编辑模式，向下或向上移动光标，把需要注释的行的开头标记起来，然后按大写的I，再插入注释符比如"#"，按Esc，就会全部注释了。
        删除：Ctrl-v 进入列编辑模式，向下或向上移动光标，选中注释部分，按d，就会删除注释符号。

        多行注释使用替换命令：
        :%s/^/\/\//g来在全部内容的行首添加//号注释
         :2,50s/^/\/\//g在2~50行首添加//号注释
        反过来替换既是删除操作。
    10).代码折叠:
        折叠当前代码： zc
        递归折叠代码： zC
        取消代码折叠： zo
        递归取消折叠代码:  zO
        折叠文件中的所有代码：  zM
        取消文件中所有代码的折叠：  zR
    11) MiniBufExplorer :
        打开或关闭MiniBufExplorer: <Leader>bl
        打开当前buffer的下一个buffer  :bn 或者<Leader>bn
        打开当前buffer的前一个buffer  :bp 或者<Leader>bn
        关闭某一个buffer  :bd 或者<Leader>bd
        跳转至某编号的buffer    ：bM    // 此处的M表示对应的buffer的编号; 
        展示全部的打开文档      :ls  
    12) 查找:
        查找并高亮当前光标下单词:shfit(左边)+#
    13) 分屏快捷键:
        ctrl+w s   对当前文档内容上下分屏显示
        ctrl+w v   对当前文档内容左右下分屏显示
        ctrl+w q   关闭所处分屏
    14) winmanager 
         map <Leader>wl :WMToggle<CR>  // 使用 ;wl 打开右侧的 NERDTree | Tlist 窗口;
    15) ctags 用法:
        1). 在待生成 tags 的目录下新建 cscope.sh,注意 // 假如要.xxx 类型的文件也生成对应的 tags, 则在 find 参数中添加 -o  -name "*.xxx";
            cscope.sh 内容如下:
            sudo find ./ -name "*.h" -o -name "*.cpp" -o -name "*.c" -o  -name "*.mm"  -o  -name "*.java"> cscope.files
            cscope -Rbq
        2). 查找方法:
            比如查找 Render2Screen 函数出现的所有地方,首先将光标移至 Render2Screen 处,然后执行发如下操作: 先按ctrl不放，按\键，同时放开，快速按s键;
        3). cscopequickfix 
            如果自动跳转的位置你不满意, 想看其他的结果, 可以用下面的命令打开QuickFix窗口: 
            :cw     // 将打开查找的列表,用户可自行跳转到想要的结果中;
        4). quickfix 窗口中各结果间切换:
            跳至下一查找结果:   同时按下 Ctrl+n
            跳至上一查找结果:   同时按下 Ctrl+p
    16). echofunc 用法:
        在输入完成函数的左括号，或者在输入函数参数的过程中，可以通过通过按SHIFT+N或者SHIFT+P来提示函数参数。提示信息会在下边状态栏显示该函数的输入参数；
        Note: 只有在输入过程中按 Shift + p 或 Shfit + n 才有效;
    17). nerdcommenter 用法:
        <leader>cc           "加注释
        <leader>cu           "去掉注释

        <leader>c<space>    "加上/解开注释, 智能判断
        <leader>cy          "先复制, 再注解(p可以进行黏贴)

