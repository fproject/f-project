package net.fproject.tool.asdoc;

import java.util.ArrayList;
import java.util.List;

public class AsMetadata {
	public AsDocElement parent;
	public String name;
	public String type;// ME_EVENT, ME_STYLE or ME_CLASS_META
	public List<MetadataProperty> properties;
	public static String ME_EVENT = "Events";
	public static String ME_STYLE = "Styles";
	public static String ME_CLASS_META = "ClassMeta";

	public AsMetadata() {

	}

	public AsMetadata(AsDocElement parent) {
		this.parent = parent;
	}

	public String getDefinition() {
		if (properties == null || properties.size() == 0)
			return "[" + name + "]";

		String s = "[" + name + "(";
		int i = 0;
		for (MetadataProperty mp : properties) {
			if (i > 0)
				s += ", ";
			s += mp.toString();
			i++;
		}
		s += ")]";
		return s;
	}

	public void AddProperty(MetadataProperty mp) {
		if (properties == null)
			properties = new ArrayList<MetadataProperty>();
		properties.add(mp);
	}
}
