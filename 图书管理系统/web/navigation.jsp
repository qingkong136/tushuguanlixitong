<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.dao.ManagerDAO"%>
<%@ page import="com.actionForm.ManagerForm"%>
<%
    ManagerDAO managerDAO=new ManagerDAO();
    ManagerForm form1=(ManagerForm)managerDAO.query_p((String)session.getAttribute("manager"));
    int sysset1=0;
    int readerset1=0;
    int bookset1=0;
    int borrowback1=0;
    int sysquery1=0;
    if(form1!=null){
        sysset1=form1.getSysset();
        readerset1=form1.getReaderset();
        bookset1=form1.getBookset();
        borrowback1=form1.getBorrowback();
        sysquery1=form1.getSysquery();
    }

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="JS/onclock.JS"></script>
<script src="JS/menu.JS"></script>
<script language="JavaScript">
    function tick() {
        var hours, minutes, seconds;
        var intHours, intMinutes, intSeconds;
        var today;
        today = new Date();
        intYear = today.getFullYear();
        intMonth = today.getMonth() + 1;
        intDay = today.getDate();
        intHours = today.getHours();
        intMinutes = today.getMinutes();
        intSeconds = today.getSeconds();
        if (intHours == 0) {
            hours = "00:";
        } else if (intHours < 10) {
            hours = "0" + intHours+":";
        } else {
            hours = intHours + ":";
        }
        if (intMinutes < 10) {
            minutes = "0"+intMinutes+":";
        } else {
            minutes = intMinutes+":";
        }
        if (intSeconds < 10) {
            seconds = "0"+intSeconds+" ";
        } else {
            seconds = intSeconds+" ";
        }
        timeString = intYear + "年" + intMonth + "月" + intDay + "日" + " " + hours+minutes+seconds;
        Clock.innerHTML = timeString;
        window.setTimeout("tick();", 1000);
    }
    window.onload = tick;
</script>

<div class=menuskin id=popmenu
      onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr bgcolor="#77AA21">
        <td width="3%" height="27">&nbsp;</td>
        <td width="29%"><div id="bgclock" class="word_white"></div>  现在是：<span id="Clock"></span></td>
		<script language="javascript">
			function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="logout.jsp";
				}
			}
		</script>
        <td width="66%" align="right" bgcolor="#99AA33" class="word_white"><a href="main.jsp" class="word_white">首页</a> |
        <%if(sysset1==1){%><a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >系统设置</a> | <%}%><%if(readerset1==1){%><a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">读者管理</a> | <%}%><%if(bookset1==1){%><a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >图书管理</a> | <%}%><%if(borrowback1==1){%><a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">图书借还</a> | <%}%><%if(sysquery1==1){%><a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >系统查询</a> | <%}%><a  href="manager.do?action=querypwd" class="word_white">更改口令</a> | <a href="#" onClick="quit()" class="word_white">退出系统</a></td>
        <td width="2%" bgcolor="#99AA33">&nbsp;</td>
  </tr>
      <tr bgcolor="#DFA40C">
        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
      </tr>
</table>
