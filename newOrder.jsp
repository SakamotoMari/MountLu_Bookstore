<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="servlet.*" %>
     <%@page import="entity.*" %>
     <%@page import="java.util.*" %>
     
    
    <% response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); %> 

     <%
     Cart c=(Cart)session.getAttribute("cart");
     if(c==null){
    	 c=new Cart();
    	 session.setAttribute("cart",c);
     }
     
     double totalPrice=c.getTotalPrice();
     
     request.setCharacterEncoding("UTF-8");
     String action=request.getParameter("action");
     
     HashMap books=(HashMap)session.getAttribute("books");
     %>
     
     <%
     String path = request.getContextPath();  
     String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
     %>
      <%  
         List<CartItem> items = c.getList();  
      %> 
     
    	   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.useso.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--- start-mmmenu-script---->
<script src="js/jquery.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
<script type="text/javascript" src="js/jquery.mmenu.js"></script>
    <script type="text/javascript">
      //  The menu on the left
      $(function() {
        $('nav#menu-left').mmenu();
      });
    </script>
<!-- start top_js_button -->
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
   <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){   
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
      });
    });
  </script>

<title>newOrder</title>
</head>
<body style="font-family: PMingLiU">
<!-- start header -->
<div class="top_bg">
<div class="wrap">
  <div class="header">
    <div class="logo">
      <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
    </div>
     <div class="log_reg">
        <ul>
          <li><a href="login.jsp">登录</a> </li>
          <span class="log"> or </span>
          <li><a href="register.html">注册</a> </li>                   
          <div class="clear"></div>
        </ul>
    </div>  
    <div class="web_search">
      <form>
        <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
        <input type="submit" value=" " />
      </form>
      </div>            
    <div class="clear"></div>
  </div>  
</div>
</div>
<!-- start header_btm -->
<div class="wrap">
<div class="header_btm">
    <div class="menu">
      <ul>
        <li><a href="index.jsp">主页</a></li>
        <li><a href="BookList.jsp">书市</a></li>
        <li><a href="contact.html">Contact</a></li>
        <div class="clear"></div>
      </ul>
    </div>
    <div id="smart_nav">
      <a class="navicon" href="#menu-left"> </a>
    </div>
    <nav id="menu-left">
      <ul>
          <li><a href="index.jsp">主页</a></li>
        <li><a href="BookList.jsp">书市</a></li>
        <li><a href="contact.html">Contact</a></li>
        <div class="clear"></div>
      </ul>
    </nav>
  <div class="header_right">
    <ul>
      <li><a href="#"><i  class="art"></i><span class="color1">0</span></a></li>
      <li><a href="/Bookstore/Cart.jsp"><i  class="cart"></i><span><%=session.getAttribute("cartNum") %></span></a></li>
    </ul>
  </div>
  <div class="clear"></div>
</div>
</div>
<!-- start top_bg -->
<div class="top_bg">
<div class="wrap">
<div class="main_top">
  <h4 class="style">创建新订单</h4>
</div>
</div>
    <% 
      Object user=session.getAttribute("user");
       if(user!=null){
           System.out.println("建立新订单");
           String username=(String)session.getAttribute("username");
       }
       else  {
    	        session.setAttribute("tryorder","true");
    	   %>
    	   
   <p>您尚未登录！进入登录界面……</p>
         <%    
             System.out.println("您尚未登录！");
             System.out.println("进入登录界面……");
             response.sendRedirect("http://localhost:8080/Bookstore/login.jsp");
       }
    %>
 <div class="main_bg"> 
 <div class="wrap">
  <div class="main">
  <div class="top_main">
    <a href="/Bookstore/Cart.jsp"><h2>返回购物车</h2></a>
    <div class="clear"></div>
  </div>
 

<form action="servlet/OrderServlet" method="get">  <!-- action="Cart.jsp" -->
<input type="hidden" name="action" value="update"/>  
<table align="center"  style="font-family:Microsoft YaHei" border="1" cellspacing="0">  
    <tr bgcolor="#CCCCCC">  
        <td>书籍编号</td>  
        <td>书名</td>   
        <td>单价</td>     
    </tr>  
 
    <%  
    for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) { 
	 //  Iterator<CartItem> it = items.iterator();//edit here
	 //  while(it.hasNext()){             //edit here 
		
        CartItem ci = it.next();  
        %>  
        <tr>  
            <td><%=ci.getBook().getId() %></td> 
            <td><%=ci.getBook().getName() %></td>  
             <%--  <td>  
              <input type="text" size=3 name="<%="b" + ci.getBook().getId() %>" value="<%=ci.getCount()%>"   
                    onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  
                    onchange="document.forms[0].submit()">     
            </td>  --%>
             <td><%=ci.getBook().getPrice() %></td>   
        </tr>  
        <% 
    }  
	
    %>  
      
      
    <tr>  
        <td colspan=2 align="right">  
            所有商品总价格为：  
        </td>  
        <td colspan=1><%=c.getTotalPrice() %></td>  
    </tr> 
    
      
    <tr>  
    <!-- <td colspan=3>  
             <a href="javascript:document.forms[0].submit()">修改</a>   
        </td>  -->  
        <td colspan=6 align="right">  
       
            <a href="/Bookstore/servlet/OrderServlet?operation=add">确认</a>         
        </td>  
    </tr>  
</table>  
</form>  
</div>
</div>
</div>
<!-- start footer -->
<div class="footer_bg">
<div class="wrap">
<div class="footer">
    <!-- scroll_top_btn -->
      <script type="text/javascript">
      $(document).ready(function() {
      
        var defaults = {
            containerID: 'toTop', // fading element id
          containerHoverID: 'toTopHover', // fading element hover id
          scrollSpeed: 1200,
          easingType: 'linear' 
        };
        
        
        $().UItoTop({ easingType: 'easeOutQuart' });
        
      });
    </script>
     <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
    <!--end scroll_top_btn -->
  <div class="f_nav1">
    <ul>
      <li><a href="#">home /</a></li>
      <li><a href="#">support /</a></li>
      <li><a href="#">Terms and conditions /</a></li>
      <li><a href="#">Faqs /</a></li>
      <li><a href="#">Contact us</a></li>
    </ul>
    </div>
  <div class="copy">
    <p class="link"><span>Copyright &copy; 2016.麓山书市 All rights reserved.</p>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>
</body>
</html>