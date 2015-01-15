package net.fproject.tool;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ToolUtil {
	
	public static String[] textToArray(String text) {
		List<String> lst = new ArrayList<String>();
		int i = 0;
		StringBuffer sb = new StringBuffer();
		while (i < text.length()) {
			if('\r' == text.charAt(i) && i + 1 < text.length() && '\n' == text.charAt(i + 1))
			{
				i++;
			}
			if('\r' == text.charAt(i) || '\n' == text.charAt(i))
			{
				lst.add(sb.toString());
				sb = new StringBuffer();
			}
			else
				sb.append(text.charAt(i));
			i++;
		}
		lst.add(sb.toString());
		return lst.toArray(new String[0]);
	}
	
	public static String replaceTwoSpace(String s) {
		StringBuffer sb = new StringBuffer();
		int i = 0;
		while (i < s.length()) {
			char c = s.charAt(i);
			if (c == ' ') {
				while (i + 1 < s.length() && s.charAt(i + 1) == ' ') {
					i++;
				}
			}
			sb.append(c);
			i++;
		}
		return sb.toString();
	}

	public static String replaceNonPrintableCharBySpace(String s) {
		// Replace ASCII control characters (shorthand for
		// [\x00-\x1F\x7F]) by space
		s = s.replaceAll("\\r|\\n", "{nl;}");
		s = s.replaceAll("\\p{Cntrl}", " ");
		// Replace all ASCII non-printable characters (shorthand for
		// [\p{Graph}\x20]),
		// including accented characters by space
		s = s.replaceAll("[^\\p{Print}]", "");
		// Remove non-printable Unicode characters
		s = s.replaceAll("\\p{C}", "?");
		s = s.replaceAll("(\\{nl;\\})+", "\r\n");
		return s;
	}

	public static String trim(String s) {
		if (s == null)
			return null;
		return s.replaceAll("\\r|\\n", " ").trim();
	}

	public static String spotTrim(String s) {
		if (s == null)
			return null;
		s = s.trim();
		while (s.endsWith("."))
			s = s.substring(0, s.length() - 1);
		while (s.startsWith("."))
			s = s.substring(1);
		return s;
	}

	public static String nbspTrim(String s) {
		if (s == null)
			return null;
		s = s.trim();
		while (s.endsWith("&nbsp;"))
			s = s.substring(0, s.length() - 6);
		while (s.startsWith("."))
			s = s.substring(6);
		return s;
	}

	public static String unbreakTrim(String s) {
		if (s == null)
			return null;
		return s.replaceAll("\\r|\\n|(&nbsp;)+", " ").trim();
	}

	public static List<String> breakText(String s, int length) {
		return breakText(s, length, 0);
	}

	public static List<String> breakText(String s, int length, int firstPosition) {
		List<String> lines = new ArrayList<String>();
		if (s == null)
			return lines;

		String line = s.replaceAll(" \\.", ".").trim();
		line = s.replaceAll(" ,", ",").trim();
		
		while (line.length() > length
				|| (firstPosition > 0 && firstPosition < line.length())) {
			int breakPos;
			if (firstPosition > 0 && firstPosition < length)
				breakPos = firstPosition;
			else
				breakPos = length;
			firstPosition = 0;
			while (breakPos > 0 && line.charAt(breakPos - 1) != ' ')
				breakPos--;
			if (breakPos > 0) {
				s = line.substring(0, breakPos).trim();
				if (!"".equals(s))
					lines.add(s);
				line = line.substring(breakPos).trim();
			} else
				break;
		}
		if (!"".equals(line.trim()))
			lines.add(line.trim());
		return lines;
	}
	
	public static boolean compareTwoStringArrays(String[] a1, String[] a2) {
		if (a1 == null && a2 == null)
			return true;
		if (a1 == null || a2 == null)
			return false;
		if (a1.length != a2.length)
			return false;
		for (int i = 0; i < a1.length ; i++) {
			if (a1[i] == null && a2[i] != null)
				return false;
			else if (a1[i] != null && !a1[i].equals(a2[i]))
				return false;
		}
		return true;
	}
	
    /**
     * <p>Joins the elements of the provided array into a single String
     * containing the provided list of elements.</p>
     *
     * <p>No delimiter is added before or after the list.
     * Null objects or empty strings within the array are represented by
     * empty strings.</p>
     *
     * <pre>
     * StringUtils.join(null, *)               = null
     * StringUtils.join([], *)                 = ""
     * StringUtils.join([null], *)             = ""
     * StringUtils.join(["a", "b", "c"], ';')  = "a;b;c"
     * StringUtils.join(["a", "b", "c"], null) = "abc"
     * StringUtils.join([null, "", "a"], ';')  = ";;a"
     * </pre>
     *
     * @param array  the array of values to join together, may be null
     * @param separator  the separator character(s) to use
     * @return the joined String, <code>null</code> if null array input
     */
    public static String joinStrings(String[] array, String separator) {
        return joinStrings(array, separator, 0, array.length);
    }
    
    /**
     * <p>Joins the elements of the provided array into a single String
     * containing the provided list of elements.</p>
     *
     * <p>No delimiter is added before or after the list.
     * Null objects or empty strings within the array are represented by
     * empty strings.</p>
     *
     * <pre>
     * StringUtils.join(null, *)               = null
     * StringUtils.join([], *)                 = ""
     * StringUtils.join([null], *)             = ""
     * StringUtils.join(["a", "b", "c"], ';')  = "a;b;c"
     * StringUtils.join(["a", "b", "c"], null) = "abc"
     * StringUtils.join([null, "", "a"], ';')  = ";;a"
     * </pre>
     *
     * @param array  the array of values to join together, may be null
     * @param separator  the separator character(s) to use
     * @param startIndex the first index to start joining from.  It is
     * an error to pass in an end index past the end of the array
     * @param endIndex the index to stop joining from (exclusive). It is
     * an error to pass in an end index past the end of the array
     * @return the joined String, <code>null</code> if null array input
     */
    public static String joinStrings(String[] array, String separator, int startIndex, int endIndex) {
        if (array == null) {
            return null;
        }
        int bufSize = (endIndex - startIndex);
        if (bufSize <= 0) {
            return "";
        }

        bufSize *= 100;
        StringBuffer buf = new StringBuffer(bufSize);

        for (int i = startIndex; i < endIndex; i++) {
            if (i > startIndex) {
                buf.append(separator);
            }
            if (array[i] != null) {
                buf.append(array[i]);
            }
        }
        return buf.toString();
    }
    
    public static int indexOf(String s, String regex) {
    	Pattern p = Pattern.compile(regex);
    	Matcher matcher = p.matcher(s);
    	if (matcher.find())
    		return matcher.start();
    	else
    		return -1;
    }
}
