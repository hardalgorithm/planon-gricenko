<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if  known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    isMaster = user.isMaster()
    >
<#else >
    <#assign
    name = "Guest"
    isAdmin = false
    isMaster = false
    >
</#if>