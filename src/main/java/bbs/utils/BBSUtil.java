package bbs.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//import org.apache.commons.codec.binary.Base64;

public class BBSUtil {
//	public static String encrypt(String target){
//		// パスワードを暗号化する
////		return new BCryptPasswordEncoder().encode(target);
//		try{
//			MessageDigest md = MessageDigest.getInstance("SHA-256");
//			md.update(target.getBytes());
//			return Base64.encodeBase64String(md.digest());
//		} catch (NoSuchAlgorithmException e){
//			throw new RuntimeException(e);
//		}
//	}

	//改行コードを<br>に変換
	public static String lineSeparatorEncoder(String target){
		String decode;
		decode = target.replaceAll(System.lineSeparator(), "<br>");
		return decode;
	}

	/** HTMLエンコードが必要な文字 **/
	  static char[] htmlEncChar = {'&', '"', '<', '>'};
	  /** HTMLエンコードした文字列 **/
	  static String[] htmlEncStr = {"&amp;", "&quot;", "&lt;", "&gt;"};

	  /**
	  * HTMLエンコード処理。
	  *   &,",<,>の置換
	  **/
	  public static String htmlEncode (String strIn) {
	    if (strIn == null) {
	      return(null);
	    }

	    // HTMLエンコード処理
	    StringBuffer strOut = new StringBuffer(strIn);
	    // エンコードが必要な文字を順番に処理
	    for (int i = 0; i < htmlEncChar.length; i++) {
	      // エンコードが必要な文字の検索
	      int idx = strOut.toString().indexOf(htmlEncChar[i]);

	      while (idx != -1) {
	        // エンコードが必要な文字の置換
	        strOut.setCharAt(idx, htmlEncStr[i].charAt(0));
	        strOut.insert(idx + 1, htmlEncStr[i].substring(1));

	        // 次のエンコードが必要な文字の検索
	        idx = idx + htmlEncStr[i].length();
	        idx = strOut.toString().indexOf(htmlEncChar[i], idx);
	      }
	    }
	    return lineSeparatorEncoder(strOut.toString());
	  }
}
