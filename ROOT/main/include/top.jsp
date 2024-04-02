<%@ taglib tagdir="/WEB-INF/tags"                       prefix="tags"%>
<%@ taglib uri="/struts-tags"                           prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentUrl"  value="${requestScope['struts.request_uri']}?${pageContext.request.queryString}" scope="request" />

<c:url var="loginUrl" value="/login/loginForm.action">
  <c:param name="url">${currentUrl}</c:param>
</c:url>
<c:url var="logoutUrl" value="/login/logout.jsp">
  <c:param name="url">${currentUrl}</c:param>
</c:url>


<c:url var="homeUrl" value="/main/main.action" />








<s:if test="%{isindex==true}">

<!-- 상단 배너 -->
<s:set name="topbanner_chk">false</s:set>
<s:iterator value="%{topbanners}" status="rowStatus">
<s:if test="%{#rowStatus.count > 0}">
<s:set name="topbanner_chk">true</s:set>
</s:if>
</s:iterator>

<s:if test="#topbanner_chk == 'true'">



<div id="top_ban">
		<div class="inwrap">
 			<div class="ban_wrap">
 			  <s:iterator value="%{topbanners}" status="rowStatus">
   			  <s:if test="%{#rowStatus.index < 2}">
   			  <a href="#" onclick="fun_popup_open(${link_url},'${link_target}')" <c:if test="${link_target == '_blank'}">title="${comments}[새창]"</c:if>><img src="/upload/topbanner/${image_url_saved}" alt="${comments}" title="${title}"></a>
   			  </s:if>
   			</s:iterator>
 			</div>

 			<div class="ban_footer">
  				<form name="form_topbanner_close">
   			<input type="checkbox" name="topbanner_chk" id="closeChack" value="" /><label for="closeChack">오늘 하루 보이지 않기</label>
  				<a href="javascript:fun_topbanner_close();" id="topbanner_close" class="btn_close">닫기</a>
   			</form>
 			</div>
		</div>
</div>
</s:if>

</s:if>


<header id="header">
<script type="text/javascript">
  function fun_pc_top_search()
  {
    var form = document.pc_search_form;

    if(form.pc_sk.value == "")
    {
      alert("검색어를 입력 하세요.");
      form.pc_sk.focus();
      return false;
    }

    form.submit();
  }

  function fun_mob_top_search()
  {
    var form = document.mob_search_form;

    if(form.mob_sk.value == "")
    {
      alert("검색어를 입력 하세요.");
      form.mob_sk.focus();
      return false;
    }

    form.submit();
  }

</script>

<div id="pc_header">
 	<div class="header_top">
  		<div class="inwrap">
   			<ul class="top_util">

   				 <c:if test="${empty session.session_login_seq}">
   				 <li><a title="로그인" href="/login/loginForm.action?url=${currentUrl}">로그인</a></li>
   				 </c:if>

   				 <c:if test="${!empty session.session_login_seq}">
   				 <li><a href="#uname">${session.session_login_name}</span>님 환영합니다.</a></li>
   				 <li><a title="로그아웃" href="/login/logout.jsp?url=${currentUrl}">로그아웃</a></li>
								</c:if>

   				 <li><a href="/main/content.action?cmsid=101060200000">사이트맵</a></li>
   			</ul>
  		</div>
 	</div>

 	<div class="header_bottom">
  		<div class="inwrap">
   			<h1><a href="${homeUrl}"><img style="padding-top:35px;" src="images/common/logo2.png" alt="전주시복지재단(JEONJU WELFARE FOUNDATION) 전주사람"/></a></h1>
   			<div id="pc_search" class="all_search">
          <form name="pc_search_form" method="post" action="program.action" onsubmit="fun_pc_top_search(); return false" class="inner_box">
              <fieldset>
              <legend>통합검색</legend>
              <input type="hidden" name="method" value="">
              <input type="hidden" name="target" value="">
              <input type="hidden" name="cmsid" value="101060300000">
              <input type="hidden" name="idx" value="">
              <input type="hidden" name="page" value="1">
              <input type="hidden" name="psize" value="10">
              <label for="pc_sk"></label><input type="text" name="pc_sk" id="pc_sk" size="13" maxlength="15" value="" placeholder="검색어를 입력해주세요.">
              <input type="button" onclick="fun_pc_top_search();" class="search" value="검색"/>
              </fieldset>
          </form>
   			</div>
   			<nav id="pc_gnb">
    				<ul class="depth1">

     					<s:iterator value="%{menu.children}" status="rowStatus">
		        <s:if test="%{show == true && seq > 0}">
     					<li>
      						<a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a>

      						<s:if test="%{children.size > 0}">
      						<ul class="depth2">

      							 <s:iterator value="children" status="rowStatus">
              <s:if test="%{show == true && seq > 0}">
    							   <li <s:if test="%{children.size == 0}">class="no_child"</s:if>>
      							   <a href="${url}" <c:if test="${target == '_blank'}">class="blank"</c:if> <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a>

      							   <s:if test="%{children.size > 0}">
          						<ul class="depth3">

          							 <s:iterator value="children" status="rowStatus">
                  <s:if test="%{show == true && seq > 0}">
        							   <li <s:if test="%{children.size == 0}">class="no_child"</s:if>><a href="${url}" <c:if test="${target == '_blank'}">class="blank"</c:if> <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a></li>
          							 </s:if>
                  </s:iterator>

          						</ul>
        						  </s:if>
        						</li>
      							 </s:if>
              </s:iterator>

      						</ul>
      						</s:if>

     					</li>
     					</s:if>
 	        </s:iterator>

    				</ul>
   			</nav>
  		</div>
 	</div>
