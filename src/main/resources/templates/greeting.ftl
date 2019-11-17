<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>


<h3>Hello, ${name}!</h3>
    <h5>Welcome to simple app</h5>
    What was used in development

    <ul>
        <li>JDK 1.8</li>
        <li>mySQL</li>
        <li>Spring Boot 2.1.6.RELEASE</li>
        <li>Maven</li>
        <li>Freemarker</li>
    </ul>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Method</th>
            <th scope="col">Path</th>
            <th scope="col">Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>POST</td>
            <td><a href="/login.ftl">/login</a></td>
            <td>User authentication</td>
        </tr>
        <tr>
            <td>POST</td>
            <td><a href="/registration">/registration</a></td>
            <td>User registration</td>
        </tr>
        </tbody>
    </table>

    <strong>User</strong>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Method</th>
            <th scope="col">Path</th>
            <th scope="col">Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <td>GET</td>
            <td><a href="userList.ftl">/user</a></td>
            <td>Get all users data, access only masters</td>
        </tr>
        <tr>

            <td>GET</td>
            <td><a href="userEdit.ftl">/user/{id}</a></td>
            <td>Get specified user data</td>
        </tr>
        <tr>

            <td>POST</td>
            <td>/user/{id}</td>
            <td>Edit specified user data</td>
        </tr>
        </tbody>
    </table>


    <strong>Message</strong>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Method</th>
            <th scope="col">Path</th>
            <th scope="col">Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <td>GET</td>
            <td><a href="messages.ftl">/messages</a></td>
            <td>Get all messages data</td>
        </tr>
        <tr>

            <td>POST</td>
            <td>/messageDelete/{id}</td>
            <td>Delete specified messages data, access for users</td>
        </tr>
        <tr>

            <td>POST</td>
            <td>/messageActive/{id}</td>
            <td>Active specified messages data, access for masters</td>
        </tr>
        </tbody>
    </table>
    <strong>User instruction</strong>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Method</th>
            <th scope="col">Path</th>
            <th scope="col">Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>

            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>

            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>
</@c.page>
