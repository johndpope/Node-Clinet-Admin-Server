import request from '@/utils/axios'
import {BASE_URL} from './config'

export function login(params) {
  return new Promise((reslove,reject)=>{
   request({
      url: 'http://localhost:8081/api/admin_login',
      method: 'post',
      data:params
    }).then(res=>{
        reslove(res)
    }).catch((e) => {
        alert(e)
        reject()
    })
  })
  
}
export function logout(params) {
  // return request({
  //   url: '/user/logout',
  //   method: 'get',
  //   data:params
  // })
  return new Promise((reslove,reject)=>{
    setTimeout(() => {
      reslove(true)
    }, 50);
      
  })
}


export function getUserInfo(params) {
  return request({
    url: 'http://localhost:8081/api/admin_getuerinfo',
    method: 'post',
    data:params
  })
}

export function getUserList(reqData) {
  return request({
    url:'/user/list/get',
    method: 'get',
    data: reqData
  })
}


