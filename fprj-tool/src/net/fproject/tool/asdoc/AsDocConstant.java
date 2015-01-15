package net.fproject.tool.asdoc;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Tag;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.CodeTag;
import org.htmlparser.tags.LineBreakTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;

public class AsDocConstant extends AsDocClassMember {
	public boolean isStatic;
	public String eventType;

	@Override
	protected NodeList parseContentFromDetailElement(TableColumn summaryColumn) {
		NodeList nodes = this.memberDetail.contentNodes;
		NodeList eventContent = new NodeList();
		Node node;
		int i = 0;

		// Implementation
		while (i < nodes.size()) {
			node = nodes.elementAt(i);
			if (node instanceof CodeTag) {
				parseFromImpl(ToolUtil.trim(node.toPlainTextString()));
				i++;
				break;
			}
			i++;
		}

		while (i < nodes.size()) {
			eventContent.add(nodes.elementAt(i));
			i++;
		}
		return eventContent;
	}

	private void parseFromImpl(String impl) {
		int equalPos = impl.lastIndexOf('=');
		if (equalPos > 0) {
			this.eventType = impl.substring(equalPos + 1).trim();
			int twoSpotPos = impl.lastIndexOf(':');
			this.type = impl.substring(twoSpotPos + 1, equalPos).trim();
			this.isStatic = impl.trim().startsWith("static ")
					|| impl.contains(" static ");
			impl = impl.substring(0, equalPos).trim() + " = \""
					+ this.eventType + "\"";
		}
		this.setImplementation(impl);
	}

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (this.eventType != null)
			super.appendAsDocLine(ASDOC_LINE_HEAD + "@eventType "
					+ this.eventType);
	}

	@Override
	public String getImplementation(int tabs) {
		String impl = this.getImplementation();
		if (impl == null)
			return null;
		return getTabs(tabs) + impl + ";";
	}

	@SuppressWarnings("serial")
	@Override
	protected void removeUnusedNodes(NodeFilter filter) {
		filter = new NodeFilter() {
			private String ACCEPTED_TAGS = "TABLE, TBODY, TR, TH, TD";

			@Override
			public boolean accept(Node node) {
				if (node instanceof TextNode)
					return true;
				else if (node instanceof TagNode)
					if (HtmlUtil.contentAllowedTag(node)) {
						if (node instanceof LineBreakTag
								|| !"".equals(ToolUtil.trim(node
										.toPlainTextString())))
							return true;
					} else if (node instanceof Tag
							&& ACCEPTED_TAGS.contains(((Tag) node).getTagName()
									.toUpperCase()))
						return true;
				return false;
			}
		};
		super.removeUnusedNodes(filter);
	}
}
