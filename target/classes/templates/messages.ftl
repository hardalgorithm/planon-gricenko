<#import "parts/common.ftl" as c>
<script src="https://kit.fontawesome.com/45a1881b0b.js" crossorigin="anonymous"></script>

<@c.page>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/messages" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search comment">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>


    <div>Task List</div>
    <div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <span>${message.comment}</span>
            <#if message.date??>
            <i>${message.date}</i>
            </#if>
            <div class="m-2">
                <#if message.filename??>

                    <div id="uniquename" style="display:none;">
                        <p><img src="/img/${message.filename}" class="card-img-top"></p>
                    </div>
                    <a href="javascript:showhide('uniquename')">
                        Click to show/hide.
                    </a>
                </#if>

            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
                <#if message.active=true> <i class="fas fa-check-circle"></i>
                <#else ><i class="fas fa-spinner"></i>
                </#if>
            </div>

                <div class="card-footer text-muted">
                    <form action="/messageDelete/${message.id}" method="post">

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary">DELETE</button>
                    </form>
                    <form action="/messageActive/${message.id}" method="post">

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary">Activate</button>
                    </form>
                </div>
        </div>
    <#else>
        No message
    </#list>

</@c.page>