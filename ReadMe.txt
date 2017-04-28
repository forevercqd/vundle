1.  Install following the steps:
    1). git clone https://github.com/forevercqd/vundle.git ~/vundle
    2). sudo cp  ~/vundle/*  ~/
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


基本快捷键：
    0)  9. 常用快捷键
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
	    w= : 垂直方向减小窗口 
	    w- : 垂直方向增加窗口 
	    w, : 水平方向减小窗口
	    w. : 水平方向减小窗口     
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
    9).3.1 多行注释
        多行注释按键操作：
        注释：Ctrl-v 进入列编辑模式，向下或向上移动光标，把需要注释的行的开头标记起来，然后按大写的I，再插入注释符比如"#"，按Esc，就会全部注释了。
        删除：Ctrl-v 进入列编辑模式，向下或向上移动光标，选中注释部分，按d，就会删除注释符号。

        多行注释使用替换命令：
        :%s/^/\/\//g来在全部内容的行首添加//号注释
         :2,50s/^/\/\//g在2~50行首添加//号注释
        反过来替换既是删除操作。
        " 
k
