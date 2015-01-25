package net.fproject.tool.ascode;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.fproject.tool.ToolUtil;

/**
 * 
 * The AsCodeBlock represents a source code block. A code block is defined by a 
 * <code>sourceLines</code> array, a <code>start</code> position and an 
 * <code>end</code> position.
 * 
 * @author Bui Sy Nguyen
 *
 */
public class AsCodeBlock extends AsCodeBlockBase{
	public AsCodeLines sourceLines;

	public static final String WORD_SEPARATORS = "\r\n\t .{}()+-*/<>;";

	/**
	 * Constructor
	 * @param sourceLines the array of source code lines
	 */
	public AsCodeBlock(AsCodeLines sourceLines) {
		this(sourceLines, new Position(0, 0), 
				sourceLines != null && sourceLines.size() > 0? 
						new Position(sourceLines.size() - 1, sourceLines.getLast().length()) 
						: new Position(0, 0));
	}
	
	/**
	 * Constructor.
	 * 
	 * @param sourceLines the array of source code lines
	 * @param start the start position of code block
	 * @param end the end position of code block
	 */
	public AsCodeBlock(AsCodeLines sourceLines, Position start, Position end) {
		super(start, end);
		this.sourceLines = sourceLines;
	}

	/**
	 * Constructor.
	 * 
	 * @param sourceLines the array of source code lines
	 * @param startLine the line of start position of code block
	 * @param startCol the column of start position of code block
	 * @param endLine the line of end position of code block
	 * @param endCol the column of end position of code block
	 */
	public AsCodeBlock(AsCodeLines sourceLines, int startLine, int startCol, int endLine, int endCol) {
		this(sourceLines, new Position(startLine, startCol), new Position(endLine, endCol));
	}
	
	/**
	 * Check whether a position belongs to this code block or not.
	 * @param p a position interest
	 */
	public boolean ownsPosition(Position p) {
		return p!= null && !p.isBefore(start) && p.isBefore(end);
	}
	
	/**
	 * Check whether a block is sub-block of this code block or not.
	 * @param block a code block interest
	 */
	public boolean ownsSubBlock(AsCodeBlockBase block) {
		return block != null && block.isValid() && 
				ownsPosition(block.start) && block.end != null
				&& !block.end.isBefore(start) && !end.isBefore(block.end);
	}
	
