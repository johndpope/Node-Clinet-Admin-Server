<template>
		<section class="data_section" > 
			<main id="main-wrap">
				<section id="main-box">
						<div id="markdown-wrap" class="clear">
							<div id="markdown-main" class="markdown-main com-block">
								<!-- 文字标题 -->
								<div class="markdown-title">
									<h1>{{Article_detail.title}}</h1>
								</div>
								<!-- 文章元信息 -->
								<div class="markdown-meta">
									<!-- 文章发布时间 -->
									<time class="com-icon meta-time">
										<i class="com-icon__pic calendar-icon">&nbsp;</i>
										<span class="com-icon__text">文章元信息</span>
									</time>
									<!-- 文章点赞 -->
									<!-- <a href="javascript:;" class="com-icon heart-box art-heart art-icon {{? it.is_like }} act {{?}}" data-aid="{{=it.aid}}">
										<i class="com-icon__pic heart-icon__pic"></i>
										<span class="com-icon__text heart-icon__text">喜欢(<span class="like-num">{{=it.like_count}}</span>)</span>
									</a> -->
									<!-- 文章阅读量 -->
									<span class="com-icon meta-like">
										<i class="com-icon__pic eye-icon">&nbsp;</i>
										<span class="com-icon__text">阅读({{Article_detail.number}})</span>
									</span>
									<!-- 文章标签 -->
									<a href="" class="com-icon art-tag art-icon">
										<i class="com-icon__pic tag-icon" style="background-image: url()"></i>
										<span class="com-icon__text">文章标签</span>
									</a>
								</div>
								<!-- 文章前言 -->
								<div class="markdown-preface">{{Article_detail.summary}}</div>
								<!-- 文章封面 -->
								<!-- style="background-image:url()" -->
								<div class="markdown-cover" :style="returnBg(Article_detail.cover)"></div>
								<!-- 文章内容 -->
								<div class="markdown-content" v-html="Article_detail.content">

								</div>
								<!-- 文章评论 -->
								<!-- <div class="markdown-comment">
											asijdhasdisahdsa
											asjdsahnjdsand 
											asdjksahjdsand 
								</div> -->
							</div>
							<!-- 目录 -->
							<div class="markdown-action com-scroll">
								<div class="markdown-action-wrap">
									<div class="mb20">
										<div class="markdown-catalog com-block">
											<div class="markdown-catalog-title">
												<span class="markdown-catalog-item">目录</span>
											</div>
                                            <ul class='CatalogList'>
                                                <li v-for='(itme,index) in catalog' :key='index' :class="{'active':scroll==index}" @click='scrollEvent(index)'>
                                                    {{itme.element}}
                                                </li>
                                            </ul>   
										</div>
									</div>
									<!-- 操作 -->
									<div class="mb20">
										<div class="markdown-handler">
										<!-- 评论区 -->
										<el-badge :value="12" class="item">
											<el-button size="mini" type="primary">评论区</el-button>
										</el-badge>
										<!-- 点赞 -->
										<el-badge :value="12" class="item">
											<el-button size="mini" type="danger">喜欢</el-button>
										</el-badge>
										</div>
									</div>
								</div>
							</div>
						</div>
				</section>
			</main>
		</section>
</template>

