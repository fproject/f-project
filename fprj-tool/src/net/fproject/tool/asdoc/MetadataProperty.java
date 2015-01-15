package net.fproject.tool.asdoc;

public class MetadataProperty {
	public String name;
	public String value;

	public MetadataProperty(String name, String value) {
		this.name = name;
		this.value = value;
	}

	public String toString() {
		if (name != null && value != null)
			return name + "=\"" + value + "\"";
		else if (value != null)
			return "\"" + value + "\"";
		else
			return "";
	}
}