	/**
	 * Search for a string in the code block
	 * @param s a string to search for
	 * @param fromPos a position from which to start the search
	 * @return The position of the string <code>s</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getPositionOf(String s, Position fromPos) {
		if (fromPos == null)
			fromPos = new Position(0, 0);
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		
		for (int i = fromPos.line; i < sourceLines.size(); i++) {
			Position p = new Position();
			if (i == fromPos.line)
				p.col = sourceLines.get(i).indexOf(s, fromPos.col);
			else
				p.col = sourceLines.get(i).indexOf(s);
			if (p.col > -1) {
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}
	
	/**
	 * Search for a regular expression in the code block
	 * @param pattern a regular expression to search for
	 * @param fromPos a position from which to start the search
	 * @return The position of the pattern <code>pattern</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getPositionOf(Pattern pattern, Position fromPos) {
		Matcher matcher;

		if (fromPos == null)
			fromPos = new Position(0, 0);
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		
		for (int i = fromPos.line; i < sourceLines.size(); i++) {
			Position p = new Position();
			matcher = pattern.matcher(sourceLines.get(i));
			if (i == fromPos.line) {
				if (matcher.find(fromPos.col)) {
					p.col = matcher.start();
				}
			} else {
				if (matcher.find()) {
					p.col = matcher.start();
				}
			}
			if (p.col > -1) {
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}
	
	/**
	 * Search for a string in the code block. The search will stop immediately
	 * if a stop sign is reached.
	 * @param s a string to search for
	 * @param fromPos a position from which to start the search
	 * @param stopSign the stop sign
	 * @return The position of the string <code>s</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getPositionOf(String s, Position fromPos, String stopSign) {
		if (fromPos == null)
			fromPos = new Position(0, 0);
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		
		for (int i = fromPos.line; i < sourceLines.size(); i++) {
			Position p = new Position();
			if (i == fromPos.line)
				p.col = sourceLines.get(i).indexOf(s, fromPos.col);
			else
				p.col = sourceLines.get(i).indexOf(s);
			if (p.col > -1) {
				if (stopSign != null) {
					int stopCol = sourceLines.get(i).lastIndexOf(stopSign, p.col);
					if (stopCol > -1) {
						if (i != fromPos.line || stopCol >= fromPos.col) {
							break;
						}
					}
				}
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}
	
	/**
	 * Search for the last occurrence of a regular expression in the code block
	 * @param pattern a regular expression to search for
	 * @param fromPos a position from which to start the search
	 * @return The last position of the pattern <code>pattern</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getLastPositionOf(Pattern pattern, Position fromPos) {
		Matcher matcher;

		if (fromPos == null)
			fromPos = end;
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		
		for (int i = fromPos.line; i > -1; i--) {
			Position p = new Position();
			matcher = pattern.matcher(sourceLines.get(i));
			while (matcher.find()) {
				if (i == fromPos.line) {
					if (matcher.start() > fromPos.col)
						break;
				}
				p.col = matcher.start();
			}

			if (p.col > -1) {
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}

	/**
	 * Search for the last occurrence of a string in the code block.
	 * The search will stop immediately if a stop sign is reached.
	 * @param s a string to search for
	 * @param fromPos a position from which to start the search
	 * @return The last position of the pattern <code>pattern</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getLastPositionOf(String s, Position fromPos,
			String stopSign) {
		if (fromPos == null)
			fromPos = end;
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		
		for (int i = fromPos.line; i >= start.line; i--) {
			Position p = new Position();
			if (i == fromPos.line)
				p.col = sourceLines.get(i).lastIndexOf(s, fromPos.col);
			else
				p.col = sourceLines.get(i).lastIndexOf(s);
			if (p.col > -1) {
				if (stopSign != null) {
					int stopCol = sourceLines.get(i).indexOf(stopSign, p.col);
					if (stopCol > -1) {
						if (i != fromPos.line || stopCol <= fromPos.col) {
							break;
						}
					}
				}
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}
	
	/**
	 * Search in the code block for the last occurrence of a word that is inside a string 
	 * that matched a regular expression.
	 * @param word the word to search for
	 * @param pattern a regular expression to search for
	 * @param fromPos a position from which to start the search
	 * @return The last position of the word <code>word</code> in the code block.
	 * If no such value exists, then <code>null</code> is returned.
	 */
	public Position getPositionOfWord(String word, Pattern pattern,
			Position fromPos) {
		Matcher matcher;
		int matchPos;
		if (fromPos == null)
			fromPos = new Position(0, 0);
		else if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		for (int i = fromPos.line; i <= end.line; i++) {
			Position p = new Position();
			matcher = pattern.matcher(sourceLines.get(i));
			matchPos = -1;
			if (i == fromPos.line) {
				if (matcher.find(fromPos.col))
					matchPos = matcher.start();
			} else {
				if (matcher.find())
					matchPos = matcher.start();
			}

			if (matchPos > -1)
				p.col = sourceLines.get(i).indexOf(word, matchPos);

			if (p.col > -1) {
				p.line = i;
				if (ownsPosition(p))
					return p;
			}
		}

		return null;
	}
	
	/**
	 * Find the word that has position placed right before a given position.
	 * A word is a substring placed between two characters belongs to the list
	 * defined by <code>WORD_SEPARATORS</code> constant.
	 * @param fromPos a position from which to start the search
	 * @return The <code>AsCodeBlockBase</code> object represents the word 
	 * in the code block that is right before the position.
	 * If no such value exists, then <code>null</code> is returned.
	 * @see #hitNextWord
	 */
	public AsCodeBlockBase hitPreviousWord(Position fromPos) {
		if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		AsCodeBlockBase block = new AsCodeBlockBase(new Position(), new Position());
		int j;
		boolean found;
		for (int i = fromPos.line; i > -1; i--) {
			found = false;
			if (i == fromPos.line) {
				j = fromPos.col - 1;
				if (j + 1 < sourceLines.get(i).length()
						&& WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j + 1)) != -1)
					found = true;

			} else
				j = sourceLines.get(i).length() - 1;
			
