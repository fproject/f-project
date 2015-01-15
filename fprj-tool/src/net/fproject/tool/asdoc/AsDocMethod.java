package net.fproject.tool.asdoc;

import java.util.ArrayList;
import java.util.List;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.CodeTag;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.ParagraphTag;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class AsDocMethod extends AsDocClassMember {
	public List<AsDocParameter> params;
	public AsDocElement asDocReturn;

	@Override
	protected NodeList parseContentFromDetailElement(TableColumn summaryColumn) {
		NodeList nodes = this.memberDetail.contentNodes;
		NodeList methodDescrpt = new NodeList();
		Node node;
		if ("Constructor".equals(this.memberDetail.type)) {
			this.type = this.name;
		}
		int i = 0;
		// Implementation
		while (i < nodes.size()) {
			node = nodes.elementAt(i);
			if (node instanceof CodeTag) {
				this.setImplementation(ToolUtil.trim(node
						.toPlainTextString()));
				i++;
				break;
			}
			i++;
		}

		// Method return type
		if (this.getImplementation() != null) {
			int p = this.getImplementation().lastIndexOf(':');
			if (p > -1)
				this.type = ToolUtil.trim(this.getImplementation()
						.substring(p + 1));
		}

		// Method Description
		while (i < nodes.size()) {
			boolean found;
			node = nodes.elementAt(i);
			if (node instanceof ParagraphTag
					&& "Parameters".equals(ToolUtil.trim(node
							.toPlainTextString()))) {
				i++;
				found = false;
				while (i < nodes.size()) {
					node = nodes.elementAt(i);
					i++;
					if (node instanceof TableTag) {
						found = true;
						break;
					}
				}
				if (found)
					parseParameters((TableTag) node);
				continue;
			}
			if (node instanceof Span
					&& "Returns".equals(ToolUtil.trim(node
							.toPlainTextString()))) {
				i++;
				found = false;
				while (i < nodes.size()) {
					node = nodes.elementAt(i);
					i++;
					if (node instanceof TableTag) {
						found = true;
						break;
					}
				}
				if (found)
					parseReturn((TableTag) node);
				continue;
			}
			if (node instanceof Div
					&& "seeAlso".equals(((Div) node).getAttribute("class")))
				break;

			methodDescrpt.add(node);

			i++;
		}

		return methodDescrpt;
	}

	private void parseReturn(TableTag table) {
		TableRow row = (TableRow) table.getChild(1);
		TableColumn col = (TableColumn) row.getChild(1);
		this.asDocReturn = parseVariableDefinition(col);
	}

	private void parseParameters(TableTag table) {
		this.params = new ArrayList<AsDocParameter>();
		for (int i = 1; i < table.getChildCount() - 1; i++) {
			TableRow row = (TableRow) table.getChild(i);
			if (row.getChildCount() > 1) {
				TableColumn col = (TableColumn) row.getChild(1);
				AsDocParameter element = (AsDocParameter) parseVariableDefinition(col);
				if (element != null)
					this.params.add(element);
			}
		}
	}

	// Map<name,definition>
	private AsDocElement parseVariableDefinition(TableColumn definitionColumn) {
		if (definitionColumn.getChildCount() == 0)
			return null;
		AsDocElement element;
		NodeList elementNodes = new NodeList();
		NodeList nl = HtmlUtil.searchFor(definitionColumn, Span.class, "class",
				"label", true);
		Node n;
		if (nl.size() > 0) {
			element = new AsDocParameter();
			n = nl.elementAt(0);
			element.name = ToolUtil.trim(n.toPlainTextString());
		} else
			element = new AsDocElement();

		n = definitionColumn.getChildren().elementAt(0).getNextSibling();

		boolean found = false;
		while (n != null) {
			if (!found) {
				String s = n.toPlainTextString();
				int i = s.indexOf(" — ");
				if (i > -1) {
					found = true;
					if (!"".equals(s.substring(i + 3)))
						elementNodes.add(new TextNode(s.substring(i + 3)));
				}
			}
			n = n.getNextSibling();
			if (n != null && found)
				elementNodes.add(n);
		}
		try {
			if (element.parse(elementNodes))
				return element;
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (this.params != null) {
			for (AsDocElement param : this.params) {
				super.appendAsDocLines(param.getAsDocLines());
			}
		}
		if (this.asDocReturn != null) {
			asDocReturn.contentToAsDoc();
			String line = this.asDocReturn.getAsDocLineAt(0);
			if (line != null)
				line = ASDOC_LINE_HEAD + "@return "
						+ line.substring(ASDOC_LINE_HEAD.length());
			asDocReturn.setAsDocLine(0, line);
			super.appendAsDocLines(this.asDocReturn.getAsDocLines());
		}
	}

	@Override
	public String getImplementation(int tabs) {
		if (this.getImplementation() == null)
			return null;
		return getTabs(tabs) + this.getImplementation() + "\r\n"
				+ getTabs(tabs) + "{\r\n" + getTabs(tabs) + "}";
	}
}
