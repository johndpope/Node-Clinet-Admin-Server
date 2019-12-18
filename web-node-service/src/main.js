const Koa = require('koa');
const koaBody = require('koa-body')
const cors = require('koa2-cors');
// const session = require('koa-session-minimal');
// const MysqlStore = require('koa-mysql-session');
const session = require("koa-session2");
const koaStatic = require('koa-static')
const path = require('path')
const config = require('./config/default.js');
const Store = require('./config/Store.js');
const routers = require('./router.js');
const logs = require('./config/logConf.js')
const {catchHead,catchError} = require('./utils/exception.js')
const auth = require('./utils/auth.js')
const app = new Koa()
const redis = new Store();

// 配置session中间件********************

app.use(session({
	store: new Store(),
	key: "SESSIONID",  // default "koa:sess"
	maxAge:24*60*60*1000
  }));

// 处理跨域问题*********************************
// cookie  写不进去是因为跨域没解决一下配置满足需求 需要在客户端配置一下信息
//axios  需要配置这个其他有不同 axios.defaults.withCredentials=true
app.use(
	cors({
		origin: (ctx) => {
			const origin = ctx.headers.origin  // 实际生产请根据具体情况来进行规则配置
			return origin
		},
        maxAge: 5, //指定本次预检请求的有效期，单位为秒。
        credentials: true, //是否允许发送Cookie
        // allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], //设置所允许的HTTP请求方法
        // allowHeaders: ['Content-Type', 'Authorization', 'Accept'], //设置服务器支持的所有头信息字段
        // exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'] //设置获取其他自定义字段
    })
)

// koa-body 中间插件 文件提交及form-data**************************

app.use(koaBody({
	formLimit: '1mb',
	multipart: true, // 允许上传多个文件
	formidable: {
		maxFileSize: config.upload.MAXFILESIZE,  //上传文件大小
		keepExtensions: true, 					 //  保存图片的扩展名
	}
}))

// 配置静态资源加载中间件*******************************************************************

app.use(koaStatic(
	path.join(config.upload.UPLOAD)
))

 // 全局异常监听中间件*****************************************************************************************

app.use(catchError())

//请求信息中间件*******************************************************************************************************************

app.use(catchHead()) 

//权限校验中间件********************************************************************************************************************************

// token权限验证
app.use(auth()) 

//  路由**********************************************************************************************************************************************************

app.use(routers()) 

app.listen(config.port)

console.log(`listening on port ${config.port}`)
