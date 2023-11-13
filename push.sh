##!/bin/sh
#本脚本请在git bash中运行
# 作者：Huanhao
# 在终端输入 ./push.sh 即可打开脚本
# 博客：https://laijiahao.cn/


echo -e "\033[32m正在为你备份博客中.........\033[0m"
git add .
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git commit -m "update"
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git push origin master --force
if [ $? -ne 0 ]; then
    echo -e "\033[31m 备份失败！请检查网络情况！ \033[0m"
else
    echo -e "\033[32m恭喜你！已为你备份到你的GitHub仓库 backup \033[0m"
fi
