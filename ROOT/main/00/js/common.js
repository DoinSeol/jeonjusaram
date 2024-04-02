/***********************************************
설  명 : 메인 공통 스크립트
개발사 : (주)좋은정보기술(www.goodit.kr)
개발자 : 김영운 yukim@goodit.kr
최 초 작성일 : 2008.11.14
마지막수정일 : 2012.08.08
*************************************************/
/* 쿠키 */
function getCookie(cookieName) {
  var cookieValue = '';
  var posName = document.cookie.indexOf(escape(cookieName) + '=');

  if (posName != -1) {
    var posValue = posName + (escape(cookieName) + '=').length;
    var endPos = document.cookie.indexOf(';', posValue);
    if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));
    else cookieValue = unescape(document.cookie.substring(posValue));
  }
  return (cookieValue);
}

function setCookie(cookieName, cookieValue, expires, path, domain, secure) {
  document.cookie =
    escape(cookieName) + '=' + escape(cookieValue)
    + (expires ? '; expires=' + expires.toGMTString() : '')
    + (path ? '; path=' + path : '')
    + (domain ? '; domain=' + domain : '')
    + (secure ? '; secure' : '');
}
/* 끝 : 쿠키 */

/* 팝업창 */
function popup_setCookie( name, value, expiredays ){ 
  var todayDate = new Date();
  todayDate.setDate( todayDate.getDate() + expiredays ); 
  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}

function popup_closewin(){
  var form = document.popup_form;
  if(form.popup_chk.checked){  
    popup_setCookie("popup_" + form.idx.value , "done", 1); // 1 = 1하루 동안 이창을 열지 않음
  } 
  self.close();
}

function openPopup(idx, l, t, w, h, type){
  if(idx==null){ return; }
  
  if(type==0){
    w = 600;
    h = 400;
  }

  if(getCookie("popup_"+idx)!= "done"){
    var url = '/popup/read.action?idx='+idx;
    h = eval(h) + 40;   
    var popup = window.open(url, 'popup_'+idx, 'left='+l+',top='+t+',width='+w+',height='+h+',toolbar=no,status=no,scrollbars=no,resizeable=no');
    if(popup==null){
      //alert("팝업창을 활성화 해주세요");
    }else{
      popup.focus();
    }
  }
}

function openDivPopup(idx, l, t, w, h, type){
  if(idx==null){ return; }
  
  if(type==0){
    w = 600;
    h = 400;
  }

  if(getCookie("popup_"+idx)!= "done"){
    var url = '/popup/read.action?idx='+idx;
    h = eval(h) + 40;   
    var newDiv = document.createElement("div");
  newDiv.sytle.css = "position:absolute;width:450px;left:160;top:160;visibility:hidden;z-index:3";
  }
}


function openVod(url){
  var w = 760;
  var h = 320;
  var l = (screen.width/2)-(w/2); 
  var t = (screen.height/2)-(h/2);

  var vodPopup = window.open(url, 'vod', 'left='+l+',top='+t+',width='+w+',height='+h+',toolbar=no,status=no,scrollbars=no,resizeable=no');
  if(vodPopup==null){
    alert("VOD를 보시려면 팝업창을 활성화 해주세요");
  }else{
    vodPopup.focus();
  }
}

function addListener(element_name, name, observer, useCapture) {
  var element;
  if(element_name=="window") {
    element = window;
  } else  if(element_name=="body") {
    element = document.body;
  } 
  else {
    element = document.getElementById(element_name); 
  }

  useCapture = useCapture || false;
  if(element.addEventListener) {
    element.addEventListener(name, observer, useCapture);
  } else {
    element.attachEvent("on"+name, observer);
  }
}


document.write("<script type='text/javascript' src='00/js/scroller.js' charset='utf-8'></script>");
document.write("<script type='text/javascript' src='00/js/scroller2.js' charset='utf-8'></script>");
document.write("<script type='text/javascript' src='00/js/scroller_img_zone.js' charset='utf-8'></script>");

var img_zone_ctrl = null;
var popupzone_ctrl = null;
var banner_ctl = null;

//var popupzone_ctl = null;
//var photonews_ctl = null;
//var rtnews_ctl = null;
//var brief_ctl = null;
//var vod_ctl = null;
//var calendar_ctl = null;
//var garden_ctl = null;

