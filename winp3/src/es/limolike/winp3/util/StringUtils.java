package es.limolike.winp3.util;

import org.apache.commons.lang.RandomStringUtils;

public class StringUtils {

	private final static String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
	
	public static String generaPassword(){
		return RandomStringUtils.random( 15, CHARACTERS );
	}
}
