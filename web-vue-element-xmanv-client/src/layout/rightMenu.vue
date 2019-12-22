<template>
   <div class="menu_left cflex" :style="{width:'240px'}">
        <div class="menu_page_bottom is-scroll-left">
            <ul class="center">
                <li>
                    <div class="sidebar-block__title">文章搜索</div>
                    <div id="article-search-box" class="clear">
                        <input id="article-search-input" type="com-text" placeholder="根据标题或者内容搜索">
                        <button id="article-search-btn">
                            <i class="xiconfont xiconweibiaoti-"></i>
                        </button>
                    </div>
                </li>
                <li>
                    <div class="sidebar-block__title">时钟</div>
                    <div id="clock" ref="clock">
                        <div id="anchor-box" ref="anchorbox"></div>
                        <div id="hour-num" ref="hournum"></div>
                        <div id="center-point" ref="centerpoint"></div>
                        <div id="hour-hand" class="hand" ref="hourhand">
                            <div class="short-hand"></div>
                            <div class="long-hand"></div>
                        </div>
                        <div id="min-hand" ref="minhand" class="hand">
                            <div class="short-hand"></div>
                            <div class="long-hand"></div>
                        </div>
                        <div id="sec-hand" ref="sechand"></div>
                        <div id="sec-center" ref="seccenter"></div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-block__title">标签</div>
                    <div class="sidebar-block__content">
                        <div id="tag-box">
                            <router-link to="/share/share/share"  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">Node</span>
                            </router-link>
                            <router-link to="/index/index"  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">BUE</span>
                            </router-link>
                            <router-link to="/share/share/share"  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">Koa</span>
                            </router-link>
                            <router-link to="/userManager/userList"  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">Webpack</span>
                            </router-link>
                            <router-link to="/index/index
                            "  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">Webpack</span>
                            </router-link>
                            <router-link to="/share/share/share"  class="com-icon tag-item">
                                <i class="com-icon__pic" style="background-image: url(${host}/${tag_item.img})"></i>
                                <span class="com-icon__text">Webpack</span>
                           </router-link>
                        </div>
                    </div>
                </li>
            </ul>
            
            
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
      this.clockEvent();    
  },
  methods: {
    getIindex(citem,item,cindex){
      return (citem.meta.titleList)?item.path+'/'+citem.path+'/'+citem.meta.titleList[0].path:item.path+'/'+citem.path;
    },
    toZero(num) {
            return num < 10 ? '0' + num : num;
    },
    clockEvent(){
        const hour_num = $('#hour-num');
        const anchor_box = $('#anchor-box');
        let anchor_str = '';
        for (let i = 0; i < 60; i++) {
            if (i % 5 === 0) anchor_str += `<i class="anchor anchor-num" style="transform: rotate(${i * 6}deg);">
                    <span style="transform: rotate(${-i * 6}deg);">${this.toZero(i)}</span>
                </i>`;
            else anchor_str += `<i class="anchor anchor-bar" style="transform: rotate(${i * 6}deg);"></i>`;
        }
        anchor_box.html(anchor_str);

        let hour_str = '';
        for (let i = 1; i <= 12; i++) {
            hour_str += `<span class="hour-text" style="transform: rotate(${i * 30}deg);">
                <span style="${i > 9 ? 'left: -9px;' : ''} transform: rotate(${-i * 30}deg);">${i}</span>
            </span>`;
        }
        hour_num.html(hour_str);
        const hour_hand = $('#hour-hand');
        const min_hand = $('#min-hand');
        const sec_hand = $('#sec-hand');
        clock_go();
        function clock_go() {
            const date = new Date();
            const sec = date.getSeconds() * 6;
            const min = date.getMinutes() * 6 + sec / 360 * 6;
            const hour = (date.getHours() > 11 ? date.getHours() - 12 : date.getHours()) * 30 + (min / 360 * 30);

            hour_hand.css('transform', `rotate(${hour}deg)`);
            min_hand.css('transform', `rotate(${min}deg)`);
            sec_hand.css('transform', `rotate(${sec}deg)`);
            setTimeout(() => {
                requestAnimationFrame(clock_go);
            }, 1000);
        }
    
    }
  }
};
</script>


