<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>



<@c.page>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />



    <div>Список </div>
    <div class="card-columns">

        <aside class="profile-card">
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


                </ul>
            </aside>
        </aside>
    </div>

<#--    test-->
    <#if !isMaster>
        <div>
            <button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Добавить заявку</button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Регистрация заявки</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Укажите дату/время:</label>
                                    <input id="input" width="234" name="date"/>
                                    <script>
                                        $('#input').datetimepicker({
                                            uiLibrary: 'bootstrap4',
                                            modal: true,
                                            footer: true
                                        });
                                    </script>
                                </div>

                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Комментарий:</label>
                                    <textarea class="form-control" id="message-text" name="comment" placeholder="Введите ваши пожелания.."></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary" onclick="testAlert()">Добавить</button>
                                    <script>
                                        function testAlert() {
                                            alert("Great, ${name}! Wait for confirmation from the Master.");
                                        }
                                    </script>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </#if>
<#--    end test-->

    <div>Список заявок</div>
    <div class="card-columns">

    <#list messages as message>

        <div class="card my-3">
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
                <div><span>${message.comment}</span></div>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}

                <#if message.active=true> <i class="fas fa-check-circle"></i>
                <#else ><i class="fas fa-spinner"></i>
                </#if>
                <div>tel.  ${message.phoneNumber}</div>
            </div>
            <#if isMaster>
            <div class="card-footer text-muted">

                <form action="/messageActive/${message.id}" method="post">

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary">Activate</button>
                </form>
            </div>
                <#else>
                    <#if message.active=false>
                    <form action="/messageDelete/${message.id}" method="post">

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary">DELETE</button>
                    </form>
                    </#if>
            </#if>
        </div>


    <#else>
        No message
    </#list>




    <script src="https://kit.fontawesome.com/45a1881b0b.js" crossorigin="anonymous"></script>
</@c.page>