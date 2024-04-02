<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ page import="java.sql.*" %>

<jsp:useBean id="stl" class="goodit.common.dao.DBUtil" scope="page"/>
<jsp:useBean id="cropByte" class="goodit.common.domain.CropByte" scope="page" />

<%

int rs_seqid = 0;
String class_cd = "";
String rs_cid = "";
String rs_bsubject = "";
String rs_bsubject1 = "";
String rs_bcontent = "";
String rs_bf_name_tn = "";
String rs_inst_date = "";
String rs_bnotice = "";
String rs_fname_s = "";
String sql_str = "";
String img_str = "";
int row_count = 0;

int random = (int)(Math.floor(Math.random()*2))+1;



String sql = "";


sql = "";
sql = sql + "SELECT * FROM ( SELECT  temp.*, ROWNUM as rnum FROM ( ";

sql = sql + "select a.seqid, a.cid, a.bsubject, a.bcontent, to_char(a.inst_date, 'yyyy-mm-dd'), a.bnotice, (SELECT b.fname_s FROM board_file b WHERE b.bseqid = a.seqid AND ROWNUM = 1) ";
sql = sql + "from board a ";
sql = sql + "where a.cid in('101080100000') ";
sql = sql + "and a.blevel = 0 ";
sql = sql + "and a.brecycle = '0' ";

sql = sql + "order by a.inst_date desc, a.seqid desc ";

sql = sql + " ) temp ) WHERE rnum <= 4 ";

//out.println(sql);



try 
{
	 stl.setQuery(sql);
	 ResultSet rs_list = stl.executeQuery();
  
  int cnt = 1;
  int notice_cnt = 1;

	 while(rs_list.next())
  {
		  row_count++;
		  rs_seqid       = rs_list.getInt(1);
		  rs_cid         = rs_list.getString(2);
    //rs_bsubject    = rs_list.getString(3);
		  
		  cropByte.setCutLength(60);
		  cropByte.setValue(rs_list.getString(3));
		  rs_bsubject 	= cropByte.getCropValue();
		  rs_inst_date   = rs_list.getString(5);
		  cropByte.setCutLength(90);
	   rs_bcontent = stl.getClobToString(rs_list, "bcontent");
    
    if(rs_bcontent != null && rs_bcontent != "")
    {
      rs_bcontent = rs_bcontent.replaceAll("@image_c@", "");
      rs_bcontent = rs_bcontent.replaceAll("\n", "<br>");
      rs_bcontent = rs_bcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");     
    }
		  cropByte.setValue(rs_bcontent);
		  rs_bcontent 	= cropByte.getCropValue();
    rs_bsubject1 = rs_bsubject;

    rs_inst_date   = rs_list.getString(5);
    rs_fname_s     = rs_list.getString(7);

   
    out.println("<li><span class='title'><a href='/main/board.action?cmsid=101080100000&amp;idx=" + rs_seqid + "&amp;method=v'>" + rs_bsubject + "</a></span> <span class='date'>" + rs_inst_date + "</span></li>");
    
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
