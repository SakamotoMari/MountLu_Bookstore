<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%> 
<%@page import="servlet.*" %>
<%@page import="java.util.*"  %>
<%@ page import="entity.Cart"%>  
<%@ page import="entity.Book"%> 
<%@ page import="entity.CartItem"%> 
<jsp:useBean id="BookMgr" class="entity.BookMgr" scope="application"/>

<% response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); %> 

<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>
<head>
<title>书籍列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
  
  <style type="text/css">img{
     max-width:300px;
     max-height:500px;
  }</style>
</head>
<body>
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
        <li class="active"><a href="index.jsp">主页</a></li>
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
        <li class="active"><a href="index.jsp">主页</a></li>
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
  <h2 class="style">书籍列表</h2>
</div>
</div>
</div>
  

<!-- start main -->
<div class="main_bg">
<div class="wrap">
<div class="main">
  <div class="top_main">
    <h2>新书上市</h2>
    <a href="#">查看全部</a>
    <div class="clear"></div>
  </div>
  <!-- start grids_of_3 -->
    
     <%
     HashMap books=new HashMap();
     books = BookMgr.getBookList();
  
     session.setAttribute("books",books);  
     
     Set BookIdSet = books.keySet();  
     Iterator it = BookIdSet.iterator();  

     while (it.hasNext()) {  
         String id = (String) it.next();  
         Book book = (Book)books.get(id);  
%>
  <form action="details.jsp">
  <div class="grids_of_3">
    <div class="grid1_of_3">
    <% 
      
      request.setAttribute("book", book);
      String imgUrl=book.getPic();
      
    %>
      <a href="/Bookstore/details.jsp?action=show&id=<%=book.getId()%>" style="border:0">
        <img src="<%=request.getContextPath()+'/'+"pic"+'/'+imgUrl%>" style="border:0" alt=""/>
     
        <h3><%=book.getName() %></h3>
        <span class="price">￥<%=book.getPrice()%></span>
      </a>
    </div>
    <div style="width:10px"></div>
    </div>
    </form>

  <%
    }
  
  %>
    <div class="clear"></div>
  </div>
  <div class="top_main">
    <h2>精品推荐</h2>
    <a href="#">查看全部</a>
    <div class="clear"></div>
  </div>
  <!-- start grids_of_3 -->
  <div class="grids_of_3">
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic4.jpg" alt="">
        <h3>以梦为马</h3>
        <span class="price">$145,99</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic5.jpg" alt="">
        <h3>Head First Java</h3>
        <span class="price">$185,99</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic6.jpg" alt="">
        <h3>奔跑吧！建筑师</h3>
        <span class="price">$145,99</span>
        <span class="price1 bg1">out of stock</span>
      </a>
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <!-- start grids_of_2 -->
  <div class="grids_of_2">
    <div class="grid1_of_2">
      <div class="span1_of_2">
        <h2>free shipping</h2>
        <p>Lorem Ipsum is simply dummy  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
      </div>
      <div class="span1_of_2">
        <h2>testimonials</h2>
        <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using [...]</p>
      </div>
    </div>
    <div class="grid1_of_2 bg">
      <h2>news</h2>
      <div class="grid_date">
        <div class="date1"> 
          <h4>apr 01</h4>
        </div>
        <div class="date_text">
          <h4><a href="#"> Donec vehicula est ac augue consectetur,</a></h4>
          <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</p> 
        </div>
        <div class="clear"></div>
      </div>
      <div class="grid_date">
        <div class="date1"> 
          <h4>feb 01</h4>
        </div>
        <div class="date_text">
          <h4><a href="#"> The standard chunk of Lorem Ipsum used since ,,</a></h4>
          <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from </p> 
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
</div>
</div>
<!-- start footer -->
<div class="footer_top">
<div class="wrap">
<div class="footer">
  <!-- start grids_of_3 -->
  <div class="span_of_3">
    <div class="span1_of_3">
      <h3>text edit</h3>
      <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>
    </div>
    <div class="span1_of_3">
      <h3>twitter widget</h3>
      <p><a href="#">@Contrarypopular</a> I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give <a href="#">@accountofsystem</a> </p>
      <p class="top">19 days ago</p>
      <p class="top"><a href="#">@Contrarypopular</a> I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give <a href="#">@accountofsystem</a> </p>
      <p class="top">19 days ago</p>
    </div>
    <div class="span1_of_3">
      <h3>flickr widget</h3>
      <ul class="f_nav">
        <li><a href="#"><img src="images/f_pic1.jpg" alt="" /> </a></li>
        <li><a href="#"><img src="images/f_pic2.jpg" alt="" /> </a></li>
        <li><a href="#"><img src="images/f_pic3.jpg" alt="" /> </a></li>
        <li><a href="#"><img src="images/f_pic4.jpg" alt="" /> </a></li>
        <li><a href="#"><img src="images/f_pic5.jpg" alt="" /> </a></li>
        <li><a href="#"><img src="images/f_pic6.jpg" alt="" /> </a></li>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</div>
</div>
</div>
<!-- start footer -->
<div class="footer_mid">
<div class="wrap">
<div class="footer">
  <div class="f_search">
    <form>
      <input type="text" value="" placeholder="Enter email for newsletter" />
      <input type="submit" value=""/>
    </form>
  </div>
  <div class="soc_icons">
      <ul>
        <li><a class="icon1" href="#"></a></li>
        <li><a class="icon2" href="#"></a></li>
        <li><a class="icon3" href="#"></a></li>
        <li><a class="icon4" href="#"></a></li>
        <li><a class="icon5" href="#"></a></li>
      </ul> 
  </div>
  <div class="clear"></div>
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
    <p class="link"><span>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>
</body>
</html>
 
