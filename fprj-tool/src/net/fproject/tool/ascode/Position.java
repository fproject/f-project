package net.fproject.tool.ascode;

public class Position {
	public int line;
	public int col;

	public Position() {
		line = -1;
		col = -1;
	}

	public Position(Position p) {
		line = p.line;
		col = p.col;
	}

	public Position(int line, int col) {
		this.line = line;
		this.col = col;
	}

	public boolean isValid() {
		return line > -1 && col > -1;
	}

	public boolean isBefore(Position p) {
		if (p.line == this.line)
			return p.col > this.col;
		return p.line > this.line;
	}

	public Position add(AsCodeLines sourceLines, int count) {
		Position newPos = new Position();
		newPos.line = this.line;

		int i = this.col + count;
		if (count >= 0) {
			while (newPos.line < sourceLines.size()
					&& i >= sourceLines.get(newPos.line).length()
					&& newPos.line < sourceLines.size()) {
				i -= sourceLines.get(newPos.line).length();
				newPos.line++;
			}
		} else {
			while (i < 0 && newPos.line >= 0) {
				newPos.line--;
				if (newPos.line >= 0)
					i += sourceLines.get(newPos.line).length();
			}
		}
		newPos.col = i;	
		return newPos;
	}

	public int diff(AsCodeLines sourceLines, Position from) {
		int i = from.line;
		int count = 0;
		if(!this.isBefore(from)) {
			while (i <= this.line) {
				if(i == from.line) {
					if (i == this.line) {
						count += this.col - from.col;
					} else {
						count += sourceLines.get(i).length() - from.col;
					}
				} else {
					if (i == this.line) {
						count += this.col;
					} else {
						count += sourceLines.get(i).length();
					}
				}
					
				i++;
			}
		}
		else {
			return from.diff(sourceLines, this);
		}
		
		return count;
	}
	
	public boolean equals(Position p) {
		return p != null && p.line == this.line && p.col == this.col;
	}
	
	public Position clone() {
		return new Position(this);
	}
}
