<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="entity.*"%>
<jsp:useBean id="orderMgr" class="entity.OrderMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.useso.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
<title>我的订单</title>
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
  <h4 class="style">Show All Orders</h4>
</div>
</div>
</div>
<!-- start main -->
 <div class="main_bg"> 
 <div class="wrap">
  <div class="main">
  <div class="top_main">
    <h2>我的订单</h2>
    <div class="clear"></div>
  </div>
<table width="95%" height="125" border="1">
    <tr>
      <th width="15%" height="46" bgcolor="#cccccc" scope="col">序号</th>
      <th width="15%" height="46" bgcolor="#cccccc" scope="col">用户名</th>
       <th width="15%" height="46" bgcolor="#cccccc" scope="col">类型</th>
       <th width="15%" height="46" bgcolor="#cccccc" scope="col">书名</th>
        <th width="15%" height="46" bgcolor="#cccccc" scope="col">价格</th>
      <th  width="15%" bgcolor="#cccccc" scope="col">数量</th>
    </tr>
    
    
     <%
	java.util.HashMap<String,Order> ordermap = new java.util.HashMap<String,Order>();
     
     String username=(String)session.getAttribute("user");//get username
     ordermap =orderMgr.getOrderlistByUser(username);
     BookMgr bookMgr=new BookMgr();
     Book book=new Book();
	java.util.Iterator iterator = ordermap.keySet().iterator();
	/*
	 * 
	 * Booktype
	 * 0 文学
	 * 1 信息技术
	 * 2 哲学宗教
	 * 3 语言
	 * 4 艺术
	 * 5 政治经济
	 * 6 漫画*/
	 int count=0;
	 Order order=new Order();
	while(iterator.hasNext()){
		
		order = (Order)ordermap.get(iterator.next());
	
		count++;
		String bookid= order.getBookid();
		book=bookMgr.getBookbyID(bookid);
		
		int bookType=book.getBooktype();
		String bookTypeName = "";
		switch(bookType){
		case 0:
			bookTypeName = "文学";
			break;
		case 1:
			bookTypeName = "信息技术";
			break;
		case 2:
			bookTypeName = "哲学宗教";
			break;
		case 3:
			bookTypeName = "语言";
			break;
		case 4:
			bookTypeName = "艺术";
			break;
		case 5:
			bookTypeName = "政治经济";
			break;
		}
%>
      <tr>
    <td align="center"><%=count%></td>
     <td align="center"><%=order.getUsername()%></td>
    <td align="center"><%=bookTypeName%></td>
     <td align="center"><%=book.getName() %></td>
    <td align="center"><%=book.getPrice()%></td>
    <td align="center"><%=book.getNumber() %></td>  
    
  </tr>
  <%
	
	}
  %>
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