const jwt = require("jsonwebtoken")
const consts = require('./consts.js');
var config = require('../config/default.js')
var exception = require('./exception.js')
var utils = require('./utils.js')
const Store = require('../config/Store.js');
const redis = new Store();
/* 校验器 token
路由权限
 */

// 不需要做token验证的请求路由配置在这里
const withoutTokenCheck=['/api/admin_login',"/api/upload"]
const auth = () => {
	return async function(ctx, next) {
		if(!withoutTokenCheck.includes(ctx.url)){
			const SESSIONID = ctx.cookies.get('SESSIONID');
			if (!SESSIONID) {
				throw new exception.erroeException(consts.ERROR_CODE.ACCOUNT_CODE_EXPIRED)
			}
			const redisData = await redis.get(SESSIONID);
			// redisData = { userToken: { name: 'editor', id: 3 } }
			if (!redisData) {
				throw new exception.erroeException(consts.ERROR_CODE.ACCOUNT_CODE_EXPIRED)
			}
			if (redisData && redisData.userToken) {
				console.log("---------------------------------------------")
				console.log(`登录了，userToken为${redisData.userToken.name}`);
				console.log("---------------------------------------------")
			}
		}

		// let errMeg = 'access_token不合法'
		// try {
		// 	if (app_name == 'DOS' && access_token) {
		// 		// access_token = utils.base64decode(access_token)
		// 		var user = jwt.verify(access_token, config.secretKey)
		// 	}
		// } catch (err) {
		// 	if (err.name == 'TokenExpiredError') {
		// 		throw new exception.erroeException(consts.ERROR_CODE.ACCOUNT_CODE_EXPIRED)
		// 	} else {
		// 		//  token 不存在   JsonWebTokenError
		// 		throw new exception.erroeException(consts.ERROR_CODE.NO_ACCESS_TOKEN)
		// 	}
		// }
		/* 解析出后的 用户信息 存入 ctx.auth 共全局使用*/
		// ctx.auth = {
		// 	...user
		// }
		await next()
	}
}



async (ctx,next)=>{
	if(!withoutTokenCheck.includes(ctx.url)){
		const SESSIONID = ctx.cookies.get('SESSIONID');
		if (!SESSIONID) {
			throw new exception.erroeException(consts.ERROR_CODE.ACCOUNT_CODE_EXPIRED)
			return false;
		}
		const redisData = await redis.get(SESSIONID);
		if (!redisData) {
			throw new exception.erroeException(consts.ERROR_CODE.ACCOUNT_CODE_EXPIRED)
			return false;
		}
		if (redisData && redisData.uid) {
			console.log(`登录了，uid为${redisData.uid}`);
		}
	}
	await next()

}


module.exports = auth
