package net.fproject.tool.asdoc;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Tag;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.PreTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class AsDocExample extends AsDocElement {
	public void saveExampleFile(String folder) {
		if (this.name != null && folder != null) {
			try {
				NodeList nodes = this.contentNodes;
				if (nodes != null && nodes.size() > 0) {
					Node node = nodes.elementAt(0);
					if (node instanceof Div
							&& "listing".equals(((Tag) node)
									.getAttribute("class")))
						nodes = node.getChildren();
				}
				if (nodes != null && nodes.size() > 0) {
					Node node = nodes.elementAt(0);
					if (node instanceof PreTag)
						nodes = node.getChildren();
				}

				FileWriter fwriter = new FileWriter(folder + "\\" + this.name);

				BufferedWriter out = new BufferedWriter(fwriter);
				out.write(HtmlUtil.toPlainTextString(nodes.toHtml()));
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	protected void removeUnusedNodes(NodeFilter filter) {
		// Do nothing
	}

	public static List<AsDocExample> parseIncludeExamples(NodeList nl) {
		List<AsDocExample> examples = new ArrayList<AsDocExample>();

		NodeList headers = HtmlUtil.searchFor(nl, Div.class, "class",
				"exampleHeader", true);
		for (int i = 0; i < headers.size(); i++) {
			AsDocExample ex = new AsDocExample();
			Div header = (Div) headers.elementAt(i);
			ex.name = header.toPlainTextString();
			ex.parseFromHeaderNode(header);
			examples.add(ex);
		}

		return examples;
	}

	private void parseFromHeaderNode(Div header) {
		NodeList nl = new NodeList();
		Node n = header.getNextSibling();
		while (n != null) {
			if (n instanceof Div
					&& "detailBody".equals(((Tag) n).getAttribute("class"))) {
				nl = n.getChildren();
			}
			n = n.getNextSibling();
		}

		try {
			this.parse(nl);
		} catch (ParserException e) {
			e.printStackTrace();
		}
	}
}
