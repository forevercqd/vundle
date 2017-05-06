sudo find ./ -name "*.h" -o -name "*.cpp" -o -name "*.c" -o  -name "*.mm"  -o  -name "*.java"> cscope.files
cscope -Rbq
