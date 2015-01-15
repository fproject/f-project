package net.fproject.tool.ascode;

import java.util.*;

import net.fproject.tool.ToolUtil;

/**
 * <p>An ordered collection of ActionScript code lines.
 * This is an implementation of <code>java.util.List</code> interface and extends 
 * <code>java.util.AbstractCollection</code> class.
 * With this implementation you will have precise control over where in the list each 
 * element is inserted. You can access elements by their integer index (position in the list), 
 * and search for elements in the list.</p>
 * 
 * <p>All properties and methods from <code>List</code> interface and <code>AbstractCollection</code>
 * class are available in this class.<br>
 * The following methods are written only for this class:
 * <pre><ul><li>public boolean add(int, String[])</li>
 * <li>public void remove(int, int)</li>
 * <li>public String getFirst()</li>
 * <li>public String getLast()</li>
 * <li>public void addElement(ActionScriptElement)</li>
 * <li>public void removeElement(ActionScriptElement)</li>
 * <li>public boolean equals(AsCodeLines)</li>
 * </ul></pre>
 * </p>
 * 
 * @author Bui Sy Nguyen
 *
 */
public class AsCodeLines extends AbstractCollection<String> implements List<String> {
	private String[] source;
	private int sourceSize;
	private List<ActionScriptElement> elements;
	
	/**
	 * Constructor
	 * @param source the source text lines.
	 */
	public AsCodeLines(String[] source) {
		if (source == null)
			throw new IllegalArgumentException();
		this.source = source;
		this.sourceSize = source.length;
		elements = new ArrayList<ActionScriptElement>();
	}

	@Override
	public int size() {
		return sourceSize;
	}

	@Override
	public Iterator<String> iterator() {
		return new Itr();
	}

