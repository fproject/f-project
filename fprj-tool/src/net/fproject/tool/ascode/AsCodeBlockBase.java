package net.fproject.tool.ascode;

public class AsCodeBlockBase {
	public Position start;
	public Position end;
	
	/**
	 * Default constructor
	 */
	public AsCodeBlockBase() {
		
	}
	
	public AsCodeBlockBase(Position start, Position end) {
		this.start = start;
		this.end = end;
	}
	
	/**
	 * Check whether this code block is valid or not, that means the <code>start</code>
	 * and <code>end</code> are valid positions and the <code>end</code> is not
	 * before the <code>start</code>.
	 * @return true if the code block is valid
	 */
	public boolean isValid() {
		return (start != null && end != null && start.line > -1
				&& start.col > -1 && end.line > -1 && end.col > -1);
	}
	
	/**
	 * Compare to another <code>AsCodeBlockBase</code> object.
	 * @param o the object to compare to
	 * @return <code>true</code> if and only if the two blocks are equal.
	 */
	public boolean equals(AsCodeBlockBase block) {
		return start.equals(block.start) && end.equals(block.end);
	}
	
	/**
	 * Check whether current code block is intersected by another block
	 * @param block the code block to check
	 * @return <code>true</code> if and only if the two blocks are intersected.
	 */
	public boolean intersect(AsCodeBlockBase block) {
		return block != null && start.isBefore(block.end) && block.start.isBefore(end);
	}
}
