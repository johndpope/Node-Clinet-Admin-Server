'use strict'

/*
 *
 * http请求工具类
 *
 */

// import iview from 'iview';
/*require('es6-promise').polyfill()*/
import axios from 'axios'
import consts from './consts'
import cacheUtils from './cacheUtils'
import utils from './utils'

axios.defaults.timeout = 5000
axios.defaults.hasGlobalSpin = true
axios.defaults.withCredentials=true
// POST传参序列化,增加token
axios.interceptors.request.use((config) => {
	return config
}, (error) => {
	console.log('错误的传参')
	return Promise.reject(error)
})
axios.interceptors.response.use((res) => {
	if(!res.data.Data) {
		res.data.Data = [];
	}
	if(res.data.Data && Object.keys(res.data.Data).indexOf('items') != -1 && res.data.Data.items != null) {
		res.data.Data = res.data.Data['items']
	}
	return res.data
}, (error) => {
	console.log('网络异常' + error)
	return Promise.reject(error)
})
export default axios