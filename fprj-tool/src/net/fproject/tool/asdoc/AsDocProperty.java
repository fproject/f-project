package net.fproject.tool.asdoc;

import java.util.ArrayList;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.tags.CodeTag;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.ParagraphTag;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.util.NodeList;

public class AsDocProperty extends AsDocClassMember {
	public boolean override;
	public boolean bindable;
	public boolean readOnly;
	public boolean writeOnly;

	@Override
	protected NodeList parseContentFromDetailElement(TableColumn column) {
		NodeList nodes = this.memberDetail.contentNodes;
		NodeList propertyDescrpt = new NodeList();
		Node node;
		String alternateImplLine = null;

		// Name and Type
		int i = 0;
		while (i < nodes.size()) {
			node = nodes.elementAt(i);
			if (node instanceof CodeTag) {
				alternateImplLine = node.toPlainTextString();

				int pos = alternateImplLine.indexOf(':');
				if (pos > 0) {
					this.type = HtmlUtil.toPlainTextString(alternateImplLine
							.substring(pos + 1).trim());
				}
				i++;
				if (i < nodes.size()) {
					node = nodes.elementAt(i);
					if (ToolUtil.unbreakTrim(node.toPlainTextString())
							.contains("[read-only]")) {
						this.readOnly = true;
						i++;
					}
					if (ToolUtil.unbreakTrim(node.toPlainTextString())
							.contains("[write-only]")) {
						this.writeOnly = true;
						i++;
					}
					if (ToolUtil.unbreakTrim(node.toPlainTextString())
							.contains("[override]")) {
						this.writeOnly = true;
						i++;
					}
				}
				break;
			}
			i++;
		}

		boolean implementStarted = false;
		// Get the Bindable, Default value and Read-only
		while (i < nodes.size()) {
			node = nodes.elementAt(i);
			if (node instanceof Span
					&& ("Implementation"
							.equals(node.toPlainTextString().trim()))) {
				implementStarted = true;
				i++;
				break;
			}
			if (node instanceof ParagraphTag
					&& node.toPlainTextString().trim()
							.matches("^The default value is.*")) {
				NodeList nl = node.getChildren();
				if (nl.size() > 1)
					nl.remove(0);
				this.defaultValue = ToolUtil.spotTrim(HtmlUtil
						.nodeListToPlainTextString(nl).trim());
				i++;
				continue;
			}
			if (node instanceof ParagraphTag
					&& ("This property can be used as the source for data binding."
							.equals(node.toPlainTextString().trim()))) {
				this.bindable = true;
				i++;
				continue;
			}

			propertyDescrpt.add(node);

			i++;
		}

		// Get implamentation
		if (implementStarted) {
			while (i < nodes.size()) {
				node = nodes.elementAt(i);
				if (node instanceof ParagraphTag || node instanceof Div
						|| node instanceof Span) {
					break;
				}
				String s = ToolUtil.trim(HtmlUtil.toPlainTextString(node
						.toPlainTextString()));
				if (!"".equals(s))
					this.setImplementation((this.getImplementation() == null ? ""
							: this.getImplementation() + "\r\n\r\n")
							+ s + "\r\n{\r\n}");
				i++;
			}
		} else if (alternateImplLine != null) {
			this.setImplementation(alternateImplLine + ";");
		}

		if (this.bindable) {
			AsMetadata meta = new AsMetadata(this);
			meta.name = "Bindable";
			this.metadata = new ArrayList<AsMetadata>();
			this.metadata.add(meta);
		}
		return propertyDescrpt;
	}

	@Override
	public String getImplementation(int tabs) {
		if (this.getImplementation() == null)
			return null;
		String s = this.getImplementation().replaceAll("\\r\\n\\{",
				"\r\n" + getTabs(tabs) + "{");
		s = s.replaceAll("}\\r\\n", getTabs(tabs) + "}\r\n" + getTabs(tabs));
		s = s.replaceAll("\\}$", getTabs(tabs) + "}");
		return getTabs(tabs) + s;
	}
}
