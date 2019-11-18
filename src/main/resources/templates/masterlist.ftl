<#import "parts/common.ftl" as c>
<script src="https://kit.fontawesome.com/45a1881b0b.js" crossorigin="anonymous"></script>

<@c.page>

    <div >Master List </div>

    <div class="card-columns">

<#list masters as master>
        <aside class="profile-card mb-3">
                <header>
                    <#if master.photo??>
                        <a href="#">
                            <img src="/img/${master.photo}">
                        </a>
                    </#if>

                </header>

                <div class="profile-bio">
                    <h4>${master.firstName} ${master.lastName}</h4>
                    <h5>${master.phone}</h5>
                    <p>${master.description}</p>
                </div>


                <ul class="profile-social-links">
                    <li>
                        <a href="https://${master.socialLink}" target="_blank">
                            #socilLink
                        </a>
                    </li>


                    <div>
                        <a href="/master/${master.id}"> <button type="button" class="btn btn-primary" >Master Page</button></a>
                    </div>

                </ul>
            </aside>
</#list>
    </div>

</@c.page>