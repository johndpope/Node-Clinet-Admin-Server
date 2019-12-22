import request from '@/utils/axios'
import {BASE_URL} from './config'
import store from '../store'
export function article_list(params) {
  return  request({
      url: 'http://localhost:8081/api/article_list',
      method: 'post',
      data:params
    })
}
export function article_detail(params) {
  return  request({
      url: `http://localhost:8081/api/select/${params}`,
      method: 'get'
    })
}