</div>
<!-- //pc_header -->


<div id="mobile_header">
 	<div class="header_top">
 		 <h1 class="logo"><a href="${homeUrl}"><img style="height:100%; padding:15px;" src="images/common/logo2.png" alt="전주사람"/></a></h1>
 		 <a href="" class="btn_menu">메뉴열기</a>
 	</div>

 	<div id="mobile_gnb">
  		<ul class="top_util">

  			<c:if test="${empty session.session_login_seq}">
				 <li><a title="로그인" href="/login/loginForm.action?url=${currentUrl}">로그인</a></li>
				 </c:if>

				 <c:if test="${!empty session.session_login_seq}">
				 <li><a href="#uname">${session.session_login_name}</span>님 환영합니다.</a></li>
				 <li><a title="로그아웃" href="/login/logout.jsp?url=${currentUrl}">로그아웃</a></li>
					</c:if>

  			<li><a href="/main/content.action?cmsid=101060200000">사이트맵</a></li>

  		</ul>

  		<div id="mobile_search" class="all_search">
          <form name="mob_search_form" method="post" action="program.action" onsubmit="fun_mob_top_search(); return false" class="inner_box">
              <fieldset>
              <legend>통합검색</legend>
              <input type="hidden" name="method" value="">
              <input type="hidden" name="target" value="">
              <input type="hidden" name="cmsid" value="101060300000">
              <input type="hidden" name="idx" value="">
              <input type="hidden" name="page" value="1">
              <input type="hidden" name="psize" value="10">
              <label for="mob_sk"></label><input type="text" name="mob_sk" id="mob_sk" size="13" maxlength="15" value="" placeholder="검색어를 입력해주세요.">
              <input type="button" onclick="fun_mob_top_search();" class="search" value="검색"/>
              </fieldset>
          </form>
  		</div>

  		<nav>
   			<ul class="depth1">

    				<s:iterator value="%{menu.children}" status="rowStatus">
        <s:if test="%{show == true && seq > 0}">
    				<li>
    					 <a href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a>

    						<s:if test="%{children.size > 0}">
     					<ul class="depth2">

      						<s:iterator value="children" status="rowStatus">
            <s:if test="%{show == true && seq > 0}">
      						<li <s:if test="%{children.size == 0}">class="no_child"</s:if>>
       							<a href="${url}" <c:if test="${target == '_blank'}">class="blank"</c:if> <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a>

       							<s:if test="%{children.size > 0}">
       							<ul class="depth3">

        								<s:iterator value="children" status="rowStatus">
                <s:if test="%{show == true && seq > 0}">
        								<li <s:if test="%{children.size == 0}">class="no_child"</s:if>><a href="${url}" <c:if test="${target == '_blank'}">class="blank"</c:if> <s:if test="%{target!=''}">target="${target}"</s:if>>${title}</a></li>
        								</s:if>
                </s:iterator>

       							</ul>
       							</s:if>
            </li>
    							 </s:if>
            </s:iterator>
     					</ul>
     					</s:if>
    				</li>
    				</s:if>
        </s:iterator>

   			</ul>
  		</nav>
 	</div>
</div>
<!-- //mobile_header -->

</header>
