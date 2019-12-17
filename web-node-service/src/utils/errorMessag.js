'use strict'
const lodash = require("lodash");
/*!
 * errorMessag.js v1.0.0
 * Author:
 * Date:
 * 使用方法：
*  const require('ustils/errorMessag.js')
*  errorMessag(code)
 */

const codeMessag = [{
		code: 10000,
		message: '服务器调用成功',
	},
	{
		code: 20000,
		message: '未知错误',
	}, {
		code: 20001,
		message: ' 必填参数为空',
	},{
		code: 20002,
		message: 'headers appname 必填不能为空',
	},
	{
		code: 20003,
		message: ' 请求参数数值超出业务范围',
	},
	{
		code: 20004,
		message: '签名错误',
	},{
		code: 20006,
		message: '参数类型错误',
	},
	{
		code: 20005,
		message: ' 404服务不存在',
	},
	{
		code: 20007,
		message: '参数格式错误',
	},
	{
		code: 20008,
		message: '服务出现了点问题，稍后重试',
	},
	{
		code: 20009,
		message: '传入的JSON数据格式错误',
	},
	{
		code: 20010,
		message: '参数数据超过允许长度',
	},
	{
		code: 20011,
		message: '数据已存在请勿重复提交',
	},
	{
		code: 61003,
		message: 'access_token不存在',
	},
	{
		code: 61004,
		message: 'security_id不存在',
	},
	{
		code: 61005,
		message: '手机号已被使用',
	},
	{
		code: 61006,
		message: '发送短信验证码成功',
	},
	{
		code: 61007,
		message: '发送短信验证码失败',
	},
	{
		code: 61011,
		message: 'instance_id和security_id不匹配',
	},
	{
		code: 61012,
		message: ' instance_id和access_token不匹配',
	},
	{
		code: 61013,
		message: '短信验证码不正确或已过期',
	},
	{
		code: 61014,
		message: '短信验证码，内部错误',
	},
	{
		code: 61015,
		message: '程序序列错误',
	},
	{
		code: 61016,
		message: '图形验证码错误',
	},
	{
		code: 61017,
		message: '短信验证码错误',
	},
	{
		code: 61018,
		message: '无权访问',
	},
	{
		code: 61019,
		message: '对象不存在',
	},
	{
		code: 61020,
		message: '用户名或密码错误',
	},
	{
		code: 61024,
		message: ' 账号已注销',
	},
	{
		code: 61025,
		message: 'access_token已过期',
	}
];

const errorMessag = code => {
	var result = lodash.filter(codeMessag, {
		code: code || 20008
	});
	return result[0]
}
module.exports = errorMessag
