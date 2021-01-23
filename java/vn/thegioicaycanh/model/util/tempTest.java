package vn.thegioicaycanh.model.util;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.util.List;

public class tempTest {
//    public static void main(String[] args) {
//        System.out.println(LoadHeaderFooter.loadHeader());
//        List<Product>discounts= ProductEntity.loadDiscountProducts(8);
//        System.out.println(discounts.size());
//        String email ="nhatthy1224@gmail.com";
//        int id = 5;
//        String password ="123456789T";
//        System.out.println(id*email.hashCode()*password.hashCode());
//        String value = "this";
//
//        String sha1 = "";
//
//        // With the java libraries
//        try {
//            MessageDigest digest = MessageDigest.getInstance("SHA-1");
//            digest.reset();
//            digest.update(value.getBytes("utf8"));
//            sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//
//        System.out.println( "The sha1 of \""+ value + "\" is:");
//        System.out.println( sha1 );
//        System.out.println();
//    }
    public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String toHexString(byte[] hash)
    {
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);

        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));

        // Pad with leading zeros
        while (hexString.length() < 32)
        {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }

    // Driver code
    public static void main(String args[])
    {
//        try
//        {
//            String email ="nhatthy1224@gmail.com";
//        int id = 5;
//        String password ="123456789T";
//            System.out.println("HashCode Generated by SHA-256 for:");
//
//            String s1 = "GeeksForGeeks";
//            System.out.println("\n" + s1 + " : " + toHexString(getSHA(s1)));
//
////            String s2 = String.valueOf(email.hashCode()*id*password.hashCode());
//            String s2 = password;
//            String result = toHexString(getSHA(s2));
//            System.out.println("\n" + s2 + " : " + result+" Len: "+result.length());
//        }
//        // For specifying wrong message digest algorithms
//        catch (NoSuchAlgorithmException e) {
//            System.out.println("Exception thrown for incorrect algorithm: " + e);
//        }
//    }


//        File file = new File(".\\src\\main\\webapp\\imgs\\temp_imgs");
//        try {
//            System.out.println(file.getCanonicalPath());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        if(file.exists())
//            System.out.println("Ton tai");
        String convertedString =
                Normalizer
                        .normalize("Trịnh Quang Tiến", Normalizer.Form.NFD)
                        .replaceAll("[^\\p{ASCII}]", "").replaceAll(" ","-");
        System.out.println(convertedString);
    }

}
