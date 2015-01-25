package net.fproject.tool.asdoc;

import java.util.ArrayList;

import net.fproject.tool.ToolUtil;

import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;

public class AsDocStyle extends AsDocClassMember {
	protected String format;
	protected String theme;
	protected String inheritance;

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		TableColumn col = (TableColumn) sourceNodes
				.elementAt(summaryTableSignatureCol);
		this.name = ToolUtil.trim(col.toPlainTextString());
		col = (TableColumn) sourceNodes.elementAt(summaryTableDescriptionCol);
		return parseContentFromSummaryColumn(col);
	}

	@Override
	protected NodeList parseContentFromSummaryColumn(TableColumn column) {
		NodeList nl = column.getChildren();

		this.type = HtmlUtil.extractPropertyFromNodeList(nl, "^Type:", false);
		this.format = HtmlUtil.extractPropertyFromNodeList(nl, "^Format:",
				false);
		this.theme = HtmlUtil.extractPropertyFromNodeList(nl, "^Theme:", false);
		this.inheritance = HtmlUtil.extractPropertyFromNodeList(nl,
				"^CSS Inheritance:", false);
		this.defaultValue = HtmlUtil.extractPropertyFromNodeList(nl,
				"The default value is", true);
		AsMetadata meta = new AsMetadata(this);
		meta.name = "Style";
		meta.AddProperty(new MetadataProperty("name", this.name));
		if (this.type != null)
			meta.AddProperty(new MetadataProperty("type", this.type));
		if (this.format != null)
			meta.AddProperty(new MetadataProperty("format", this.format));
		if (this.inheritance != null)
			meta.AddProperty(new MetadataProperty("inherit", this.inheritance));
		if (this.theme != null)
			meta.AddProperty(new MetadataProperty("theme", this.theme));

		this.metadata = new ArrayList<AsMetadata>();
		this.metadata.add(meta);
		return nl;
	}

	public String getDefaultCSS() {
		if (this.defaultValue != null) {
			return this.name + ": " + this.defaultValue + ";";
		}
		return null;
	}
}
