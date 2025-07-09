# Day 2: Hardware Configuration

一、摄像头初始化配置
    1.下载TP-Link手机端、客户端
        在此网站进行下载客户端zip
        https://resource.tp-link.com.cn/pc/docCenter/showDoc?怎么id=1705542393373570

    下载完成后解压到D盘，解压后并安装
        C:\Users\26559\gitbooktest\assets\images\README.md
        c:\Users\26559\Documents\WeChat Files\wxid_z63cu97n58m522\FileStorage\Temp\8a55ee05f4b7aea89995a196b53ca5b.png

    如果有要更新的要求，就让他更新

    完成以上步骤后，进行注册/登录，后扫描摄像机上的二维码进行设备添加
   

   打开客户端获取IP地址：主页->设备管理->设备维护->IP地址为***.***.**.***
   


    2.下载VLC media player
    进入https://www.videolan.org/vlc/index.zh_CN.html网站进行下载、安装。

    安装后打开，点击左上角"媒体"->"打开捕获设备"->"网络"，输入网络URL：

    rtsp://username:password@ip:port/stream1

        其中username：用户名，如admin；
        password：密码，如123456；
        ip：设备IP，如192.168.1.60；
        port：RTSP端口，默认为554，若为默认可不填；
        stream：码流类型，主码流为stream1，子码流为stream2。

        然后就能看到摄像机所捕获到的画面了。

二、RTSP 配置
    保持Windows和摄像头连接在同一个WIFI中
    在浏览器中输入我们前面所找到的摄像头的IP地址

    可以让Amazon Q 帮你进行RTSP配置，不过需要你告诉他摄像头IP、进入摄像头IP的密码。
