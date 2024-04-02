/***********************************************
설  명 : 스크롤 클래스
개발사 : (주)좋은정보기술(www.goodit.kr)
개발자 : 개발팀 이호근 hglee@goodit.kr
최 초 작성일 : 2008-11-14
마지막수정일 : 2012-08-08
*************************************************/
/*
 - wrapper div에서 position: relavtie;
 - scroll div와 content div는 position: absolute;
 - delay 기본 3초(3000)
*/

var gui_img_zone = {}; // 패키지

//var start_stop = false;

gui_img_zone.Scroller_img_zone = function(container, content, delay, isScroll, naviPefix)
{
 	this.container = document.getElementById(container);
 	this.content = document.getElementById(content);
 	
 	this.content_id = content;
 	this.content_title = content + "_title";
  
 	if(this.container==null || this.content==null)
 	{	
 		 //alert("스크롤 설정을 확인하세요");	
 		 return; 
 	}	
 
 	if(delay==null || delay==''){ delay = 3000; }
 	if(isScroll==null || isScroll==''){ isScroll = true; }
  
 	this.speed = 20;                     // 숫자가 작을 수록 빠름.
 	this.delay = delay / this.speed;	
 	this.count = 0;                      // delay  카운터
 	this.intervalID = null;
 	this.rollOver = false;
  
 	this.moveOffset = this.container.offsetHeight;
 	this.currentHeight = 0;
 	this.naviPefix = naviPefix;
 	
 	this.isScroll = isScroll;
 	
 	this.cnt = 1;
 	
 	if(this.isScroll==true)
 	{
 		 this.content.innerHTML += this.content.innerHTML; //스크롤시 마지막 라인 문제 해결(더블버퍼링)
 	}
  
 	this.start(); //시작
}

