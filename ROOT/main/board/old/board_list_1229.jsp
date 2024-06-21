<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.util.Date" %>
<%@ page import="java.text.*" %>

<%@ page import="goodit.common.dao.*"%>

<jsp:useBean id="stl"      class="goodit.common.dao.DBUtil"      scope="page"/>
<jsp:useBean id="str_util" class="goodit.common.util.StringUtil" scope="page"/>


<%@ include file="board_control.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");


DBUtil dbset = null;
ResultSet rs_file_list = null;



String url_context_path = "";
url_context_path = request.getRequestURL().toString();
java.net.URL urls = new  java.net.URL(url_context_path);
url_context_path = urls.getPath();
url_context_path = url_context_path.substring(0, url_context_path.lastIndexOf("/")).toString();


if(rs_inc_al.equals("1"))
{

// ------------------------------------------------------------------------------------------------------
// 변수선언
// ------------------------------------------------------------------------------------------------------

String[] b_search_type_array = {"제목", "내용", "작성자"};
String[] b_search_key_array  = {"", "", ""};


int i = 0;
String sql = "";

String secret_tag = "";
String state_tag = "";

// 첨부파일 확인
String files_img = "";
int rs_files_cnt = 0;

// 날짜 형식
SimpleDateFormat sdf = new SimpleDateFormat();
sdf.applyPattern("yyyy-MM-dd");



// Request

String req_unify_str = "";
String req_unify_str2 = "";
String req_unify_str3 = "";

String rq_cid = "";
String rq_method = "";
String rq_target = "";
String rq_idx = "";

rq_cid    = str_util.getArgsCheck(request.getParameter("cmsid"));
rq_method = str_util.getArgsCheck(request.getParameter("method"));
rq_target = str_util.getArgsCheck(request.getParameter("target"));
rq_idx    = str_util.getArgsCheck(request.getParameter("idx"));

if(rq_target == null || rq_target.equals("")) rq_target = "";

if(rq_cid == null) { rq_cid = ""; }

if("".equals(rq_cid))
{
  if (dbset != null) { dbset.close(); dbset = null; }
  
  if(stl!=null) {  stl.close();  stl = null; }

  //out.println("<div id='wrap'>입력항목에 문제가 있습니다.</div>");

  String message_url = "/main/messagebox.jbe?cmsid=" + rq_cid + "&url=/&msg=" + URLEncoder.encode("잘못된 경로에 접근하셨습니다.", "UTF-8");

  out.println("<script type=\"text/javascript\">");
  out.println("//<![CDATA[");
  out.println("document.location.href = \"" + message_url + "\";");
  out.println("//]]>");
  out.println("</script>");

  return;
}


// Record
int rs_seqid = 0;
int rs_no = 0;
int rs_bu_seqid = 0;
int rs_bref = 0;
int rs_blevel = 0;
int rs_bstep = 0;
int rs_bhit = 0;
int rs_rank = 0;

String rs_cid = "";
String rs_bclass_nm = "";
String rs_bu_name = "";
String rs_bu_email = "";
String rs_bu_pwd = "";
String rs_bsubject = "";
String rs_bcontent = "";
String rs_btag = "";
String rs_bsecret = "";
String rs_brecycle = "";
String rs_bnotice = "";

Date rs_inst_date;





// -----------------------------------------------------------------------------
// 페이징
// -----------------------------------------------------------------------------

String reqPage = "";
String reqPage_Size = "";
int pageSize = 10;
int curPage = 0;
int totPage = 0;
int lastNum = 0;

int intNumOfPage = 5;
int intStart = 0;
int intEnd = 0;

int record_count = 0;


reqPage      = str_util.getArgsCheck(request.getParameter("page"));
reqPage_Size = str_util.getArgsCheck(request.getParameter("psize"));

if(reqPage == null || reqPage.equals("")) { curPage = 1; }
else if(!str_util.isNumeric(reqPage)) curPage = 1;
else { curPage = Integer.parseInt(reqPage); }

if(reqPage_Size == null || reqPage_Size.equals("")) { pageSize = 10; }
else if(!str_util.isNumeric(reqPage_Size)) pageSize = 1;
else { pageSize = Integer.parseInt(reqPage_Size); }





// -----------------------------------------------------------------------------
// 검색
// -----------------------------------------------------------------------------
String rq_class_cd = "";
String rq_search_type = "-1";
String rq_search_key = "";
String rq_page = "";

String request_str = "";
String request_where_str = "";

rq_class_cd    = str_util.getArgsCheck(request.getParameter("cc"));
rq_page        = str_util.getArgsCheck(request.getParameter("page"));
rq_search_type = str_util.getArgsCheck(request.getParameter("st"));
rq_search_key  = str_util.getArgsCheck(request.getParameter("sk"));

if(rq_page == null || rq_page == "") rq_page = "1";
else if(!str_util.isNumeric(rq_page)) rq_page = "1";

if(rq_class_cd == null || rq_class_cd == "") rq_class_cd = "";
if(rq_search_type == null || rq_search_type == "") rq_search_type = "0";
if(rq_search_key == null || rq_search_key == "") rq_search_key = "";

request_str = "cmsid=" + rq_cid + "&amp;target=" + rq_target + "&amp;st=" + rq_search_type + "&amp;sk=" + URLEncoder.encode(rq_search_key, "UTF-8");

req_unify_str = "cmsid=" + rq_cid + "&amp;target=" + rq_target + "&amp;psize=" + pageSize + "&amp;st=" + rq_search_type + "&amp;sk=" + URLEncoder.encode(rq_search_key, "UTF-8");
req_unify_str2 = "cmsid=" + rq_cid + "&amp;target=" + rq_target + "&amp;psize=" + pageSize + "&amp;cc=" + rq_class_cd + "&amp;st=" + rq_search_type + "&amp;sk=" + URLEncoder.encode(rq_search_key, "UTF-8");
req_unify_str3 = "cmsid=" + rq_cid + "&amp;target=" + rq_target + "&amp;cc=" + rq_class_cd + "&amp;st=" + rq_search_type + "&amp;sk=" + URLEncoder.encode(rq_search_key, "UTF-8");

// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
// DB Connection
// -----------------------------------------------------------------------------
dbset = new DBUtil();



// -----------------------------------------------------------------------------
// 조건식에 의한 SQL문 만들기
// -----------------------------------------------------------------------------

// 게시글 구분
if(rs_inc_bclass.equals("1") && !rq_class_cd.equals(""))
{
  request_where_str = request_where_str + " and bclass = " + rq_class_cd + " ";
}

// 키워드 검색  
if(rq_search_type != "" && rq_search_key != "")
{
  if(rq_search_type.equals("0"))
  {
    request_where_str = request_where_str + " and bsubject like '%" + rq_search_key + "%' ";
  }
  else if(rq_search_type.equals("1"))
  {
    request_where_str = request_where_str + " and DBMS_LOB.INSTR(bcontent, '" + rq_search_key + "') > 0 ";
  }
  else if(rq_search_type.equals("2"))
  {
    request_where_str = request_where_str + " and bu_name like '%" + rq_search_key + "%' ";
  }
}
// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
// 게시글 개수
// -----------------------------------------------------------------------------

sql = "";
sql = "select count(*) from board ";
sql = sql + "where cid = '" + rq_cid + "' ";

//sql = sql + "and inst_date >= TO_DATE('2013-05-01', 'YYYY-MM-DD') ";

// 답변형 게시판
if(rs_inc_btype.equals("2")) sql = sql + "and blevel = 0 ";

// 글 작성자만 열람
if(rs_inc_bsecret_list.equals("2") && inc_admin.equals("")) sql = sql + "and bu_id = '" + inc_login_id + "' ";

// 휴지통
//if(inc_admin.equals("")) sql = sql + "and brecycle = '0' ";
sql = sql + "and brecycle = '0' ";

sql = sql + request_where_str;

//out.println(sql);
ResultSet rs_count = stl.executeQuery(sql);

if(rs_count != null)
{
  rs_count.next();
  record_count = rs_count.getInt(1);
}
rs_count.close();
rs_count = null;


totPage = ((record_count - 1) / pageSize) + 1;
lastNum = (curPage - 1) * pageSize;
// ------------------------------------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// 목록구성
// -----------------------------------------------------------------------------

sql = "";

sql = sql + "select seqid, cid, bno, bu_seqid, bu_name, bu_email, bu_pwd, bref, blevel, bstep, bsubject, bcontent, bnotice, btag, bhit, bsecret, brecycle, inst_date, rk ";

// 게시글 구분
if(rs_inc_bclass.equals("1")) { sql = sql + ", bclass, bclass_nm "; }

sql = sql + "from ( ";

sql = sql + "select rownum as rnum, b.* from ( ";

sql = sql + "select seqid, cid, bno, bu_seqid, bu_name, bu_email, bu_pwd, bref, blevel, bstep, bsubject, bcontent, bnotice, btag, bhit, bsecret, brecycle, inst_date, rank() over(order by bref asc, bstep desc) as rk ";

// 게시글 구분
if(rs_inc_bclass.equals("1")) { sql = sql + ", bclass, (select cname from board_class where seqid = a.bclass) bclass_nm "; }

sql = sql + "from board a ";

sql = sql + "where cid = '" + rq_cid + "' ";

//if(rq_cid.equals("101080101000")) sql = sql + "and inst_date >= '2012-10-01' ";
//else sql = sql + "and inst_date >= '2013-10-01' ";

//sql = sql + "and inst_date >= TO_DATE('2013-05-01', 'YYYY-MM-DD') ";


// 답변형 게시판
if(rs_inc_btype.equals("2")) sql = sql + "and blevel = 0 ";

// 글 작성자만 열람
if(rs_inc_bsecret_list.equals("2") && inc_admin.equals("")) sql = sql + "and bu_id = '" + inc_login_id + "' ";

// 휴지통
//if(inc_admin.equals("")) sql = sql + "and brecycle = '0' ";
sql = sql + "and brecycle = '0' ";

sql = sql + request_where_str;

sql = sql + " order by bnotice desc, bref desc, bstep asc ";

sql = sql + ") b ";
sql = sql + ") a ";
sql = sql + "where a.rnum > " + lastNum + " ";
sql = sql + "and a.rnum <= " + (lastNum + pageSize);


//out.println(sql);
ResultSet rs_list = stl.executeQuery(sql);
// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
// 게시글 구분
// -----------------------------------------------------------------------------
ResultSet rs_class_list = null;

if(rs_inc_bclass.equals("1")) 
{
  sql = "select seqid, cname from board_class where cid = '" + rq_cid + "' order by cseq";
  rs_class_list = stl.executeQuery(sql);
}
// -----------------------------------------------------------------------------

%>


<script type="text/javascript">
//<![CDATA[

  function fun_view(idx)
  {
    var form = document.board_form;

    form.method.value = "v";
    form.idx.value = idx;

    form.submit();
  }

  function fun_write()
  {
    var form = document.board_form;

    form.method.value = "w";
    form.idx.value = "";
    form.submit();
  }

  function fun_jump(page)
  {
    var form = document.board_form;

    form.method.value = "l";
    form.idx.value = "";
    form.page.value = page;
    form.submit();
  }

  function fun_search()
  {
    var form = document.board_form;

    form.method.value = "l";
    form.page.value = "1";
    form.idx.value = "";

    form.submit();
  }
  
  function fun_write_error()
  {
    alert("글쓰기 권한이 없습니다.");
  }

//]]>
</script>


<%
// 상위 이미지
if(rs_inc_btitle_img != null && !rs_inc_btitle_img.equals(""))
{
  out.println("<div><img src='/upload/titles/" + rs_inc_btitle_img + "' alt='" + rs_inc_btitle_img_alt + "' /></div>");
}

// 상위 타이틀 HTML
else if(rs_inc_btitle_html != null && !rs_inc_btitle_html.equals(""))
{
  out.println("<div>" + rs_inc_btitle_html + "</div>");
}


// -------------------------------------------------------------------------
// 게시글 구분
// -------------------------------------------------------------------------
int rs_class_seqid = 0;
String rs_class_name = "";

if(rs_inc_bclass.equals("1"))
{
  out.println("<div class='class_tab'>");
  out.println("<ul>");
  
  if(rq_class_cd.equals(""))
  {
    out.println("<li><a class='class_tab_on' href='board.jbe?" + req_unify_str + "'>전체</a></li>");
  }
  else
  {
    out.println("<li><a class='class_tab' href='board.jbe?" + req_unify_str + "'>전체</a></li>");
  }
  
  while(rs_class_list.next())
  {
    rs_class_seqid = rs_class_list.getInt(1);
    rs_class_name  = rs_class_list.getString(2);
    
    if(rq_class_cd.equals(rs_class_seqid+""))
    {
      out.println("<li><a class='class_tab_on' href='board.jbe?" + req_unify_str + "&amp;cc=" + rs_class_seqid + "'>" + rs_class_name + "</a></li>");
    }
    else
    {
      out.println("<li><a class='class_tab' href='board.jbe?" + req_unify_str + "&amp;cc=" + rs_class_seqid + "'>" + rs_class_name + "</a></li>");
    }
  }
  
  out.println("</ul>");
  
  rs_class_list.close();
  rs_class_list = null;
  
  out.println("</div>");
}
// -------------------------------------------------------------------------
%>
    
<div class="search_box mt_10">
		<div class="inner">
			<div class="con">

			<form name="board_form" method="post" action="board.jbe" onsubmit="return fun_search();">
				
				<fieldset class="search_area">
				<legend class="HIDE">검색</legend>
				
				<input type="hidden" name="method"    value="" />
				<input type="hidden" name="target"    value="<%=rq_target%>" />
				<input type="hidden" name="cmsid"     value="<%=rq_cid%>" />
				<input type="hidden" name="idx"       value="" />
				<input type="hidden" name="page"      value="<%=rq_page%>" />
				
				<input type="hidden" name="cc"        value="<%=rq_class_cd%>" />
				<input type="hidden" name="psize"     value="<%=pageSize%>" />
				
				<label for="st" class="HIDE">검색범위 선택</label>
				<select name="st" size="1" id="st">
					
					<%
					for(i = 0; i < b_search_type_array.length; i++)
					{
						if(rq_search_type.equals(""+i))
						{
							out.println("<option value='" + i + "' selected='selected'>" + b_search_type_array[i] + "</option>");
						}
						else
						{
							out.println("<option value='" + i + "'>" + b_search_type_array[i] + "</option>");
						}
					}
					%>
     
				</select>
     
					<label for="sk" class="HIDE">검색어</label>
					<input type="text" name="sk" id="sk" class="input" size="15" maxlength="15" value="<%=rq_search_key%>" />
     
					<button type="submit" id="search" class="s_button" title="게시글 검색"><span>검색</span></button>
					<button type="submit" id="all_view" class="s_button" title="전체게시글 보기"><span>전체보기</span></button>
				</fieldset>
			</form>

			</div>
		</div>
	</div>

	<!-- total / m-->
	<div class="basic_box mt_30">
		<div class="inner">
		
			<p class="fl board_total"><span class="red bold">Total </span><span class="bold"> <%=record_count%> </span> &nbsp;|&nbsp; <span class="colorGry01">Page </span><span> <b><%=curPage%></b> / <%=totPage%></span> </p>
			
			<div class="fr sortmenu">
 			 <%
 			 String css_page_size_str1 = "";
 			 String css_page_size_str2 = "";
 			 String css_page_size_str3 = "";
 			 
 			 if(pageSize == 10) { css_page_size_str1 = "on"; }
 			 else if(pageSize == 30) { css_page_size_str2 = "on"; }
 			 else if(pageSize == 50) { css_page_size_str3 = "on"; }
 			 
 			 out.println("<a href='board.jbe?" + req_unify_str3 + "&psize=10' class='m " + css_page_size_str1 + "'>10개</a>");
 			 out.println("<a href='board.jbe?" + req_unify_str3 + "&psize=30' class='m " + css_page_size_str2 + "'>30개</a>");
 			 out.println("<a href='board.jbe?" + req_unify_str3 + "&psize=50' class='m last " + css_page_size_str3 + "'>50개</a>");
 			 %>
			</div>

		</div>
	</div>

  <table class="basic_table tc" summary="${menu_title}의 게시물 목록을 나타내고 있습니다.">

    <caption class="HIDE">${menu_title} 목록</caption>

    <thead>

    <%
    // 답변형 게시판
    if(rs_inc_btype.equals("2"))
    {
      if(!rs_inc_bclass.equals("1"))
      {
        out.println("<tr class='first_line'>");
        out.println("  <th scope='col' class='first_cell' style='width:8%;'>번호</th>");
        out.println("  <th scope='col' style='width:45%;'>제목</th>");
        out.println("  <th scope='col' style='width:10%;'>공개</th>");
        out.println("  <th scope='col' style='width:15%;'>작성자</th>");
        out.println("  <th scope='col' style='width:12%;'>작성일</th>");
        out.println("  <th scope='col' style='width:10%;'>상태</th>");
        out.println("</tr>");
      }
      else
      {
        out.println("<tr class='first_line'>");
        out.println("  <th scope='col' class='first_cell' style='width:8%;'>번호</th>");
        out.println("  <th scope='col' style='width:8%;'>구분</th>");
        out.println("  <th scope='col' style='width:39%;'>제목</th>");
        out.println("  <th scope='col' style='width:9%;'>공개</th>");
        out.println("  <th scope='col' style='width:15%;'>작성자</th>");
        out.println("  <th scope='col' style='width:12%;'>작성일</th>");
        out.println("  <th scope='col' style='width:9%;'>상태</th>");
        out.println("</tr>");
      }
    }
    // 공지형, 일반형 게시판
    else
    {
      if(!rs_inc_bclass.equals("1"))
      {
        out.println("<tr class='first_line'>");
        out.println("  <th scope='col' class='first_cell' style='width:8%;'>번호</th>");
        out.println("  <th scope='col' style='width:45%;'>제목</th>");
        out.println("  <th scope='col' style='width:7%;'>첨부</th>");
        out.println("  <th scope='col' style='width:15%;'>작성자</th>");
        out.println("  <th scope='col' style='width:15%;'>작성일</th>");
        out.println("  <th scope='col' style='width:8%;'>조회</th>");
        out.println("</tr>");
      }
      else
      {
        out.println("<tr class='first_line'>");
        out.println("  <th scope='col' class='first_cell' style='width:8%;'>번호</th>");
        out.println("  <th scope='col' style='width:8%;'>구분</th>");
        out.println("  <th scope='col' style='width:42%;'>제목</th>");
        out.println("  <th scope='col' style='width:6%;'>첨부</th>");
        out.println("  <th scope='col' style='width:17%;'>작성자</th>");
        out.println("  <th scope='col' style='width:12%;'>작성일</th>");
        out.println("  <th scope='col' style='width:7%;'>조회</th>");
        out.println("</tr>");
      }
    }

    out.println("</thead>");

    out.println("<tbody>");

    i = 0;

    if(record_count > 0)
    {
      while(rs_list.next())
      {
        rs_seqid       = rs_list.getInt(1);
        rs_cid         = rs_list.getString(2);
        rs_no          = rs_list.getInt(3);
        rs_bu_seqid    = rs_list.getInt(4);
        rs_bu_name     = rs_list.getString(5);
        rs_bu_email    = rs_list.getString(6);
        rs_bu_pwd      = rs_list.getString(7);
        rs_bref        = rs_list.getInt(8);
        rs_blevel      = rs_list.getInt(9);
        rs_bstep       = rs_list.getInt(10);
        rs_bsubject    = rs_list.getString(11);
        rs_bnotice     = rs_list.getString(13);
        rs_btag        = rs_list.getString(14);
        rs_bhit        = rs_list.getInt(15);
        rs_bsecret     = rs_list.getString(16);
        rs_brecycle    = rs_list.getString(17);
        rs_inst_date   = rs_list.getDate(18);
        rs_rank        = rs_list.getInt(19);

        if(rs_inc_bclass.equals("1"))
        {
          rs_bclass_nm = rs_list.getString(21);
          if(rs_bclass_nm == null) { rs_bclass_nm = ""; }
        }

        if(!rs_bsubject.equals(""))
        {
          if(rs_bsubject.length() > 27) rs_bsubject = rs_bsubject.substring(0, 24) + "...";
        }

        // ---------------------------------------------------------
        // 글 공개 여부
        // ---------------------------------------------------------
        if(rs_inc_bsecret_view.equals("0")) secret_tag = "<em class='bg_mark_g2'>공개</em>";
        else if(rs_inc_bsecret_view.equals("2")) secret_tag = "<em class='bg_mark_s'>비공개</em>";
        else if(rs_inc_bsecret_view.equals("1"))
        {
          if(rs_bsecret.equals("0")) secret_tag = "<em class='bg_mark_g2'>공개</em>";
          else if(rs_bsecret.equals("1")) secret_tag = "<em class='bg_mark_s'>비공개</em>";
        }
        // ---------------------------------------------------------

        // ---------------------------------------------------------
        // 접수/답변
        // ---------------------------------------------------------
        state_tag = "<em class='colorBlu'>접수</em>";
        sql = "select count(*) from board where cid = '" + rq_cid + "' and bref = " + rs_seqid + " and blevel = 1 and bstep = 1";
        ResultSet rs_list_a = stl.executeQuery(sql);
        if(rs_list_a.next())
        {
          if(rs_list_a.getInt(1) > 0) state_tag = "<em class='colorRed'>완료</em>";
        }
        rs_list_a.close();
        // ---------------------------------------------------------------------

        // ---------------------------------------------------------------------
        // 첨부파일
        // ---------------------------------------------------------------------
        
        sql = "select fname_s from board_file where cid = ? and bseqid = ? and freg = '1' and rownum = 1 order by seqid asc ";
        
        dbset.setQuery(sql);
         
        i = 1;
        dbset.setString(i++, rq_cid);
        dbset.setInt(i++, rs_seqid);
        
        int file_pos = 0;
        String file_full = "";
        String file_ext = "";
        
        rs_file_list = dbset.executeQuery();
        
        files_img = "";
        
        while(rs_file_list.next())
        {
          file_full = rs_file_list.getString(1);

										if(file_full != null && file_full.equals(""))
									 {
												file_pos  = file_full.lastIndexOf(".");           // 확장자
												file_ext  = file_full.substring(file_pos + 1);
													
												if(file_ext.equals("hwp")) { files_img = files_img + "<img src='images/file/hwp.gif' alt='한글파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("hwp")) { files_img = files_img + "<img src='images/file/hwp.gif' alt='한글파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("pdf")) { files_img = files_img + "<img src='images/file/pdf.gif' alt='PDF파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("ppt") || file_ext.equals("pptx")) { files_img = files_img + "<img src='images/file/ppt.gif' alt='액셀파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("xls") || file_ext.equals("xlsx")) { files_img = files_img + "<img src='images/file/xls.gif' alt='액셀파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("zip") || file_ext.equals("arj") || file_ext.equals("alz") || file_ext.equals("rar") || file_ext.equals("egg ")) { files_img = files_img + "<img src='images/file/zip.gif' alt='압축파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("jpg")) { files_img = files_img + "<img src='images/file/jpg.gif' alt='이미지파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("png")) { files_img = files_img + "<img src='images/file/png.gif' alt='이미지파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("gif")) { files_img = files_img + "<img src='images/file/gif.gif' alt='이미지파일' width='16' height='16' border='0' />"; }
												else if(file_ext.equals("wmv") || file_ext.equals("mp4") || file_ext.equals("avi") || file_ext.equals("mov")) { files_img = files_img + "<img src='images/file/wmv.gif' alt='동영상파일' width='16' height='16' border='0' />"; }
												else { files_img = files_img + "<img src='images/file/file.gif' alt='첨부파일' width='15' height='15' border='0' />"; }
									 }
        }
        
        if (rs_file_list != null) { rs_file_list.close(); rs_file_list = null; }
        
        // ---------------------------------------------------------------------

        //rs_bsubject = "<a href='javascript:fun_view(" + rs_seqid + ");' alt='" + rs_bsubject + "'>" + rs_bsubject + "</a>";
        rs_bsubject = "<a href='board.jbe?" + req_unify_str2 + "&amp;method=v&amp;idx=" + rs_seqid + "&amp;page=" + rq_page + "'>" + rs_bsubject + "</a>";


        if(rs_inc_btype.equals("2"))
        {
          out.println("<tr>");

          if(rs_brecycle.equals("1")) { out.println("  <td>삭제</td>"); }
          else if(rs_bnotice.equals("1")) { out.println("  <td>공지</td>"); }
          else { out.println("  <td>" + rs_rank + "</td>"); }

          if(rs_inc_bclass.equals("1")) { out.println("  <td>" + rs_bclass_nm + "</td>"); }

          out.println("  <td class='tl'>" + rs_bsubject + "</td>");
          out.println("  <td>" + secret_tag + "</td>");
          out.println("  <td>" + rs_bu_name + "</td>");
          out.println("  <td>" + rs_inst_date + "</td>");
          out.println("  <td>" + state_tag + "</td>");
          out.println("</tr>");
        }
        else
        {
          out.println("<tr>");

          if(rs_brecycle.equals("1")) { out.println("  <td>삭제</td>"); }
          else if(rs_bnotice.equals("1")) { out.println("  <td>공지</td>"); }
          else { out.println("  <td>" + rs_rank + "</td>"); }

          if(rs_inc_bclass.equals("1")) { out.println("  <td>" + rs_bclass_nm + "</td>"); }

          out.println("  <td class='tl'>" + rs_bsubject + "</td>");
          out.println("  <td>" + files_img + "</td>");
          out.println("  <td>" + rs_bu_name + "</td>");
          out.println("  <td>" + rs_inst_date + "</td>");
          out.println("  <td>" + rs_bhit + "</td>");
          out.println("</tr>");
        }

        i++;
      }

      rs_list.close();
      rs_list = null;
    }
    else
    {
      if(rs_inc_btype.equals("2"))
      {
        if(rs_inc_bclass.equals("1")) out.println("<tr><td colspan='7'>등록된 내용이 없습니다.</td></tr>");
        else out.println("<tr><td colspan='6'>등록된 내용이 없습니다.</td></tr>");
      }
      else
      {
        if(rs_inc_bclass.equals("1")) out.println("<tr><td colspan='7'>등록된 내용이 없습니다.</td></tr>");
        else out.println("<tr><td colspan='6'>등록된 내용이 없습니다.</td></tr>");
      }
    }
    %>
    </tbody>

    </table>
    
    <%
    // 글쓰기 버튼
    if(rs_inc_aw.equals("1"))
    {
      out.println("<div class='b_button'><a href='board.jbe?" + req_unify_str2 + "&amp;method=w&amp;idx=&amp;page=1' class='typeA' >글쓰기</a></div>");
    }
    else if(session.getAttribute("session_login_id") == null)
    {
      out.println("<div class='b_button'><a href='/login/loginForm.jbe?url=/main/board.jbe?" + req_unify_str2 + "' class='typeA' >글쓰기</a></div>");
    }
    else
    {
      out.println("<div class='b_button'><a href='#msg' class='typeA' onclick='fun_write_error();'>글쓰기</a></div>");
    }
    %>

    <div class="paging_area">
			<p class="paging_nav">
			 <span class="control1">

      <%

      intStart = ((curPage - 1) / intNumOfPage) * intNumOfPage + 1;
      intEnd = (((curPage - 1) + intNumOfPage) / intNumOfPage) * intNumOfPage;

      if(totPage <= intEnd)
      {
         intEnd = totPage;
      }

      if(curPage > intNumOfPage)
      {
        // 첫페이지로
        out.println("<span class='m first'><a href='board.jbe?" + req_unify_str2 + "&amp;method=l&amp;idx=&amp;page=1' title='첫페이지 이동'><i class='ic'>맨앞</i></a></span>");

        // 이전10개페이지보여주기
        out.println("<span class='m prev'><a href='board.jbe?" + req_unify_str2 + "&amp;method=l&amp;idx=&amp;page=" + (intStart - intNumOfPage) + "' title='이전 페이지 이동'><i class='ic'>이전</i></a></span>");
      }
      else
      {
        out.println("<span class='m first'><a href='#first' title='첫페이지 이동'><i class='ic'>맨앞</i></a></span>");
        out.println("<span class='m prev'><a href='#previ' title='이전 페이지 이동'><i class='ic'>이전</i></a></span>");
      }
			out.println("</span>");
			out.println("<span class='pages'>");

      for(i = intStart; i <= intEnd; i++)
      {
        if(i == curPage)
        {
          out.println("<span class='m on'><a href='#" + i + "'>" + i + "</a></span>");
        }
        else
        {
          out.println("<span class='m'> <a href='board.jbe?" + req_unify_str2 + "&amp;method=l&amp;idx=&amp;page=" + i + "'>" + i + "</a></span>");
        }
      }
			out.println("</span>");
			out.println("<span class='control1'>");
      if(totPage > intEnd)
      {
        // 다음10개페이지로
        out.println("<span class='m next'><a href='board.jbe?" + req_unify_str2 + "&amp;method=l&amp;idx=&amp;page=" + (intEnd + 1) + "' title='다음 페이지 이동'><i class='ic'>다음</i></a></span>");

        // 마지막페이지로
        out.println("<span class='m last'><a href='board.jbe?" + req_unify_str2 + "&amp;method=l&amp;idx=&amp;page=" + totPage + "' title='마지막 페이지 이동'><i class='ic'>맨끝</i></a></span>");
      }
      else
      {
        out.println("<span class='m next'><a href='#next' title='다음 페이지 이동'><i class='ic'>다음</i></a></span>");
        out.println("<span class='m last'><a href='#last' title='마지막 페이지 이동'><i class='ic'>맨끝</i></a></span>");
      }

      %>
		</span>
    </p>
</div>


<%
}
else
{
  if(rs_inc_bsecret_list != null && (rs_inc_bsecret_list.equals("1") || rs_inc_bsecret_list.equals("2")))
  {
    out.println("<div id='wrap'>");

    if(rs_inc_blogin_img != null && !rs_inc_blogin_img.equals(""))
    {
      out.println("<div align='center'><img src='/upload/titles/" + rs_inc_blogin_img + "'  alt='" + rs_inc_blogin_img_alt + "' /></div>");
    }

    %>


    <!-- 로그인 처리 -->
    <script type="text/javascript">
    <!--

    function fun_login()
    {
     	var form = document.form_login;

     	if(form.u_id.value=="")
     	{
      		alert("\n사용자 아이디를 입력하세요");
      		form.u_id.focus();
      		return false;
     	}

     	if(form.u_passwd.value=="")
     	{
      		alert("\n비밀번호를 입력하세요");
      		form.u_passwd.focus();
      		return false;
     	}
    }

    -->
    </script>

   	<div style="width: 770px;">
   		<div class="login_form_wrap">
   			<div class="login_title">
   				<img src="board/images/login_title.jpg" width="108" height="22" alt="회원 로그인" />
   			</div>


    		<form name="form_login" action="/login/login_proc.jsp" method="post" onsubmit="return fun_login();">
    			<input type="hidden" name="url" value="<%=url_context_path%>/board.jbe?cmsid=<%=inc_rq_cid%>" />

    			<div class="login_form">
        <fieldset>
         <div class="login_input">
          <dl class="left">
           <dt><label for="u_id"><img src="board/images/login_id.jpg" width="20" height="20" alt="아이디" /></label></dt>
           <dd><input name="u_id" id="u_id" type="text"  size="15" maxlength="15" value="" /></dd>

           <dt><label for="u_passwd"><img src="board/images/login_pw.jpg" width="20" height="20" alt="패스워드" /></label></dt>
           <dd><input name="u_passwd" id="u_passwd" type="password" size="15" maxlength="15" /></dd>
          </dl>
         </div>

         <div class="btn_input">
          <input type="image" src="board/images/login_bt.jpg"  alt="로그인" />
         </div>
        </fieldset>
    			</div>
    		</form>

  				<div class="login_txt">
  				<ul>
  					<li>홈페이지를 효율적으로 이용하기 위해서 로그인이 필요합니다</li>
  					<li>로그인을 하지 않았을 경우 일부 서비스 이용에 제한을 받습니다.</li>
  				</ul>
  			</div>
  			</div>
  		</div>


    <script  type="text/javascript">
    <!--
      document.form_login.u_id.focus();
    //-->
    </script>


    <%
    //out.println("  <br/><br/>");
    //out.println("  <div align='center'>로그인이 필요 합니다.</div>");
    //out.println("  <br/><br/>");
    //out.println("  <div align='center'><a href='/login/loginForm.jbe?url=/main/board.jbe?cmsid=" + inc_rq_cid + "'>로그인(Login)</a></div>");

    out.println("</div>");

  }
  else
  {
    out.println("<script language='JavaScript'>");
    out.println("<!--");
    out.println("  alert('게시판 사용권한이 없습니다.');");
    out.println("  history.back();");
    out.println("-->");
    out.println("</script>");
  }


}


if (dbset != null) { dbset.close(); dbset = null; }

if(stl!=null)
{
  stl.close();
  stl = null;
}

%>
