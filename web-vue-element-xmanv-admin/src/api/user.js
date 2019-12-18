import request from '@/utils/axios'
import {BASE_URL} from './config'

export function login(params) {
  return request({
    url: 'http://localhost:8081/api/admin_login',
    method: 'post',
    data:params
  })
}
export function logout(params) {
  return request({
    url: '/user/logout',
    method: 'get',
    data:params
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


