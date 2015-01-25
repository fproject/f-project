package net.fproject.tool.asdoc;

import java.util.ArrayList;

import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;

public class AsDocSkinState extends AsDocClassMember {
	@Override
	protected NodeList parseContentFromSummaryColumn(TableColumn column) {
		AsMetadata meta = new AsMetadata(this);
		meta.name = "SkinState";
		meta.AddProperty(new MetadataProperty(null, this.name));

		this.metadata = new ArrayList<AsMetadata>();
		this.metadata.add(meta);
		return column.getChildren();
	}
}
