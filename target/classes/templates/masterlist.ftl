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
                    <h1>${master.firstName} ${master.lastName}</h1>
                    <h2>${master.phone}</h2>
                </header>

                <div class="profile-bio">
                    <p>${master.description}</p>
                </div>


                <ul class="profile-social-links">
                    <li>
                        <a href="https://${master.socialLink}" target="_blank">
                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg">
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