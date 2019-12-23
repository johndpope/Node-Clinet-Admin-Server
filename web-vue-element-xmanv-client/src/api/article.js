import axios from '@/utils/axios'
import {BASE_URL} from './config'
import store from '../store'
export function article_list(params) {
  return  axios({
      url: 'http://localhost:8081/api/article_list',
      method: 'post',
      data:params
    })
}
export function article_detail(params) {
  return  axios({
      url: `http://localhost:8081/api/select/${params}`,
      method: 'get'
    })
}
export function imgupload(params) {
  return  axios({
      url: `http://localhost:8081/api/upload`,
      method: 'post',
      data:params,
      headers: { 'Content-Type': 'multipart/form-data' },
    })
}
export function article_add(params) {
  return  axios({
      url: `http://localhost:8081/api/add`,
      method: 'post',
      data:params
    })
}

