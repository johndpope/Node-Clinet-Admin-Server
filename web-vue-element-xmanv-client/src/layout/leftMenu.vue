<template>
   <div class="menu_left cflex" :style="{width:'250px'}">
        <!-- <div class="menu_page_top rflex">
            <img :class='["logo",{"closeLogo":!sidebar.opened}]' :src="logo" alt="漫威admin" >
            <span class='title' v-show="sidebar.opened">{{$t('commons.xiaoai')}}<i>Admin</i></span>
        </div>
        <div class="menu_page_bottom add is-scroll-left">
            <el-menu 
                mode="vertical"
                theme="dark" 
                :show-timeout="200"
                :default-active="$route.path" 
                :collapse="isCollapse"
                :background-color="menuObj.bgColor"
                :text-color="menuObj.textColor"
                :active-text-color="menuObj.activeTextColor"
                :style="{width:'220px'}"
                >
                    <template v-for="(item,index) in permission_routers">
 
                        <router-link v-if="!item.hidden && item.noDropdown" :to="item.path+'/'+item.children[0].path" :key="index">
                            <el-menu-item class="dropItem" 
                                :index="item.path+'/'+item.children[0].path"
                                >
                                <icon-svg v-if="item.meta.icon" :icon-class="item.meta.icon" />
                                <span v-if="item.meta.title" slot="title">{{ $t(`commons.${item.name}`)}}</span> 
                            </el-menu-item>
                        </router-link>

              
                        <el-submenu v-if="item.children  && item.children.length >= 1 && !item.hidden && !item.noDropdown"  :index="item.path" :key="index">
                            <template slot="title">
                                <icon-svg v-if="item.meta.icon" :icon-class="item.meta.icon" />
                                <span v-if="item.meta.title" slot="title">{{ $t(`commons.${item.name}`)}}</span>
                            </template>
               
                            <router-link v-for="(citem,cindex) in item.children" :to="getIindex(citem,item,cindex)"  :key="cindex">
                                <el-menu-item 
                                    v-if="citem.meta.routerType != 'topmenu' && citem.meta.title"
                                    :index="getIindex(citem,item,cindex)">
                                    <span slot="title"> {{ $t(`commons.${citem.name}`)}}</span>
                                </el-menu-item> 
                            </router-link>
                        </el-submenu>
                    </template>
            </el-menu>
        </div> -->
        <div class="menu_page_bottom is-scroll-left">
            <aside id="intrude-box" class="mask ">
                <!-- 侧边栏图片 -->
                <div id="intrude-bg"></div>
                <!-- 侧边栏内容 -->
                <div id="intrude-outer">
                    <div id="intrude-inner">
                        <!-- 头像 -->
                        <h1 id="head-portrait">
                            <a href="/" id="portrait-logo">web前端工程师博客</a>
                        </h1>
                        <div id="intrude-info">
                            <!-- 昵称 -->
                            <div id="author" title="">XMAN</div>
                            <!-- 介绍 -->
                            <h2 id="intrude-text" title="">
                                <a href="/">
                                        兰尼斯特
                                </a>
                            </h2>
                            <!-- 导航 -->
                            <nav id="nav-menu">
                                <ul id="nav-list">
                                    <li class="nav-item"  v-for="(item,index) in permission_routers">
                                        <router-link v-if="!item.hidden && item.noDropdown" :to="getPath(item)" :key="index" class="nav-outer">
                                            <span class="nav-inner">
                                                <!-- <i class="nav-icon "></i> -->
                                                 <i class="xiconfont xicongithub" ></i>
                                                <span class="nav-text">{{item.meta.title}}</span>
                                            </span>
                                        </router-link>
                                    </li>
                                </ul>
                            </nav>
                            <!-- 联系方式 -->
                            <div id="contact-box">
                                <i class="xiconfont xiconweixin" ></i>
                                <i class="xiconfont xiconicon" ></i>
                                <a href="https://github.com/chandlerCao" target="_blank" >
                                    <i class="xiconfont xicongithub"></i>
                                </a>
                                <i class="xiconfont xiconweibo"></i>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </aside>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import * as mUtils from "@/utils/mUtils";
