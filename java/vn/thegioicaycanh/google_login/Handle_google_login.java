package vn.thegioicaycanh.google_login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.security.GeneralSecurityException;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.LowLevelHttpRequest;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;

@WebServlet(urlPatterns = "/handle-google-login")
public class Handle_google_login extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String code = request.getParameter("code");
//        if (code == null || code.isEmpty()) {
//            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
//            dis.forward(request, response);
//            System.out.println("Code=null");
//        } else {
//            String accessToken = GoogleUtils.getToken(code);
//            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
//            request.setAttribute("id", googlePojo.getId());
//            request.setAttribute("name", googlePojo.getName());
//            request.setAttribute("email", googlePojo.getEmail());
//            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
//            dis.forward(request, response);
//            System.out.println("co thong tin tai khoan roi ban oi");
//        }
//
//    }
    private static final long serialVersionUID = 1L;

    public Handle_google_login() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

//        System.out.println("entering doGet");
//        try {
//            // get code
//            String code = request.getParameter("code");
//            // format parameters to post
//            String urlParameters = "code="
//                    + code
//                    + "&client_id=838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com"
//                    + "&client_secret=zFLHqZ9nRJmBMydD7oczxGBu"
//                    + "&redirect_uri=http://localhost:8080/thegioicaycanh.vn/handle-google-login"
//                    + "&grant_type=authorization_code";

            //post parameters
//            URL url = new URL("https://accounts.google.com/o/oauth2/token");
//            URLConnection urlConn = url.openConnection();
//            urlConn.setDoOutput(true);
//            OutputStreamWriter writer = new OutputStreamWriter(
//                    urlConn.getOutputStream());
//            writer.write(urlParameters);
//            writer.flush();
//
//            //get output in outputString
//            String line, outputString = "";
//            BufferedReader reader = new BufferedReader(new InputStreamReader(
//                    urlConn.getInputStream()));
//            while ((line = reader.readLine()) != null) {
//                System.out.println("co vo outputString +=line");
//                System.out.println(outputString);
//                outputString += line;
//            }
//            System.out.println(outputString);
//
//            //get Access Token
//            JsonObject json = (JsonObject) new JsonParser().parse(outputString);
//            String access_token = json.get("access_token").getAsString();
//            System.out.println(access_token);
//
//            //get User Info
//            url = new URL(
//                    "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
//                            + access_token);
//            urlConn = url.openConnection();
//            outputString = "";
//            reader = new BufferedReader(new InputStreamReader(
//                    urlConn.getInputStream()));
//            while ((line = reader.readLine()) != null) {
//                outputString += line;
//            }
//            System.out.println(outputString);
//
//            // Convert JSON response into Pojo class
//            GooglePojo data = new Gson().fromJson(outputString, GooglePojo.class);
//            System.out.println(data);
//            writer.close();
//            reader.close();
//
//        } catch (MalformedURLException e) {
//            System.out.println(e);
//        } catch (ProtocolException e) {
//            System.out.println(e);
//        } catch (IOException e) {
//            System.out.println(e);
//        }
//        System.out.println("leaving doGet");
//            try {
//                String idToken = request.getParameter("id_token");
//                GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(idToken);
//                String name = (String) payLoad.get("name");
//                String email = payLoad.getEmail();
//                System.out.println("User name: " + name);
//                System.out.println("User email: " + email);

//                HttpSession session = req.getSession(true);
//                session.setAttribute("userName", name);
//                req.getServletContext()
//                        .getRequestDispatcher("/welcome-page.jsp").forward(req, resp);

//            } catch (Exception e) {
//                throw new RuntimeException(e);
//            }
//        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new JacksonFactory())
//                // Specify the CLIENT_ID of the app that accesses the backend:
//                .setAudience(Collections.singletonList("838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com"))
//                // Or, if multiple clients access the backend:
//                //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
//                .build();
//
//// (Receive idTokenString by HTTPS POST)
//        String idTokenString = request.getParameter("idtoken");
//        GoogleIdToken idToken = null;
//        try {
//            idToken = verifier.verify(idTokenString);
//        } catch (GeneralSecurityException e) {
//            e.printStackTrace();
//        }
//        if (idToken != null) {
//            Payload payload = idToken.getPayload();
//
//            // Print user identifier
//            String userId = payload.getSubject();
//            System.out.println("User ID: " + userId);
//
//            // Get profile information from payload
//            String email = payload.getEmail();
//            boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
//            String name = (String) payload.get("name");
//            String pictureUrl = (String) payload.get("picture");
//            String locale = (String) payload.get("locale");
//            String familyName = (String) payload.get("family_name");
//            String givenName = (String) payload.get("given_name");
//
////             Use or store profile information
////             ...
//
//        } else {
//            System.out.println("Invalid ID token.");
//        }
        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("avatar"));
        System.out.println(request.getParameter("email"));
        request.setAttribute("name",request.getParameter("name"));
        request.setAttribute("avatar",request.getParameter("avatar"));
        request.setAttribute("email",request.getParameter("email"));
        request.getRequestDispatcher("user_page/tien.jsp").forward(request,response);
    }
}
