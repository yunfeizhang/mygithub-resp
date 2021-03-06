<%@page import="com.yichu.ad.entity.ZiXun"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pub/appcfg.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

  
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,user-scalable=no">
		<link href="${WebAppRoot}/css/bds.css" rel="stylesheet" type="text/css">
		<!-- <link href="http://mini.eastday.com/dcminisite/css/static.css" rel="stylesheet" type="text/css"> -->
		<script src="http://www.vjuad.com/plugin/jquery-1.6.4.min.js"></script>
		<script src="http://cdn.bootcss.com/handlebars.js/4.0.5/handlebars.min.js"></script>
		<title>${ziXun.title}</title>
		<style type="text/css">
			body{
				margin:0;
				padding: 0;
			}
			.navibar{
				width: 100%;
				border:0px;
				border-spacing: 0px;
			}
			.navibar-item{
				text-align: center;
				background-color: #FF5B2A;
				color: #fff;
				height: 40px;
				line-height: 40px;
				font-size: 18px;
			}
			.navibar-item:active{
				background-color: #F00;
			}
			.navibar-item-active{
				background-color: #F00;
			}
			
			#load-more{
				width:200px;
				margin:10px auto;
				height: 36px;
				line-height: 36px;
				text-align: center;
				background-color: #fff;
				cursor: pointer;
				font-weight: bold;
				color:#77B2F5;
				border-radius:36px;
				border:1px solid #77B2F5;
			}
			#load-more:active{
				background-color: antiquewhite;
			}
				
			#ad_ul{
				margin: 0px;
  				padding-left: 0px;
			}
			#ad_ul li{
				list-style-type: none;
			}
			li{
				-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
				-webkit-user-select: none;
				/* background-color: rgb(234, 235, 237); */
				border-bottom-color: rgb(196, 196, 196);
				border-bottom-style: solid;
				border-bottom-width: 1px;
				border-top-color: rgb(247, 247, 247);
				border-top-style: solid;
				border-top-width: 1px;
				display: block;
				font-family: 'Microsoft Yahei', Simsun;
			}
			a{
				text-decoration: none;
			}
			body{
				margin: 0;
				font-family: "微软雅黑";
			}
			#ad_ul img{
				border: 0px;
				margin-right: 5px;
				margin-left: 5px;
  				border-radius: 0px;
			}
			.title{
				  font-size: 15px;
  				  color: #333;
  				  font-weight: bold;
			}
			.zhaiyao{
				-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
				-webkit-user-select: none;
				color: rgb(153, 153, 153);
				cursor: auto;
				display: block;
				font-family: 'Microsoft Yahei', Simsun;
				font-size: 15px;
				list-style-image: none;
				list-style-position: outside;
				list-style-type: none;
				text-align: left;
				text-overflow: ellipsis;
				overflow-x: hidden;
			}
			.desc{
				vertical-align: top;
				
			}
			.title{
				margin-top: 0px;
			}
			.myhidden{
				display: none;
			}
			.copyrignt{
				-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
				-webkit-user-select: none;
				color: rgb(102, 102, 102);
				display: block;
				font-family: 'Microsoft Yahei', Simsun;
				font-size: 12px;
				height: 36px;
				line-height: 18px;
				margin-bottom: 0px;
				margin-left: 5px;
				margin-right: 5px;
				margin-top: 5px;
				padding-bottom: 4px;
				padding-left: 0px;
				padding-right: 0px;
				padding-top: 4px;
				text-align: center;
			}
			
			#titlebar{
				overflow: hidden;
				border-spacing: 0px;
				border: 0px;
			}
			
			#return-back{
				display: inline-block;
				height: 50px;
				line-height: 50px;
				padding-left: 5px;
				padding-right: 5px;
				cursor: pointer;
			}
			
			#return-back:active{
				background-color: #F00;
			}
			#main-title{
				box-flex: 1;
				overflow-x: hidden;
				overflow-y: hidden;
				display: inline-block;
				height:50px;
				overflow:-webkit-marquee;
				-webkit-marquee-style:scroll;
				-webkit-marquee-style:scroll;
			}
			#share-bottom{
				display: inline-block;
				height: 50px;
				cursor:pointer;
				line-height: 50px;
				padding-right: 5px;
				padding-left: 5px;
			}
			
			#share-bottom:active{
				background-color: #F00;
			}
			
			#share-bottom img{
				display: inline-block;
				height: 50px;
			}
			#current-ad{
				margin-left: 8px;
				margin-right: 8px;
			}
			#current-ad *{
				max-width: 100% !important;
				overflow: hidden;
			}
			#current-ad img{
				max-width: 98% !important;
			}
			
			.bdsharebuttonbox a{
				
			}
			
			figure{
				display:block;
				-webkit-margin-before:1em;
				-webkit-margin-after:1em;
				-webkit-margin-start:0;
				-webkit-margin-end:0;
			}
		</style>
		</div>
		
		<script type="text/javascript">
			//-------------------
			(function(vjuad, window, document) {
				
				/**
				 * 定义加载对象
				 */
				if(vjuad.ad!=null || vjuad.ad!=undefined){
					if(console && console.warn){
						console.warn("vjuad.ad对象已经存在,下面将覆盖定义");
					}
				}
				vjuad.ad = {
					"rate":1,
					"ad":"${ad}",
					"timer":null
				};
				
				
				/**
				 * 获取客户端信息
				 */
				vjuad.ad.getDeviceInfo = function() {
					var ua  = navigator.userAgent||"ua",
						ref = navigator.referrer||"ref",
						url = location.url||"url",
						plt = navigator.platform||"plt",
						awid= screen.availWidth||"awid",
						ahei= screen.availHeight||"ahei";
					
					var info = ua+"_"+ref+"_"+url+"_"+plt+"_"+awid+"_"+ahei;
					return info;
				};
				
				/**
				 * 加载广告
				 */
				vjuad.ad.loadAd = function(){
					var czx = sessionStorage.getItem("czx20160203");
					var ad  = "${ad}";
					if((czx==null || czx==undefined) && ad.length>0 ){//存在广告信息并且还没访问过广告，就加载
						$("#pop-bottom").slideDown(2000,null,function(){});
					}
				};
				
				/**
				 * 关闭广告
				 */
				vjuad.ad.hideAd = function(callback){
					event.preventDefault();
					event.stopPropagation();
					$("#pop-bottom").slideUp(600,null,function(){
						
					});
				};
				
				/**
				 * 误点击
				 */
				vjuad.ad.wudianji = function(){
			     	var ad = "${ad}";
					if(Math.random()<=vjuad.ad.rate && ad.length>0){
						sessionStorage.setItem("czx20160203","123");
						//打开广告点击
						var adurl = WebAppRoot+"/api/ad_display.action?app=yc&adid="+ad+"&cellphone=13168376146&equipid=e586";
						window.location.href = adurl;
					}else{
						//隐藏
						vjuad.ad.hideAd();
					}
					
				};
				
				vjuad.ad.gotoOpen = function(){
					var ad = "${ad}";
					var top2 = document.querySelector('#fixed-middle').getBoundingClientRect().top;
					var h2 =screen.availHeight*0.5   ;
					var adurl = WebAppRoot+"/api/ad_display.action?app=yc&adid="+ad+"&cellphone=13168376146&equipid=e586";
					
					var ra = 200 ;
					/*if(h2>0 && h2<270){
						ra = h2-70;
					}*/
					if( top2>0 && top2 < ra ){//h2-70
						//alert("top2="+ top2 +" , ra= "+ ra + ", screen.availHeight"+screen.availHeight);
						window.location.href=adurl;
					}else{
						console.info('已经过时了')
					}
				};
				
				vjuad.ad.getQueryString = function(name)
				{
				     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				     var r = window.location.search.substr(1).match(reg);
				     if(r!=null)return  unescape(r[2]); return null;
				}
				
				
		
			})(window.vjuad = {}, window, document);
	
			$(function(){
				vjuad.ad.loadAd();
				var hasBind = false;
				$(window).scroll(function(){
					var middleAD = document.querySelector("#fixed-middle").getBoundingClientRect();
				    var h = screen.availHeight*0.5;
				    if(!hasBind && middleAD.top>=0 && middleAD.top<=(h-middleAD.height)){
				        if(!hasBind){
				        	var has = sessionStorage.getItem(vjuad.ad.getQueryString("n")||"123");
				        	var ad = vjuad.ad.ad||"";
				        	if(ad.length<1){
				        		return false;
				        	}
				        	if(has==null || has==undefined){
				        		/* vjuad.ad.timer = window.setTimeout("var top2 = document.querySelector('#fixed-middle').getBoundingClientRect().top; var h2 =screen.availHeight*0.5   ;console.info(top2);console.info(h2); if( top2>0 && top2< h2 ){window.location.href='"+adurl+"'}else{console.info('已经过时了')}",2000);
				        		 */
				        		//try{window.clearTimeout(vjuad.ad.timer);}catch(ed){};
				        		vjuad.ad.timer = window.setTimeout("vjuad.ad.gotoOpen()",2000);
				        		hasBind = true;	
					        	sessionStorage.setItem(vjuad.ad.getQueryString("n")||"123","s");
				        	}
				        }
				    }
				});
			});
			
			//-------------------
			var showLoadding = function(){
				$("#loading").show();
			};
			var closeLoadding = function(){
				$("#loading").hide();
			};
			var page = 1;
			
			var loadMoreDatas = function(){
				$.ajax({
		            type: "GET",
		            url: "api/zx_moreTuiJian.action",
		            data: {"page":page,"size":5,"n":"${param.n}"},
		            dataType: "json",
		            beforeSend: function(){
						// Handle the beforeSend event
						showLoadding();
					},
					complete: function(){
						// Handle the complete event
						closeLoadding();
					},
		            success: function(data){
		             	if(typeof (data)=='string'){
		             		data = JSON.parse(data);	
		             	}
		             	if(data.code==200 && data.data && data.data.length>0){
		             		var source   = $("#ad-li-template1").html();
							var template = Handlebars.compile(source);
	                        $('#ad_ul').append(template(data));
	                        page = page +1;
		             	}
		            },
		            error: function(data){
		             		
		            }
		        });
			};
			
			//图片加载失败
			function nofind(){
				var img=event.srcElement;
				img.src="http://www.vjuad.com/images/logo.png";
				img.onerror=null; //控制不要一直跳动
			};
			
			$(function(){
				//$("#main-title").width($("#titlebar").width()-$("#return-back").width()-$("#titlebar-right").width()-15);
				Handlebars.registerHelper('formatUrl', function(n, options){
					  //api/zx_hot.action
			          return "zx_show.action?n="+n;
			    });
				loadMoreDatas();
				$("#load-more").click(function(){
					loadMoreDatas();
				});
				$("#titlebar-right").click(function(){
					$(".bdshare-slide-button")[0].click();
				});
				$("#return-back").click(function(){	
					window.location.href=WebAppRoot+"/api/zx_hot.action";
					/* if(window.history.length>1){
						window.history.back();
					}else{
						window.location.href=WebAppRoot+"/api/zx_hot.action";
					} */
				});
				
				//对文中区域中的图片进行加载失败的处理
				var $imgs =  $("#current-ad").find("img");
				if($imgs){
					$imgs.each(function(){
						$(this).attr("onerror","nofind()");
					});
				}
				
				//检测当前的历史记录是否为空。如果是，那么压入一个列表页数据
				//alert(window.history.length);
				/* if(window.history.length<1){
					window.history.back();
				}else{
					window.location.href=WebAppRoot+"/api/zx_hot.action";
				} */
				//alert(navigator.userAgent)
				
				if(navigator.userAgent.indexOf(" QQ")>0 && navigator.userAgent.indexOf("MQQBrowser")>0){//QQ客户端内置浏览器
					//$("#titlebar").hide();
					//alert($("#titlebar").height()+"px");
					//document.body.scrollTop=52;
					//alert(document.body.scrollTop);
				}
				
				if(navigator.userAgent.indexOf("MicroMessenger")>0 && navigator.userAgent.indexOf("MQQBrowser")>0){//QQ客户端内置浏览器
					//$("#titlebar").hide();
					//document.body.scrollTop=52;
					//document.body.scrollTop=$("#titlebar").height();
				}
				
			});
		</script>
	</head>

	<body>
		<!--
        	时间：2016-01-05
        	描述：flexbox布局才可以~~
        -->
        <table  id="titlebar" style="width:100%; height: 50px;line-height: 50px;background:#e75634; font-family:微软雅黑; font-size:16px; color:#FFF; ">
        	<tr>
        		<td style="width:90px;">
					<span style="float:left;" id="return-back">&lt&lt返回</span>
        		</td>
        		<td style="text-align:center;">
					<span id="main-title" style="display:block;">娱乐八卦</span>
        		</td>
        		<td style="width:90px;">
					<span id="titlebar-right" style="visibility: hidden;float:right;display:inline-block;padding-top:10px;padding-bottom:10px;padding-left:5px;padding-right:5px;" id="share-bottom">
						<img src="http://www.vjuad.com/vju_data/attached/icon/share.png" style="border:0;height:30px;border:0px;line-height:30px;" alt="分享"/>
					</span>
        		</td>
        	</tr>
        </table>
		<!-- <div id="titlebar" style="height: 50px;line-height: 50px;background:#e75634;text-align:center; font-family:微软雅黑; font-size:16px; color:#FFF; ">
	  	</div> -->
	  
		<!-- 当前展示的资讯-->
		<div id="current-ad">
			
			<!-- 标题-->
			<div id="current-ad-title" style="margin-top:10px;">
				${ziXun.title}
			</div>
			
			<!-- 日期和来源 -->
			<div style="margin-top:10px;margin-bottom: 10px;">
				<span><fmt:formatDate value="${ziXun.creation}" pattern="yyyy-MM-dd HH:mm"/></span>
				<span>来源：${ziXun.author}</span>
			</div>
			
			<!-- 如果摘要和标题一样。就不显示了 -->
			<c:choose>
				<c:when test="${not ziXun.title eq ziXun.summary}">
					<div>
						${ziXun.summary}
					</div>
				</c:when>
			</c:choose>
			
			<!-- banner -->
			<div style="">
				
			</div>
			
			
			<!-- 正文 -->
			<div style="">
				${ziXun.content}
			</div>
			
		</div>
		
		<!-- 原文链接 -->
		<div style="display: none;">
			<a href='${ziXun.url}' style="height:40px;line-height:40px;">原文链接</a>
		</div>
		
		<!-- 随机广告 -->
		<!-- <div id="fixed-middle-marked" style="height:1px;visibility:hidden;"></div> -->
		<div id="fixed-middle" class="shake shake-hard"  onclick="try{vjuad.ad.wudianji();}catch(e){}"  style="text-align: center;">
			
			<!-- <img onloadeddata="" style="border: 0;max-width: 90%;min-height:50px;display:inline-block;margin: 10px auto;" src="http://image1.900.la/imgs/1060f501-e6d4-4816-84f3-9e4a875b5bde/2016-02-05/cdtn42mf.gif" onerror="" alt=""/>
			 -->
			 <c:if test="${765 eq ziXun.id}"><!-- 信用卡 -->
				<img onloadeddata="" style="border: 0;max-width: 90%;min-height:50px;display:inline-block;margin: 10px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/credit.gif" onerror="" alt=""/>
			</c:if>
			<c:if test="${764 eq ziXun.id}"><!-- 减肥 -->
				<img onloadeddata="" style="border: 0;max-width: 90%;min-height:50px;display:inline-block;margin: 10px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/ss.gif" onerror="" alt=""/>
			</c:if>
			<c:if test="${763 eq ziXun.id}"><!-- 丰胸 -->
				<img onloadeddata="" style="border: 0;max-width: 90%;min-height:50px;display:inline-block;margin: 10px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/fenxiong.gif" onerror="" alt=""/>
			</c:if>
			<c:if test="${763 gt ziXun.id}"><!-- 默认的 -->
				<img onloadeddata="" style="border: 0;max-width: 90%;min-height:50px;display:inline-block;margin: 10px auto;" src="http://image1.900.la/imgs/1060f501-e6d4-4816-84f3-9e4a875b5bde/2016-02-05/cdtn42mf.gif" onerror="" alt=""/>
			</c:if>
			
		</div><!-- 随机广告 -->
		
		<!-- 百度分享组件 开始-->
		<style type="text/css">
			.bdsharebuttonbox a { width: 60px!important; height: 60px!important; margin: 0 auto 10px!important; float: none!important; padding: 0!important; display: block; }
			.bdsharebuttonbox a img { width: 60px; height: 60px; }
			.bdsharebuttonbox .bds_tsina { background: url(${WebAppRoot}/images/gbRes_6.png) no-repeat center center/60px 60px; }
			.bdsharebuttonbox .bds_qzone { background: url(${WebAppRoot}/images/gbRes_4.png) no-repeat center center/60px 60px; }
			.bdsharebuttonbox .bds_tqq { background: url(${WebAppRoot}/images/gbRes_5.png) no-repeat center center/60px 60px; }
			.bdsharebuttonbox .bds_weixin { background: url(${WebAppRoot}/images/gbRes_2.png) no-repeat center center/60px 60px; }
			.bdsharebuttonbox .bds_sqq { background: url(${WebAppRoot}/images/gbRes_3.png) no-repeat center center/60px 60px; }
			.bdsharebuttonbox .bds_renren { background: url(${WebAppRoot}/images/gbRes_1.png) no-repeat center center/60px 60px; }
			.bd_weixin_popup .bd_weixin_popup_foot { position: relative; top: -12px; }
			.gb_resItms li{
				border-bottom-style: none;
			}
		</style>
		
		<div class="gb_resLay">
		  <div class="gb_res_t"><span>分享到</span><i></i></div>
		  <div class="bdsharebuttonbox">
		    <ul class="gb_resItms">
		      <li> <a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>微信好友 </li>
		      <li> <a title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>QQ好友 </li>
		      <li> <a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>QQ空间 </li>
		      <!-- <li> <a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>腾讯微博 </li>
		      <li> <a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>新浪微博 </li>
		      <li> <a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren" data-url="http://www.internetke.com/material/img/2013/1026/26.html"></a>人人网 </li> -->
		    </ul>
		  </div>
		</div>
		<script type="text/javascript">
		        //全局变量，动态的文章ID
		        var ShareURL = "";
		        //绑定所有分享按钮所在A标签的鼠标移入事件，从而获取动态ID
		        $(function () {
		            $(".bdsharebuttonbox a").mouseover(function () {
		                ShareURL = $(this).attr("data-url");
		            });
		        });
		
		        /* 
		        * 动态设置百度分享URL的函数,具体参数
		        * cmd为分享目标id,此id指的是插件中分析按钮的ID
		        *，我们自己的文章ID要通过全局变量获取
		        * config为当前设置，返回值为更新后的设置。
		        */
		        function SetShareUrl(cmd, config) {
		        	ShareURL = WebAppRoot+'/api/zx_show.action?n=${param.n}';
		            if (ShareURL) {
		                config.bdUrl = ShareURL;    
		            }
		            return config;
		        }
		
		        //插件的配置部分，注意要记得设置onBeforeClick事件，主要用于获取动态的文章ID
		        //"tsina":"11","tqq":"22","t163":"33","tsohu":"44"
		        var pic = "${ziXun.pics}"||"http://www.vjuad.com/images/logo.png";
		        
		        String.prototype.replaceAll = function(s1,s2){
	        	　　return this.replace(new RegExp(s1,"gm"),s2);
	        	};
		        
		        var bdDesc = "${ziXun.title}";
		        	bdDesc = bdDesc.replace(new RegExp("'","gm")," ");
		        var bdText = "${ziXun.summary}";
		        	bdText = bdText.replace(new RegExp("'","gm")," ");
		        window._bd_share_config = {
		            "common": {
		                onBeforeClick: SetShareUrl, 
		                "bdSnsKey": {}, 
		                "bdDesc": bdDesc,
		                "bdText": bdText,
		                "bdMini": "2",
		                "bdMiniList": false,
		                "bdPic": pic,
		                "bdStyle": "0",
		                "bdSize": "24"
		            }, "share": {}
		        };
		        //插件的JS加载部分
		        with (document) 0[(getElementsByTagName('head')[0] || body)
		            .appendChild(createElement('script'))
		            .src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='
		            + ~(-new Date() / 36e5)];
		</script> 
		<div style="clear:both;height:0; overflow:hidden; visibility:hidden;"></div>
		</div>
		<!-- 百度分享组件 结束-->
		
		<!-- 分割线 -->
		<hr style="border:1px solid;border-style:dashed;width:97%;"/>
		<!-- 精彩评论 -->
		<div style="">
			
		</div>
		
		<!-- 相关推荐 -->
		<div style="border-bottom:1px solid #C4C4C4;height:40px;line-height:40px;padding-left:8px;">
			大家都在看
		</div>
		
		<!--  -->
		<div style="">
			
			<!--
	        	作者：877894710@qq.com
	        	时间：2016-01-05
	        	描述：
	        -->
	        <div id="loading" style="display: none;width:80px;height:80px;margin:0 auto;z-index: 2;position: fixed;left: 50%;top:50%;margin-left: -40px;">
	        	<img src="http://www.vjuad.com/vju_data/attached/image/20150922/loading.gif" alt="加载中···" style="border: 0;width: 80px;height:80px;margin:0 auto;"/>
	        </div>
	        
			<!--列表-->
			<div class="adlist">
			    <ul id="ad_ul">
			    
				</ul>
				
				<div id="load-more">
					加载更多			
				</div>
			
			</div>
			<footer>
			    <p class="copyrignt">
			    	Copyright©广州泛舟信息科技有限公司 2015-2016 All rights reserved&nbsp;|&nbsp;粤ICP备15047528号
			    </p>
			</footer>
		</div>
		
		<!-- 广告 -->
		<div id="pop-bottom" onclick="try{vjuad.ad.wudianji();}catch(e){}" style=";position: fixed;bottom: 0;left: 0;right: 0;display: none;padding:0px 0px 20px 0px;border: 0px solid;background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjcyQTkwOTkwQ0EyMjExRTU4OUIxODVBMzhFOTU1MTQ5IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjcyQTkwOTkxQ0EyMjExRTU4OUIxODVBMzhFOTU1MTQ5Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NzJBOTA5OEVDQTIyMTFFNTg5QjE4NUEzOEU5NTUxNDkiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzJBOTA5OEZDQTIyMTFFNTg5QjE4NUEzOEU5NTUxNDkiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5tUB80AAAAD0lEQVR42mJgYGBoAAgwAACFAIHr1UyZAAAAAElFTkSuQmCC');">
			<div>
				<span style="float:right;padding: 5px 20px 5px 20px;color: white;cursor: pointer;font-family: '微软雅黑';" onclick="try{vjuad.ad.wudianji();}catch(e){$('#pop-bottom').slideUp()}">
					关闭
				</span>
				<div style="clear: both;"></div>
			</div>
			<div style="text-align: center;">
				<!-- http://www.vjuad.com/vju_data/attached/image/20160202/yaoyiyao.jpg -->
				<!-- <img style="border: 0;height:50px;max-width: 90%;display:inline-block;margin: 5px auto;" src="http://image1.900.la/imgs/1060f501-e6d4-4816-84f3-9e4a875b5bde/2016-02-05/cdtn42mf.gif" onerror="" alt=""/>
				 -->
				<c:if test="${765 eq ziXun.id}"><!-- 信用卡 -->
					<img style="border: 0;height:50px;max-width: 90%;display:inline-block;margin: 5px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/credit.gif" onerror="" alt=""/>
				</c:if>
				<c:if test="${764 eq ziXun.id}"><!-- 减肥 -->
					<img style="border: 0;height:50px;max-width: 90%;display:inline-block;margin: 5px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/ss.gif" onerror="" alt=""/>
				</c:if>
				<c:if test="${763 eq ziXun.id}"><!-- 丰胸 -->
					<img style="border: 0;height:50px;max-width: 90%;display:inline-block;margin: 5px auto;" src="http://www.vjuad.com/vju_data/attached/image/20160222/fenxiong.gif" onerror="" alt=""/>
				</c:if>
				<c:if test="${763 gt ziXun.id}"><!-- 默认的 -->
					<img style="border: 0;height:50px;max-width: 90%;display:inline-block;margin: 5px auto;" src="http://image1.900.la/imgs/1060f501-e6d4-4816-84f3-9e4a875b5bde/2016-02-05/cdtn42mf.gif" onerror="" alt=""/>
				</c:if>
			</div>
		</div><!-- 广告 -->
		
	</body>
	
	<!--
    	时间：2016-01-05
    	描述：定义模板文件
    -->
    <script id="ad-li-template1" type="text/x-handlebars-template">
    	{{#each data}}
    	<li>
    		<a class="detail_btn" href="{{formatUrl n}}">
	    		<table>
	        		<tr>
	        			<td rowspan="2">
	        				<img src="{{pic}}" width="80" height="80"  onerror="nofind()">
	        			</td>
	        			<td vertical="top">
	        				<p class="title">{{{title}}}</p>
	        			</td>
	             	</tr>
	        		<tr>
	        			<td vertical="bottom">
	             			<div class="zhaiyao">{{publish}}&nbsp;&nbsp;&nbsp;&nbsp;{{author}}</div> 
	        			</td>
	             	</tr>
	         	</table>
	    	</a>
	    </li>
	    {{/each}}
	</script>
</html>
