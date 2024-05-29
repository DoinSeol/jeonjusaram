<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>



	<p class="dimmed_bg"></p>
	
	<div id="rquick">
		<ul>
			<li class="s01"><a href="#"><strong>전주사람<br>소개</strong><p>전주시 완산구 전주객사<br>2길 12-8</p><p>전화번호 : 063) 281-0050<br>상담시간 : 09:00 ~ 18:00</p></a></li>
			<li class="s02"><a href="/main/content.action?cmsid=101010299000">후원신청</a></li>
			<li class="s03"><a href="/main/content.action?cmsid=101020100000">사업안내</a></li>
		</ul>
	</div>
	
	<main id="main">
		<div id="main_visual">
			<div class="swiper-container">
				<div class="swiper-wrapper">	
					<!-- <s:iterator value="%{imagezones}" status="rowStatus">
						<div class="swiper-slide" style="background-image:url('/upload/imagezone/${image_url_saved}');">
							<div class="txt_t01">
								<p class="t01">전주시복지재단 전주사람<span class="icon_logo"></span></p>
								<p class="t02">${title}</p>							
							</div>
						</div>
					</s:iterator> -->
					<div class="swiper-slide">
						<div class="hide">
							<h1>전주시복지재단 전주사람 후원신청 안내</h1>
							<ul>
								<li>
									<p>후원종류</p>
									<ul>
										<li>
											희망천사 : 1년 혹은 10년동안 1,004만원을 기부하는 희망파트너
										</li>
										<li>
											기부천사 : 매월 1만 1,004원을 기부하는 행복파트너 
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101010100000" alt="자세한 내용보기">
							<img src="../main/images/main/main_visual07.png" alt="">
						</a>
					</div>
					<!-- <div class="swiper-slide">
						<div class="hide">
							<h1>희망1004기부릴레이 </h1>
							<ul>
								<li>
									참여방법 
									<ul>
										<li>1,004만원 1회 기부로 함께 해 주세요. </li>
										<li>1년에 1,004천원씩 10년간 정기기부 해 주세요. </li>
										<li>매월 100,400원씩 100개월간 정기기부 해 주세요. </li>
									</ul>
								</li>
							</ul>
							<p>희망1004기부릴레이는 전주사람의 희망을 지켜주는 천사의 의미를 담아
								복지사각지대에 있는 분들이 다시 일어설 수 있도록 든든한 버팀목을 만들고자 하는 1004명의 참여로 만들어집니다. </p>
						</div>
						<a class="img" target="_blank" href="/main/program.action?cmsid=101010201000">
							<img src="../main/images/main/main_visual10.png" alt="">
						</a>
					</div> -->
					<div class="swiper-slide">
						<div class="hide">
							<h1>저소득 청소년 통학비 지원사업</h1>
							<ul>
								<li>
									참여방법 
									<ul>
										<li>대상 : 저소득가정 원거리 통학(편도 2km이상)고등학생 100명 (중위소득 100% 이하)</li>
										<li>내용 : 통학비 1인당 24만원 지원 (반기별 분할 지원)</li>
										<li>신청기관 : 동주민센터 (대상자 추천)</li>
									</ul>
								</li>
							</ul>
							<!-- <p>1년 내 100만원 이상을 일시 혹은 약정 기부하는 나눔파트너</p> -->
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020209000">
							<img src="../main/images/main/main_visual19.png" alt="저소득 청소년 통학비 지원사업">
						</a>
					</div>
					<div class="swiper-slide">
						<div class="hide">
							<h1>위기, 고립가구 일상회복 지원넷(net) 사업</h1>
							<ul>
								<li>
									참여방법 
									<ul>
										<li>대상 : '위기, 고립가구 판단도구'를 활용한 추천 대상자 (중위소득 100%이하)</li>
										<li>내용 : [의료 건강관리] 건강검진 및 상담, [식사 영양개선] 균형 영양식 제공, [주거청소 및 방역] 저장강박 청소 및 방역교육 등</li>
										<li>신청기관 : 동주민센터, 구청을 통해 상담 및 신청</li>
									</ul>
								</li>
							</ul>
							<!-- <p>1년 내 100만원 이상을 일시 혹은 약정 기부하는 나눔파트너</p> -->
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020210000">
							<img src="../main/images/main/main_visual20.png" alt="위기, 고립가구 일상회복 지원넷(net) 사업">
						</a>
					</div>
					<div class="swiper-slide">
						<div class="hide">
							<h1>전북 복지정책 조사연구사업</h1>
							<ul>
								<li>
									참여방법 
									<ul>
										<li>대상 : 전주시민</li>
										<li>
											내용 : 전주시 복지정책 수립에 필요한 기반연구와 복지서비스 개선을 위한 조사,
											연구를 통해 지역복지 현안을 파악하고, 지역발전을 위한 대안 제시
										</li>
									</ul>
								</li>
							</ul>
							<!-- <p>삼삼한챌린지는 ‘기부천사’ 한분 한분의 참여를 바탕으로 만들어지는 특별한 도전입니다. </p> -->
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020400000">
							<img src="../main/images/main/main_visual09.jpg" alt="전북 복지정책 조사연구사업">
						</a>
					</div>
					<div class="swiper-slide">
						<div class="hide">
							<h1>전주형SOS긴급지원사업</h1>
							<ul>
								<li>
									대    상 : 위기상황이 발생한 중위소득 100% 이하 저소득가구 
								</li>
								<li>
									내    용 : 생계비, 의료비, 주거비 지원 
								</li>
								<li>
									신청방법 : 동주민센터를 통해 상담 및 신청 
								</li>
							</ul>
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020201000" alt="기부신청">
							<img src="../main/images/main/main_visual08.png" alt="">
						</a>
					</div>
					<!--<div class="swiper-slide">
						<div class="hide">
							<h1>희망대출 전주사람은행</h1>
							<ul>
								<li>
									대    상 : 소액지원이 필요한 중위소득 120% 이하 저소득가구 
								</li>
								<li>
									내    용 : 개인별 목적에 따른 긴급생활안정자금 
								</li>
								<li>
									신청방법 : 재단으로 상담예약 후 방문 
								</li>
								<li>
									상담예약 : 063-281-0050
								</li>
							</ul>
						</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020202000" alt="자세히보기">
							<img src="../main/images/main/main_visual11.png" alt="">
						</a>
					</div>-->
					<div class="swiper-slide">
						<div class="hide">
						<h1>빛! 더 이상 혼자 고민하지 마세요! 전주시민의 벗, 전주시금융복지상담소</h1>
								<ul>
									<li>
										주요사업
										<ul>
											<li>가계부채 예방</li>
											<li>가계부채 관리</li>
											<li>복지서비스 연계</li>
										</ul>
									</li>
									<li>
										상담문의 : 063-281-0060
									</li>
								</ul>
							</div>
						<a class="img" target="_blank" href="/main/content.action?cmsid=101020500000" alt="오시는길">
							<img src="../main/images/main/main_visual13.png" alt="">
						</a>
					</div>									
										
						<div class="swiper-slide">
							<div class="hide">
								<h1>전주시 복지재단 전주사람 재단 소식이 궁금하세요?</h1>
								<p>좋아요, 친구맺기</p>
							</div>
							<a class="img" target="_blank" href="http://www.facebook.com/jjwf1004/" alt="페이스북 친구맺기">
								<img src="../main/images/main/main_visual12.png" alt="">
							</a>
						</div>

						<div class="swiper-slide">
							<div class="hide">
								<h1>전주시 복지재단 전주사람 인스타그램</h1>
								<p>전주시 복지재단 검색, 팔로우</p>
							</div>
							<a class="img" target="_blank" href="https://www.instagram.com/jeonju_welfare_foundation/" alt="전주시복지재단 인스타그램">
								<img src="../main/images/main/main_visual17.jpg" alt="">
							</a>
						</div>
								
				</div>
				
				<div class="swiper-button-prev-d" tabindex="0" role="button" aria-label="이전 슬라이드"></div>
				<div class="swiper-button-next-d" tabindex="0" role="button" aria-label="다음 슬라이드"></div>
				<div class="swiper-controls">
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-play" tabindex="0" role="button" aria-label="메인배너 플레이"></div>
					<div class="swiper-button-pause" tabindex="0" role="button" aria-label="메인배너 일시정지"></div>			
				</div>
				
			</div>
		</div>
		
		<!-- //main_visual -->
		<div id="section01" class="row csize">
			<div class="inwrap">
				<div id="sponsor01">
					<h2 class="mtitle">후원안내</h2>
					<div class="box">
						<div class="inbox">
							<div class="cont">
								<p><span>누구나 쉽게</span> <span>참여할 수 있는 후원!</span> <br><span>후원신청 하러 가실까요?</span></p>
								<a href="/main/content.action?cmsid=101010100000" class="btn_more01">후원안내</a>
							</div>
							<ul class="link">
								<li><a href="/main/program.action?cmsid=101010202000">정기후원</a></li>
								<li><a href="/main/program.action?cmsid=101010203000">일시후원</a></li>
								<li><a href="/main/program.action?cmsid=101010204000">현물후원</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="mbox">
					<div id="sponsor02">
						
						<h2 class="mtitle">후원현황</h2>
						<div class="box">		
							
							<div class="cont">
								
								<!-- <a href="/main/content.action?cmsid=101010100000"><strong>후원안내</strong></a> -->
								<p>여러분의 소중한 나눔이 누군가에겐 한끼가 되고, 누군가에겐 희망이 됩니다.</p>
								<!-- <a href="/main/program.action?cmsid=101010301000"><strong>후원현황</strong></a>
								<p>후원현황을 확인해 보세요.</p> -->
							</div>					
							
							<ul class="link">
								
								<li class="s02"><a href="/main/photo.action?cmsid=101010302000">희망1004<br>릴레이</a></li>
								<li class="s01"><a href="/main/photo.action?cmsid=101010303000">삼삼한<br>챌린지</a></li>
								<li class="s03"><a href="/main/photo.action?cmsid=101010304000">나눔이웃<br>나눔가게</a></li>
								<li class="s04"><a href="/main/photo.action?cmsid=101010305000">후원기업</a></li>
							</ul>
							
						</div>
					</div>
					

					<!-- //sponsor -->
					<div id="pop_zone">
						
						<h2 class="mtitle">팝업존</h2>
						
						<div class="swiper-controls">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-playpause" tabindex="0" role="button" aria-label="메인배너 플레이 일시정지"></div>		
							<div class="swiper-button-next"></div>					
						</div>
						
						<div class="swiper-container">
							<div class="swiper-wrapper">
							 
 							<s:iterator value="%{popupzones}" status="rowStatus">
   					<div class="noticeimg"></div>
   					<div class="swiper-slide"><a href="${link_url}" onclick="fun_popup_open('${link_url}','${link_target}')" <c:if test="${link_target == '_blank'}">title="${comments}[새창]"</c:if>><img src="/upload/popupzone/${image_url_saved}" alt="${comments}"></a></div>
   					</s:iterator>
   					
							</div>
						</div>
						
					</div>
					<!-- //pop_zone -->
				</div>
			</div>
		</div>
		<!-- //section01 -->
		
		<div id="section02">
			<div class="row csize">
				<ul class="tab_menu" role="tablist">
					<li class="on"><a href="" aria-controls="b_notice" aria-selected="true" role="tab">공지사항</a>
					<li><a href="" aria-controls="b_edu" aria-selected="false" role="tab">교육안내</a>
				</ul>
				
				<h2>공지사항</h2>
				<div id="b_notice" class="board on">					
					
					<s:include value="ajax/news.jsp">
					<s:param name="cmsid">101040101000</s:param>
				 </s:include>
					
					<a href="/main/board.action?cmsid=101040101000" class="t_more" title="공지사항 더보기">+ MORE</a>
				</div>
				
				<h2>교육안내</h2>
				<div id="b_edu" class="board">
					<ul class="edu_list">
						
						<s:include value="ajax/eduinfo.jsp">
					 <s:param name="cmsid">101040101000</s:param>
				  </s:include>
						
						<!--
						<li>
							<p class="img_wrap"><img src="images/main/notice_img.jpg" alt=""/></p>
							<div class="cont">
								<span class="state state_ing">접수</span>
								<a href="" class="tit">다문화 발달지도사 집합 보수교육 2차</a>
								<p class="date">2019-06-13 ~ 2019-06-15</p>
								<a href="" class="btn_more">신청하기</a>
							</div>
						</li>
						
						<li>
							<p class="img_wrap"><img src="images/main/notice_img.jpg" alt=""/></p>
							<div class="cont">
								<span class="state state_ing">접수</span>
								<a href="" class="tit">다문화 발달지도사 집합 보수교육 2차</a>
								<p class="date">2019-06-13 ~ 2019-06-15</p>
								<a href="" class="btn_more">신청하기</a>
							</div>
						</li>
						
						<li>
							<p class="img_wrap"><img src="images/main/notice_img.jpg" alt=""/></p>
							<div class="cont">
								<span class="state state_end">마감</span>
								<a href="" class="tit">다문화 발달지도사 집합 보수교육 2차</a>
								<p class="date">2019-06-13 ~ 2019-06-15</p>
								<a href="" class="btn_more">신청하기</a>
							</div>
						</li>
						-->
						
					</ul>
					
					<a href="/main/program.action?cmsid=101030100000" class="t_more" title="교육안내 더보기">+ MORE</a>
				</div>				
			</div>
		</div>
		<!-- //section02 -->
		
		<div id="section03">
			<div class="csize">
				<h2 class="mtitle">전주사람 활동</h2>
				<div id="activity_swiper">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">						
							
							<s:include value="ajax/photo.jsp">
							<s:param name="cmsid">101040102000</s:param>
						 </s:include>
						 
						 <!--
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/section03_img01.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/section03_img02.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/section03_img03.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/section03_img04.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/notice_img.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="">
									<p class="img_wrap"><img src="images/main/notice_img.jpg" alt=""/></p>
									<div class="cont">
										<p class="tit">전주시 복지재단 2019년 3월 활동</p>
										<p class="txt">주민 대피소·임시 주거시설 등 긴급 안전점검 386개소 실시</p>
									</div>
								</a>							
							</div>
							-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //section03 -->
		
		<div id="section04">
			<div class="csize">
				
				<h2 class="mtitle">복지사업안내</h2>
				<div id="welfare_swiper">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">						
							
							<div class="swiper-slide">
								<a href="/main/content.action?cmsid=101020100000">
									<p class="img_wrap_"><img src="/main/images/main/icon_welfare01.jpg" alt=""/></p>
									<div class="txt">모금<br>사업</div>
								</a>							
							</div>	
							
							<div class="swiper-slide">
								<a href="/main/content.action?cmsid=101020201000">
									<p class="img_wrap_"><img src="images/main/icon_welfare02.jpg" alt=""/></p>
									<div class="txt">복지사각지대<br>지원사업</div>
								</a>							
							</div>
							
							<div class="swiper-slide">
								<a href="/main/content.action?cmsid=101020301000">
									<p class="img_wrap_"><img src="images/main/icon_welfare03.jpg" alt=""/></p>
									<div class="txt">복지생태계<br>구축사업</div>
								</a>							
							</div>

							
							<div class="swiper-slide">
								<a href="/main/content.action?cmsid=101020400000">
									<p class="img_wrap_"><img src="images/main/icon_welfare05.jpg" alt=""/></p>
									<div class="txt">조사연구<br>사업</div>
								</a>							
							</div>

							<div class="swiper-slide">
								<a href="/main/content.action?cmsid=101020303000">
									<p class="img_wrap_"><img src="images/main/icon_welfare04.jpg" alt=""/></p>
									<div class="txt">금융복지<br> 상담사업</div>
								</a>							
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //section04 -->
		
		<div id="section05" class="csize">
			<ul class="qlink_list">
				<li class="s01">
					<a href="https://www.facebook.com/jjwf1004" target="_blank">
						<h2>Facebook</h2>
						<p>전주시 복지재단과 소통할 수<br>있는 SNS입니다.</p>
					</a>
				</li>
				<li class="s02">
					<a href="/main/board.action?cmsid=101040403000">
						<h2>복지정보</h2>
						<p>전주시의 복지정보를 확인 할 수<br>있습니다.</p>
					</a>
				</li>
				<li class="s03">
					<a href="/main/program.action?cmsid=101040401000">
						<h2>복지지도</h2>
						<p>전주시 복지시설을 확인할<br>수 있습니다.</p>
					</a>
				</li>
				<li class="s04">
					<a href="#">
						<h2>도움이 필요해요</h2>
						<p>전주시 복지재단에 도움을<br>요청하세요.</p>
					</a>
				</li>
			</ul>
		</div>
		<!-- //section05 -->
		
		<div id="section06">
			<div class="csize">
				<div id="sponsor_swiper_01">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">						
							
							<s:iterator value="%{banners}" status="rowStatus">
					  <div class="swiper-slide"><a href="${link_url}" target="${link_target}" <c:if test="${link_target == '_blank'}">title="${comments}[새창]"</c:if>><p class="img_wrap"><img src="/upload/banner/${image_url_saved}" alt="${comments}" /></p></a></div>
					  </s:iterator>
							
							<!--
							<div class="swiper-slide"><a href=""><p class="img_wrap"><img src="images/main/fban_img01.jpg" alt=""/></p></a></div>
							<div class="swiper-slide"><a href=""><p class="img_wrap"><img src="images/main/fban_img02.jpg" alt=""/></p></a></div>
							<div class="swiper-slide"><a href=""><p class="img_wrap"><img src="images/main/fban_img03.jpg" alt=""/></p></a></div>
							<div class="swiper-slide"><a href=""><p class="img_wrap"><img src="images/main/fban_img04.jpg" alt=""/></p></a></div>
							-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //section06 -->
	</main>	
	
	