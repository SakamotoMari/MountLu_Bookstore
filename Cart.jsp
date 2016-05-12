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
     
     if(action!=null && action.trim().equals("add")){
    	 String id=request.getParameter("id");
    	 Book b=(Book)books.get(id);
    	 CartItem ci=new CartItem();
    	 ci.setBook(b);
    	 ci.setCount(1);
    	 c.addCartItem(ci);
     }
     
     if(action!=null && action.trim().equals("delete")){
    	 String id=request.getParameter("id");
    	 c.deleteItemById(id);
     }
     
     if(action!=null && action.trim().equals("update")){
    	 for(int i=0;i<c.getList().size();i++){
    		 CartItem ci=c.getList().get(i);
    			 int count=Integer.parseInt(request.getParameter("b"+ci.getBook().getId()));
    			 ci.setCount(count);
    	 }
     }
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
<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" media="all" />
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
  <h4 class="style">My Cart</h4>
</div>
</div>
</div>
<%--start  main! --%>  

 <div class="main_bg"> 
 <div class="wrap">
  <div class="main">
  <div class="top_main">
     <a href="/Bookstore/BookList.jsp"><h2>返回图书列表</h2></a>
    <div class="clear"></div>
  </div>

<form action="Cart.jsp" method="get">  <!-- action="Cart.jsp" -->
<input type="hidden" name="action" value="update"/>  
<table align="center"  style="font-family:Microsoft YaHei" border="1" cellspacing="0">  
    <tr bgcolor="#CCCCCC">  
        <td>书籍编号</td>  
        <td>书名</td>   
        <td>单价</td>    
        <td>处理</td>  
    </tr>  
    <%  
   int cartNum=0;//the number of items int the cart
    for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) { 
	    cartNum++;
        CartItem ci = it.next();  
	    int num=ci.getBook().getNumber();
	    num++;
	    ci.getBook().setNumber(num);
        %>  
        <tr>  
        
            <td><%=ci.getBook().getId() %></td> 
            <td><%=ci.getBook().getName() %></td>  
             <td><%=ci.getBook().getPrice() %></td> 
        
            <td>  
  
                <a href="/Bookstore/Cart.jsp?action=delete&id=<%=ci.getBook().getId() %>">删除</a>  
                  
            </td>  
        </tr>  
        <% 
    }  
	session.setAttribute("cartNum",cartNum);
    %>  
      
      
    <tr>  
        <td colspan=3 align="right">  
            所有商品总价格为：  
        </td>  
        <td colspan=3><%=c.getTotalPrice() %></td>  
    </tr> 

      
    <tr>  
    <!-- <td colspan=3>  
             <a href="javascript:document.forms[0].submit()">修改</a>   
        </td>  -->  
        <td colspan=6 align="right">  
       
            <a href="/Bookstore/newOrder.jsp">下单</a>         
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