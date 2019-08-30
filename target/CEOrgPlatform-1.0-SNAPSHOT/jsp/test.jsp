<%-- 
    Document   : test
    Created on : Aug 24, 2019, 1:00:30 PM
    Author     : Kate Dianne
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="url_jqlib" value="/jquery-3.4.1.min.js" />
        <script src="${url_jqlib}"> </script>
        <script>
            <%@include file="jquery-3.4.1.min.js" %>
            $(document).ready(function(){
//                alert('hee');
                  $("#server_time").click(function(){
                      $.ajax({
                          url : 'get',
                          success : function(data){
                              $("#id_time").html(data)
                          }
                      });
                  })
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>nyaw</h1>
        <button id="server_time">hoho</button> <br/>
        <p id="id_time"></p> 
    </body>
</html>
