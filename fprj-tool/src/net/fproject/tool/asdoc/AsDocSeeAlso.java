package net.fproject.tool.asdoc;

import java.util.ArrayList;

import org.htmlparser.Node;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;

public class AsDocSeeAlso extends AsDocElement {

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		Node n = sourceNodes.elementAt(0);
		if (n instanceof TextNode)
			this.name = n.toPlainTextString();
		else {
			this.name = ((LinkTag) n).getStringText().trim();
		}
		return null;
	}

	@Override
	public void contentToAsDoc() {
		if (asDocLines != null)
			return;
		asDocLines = new ArrayList<String>();
		if (this.name != null) {
			asDocLines.add(ASDOC_LINE_HEAD + "@see "
					+ (this.name.indexOf('.') == -1 ? "#" : "") + this.name);
		}
	}

}
