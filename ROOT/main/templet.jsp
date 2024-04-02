<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="/struts-tags"                           prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.util.Date" %>
<%@ page import="java.text.*" %>

<jsp:useBean id="session_ctl" class="goodit.common.session.SessionManager" scope="page"/>

<c:url var="message_url" value="/messagebox/error_messagebox.jsp">
  <c:param name="msg">잘못된 경로에 접근하셨습니다.</c:param>
  <c:param name="url">/</c:param>
</c:url>

<c:if test="${ct_url == '' || ct_url == null}">
  <c:redirect url="${message_url}" />
</c:if>


<%

// Session Hijacking 체크
if(session_ctl.checkSessionHijacking(session.getId(), request.getRemoteAddr()))
{
  response.sendRedirect("/login/loginForm.action?url=/");
}

// PC, Mobile 체크
String device_type = "";
String device_ua = request.getHeader("User-Agent").toLowerCase();

if(device_ua.matches(".*(android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino).*")||device_ua.substring(0,4).matches("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-"))
{
  device_type = "Mobile";
}
else
{
  device_type = "PC";
}

%>


<!DOCTYPE html>
<html lang="ko">

<head>
  
  <s:set name="menu_title_top" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].title}" />
  <s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1] != null}">
    <s:set name="menu_title_top" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].title}" />
  </s:if>
  <s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1] != null}">
    <s:set name="menu_title_top" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].title}" />
  </s:if>
  <s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children[m5_order_hide - 1] != null}">
    <s:set name="menu_title_top" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children[m5_order_hide - 1].title}" />
  </s:if>
  
  <c:if test="${param.stitle != null && param.stitle != ''}">
  <c:set var="menu_title_top">${menu_title_top}(${param.stitle})</c:set>
  </c:if>
  
  <c:if test="${ct_stitle_txt != null && ct_stitle_txt != ''}">
  <c:set var="menu_title_top">${menu_title_top}(${ct_stitle_txt})</c:set>
  </c:if>
  
  <title><s:if test="%{isindex==false}">${menu_title_top} - </s:if>${menu.title}</title>
  
  
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta http-equiv="Content-Type"    content="text/html; charset=utf-8" />
  <meta name="format-detection"      content="telephone=no,email=no,address=no" />
  <meta name="viewport"              content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
  <meta name="title"                 content="" />
  <meta name="description"           content="" />
  
  <meta name="author"      content="전주시복지재단 전주사람" />
  <meta name="keywords"    content="전주시복지재단 전주사람 홈페이지" />
  <meta name="description" content="전주시복지재단 전주사람" />
  <meta name="copyright"   content="Copyright(c)2019 JJWF. All Rights Reserved." />
  
  <meta name="robots"             content="index,follow">
  <meta property="og:type"        content="website">
  <meta property="og:title"       content="전주시복지재단 전주사람">
  <meta property="og:description" content="전주시복지재단 전주사람">
  <meta property="og:url"         content="http://www.jjwf.or.kr/main/main.action">
  <meta property="og:image"       content="images/open_graph.jpg">

  <link rel="canonical" href="http://www.jjwf.or.kr/main/main.action">
  
  
  
  <script type="text/javascript">
  //<![CDATA[
  
  <%if(device_type.equals("PC")) { %>
  // pc 버전에서만 로드
  document.writeln('<link rel="stylesheet" type="text/css" href="css/font/font.css" />');
  <% } %>
  
  // 공통 CSS
  document.writeln('<link rel="stylesheet" type="text/css" href="css/common.css" />');
  document.writeln('<link rel="stylesheet" type="text/css" href="css/swiper.min.css" />');
  document.writeln('<link rel="stylesheet" type="text/css" href="css/style.css" />');
  document.writeln('<link rel="stylesheet" type="text/css" href="css/layout.css" />');
  
  
  <s:if test="%{isindex == true}">
  // 메인 CSS
  document.writeln('<link rel="stylesheet" type="text/css" href="css/main.css" />');
  </s:if>
  
  <s:if test="%{isindex == false}">
  // 서브 CSS
  document.writeln('<link rel="stylesheet" type="text/css" href="css/sub.css" />');
  document.writeln('<link rel="stylesheet" type="text/css" href="css/board.css" />');
  </s:if>
  
  <s:if test="%{isindex == false && ct_type == 0}">
  // 서브 공통 CSS
  <s:if test="%{mm != null && mm != ''}">document.writeln('<link rel="stylesheet" type="text/css" href="${mm}/css/common.css" />');</s:if>
  </s:if>
  
  <s:if test="%{isindex == false && ct_css != null && ct_css != ''}">
  // 서브 CMSID 대응 CSS
  document.writeln('<link rel="stylesheet" type="text/css" href="${ct_css}" />');
  </s:if>
  
  // bxslider
  //document.writeln('<link rel="stylesheet" type="text/css" href="js/bxslider/jquery.bxslider.css" />');
  
  // jQuery UI
  document.writeln('<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">');
  
  
  //]]>
  </script>
  
  
  <!--script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script-->
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  
  <script type="text/javascript" src="js/swiper.min.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
  
  
  	 
  <!--script type="text/javascript" src="/js/common.js" charset="utf-8"></script-->
  <script type="text/javascript" src="js/common.js" charset="utf-8"></script>
  
  
  
  <!--script type="text/javascript"  charset="utf-8" src="js/bxslider/jquery.bxslider.min.js"></script-->
  
  <s:if test="%{isindex == true}">
  <script type="text/javascript" src="js/main.js" charset="utf-8"></script>	
  </s:if>
  
  <s:if test="%{ct_type == '0'}">
  <s:if test="%{mm != null && mm != ''}"><script type="text/javascript" src="${mm}/js/common.js"></script></s:if>
  </s:if>
  <s:if test="%{ct_script != null && ct_script != ''}"><script type="text/javascript" src="${ct_script}"></script></s:if>
  
  <!-- jQuery UI -->
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  
  
  
  <!--[if lte IE 9]>
 	<script type="text/javascript" src="js/html5shiv.js"></script>
 	<script type="text/javascript" src="js/respond.min.js"></script>
 	<![endif]-->
 	
 	<!--script type="text/javascript" src="js/baseJs/modernizr.custom.js"></script-->
 	<!-- IE 7 8 브라우저에서 html5&css3가 동작할 수 있게 해주는 스크립트 -->
  
  
  
  
  <script type="text/javascript">
  //<![CDATA[
  
  //var mainmenu_str = "${mm_order_hide}";
  //var mainmenu_int = parseInt(mainmenu_str);
  var mainmenu_int = ${mm_order_hide};
  
  // Sub
  if(mainmenu_int > 0 && mainmenu_int < 7) { mainmenu_int = mainmenu_int - 1; }
  // Home
  else { mainmenu_int = -1; }
  
  // 현재 메뉴
  //var top_mainmenu_num = -1; // mainmenu_int;
  var top_mainmenu_num = mainmenu_int;
  
  //var mainmenu_int = parseInt(${mm_order_hide});
  //if(mainmenu_int > 0) { mainmenu_int = mainmenu_int - 1; }
  
  // 현재 메뉴
  //var top_mainmenu_num = mainmenu_int;
  
  // 팝업
  function initLoad()
  {
    <s:iterator value="%{popups}">
    openPopup('${seqId}', '${x}', '${y}', '${width}', '${height}', '${type}');
    </s:iterator>
  }
  
  function fun_popup_open()
  {
    var length = arguments.length;
    //alert(length);
    //popup>read
    if(length == 4)
    {
       var specs = "width=" + arguments[1];
       specs += ",height=" + arguments[2];
       specs += ",scrollbars=yes";
       window.open(arguments[0],'PopUp',specs);
    }
    else if(length == 2)
    {
       window.open(arguments[0],arguments[1]);
    }
    else
    {
       return false;
    }

  }
  
  function addListener(element_name, name, observer, useCapture) 
  {
    var element;
    
    if(element_name=="window") 
    {
      element = window;
    }
    else  if(element_name=="body")
    {
      element = document.body;
    } 
    else
    {
      element = document.getElementById(element_name); 
    }
  
    useCapture = useCapture || false;
    
    if(element.addEventListener) 
    {
      element.addEventListener(name, observer, useCapture);
    }
    else
    {
      element.attachEvent("on"+name, observer);
    }
  }
  
  addListener("window", "load", initLoad);





  
  
  
  
  $(document).ready(function()
  {
    // 상단배너 Open
    if($.cookie("jjwf_topbanner") != "done" && $(window).width() >= 1200)
    {
      //$('#top_ban').show();
      //$("#top_ban").css("display", "block");
      $('#top_ban').slideDown('fast');
    }
    else
    {
      $('#top_ban').css('display','none');
    }
    
    
    // 상단배너 Close
    //$('#topbanner_close').click(function()
    //{
    //  if(document.form_topbanner_close.topbanner_chk.checked)
    //  {
    //    // 하루 동안 쿠키 값 유지
    //    $.cookie("jjwf_topbanner", "done", {expires:1, path:'/'});
    //  }
    //  $('#top_ban').slideUp('slow');
    //});
  });
  
  // 상단배너 닫기 버튼
  function fun_topbanner_close()
  {
    if(document.form_topbanner_close.topbanner_chk.checked)
    {
      // 하루 동안 쿠키 값 유지
      $.cookie("jjwf_topbanner", "done", {expires:1, path:'/'});
    }
    $('#top_ban').slideUp('slow');
  }
  
  
  //]]>
  </script>
  
  
