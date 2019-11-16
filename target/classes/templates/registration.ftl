<#import "parts/common.ftl" as c>


<@c.page>
    <div class="form">
        <form action="/registration" method="post" class="form-horizontal signup">
            <div class="form-wrap" style="position: relative;">
                <h2>Sign Up</h2>
                ${message?ifExists}
                <div class="form-group">
                    <div class="relative">
                        <input class="form-control" id="name" type="text" name="username"  placeholder="Username">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="form-group">
                    <div class="relative">
                        <input id="password-field" class="form-control" type="password" name="password" placeholder="Password">

                    </div>
                    <span class="pull-right"><small><a href="#" onclick="onShowPass()">show/hide</a></small></span>

                </div>
                <div class="form-group">
                    <div class="relative">
                        <input class="form-control" id="phone" type="text" name="phone"  placeholder="tel. 090-000-0000">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="login-btn">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <a href="#"><button class="movebtn movebtnsu" type="Submit">Submit <i class="fa fa-fw fa-paper-plane"></i></button></a>
                    <div class="clearfix"></div>
                    <div class="social-btn clearfix">
                    </div>
                </div>

            </div>
            <div class="sign-up">
                <a href="/login" class="signbtn">Return to LogIn <i>(Click me)</i></a>
            </div>
        </form>
    </div>
  </@c.page>
