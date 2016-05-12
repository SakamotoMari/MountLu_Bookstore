<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <% response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
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
      <li><a href="/Bookstore/Cart.jsp"><i  class="cart"></i><span>0</span></a></li>
    </ul>
  </div>
  <div class="clear"></div>
</div>
</div>
<!-- start top_bg -->
<div class="top_bg">
<div class="wrap">
<div class="main_top">
  <h4 class="style">create an account or login</h4>
</div>
</div>
</div>
<!-- start main -->
<div class="main_bg">
<div class="wrap">
<div class="main">
  <div class="login_left">
    <h3>尚未注册麓山书市？</h3>
    <p>您可以此刻注册，享受最优质的购书体验。</p>
    <div class="btn">
      <form>
        <input type="button"  onclick="location.href='register.html';" value="注册" />
      </form>
    </div>
  </div>
  <div class="login_left">
    <h3>用户登录</h3>
    <p>如果您已有账号，请即刻登录。</p>
  <!-- start registration -->
  <div class="registration">
    <!-- [if IE] 
        < link rel='stylesheet' type='text/css' href='ie.css'/>  
     [endif] -->  
      
    <!-- [if lt IE 7]>  
        < link rel='stylesheet' type='text/css' href='ie6.css'/>  
    <! [endif] -->  
    <script>
      (function() {
    
      // Create input element for testing
      var inputs = document.createElement('input');
      
      // Create the supports object
      var supports = {};
      
      supports.autofocus   = 'autofocus' in inputs;
      supports.required    = 'required' in inputs;
      supports.placeholder = 'placeholder' in inputs;
    
      // Fallback for autofocus attribute
      if(!supports.autofocus) {
        
      }
      
      // Fallback for required attribute
      if(!supports.required) {
        
      }
    
      // Fallback for placeholder attribute
      if(!supports.placeholder) {
        
      }
      
      // Change text inside send button on submit
      var send = document.getElementById('register-submit');
      if(send) {
        send.onclick = function () {
          this.innerHTML = '...Sending';
        }
      }
    
    })();
    </script>
  <div class="registration_left">
     <div class="registration_form">
     <!-- Form -->
      <form name="loginform" id="registration_form" action="servlet/LoginServlet" method="post">
        <div>
          <label>
            <input placeholder="用户名：" type="username" name="username" tabindex="3" required="">
          </label>
        </div>
        <div>
          <label>
            <input placeholder="密码："  type="password" name="password" tabindex="4" required="">
          </label>
        </div>            
        <div>
          <input type="submit" value="登录" id="register-submit">
        </div>
        <div class="forget">
          <a href="#">忘记密码</a>
        </div>
      </form>
      <!-- /Form -->
    </div>
  </div>
  </div>
  <!-- end registration -->
  </div>
  <div class="clear"></div>
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
      <h3>Mount Lu Bookstore</h3>
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
    <p class="link"><span>Copyright &copy; 2016.Company 麓山书市 All rights reserved.</p>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>
</body>
</html>