<script>
    import { article_detail } from "@/api/article";
    export default {
    	data(){
    		return {
			    Article_detail:{},
                urlId:'',
                catalog:[],
                scroll:"0"

    		}
    	},
    	components: {
		},	
		created(){
            this.urlId=this.$route.query.id  
            
		},
    	mounted(){
            let that=this;
            this.Getarticle_detail();
            this.$nextTick(() => {
                setTimeout(() => {
                   let newarray=[]
                    $(".markdown-content h2").each((index,element)=>{
                        let json={
                            element:$(element).html(),
                            top:$(element).offset().top
                        }
                        newarray.push(json)
                    })
                    that.catalog=[...newarray] ;
                        if($('#myScrollbar')[0].scrollTop>=0&&$('#myScrollbar')[0].scrollTop<=that.catalog[0]&&that.catalog[0].top){
                            that.scroll=0
                        }
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[0]&&that.catalog[0].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[1]&&that.catalog[1].top)){
                            that.scroll=1
                        } 
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[1]&&that.catalog[1].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[2]&&that.catalog[2].top)){
                            that.scroll=2
                        }   
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[2]&&that.catalog[2].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[3]&&that.catalog[3].top)){
                            that.scroll=3
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[3]&&that.catalog[3].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[4]&&that.catalog[4].top)){
                            that.scroll=4
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[4]&&that.catalog[4].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[5]&&that.catalog[5].top)){
                            that.scroll=5
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[5]&&that.catalog[5].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[6]&&that.catalog[6].top)){
                            that.scroll=6
                        } 
                        
                    $('#myScrollbar').scroll(function(){
                       if($('#myScrollbar')[0].scrollTop>=0&&$('#myScrollbar')[0].scrollTop<=(that.catalog[0]&&that.catalog[0].top)){
                            that.scroll=0
                        }
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[0]&&that.catalog[0].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[1]&&that.catalog[1].top)){
                            that.scroll=1
                        } 
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[1]&&that.catalog[1].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[2]&&that.catalog[2].top)){
                            that.scroll=2
                        }   
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[2]&&that.catalog[2].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[3]&&that.catalog[3].top)){
                            that.scroll=3
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[3]&&that.catalog[3].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[4]&&that.catalog[4].top)){
                            that.scroll=4
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[4]&&that.catalog[4].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[5]&&that.catalog[5].top)){
                            that.scroll=5
                        }  
                        if($('#myScrollbar')[0].scrollTop>=(that.catalog[5]&&that.catalog[5].top)&&$('#myScrollbar')[0].scrollTop<=(that.catalog[6]&&that.catalog[6].top)){
                            that.scroll=6
                        }  
                    })
                }, 50);
            })
            
            
		},
    	methods: {
            returnBg(url){
                return `background-image:url(${url})` 
            },
            activeEvent(num){
                if($('#myScrollbar')[0].scrollTop>=0&&$('#myScrollbar')[0].scrollTop<=that.catalog[0].top){
                                that.scroll=0
                }
                if($('#myScrollbar')[0].scrollTop>=that.catalog[0].top&&$('#myScrollbar')[0].scrollTop<=that.catalog[1].top){
                    that.scroll=1
                } 
            },
            Getarticle_detail() {
				article_detail( this.urlId).then(res => {
					this.Article_detail=res.Data;
				})
			},
            scrollEvent(index){
                $('#myScrollbar')[0].scrollTop= (this.catalog[index].top-100)
            }
    	}
    }
</script>

<style lang="less" scoped>
.CatalogList{
    cursor:pointer;
    li{
        overflow:hidden;
        whita-space:nowrap;
        text-overflow:ellipsis;
        height:30px;
        line-height:30px;
        &.active{
            color:red;
        }
    }
}
#markdown-wrap {
	position: relative;
	padding:30px;
}
.com-block{
	box-shadow: 0 4px 8px 0 rgba(7, 17, 27, .05);
	background-color: #fff;
	border-radius: 2px;
	box-sizing: border-box;
	padding: 15px 18px;
}
/* 文章主要内容 */

