<#import "parts/common.ftl" as c>


<@c.page>
    Master editor
    <div>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                data-whatever="@mdo">Create:
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Редактировать профиль</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" enctype="multipart/form-data">
                            <div class='form-group'>
                                <label class='col-md-4 control-label' for='textinput'>Имя</label>
                                <div>
                                    <input class='form-control input-md' id='textinput' name='firstName'
                                           style='cursor: auto'
                                           type='text'>
                                </div>
                            </div>

                            <div class='form-group'>
                                <label class='col-md-4 control-label' for='textinput'>Фамилия</label>
                                <div>
                                    <input class='form-control input-md' id='textinput' name='lastName'
                                           style='cursor: auto'
                                           type='text'>
                                </div>
                            </div>

                            <div class='form-group'>
                                <label class='col-md-4 control-label' for='textinput'>SocLink</label>
                                <div>
                                    <input class='form-control input-md' id='textinput' name='socialLink'
                                           style='cursor: auto'
                                           type='text'>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class='col-md-4 control-label' for='prependedtext'>Тел.</label>
                                <div>
                                    <div class='input-group'>
                                        <span class='input-group-addon'>+380-</span>
                                        <input class='form-control' id='prependedtext' name='phone' type='text'>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Description profile:</label>
                                <textarea class="form-control" id="message-text" name="description"
                                          placeholder="Enter your best skills.."></textarea>
                            </div>
                            <div class="form-group">
                                <label for='prependedtext'>Загрузить фото:</label>
                                <div class="custom-file">
                                    <input type="file" name="photo" id="customFile">

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </div>

<#--        ==========Cards==========-->

    <div>Список </div>
    <div class="card-columns">

        <#list masters as master>
            <aside class="profile-card">
                <header>
                    <!-- here’s the avatar -->
                    <#if master.photo??>
                    <a href="#">
                        <img src="/img/${master.photo}">
                    </a>
                    </#if>
                    <!-- the username -->
                    <h1>${master.firstName} ${master.lastName}</h1>

                    <!-- and role or location -->
                    <h2>${master.phone}</h2>
                </header>

                <!-- bit of a bio; who are you? -->
                <div class="profile-bio">
                    <p>${master.description}</p>
                </div>

                <!-- some social links to show off -->
                <ul class="profile-social-links">
                    <!-- twitter - el clásico  -->
                    <li>
                        <a href="https://${master.socialLink}" target="_blank">
                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-twitter.svg">
                        </a>
                    </li>

                    <!-- envato – use this one to link to your marketplace profile -->
                    <li>
                        <a href="http://themeforest.net/user/Bluminethemes">
                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/social-envato.svg">
                        </a>
                    </li>

                    <#--    test-->
                    <div>
                        <a href="/main"> <button type="button" class="btn btn-primary" >Add task</button></a>
                    </div>
                    <!-- add or remove social profiles as you see fit -->
                </ul>
            </aside>
        </#list>
    </div>


</@c.page>