<template>
		<section class="wrap"> 
            <div class="posteditContent">
                <div class="post-from">
                    <el-form ref="form" :model="form" :rules="ruleValidate" label-width="80px">
                        <el-form-item label="文章标题" prop="title">
                            <el-input class="inputWidth500" v-model="form.title" size="medium" placeholder="标题..."></el-input>
                        </el-form-item>
                        <el-form-item label="E-email" prop="title">
                            <el-autocomplete class="inputWidth500" v-model="form.email" size="medium" :fetch-suggestions="handleSearch2" placeholder="敢问英雄是否愿意留下邮箱">
                                <!-- <el-option v-for="item in data2" :value="item" :key="item" >{{ item }}</el-option> -->
                            </el-autocomplete>
                        </el-form-item>  
                        <el-form-item label="文章类型" prop="title" >
                            <el-tag v-for="item in form.classify" class="marginright15" size="medium" type='' :key="item" :name="item" :disable-transitions="false" closable  @close="handleClose(item)">{{ item}}</el-tag>
                            <el-select  class="inputWidth150 marginright15" @change="selectChange" v-model="classify" size="large">
                                <el-option v-for="(item, index) in classifyList" :value="item" :key="index" :label="item"></el-option>
                            </el-select>
                            <el-input v-model="classify" placeholder="请填写文章类型" size="medium" clearable class="inputWidth150 marginright15"  @on-enter="inputChange" @on-blur="inputChange"></el-input>
                        </el-form-item>
                        <el-form-item label="封面图" prop="title">
                            <el-upload
                                class="avatar-uploader"
                                action="http://localhost:8081/api/upload"
                                :show-file-list="false"
                                :on-success="handleSuccess"
                                >
                                <img v-if="imgUrl" :src="imgUrl" class="avatar">
                                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                            </el-upload>
                        </el-form-item> 
                    </el-form>
                </div>
                <div id="main">
                        <mavon-editor ref="md" style="height: 100%"
                        v-model="content" 
                        :ishljs="true"
                        @imgAdd="imgAdd"
                        @change="articleSave"
                        > </mavon-editor>
                </div>
                <div class="submit skd-text-center">
                    <el-button type="primary" @click="handleSubmit('form')">提交</el-button>
                </div>
            </div>
		</section>
</template>

