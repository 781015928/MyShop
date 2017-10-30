<%@ page import="com.czg.myshop.model.http.ReturnBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String msg ="22222";
    Object obj = request.getAttribute("responseInfo");
    if (obj!=null&&obj instanceof ReturnBean){
        ReturnBean   responseInfo = (ReturnBean) obj;
         msg = responseInfo.getMsg();
    }
%>

<head>

        <script type="text/javascript">
            alert('<c:out value="<%=msg%>"/>');
        </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城后台管理系统</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #016aa9;
            overflow: hidden;
        }

        .STYLE1 {
            color: #000000;
            font-size: 12px;
        }

        -->
    </style>
</head>

<body>
<form action="${pageContext.request.contextPath }/admin/login">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">

        <tr>
            <td>
                <table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="235" background="images/login_03.gif">&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="53">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="394" height="53" background="images/login_05.gif">
                                        &nbsp;
                                    </td>


                                    <td width="206" background="images/login_06.gif">
                                        <table width="100%" border="0" cellspacing="0"
                                               cellpadding="0">


                                            <tr>
                                                <td width="16%" height="25">
                                                    <div align="right"><span
                                                            class="STYLE1">用户</span></div>
                                                </td>
                                                <td width="57%" height="25">
                                                    <div align="center">
                                                        <input type="text" name="account"
                                                               style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                                                    </div>
                                                </td>
                                                <td width="27%" height="25">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="25">
                                                    <div align="right"><span
                                                            class="STYLE1">密码</span></div>
                                                </td>
                                                <td height="25">

                                                    <div align="center">
                                                        <input type="password" name="password"
                                                               style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                                                    </div>
                                                </td>


                                                <td height="25">

                                                    <div align="left">
                                                        <input  type="submit" value="登陆">

                                                    </div>

                                                </td>
                                            </tr>


                                        </table>
                                    </td>
                                    <td width="362" background="images/login_07.gif">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="213" background="images/login_08.gif">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
