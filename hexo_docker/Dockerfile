# *****************************************************************************
# File Name: Dockerfile
# Auther: Chuncheng Wei
# Email: weicc1989@gmail.com
# Created Time: Fri Nov 30 23:08:07 2018
# Description:
#
#     This bases on node:latest image
#
# *****************************************************************************


# 基础镜像
FROM node:10

# 维护者信息
MAINTAINER Chuncheng_Wei <weicc1989@gmail.com>

# 工作目录
WORKDIR /hexo

# 安装Hexo
RUN npm install hexo-cli -g
RUN hexo init .
RUN npm install

# 设置git
RUN git config --global user.name "Chuncheng Wei"
RUN git config --global user.email "weicc1989@gmail.com"

# 挂载volume
VOLUME ["/hexo/source", "/hexo/themes", "/root/.ssh"]

# 映射端口
EXPOSE 4000

# 运行命令
CMD ["/bin/bash"]
