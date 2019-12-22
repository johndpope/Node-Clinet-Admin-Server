<template>
		<section class="data_section" ref="data_section"> 
			<main id="main-wrap">
				<section id="main-box">
				<article class="article-item" v-for='(item,index) in Article_list' :key='index'>
						<div class="art-pretty">
							<b class="art-dotts"></b>
							<time class="art-time">
								{{item.create_time}}
							</time>
						</div>
						<div class="art-main com-block">
							<router-link :to='jumpDetailUrl(item.id)' class="art-wrap">
								<div class="art-info">
									<h2 class="art-title">{{item.title}}</h2>
									<h3 class="art-note" >
										<span>{{item.summary}}</span>
									</h3>
								</div>
								<div class="art-img" >
										<img  v-if="item.cover" :src="formDateImgurl(item.cover)" alt="">
								</div>
							</router-link>
							<div class="art-meta">
								<a href="javascript:;" class="art-heart heart-box mr20" >
									<i class="heart-icon__pic"></i>
									<span class="heart-icon__text">喜欢(<span class="like-num">50</span>)</span>
								</a>
								<a href="javascript:;" class="com-icon art-comment art-icon mr20">
									<i class="com-icon__pic eye-icon"></i>
									<span class="com-icon__text">阅读(50)</span>
								</a>
								<a href="" class="com-icon art-tag art-icon mr20">
									<i class="com-icon__pic tag-icon" ></i>
									<span class="com-icon__text">AA</span>
								</a>
							</div>
						</div>
					</article>
				</section>
			</main>
			<pagination :pageTotal="pageTotal" @handleCurrentChange="handleCurrentChange" @handleSizeChange="handleSizeChange"></pagination>
			
		</section>
</template>

<script>
	import { mapGetters } from "vuex";
	import Pagination from "@/components/pagination";
	import { login } from "@/api/user";
	import { article_list } from "@/api/article";
    export default {
    	data(){
    		return {
			  pageTotal:100,
			  Article_list:{}
    		}
    	},
    	components: {
		   Pagination
		},	
		created(){
		},
		computed:{
            ...mapGetters([]),     
        },
    	mounted(){
			this.Getarticle_list()
		},
    	methods: {
			formDateImgurl(url){
				return `http://localhost:8081${url.replace(/\\/g,'/')}` 
			},
			jumpDetailUrl(id){
				return `/index/details?id=${id}` 
			},
			// 上下分页
            handleCurrentChange(val){
                // this.incomePayData.page = val;
                // this.getMoneyList()
            },
            // 每页显示多少条
            handleSizeChange(val){
                // this.incomePayData.limit = val;
                // this.getMoneyList()
            },
			// id: 74
			// user_ip: null
			// email: null
			// title: "温恩"
			// content: ""
			// summary: ""
			// cover: "\image\2019\12\SDK_20191217190141.png"
			// classify: "Git"
			// type: 0
			// status: 0
			// star_number: 0
			// number: 0
			// create_time: "1576580511"
			// update_time: "1576586929"
			Getarticle_list() {
				article_list().then(res => {
					this.Article_list=res.Data.items;
					this.pageTotal=res.total_row;
				})
			}
    	}
    }
</script>