</head>


<%if(device_type.equals("PC")) { %>
<!-- PC 버전에서만 로드 -->
<body class="pc">
<% } else { %>
<!-- Mobile 버전에서만 로드 -->
<body class="mobile">
<% } %>


<!-- wrap -->
<div id="wrap">
  
  <!-- skip_nav -->
  <a href="#main" id="skip_nav">본문바로가기</a>
  <!-- //skip_nav -->
  
  
  
  <c:import var="top_html_val" url="include/top.jsp" charEncoding="utf-8" />
		${top_html_val}
  
  <!-- Middle -->
  <s:if test="%{isindex==true}">
    
    <c:import var="html_val" url="${ct_url}" charEncoding="utf-8" />
		  ${html_val}
    
  </s:if>
  
  <s:else>
    
    <s:if test="%{ct_layout_submenu == 1}">
      
      <c:import var="html_val" url="${ct_url}" charEncoding="utf-8" />
		    ${html_val}
      
    </s:if>
    
    <s:else>
    
      <c:import var="middle_html_val" url="include/middle.jsp" charEncoding="utf-8" />
      ${middle_html_val}
      
    </s:else>
    
  </s:else>
  
  <!-- Bottom -->
	 <c:import var="bottom_html_val" url="include/bottom.jsp" charEncoding="utf-8" />
  ${bottom_html_val}
  
</div>

</body>

</html>
