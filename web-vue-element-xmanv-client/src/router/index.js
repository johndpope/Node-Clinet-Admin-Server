import Vue from 'vue'
import Router from 'vue-router'
import { Layout,Content }  from "../layout"; // 页面整体布局
import { topRouterMap } from "./topRouter";

// 此处是为了处理路由抛出的警告 vue-router.esm.js?8c4f:2007 Uncaught (in promise) undefined
const routerPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error=> error)
}

process.env.NODE_ENV === "development" ? Vue.use(Router) : null;

function filterTopRouterMap(name){
	let router = topRouterMap.find((item) => {
		return item.parentName === name;
	});
	return router.data; // arr
}

/**
 * 1、roles:后台返回的权限结构;
 * 
 */
//手动跳转的页面白名单
const whiteList = [
	'/'
];
/**
 * path:''与path:'*'的区别：
 * 1、path:'*', 会匹配所有路径
 * 2、path:''，也是会匹配到路由
 * 
 */
//默认不需要权限的页面
export const constantRouterMap = [
	{
    path: '',  
    component: Layout,
		redirect: '/index/index',
		hidden:true
  	},
	{ path: '/login',name: 'login',component:() => import('@/page/login'),hidden: true},
	{
		path: '/index',
		name: 'index',
		component:Layout,
		meta:{
			title:'前端',
		  	icon: 'icondashboard',
		},
		noDropdown:true,
		children:[ 
			{
				path:'index', 
				meta:{
					title:'首页', 
					icon:'icondashboard',
				  	routerType:'leftmenu',
					
				},
        		component:() => import('@/page/index/index'),
			},
			{
				path:'details', 
				meta:{
					title:'首页', 
					icon:'icondashboard',
				  	routerType:'leftmenu',
					
				},
        		component:() => import('@/page/articledetail/index'),
			}
		]
	},
	{
		path:'/userManager',
		name: 'userManage',
		component:Layout,
		meta: {
			title:'后端',
			icon: 'iconuser',
		},
		noDropdown:true,
		children:[
			{
				path:'userList', 
				name:'userList',
				meta:{
					title:'用户管理', 
					icon:'iconuser',
				  	routerType:'leftmenu',
					titleList:[
						{"path":"infoShow1","title":"个人信息子菜单1"},
						{"path":"infoShow2","title":"个人信息子菜单2"},
						{"path":"infoShow3","title":"个人信息子菜单3"},
						{"path":"infoShow4","title":"个人信息子菜单4"},
						{"path":"infoShow5","title":"个人信息子菜单5"},
					]
				},
				component: () => import('@/page/userList/userList'),
				children:filterTopRouterMap('userList')
			}
		]
	},
	{
		path:'/share',
		name: 'share',
		component:Layout,
		meta: {
			title:'生活',
			icon: 'iconshare',
		},
		noDropdown:true,
		children:[
			{
				path:'share', 
				meta:{
				  title:'分享功能', 
				  icon:'iconshare',
				  routerType:'leftmenu'
				},
				component: () => import('@/page/share'),
			}
		]
	},
	{ 
		path: '*', 
		redirect: '/404', 
		hidden: true 
	}
	
]

	//注册路由
export default new Router({
	mode:'history', // 默认为'hash'模式
	base: '', // 添加跟目录,对应服务器部署子目录
	routes: constantRouterMap
})

  //异步路由（需要权限的页面）
export const asyncRouterMap = [
	{
		path:'/share2',
		name: 'share',
		component:Layout,
		meta: {
			title:'其他',
			icon: 'iconshare',
			roles: ['admin']
			
		},
		noDropdown:true,
		children:[
			{
				path:'share2', 
				meta:{
				  title:'其他', 
				  icon:'iconshare',
				  routerType:'leftmenu',
				  roles: ['admin']
				},
				component: () => import('@/page/share'),
			}
		]
	},
	
];
	

