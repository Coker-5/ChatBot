# chatbot

#### 介绍
一个基于chatgpt和elastic search的Mongolian National University of Education Tool Text To Speech蒙古大学心理咨询机器人，采用flask作为后端开发框架，使用chatgpt api+Mysql+elastic search作为回复内容的来源。



使用说明：
1.安装flask,waitress(wsgi服务器),elasticsearch,pymysql,langdetect等第三方库
2.导入mysql数据库和es数据库。
3.运行server.py

界面介绍：
![主界面，输入中文调用gpt api进行回复，输入蒙古语调用mysql和es数据库回复](https://foruda.gitee.com/images/1719221104332129179/5d7cfc89_10193695.png "屏幕截图")

![转换界面，可以实现蒙古语语音与汉语的互相转换](https://foruda.gitee.com/images/1719221239052362273/ef0d7a02_10193695.png "屏幕截图")