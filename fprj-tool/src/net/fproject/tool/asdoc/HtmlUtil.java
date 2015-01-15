package net.fproject.tool.asdoc;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.fproject.tool.ToolUtil;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Node;
import org.htmlparser.PrototypicalNodeFactory;
import org.htmlparser.Tag;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.ParagraphTag;
import org.htmlparser.tags.Span;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class HtmlUtil {
	private static Parser htmlParser;
	private static NodeList currentRootNodeList;

	public static void setCurrentRootNodeList(NodeList currentRootNodeList) {
		HtmlUtil.currentRootNodeList = currentRootNodeList;
	}

	public static Parser getParser() {
		if (htmlParser == null) {
			htmlParser = new Parser();
			Parser.getConnectionManager().setRedirectionProcessingEnabled(true);
			Parser.getConnectionManager().setCookieProcessingEnabled(true);
		}

		return htmlParser;
	}

	public static Node parseNode(String html) {
		Parser p = getParser();
		try {
			p.setResource(html);
			return p.parse(null).elementAt(0);
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static Set<String> CONTENT_ALLOWED_TAGS = new HashSet<String>(
			Arrays.asList("B", "STRONG", "P", "CODE", "OL", "UL", "LI", "PRE"));

	public static boolean contentAllowedTag(Node node) {
		if (!(node instanceof Tag))
			return false;
		else
			return (CONTENT_ALLOWED_TAGS.contains(((Tag) node).getTagName()
					.toUpperCase()));
	}

	private static Set<String> KEEP_ORIGINAL_CONTENT_TAGS = new HashSet<String>(
			Arrays.asList("PRE"));

	public static boolean keepOriginalContentTag(Node node) {
		if (!(node instanceof Tag))
			return false;
		else
			return (KEEP_ORIGINAL_CONTENT_TAGS.contains(((Tag) node)
					.getTagName().toUpperCase()));
	}

	private static Set<String> SKIP_BL_TAGS = new HashSet<String>(
			Arrays.asList("B", "STRONG", "CODE", "LI", "TBODY", "TR", "TH",
					"TD"));

	public static boolean skipBreakLineTag(Node node) {
		if (node instanceof TextNode)
			return true;
		else if (!(node instanceof Tag))
			return false;
		else
			return (SKIP_BL_TAGS.contains(((Tag) node).getTagName()
					.toUpperCase()));
	}

	private static Set<String> SKIP_BL_SUBTAGS = new HashSet<String>(
			Arrays.asList("B", "STRONG", "P", "CODE", "TD"));

	public static boolean skipBreakLineSubTag(Node node) {
		if (!(node instanceof Tag))
			return false;
		else
			return (SKIP_BL_SUBTAGS.contains(((Tag) node).getTagName()
					.toUpperCase()));
	}

	public static String toHtml(NodeList nodes, int lineBreakThresold) {
		if (nodes == null)
			return "";
		StringBuffer sb = new StringBuffer();
		int currentLength = 0;
		for (int i = 0; i < nodes.size(); i++) {
			Node node = nodes.elementAt(i);
			if (i > 0 && !skipBreakLineTag(node)) {
				sb.append("\r\n");
				currentLength = 0;
			}
			String s = toHtml(node);
			if (HtmlUtil.keepOriginalContentTag(node)) {
				sb.append(s);
				currentLength = 0;
			} else {
				String[] lines = s.split("\r\n");
				List<String> breakLines = new ArrayList<String>();
				if (lines.length > 0)
					breakLines.addAll(ToolUtil.breakText(lines[0],
							lineBreakThresold, lineBreakThresold
							- currentLength));
				for (int j = 1; j < lines.length; j++) {
					String line = ToolUtil.trim(lines[j]);
					breakLines.addAll(ToolUtil.breakText(line,
							lineBreakThresold));
				}
				if (breakLines.size() >= 1) {
					if (currentLength > 0 && !breakLines.get(0).startsWith("."))
						sb.append(" ");
					currentLength++;
					if (currentLength + breakLines.get(0).length() > lineBreakThresold) {
						List<String> brLines = ToolUtil.breakText(
								breakLines.get(0), lineBreakThresold,
								lineBreakThresold - currentLength);
						for (int k = 0; k < brLines.size(); k++) {
							if (k > 0 || currentLength == 0
									|| brLines.size() == 1)
								sb.append("\r\n");

							sb.append(brLines.get(k).trim());
						}
						currentLength = brLines.get(brLines.size() - 1)
								.length();
					} else {
						if (!"".equals(breakLines.get(0).trim()))
							sb.append(breakLines.get(0).trim());
						currentLength += breakLines.get(0).length();
					}
				}

				for (int j = 1; j < breakLines.size(); j++) {
					String line = breakLines.get(j);
					if (line != null && !"".equals(line)) {
						sb.append("\r\n");
						currentLength = 0;
						if (!"".equals(line.trim()))
							sb.append(line.trim());
					}
				}
			}
		}
		return sb.toString();
	}

	public static String toHtml(Node node) {
		if (keepOriginalContentTag(node))
			return node.toHtml();
		if (node.getChildren() == null || !(node instanceof TagNode)) {
			String s = node.toHtml();
			s = ToolUtil.replaceNonPrintableCharBySpace(s);
			s = ToolUtil.unbreakTrim(s);
			s = ToolUtil.replaceTwoSpace(s);
			return s;
		} else {
			TagNode tn = (TagNode) node;

			StringBuffer sb = new StringBuffer();
			sb.append("<" + tn.getTagName().toLowerCase() + ">");

			NodeList nl = node.getChildren();
			int count = nl.size();

			if (!skipBreakLineTag(tn))
				sb.append("\r\n");

			Node childNode;
			for (int i = 0; i < count; i++) {
				childNode = nl.elementAt(i);
				if (i > 0)
					if (childNode instanceof TagNode
							&& !skipBreakLineSubTag(childNode))
						sb.append("\r\n");
					else
						sb.append(" ");
				sb.append(toHtml(childNode));
			}
			if (!skipBreakLineTag(tn))
				sb.append("\r\n");

			sb.append("</" + tn.getTagName().toLowerCase() + ">");

			return sb.toString();
		}
	}

	public static List<Tag> getRegisteredTags() {
		PrototypicalNodeFactory pnf = (PrototypicalNodeFactory) getParser()
				.getNodeFactory();
		if (pnf != null)
			return pnf.getRegisteredTags();
		else
			return null;
	}

	@SuppressWarnings("rawtypes")
	public static NodeFilter buildClassAttributeFilter(final Class c,
			final String attributeName, final String attributeValue) {
		@SuppressWarnings("serial")
		NodeFilter filter = new NodeFilter() {
			Class clazz = c;
			String attName = attributeName;
			String attValue = attributeValue;

			@Override
			public boolean accept(Node node) {

				if (clazz.isInstance(node)) {
					Tag tn = (Tag) node;
					String att = tn.getAttribute(attName);
					if (att != null && attValue.equalsIgnoreCase(att.trim())) {
						return true;
					} else
						return false;
				} else
					return false;
			}
		};

		return filter;
	}

	public static Tag searchByName(String name, boolean recursive) {
		NodeList nl = searchFor(currentRootNodeList, Tag.class, "NAME", name,
				recursive);
		if (nl.size() > 0)
			return (Tag) nl.elementAt(0);
		return null;
	}

	/**
	 * Collect all objects that are of a certain type Note.
	 * 
	 * @param classType
	 *            The class to search for.
	 * @param recursive
	 *            If true, recursively search through the children.
	 * @return A list of children found.
	 */
	@SuppressWarnings({ "rawtypes" })
	public static NodeList searchFor(Node node, Class classType,
			String attributeName, String attributeValue, boolean recursive) {
		NodeList children = node.getChildren();
		return searchFor(children, classType, attributeName, attributeValue,
				recursive);
	}

	/**
	 * Collect all objects that are of a certain type Note.
	 * 
	 * @param classType
	 *            The class to search for.
	 * @param recursive
	 *            If true, recursively search through the children.
	 * @return A list of children found.
	 */
	@SuppressWarnings({ "rawtypes" })
	public static NodeList searchFor(NodeList nodes, Class classType,
			String attributeName, String attributeValue, boolean recursive) {
		if (null == nodes)
			return new NodeList();
		else {
			NodeFilter filter = buildClassAttributeFilter(classType,
					attributeName, attributeValue);
			return nodes.extractAllNodesThatMatch(filter, recursive);
		}
	}

	public static String extractPropertyFromNodeList(NodeList nodeList,
			String propNameRegex, boolean isEndOfList) {
		String propValue = null;
		int i = 0;
		Pattern pattern = Pattern.compile(propNameRegex);
		while (i < nodeList.size()) {
			Node node = nodeList.elementAt(i);
			if (node instanceof Span || node instanceof TextNode
					|| node instanceof ParagraphTag) {
				String s = ToolUtil.trim(node.toPlainTextString());
				if (s != null) {

					Matcher matcher = pattern.matcher(s);
					if (matcher.find()) {
						Node typeNode = node.getNextSibling();
						if (typeNode != null) {
							propValue = ToolUtil.unbreakTrim(typeNode
									.toPlainTextString());
							nodeList.remove(i + 1);
							if (isEndOfList) {
								int j = i + 1;
								while (j < nodeList.size()) {
									nodeList.remove(j);
									j++;
								}
							}
						}

						nodeList.remove(i);

						s = ToolUtil.trim(s.substring(0, matcher.start()));
						if (!"".equals(s)) {
							TextNode tn = new TextNode(s);
							nodeList.add(tn);
						}

						break;
					}
				}
			}
			i++;
		}

		return propValue;
	}

	public static String nodeListToPlainTextString(NodeList nl) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < nl.size(); i++) {
			sb.append(nl.elementAt(i).toPlainTextString());
		}
		return sb.toString();
	}

	public static String toPlainTextString(String s) {
		if (s == null)
			return null;
		s = s.replaceAll("&nbsp;", " ");
		s = s.replaceAll("&lt;", "<");
		s = s.replaceAll("&gt;", ">");
		return s;
	}
}
