package net.fproject.tool.ascode;

import java.util.Arrays;
import java.util.List;


public class ActionScriptScope extends ActionScriptElement {
	public ActionScriptScope(ActionScriptElement owner) {
		super(owner.sourceLines, owner.start != null ? owner.start.clone() : null, 
				owner.end != null ? owner.end.clone() : null);
	}

	private static final List<String> allowedKeywords = 
			Arrays.asList("final", "override", "static", "public", "internal", "private", "protected");
	
	@Override
	public void parse(ActionScriptElement parent) {
		this.parent = parent;
		Position p = parent.keyWordPos;
		this.name = null;
		if (p != null) {
			AsCodeBlockBase acp = hitPreviousWord(p);
			
			while (ownsSubBlock(acp)) {
				String word = trimEx(subString(acp.start, acp.end));
				if (!allowedKeywords.contains(word)) {
					break;
				}
				if ("public".equals(word) || "private".equals(word) || "protected".equals(word))
				{
					this.name = word;
					break;
				}
						
				acp = hitPreviousWord(acp.start);
			}
		}
		if (this.name == null)
			this.name = "internal";
		
		addToSourceLines();
	}

	protected Position getNextChildKeyWordPos(Position fromPos) {
		return null;
	}

	public boolean isPublic() {
		return "public".equalsIgnoreCase(this.name);
	}

	public boolean isInternal() {
		return this.name == null || "internal".equalsIgnoreCase(this.name);
	}

	public boolean isProtected() {
		return "protected".equalsIgnoreCase(this.name);
	}

	public boolean isLocal() {
		return "local".equalsIgnoreCase(this.name);
	}

	public boolean isCustom() {
		return !isPublic() && !isProtected() && !isInternal();
	}

	@Override
	protected ActionScriptElement parseChild(AsCodeBlockBase childBlock) {
		// Do nothing
		return null;
	}

	@Override
	protected Position getChildElementStartPos(Position childKeyWordPos) {
		return null;
	}
	
	@Override
	protected List<? extends ActionScriptElement> getAllChildren() {
		return null;
	}
	
	public String toString() {
		return name;
	}
	
	public static ActionScriptScope createPublicScope(ActionScriptElement owner)
	{
		ActionScriptScope scope = new ActionScriptScope(owner);
		scope.name = "public";
		return scope;
	}
	
	public static ActionScriptScope createInternalScope(ActionScriptElement owner)
	{
		ActionScriptScope scope = new ActionScriptScope(owner);
		scope.name = "internal";
		return scope;
	}
	
	public static ActionScriptScope createProtectedScope(ActionScriptElement owner)
	{
		ActionScriptScope scope = new ActionScriptScope(owner);
		scope.name = "protected";
		return scope;
	}
	
	public static ActionScriptScope createLocalScope(ActionScriptElement owner)
	{
		ActionScriptScope scope = new ActionScriptScope(owner);
		scope.name = "local";
		return scope;
	}
}
