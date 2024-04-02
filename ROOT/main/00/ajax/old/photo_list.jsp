<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<jsp:useBean id="stl" class="goodit.common.dao.DBUtil" scope="page"/>
<jsp:useBean id="cropByte" class="goodit.common.domain.CropByte" scope="page" />

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

int rs_seqid = 0;
String rq_cid = "";
String rs_cid = "";
String rs_cc = "";
String rs_bsubject = "";
String rs_bsubject_short = "";
String rs_bcontent = "";
String rs_bf_name_tn = "";
String rs_inst_date = "";
int row_count = 0;

int random = (int)(Math.floor(Math.random()*2))+1;


rq_cid    = request.getParameter("cmsid");
//rs_cc    = request.getParameter("cc");

String rq_menu = "";
rq_menu    = request.getParameter("menu");


String sql_str = "";
String flag_str = "";
String flag_name = "";
String domain_str = "";
/*
if(rq_menu.equals("1"))
{
  sql_str = "blevel = 0 AND ((cid = '101060200000' AND bclass = '21') or (cid = '103060200000' AND bclass = '15') or (cid = '104050200000' AND bclass = '11'))";
}
else if(rq_menu.equals("2"))
{
  sql_str = "blevel = 0 AND ((cid = '101060200000' AND bclass = '22') or (cid = '102050200000' AND bclass = '18') or (cid = '103060200000' AND bclass = '16') or (cid = '104050200000' AND bclass = '12'))";
}
else if(rq_menu.equals("3"))
{
  sql_str = "blevel = 0 AND ((cid = '101060200000' AND bclass = '23') or (cid = '103080000000') or (cid = '104050200000' AND bclass = '13'))";
}
else if(rq_menu.equals("4"))
{
  sql_str = "blevel = 0 AND ((cid = '101060200000' AND bclass = '24') or (cid = '102050200000' AND bclass = '25') or (cid = '103060200000' AND bclass = '17') or (cid = '104050200000' AND bclass = '14'))";
}
*/


/*if(rs_cid==null || rs_cid.length()!=12)
{

  if(stl!=null){ stl.close(); stl = null; }
	 out.println("입력하신 항목에 문제가 있습니다. 다시 확인하시고 시도하시기 바랍니다.!!");
	 return;
}
*/

String sql = "";
sql = sql + " SELECT * FROM ( SELECT  temp.*, ROWNUM as rnum FROM ( ";

sql = sql + " SELECT seqid, cid, bsubject, bcontent, to_char(inst_date, 'yyyy-mm-dd') ";
sql = sql + " FROM td0101 ";
sql = sql + " WHERE seqid > 0 " + sql_str;
sql = sql + " ORDER BY bref desc, bstep asc ";

sql = sql + "  ) temp ) WHERE rnum <= 10 ";

try
{
	 ResultSet rs_list = stl.executeQuery(sql);

  int cnt = 1;

  //out.println("<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>");



	 while(rs_list.next())
  {
		  row_count++;
		  rs_seqid       = rs_list.getInt(1);
		  rs_cid         = rs_list.getString(2);
    rs_bsubject    = rs_list.getString(3);
    
		  cropByte.setCutLength(30);
		  cropByte.setValue(rs_list.getString(3));
		  rs_bsubject 	= cropByte.getCropValue();
    
		  //cropByte.setCutLength(70);
	   rs_bcontent = stl.getClobToString(rs_list, "bcontent");
    
    if(rs_bcontent != null && rs_bcontent != "")
    {
      rs_bcontent = rs_bcontent.replaceAll("\n", "<br>");
      rs_bcontent = rs_bcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
    }
		  //cropByte.setValue(rs_bcontent);
		  //rs_bcontent 	= cropByte.getCropValue();
    
    rs_inst_date   = rs_list.getString(5);
    
    sql = "select * from (select fname_tn from td0103 where bseqid = " + rs_seqid + "  order by seqid asc) where rownum = 1 ";
    
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


    
    //out.println("<p>");
				//out.println("<a href=\"photo.action?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\"><img src=\"/upload/photo/thumbnail/" + rs_bf_name_tn + "\" alt='"+rs_bsubject+"'></a>");
				//out.println("</p>");
				//out.println("<dl>");
				//out.println("<dt><a href=\"photo.action?method=v&amp;cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "\">"+rs_bsubject+"</a></dt>");
				//out.println("<dd class='date'>"+rs_inst_date+"</dd>");
				//out.println("</dl>");


    out.println("<div class='slide_item'>");
    out.println("	<a href='/main/program.action?method=view&amp;cmsid=" + rq_cid + "&amp;idx=" + rs_seqid + "'>");
    out.println("	  <span class='img-thumb'><img src='/upload/installation/thumbnail/" + rs_bf_name_tn + "' alt='" + rs_bsubject + "'></span>");
		  out.println("		 <span class='txt'>");
    out.println("     <p class='t2'>" + rs_bsubject + "</p>");
    out.println("	  </span>");
    out.println("	</a>");
    out.println("</div>");


    
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

if(row_count<1) out.println("<li style='width:100%; height: 292px;line-height: 292px;text-align:center;'>등록된 내용이 없습니다.</li>");

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