function init_scroller() 
{
  //img_zone_ctrl = new gui.Scroller('img_zone_scroll', 'img_zone_content', 2500, 'false', 'images/00/img_zone');
  //popupzone_ctrl = new gui.Scroller('popupzone_scroll', 'popupzone_content', 2500, 'false', 'images/00/popup');
  //img_zone_ctrl = new gui.Scroller('img_zone_scroll', 'img_zone_content', 3500, 'false', 'img_zone_navi');
  
  //popupzone_ctrl = new gui.Scroller('popupzone_scroll', 'popupzone_content', 2500, 'false', 'popupzone_navi');
  
  img_zone_ctrl = new gui_img_zone.Scroller_img_zone('img_zone_scroll', 'img_zone_content', 4000, 'false', 'img_zone_navi');
  popupzone_ctrl = new gui2.Scroller2('popupzone_scroll', 'popupzone_content', 3000, 'false', 'popupzone_navi');
  banner_ctl = new gui.Scroller('banner_scroll', 'banner_content', 2500);
  
  //popupzone_ctl = new gui.Scroller('popupzone_scroll', 'popupzone_content', 2500, 'false', 'images/00/popup');
  //rtnews_ctl = new gui.Scroller('rtnews_scroll', 'rtnews_content', 3000);  
  //brief_ctl = new gui.Scroller('brief_scroll', 'brief_content', 4000);  
  //photonews_ctl = new gui.Scroller('photonews_scroll', 'photonews_content', 2000 );  
  //calendar_ctl = new gui.Scroller('calendar_scroll', 'calendar_scroll_content', 1000);  
  //garden_ctl = new gui.Scroller('garden_scroll', 'garden_scroll_content', 4000);  
}

//addListener("window", "load", init_scroller);


/*자주찾는 서비스 메뉴 이벤트 */
function change_fav(num)
{
   var menu = document.getElementsByName("fav_tab");  
   
   for(var i=0; i<menu.length; i++)
   {
      var ii = padding(i+1,10);    
      var content = document.getElementById("fav_" + ii);
      
      if(i==parseInt(num-1))
      {
         menu[i].src = "images/00/left_01_tap_" + ii + "_on.gif";
         show(content);
      }
      else
      {
         menu[i].src = "images/00/left_01_tap_" + ii + "_off.gif";
         hide(content);
      }
   }
}

/*관련사이트  메뉴 이벤트 */
function change_reflink(num){
  var menu = document.getElementsByName("reflink_tab");
  for(var i=0; i<menu.length; i++){
    var ii = padding(i+1,10);
    var content = document.getElementById("reflink_" + ii);
    if(i==parseInt(num-1)){
      //menu[i].src = "00/images/01_menu" + ii + "_on.gif";
      show(content);
    }else{
      //menu[i].src = "00/images/01_menu" + ii + "_off.gif";
      hide(content);
    }
  }
}

/*팝업존  서비스 메뉴 이벤트 */
/*
var popupzone_current_num = 1;
var popupzone_mouseover = false;
function change_popupzone(num){  
  var menu = document.getElementsByName("popupzone_tab");
  if(menu==null) { return; }
  
  if(num==null || num=='') {
    if(popupzone_mouseover==false){
      num = popupzone_current_num + 1;
      num = num > menu.length ? 1:num;
    }else{      
      return;
    }
  }
  
  popupzone_current_num = parseInt(num);

  for(var i=0; i<menu.length; i++){
    var ii = padding(i+1,10);
    var content = document.getElementById("popupzone_" + ii);
    if(i==parseInt(num-1)){
      menu[i].src = "images/00/popup_icon" + "_on.gif";
      show(content);
    }else{
      menu[i].src = "images/00/popup_icon" + "_off.gif";
      hide(content);
    }
  }  
}

function set_popupzone(id, delay){
  var popupzone = document.getElementById(id);
  if(popupzone!=null){
    popupzone.onmouseover = function() { popupzone_mouseover = true; }
    popupzone.onmouseout = function() { popupzone_mouseover = false; }
    setInterval("change_popupzone()", delay);
  }
}
*/


/*이미지 변경 이벤트 */
function change_img(num, id, img, alt, type) {
  var content = document.getElementById(id);
  if(content!=null && num!=null){
    content.src = img + num + "." + type;
	content.alt = alt;	
  }  
}


/*배경 변경 이벤트 */
function change_bg(num, id, img){
  var content = document.getElementById(id);
  if(content!=null && num!=null){
    var url =  "url(" + img + num + ".jpg)";
    content.style.backgroundImage = url;
  }  
}

/*배경 변경 이벤트 */
function change_bg2(num, id, img){
  var content = document.getElementById(id);
  if(content!=null && num!=null){
    var url =  "url(" + img + num + ".gif)";
    content.style.backgroundImage = url;
  }  
}




/* 최신글, 공지사항, 공연/행사, 진안답사기 */
function change_notice(num)
{
  var menu = document.getElementsByName("notice_tab");
  
  if(menu==null || num==null) { return; }
  
  for(var i = 0; i < menu.length; i++)
  {
    var ii = padding(i+1,10);
    
    var content = document.getElementById("notice_" + ii);
    var noti_more = document.getElementById("notice_more_" + ii);
    
    if(i == parseInt(num-1))
    {
      menu[i].className = "on";
      show(content);
      show(noti_more);
    }
    else
    {
      menu[i].className = "";
      hide(content);
      hide(noti_more);
    }
  }
}


var festival_val = 1;


