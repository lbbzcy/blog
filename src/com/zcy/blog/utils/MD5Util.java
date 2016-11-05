package com.zcy.blog.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 采用MD5加密解密
 * @author tarena
 *
 */
public class MD5Util {
	/**
	 * MD5加码，生成32位md5码
	 * @param inStr
	 * @return
	 */
	public static String string2MD5(String inStr){
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];
		
		for(int i=0;i<charArray.length;i++){
			byteArray[i] = (byte) charArray[i];
		}
		byte[] md5Bytes = md5.digest(byteArray);
		
		StringBuffer hexValue = new StringBuffer();
		for(int i=0;i<md5Bytes.length;i++){
			int val = md5Bytes[i]&0xff;
			if(val<16){
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
	/**
	 * 加密解密算法，执行一次加密，两次解密
	 */
	public static String convertMD5(String inStr){
		char[] a = inStr.toCharArray();
		for(int i=0;i<a.length;i++){
			a[i] = (char) (a[i]^'t');
		}
		String s = new String(a);
		return s;
	}
	//测试主函数
	public static void main(String[] args) {
		String s = new String ("123");
		String s2 = new String("123");
		String s3 = new String("145");
		s = string2MD5(s);
		s2 = string2MD5(s2);
		s3 = string2MD5(s3);
		System.out.println(s.equals(s2));
		System.out.println(s3.equals(s2));
		System.out.println("原始:"+s);
		System.out.println("MD5后:"+s);
		System.out.println("加密的:"+convertMD5(s));
		System.out.println("解密的:"+convertMD5(convertMD5(s)));
	}
}