#markdown-main {
    position: relative;
    width: calc(100% - 200px);
    overflow: auto;
    text-align: justify;
    padding-bottom: 0;
    top:0px;
    transition: top 0.25s;
    /* 标题 */
    .markdown-title {
        margin-bottom: 16px;
        font-size: 18px;
        text-align: center;

        h1 {
            font-weight: bold;
        }
    }

    /* 附属信息 */
    .markdown-meta {
        max-width: 320px;
        display: flex;
        justify-content: space-around;
        font-size: 12px;
        margin: 16px auto;
    }

    /* 前言 */
    .markdown-preface {
        font-size: 13.5px;
        line-height: 30px;
        text-indent: 2em;
        background-color: #f8f8f8;
        color: #666;
        padding: 12px 20px;
        border-radius: 10px;
        font-weight: bolder;
    }

    /* 封面 */
    .markdown-cover {
        position: relative;
        background-size: 100%;
        border-radius: 4px;
        overflow: hidden;
        background-position: 50%;
        background-repeat: no-repeat;
		margin-top: 20px;
		// background:url(../../assets/img/bg.jpg) no-repeat center;
		background-size:100%
    }

    /* 封面填充 */
    .markdown-cover:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }
    .markdown-cover:after {
        content: '';
        display: block;
        padding-top: 35%;
        width: 100%;
    }

    /* 覆盖markdown */
    .markdown-content {
        font-size: 16px;

        ul {
            list-style: disc;
            margin: 16px;
        }

        ol {
            margin: 16px;
        }

        p {
            margin: 16px 0;
            line-height: 3;
        }

        li {
            margin-top: 5px;
            line-height: 3;
        }

        /* 引用 */
        blockquote {
            padding: 1px 23px;
            margin: 22px 0;
            border-left: 4px solid #cbcbcb;
            background-color: #f8f8f8;
            color: #666;

            p {
                margin: 8px 0;
            }
        }

        /* 表格 */
        table {
            tr {
                background-color: #fff;
                border-top: 1px solid #eee;

                &:nth-child(2n) {
                    background-color: #f8fafc;
                }
            }

            th,
            td {
                padding: 6px 13px;
                border: 1px solid #eee;
            }
        }

        pre {
            font-size: 14px;
        }

        h1,
        h2,
        h3 {
            font-weight: bold;
            margin: 20px 0;
        }

        h1 {
            font-size: 18px;
        }

        h2 {
            font-size: 16px;
        }

        h3 {
            font-size: 14px;
        }

        h4 {
            font-size: 18px;
        }

        img {
            width: 100%;
        }

        mark {
            background-color: #3b8cff;
            color: #fff;
            padding: 3px 5px;
            border-radius: 2px;
            margin: 0 2px;
        }

        .hljs {
            line-height: 1.5;
        }

        a {
            color: #3b8cff;

            &:hover {
                color: lighten(#3b8cff, 10%);
                text-decoration: underline;
            }
        }
    }
}

/* 目录 */

.markdown-action {
    position: absolute;
    width: 200px;
    min-height: 100%;
    right: 0;
    top: 30px;
    box-sizing: border-box;
}

.markdown-action-wrap {
    position: fixed;
    width: 180px;
}

.markdown-comment {
    padding-top: 1px;
	margin-top: 10px;
	box-shadow: 0 4px 8px 0 rgba(7, 17, 27, 0.05);
	// background:red;
}

.markdown-catalog {
    width: 100%;

    .markdown-catalog-title {
        font-size: 16px;
        font-weight: bold;
        color: #1c1f21;
        text-align: center;
        margin-bottom: 16px;
        letter-spacing: 2px;

        .markdown-catalog-item {
            padding: 3px 8px;
            border-bottom: 2px solid #3b8cff;
            color: #3b8cff;
        }
    }

    .catalog-item {
        color: #1c1f21;
        margin-bottom: 5px;
    }

    .catalog-item.act {
        background-color: #f8fafc;
        color: #3b8cff;
        font-weight: bold;
    }

    .catalog-link {
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        padding: 3px 0;

        &:before {
            content: '';
            position: relative;
            display: inline-block;
            background-color: currentColor;
            border-radius: 50%;
        }
    }

    .catalog-h1 {
        font-size: 14px;

        .catalog-link:before {
            width: 7px;
            height: 7px;
            margin-right: 4px;
            top: -1px;
        }
    }

    .catalog-h2 {
        font-size: 13px;
        padding-left: 5px;

        .catalog-link:before {
            width: 6px;
            height: 6px;
            margin-right: 4px;
            top: -2px;
        }
    }

    .catalog-h3 {
        font-size: 12px;
        padding-left: 20px;

        .catalog-link:before {
            width: 5px;
            height: 5px;
            margin-right: 5px;
            top: -1px;
        }
    }
}

.markdown-handler {
	display: flex;
    flex-direction: row;
    justify-content: space-around ;
    align-items: center;
	margin-top:15px;
}

@media screen and (max-width: 1100px) {
    #markdown-box {
        height: auto;
        padding: 0 !important;
    }

    #markdown-main {
        width: 100%;
    }

    .markdown-action {
        display: none;
    }
}

@media screen and (max-width: 600px) {
    #markdown-main .markdown-title {
        font-size: 16px;
    }
}
</style>
<style>
h2,h3{
	font-weight:normal;
}
</style>	