/* 축제 이동 : 다음 */
function change_festival_next()
{
  var festival_id = document.getElementById("festival");
  
  var menu = festival_id.getElementsByTagName("div");
  
  if(menu==null) { return; }
  
  festival_val--;
  
  if(festival_val < 1) festival_val = menu.length - 1;
  
  //alert(menu.length);
  
  for(var i = 0; i < menu.length; i++)
  {
    var festival_item = document.getElementById("festival_item_" + i);
    
    if(i == parseInt(festival_val))
    {
      show(festival_item);
    }
    else
    {
      hide(festival_item);
    }
  }
}


/* 축제 이동 : 이전 */
function change_festival_prev()
{
  var festival_id = document.getElementById("festival");
  
  var menu = festival_id.getElementsByTagName("div");
  
  if(menu==null) { return; }
  
  festival_val++;
  
  if(festival_val > (menu.length - 1)) festival_val = 1;
  
  //alert(menu.length);
  
  for(var i = 0; i < menu.length; i++)
  {
    var festival_item = document.getElementById("festival_item_" + i);
    
    if(i == parseInt(festival_val))
    {
      show(festival_item);
    }
    else
    {
      hide(festival_item);
    }
  }
}


/* 8경, 8품, 8미 */
function change_jinan_8item(num)
{
  var menu = document.getElementsByName("jinan_8item");
  
  if(menu==null || num==null) { return; }
  
  for(var i = 0; i < menu.length; i++)
  {
    var ii = padding(i+1,10);
    var jinan_8item_tab = document.getElementById("jinan_8item_tab_" + ii);
    
    
    if(i == parseInt(num - 1))
    {
      menu[i].className = "tab_on";
      show(jinan_8item_tab);
    }
    else
    {
      menu[i].className = "";
      hide(jinan_8item_tab);
    }
  }
}

/* 8경 */
function change_jinan_8item_01(num)
{
  var menu = document.getElementsByName("jinan_8item_01");
  
  if(menu==null || num==null) { return; }
  
  for(var i = 0; i < menu.length; i++)
  {
    var ii = padding(i+1,10);
    
    
    var jinan_8item_content   = document.getElementById("jinan_8item_01_content_" + ii);
    
    if(i == parseInt(num - 1))
    {
      menu[i].className = "menu_on";
      show(jinan_8item_content);
    }
    else
    {
      menu[i].className = "";
      hide(jinan_8item_content);
    }
  }
}


/* 8품 */
function change_jinan_8item_02(num)
{
  var menu = document.getElementsByName("jinan_8item_02");
  
  if(menu==null || num==null) { return; }
  
  for(var i = 0; i < menu.length; i++)
  {
    var ii = padding(i+1,10);
    
    var jinan_8item_content   = document.getElementById("jinan_8item_02_content_" + ii);
    
    if(i == parseInt(num - 1))
    {
      menu[i].className = "menu_on";
      show(jinan_8item_content);
    }
    else
    {
      menu[i].className = "";
      hide(jinan_8item_content);
    }
  }
}


/* 8미 */
function change_jinan_8item_03(num)
{
  var menu = document.getElementsByName("jinan_8item_03");
  
  if(menu==null || num==null) { return; }
  
  for(var i = 0; i < menu.length; i++)
  {
    var ii = padding(i+1,10);
    
    var jinan_8item_content   = document.getElementById("jinan_8item_03_content_" + ii);
    
    if(i == parseInt(num - 1))
    {
      menu[i].className = "menu_on";
      show(jinan_8item_content);
    }
    else
    {
      menu[i].className = "";
      hide(jinan_8item_content);
    }
  }
}


// 통합 검색
function fun_run_search() 
{
  var f = document.search_form;
  var keyword = f.q.value;
  
  if(keyword.length <= 0)
  {
    alert("\n검색어를 입력하세요.");
    f.q.focus();
    return false;
  }
  
  f.action = "/main/search.action";
  f.submit();
}


/* 자리수 채우기 */
function padding(num, max){
  var ret = num;
  if( num<max){
    ret = "0" + num;
  }
  return ret;
}

/* 객체 보이기 */
function show(obj){  
  if(obj!=null){
    obj.style.display="block";
  }
}
/* 객체 숨기기 */
function hide(obj){
  if(obj!=null){
    obj.style.display="none";
  }
}


// 관련사이트
function link_move_site01()
{
  var form=document.form_link;
  
  link_url = form.link_site01.options[form.link_site01.selectedIndex].value;
  
  if(link_url == "")
  {
    alert("\n이동할 실/과/소를 선택하세요.");
    return;
  }
  
  window.open(link_url,"","");
}

function link_move_site02()
{
  var form=document.form_link;
 
  link_url= form.link_site02.options[form.link_site02.selectedIndex].value;
  
  if(link_url == "")
  {
    alert("\n이동할 읍/면/동을 선택하세요.");
    return;
  }
  
  window.open(link_url,"","");
}

function link_move_site03()
{
  var form=document.form_link;
 
  link_url= form.link_site03.options[form.link_site03.selectedIndex].value;
  
  if(link_url == "")
  {
    alert("\n이동할 테마마을을 선택하세요.");
    return;
  }
  
  window.open(link_url,"","");
}