			while (!found && i == fromPos.line && j > -1 && 
					WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) == -1) {
				j--;
			}
			
			while (j > -1 && WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) != -1) {
				j--;
			}			

			if (j == -1)
				continue;

			block.end.col = j + 1;

			while (j > -1 && WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) == -1) {
				j--;
			}

			block.start.col = j + 1;
			block.start.line = i;
			if (block.end.col == sourceLines.get(i).length()) {
				block.end.col = 0;
				block.end.line = i + 1;
			} else
				block.end.line = i;
			
			if (block.isValid()) {
				return block;
			}
		}

		return null;
	}
	
	/**
	 * Find the word that has position placed right after a given position.
	 * A word is a substring placed between two characters belongs to the list
	 * defined by <code>WORD_SEPARATORS</code> constant.
	 * @param fromPos a position from which to start the search
	 * @return The <code>AsCodeBlock</code> object represents the word 
	 * in the code block that is right after the position.
	 * If no such value exists, then <code>null</code> is returned.
	 * @see #hitPreviousWord
	 */
	public AsCodeBlock hitNextWord(Position fromPos) {
		if(!ownsPosition(fromPos))
			throw new IndexOutOfBoundsException();
		AsCodeBlock block = new AsCodeBlock(sourceLines);
		int j;
		boolean found;
		for (int i = fromPos.line; i < sourceLines.size(); i++) {
			found = false;
			if (i == fromPos.line) {
				j = fromPos.col + 1;
				if (j > 0
						&& WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j - 1)) != -1)
					found = true;
			} else
				j = 0;
			
			while (!found && i == fromPos.line && j < sourceLines.get(i).length() && 
					WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) == -1) {
				j++;
			}
			
			while (j < sourceLines.get(i).length()
					&& WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) != -1) {
				j++;
			}

			if (j == sourceLines.get(i).length())
				continue;

			block.start.col = j;
			block.start.line = i;
			while (j < sourceLines.get(i).length() &&
					WORD_SEPARATORS.indexOf(sourceLines.get(i).charAt(j)) == -1) {
				j++;
			}

			block.end.col = j;
			if (block.end.col == sourceLines.get(i).length()) {
				block.end.col = 0;
				block.end.line = i + 1;
			} else
				block.end.line = i;

			if (block.isValid()) {
				return block;
			}
		}

		return null;
	}
	
	/**
	 * Get a sub-block
	 * @param start the start of the sub-block to get
	 * @param end the start of the sub-block to get
	 * @return the sub-bock with start and end position specified.
	 */
	public AsCodeBlock getSubBlock(Position start, Position end) {
		if (ownsPosition(start) && ownsPosition(end))
		{
			return new AsCodeBlock(this.sourceLines, start, end);
		}
		else
			throw new IndexOutOfBoundsException();
	}
	
	/**
	 * Insert text lines into the source lines array
	 * @param line index of the new line 
	 * @param texts the text lines to insert
	 */
	public void insertLines(int line, String[] texts) {		
		int l = sourceLines.size();
		if (texts == null || texts.length == 0 || l < line) 
			return;
		/*if (sourceLines.add(line, texts))
			end.line += texts.length;*/
		sourceLines.add(line, texts);
	}
	
	/**
	 * Insert a sub-block into this block at the specified position
	 * @param pos the position that the sub-block will be inserted
	 * @param block the sub-block to insert
	 * @return the <code>AsCodeBlockBase</code> object represents the
	 * inserted block's <code>start</code> and <code>end</code> information.
	 * If nothing changed then it returns <code>null</code>.
	 */
	public AsCodeBlockBase insertSubBlock(Position pos, AsCodeBlock block) {
		if (!ownsPosition(pos))
			throw new IndexOutOfBoundsException();
		String[] insertLines = block.toStrings();
		
		if(insertLines.length == 0)
			return null;
		AsCodeBlockBase insertedBlock = new AsCodeBlockBase();
		insertedBlock.start = pos.clone();
		insertedBlock.end = new Position(pos.line + insertLines.length - 1, -1);
		insertedBlock.end.col = insertLines.length == 1 ? 
				pos.col + insertLines[0].length() : insertLines[insertLines.length - 1].length();
				
		String s = sourceLines.get(pos.line);	
		insertLines[insertLines.length - 1] +=  s.substring(pos.col);
		sourceLines.set(pos.line, s.substring(0, pos.col) + insertLines[0]);
		
		if (insertLines.length > 1)
		{
			String[] a = new String[insertLines.length - 1];
			System.arraycopy(insertLines, 1, a, 0, insertLines.length - 1);
			insertLines = a;
		}
		else
			insertLines = null;
		//p.line++;
		
		insertLines(pos.line + 1, insertLines);
		
		sourceLines.doInsertTransitivity(insertedBlock);
		return insertedBlock;
	}
	
	/**
	 * Insert a text into this code block at the specified position.
	 * The text will be split into lines by the delimiter of 
	 * <code>'\r'</code>, <code>'\n'</code> or <code>'\r\n'</code>
	 * before insert to this block.
	 * @param pos the position that the text will be inserted
	 * @param text the text to insert
	 */
	public void insertText(Position pos, String text) {
		AsCodeBlock block = new AsCodeBlock(
								new AsCodeLines(ToolUtil.textToArray(text)));
		insertSubBlock(pos, block);
	}
	
	/**
	 * Delete a sub-block from this code block. 
	 * @param start the start position of the sub-block that to be removed
	 * @param end the end position of the sub-block that to be removed
	 */
	public void deleteSubBlock(Position start, Position end) {
		Position p;
		if(end.isBefore(start)) {
			p = start;
			start = end;
			end = p;
		}
		if(start.line == end.line) {
			if(start.col == 0 && end.col == sourceLines.get(start.line).length())
				sourceLines.remove(start.line);
			else
				sourceLines.set(start.line, 
						sourceLines.get(start.line).substring(start.col, end.col));
		} else {
			if(start.col == 0)
				sourceLines.remove(start.line);
			else
				sourceLines.set(start.line, 
						sourceLines.get(start.line).substring(start.col));
			
			if(end.col == sourceLines.get(start.line).length())
				sourceLines.remove(end.line);
			else
				sourceLines.set(end.line, 
						sourceLines.get(end.line).substring(0, end.col));
			
			if (end.line - start.line > 1) {
				sourceLines.remove(start.line + 1, end.line - start.line - 1);
			}
		}
	}
	
	/**
	 * Delete a sub-block that has size of <code>count</code> characters
	 * from this code block. 
	 * @param start the start position of the sub-block that to be deleted
	 * @param count the number of characters will be deleted
	 */
	public void deleteSubBlock(Position start, int count) {
		deleteSubBlock(start, start.add(sourceLines, count));
	}
	
	/**
	 * Returns a new string that is a substring of this block's text. 
	 * The substring begins at the specified <code>start</code> position 
	 * and extends to the character at index right before <code>end</code> 
	 * position in the block.<br>
	 * Thus the length of the substring is <code>end.positionDiff(start)</code>. 
	 * @param start the start position
	 * @param end the end position
	 * @return The a substring of this block's text begin at <code>start</code> 
	 * position and extends to the character at index right before 
	 * <code>end</code> position.
	 */
	public String subString(Position start, Position end) {
		return getSubBlock(start, end).toString();
	}
	/**
	 * Convert the <code>AsCodeBlock</code> object to an array of strings.
	 * The first and last line is substring of the corresponding lines in
	 * <code>sourceLines</code> array, specified by <code>start</code> and
	 * <code>end</code> properties of this block.
	 */
	public String[] toStrings() {
		String[] array = new String[end.line - start.line + 1];
		for (int i = start.line; i <= end.line; i++) {
			String s;
			if (i == start.line) {
				s = sourceLines.get(i).substring(start.col, i == end.line ? end.col
						: sourceLines.get(i).length());
			} else if (i == end.line) {
				s = sourceLines.get(i).substring(0, end.col);
			} else {
				s = sourceLines.get(i);
			}
			array[i - start.line] = s;
		}
		return array;
	}
	
	@Override
	public String toString() {
		return ToolUtil.joinStrings(toStrings(), "\r\n");
	}
	
	public int size() {
		return end.diff(sourceLines, start);
	}
	/**
	 * Do transitivity whenever a code-block is inserted
	 * @param insertedBlock the inserted code-block.<br>
	 */
	void doInsertTransitivity(AsCodeBlockBase editBlock) {
		doInsertTransitivity(start, end, editBlock);
		if (this instanceof AsCodeBody) {
			AsCodeBody body = (AsCodeBody)this;
			if(body.getBodyStart() != null && body.getBodyEnd() != null
					&& editBlock.start.isBefore(body.getBodyEnd()))
				doInsertTransitivity(body.getBodyStart(), body.getBodyEnd(), editBlock);
		}
	}
	
	private void doInsertTransitivity(Position start, Position end, AsCodeBlockBase editBlock) {
		int lines = editBlock.end.line - editBlock.start.line;
		int cols = editBlock.end.col - editBlock.start.col;
		if(editBlock.start.line < start.line) {
			start.line += lines;
		} else if(!start.isBefore(editBlock.start)) {//=> editBlock.start.line == start.line			
			start.col += cols;
			if (end.line == start.line)
				end.col += cols;
			
			start.line += lines;					
		} else {
			if (end.line == editBlock.start.line)
				end.col += cols;
		}
		end.line += lines;
	}
	
	/**
	 * Do transitivity whenever a code-block is deleted
	 * @param deletedBlock the deleted code-block.<br>
	 */
	void doDeleteTransitivity(AsCodeBlockBase deletedBlock) {
		//Not implemented
		throw new UnsupportedOperationException();
	}
}