<style lang="less" scoped>

	.data_section{
		margin: 20px;
		border-radius: 2px;
		.row_list{
			margin-bottom: 20px;
			.row_base{
				padding: 10px;
				box-sizing: border-box;
				background: #fff;
				border-radius: 6px;
				height: 120px;
			}
		}
		.order_list{
			.orderArea{
				width: 100%;
				height: 300px;
				background: #fff !important;
				border-radius: 6px;
				box-sizing: border-box;
				padding: 10px;
				padding-top: 40px;
				overflow: hidden;
			}
			.orderbarArea{
				height: 370px;
			}
		}
		.data_list{
			text-align: center;
			font-size: 14px;
            border-radius: 6px;
			padding: 10px;
			color:#fff;
			height: 80px;
			.leftItem{
				align-items: start;
				justify-content: space-between;
				text-align: left;
			}
			.rightItem{
				width:62px;
				display: flex;
				align-items: center;
				justify-content: center;
				.svg-icon{
					font-size: 30px;
				}
			}
		    .number{
				font-size: 22px;
				font-weight: bold;
				.perTitle{
					font-size: 13px;
   				    margin-left: 5px;
				}
			}
		}
		.pay{
			.leftItem{
				justify-content: space-around;
			}
		}
     
	}
	// 雪花
	#canvas-box {
		position: fixed;
		width: 100%;
		height: 100%;
		left: 0;
		top: 0;
		pointer-events: none;
		z-index: 500;
	}
  #main-wrap {
    /* margin-left:  316px;
    margin-right: 275px; */
    #main-box {
        position: relative;
        .blog-element {
            width: 100%;
            box-sizing: border-box;
            padding: 20px;
        }
    }
    .article-item {
        position: relative;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        padding-top: 30px;
		border-left: .1rem solid #3b8cff;
        &:nth-of-type(1) {
            padding-top: 0;
		}
		.com-block{
			box-shadow: 0 4px 8px 0 rgba(7, 17, 27, .05);
			background-color: #fff;
			border-radius: 2px;
			box-sizing: border-box;
			padding: 15px 18px;
		}
        .art-pretty {
            position: relative;
            left: -7px;
            top: -8px;
        }
        .art-time {
            position: relative;
            display: inline-block;
            vertical-align: middle;
            height: 20px;
            line-height: 20px;
            padding-left: 10px;
            padding-right: 12px;
            border-top-right-radius: 2px;
            border-bottom-right-radius: 2px;
            background-color: #3b8cff;
            color: #fff;
            font-size: 13px;
            left: 15px;
        }
        .art-time:after {
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            border-width: 10px;
            border-style: solid;
            border-color: transparent;
            border-right-color: #3b8cff;
            left: -20px;
            top: 0;
        }
        .art-dotts {
            display: inline-block;
            vertical-align: middle;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #3b8cff;
            border: 1px solid #3b8cff;
        }
        .art-main {
            margin-top: 5px;
            color: #3b8cff;
        }
        .art-wrap {
            display: block;
            text-align: right;
            position: relative;
            cursor: pointer;
        }
        .art-info {
            display: flex;
            flex-wrap: wrap;
            position: absolute;
            align-content: initial;
            width: 80%;
            height: 100%;
            text-align: left;
        }
        /* 标题 */
        .art-title {
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
			white-space: nowrap;
			color: #1c1f21;
            &:hover {
                color: #1c1f21;
            }
        }
        /* 前言 */
        .art-note {
            position: relative;
            font-size: 12px;
            height: 48px;
            line-height: 24px;
            box-sizing: border-box;
            color: #1c1f21;
            overflow: hidden;
            text-align: justify;
        }
        /* 附图 */
        .art-img {
            display: inline-block;
            width: 100px;
            height: 100px;
            border-radius: 4px;
            overflow: hidden;
            background-size: contain;
            background-repeat: no-repeat;
			background-position: center center;
			position:relative;
			top:2px;
			img{
				display:block;
				height:100%;
				width:100%
			}
        }
        @keyframes heartBlast {
            0% {
                background-position-x: -6px;
            }
            100% {
                background-position-x: -1136px;
            }
        }
        @media screen and (max-width: 650px) {
            .art-info {
                width: 75%;
            }
        }
        @media screen and (max-width: 550px) {
            .art-info {
                width: 70%;
            }
        }
        @media screen and (max-width: 470px) {
            .art-img {
                width: 80px;
                height: 80px;
            }
            .art-meta {
                font-size: 10px;
            }
        }
        @media screen and (max-width: 400px) {
            .art-title {
                font-size: 14px;
            }
            .art-note {
                height: 24px;
                font-size: 12px;
                line-height: 24px;
            }
            .art-img {
                width: 60px;
                height: 60px;
            }
        }
    }
}
.com-icon {
    @size: 16px;
    height: @size;
    line-height: @size;
    .com-icon__pic {
        display: inline-block;
        vertical-align: middle;
        width: @size;
        height: @size;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }
    .com-icon__text {
        display: inline-block;
        height: @size;
        vertical-align: middle;
    }
    .eye-icon {
        background-image: url(../../assets/img/eye.png);
    }
    .calendar-icon {
        background-image: url(../../assets/img/calendar.png);
    }
    .reply-icon {
        background-image: url(../../assets/img/reply.png);
        position: relative;
        top: 2px;
    }
}
/* 附属信息 */

.art-meta {
    display: flex;
    align-items: center;
    font-size: 12px;
    white-space: nowrap;
	color: #202020;
	a{
		&>span{
			display:inline-box;
			padding-right:15px;
			color:#1c1f21;
		}
	}
	
}

/* 点赞 */

.heart-box {
    position: relative;
    .art-icon__text {
        padding-left: 15px;
    }
}

.heart-icon__pic {
    position: absolute;
    width: 30px !important;
    height: 35px !important;
    left: -8px;
    top: -11px;
    background-image: url(../../assets/img/zan.png);
    background-repeat: no-repeat;
    cursor: pointer;
    background-size: 3900% !important;
    background-position-x: -6px !important;
    background-position-y: -1px !important;
}

.heart-icon__text {
    padding-left: 15px !important;
}

.heart-box.act .heart-icon__pic {
    display: inline-block;
    animation-name: heartBlast;
    animation-duration: .8s;
    animation-iteration-count: 1;
    animation-timing-function: steps(28);
    background-position-x: -1136px !important;
}

// 右边栏消失，mr变为0
@media all and (max-width: 1300px) {
    #main-wrap {
        margin-right: 0;
    }
}

// 垂直模式
@media all and (max-width: 800px) {
    #main-wrap {
        margin-left: 0;
    }
    #message-box {
        padding: 0 !important;
    }
}
</style>
<style>
h2,h3{
	font-weight:normal;
}
</style>	