	@Override
	public Object[] toArray() {
		String[] a = new String[size()];
		System.arraycopy(source, 0, a, 0, size());
		return a;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T[] toArray(T[] a) {
		return (T[])toArray();
	}

	@Override
	public boolean add(String e) {
		add(size(), e);
		return true;
	}

	@Override
	public boolean addAll(int index, Collection<? extends String> c) {
		return add(index, c.toArray(new String[0]));
	}

	/**
	 * Inserts all elements of a String array into this
     * list at the specified position (optional operation).  Shifts the
     * element currently at that position (if any) and any subsequent
     * elements to the right (increases their indices).  The new elements
     * will appear in this list in the order that they are returned by the
     * specified collection's iterator.  The behavior of this operation is
     * undefined if the specified collection is modified while the
     * operation is in progress.  (Note that this will occur if the specified
     * collection is this list, and it's nonempty.)
     *
     * @param index index at which to insert the first element from the
     *              specified array
     * @param array an array of String to be added to this list
     * 
     * @return <tt>true</tt> if this list changed as a result of the call
	 */
	public boolean add(int index, String[] array) {
		if(index > size())
			throw new IndexOutOfBoundsException();
		int count = array.length;
		if (count == 0)
			return false;
		
		ensureCapacity(sourceSize + count);
		int numMoved = sourceSize - index;
		if (numMoved > 0)
			System.arraycopy(source, index, source, index + count, numMoved);
		System.arraycopy(array, 0, source, index, count);
		sourceSize += count;
		return true;
	}
	
	@Override
	public String get(int index) {
		if(index < 0 || index >= size())
			throw new IndexOutOfBoundsException();
		return source[index];
	}

	@Override
	public String set(int index, String element) {
		if(index < 0 || index >= size())
			throw new IndexOutOfBoundsException();
		String oldValue = get(index);
		source[index] = element;
		return oldValue;
	}

	@Override
	public void add(int index, String element) {
		if(index < 0 || index > size())
			throw new IndexOutOfBoundsException();
		ensureCapacity(sourceSize + 1);
		int numMoved = sourceSize - index;
		if (numMoved > 0)
			System.arraycopy(source, index, source, index + 1, numMoved);
		source[index] = element;
		sourceSize++;
	}

	@Override
	public String remove(int index) {
		if(index < 0 || index >= size())
			throw new IndexOutOfBoundsException();
		String oldValue = get(index);
		
		int numMoved = sourceSize - index - 1;
		if (numMoved > 0)
			System.arraycopy(source, index + 1, source, index, numMoved);
		sourceSize--;
		source[sourceSize] = null;		
		return oldValue;
	}

	/**
	 * Remove an amount of <code>count</code>lines from <code>index</code> 
	 * @param index the start index of lines that will be removed
	 * @param count number of lines will be removed
	 */
	public void remove(int index, int count) {
		if(index < 0 || count < 0 || index + count >= size())
			throw new IndexOutOfBoundsException();
		
		int numMoved = sourceSize - index - count;
		if (numMoved > 0)
			System.arraycopy(source, index + count, source, index, numMoved);
		sourceSize -= count;
		for (int i = 0 ; i < count; i++) {
			source[sourceSize + i] = null;
		}
		
	}
	
	@Override
	public int indexOf(Object o) {
		if (o == null) {
			for (int i = 0; i < size(); i++) {
				if (get(i) == null)
					return i;
			}
		} else {
			for (int i = 0; i < size(); i++) {
				if (o.toString().equals(get(i)))
					return i;
			}
		}
		return -1;
	}

	@Override
	public int lastIndexOf(Object o) {
		ListIterator<String> it = listIterator(size());
        if (o==null) {
            while (it.hasPrevious())
                if (it.previous()==null)
                    return it.nextIndex();
        } else {
            while (it.hasPrevious())
                if (o.equals(it.previous()))
                    return it.nextIndex();
        }
        return -1;
	}

	@Override
	public ListIterator<String> listIterator() {
		return listIterator(0);
	}

	@Override
	public ListIterator<String> listIterator(int index) {
		if (index < 0 || index > size())
			throw new IndexOutOfBoundsException();
		return new ListItr(index);
	}

	@Override
	public List<String> subList(int fromIndex, int toIndex) {
		throw new UnsupportedOperationException();
	}

	/**
	 * Get the first string element in the list
	 */
	public String getFirst() {
		return get(0);
	}
	
	/**
	 * Get the last string element in the list
	 */
	public String getLast() {
		return get(size() - 1);
	}

	/**
	 * Add an <code>ActionScriptElement</code> to the blocks list under control
	 * of this <code>AsCodeLines</code>.
	 * @param elt the <code>ActionScriptElement</code> object to add
	 */
	public void addElement(ActionScriptElement elt) {
    	elements.add(elt);
    }
    
	/**
	 * Remove an <code>ActionScriptElement</code> from the blocks list under control
	 * of this <code>AsCodeLines</code>.
	 * @param block the <code>ActionScriptElement</code> object to remove
	 */
    public void removeElement(ActionScriptElement elt) {
    	elements.remove(elt);
    }
    
    /**
     * Compare two AsCodeLines objects.
     * @param o the object to compare to
     * @return <code>true</code> if the two objects are equal.
     * <code>false</code> if otherwise.
     */
    public boolean equals(AsCodeLines o) {
    	return ToolUtil.compareTwoStringArrays((String[])toArray(), (String[])o.toArray());
    }

	/**
	 * Do transitivity whenever a code-block is inserted
	 * @param insertedBlock the inserted code-block.<br>
	 */
	public void doInsertTransitivity(AsCodeBlockBase insertedBlock) {
		for (ActionScriptElement elt : this.elements) {
			if(elt.end != null && insertedBlock.start.isBefore(elt.end))
			{
				elt.doInsertTransitivity(insertedBlock);
			}
		}
	}
	
	/**
	 * Do transitivity whenever a code-block is deleted
	 * @param deletedBlock the deleted code-block.<br>
	 */
	public void doDeleteTransitivity(AsCodeBlockBase deletedBlock) {
		for (ActionScriptElement elt : this.elements) {
			if(deletedBlock.start.isBefore(elt.end))
				elt.doDeleteTransitivity(deletedBlock);
		}
	}
	
	/* ************************************************************************
	 * Private methods and inner classes
	 * ************************************************************************/
	
	private void ensureCapacity(int capacity) {
		if (capacity > source.length)
		{
			source = Arrays.copyOf(source, capacity);
		}
	}
	
	private class Itr implements Iterator<String> {
		/**
		 * Index of element to be returned by subsequent call to next.
		 */
		int cursor = 0;

		/**
		 * Index of element returned by most recent call to next or
		 * previous.  Reset to -1 if this element is deleted by a call
		 * to remove.
		 */
		int lastRet = -1;

		@Override
		public boolean hasNext() {
			return cursor < size();
		}

		@Override
		public String next() {
			String next = get(cursor);
			lastRet = cursor;
			cursor++;
			return next;
		}

		@Override
		public void remove() {
			AsCodeLines.this.remove(lastRet);
		}

	}
	
	private class ListItr extends Itr implements ListIterator<String> {
        ListItr(int index) {
            cursor = index;
        }

        public boolean hasPrevious() {
            return cursor != 0;
        }

        public String previous() {
            try {
                int i = cursor - 1;
                String previous = get(i);
                lastRet = cursor = i;
                return previous;
            } catch (IndexOutOfBoundsException e) {
                throw new NoSuchElementException();
            }
        }

        public int nextIndex() {
            return cursor;
        }

        public int previousIndex() {
            return cursor-1;
        }

        public void set(String e) {
            if (lastRet < 0)
                throw new IllegalStateException();

            try {
            	AsCodeLines.this.set(lastRet, e);
            } catch (IndexOutOfBoundsException ex) {
                throw new ConcurrentModificationException();
            }
        }

        public void add(String e) {
            try {
                int i = cursor;
                AsCodeLines.this.add(i, e);
                lastRet = -1;
                cursor = i + 1;
            } catch (IndexOutOfBoundsException ex) {
                throw new ConcurrentModificationException();
            }
        }
    }
}
