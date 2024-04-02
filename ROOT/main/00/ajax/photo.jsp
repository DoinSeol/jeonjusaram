<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<jsp:useBean id="stl" class="goodit.common.dao.DBUtil" scope="page"/>
<jsp:useBean id="cropByte" class="goodit.common.domain.CropByte" scope="page" />

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

int rs_seqid = 0;
String rs_cid = "";
String rs_bsubject = "";
String rs_bsubject_short = "";
String rs_bcontent = "";
String rs_bf_name_tn = "";
String rs_inst_date = "";
int row_count = 0;

int random = (int)(Math.floor(Math.random()*2))+1;

rs_cid    = request.getParameter("cmsid");

if(rs_cid==null || rs_cid.length()!=12)
{

  if(stl!=null){ stl.close(); stl = null; }
	 out.println("입력하신 항목에 문제가 있습니다. 다시 확인하시고 시도하시기 바랍니다.!!");
	 return;
}

String sql = "";
sql = sql + " SELECT * FROM ( SELECT  temp.*, ROWNUM as rnum FROM ( ";

sql = sql + " SELECT seqid, cid, bsubject, bcontent, to_char(inst_date, 'yyyy-mm-dd') ";
sql = sql + " FROM photo ";
sql = sql + " WHERE cid=?  AND blevel=0 ";
sql = sql + " ORDER BY bref desc, bstep asc ";

sql = sql + "  ) temp ) WHERE rnum <= 5 ";

try
{
	 stl.setQuery(sql);
	 stl.setString(1, rs_cid);
	 ResultSet rs_list = stl.executeQuery();

  int cnt = 1;

  //out.println("<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>");



	 while(rs_list.next())
  {
		  row_count++;
		  rs_seqid       = rs_list.getInt(1);
		  rs_cid         = rs_list.getString(2);
    rs_bsubject    = rs_list.getString(3);
    
		  cropByte.setCutLength(28);
		  cropByte.setValue(rs_list.getString(3));
		  rs_bsubject_short 	= cropByte.getCropValue();
    
		  cropByte.setCutLength(70);
	   rs_bcontent = stl.getClobToString(rs_list, "bcontent");
    
    if(rs_bcontent != null && rs_bcontent != "")
    {
      rs_bcontent = rs_bcontent.replaceAll("\n", "<br>");
      rs_bcontent = rs_bcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
    }
		  cropByte.setValue(rs_bcontent);
		  rs_bcontent 	= cropByte.getCropValue();
    
    rs_inst_date   = rs_list.getString(5);
    
    sql = "select * from (select fname_tn from photo_file where cid = '" + rs_cid + "' and bseqid = " + rs_seqid + "  order by seqid asc) where rownum = 1 ";
    
   	//stl.setQuery(sql);
   	//stl.setString(1, rs_cid);
   	//stl.setString(2, rs_seqid);
    //out.println(sql);

   	ResultSet rs_photo = stl.executeQuery(sql);
   	if(rs_photo.next())
   	{
      rs_bf_name_tn = rs_photo.getString(1);
    }
    else
    {
      rs_bf_name_tn = "";
    }
    
    if(rs_photo!=null){ rs_photo.close(); }
    
    
    out.println("<div class='swiper-slide'>");
				out.println("	<a href=\"photo.action?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\" title='" + rs_bsubject + "'>");
				out.println("		<p class='img_wrap'><img src=\"/upload/photo/thumbnail/" + rs_bf_name_tn + "\" width='110' height='70' border='0' alt='" + rs_bsubject + "' /></p>");
				out.println("		<div class='cont'>");
				out.println("			<p class='tit'>" + rs_bsubject_short + "</p>");
				out.println("			<p class='txt'>" + rs_bcontent + "</p>");
				out.println("		</div>");
				out.println("	</a>");	
				out.println("</div>");
				
    //out.println("<div class='now_content_a01'>");
    //out.println("  <ul class='all_list'>");
    //out.println("    <li class='img'><a href=\"photo.jbe?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\"><img src=\"/upload/photo/thumbnail/" + rs_bf_name_tn + "\" width=\"100%\" height=\"100%\" border=\"0\" alt=\"" + rs_bsubject + " 사진\" /></a></li>");
    //out.println("    <li class='title'><a href=\"photo.jbe?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\">" + rs_bsubject_short + "</a></li>");
    //out.println("    <li class='list'>" + rs_bcontent + "</li>");
				//out.println("    <li class='more'><a href=\"photo.jbe?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\"><img src=\"/main/images/00/now_more.gif\" width=\"60\" height=\"17\" border=\"0\" alt=\"" + rs_bsubject + " 상세보기\" /></a></li>");
    //out.println("  </ul>");
    //out.println("</div>");
    
    cnt++;
  }

  if(rs_list!=null) { rs_list.close(); }

}
catch(Exception e)
{

}
finally
{
	 if(stl!=null)
  {
  	 stl.close();
	   stl = null;
	 }
}

if(row_count<1) out.println("<div style='width:100%; text-align:center;'>등록된 내용이 없습니다.</div>");

//out.println("<script type='text/script'> ");
//out.println("if(photonews_ctrl==null){ ");
//out.println("  photonews_ctrl = new gui.Scroller('photonews_scroll', 'photonews_content', 2000 ); ");
//out.println("  photonews_ctrl.change(" + random + "); ");
//out.println("} ");
//out.println("</script> ");


if(stl!=null)
{
  stl.close();
  stl = null;
}

%>
