

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="fDi"%>
        <title>Đăng nhập</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="css/user.css" rel="stylesheet" type="text/css"/>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;
                  background-image: url("image/1.jpg");
                  background-size: 100%;
                  margin: 0;
            }
        </style>
    </head>
    <body>
        <fDi:form action="user/login.htm" modelAttribute="NguoiDung" class="formDn">
            <h3>Login</h3>
            <div class="imgcontainer">
                <img src="image/avatar.png" alt="Avatar" class="avatar" >
            </div><br>
            ${mess }<br><br>
            <div class="container">            
                <label>Tên Đăng Nhập</label>
                <fDi:input path="username" class="form-control"/>
                <label>Mật Khẩu</label>
                <fDi:input path="password" name="password" type="password" class="form-control"/>
                <button type="submit">Login</button>
                <button type="reset" >Reset</button>
            </div>	
        </fDi:form>
</body>
</html>