gui_img_zone.Scroller_img_zone.prototype = {
	
	start : function() 
	{
 		if(this.container==null) { return;  }
 		
 		/*
 		if(start_stop) { return; }
 		else { start_stop = true; }
   */
 		
 		var me = this; // 클래스에서 setinterval 및 마우스 이벤트 사용시 문제 해결
 		
 		this.container.onmouseover = function() { me.rollOver = true; }
 		this.container.onmouseout = function() { me.rollOver = false; }		
 		
 		this.intervalID = setInterval(function(){me.move()}, this.speed);	 
 		this.ctrl_img(0);
	},
 
	end : function() 
	{			
   /*
   if(!start_stop) { return; }
 		else { start_stop = false; }
   */
   
 		if(this.intervalID) 
 		{ 
 			 clearInterval(this.intervalID);
 		 	this.intervalID = null;
 		}
 		this.ctrl_img(1);
	},

	ctrl_img : function(type) 
	{
		 var img_start = document.getElementById(this.container.id + "_start");
		 var img_end = document.getElementById(this.container.id +  "_end");
  	
  	if(img_start!=null && img_end!=null)
   {				
  			if(type==0) 
  			{
  				 //img_start.src = "images/common/btn_s_start_on.gif"
  				 //img_end.src = "images/common/btn_s_end_off.gif"
  				 
  				 img_start.src = img_start.src.replace("_on", "_off");
  				 img_end.src   = img_end.src.replace("_off", "_on");
  			}
  			else 
  			{
  				 //img_start.src = "images/common/btn_s_start_off.gif"
  				 //img_end.src = "images/common/btn_s_end_on.gif"
  				 
  				 img_start.src = img_start.src.replace("_off", "_on");
  				 img_end.src   = img_end.src.replace("_on", "_off");
  			}			
 		}
	},
	
	pause : function() 
	{
		if(this.intervalID) {
			this.end();
		} else {
			this.start();
		}
	},

	move : function()
	{
 		if(this.content==null) { return;  }
 				
 		if(this.currentHeight % this.moveOffset == 0 && this.count < this.delay )
 		{
 			 if(!this.rollOver==true) { this.count++; } 
 		}
 		
 		// 스크롤
 		else
 		{ 
  			this.count = 0;
  			
  			this.content_old = document.getElementById(this.content_id + "_" + this.cnt);
  			this.content_title_old = document.getElementById(this.content_title + "_" + this.cnt);
  			
  			if(this.content_old != null) 
  			{
  			  this.content_old.style.display = "none";
  			  this.content_title_old.style.display = "none";
  			  
  			  this.cnt++;
  			  this.content_old = document.getElementById(this.content_id + "_" + this.cnt);
  			  this.content_title_old = document.getElementById(this.content_title + "_" + this.cnt);
  			  
  			  if(this.content_old != null) 
    			{
    			  this.content_old.style.display = "block";
    			  this.content_title_old.style.display = "block";
    			}
    			else
    			{
    			  this.cnt = 1;
    			  this.content_old = document.getElementById(this.content_id + "_" + this.cnt);
    			  this.content_title_old = document.getElementById(this.content_title + "_" + this.cnt);
    			  
    			  if(this.content_old != null) 
      			{
      			  this.content_old.style.display = "block";
      			  this.content_title_old.style.display = "block";
      			}
   			 }
  			}
  			
  			this.change_navi();
  			
 		}
	},
	
	prev : function() 
	{
 		//var index =  -this.currentHeight / this.moveOffset + 1;
 		//this.change(index-1);
 		
 		this.change(this.cnt - 1);
	},
 
	next : function() 
	{
 		//var index =  -this.currentHeight / this.moveOffset + 1;
 		//this.change(index+1);
 		
 		this.change(this.cnt + 1);
	},
	
	change : function(index)
	{		
 		/*
 		var rowcount = parseInt(this.content.offsetHeight/this.container.offsetHeight);
   
 		index = parseInt(index);
 		if(index<1) {
 			index = rowcount;
 		}else if(index>rowcount){
 			index = 1;
 		}			
   
 		this.count = 0;
 		this.currentHeight = -this.moveOffset*(index-1);		
 		this.content.style.top = this.currentHeight + "px";		
 		this.change_navi();
 		*/
 		
 		
 		this.content_old = document.getElementById(this.content_id + "_" + this.cnt);
 		this.content_title_old = document.getElementById(this.content_title + "_" + this.cnt);
  	
			if(this.content_old != null)
			{
			  this.content_old.style.display = "none";
			  this.content_title_old.style.display = "none";
			}
			
			if(index < 1)
			{
			  index = 0;
			  
			  do
			  {
			    index++;
			    
			    this.content_old = document.getElementById(this.content_id + "_" + index);
			    this.content_title_old = document.getElementById(this.content_title + "_" + index);
		   } while(this.content_old != null && index <= 20)
		   
		   index--;
			}
			
	  this.content_old = document.getElementById(this.content_id + "_" + index);
	  this.content_title_old = document.getElementById(this.content_title + "_" + index);
			
	  if(this.content_old != null) 
			{
			  this.content_old.style.display = "block";
			  this.content_title_old.style.display = "block";
			  this.cnt = index;
			}
			else
			{
			  index = 1;
			  this.content_old = document.getElementById(this.content_id + "_" + index);
			  this.content_title_old = document.getElementById(this.content_title + "_" + index);
			  
			  if(this.content_old != null) 
  			{
  			  this.content_old.style.display = "block";
  			  this.content_title_old.style.display = "block";
  			  this.cnt = index;
  			}
		 }
 		
 		
 		this.change_navi();
 		
	},
	
	/* NAVI 이미지  처리 */
	change_navi : function()
	{	
 		if(this.naviPefix==null || this.naviPefix==''){ return; }		
   
   /*
 		var rowcount = parseInt(this.content.offsetHeight/this.container.offsetHeight);
 		var index =  -this.currentHeight / this.moveOffset + 1;
   
 		for(var i=1; i<=rowcount; i++)
 		{		
  			var imgSrc = document.getElementById(this.naviPefix + "_" + i);
  		 
  			if(imgSrc!=null)
  			{				
   				if(i==index)
   				{
   					 imgSrc.src = imgSrc.src.replace("_off", "_on");
   					 //imgSrc.src = this.naviPefix +  "_on.png";
   				}
   				else
   				{
   					 imgSrc.src = imgSrc.src.replace("_on", "_off");
   					 //imgSrc.src = this.naviPefix +  "_off.png";
   				}
  			}
 		}
 		*/
 		
 		for(var i = 1; i <= 20; i++)
 		{
 		  var imgSrc = document.getElementById(this.naviPefix + "_" + i);
 		  
 		  //alert(imgSrc.src);
  		 
  			if(imgSrc != null)
  			{				
   				if(i == this.cnt)
   				{
   					 imgSrc.src = imgSrc.src.replace("_off", "_on");
   				}
   				else
   				{
   					 imgSrc.src = imgSrc.src.replace("_on", "_off");
   				}
  			}
		 }
 		
 		
	}

}