import logoImg from "@/assets/img/logo.png";


export default {
  name: "left-Menu",
  data() {
    return {
       menuObj:{
         bgColor:'#fff',
         textColor:'#666',
         activeTextColor:'#ff6428',
       },
       logo:logoImg
    };
  },
  computed:{
      ...mapGetters([
        'permission_routers',
        'isCollapse',
        'sidebar',
        'menuIndex'
      ]),
  },
  created(){
  },
  mounted(){
  },
  methods: {
    getIindex(citem,item,cindex){
      return (citem.meta.titleList)?item.path+'/'+citem.path+'/'+citem.meta.titleList[0].path:item.path+'/'+citem.path;
    },
    getPath(item){
        if(item.children[0].children){
            return item.path+'/'+item.children[0].path+'/'+item.children[0].children[0].path
        }else{
            return item.path+'/'+item.children[0].path
        }
        
    }
  }
};
</script>


<style lang="less" scoped>
    .menu_left{
        position: absolute;
        top:0;
        left:0;
        bottom:0;
    }
    .menu_page_top{
        width:100%;
        height: 60px;
        align-items: center;
        justify-content: space-around;
        text-transform: uppercase;
        box-sizing: border-box;
        box-shadow:0px 2px 5px 0px rgba(230,224,224,0.5);
        .logo {
            height: 36px;
            width: 36px;
            vertical-align: middle;
            display: inline-block;
        }
        .closeLogo{
            width:30px;
            height:30px;
        }
        .title{
            font-size: 22px;
            i{
                color:#FF6C60;
            }
        }
    }
  .menu_page_bottom {
      width:100%;
    //   overflow-y: scroll;
      overflow-x: hidden;
      flex:1;
      margin-top:3px;
      z-index: 10;
      box-shadow: 0 0 10px 0 rgba(230, 224, 224, 0.5);
      

  }
// 遮罩
.mask:before {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    background-color: #111111;
    // opacity: .4;
    z-index: 2;
    pointer-events: none;
    
}
// 新样式
#intrude-box {
     position: absolute;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    color: #fff;
    z-index: 100;
    
}

/*侧边栏背景*/

#intrude-bg {
    position: absolute; 
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    perspective: 1000000000000px;
    // background: red;
    // opacity:0.5;
}

#intrude-outer {
    display: table;
    width: 100%;
    height: 100%;
    position: relative;
    z-index: 3;
}

#intrude-inner {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
}

@keyframes picture3DSwitch1 {

    3%,
    25% {
        transform: rotate3D(0, 1, 0, -90deg);
    }

    28%,
    50% {
        transform: rotate3D(0, 1, 0, -180deg);
    }

    53%,
    75% {
        transform: rotate3D(0, 1, 0, -270deg);
    }

    78%,
    100% {
        transform: rotate3D(0, 1, 0, -360deg);
    }
}

@keyframes picture3DSwitch2 {

    3%,
    25% {
        transform: rotate3D(0, 1, 0, 0);
    }

    28%,
    50% {
        transform: rotate3D(0, 1, 0, -90deg);
    }

    53%,
    75% {
        transform: rotate3D(0, 1, 0, -180deg);
    }

    78%,
    100% {
        transform: rotate3D(0, 1, 0, -270deg);
    }
}

@keyframes picture3DSwitch3 {

    3%,
    25% {
        transform: rotate3D(0, 1, 0, 90deg);
    }

    28%,
    50% {
        transform: rotate3D(0, 1, 0, 0);
    }

    53%,
    75% {
        transform: rotate3D(0, 1, 0, -90deg);
    }

    78%,
    100% {
        transform: rotate3D(0, 1, 0, -180deg);
    }
}

@keyframes picture3DSwitch4 {

    3%,
    25% {
        transform: rotate3D(0, 1, 0, 180deg);
    }

    28%,
    50% {
        transform: rotate3D(0, 1, 0, 90deg);
    }

    53%,
    75% {
        transform: rotate3D(0, 1, 0, 0deg);
    }

    78%,
    100% {
        transform: rotate3D(0, 1, 0, -90deg);
    }
}

