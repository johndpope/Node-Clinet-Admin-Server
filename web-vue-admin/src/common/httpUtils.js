'use strict'

import axios from 'axios'
import consts from './consts'
import cacheUtils from './cacheUtils'
import utils from './utils'
axios.defaults.timeout = 5000
axios.defaults.hasGlobalSpin = true
axios.defaults.withCredentials=true
axios.defaults.headers.post[consts.CONTENT_TYPE] = consts.CONTENT_TYPE_VALUE

// POST传参序列化,增加token
axios.interceptors.request.use((config) => {
	if(!cacheUtils.localStorage(consts.INSTANCE_ID).get(consts.INSTANCE_ID)) {
		cacheUtils.localStorage(consts.INSTANCE_ID).set(consts.INSTANCE_ID, utils.uuidV4().replace(new RegExp(/(-)/g), ''))
	}
	config.headers[consts.INSTANCE_ID] = cacheUtils.localStorage(consts.INSTANCE_ID).get(consts.INSTANCE_ID)
	config.headers[consts.ACCESSTOKEN] = cacheUtils.sessionStorage(consts.ACCESSTOKEN).get(consts.ACCESSTOKEN) || ''
	config.headers[consts.APP_NAME] = consts.APP_NAME_VALUE;
	
	  
	//	console.log('请求参数:' + JSON.stringify(config))
	// 加载loading动画
	//		iview.LoadingBar.start();
	/*if(config.hasGlobalSpin === true) {
		document.querySelector('#global-spin').style.display = 'block'
	}*/
	return config
}, (error) => {
	console.log('错误的传参')
	//	iview.LoadingBar.error();
	/*document.querySelector('#global-spin').style.display = 'none'*/
	return Promise.reject(error)
})
axios.interceptors.response.use((res) => {
	if(res.headers[consts.ACCESSTOKEN]) {
		let loadToken = cacheUtils.sessionStorage(consts.ACCESSTOKEN).get(consts.ACCESSTOKEN);
		if(loadToken != res.headers[consts.ACCESSTOKEN]) {
			cacheUtils.sessionStorage(consts.ACCESSTOKEN).set(consts.ACCESSTOKEN, res.headers[consts.ACCESSTOKEN]);
		}
	}
	//	console.log('请求结果:' + JSON.stringify(res.data))
	//	iview.LoadingBar.finish();
	if(!res.data.Data) {
		res.data.Data = [];
	}
	if(res.data.Data && Object.keys(res.data.Data).indexOf('items') != -1 && res.data.Data.items != null) {
		res.data.Data = res.data.Data['items']
	}
	/*setTimeout(function(){
		document.querySelector('#global-spin').style.display = 'none'
	},300);*/
	return res.data || res
}, (error) => {
	console.log('网络异常' + error)
	//	iview.LoadingBar.error();
	/*document.querySelector('#global-spin').style.display = 'none'*/
	return Promise.reject(error)
})
export default axios