<script>
import {mavonEditor} from "mavon-editor";
import "mavon-editor/dist/css/index.css";
import { imgupload,article_add } from "@/api/article";
    export default {
    	data(){
    		return {
                content: "",
				editorOption: {
					modules: {
						toolbar: '#toolbar'
					},
					placeholder: '请输入内容...',
				},
				classifyList: ["html", "java", "html5", "Git", "svn", "javascript","程序员人生", "php", "css", "VueJS", "python", "node.js", "c++", "c objective-c", "golang", "shell", "swift", "c#", "ruby", "bash", "typescript", "sass asp.net", "less", "lua", "scala", "coffeescript", "actionscript", "erlang", "perl", "rust", "laravel", "spring", "django", "flask", "express", "ruby-on-rails", "yii", "tornado", "koa", "linux", "nginx", "apache", "docker", "ubuntu", "centos", "tomcat", "缓存 负载均衡", "unix", "hadoop", "mysql", "redis", "mongodb", "oracle", "nosql", "memcached", "sqlserver", "sqlite", "postgresql"],
				classify: '',
				imgUrl: '',
				url: "",
				showContent: false,
				data2: [],
				summary: '', //摘要
				form: {
					title: '',
					email: '',
					classify: [],
                    markdownText:"",
                    markdownHtml:''
				},
				ruleValidate: {
					title: [{
						required: true,
						message: '请填写标题！',
						trigger: 'blur'
					}]
				}
    		}
    	},
    	components: {
            mavonEditor,
		},	
		created(){
		},
    	mounted(){
		},
    	methods: {
            imgAdd(pos, file) {
            const $mavon = this.$refs.md;
            const formdata = new FormData();
            formdata.append("file", file);
            imgupload(formdata).then((res) => {
                $mavon.$img2Url(pos, `${res.realName}`);
                })
                .finally(() => {

                });
            },
            handleSuccess(res, file) {
				this.$message({
                    message: '恭喜你，这是一条成功消息',
                    type: 'success'
                });
				this.imgUrl = `http://localhost:8081${res.realName}`;
			},
			// handleFormatError(file) {
            //     this.$message({
            //         message: `你的${file.name} 请你选择 jpg ， png，jpeg`,
            //         type: 'warning'
            //     });
			// },
			// handleMaxSize(file) {
			// 	this.$Notice.warning({
			// 		title: '文件过大',
			// 		desc: '文件  ' + file.name + ' 上传文件小于 2M.'
			// 	});
			// },
			handleSubmit(name) {
				this.$refs[name].validate((valid) => {
					if(valid) {
						this.submitAreicle()
					} else {}
				})
			},
			handleSearch2(queryString,cb) {
				this.data2 = !queryString || queryString.indexOf('@') >= 0 ? [] : [
					queryString + '@qq.com',
					queryString + '@163.com',
					queryString + '@126.com',
					item + '@sina.com',
					queryString + '@gemail.com',
				];
                cb(this.data2);
			},
			handleClose(event, name) {
				let index = this.form.classify.indexOf(name);
				this.form.classify.splice(index, 1);
			},
			selectChange(value) {
				this.form.classify.push(value)
				this.classify = ''
			},
			inputChange() {
				if(!this.classify)return
				this.form.classify.push(this.classify)
				this.classify = ''
			},
            articleSave(markdownText, markdownHtml) {
                this.form.markdownText = markdownText;
                this.form.markdownHtml = markdownHtml;
            },
			submitAreicle() {
				article_add(
                    { 
						title: this.form.title,
						type: 1,
						status: 1,
						content: this.form.markdownHtml,
						eemail: this.form.email,
						cover: this.imgUrl,
						summary: this.summary,
						classify: this.form.classify.join(',')
					}
				).then(res => {
                    debugger
					if(res.code == "10000") {
						var url = `/index/details?id=${res.Data.id}` ;
						this.$router.push(url);
                        this.$message({
                            message: '添加文章成功,感谢你的支持',
                            type: 'success'
                        });
					} else {
						this.$message({
                            message: `很抱歉服务器异常`,
                            type: 'warning'
                        });
					}
				}).catch(err => {
                    this.$message({
                            message:`失误：${err}`,
                            type: 'warning'
                    });
				})
			}
    	}
    }
</script>

<style lang="less" scoped>
.wrap{
    background:#ebebeb;
    padding-bottom:250px;
}

#main{
    box-size:border-box;
    margin:50px auto 0;
    width:98%;
    height: 600px;
}
.posteditContent {
		padding: 20px;
		// background: #FFFFFF;
	}
	
	.posteditContent .ql-container {
		height: 500px !important;
	}
	
	.ql-snow .ql-tooltip {
		left: 0 !important;
	}
	
	.weButton {
		margin: 20px;
	}
	
	.inputWidth500 {
		width: 500px;
	}
	
	.showArticle {
		margin-bottom: 20px;
		padding: 10px;
		background: #fff;
	}
	
	.tadRigth {
		margin-right: 66px;
	}
	
	.w-e-text {
		padding: 0;
		overflow-y: auto;
	}
	
	.w-e-text-container {
		height: 400px !important;
	}
	
	.submit button {
		display:block;
		width:250px;
		height:45px;
		margin: 50px 0 0 20px;
		font-size:16px;
	}
	
	.inputWidth150 {
		width: 150px;
	}

</style>
<style >  
.marginright15{
    margin-right:10px;
}
 .posteditContent .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
   .posteditContent .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
   .posteditContent .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 120px;
    height: 120px;
    line-height: 120px;
    text-align: center;
  }
   .posteditContent .avatar {
    width: 120px;
    height: 120px;
    display: block;
  }
</style > 