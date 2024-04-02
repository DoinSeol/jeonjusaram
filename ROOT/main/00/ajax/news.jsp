<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ page import="java.sql.*" %>

<jsp:useBean id="stl" class="goodit.common.dao.DBUtil" scope="page"/>
<jsp:useBean id="cropByte" class="goodit.common.domain.CropByte" scope="page" />

<%

String rq_cid = "";

int rs_seqid = 0;
int class_cd = 0;
String rs_cid = "";
String rs_bsubject = "";
String rs_bcontent = "";
String rs_bf_name_tn = "";
String rs_file_s = "";
String rs_file_tn = "";
String rs_inst_date = "";

String photo_str = "";
String url_str = "";

String sql_str = "";
int row_count = 0;


//int random = (int)(Math.floor(Math.random()*2))+1;

rq_cid = request.getParameter("cmsid");
//class_cd = request.getParameter("cc");

/*
if(class_cd==null || class_cd.length()==0)
{ 
  if(stl!=null){ stl.close(); stl = null; }
	 out.println("입력하신 항목에 문제가 있습니다. 다시 확인하시고 시도하시기 바랍니다.!!");
	 return;
}
*/



String sql = "";


sql = "";
sql = sql + "SELECT * FROM ( SELECT  temp.*, ROWNUM as rnum FROM ( ";

sql = sql + "select a.seqid, a.cid, a.bsubject, a.bcontent, ";
sql = sql + "(select fname_s from board_file where fimage_w > 0 and fimage_h > 0 and bseqid = a.seqid and rownum = 1) photo_s, ";
sql = sql + "to_char(a.inst_date, 'yyyy-mm-dd') ";

sql = sql + "from board a ";

sql = sql + "where a.cid = ? ";
sql = sql + "and a.blevel = 0 ";
sql = sql + "and a.brecycle = '0' ";

sql = sql + "order by a.seqid desc ";

sql = sql + ") temp ) WHERE rnum <= 5 ";

//out.println(sql);



try 
{
	 stl.setQuery(sql);
	 stl.setString(1, rq_cid);
  //if(!class_cd.equals("all"))	 stl.setString(2, class_cd);
	 ResultSet rs_list = stl.executeQuery();
  
  int cnt = 1;
	 while(rs_list.next())
  {
		  row_count++;
		  
		  rs_seqid       = rs_list.getInt(1);
		  rs_cid         = rs_list.getString(2);
    //rs_bsubject  = rs_list.getString(3);
    //rs_bcontent  = rs_list.getString(4);
    rs_file_s      = rs_list.getString(5);
		  rs_inst_date   = rs_list.getString(6);
		  
		  cropByte.setCutLength(34);
		  cropByte.setValue(rs_list.getString(3));
		  rs_bsubject 	= cropByte.getCropValue();
		  
		  //cropByte.setCutLength(65);
		  //cropByte.setValue(rs_list.getString(4));
		  //rs_bcontent 	= cropByte.getCropValue();
		  
		  
	   rs_bcontent = stl.getClobToString(rs_list, "bcontent");
    
    if(rs_bcontent != null && rs_bcontent != "")
    {
      rs_bcontent = rs_bcontent.replaceAll("\n", "<br>");
      rs_bcontent = rs_bcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");     
    }
		  
		  cropByte.setCutLength(250);
		  cropByte.setValue(rs_bcontent);
		  rs_bcontent	= cropByte.getCropValue();
		  
		  if(rs_file_s != null)
		  {
		    rs_file_s = "/upload/board/" + rs_file_s;
		  }
		  else
		  {
		    rs_file_s = "/main/images/common/no_photo_s.jpg";
	   }
	   
	   url_str = "/main/board.action?cmsid=" + rs_cid + "&method=v&idx=" + rs_seqid;
    
    if(row_count == 1)
    {
      out.println("<div class='notice_tcont'>");
  				out.println("	<p class='img_wrap'><img src='" + rs_file_s + "' alt='" + rs_bsubject + "' title='" + rs_bsubject + "' /></p>");
  				out.println("	<div class='cont'>");
  				out.println("		<a href='" + url_str + "' class='tit'>" + rs_bsubject + "</a>");
  				out.println("		<a href='" + url_str + "' class='txt'>" + rs_bcontent + "</a>");
  				out.println("	</div>");
  				out.println("</div>");
    }
    else
    {
      if(row_count == 2)
      {
        out.println("<ul class='notice_list'>");
      }
  				
  				out.println("	<li><a href='" + url_str + "'>" + rs_bsubject + "</a> <span class='date'>" + rs_inst_date + "</span></li>");
  				
    }
    
    //out.println("<li class='jbe_item'>");
				//out.println("	<a href='" + url_str + "' target='_blank' title='새창'><img class='item_img' src='" + photo_str + "' alt='" + rs_bsubject + "' title='" + rs_bsubject + "[새창]'></a>");
				//out.println("	<div class='jbe_tit'>");
				//out.println("		<h3><a href='" + url_str + "' target='_blank' title='새창'>" + rs_bsubject + "</a></h3>");
				//out.println("		<span class='jbe_more'>" + class_nm_array[class_cd - 1] + "</span>");
				//out.println("		<span class='date'>" + rs_inst_date + "</span>");
				//out.println("	</div>");
				//out.println("</li>");
    
    //out.println("<div class='box'><a href='/main/program.jbe?cmsid=105010100000&method=view&id=" + rs_seqid + "'><img src='/upload/notify/" + rs_file_s + "' alt='" + rs_bsubject + "'></a></div>");
    
    //out.println("<li class='list'><a href='board.jbe?cmsid=" + rs_cid + "&amp;idx=" + rs_seqid + "&amp;method=v&amp;cc=" + class_cd + "' title='" + rs_bsubject + "'>" + rs_bsubject + "</a></li>");
    //out.println("<li class='date'>" + rs_inst_date + "</li>");
    
    cnt++;
  }
  
  if(row_count > 2)
  {
    out.println("</ul>");
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

if(row_count < 1) { out.println("<div style='width:100%; text-align:center;'>등록된 내용이 없습니다.</div>"); }


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