/* 头像 */

#head-portrait {
    display: inline-block;
    width: 128px;
    height: 128px;
    border-radius: 50%;
    overflow: hidden;
}

#portrait-logo {
    display: block;
    height: 100%;
    background-size: cover;
    background-repeat: no-repeat;
    background-image: url(../assets/img/me.jpg);
    text-indent: -20000px;
}

//导航栏出场动画
#author {
    font-size: 30px;
    margin: 20px 0;
    color:#ffffff;
}

#intrude-text {
    font-size: 16px;
    letter-spacing: 1px;
    background-color: #292929;
    padding: 10px 0;
    border-radius: 4px;
    color: #ffffff;
    width:95%;
    margin:0 auto;
    
    a{
        color:#000000;
    }
}

/* 导航 */

#nav-menu {
    font-size: 16px;
    margin-top: 20px;
}

#nav-menu li {
    position: relative;
    overflow: hidden;
}

.nav-outer {
    display: inline-block;
    position: relative;
    width: 90px;
    overflow: hidden;
    &.router-link-active{
        color:#f13823;
    }
}

.nav-inner {
    display: inline-block;
    position: relative;
    width: 100%;
    padding: 6px 0;
}

.nav-outer:before,
.nav-outer:after,
.nav-inner:before,
.nav-inner:after {
    content: '';
    position: absolute;
    background-color: lighten(red, 100%);
    transition: .25s linear;
}

.nav-outer:after,
.nav-inner:after {
    transition-delay: .25s;
}

/* 上 */

.nav-outer:before {
    width: 100%;
    height: 1px;
    left: -100%;
    top: 0;
}

/* 左 */

.nav-outer:after {
    width: 1px;
    height: 100%;
    left: 0;
    top: 100%;
}

/* 下 */

.nav-inner:before {
    width: 100%;
    height: 1px;
    right: -100%;
    bottom: 0;
}

/* 右 */

.nav-inner:after {
    width: 1px;
    height: 100%;
    right: 0;
    top: -100%;
}

.nav-outer:hover:before {
    left: 0;
}

.nav-outer:hover .nav-inner:before {
    right: 0;
}

.nav-outer:hover:after {
    top: 0;
}

.nav-outer:hover .nav-inner:after {
    top: 0;
}

.nav-item{
    a{
        color:#ffffff;
    }
}
.nav-item.act {
    &:before,
    &:after {
        border-color: lighten(red, 100%);
    }
    .nav-outer {
        background-color: lighten(red, 100%);
        border-radius: 4px;
        font-weight: 700;
        color: #3b8cff;
    }
}

.nav-icon,
.nav-text {
    display: inline-block;
}

.nav-icon {
    position: relative;
    width: 16px;
    height: 16px;
    background-position: center;
    text-align: center;
}

.nav-text {
    padding-left: 10px;
    letter-spacing: 2px;
}

/* 联系方式 */

#contact-box {
    width: 200px;
    display: flex;
    justify-content: space-around;
    margin: 30px auto 0;
    
}

#contact-box .xiconfont {
    display: inline-block;
    position: relative;
    width: 24px;
    height: 24px;
    background-size: cover;
    cursor: pointer;
    transition: .2s;
    font-size: 25px;
    color:#303133;
}

#contact-box .xiconfont:hover {
    transform: scale(1.2);
}


@media screen and (max-width: 500px) {
    #head-portrait {
        width: 100px;
        height: 100px;
    }
}

@media screen and (max-width: 800px) {

    /* 侧边栏 */
    #intrude-box {
        position: relative;
        width: 100%;
        height: auto;
    }

    /* 侧边栏内容*/
    #intrude-outer {
        padding: 10px 0;
    }

    /* 导航 */
    #nav-menu ul {
        display: flex;
        justify-content: space-around;
    }

    #nav-menu ul li {
        width: 20%;
    }

    .nav-outer {
        width: 100%;
        box-sizing: border-box;
    }

    .nav-text {
        padding-left: 3px;
    }
}

</style>
