const exception = require("./exception");
const consts = require('./consts.js');
const errorMessag = require('./errorMessag.js');
const logs = require('../config/logConf.js')
const LogFile = logs.logFile("extend_mssage");

/**
 * 处理success
 *
 * ```js const extend = require('./extend.js');
 * extend.success({ msg:"hello from lin!" })
 * ```
 *
 * ```js
 * return {errorCode: 10000,Data:{msg:"hello from lin!"}})
 * ```
 *
 * @param app app实例
 */
const success = (data) => {
	let res = {
		code: consts.ERROR_CODE.SUCCESS,
		message: '服务调用成功',
		Data: data
	}
	LogFile.info(JSON.stringify(res))
	return res
}

const resultData = (code, data, mes) => {
	var result = errorMessag(code)
	let res = {
		code: result.code || code,
		message: mes || result.message
	}
	if (data) res.Data = data
	LogFile.info(JSON.stringify(res))
	return res
}
module.exports = {
	success,
	resultData
}
