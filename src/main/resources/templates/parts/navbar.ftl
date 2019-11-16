<#include "security.ftl">


<#--Test-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><img src="/static/agenda.png" style="margin-top:-4px;" /></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" id="home-enjoy" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Message</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/masterlist">Choose Master</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">UserList</a>
            </li>
            </#if>
            <#if isMaster>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    MASTER
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/masterEdit">
                        Create Profile
                    </a>
                    <a class="dropdown-item" href="#">test</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">link</a>
                </div>
            </li>
                </#if>
        </ul>
        <form action="/logout" class="form-inline my-2 my-lg-0" method="post">
            <a class="nav-link disabled" href="#">${name}</a>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <#if name == "Guest">
            <button class="btn btn-primary" type="submit">Sign In</button>
                <#else ><button class="btn btn-primary" type="submit">Sign Out</button>
            </#if>
        </form>
    </div>
</nav>



