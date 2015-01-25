package net.fproject.tool.asdoc;

import java.util.ArrayList;

import org.htmlparser.Node;
import org.htmlparser.Tag;
import org.htmlparser.tags.CodeTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;

public class AsDocEvent extends AsDocClassMember {
	public String eventTypeConstant;

	@Override
	protected NodeList parseContentFromDetailElement(TableColumn summaryColumn) {
		int i = 0;
		NodeList nodes = this.memberDetail.contentNodes;
		Node node;
		// Event object type and event type constant
		while (i < nodes.size()) {
			node = nodes.elementAt(i);
			if (node instanceof Span) {
				if ("Event Object Type:".equals(((Span) node).getStringText()
						.trim())) {
					i++;
					while (i < nodes.size()) {
						node = nodes.elementAt(i);
						if (node instanceof LinkTag || node instanceof CodeTag) {
							this.type = node.toPlainTextString().trim();
							break;
						}
						i++;
					}
				} else if (((Span) node).getStringText().matches(
						".*\\.type property = *")) {
					i++;
					while (i < nodes.size()) {
						node = nodes.elementAt(i);
						if (node instanceof LinkTag || node instanceof CodeTag) {
							this.eventTypeConstant = node.toPlainTextString()
									.trim();
							break;
						}
						i++;
					}

				}
			}

			if (this.type != null && this.eventTypeConstant != null) {
				i++;
				break;
			}
			i++;
		}
		NodeList eventContent = new NodeList();
		if (this.eventTypeConstant != null && this.type != null) {
			while (i < nodes.size()) {
				node = nodes.elementAt(i);
				if ((node instanceof TableTag && "innertable"
						.equals(((Tag) node).getAttribute("class")))
						|| (node instanceof Span
								&& "label".equals(((Tag) node)
										.getAttribute("class")) && "Example"
									.equals(node.toPlainTextString().trim())))
					break;
				eventContent.add(node);
				i++;
			}
		}
		// Metadata
		AsMetadata meta = new AsMetadata(this);
		meta.name = "Event";
		meta.AddProperty(new MetadataProperty("name", this.name));
		if (this.type != null)
			meta.AddProperty(new MetadataProperty("type", this.type));

		this.metadata = new ArrayList<AsMetadata>();
		this.metadata.add(meta);

		return eventContent.size() > 0 ? eventContent : summaryColumn
				.getChildren();
	}

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (eventTypeConstant != null) {
			super.appendAsDocLine("");
			super.appendAsDocLine("@eventType " + eventTypeConstant);
		} else
			throw new IllegalArgumentException("Illegal event definition!");
	}
}