<style lang="less" scoped>
  @left-bgColor:#fff;  // 左侧菜单背景颜色;
  @icon-link:#FF6C60;
    .menu_left{
        position: absolute;
        top:0;
        right:0;
        bottom:0;
        justify-content: center;
        align-items: center;
        flex-direction:column;
    }
    // .menu_page_top{
    //     width:100%;
    //     height: 60px;
    //     align-items: center;
    //     justify-content: space-around;
    //     text-transform: uppercase;
    //     box-sizing: border-box;
    //     box-shadow:0px 2px 5px 0px rgba(230,224,224,0.5);
    //     .logo {
    //         height: 36px;
    //         width: 36px;
    //         vertical-align: middle;
    //         display: inline-block;
    //     }
    //     .closeLogo{
    //         width:30px;
    //         height:30px;
    //     }
    //     .title{
    //         font-size: 22px;
    //         i{
    //             color:#FF6C60;
    //         }
    //     }
    // }
  .menu_page_bottom {
      width:100%;
      overflow-y: scroll;
      overflow-x: hidden;
      flex:1;
      margin-top:3px;
      z-index: 10;
      background:#f8fafc;
      box-shadow: 0 0 10px 0 rgba(230, 224, 224, 0.5);
      ul{
          padding: 0 12px;
          margin-top:10px;
          li{
              margin-bottom: 45px;
              box-shadow: 0 4px 8px 0 rgba(7, 17, 27, 0.05);
              background:#ffffff;
              padding:12px;
              
          }
      }
      
  }
  #article-search-box {
    height: 30px;
    overflow: hidden;
    #article-search-input {
        float                    : left;
        width                    : 158px;
        height                   : 100%;
        border                   : 1px solid #eee;
        font-size                : 12px;
        box-sizing               : border-box;
        padding-left             : 5px;
        border-top-left-radius   : 2px;
        border-bottom-left-radius: 2px;
        transition               : .3s;
        &:focus {
            border: 1px solid #111111;
        }
    }
    #article-search-btn {
        float                     : left;
        width                     : 30px;
        height                    : 30px;
        line-height               : 30px;
        border-top-right-radius   : 2px;
        border-bottom-right-radius: 2px;
        background-color          : #111111;
        color                     : #fff;
        font-size                 : 14px;
        text-align                : center;
        cursor: pointer;
    }
}
.sidebar-block__title {
            position     : relative;
            color        : #1c1f21;
            font-size    : 14px;
            padding-left : 16px;
            margin-bottom: 20px;
            height       : 20px;
            line-height  : 20px;
            
            &:before {
                content         : '';
                position        : absolute;
                width           : 4px;
                height          : 100%;
                background-color: #111111;
                left            : 0;
                top             : 0;
                border-radius:2px;
            }
}
// 标签
#tag-box {
    margin-top: -12px;
    .tag-item {
        position      : relative;
        padding       : 4px;
        margin-right  : 10px;
        padding-bottom: 10px;
        font-size     : 12px;
        color         : #222629;
        font-weight   : bold;
        transition    : .3s;
        display: inline-block;
        &:after {
            content         : '';
            position        : absolute;
            width           : 100%;
            height          : 2px;
            left            : 0;
            bottom          : 0;
            background-color: #222629;
            transition      : .2s;
            transform       : scale(0);
        }
        &.act,&:hover {
            &:after {
                transform: scale(1);
            }
        }
    }
}
</style>
<style >
/* 时钟 */
#clock {
    position  : relative;
    width     :186px;
    height    : 186px;
    margin    : 0 auto;
}
#clock #anchor-box {
    position: absolute;
    width   : 100%;
    height  : 100%;
    left    : 0;
    top     : 0;
}

#clock #hour-num {
    position: absolute;
    width   : 156px;
    height  : 156px;
    left    : 15px;
    top     : 15px;
}

#clock  #hour-num .hour-text {
    position        : absolute;
    font-size       : 16px;
    color           : #1c1f21;
    left            : 50%;
    top             : 0;
    margin-left     : -0.5px;
    transform-origin: 0 78px;
    }

#clock  #hour-num .hour-text span {
        position: absolute;
        left    : -4px;
        top     : 0;
    }

#clock .anchor {
        position        : absolute;
        left            : 50%;
        top             : 0;
        margin-left     : -0.5px;
        transform-origin: 0 93px;
    }

#clock .anchor-bar {
        width           : 1px;
        height          : 9px;
        opacity         : .8;
        background-color: #1c1f21;
    }

#clock .anchor-num {
        font-style: normal;
        font-size : 10px;
        color     :#1c1f21;
    }

#clock .anchor-num span {
        position: absolute;
        left    : -5px;
        top     : -2px;
    }

#clock #center-point {
        position        : absolute;
        width           : 20px;
        height          : 20px;
        background-color: #1c1f21;
        left            : 50%;
        top             : 50%;
        margin-left     : -10px;
        margin-top      : -10px;
        border-radius   : 50%;
    }

#clock  #hour-hand,#clock #min-hand {
        position   : absolute;
        width      : 6px;
        left       : 50%;
        margin-left: -3px;
    }
#clock  #hour-hand {
        height          : 56px;
        top             : 33px;
        transform-origin: 3px 56px;
    }
#clock #min-hand {
        height          : 75px;
        top             :18px;
        transform-origin: 3px 75px;
    }
#clock  #sec-hand {
        position        : absolute;
        width           : 4px;
        left            : 50%;
        margin-left     : -2px;
        background-color: #ff2e5f;
        height          : 123px;
        top             : 0;
        transform-origin: 2px 93px;
    }
#clock  .short-hand {
        position        : absolute;
        width           : 3px;
        height          : 30%;
        left            : 50%;
        margin-left     : -1.5px;
        bottom          : 0;
        background-color: #1c1f21;
    }
#clock  .long-hand {
        position        : absolute;
        width           : 100%;
        height          : 70%;
        background-color: #1c1f21;
        border-radius   : 10px;
        top             : 5%;
    }
#clock  #sec-center {
        position        : absolute;
        width           : 14px;
        height          : 14px;
        background-color: #1c1f21;
        box-sizing      : border-box;
        border          : 4px solid #ff2e5f;
        left            : 50%;
        top             : 50%;
        margin-left     : -7px;
        margin-top      : -7px;
        border-radius   : 50%;
    }
</style>
