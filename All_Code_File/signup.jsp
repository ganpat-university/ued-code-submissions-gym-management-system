<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign-UP | Page</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style1.css" />
  </head>
  <body id="login_body">
    <div id="header">
      <div class="container clearfix">
        <div class="row">
          <div class="col-2 logo">
            <a href="index.html"><h4>FIT-GAINER</h4></a>
          </div>
          <div class="col-8 menu">
            <ul class="float-right nav">
              <li class="menu-list">
                <a href="index.html">
                  Home
                  <span class="px-2"> <i class="fa fa-home"> </i> </span>
                </a>
              </li>
              <li>
                <a href="index.html"
                  >Courses
                  <span class="px-2"> <i class="fa fa-book"> </i> </span>
                </a>
              </li>
              <li>
                <a href="index.html"
                  >Product
                  <span class="px-2">
                    <i class="fa fa-cart-arrow-down"> </i>
                  </span>
                </a>
              </li>
              <li>
                <a href="index.html"
                  >About
                  <span class="px-2">
                    <i class="fa fa-user-circle-o"> </i>
                  </span>
                </a>
              </li>
              <li>
                <a href="index.html"
                  >Contact Us
                  <span class="px-2"> <i class="fa fa-phone"> </i> </span>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-2">
            <ul class="nav float-right">
              <li><a href="login.html">Login</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="container section-pad">
      <div class="row">
        <div class="col bg-pic login-banner">
          <!-- Pic Include -->
          <img src="comp-login-img.png" alt="image not found" />
        </div>
        <div class="col-7">
        <div class="row">
          <form action="login_check" method="post">
          
            <div class="col heading">
              <div class="row">
                <div class="col">
                  <h4>SIGN-UP PAGE</h4>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="offset-2 col-4 input_format">
                <label for="name">NAME</label>
              </div>
              <div class="col-6">
                <input
                  type="text"
                  id="name"
                  name="name"
                  placeholder="Enter Your Name."
                  required
                  autocomplete="off"
                />
              </div>
            </div>
            
            <div class="row">
              <div class="offset-2 col-4 input_format">
                <label for="pass">PASSWORD</label>
              </div>
              <div class="col-6">
                <input
                  type="password"
                  id="pass"
                  name="pass"
                  placeholder="Enter Your Password..."
                  required
                  autocomplete="off"
                />
              </div>
            </div>

            <div class="profile_select row">
              <div class="offset-2 col-4 input_format">
                <label for="profile">PROFILE</label>
              </div>
              <div class="col-6">
                <select class="select"value="USER" id="profile" name="profile" >
                  <option value="user">USER</option>
                  <option value="trainer">TRAINER</option>
                </select>
              </div>
            </div>	
            
            <div class="row">
              <div class="offset-2 col-4 input_format">
                <label for="s_key">SECURITY KEY</label>
              </div>
              <div class="col-6">
                <input
                  type="text"
                  id="s_key"
                  name="s_key"
                  placeholder="Enter Your Security key..."
                  required
                  autocomplete="off"
                />
              </div>
            </div>
            <div class="row">
              <div class="offset-2 col-4 input_format">
                <label for="email">EMAIL</label>
              </div>
              <div class="col-6">
                <input
                  type="email"
                  id="email"
                  name="email"
                  placeholder="Enter Your Email."
                  required
                  autocomplete="off"
                />
              </div>
            </div>
            
            <div class="row">
              <div class="offset-2 col-4 input_format">
                <label for="gender">Gender</label>
              </div>
              <div class="col-3 gender-col">
              	<div class="row">
                <input
                  type="radio"
                  id="gender"
                  name="gender"
                  required
                  autocomplete="off"
                  value="Female"
                />
                Female
                </div>
              </div>
              <div class="col-3 gender-col">
              	<div class="row">
                <input
                  type="radio"
                  id="gender"
                  name="gender"
                  required
                  autocomplete="off"
                  value="Male"
                />
                Male
                </div>
              </div>
            </div>
            <div class="row btn">
              <div class="col-12"><input type="submit" value="SUBMIT" /></div>
            </div>
          </div>
          <div class="row float-md-right">
          	
            <div class="col">
              <a href="for_pass.html">Forget Password</a>
            </div>
          </div>
          </form>
        </div>
      </div>
      
    </div>
  </body>
</html>
