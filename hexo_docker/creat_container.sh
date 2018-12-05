#!/bin/bash
# *****************************************************************************
# File Name: creat_container.sh
# Author: Chuncheng Wei
# Mail: weicc1989@gmail.com
# Created Time : Wed Dec  5 10:27:59 2018
# Last Modified: Wed Dec  5 10:34:32 2018
# *****************************************************************************

docker run -it --name="blog_matery" \
  -p 4000:4000 \
  -v $HOME/.ssh:/root/.ssh \
  -v $PWD/../.deploy_git:/hexo/.deploy_git \
  -v $PWD/../scaffolds:/hexo/scaffolds \
  -v $PWD/../source:/hexo/source \
  -v $PWD/../themes:/hexo/themes \
  -v $PWD/../_config.yml:/hexo/_config.yml \
  blog:matery \
  /bin/bash
