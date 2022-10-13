//package fourth.service;
//
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
//import com.google.api.client.http.javanet.NetHttpTransport;
//
//import com.google.api.client.json.gson.GsonFactory;
//import org.springframework.stereotype.Service;
//
//import java.io.IOException;
//import java.security.GeneralSecurityException;
//
//@Service
//public class GoogleService {
//    GoogleIdTokenVerifier verifier =
//            new GoogleIdTokenVerifier(new NetHttpTransport(), new GsonFactory());
//
//    public void getDataByToken(String token) {
//
//        GoogleIdToken idToken = null;
//        try {
//            idToken = verifier.verify(token);
//        } catch (GeneralSecurityException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//
//        if (token != null) {
//            Payload payload = idToken.getPayload();
//
//
//            String iss = (String) payload.get("iss");
//            String sub = (String) payload.get("sub");
//            String azp = (String) payload.get("azp");
//            String aud = (String) payload.get("aud");
//            Long iat = (Long) payload.get("iat");
//            Long exp = (Long) payload.get("exp");
//
//            System.out.println("iss:" + iss);
//            System.out.println("sub:" + sub);
//            System.out.println("azp:" + azp);//授權的主持人
//            System.out.println("aud:" + aud);//ID令牌的目標受眾
//            System.out.println("iat:" + iat);
//            System.out.println("exp:" + exp);
//
//
//            String userId = payload.getSubject();
//            System.out.println("User ID: " + userId);
//
//            String email = payload.getEmail();
//            boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
//            String name = (String) payload.get("name");
//            String pictureUrl = (String) payload.get("picture");
//            String locale = (String) payload.get("locale");
//            String familyName = (String) payload.get("family_name");
//            String givenName = (String) payload.get("given_name");
//
//
//            System.out.println("email:" + email);
//            System.out.println("emailVerified:" + emailVerified);
//            System.out.println("name:" + name);
//            System.out.println("pictureUrl:" + pictureUrl);
//            System.out.println("locale:" + locale);
//            System.out.println("familyName:" + familyName);
//            System.out.println("givenName:" + givenName);
//
//        } else {
//            System.out.println("Invalid ID token.");
//        }
//
//
//    }
//
//}