<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>


<s:set name="menu_dept" value="1" /> 
<s:set name="menu_title" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].title}" />

<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1] != null}">
	<s:set name="menu_dept" value="2" />
	<s:set name="menu_title" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].title}" />
</s:if>

<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1] != null}">
	<s:set name="menu_dept" value="3" />
	<s:set name="menu_title" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].title}" />
</s:if>

<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children[m5_order_hide - 1] != null}">
	<s:set name="menu_dept" value="4" />
 <s:set name="menu_title" value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children[m5_order_hide - 1].title}" />
</s:if>


<c:set var="currentUrl"  value="${requestScope['struts.request_uri']}?${pageContext.request.queryString}" scope="request" />

<c:url var="homeUrl" value="/main/main.action" />


<p class="dimmed_bg"></p>

<div id="lnb">
 	<ul>
  		<li class="home no_child"><a href="${homeUrl}">HOME</a></li>
  		<li>
   			<a href="javascript:;">${menu.children[mm_order_hide - 1].title}</a>
   			<ul class="sub">
    				<s:iterator value="%{menu.children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
    				<li <s:if test="%{(mm_order_hide - 1)==#rowStatus.index}">class="on"</s:if>><a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
  				  </s:if>
  				  </s:iterator>
   			</ul>
  		</li>
  		
  		<s:if test="%{#menu_dept >= 1}">
  		<li>
   			<a href="javascript:;">${menu.children[mm_order_hide - 1].children[m2_order_hide - 1].title}</a>
   			<ul class="sub">
    				<s:iterator value="%{menu.children[mm_order_hide - 1].children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
  					 <li class="<s:if test="%{(m2_order_hide - 1)==#rowStatus.index}">on</s:if> <s:if test="%{children.size == 0}"></s:if>"><a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
  					 </s:if>
				    </s:iterator>
   			</ul>
  		</li>
  		
  		<s:if test="%{#menu_dept >= 2}">
  		<li>
   			<a href="javascript:;">${menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].title}</a>
   			<ul class="sub">
    				<s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
  					 <li class="<s:if test="%{(m3_order_hide - 1)==#rowStatus.index}">on</s:if> <s:if test="%{children.size == 0}"></s:if>"><a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
  					 </s:if>
				    </s:iterator>
   			</ul>
  		</li>
  		</s:if>
			 </s:if>
 	</ul>
</div>
	
<main id="main" class="sub">

<div class="sub_top">
 	<h2>${menu_title}</h2>
 	<ul class="sub_top_link">
  		<li><a href="#facebook" onclick="toSNS('facebook', '');" title="새창"><img src="images/icon/icon_facebook.jpg" alt="페이스북"/></a>
  		<li><a href="#twitter" onclick="toSNS('twitter', '')" title="새창"><img src="images/icon/icon_twitter.jpg" alt="트위터"/></a>
  		<li><a href="#print" onclick="window.print();" title="인쇄보기 바로가기[새창]"><img src="images/icon/icon_print.jpg" alt="프린트"/></a>
 	</ul>
</div>

<div id="contents">
  <div class="contents_wrap">
    
    <!-- 서브 : 3depth -->
    <!--
				<s:if test="%{m3 != '00'}">
				<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children.size > 0}">
    
    <div class="tab_cont socialwork socialwork_c01 section">
			   <ul class="tab_menu">
			     
        <s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
        
        <li <s:if test="%{(m3_order_hide-1)==#rowStatus.index}">class="on"</s:if><s:else></s:else>>
        <a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>><span>${title}</span></a>
        </li>
        
        </s:if>
        </s:iterator>
      </ul>
    </div>
    
    </s:if>
    </s:if>
    -->
    
    <!-- 서브 : 4depth -->
				<s:if test="%{m4 != '00'}">
				<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children.size > 0}">
    <div id="contenttabmenu" class="depthArea">
      <ul class="depth4">
        
        <s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
        <li><a class="<s:if test="%{(m4_order_hide-1)==#rowStatus.index}">on</s:if><s:else></s:else> <s:if test="%{#rowStatus.index==0}">first</s:if>" href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
        </s:if>
        </s:iterator>
        
      </ul>
    </div>
    </s:if>
    </s:if>
    
    <!-- 서브 : 5depth -->
  		<s:if test="%{m5 != '00'}">
  		<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children.size > 0}">
    <nav id="tabList">
		  <!-- [S] 모바일에서 .open 추가하면 탭메뉴리스트 열림 -->
 			  
 			  <a href="#" class="position">${menu_title}</a>
      <ul>
        
        <s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children[m4_order_hide - 1].children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
        <li><a class="<s:if test="%{(m5_order_hide-1)==#rowStatus.index}">on</s:if><s:else></s:else> <s:if test="%{#rowStatus.index==0}">first</s:if>" href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
        </s:if>
        </s:iterator>
        
      </ul>
    </nav>
    </s:if>
    </s:if>
    
    
    <div class="contents_html">
      
      <c:catch var="e">
        <c:import var="html_val" url="${ct_url}" charEncoding="utf-8" />
        ${html_val}
      </c:catch>
      
      <!-- 디버깅 후 삭제 -->
      <c:if test="${e != null}">
      에러 메시지 : ${e.message}
      </c:if>
      
    </div>
    
  </div>
</div>

</main>	