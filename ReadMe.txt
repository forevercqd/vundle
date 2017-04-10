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
