<%@ page import="com.czg.myshop.model.http.ReturnBean" %><%--
  Created by IntelliJ IDEA.
  User: 78101
  Date: 2017/10/17
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    ReturnBean   responseInfo = (ReturnBean) request.getAttribute("responseInfo");
    String msg = responseInfo.getMsg();
    String requestURI = request.getRequestURI();
    System.out.println(requestURI);
    System.out.println(requestURI);


%>


<html>
<head>
    <script language="javascript">
        window.showModalDialog("aaaaa")
    </script>
    <title>错误</title>

</head>
<body>

<%=msg%>
</body>
</html>
