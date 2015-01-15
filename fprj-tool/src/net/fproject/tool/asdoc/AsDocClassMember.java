package net.fproject.tool.asdoc;

import net.fproject.tool.ToolUtil;

import org.htmlparser.tags.Div;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public abstract class AsDocClassMember extends AsDocElement {
	protected String defaultValue;
	protected AsDocDetailElement memberDetail;
	private String implementation;

	protected String getImplementation() {
		return implementation;
	}

	protected void setImplementation(String implementation) {
		this.implementation = ToolUtil.replaceNonPrintableCharBySpace(
				HtmlUtil.toPlainTextString(implementation)).trim();
		this.implementation = ToolUtil.replaceTwoSpace(this.implementation);
	}

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (this.defaultValue != null)
			super.appendAsDocLine(ASDOC_LINE_HEAD + "@default "
					+ this.defaultValue);
	}

	public String getMetadataDefinition() {
		return metadata == null ? "" : metadata.get(0).getDefinition();
	}

	@Override
	public boolean parse(Object source) throws ParserException {
		locateSummaryTableColumns((TableRow) source);
		if (!checkParent((TableRow) source))
			return false;

		return super.parse(source);
	}

	protected int summaryTableSignatureCol = 2;
	protected int summaryTableDescriptionCol = 3;

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		TableColumn col = (TableColumn) sourceNodes
				.elementAt(summaryTableSignatureCol);
		this.name = ToolUtil.trim(col.toPlainTextString());
		TableColumn sumCol = (TableColumn) sourceNodes
				.elementAt(summaryTableDescriptionCol);

		if (createDetailElementFromLink(col)) {
			this.name = this.memberDetail.name;
			this.seeAlsoes = getSeeAlsoes(this.memberDetail.contentNodes);
			this.examples = getExamples(this.memberDetail.contentNodes);
			return parseContentFromDetailElement(sumCol);
		}

		return parseContentFromSummaryColumn(sumCol);
	}

	protected final void locateSummaryTableColumns(TableRow row) {
		for (int i = 0; i < row.getChildren().size(); i++) {
			TableColumn col = (TableColumn) row.getChild(i);
			if ("summaryTableSignatureCol".equals(col.getAttribute("class"))) {
				summaryTableSignatureCol = i;
			}

			if ("summaryTableOwnerCol".equals(col.getAttribute("class"))) {
				summaryTableOwnerCol = i;
			}

			if (col.getAttribute("class").contains("summaryTableDescription")
					|| HtmlUtil.searchFor(col, Div.class, "class",
							"summaryTableDescription", true).size() > 0) {
				summaryTableDescriptionCol = i;
			}

		}
	}

	protected NodeList parseContentFromSummaryColumn(TableColumn summaryColumn) {
		throw new IllegalAccessError("AsDocClassMember.importContentColumn()");
	}

	protected NodeList parseContentFromDetailElement(TableColumn summaryColumn) {
		throw new IllegalAccessError("AsDocClassMember.importContentColumn()");
	}

	protected int summaryTableOwnerCol = 4;

	protected final boolean checkParent(TableRow source) {
		if (source == null)
			return false;
		TableColumn col = (TableColumn) source.getChildren().elementAt(
				summaryTableOwnerCol);
		if (this.parent.name.equals(ToolUtil.trim(col.toPlainTextString())))
			return true;
		return false;
	}

	private boolean createDetailElementFromLink(TableColumn col) {
		NodeList nl = HtmlUtil.searchFor(col, LinkTag.class, "class",
				"signatureLink", true);
		if (nl.size() == 0)
			return false;
		AsDocDetailElement detail = new AsDocDetailElement();
		try {
			if (detail.parse(nl)) {
				this.memberDetail = detail;
				detail.parent = this;
				return true;
			}
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return false;
	}

	protected String getImplementation(int tabs) {
		return getTabs(tabs) + this.implementation;
	}
}
