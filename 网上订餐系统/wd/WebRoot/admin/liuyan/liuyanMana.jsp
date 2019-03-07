<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>
		<style type="text/css">
			.comments-list{
	position: relative;
	border-top: 1px solid #fff;
	width: 70%;
	margin: 90px 0 50px 40px;
	padding-left: 50px;
}
.lifeline{
	position: absolute;
	/* min-height: 300px; */
	height: 100%;
	top: 20px;
	left: 200px;
	width: 2px;
	background: rgba(7,17,27,1);
}

.comments-item{
	margin-left: 200px;
	padding-top: 40px;
	position: relative;
}
.comments-item::before{
	content: '';
    width: 10px;
    height: 10px;
    border-radius: 50%;
    position: absolute;
    background: rgba(7,17,27,1);
    border: 2px solid #fff;
    left: -56px;
    top: 50px;
}

.dateview{
	position: absolute;
    left: -215px;
    top: 50px;
    z-index: 1;
    font-size: 14px;
    color: #F5F5F5;
}
.comment{
	
}
.comment .name {
	line-height: 30px;
	font-size: 18px;
}
		</style>
		
	</head>

	<BODY>
    <div class="body-box">
    	<TABLE cellSpacing=1 cellPadding=4 width="100%" border=1>
			<s:iterator value="#request.liuyanList" id="liuyan">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR >
								<TD align=middle width="10%">
									<STRONG>留言人：</STRONG>
								</TD>
								<TD width="47%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanUser"/></FONT>
								</TD>
								<TD align=middle width="14%">
									<STRONG>留言时间：</STRONG>
								</TD>
								<TD width="29%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanDate"/></FONT>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a style="color: red" href="<%=path %>/liuyanDel.action?liuyanId=<s:property value="#liuyan.liuyanId"/>">删除</a>
								</TD>
							</TR>
							<TR>
								<TD align=middle>
									<STRONG>标题：</STRONG>
								</TD>
								<TD colSpan=3>
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanTitle"/></FONT>
								</TD>
							</TR>
							<TR>
								<TD vAlign=top align=middle>
									<STRONG>内容：</STRONG>
								</TD>
								<TD colSpan=3>
									<s:property value="#liuyan.liuyanContent" escape="false"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			</s:iterator>
		</TABLE>
	</div>
	</BODY>
</html>
