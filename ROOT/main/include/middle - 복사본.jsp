<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>



	<!-- scontainer -->
  <div id="scontainer" >

 		<!--svisual-->
        <div class="svisual">
			<div class="snb_wrap">

				<div class="subVisual">
					<div class="visual01">
						<div class="vs">
							<h2>${menu.children[mm_order_hide - 1].title}</h2>
						</div>
					</div>
				</div>



					<!-- location -->
     <tags:content_nav />

     <!--div class="navigation">
						<p class="dir">
							<span class="home">홈</span>
							<span>연구원 소개</span>
							<span>인사말</span>
							<span>3차메뉴</span>
							<span class="last">4차메뉴</span>
						</p>
					</div-->
					<!-- //location -->
			</div>
		</div>
 
		<div class="scontent_wrap">

		<!-- lnb -->
		<section id="lnb">
			<div class="lnb_wrap">
			<h2 class="slnb_tit">${menu.children[mm_order_hide - 1].title}<h2>
			
			<ul class="lm_2th">


      <!-- 서브 : 2depth -->
      <s:iterator value="%{menu.children[mm_order_hide - 1].children}" status="rowStatus">
      <s:if test="%{show == true && seq > 0}">
      
      
        <s:if test="%{(children.size > 0) && ((m2_order_hide - 1)==#rowStatus.index)}">
        <li><a href="${url}" class="<s:if test="%{(m2_order_hide - 1)==#rowStatus.index}">active</s:if>">${title}</a>
          <ul>
            
            <!-- 서브 : 3depth -->
            <s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children}" status="rowStatus">
            <s:if test="%{show == true && seq > 0}">
            
            <li><a href="${url}" <s:if test="%{(m3_order_hide - 1)==#rowStatus.index}">class="active" title="현재 페이지"</s:if> <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
            
            </s:if>
            </s:iterator>
            
          </ul>
        </s:if>
        <s:else>
        <li><a href="${url}" class="<s:if test="%{(m2_order_hide - 1)==#rowStatus.index}">active</s:if>" <s:if test="%{target!=''}">target="${target}"</s:if> <c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}</a></li>
        </li></s:else>
        
      
      
      </s:if>
      </s:iterator>

				<!--li class="first"><a href="#" class="active">인사말</a>
					<ul>
						<li><a href="#" class="active">3차메뉴</a></li>
						<li><a href="#">3차메뉴</a></li>
						<li><a href="#">3차메뉴</a></li>
						<li><a href="#">3차메뉴</a></li>
					</ul>
				</li>
				<li><a href="#">비전</a></li>
				<li><a href="#">조직</a></li>
				<li><a href="#">연혁</a></li>
				<li><a href="#">찾아오시는 길</a></li-->
			</ul>

			</div>
		</section>
		<!-- //lnb -->



		<!-- contents -->
		<div id="contents">
			
			
			<!-- //location -->


			<!-- sub contents -->
			<div class="contents_wrap">
				<section id="location"><h2 class="page_tit">${menu_title}</h2></section>

					<div class="contents_wrap" style="margin:0 auto">


						<!-- 서브 : 4depth -->
						<s:if test="%{m4 != '00'}">
							<s:if test="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children.size > 0}">
								<div class="tabMenu">
									<ul>							  
									  <s:iterator value="%{menu.children[mm_order_hide - 1].children[m2_order_hide - 1].children[m3_order_hide - 1].children}" status="rowStatus">
										  <s:if test="%{show == true && seq > 0}">
												<li class="<s:if test="%{(m4_order_hide-1)==#rowStatus.index}">_ov</s:if><s:else></s:else> <s:if test="%{#rowStatus.index==0}"></s:if>">
													<a class="link_4th" href="${url}" <s:if test="%{target!=''}">target="${target}"</s:if> 
														<c:if test="${target == '_blank'}">title="${title}[새창]"</c:if>>${title}
													</a>
												</li>
										  </s:if>
									  </s:iterator>							  
									</ul>
								</div>
							</s:if>
						</s:if>



					</div>


					<!--ul>
						<li><a href="#" class="link_4th_ov">4차메뉴</a></li>
						<li><a href="#" class="link_4th">4차메뉴</a></li>
						<li><a href="#" class="link_4th">4차메뉴</a></li>
						<li><a href="#" class="link_4th">4차메뉴</a></li>
						<li><a href="#" class="link_4th">4차메뉴</a></li>
					</ul-->




			<!--div class="page_Information">
				전통차 예절을 배우면서 한국적 정서와 올바른 사회성을 함양할 수 있습니다. 한국의 차 문화 체계적으로 교육해 우리나라 전통차 문화와 예절을 계승, 발전시킬 수 있는 지도자를 양성하는 과정입니다. 우리나라 전통차와 말차, 헌공다례 등을 실습하며 심화된 이론수업을 병행하기 때문에 자격취득 후 그 전문성을 인정받고 있습니다.
			</div>

			<h2 class="titDepth01">한국 다도사범 2급</h2-->


      <!-- 내용 -->
      <c:catch var="e">
        <c:import var="html_val" url="${ct_url}" charEncoding="utf-8" />
        ${html_val}
      </c:catch>

        <!-- 디버깅 후 삭제 -->
        <c:if test="${e != null}">
        에러 메시지 : ${e.message}
        </c:if>
      <!-- //내용 -->


			</div>
			<!-- //sub contents -->

		</div>

</div>