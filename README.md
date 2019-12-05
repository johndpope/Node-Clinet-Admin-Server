

# koa+mysql+vue+iview 前后端分离blog项目
> 作为前端开发者一直想应用开发出属于自己的应用程序，受制于后端的限制，使用nodejs 环境开发后端作为服务。

> 首先选择数据库Mysql ,它相对于MongoDB 更有学习价值虽然 MongoDB很优秀，Mysql也会和公司的数据库无缝结合。 koa为服务端使用sequelize 很好的异步处理mysql事物处理，koa-body上传文件、koa-cors api多类型传世跨域， sequelize-auto 可为sequelize生成实体类更高效使用。validator 参数校验器自动返回 JSON message和key

> vue+iview（SPA）单页面为客户端和服务端

### 依赖
```
node -v 8.4.0
npm -v 5.3.0
npm2 -v 3.5.1
```

### 目录结构

```
.
├─blog.client                   //客户端
├─blog.manage                   //管理端
├─blog.service                  //服务端    
└─skd.sql                       //博客表
```

### 安装

使用 npm:

```
 git https://github.com/GTV9527/Node-Clinet-Admin-Server.git
    npm install
    npm run dev
    npm run build
    npm run pm2 //blog.service  服务运行
```
### Docs
