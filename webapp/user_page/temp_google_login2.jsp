<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--    <meta charset="UTF-8">--%>


    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>

    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com">

    <title>Servlet OAuth example</title>
</head>
<body>
<h2>Servlet OAuth example</h2>
<br>
<div class="g-signin2" data-onsuccess="onSignIn" ></div>
<%--data-onsuccess="onSignIn"--%>

<script>
    //google callback. This function will redirect to our login servlet
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());

        var redirectUrl="../handle-google-login";
        var form = $('<form action="' + redirectUrl + '" method="post"'+'style="display:none">'+
            '<input type="text" name="name" value="' +
            profile.getName() + '" />' +
            '<input type="text" name="avatar" value="' +
            profile.getImageUrl() + '" />' +
            '<input type="text" name="email" value="' +
            profile.getEmail() + '" />' +
            '</form>');
        $('body').append(form);
        form.submit();
    }

</script>
</body>
</html>