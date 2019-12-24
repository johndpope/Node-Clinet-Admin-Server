<template>
    <div class="home rflex">
        <left-menu></left-menu>
        <div class="menu_right wflex el-scrollbar" id='myScrollbar' :style="{'width':headNavWidth+'px'}" ref="menu_right" >
            <!-- <head-nav></head-nav> -->
            <div class="menu_content" ref="menu_content">
                <!-- <bread></bread> -->
                 
                <!--页面渲染入口-->
                <!-- <head-nav  ></head-nav> -->
                <transition-group name="fade">
                    <router-view key="1"></router-view>
                </transition-group>
            </div>
            <!-- <footerNav></footerNav> -->
            <backTop :ele="$refs.menu_right"></backTop>
        </div>
        <right-menu></right-menu>
        <!-- 雪花 -->
        <div id="canvas-box">
            <canvas id="canvasBg"></canvas>
        </div>
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
                headNavWidth:1920,
                
            }
        },
        watch:{
            document(){
                this.headNavWidth= document.body.clientWidth - (220+240)
            }
        },
        computed:{
            ...mapGetters(['name','avatar','sidebar']),
            //  headNavWidth(){
            //     return document.body.clientWidth - (220+240)
            // }  
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
            this.headNavWidth= document.body.clientWidth - (250+240);
        },
        mounted (){
            $(window).resize(()=>{
                this.headNavWidth= document.body.clientWidth - (250+240)    
            })
            this.snow()
        },
        methods:{
            // 雪花
            snow(){
                this.$nextTick(() => {
                  var Snow = function (canvas_id, options) {
                    var defaultOptions = {
                      speed: 5,
                      count: 5,
                      size: {
                        min: 10,
                        max: 25
                      }
                    };
                    if (options !== null) {
                      for (var prop in defaultOptions) {
                        if (defaultOptions.hasOwnProperty(prop)) {
                          if (!options.hasOwnProperty(prop)) {
                            options[prop] = defaultOptions[prop];
                          }
                        }
                      }
                    }
                    var canvas = document.querySelector(canvas_id);
                    var ctx = canvas.getContext("2d");
                    var stopped = true, paused = false;
                    var halfHorizontal, halfVertical;
                    var rand = function (min, max) {
                      return Math.floor(Math.random() * (max - min + 1)) + min;
                    }
                    var rand_float = function (min, max) {
                      return (Math.random() * (min - max) + max);
                    };
                    var flakes = [];
                    var Flake = function () {
                      var image = new Image();
                      var imageLoaded = false;
                      var x, y, y_step, size, direction, x_step, x_step_size, rotate, rotate_speed, rotateDiretion, flip, flip_speed;
                      var reset = function () {
                        size = rand(options.size.min, options.size.max);
                        x = rand(size, canvas.width);
                        y = -size;
                        y_step = rand_float(1, 5);
                        x_step = 0;
                        x_step_size = rand(1, 10) / 100;
                        direction = rand_float(-1.5, 1.5);
                        rotate = 0;
                        rotateDiretion = rand(0, 1) ? -1 : 1;
                        rotate_speed = 1 + Math.random() * (2 - 1);
                        flip = 1;
                        if (rand(1, 100) <= 50) {
                          flip_speed = -rand_float(0.01, 0.05);
                        }
                        else {
                          flip_speed = 0;
                        }
                      }
                      image.onload = function () {
                        imageLoaded = true;
                        reset();
                        y = rand(-size, canvas.height);
                      }
                      image.src = options.images[rand(0, options.images.length - 1)];
                      this.draw = function () {
                        if (imageLoaded) {
                          y += y_step;
                          x_step += x_step_size;
                          x += Math.cos(x_step);
                          x += direction;
                          rotate += rotateDiretion * rotate_speed;
                          if (rotate < 0) {
                            rotate = 360;
                          }
                          else if (rotate > 360) {
                            rotate = 0;
                          }
                          flip += flip_speed;
                          if (flip <= 0 || flip >= 1) {
                            flip_speed *= -1;
                          }
                          ctx.save();
                          ctx.translate(x, y);
                          ctx.translate(size / 2, size / 2);
                        //   ctx.rotate(rotate * Math.PI / 180);
                          ctx.scale(flip, 1);
                          ctx.drawImage(image, -(size / 2), -(size / 2), size, size);
                          ctx.restore();
                          if (y >= canvas.height + size) {
                            reset();
                          }
                        }
                      }
                    }
                    this.updateCanvasSize = function () {
                      canvas.width = canvas.parentNode.offsetWidth;
                      canvas.height = canvas.parentNode.offsetHeight;
                      halfHorizontal = canvas.width / 2;
                      halfVertical = canvas.height / 2;
                    }
                    this.start = function () {
                      if (stopped) {
                        stopped = false;
                        for (let i = 0; i < options.count; i++) {
                          flakes.push(new Flake());
                        }
                        this.draw();
                      }
                      else if (paused) {
                        paused = false;
                        this.draw();
                      }
                    }
                    this.stop = function () {
                      flakes = [];
                      ctx.clearRect(0, 0, canvas.width, canvas.height);
                      stopped = true;
                      paused = false;
                    }
                    this.pause = function () {
                      paused = true;
                    }
                    this.draw = function () {
                      if (!stopped && !paused) {
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        for (let i = 0; i < flakes.length; i++) {
                          flakes[i].draw();
                        }
                        window.requestAnimationFrame(() => this.draw());
                      }
                    }
                    this.updateCanvasSize();
                    window.addEventListener("resize", () => this.updateCanvasSize());
                  }
                  setTimeout(() => {
                    var SnowFall = new Snow("#canvasBg", {
                      images: [
                        require("../assets/img/clock.png"),
                        require("../assets/img/calendar.png"),
                        require("../assets/img/qq.png"),
                        require("../assets/img/snow.png"),
                        require("../assets/img/github.png"),
                      ]
                    });
                    SnowFall.start();
                  }, 1000)

                })
            }
        }
    }
</script>
<style scoped lang='less'>
   
    .home{
        background:#f8fafc;
        .menu_right{
            overflow: scroll;
            position: absolute;
            right:240px;
            top:0;
            bottom:0;
            background:#F6F7FC;
            .menu_content{
                position: relative;
                margin-top:20px;
                overflow: hidden;
                width:100%;
                // background:#f0f2f5;
            }

        }
    }
    .fade-enter-active,.fade-leave-active {
        transition: all 0.6s ease;
        // transform: translateX(0%);
    }
    
    .fade-enter,.fade-leave-active {
        opacity: 0;
        // transform: translateX(5%);
    }
    // .fade-move{
    //     transition: all 0.6s ease;
    // }
    // .fade-leave-active{
    //     transform: translateX(0%);
    // }
</style>
<style>
 #canvas-box {
    position: fixed;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    pointer-events: none;
    z-index: 50000;	
}
</style>
