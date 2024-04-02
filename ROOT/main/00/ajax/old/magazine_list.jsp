<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ page import="java.sql.*" %>

<jsp:useBean id="stl" class="goodit.common.dao.DBUtil" scope="page"/>
<jsp:useBean id="cropByte" class="goodit.common.domain.CropByte" scope="page" />

<%

int rs_seqid = 0;
String class_cd = "";
String rs_cid = "";
String rs_bsubject = "";
String rs_inst_date = "";
int row_count = 0;

rs_cid    = request.getParameter("cmsid");

int random = (int)(Math.floor(Math.random()*2))+1;



String sql = "";


sql = "";
sql = sql + "SELECT * FROM ( SELECT  temp.*, ROWNUM as rnum FROM ( ";

sql = sql + "select a.seqid, a.bsubject, to_char(a.inst_date, 'yyyy-mm-dd') ";
sql = sql + "from board a ";
sql = sql + "where a.cid in('101050300000') ";
sql = sql + "and a.blevel = 0 ";
sql = sql + "and a.brecycle = '0' ";

sql = sql + "order by a.seqid desc, a.inst_date desc ";

sql = sql + " ) temp ) WHERE rnum <= 4 ";

//out.println(sql);



try 
{
	 stl.setQuery(sql);
	 ResultSet rs_list = stl.executeQuery();
  
  int cnt = 1;
	 while(rs_list.next())
  {
		  row_count++;
		  rs_seqid       = rs_list.getInt(1);
		  rs_bsubject    = rs_list.getString(2);
		  rs_inst_date   = rs_list.getString(3);
    

    out.println("<li><span class='title' style = 'display: inline-block; width: 80%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;'><a href='/main/board.action?cmsid=101050300000&amp;idx=" + rs_seqid + "&amp;method=v'>" + rs_bsubject + "</a></span> <span class='date'>" + rs_inst_date + "</span></li>");
    
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

if(row_count<1) out.println("<li style='width:100%; text-align:center;'>등록된 내용이 없습니다.</li>");


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
