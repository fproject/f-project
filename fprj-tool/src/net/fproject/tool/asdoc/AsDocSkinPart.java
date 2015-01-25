package net.fproject.tool.asdoc;

import java.util.ArrayList;

import net.fproject.tool.ToolUtil;

import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;

public class AsDocSkinPart extends AsDocClassMember {
	protected String required;
	protected String partClass;

	@Override
	protected NodeList parseContentFromSummaryColumn(TableColumn column) {
		NodeList nl = column.getChildren();

		this.type = HtmlUtil.extractPropertyFromNodeList(nl, "^Part Type:", false);
		this.required = HtmlUtil.extractPropertyFromNodeList(nl, "^Required:", false);

		AsMetadata meta = new AsMetadata(this);
		meta.name = "SkinPart";
		meta.AddProperty(new MetadataProperty("required", this.required));
		if (this.type != null)
			meta.AddProperty(new MetadataProperty("type", this.type));

		this.metadata = new ArrayList<AsMetadata>();
		this.metadata.add(meta);
		return nl;
	}

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		NodeList nl = super.parseContentNodes(sourceNodes);
		if (this.name != null) {
			int i = this.name.lastIndexOf(':');
			this.partClass = ToolUtil.trim(this.name.substring(i + 1));
			this.name = ToolUtil.trim(this.name.substring(0, i));
		}
		return nl;
	}

	public String getImplementation() {
		return "public var " + this.name + ":" + this.partClass + ";";
	}
}
