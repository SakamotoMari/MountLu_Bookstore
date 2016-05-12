<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>麓山书市</title>
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
<!-- start slider -->
  <link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.eislideshow.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            $(function() {
                $('#ei-slider').eislideshow({
          animation     : 'center',
          autoplay      : true,
          slideshow_interval  : 3000,
          titlesFactor    : 0
                });
            });
        </script>
<!-- start top_js_button -->
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
<body  style="font-family: PMingLiU">
<!-- start header -->
<div class="top_bg">
<div class="wrap">
  <div class="header">
    <div class="logo">
      <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
    </div>
  
    <% 
      Object user=request.getAttribute("user");
  
      if(user!=null)
      {
    	  String username=(String)session.getAttribute("user");//sessionname
    	  %>
    	  <div class="log_reg"  style="font-family: PMingLiU">
        <ul>
          <li>欢迎您，<%=username %>   </li>  
          <li>  <a href="index.jsp">注销</a></li>         
          <div class="clear"></div>
        </ul>
    </div>  
    	 
    	  
    	  <% }
      else{    
      %>
     <div class="log_reg"  style="font-family: PMingLiU">
        <ul>
          <li><a href="login.jsp">登录</a> </li>
          <span class="log"> or </span>
          <li><a href="register.html">注册</a> </li>                   
          <div class="clear"></div>
        </ul>
    </div>  
    <%} %>
  
 
    
    
    
    
    
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
<!-- start slider -->
<div class="slider">
        <!---start-image-slider---->
        <div class="image-slider">
           <div class="wrapper">
                <div id="ei-slider" class="ei-slider">
                    <ul class="ei-slider-large">
            <li>
                            <img src="images/slider-image1.jpg" alt="image06"/>
                            <div class="ei-title">
                              <h3 class="btn">￥90.0</h3>
                                <h2>Book1 <br>  This is a book.</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image2.jpg" alt="image01" />
                            <div class="ei-title">
                              <h3 class="btn">￥35.0</h3>
                                <h2> Book2 <br>  This is a book.</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image3.jpg" alt="image02" />
                            <div class="ei-title">
                              <h3 class="btn">$145.99</h3>
                                <h2>BOOK3 <br> THIS IS A BOOK</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image4.jpg" alt="image03"/>
                            <div class="ei-title">
                              <h3 class="btn">$80.0</h3>
                                <h2>BOOK4 <br> THIS IS A BOOK</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image1.jpg" alt="image04"/>
                            <div class="ei-title">
                              <h3 class="btn">￥50.0</h3>
                                <h2>BOOK5 <br>  THIS IS A BOOK</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image5.jpg" alt="image05"/>
                            <div class="ei-title">
                              <h3 class="btn">￥40.0</h3>
                                <h2>BOOK6<br> THIS IS A BOOK</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                        <li>
                            <img src="images/slider-image3.jpg" alt="image07"/>
                            <div class="ei-title">
                              <h3 class="btn">￥30.0</h3>
                                <h2>BOOK7 <br>  THIS IS A BOOK</h2>
                                <h3 class="active">It is a long established fact that a reader<br>
                                  Lorem Ipsum is that it has a more-or-less 
                                </h3>
                                <h3>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_1.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_2.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_3.png" alt=""></a>
                                  <a class="ei_icons" href="details.html"><img src="images/icon_4.png" alt=""></a>
                                </h3>
                            </div>
                        </li>
                    </ul><!-- ei-slider-large -->
                    <ul class="ei-slider-thumbs">
                        <li class="ei-slider-element">Current</li>
                        <li>
                         <a href="#">
                         <span class="active">文学</span>
                        <p>Literature</p> 
                        </a>
                        <img src="images/thumbs/1.png" alt="thumb01" />
                     </li>
                       
                        <li class="hide"><a href="#"><span>信息技术</span><p>Information Technology</p> </a><img src="images/thumbs/2.jpg" alt="thumb01" /></li>
                        <li  class="hide1"><a href="#"><span>哲学宗教</span><p>Philosophy&Religion</p></a><img src="images/thumbs/3.png" alt="thumb02" /></li>
                        <li class="hide1"><a href="#"><span>语言</span><p>Language</p> </a><img src="images/thumbs/4.png" alt="thumb03" /></li>
                        <li><a href="#"><span>艺术</span><p>Art</p> </a><img src="images/thumbs/1.png" alt="thumb04" /></li>
                        <li><a href="#"><span>政治经济</span><p>Social&Economy</p> </a><img src="images/thumbs/5.png" alt="thumb05" /></li>
                        <li><a href="#"><span>漫画</span><p>Comics</p> </a><img src="images/thumbs/3.png" alt="thumb07" /></li>
                    </ul><!-- ei-slider-thumbs -->
                </div><!-- ei-slider -->
            </div><!-- wrapper -->
    </div>
    <!---End-image-slider---->  
</div>
<!-- start image1_of_3 -->
<div class="top_bg">
<div class="wrap">
<div class="main1" style="font-family: PMingLiU">
  <div class="image1_of_3">
    <img src="images/img1.jpg" alt=""/>
      <a href="BookList.jsp"><span class="tag">新书上市</span></a>
  </div>
  <div class="image1_of_3">
    <img src="images/img2.jpg" alt=""/>
    <a href="BookList.jsp"><span class="tag">限时促销</span></a>
  </div>
  <div class="image1_of_3">
    <img src="images/img3.jpg" alt=""/>
    <a href="BookList.jsp"><span class="tag">精品推荐</span></a>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>
<!-- start main -->
<div class="main_bg">
<div class="wrap">
<div class="main">
  <div class="top_main">
    <h2>新书上市</h2>
    <a href="BookList.jsp">查看更多</a>
    <div class="clear"></div>
  </div>
  <!-- start grids_of_3 -->
  <div class="grids_of_3">
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic1.jpg" alt=""/>
        <h3>爱你就像爱生命</h3>
        <span class="price">￥90.0</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic2.jpg" alt=""/>
        <h3>北欧神话</h3>
        <span class="price">￥50.0</span>
        <span class="price1 bg">on sale</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic3.jpg" alt=""/>
        <h3>故都的秋</h3>
        <span class="price">$80</span>
      </a>
    </div>
    <div class="clear"></div>
  </div>
  <div class="top_main">
    <h2>精品推荐</h2>
    <a href="BookList.jsp">查看更多</a>
    <div class="clear"></div>
  </div>
  <!-- start grids_of_3 -->
  <div class="grids_of_3">
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic4.jpg" alt=""/>
        <h3>以梦为马</h3>
        <span class="price">￥90.0</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic5.jpg" alt=""/>
        <h3>Head First Java</h3>
        <span class="price">￥90.0</span>
      </a>
    </div>
    <div class="grid1_of_3">
      <a href="details.html">
        <img src="images/pic6.jpg" alt=""/>
        <h3>奔跑吧！建筑师</h3>
        <span class="price">￥90.0</span>
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
      <h3>Mount Lu BookStore</h3>
      <p>这里是麓山书市</p>
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
    <p class="link"><span>Copyright &copy; 2016.麓山书市 All rights reserved.</p>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>
</body>
</html>