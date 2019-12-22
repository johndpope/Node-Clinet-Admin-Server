
export const topRouterMap = [
    {
        'parentName':'userList',
        'data':[
            {
                path: 'infoShow1',
                name: 'infoShow1',
                meta: {
                    title: '个人信息子菜单1',
                    icon: 'fa-asterisk',
                    routerType: 'topmenu'
                },
                component: () => import('@/page/index/index')
            },
            {
                path: 'infoShow2',
                name: 'infoShow2',
                meta: {
                    title: '个人信息子菜单2',
                    icon: 'fa-asterisk',
                    routerType: 'topmenu'
                },
                component: () => import('@/page/index/index')
            },
            {
                path: 'infoShow3',
                name: 'infoShow3',
                meta: {
                    title: '个人信息子菜单3',
                    icon: 'fa-asterisk',
                    routerType: 'topmenu'
                },
                component: () => import('@/page/index/index')
            },
            {
                path: 'infoShow4',
                name: 'infoShow4',
                meta: {
                    title: '个人信息子菜单4',
                    icon: 'fa-asterisk',
                    routerType: 'topmenu'
                },
                component: () => import('@/page/index/index')
            },
            {
                path: 'infoShow5',
                name: 'infoShow5',
                meta: {
                    title: '个人信息子菜单5',
                    icon: 'fa-asterisk',
                    routerType: 'topmenu'
                },
                component: () => import('@/page/index/index')
            }
        ]
    }
]


