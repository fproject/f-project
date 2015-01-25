package net.fproject.tool.asdoc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.fproject.tool.ToolUtil;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Tag;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.CodeTag;
import org.htmlparser.tags.CompositeTag;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableHeader;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class AsDocClass extends AsDocElement {
	public List<AsDocStyle> styles;
	public List<AsDocSkinPart> skinParts;
	public List<AsDocSkinState> skinStates;
	public List<AsDocEvent> events;
	public List<AsDocMethod> methods;
	public List<AsDocProperty> properties;
	public List<AsDocConstant> constants;
	public List<AsDocExample> includeExamples;
	public String classSignature;

	public AsDocElement mxmlSyntax;

	public Map<String, SummarySection> summarySections;

	@Override
	public NodeList parseContentNodes(NodeList sourceNodes) {
		NodeList sectionNodes = getSummarySectionNodes(sourceNodes);
		if (sectionNodes.size() == 0)
			return null;
		createEvents();
		createProperties();
		createMethods();
		this.includeExamples = AsDocExample.parseIncludeExamples(sourceNodes);
		NodeList summary = getClassSummary(sectionNodes);
		return summary;
	}

	// Class Overview, MXML syntax, Default MXML Property, Styles, Skin Parts,
	// Skin States
	@SuppressWarnings({ "unchecked", "serial" })
	private NodeList getClassSummary(NodeList sectionNodes) {
		Node firstSection = sectionNodes.elementAt(0);
		Node parent = firstSection.getParent();
		if (parent == null)
			return null;
		NodeList children = parent.getChildren();
		if (children == null || children.size() == 0)
			return null;
		Node node;

		// Class signature
		NodeList filteredNodes = HtmlUtil.searchFor(parent, TableColumn.class,
				"class", "classSignature", true);
		if (filteredNodes.size() > 0) {
			this.classSignature = filteredNodes
					.elementAt(0).toPlainTextString();
			if (this.classSignature != null) {
				this.classSignature = ToolUtil.replaceNonPrintableCharBySpace(this.classSignature);
				this.classSignature = ToolUtil.replaceTwoSpace(this.classSignature);
				int i =this.classSignature.indexOf(" extends ");
				if (i>-1) {
					this.classSignature = this.classSignature.substring(0, i);
				}
				i =this.classSignature.indexOf(" implements ");
				if (i>-1) {
					this.classSignature = this.classSignature.substring(0, i);
				}
				this.classSignature = this.classSignature.trim();
				i = this.classSignature.lastIndexOf(' ');
				this.name = this.classSignature.substring(i + 1).trim();
			}
		}

		int endPosition = firstSection.getStartPosition();
		final int ep = endPosition;
		// MXML Syntax
		NodeFilter filter = new NodeFilter() {
			@Override
			public boolean accept(Node node) {
				if (node instanceof TagNode) {
					TagNode tn = (TagNode) node;
					if ((tn instanceof TableTag && "classHeaderTable".equals(tn
							.getAttribute("class")))
							|| (tn instanceof Div && "mxmlSyntax".equals(tn
									.getAttribute("id")))) {
						return true;
					} else if (tn instanceof Div
							&& "seeAlso".equals(tn.getAttribute("class"))) {
						if (((Div) tn).getEndTag().getEndPosition() < ep)
							return true;
					} else {
						Node n = node.getPreviousSibling();
						if (n != null && n instanceof Span) {
							if ("Default MXML Property".equals(((Span) n)
									.getStringText()))
								return true;
						}
					}
				}
				return false;
			}
		};

		filteredNodes = children.extractAllNodesThatMatch(filter, true);
		if (filteredNodes.size() == 0)
			return null;

		// See also
		seeAlsoes = getSeeAlsoes(filteredNodes);

		// Example
		examples = getExamples(filteredNodes);

		// MXML Syntax
		for (int i = 0; i < filteredNodes.size(); i++) {
			node = filteredNodes.elementAt(i);
			if (node instanceof Div
					&& "mxmlSyntax".equals(((Tag) node).getAttribute("id"))) {
				mxmlSyntax = new AsDocElement(node.getChildren());
				break;
			}
		}

		metadata = new ArrayList<AsMetadata>();

		// Default MXML Property
		for (int i = 0; i < filteredNodes.size(); i++) {
			node = filteredNodes.elementAt(i);
			if (!(node instanceof Div) && !(node instanceof TableTag)) {
				String s;
				if (node instanceof TextNode) {
					s = ((TextNode) node).getText();
					if (endPosition > node.getStartPosition())
						endPosition = node.getStartPosition();
				} else if (node instanceof CompositeTag) {
					s = ((CodeTag) node).getStringText();
					if (endPosition > node.getStartPosition())
						endPosition = node.getStartPosition();
				} else
					s = "";
				s = ToolUtil.trim(s);
				if (!"".equals(s)) {
					AsMetadata meta = new AsMetadata(this);
					meta.name = "DefaultProperty";
					meta.type = AsMetadata.ME_CLASS_META;
					meta.AddProperty(new MetadataProperty(null, s));
					metadata.add(meta);
				}
			}
		}

		// Class Summary
		NodeList summary = new NodeList();
		node = filteredNodes.elementAt(0);
		while (node.getNextSibling() != null) {
			node = node.getNextSibling();
			int end = node.getEndPosition();
			if (node instanceof CompositeTag) {
				int p = ((CompositeTag) node).getEndTag().getEndPosition();
				if (p > end)
					end = p;
			}
			if (end < endPosition)
				summary.add(node);
			else
				break;
		}

		summarySections = new HashMap<String, SummarySection>();

		// Styles
		summarySections.put(SECTION_STYLES,
				getSummarySectionByName(sectionNodes, SECTION_STYLES));
		this.styles = (List<AsDocStyle>) (List<?>) createMembersFromSection(
				AsDocStyle.class, SECTION_STYLES);

		// Skin Parts
		summarySections.put(SECTION_SKIN_PARTS,
				getSummarySectionByName(sectionNodes, SECTION_SKIN_PARTS));
		this.skinParts = (List<AsDocSkinPart>) (List<?>) createMembersFromSection(
				AsDocSkinPart.class, SECTION_SKIN_PARTS);

		// Skin States
		summarySections.put(SECTION_SKIN_STATES,
				getSummarySectionByName(sectionNodes, SECTION_SKIN_STATES));
		this.skinStates = (List<AsDocSkinState>) (List<?>) createMembersFromSection(
				AsDocSkinState.class, SECTION_SKIN_STATES);

		// Events
		summarySections.put(SECTION_EVENTS,
				getSummarySectionByName(sectionNodes, SECTION_EVENTS));
		this.events = (List<AsDocEvent>) (List<?>) createMembersFromSection(
				AsDocEvent.class, SECTION_EVENTS);

		// Properties
		summarySections
		.put(SECTION_PUBLIC_PROPERTIES,
				getSummarySectionByName(sectionNodes,
						SECTION_PUBLIC_PROPERTIES));
		this.properties = (List<AsDocProperty>) (List<?>) createMembersFromSection(
				AsDocProperty.class, SECTION_PUBLIC_PROPERTIES);
		summarySections.put(
				SECTION_PROTECTED_PROPERTIES,
				getSummarySectionByName(sectionNodes,
						SECTION_PROTECTED_PROPERTIES));
		this.properties
		.addAll((List<AsDocProperty>) (List<?>) createMembersFromSection(
				AsDocProperty.class, SECTION_PROTECTED_PROPERTIES));

		// Methods
		summarySections.put(SECTION_PUBLIC_METHODS,
				getSummarySectionByName(sectionNodes, SECTION_PUBLIC_METHODS));
		this.methods = (List<AsDocMethod>) (List<?>) createMembersFromSection(
				AsDocMethod.class, SECTION_PUBLIC_METHODS);
		summarySections
		.put(SECTION_PROTECTED_METHODS,
				getSummarySectionByName(sectionNodes,
						SECTION_PROTECTED_METHODS));
		this.methods
		.addAll((List<AsDocMethod>) (List<?>) createMembersFromSection(
				AsDocMethod.class, SECTION_PROTECTED_METHODS));

		// Constants
		summarySections
		.put(SECTION_PUBLIC_CONSTANTS,
				getSummarySectionByName(sectionNodes,
						SECTION_PUBLIC_CONSTANTS));
		this.constants = (List<AsDocConstant>) (List<?>) createMembersFromSection(
				AsDocConstant.class, SECTION_PUBLIC_CONSTANTS);

		return summary;
	}

	private static String SECTION_STYLES = "Styles";
	private static String SECTION_SKIN_PARTS = "Skin Parts";
	private static String SECTION_SKIN_STATES = "Skin States";
	private static String SECTION_EVENTS = "Events";
	private static String SECTION_PROTECTED_PROPERTIES = "Protected Properties";
	private static String SECTION_PUBLIC_PROPERTIES = "Public Properties";
	private static String SECTION_PROTECTED_METHODS = "Protected Methods";
	private static String SECTION_PUBLIC_METHODS = "Public Methods";
	private static String SECTION_PUBLIC_CONSTANTS = "Public Constants";

	@SuppressWarnings("rawtypes")
	private List<AsDocClassMember> createMembersFromSection(Class clazz,
			String sectionName) {
		List<AsDocClassMember> members = new ArrayList<AsDocClassMember>();
		Node[] rows = getSectionTableRows(sectionName);
		if (rows == null)
			return members;
		try {
			for (Node tr : rows) {
				if (tr.getFirstChild() instanceof TableHeader)
					continue;
				AsDocClassMember m = (AsDocClassMember) clazz.newInstance();
				m.parent = this;
				if (m.parse(tr))
					members.add(m);
			}
		} catch (ParserException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return members;
	}

	private Node[] getSectionTableRows(String sectionName) {
		SummarySection ss = summarySections.get(sectionName);
		if (ss == null || ss.itemTable == null)
			return null;
		return ss.itemTable.searchFor(TableRow.class, true).toNodeArray();
	}

	private SummarySection getSummarySectionByName(NodeList sectionNodes,
			String name) {
		Div sectionDiv = getSectionDivByName(sectionNodes, name);
		if (sectionDiv == null)
			return null;

		SummarySection ss = new SummarySection();
		ss.name = name;
		ss.itemTable = getSummaryTableTag(sectionDiv);
		final int start = getSummaryTableTitleDiv(sectionDiv).getEndPosition();
		final int end = ss.itemTable == null ? -1 : ss.itemTable
				.getStartPosition();

		@SuppressWarnings("serial")
		NodeFilter filter = new NodeFilter() {

			@Override
			public boolean accept(Node node) {
				if (node.getStartPosition() > start
						&& (end == -1 || node.getEndPosition() < end))
					return true;
				return false;
			}
		};

		NodeList nl = sectionDiv.getChildren().extractAllNodesThatMatch(filter);
		ss.summaryText = nl.toHtml();
		return ss;

	}

	private Div getSectionDivByName(NodeList sectionNodes, String name) {
		for (int i = 0; i < sectionNodes.size(); i++) {
			Div d = (Div) sectionNodes.elementAt(i);
			if (name.equals(ToolUtil.trim(getSectionName(d))))
				return d;
		}
		return null;
	}

	private Div getSummaryTableTitleDiv(Div sectionDiv) {
		NodeList nl = HtmlUtil.searchFor(sectionDiv, Div.class, "class",
				"summaryTableTitle", true);
		if (nl.size() == 0)
			return null;
		return (Div) nl.elementAt(0);
	}

	private TableTag getSummaryTableTag(Div sectionDiv) {
		NodeList nl = HtmlUtil.searchFor(sectionDiv, TableTag.class, "class",
				"summaryTable", true);
		if (nl.size() == 0)
			return null;
		return (TableTag) nl.elementAt(0);
	}

	private String getSectionName(Div sectionDiv) {
		Div titleDiv = getSummaryTableTitleDiv(sectionDiv);
		return titleDiv == null ? null : titleDiv.getStringText();
	}

	private NodeList getSummarySectionNodes(NodeList sourceNodes) {
		return HtmlUtil.searchFor(sourceNodes, Div.class, "class",
				"summarySection", true);
	}

	private void createEvents() {
		this.events = new ArrayList<AsDocEvent>();
	}

	private void createProperties() {
		this.properties = new ArrayList<AsDocProperty>();
	}

	private void createMethods() {
		this.methods = new ArrayList<AsDocMethod>();
	}

	public String buildClassPrototype() {
		StringBuffer prototype = new StringBuffer();
		prototype.append("package\r\n{\r\n");
		// Events
		if (this.events != null)
			for (AsDocEvent ae : this.events) {
				prototype.append(ae.getAsDoc());
				prototype.append("\r\n" + TAB + ae.getMetadataDefinition()
						+ "\r\n\r\n");
			}

		// Styles
		if (this.styles != null)
			for (AsDocStyle as : this.styles) {
				prototype.append(as.getAsDoc());
				prototype.append("\r\n" + TAB + as.getMetadataDefinition()
						+ "\r\n\r\n");
			}

		// Class metadata: Skin States
		if (this.skinStates != null)
			for (AsDocSkinState ss : this.skinStates) {
				prototype.append("\r\n" + TAB + ss.getMetadataDefinition());
			}

		// Class metadata: Others
		if (this.metadata != null)
			for (AsMetadata am : this.metadata) {
				prototype.append("\r\n" + TAB + am.getDefinition());
			}

		prototype.append("\r\n\r\n");

		prototype.append(this.getAsDoc());
		if (this.classSignature == null)
			this.classSignature = "class NoName";
		// Class signature
		prototype.append("\r\n" + TAB + this.classSignature + "\r\n" + TAB
				+ "{");

		// Methods and Properties here
		if (this.skinParts != null)
			for (AsDocSkinPart skinPart : this.skinParts) {
				prototype.append("\r\n" + TAB + TAB
						+ skinPart.getMetadataDefinition() + "\r\n");
				prototype.append(skinPart.getAsDoc(1)+"\r\n");				
				prototype.append(TAB + TAB + skinPart.getImplementation() + "\r\n");
			}

		if (this.properties != null)
			for (AsDocProperty prop : this.properties) {
				prototype.append("\r\n\r\n" + prop.getAsDoc(1));
				if (!"".equals(prop.getMetadataDefinition()))
					prototype.append("\r\n" + TAB + TAB
							+ prop.getMetadataDefinition());
				prototype.append("\r\n" + prop.getImplementation(2));
			}

		if (this.methods != null)
			for (AsDocMethod method : this.methods) {
				prototype.append("\r\n\r\n" + method.getAsDoc(1));
				prototype.append("\r\n" + method.getImplementation(2));
			}

		if (this.constants != null)
			for (AsDocConstant constant : this.constants) {
				prototype.append("\r\n\r\n" + constant.getAsDoc(1));
				prototype.append("\r\n" + constant.getImplementation(2));
			}

		prototype.append("\r\n" + TAB + "}//end class\r\n}");
		return prototype.toString();
	}

	@Override
	public void contentToAsDoc() {
		super.contentToAsDoc();
		if (mxmlSyntax != null) {
			super.appendAsDocBlankLine();
			super.appendAsDocLine("@mxml");
			super.appendAsDocLines(mxmlSyntax.getAsDocLines());
		}
		if (this.includeExamples != null && this.includeExamples.size() > 0) {
			super.appendAsDocBlankLine();
			for (AsDocExample ae : this.includeExamples) {
				super.appendAsDocLine(ASDOC_LINE_HEAD + "@includeExample "
						+ ae.name);
			}
		}
	}

	public void saveExampleFiles(String exampleFolder) {
		if (this.includeExamples != null) {
			for (AsDocExample ae : this.includeExamples) {
				ae.saveExampleFile(exampleFolder);
			}
		}
	}

	public String getDefaultCSS() {
		String css = null;
		if (this.styles != null)
			for (AsDocStyle style : this.styles) {
				String s = style.getDefaultCSS();
				if (s != null) {
					css += s + "\r\n";
				}
			}
		if (css != null) {
			css = this.name + "{\r\n" + css + "}";
		}
		return css;
	}
}
