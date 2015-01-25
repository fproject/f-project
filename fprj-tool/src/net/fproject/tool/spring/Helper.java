package net.fproject.tool.spring;

import java.sql.Connection;

public class Helper {
	private static long autoNameIncrement = 0;

	// public static String schema = "fi2";
	public static Schema _schema = null;
	// public static String targetSchema = null;
	public static Schema _targetSchema = null;
	public static String packageName = "~.common.entity";
	public static Connection connection = null;
	public static Connection targetConnection = null;

	// public static Statement statement = null;
	// public static Statement targetStatement = null;

	// Singleton
	public static Schema schema() {
		if (_schema == null) {
			_schema = new Schema();
		}
		return _schema;
	}

	// Singleton
	public static Schema targetSchema() {
		if (_targetSchema == null) {
			_targetSchema = new Schema();
		}
		return _targetSchema;
	}

	// NguyenBS corrected
	public static String convertToCamelName(String str) {
		String newStr = "";
		// for (int i = 0; i < str.length(); i++) {
		// if (str.charAt(i) == '_') {
		// str = str.substring(0, i + 1)
		// + Character.toUpperCase(str.charAt(i + 1))
		// + str.substring(i + 2);
		// }
		// }
		// for (int i = 0; i < str.length(); i++) {
		// if (str.charAt(i) != '_')
		// newStr += str.charAt(i);
		// }
		boolean isBeginOfWord = true;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '_') {
				isBeginOfWord = true;
			} else {
				if (!isBeginOfWord
						|| newStr.length() == 0
						|| (isBeginOfWord && Character.isUpperCase(newStr
								.charAt(newStr.length() - 1))))
					newStr += Character.toLowerCase(str.charAt(i));
				else
					newStr += Character.toUpperCase(str.charAt(i));
				isBeginOfWord = false;
			}
		}
		if (newStr.length() == 0) {
			autoNameIncrement++;
			newStr = "AutoName" + autoNameIncrement;
		}
		return newStr;
	}

	// NguyenBS added
	public static String convertToPascalName(String str) {
		String newStr = convertToCamelName(str);
		newStr = newStr.substring(0, 1).toUpperCase() + newStr.substring(1);

		// phongph1 added
		if (Character.isUpperCase(newStr.charAt(1))) {
			newStr = newStr.substring(0, 1)
					+ Character.toLowerCase(newStr.charAt(1))
					+ newStr.substring(2);
		}
		return newStr;
	}

	public static String convertToCstyleName(String str) {
		String newStr = "";
		boolean isEndOfWord;
		for (int i = 0; i < str.length(); i++) {
			if (i < str.length() - 1) {
				if (Character.isUpperCase(str.charAt(i + 1))
						|| !Character.isLetterOrDigit(str.charAt(i + 1))) {
					isEndOfWord = true;
				} else {
					isEndOfWord = false;
				}
			} else {
				isEndOfWord = true;
			}

			if (isEndOfWord && i < str.length() - 1
					&& Character.isLetterOrDigit(str.charAt(i))) {
				newStr += Character.toLowerCase(str.charAt(i)) + "_";
			}
			else if (Character.isLetterOrDigit(str.charAt(i))){
				newStr += Character.toLowerCase(str.charAt(i));
			}
		}

		return newStr;
	}
	
	public static String convertToCstyleConstantName(String str) {
		return convertToCstyleName(str).toUpperCase();
	}

	public static String getSqlEscapeString(String str) {
		if (str == null)
			return null;
		String strReturn = str.replace("\r", "\\r");
		strReturn = strReturn.replace("\n", "\\n");
		strReturn = strReturn.replace("\"", "\\\"");
		strReturn = strReturn.replace("\'", "\\'");
		return strReturn;
	}
}
