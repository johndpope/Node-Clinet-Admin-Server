<template>
    <div class="home rflex">
        <left-menu></left-menu>
        <div class="menu_right wflex el-scrollbar" :style="{'width':headNavWidth+'px'}" ref="menu_right" >
            <!-- <head-nav></head-nav> -->
            <div class="menu_content" ref="menu_content">
                <!-- <bread></bread> -->
                 <head-nav></head-nav>
                <!--页面渲染入口-->
                <router-view></router-view>
            </div>
            <!-- <footerNav></footerNav> -->
            <backTop :ele="$refs.menu_right"></backTop>
        </div>
        <right-menu></right-menu>
    </div>
</template>
<script>
    import { mapState, mapGetters } from 'vuex'
    import HeadNav from './headNav.vue';
    import LeftMenu from './leftMenu.vue';
	import rightMenu from './rightMenu.vue';
	import Bread from './bread.vue';
	import FooterNav from './footerNav.vue';
	import backTop from 'cps/backTop';
    export default {
        name: 'home',
        data(){
            return {
            }
        },
        computed:{
            ...mapGetters(['name','avatar','sidebar']),
             headNavWidth(){
                return document.body.clientWidth - (220+240)
            }
              
          },
        components:{
            HeadNav,
            LeftMenu,
            rightMenu,
            Bread,
            FooterNav,
            backTop
        },
        created() {
        },
        mounted (){
        },
        watch:{
          
        }
    }
</script>
<style scoped lang='less'>
    .home{
        .menu_right{
            overflow: auto;
            position: absolute;
            right:240px;
            top:0;
            bottom:0;
            background:#F6F7FC;
            .menu_content{
                position: relative;
                // margin-top:60px;
                overflow: hidden;
                width:100%;
                background:#f0f2f5;
            }

        }
    }
</style>
