<#import "parts/common.ftl" as c>


<@c.page>
    <div class="form">
        <form action="/login" method="post" class="form-horizontal signin">
            <div class="form-wrap" style="position: relative;">
                <h2>Login</h2>
                <div class="form-group">
                    <div class="relative">
                        <input class="form-control" id="name" type="text" name="username" placeholder="Username">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="form-group">
                    <div class="relative">
                        <input class="form-control" id="password-field" type="password" name="password" placeholder="Password">
                        <i class="fa fa-key"></i>
                    </div>
                    <span class="pull-right"><small><a href="#" onclick="onShowPass()">show/hide</a></small></span>
                </div>

                <div class="login-btn">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <a href="#"><button class="movebtn movebtnsu" type="Submit">Login <i class="fa fa-fw fa-lock"></i></button></a>

                    <div class="clearfix"></div>
                    <div class="social-btn clearfix">

                    </div>
                </div>

            </div>
            <div class="sign-up"><hr>
                <a href="/registration" class="signbtn">First time? Registration form <i>(Click me)</i></a>
            </div>
        </form>
    </div>


</@c.page>