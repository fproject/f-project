package net.fproject.tool.asdoc;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Tag;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;

public class AsDocDetailElement extends AsDocElement {
	public TableTag detailHeader;

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		LinkTag link = (LinkTag) sourceNodes.elementAt(0);
		String href = link.getLink();
		String currentPageUrl = link.getPage().getUrl() + "#";
		if (href.startsWith(currentPageUrl)) {
			href = href.substring(currentPageUrl.length());
		}
		if (href == null)
			return null;
		Tag srcTag = HtmlUtil.searchByName(correctName(href), true);
		if (srcTag == null || !(srcTag instanceof LinkTag))
			return null;

		return parseFromLink((LinkTag) srcTag);
	}

	private void parseDetailHeader(TableTag table) {
		this.detailHeader = table;
		if (table.getChildCount() < 2)
			return;
		TableRow row = (TableRow) table.getChild(1);
		for (int i = 0; i < row.getChildCount(); i++) {
			TableColumn col = (TableColumn) row.getChild(i);
			if ("detailHeaderName".equals(col.getAttribute("class")))
				this.name = ToolUtil.trim(col.toPlainTextString());
			if ("detailHeaderType".equals(col.getAttribute("class")))
				this.type = ToolUtil.trim(col.toPlainTextString());
		}
	}

	private String correctName(String name) {
		if (name == null)
			return null;
		if (name.startsWith("#"))
			name = name.substring(1);
		name = name.replaceAll("%28", "(");
		name = name.replaceAll("%29", ")");
		return name;
	}

	private NodeList parseFromLink(LinkTag link) {
		Node n = link.getNextSibling();
		while (n != null) {
			if (n instanceof TableTag
					&& "detailHeader".equals(((Tag) n).getAttribute("class"))) {
				parseDetailHeader((TableTag) n);
			}
			if (n instanceof Div
					&& "detailBody".equals(((Tag) n).getAttribute("class"))) {
				return n.getChildren();
			}
			n = n.getNextSibling();
		}

		return new NodeList();
	}

	@Override
	protected void removeUnusedNodes(NodeFilter filter) {
		// Do nothing
	}

}
