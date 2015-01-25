package net.fproject.tool.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Table {
	public String name;
	public String comment;

	public List<Column> columns;
	// ++NguyenBS added
	public List<Table> referencedTables;
	private Tables parents = null;
	private Tables children = null;// = new Tables();
	private boolean isBrowsedTreeNode = false;
	public String engine = null;

	private Schema schema;

	public static long browsedTablesCount = 0;

	public boolean isBrowsedTreeNode() {
		return isBrowsedTreeNode;
	}

	public boolean isChildOf(Table tbl) {
		if (parents != null && parents.contains(tbl))
			return true;
		else
			return false;
	}

	public boolean isParentOf(Table tbl) {
		if (children != null && children.contains(tbl))
			return true;
		else
			return false;
	}

	public void addParent(Table parent) {
		if (this.parents == null) {
			this.parents = new Tables();
		}

		if (parents.findByName(parent.name) == null) {
			parents.add(parent);
		}
	}

	public Column findColumnByName(String name) {
		for (Column col : this.columns) {
			if (col.name.equalsIgnoreCase(name)) {
				return col;
			}
		}
		return null;
	}

	public List<Column> getPrimaryKeys() {
		List<Column> cols = new ArrayList<Column>();
		for (Column col : this.columns) {
			if (col.isPrimaryKey()) {
				cols.add(col);
			}
		}
		return cols;
	}

	public Tables getParents() {
		return parents;
	}

	public void addChild(Table child) {
		if (this.children == null) {
			this.children = new Tables();
		}

		if (children.findByName(child.name) == null) {
			children.add(child);
		}
	}

	public boolean equals(Table tbl) {
		return this.name.equalsIgnoreCase(tbl.name);
	}

	public String getRooScriptFromThisNode(String packageName) {
		String script = "";
		Stack<Table> tableStack = new Stack<Table>();
		tableStack.push(this);
		// long processCount = 0;
		while (tableStack.size() > 0) {
			Table currentTable = tableStack.pop();
			// processCount++;
			// System.out.println(processCount);
			if (!currentTable.isBrowsedTreeNode) {
				if (currentTable.parents != null) {
					boolean notBrowsedParentFound = false;
					for (Table tbl : currentTable.parents) {
						if (!tbl.isBrowsedTreeNode && tbl.parents != null
								&& !this.equals(tbl)
								&& !currentTable.equals(tbl)) {
							notBrowsedParentFound = true;
							if (tableStack.indexOf(tbl) == -1) {
								tableStack.push(tbl);
							}
						} else if (!tbl.isBrowsedTreeNode
								&& tbl.parents == null) {
							script += tbl.getRooScript(packageName);
						}
					}
					if (!notBrowsedParentFound) {
						script += currentTable.getRooScript(packageName);
					}
				} else {
					script += currentTable.getRooScript(packageName);
				}
			}
		}
		return script;
	}

	public void copyTablesFromThisNode(Tables targetTables) {
		Stack<Table> tableStack = new Stack<Table>();
		tableStack.push(this);
		// long processCount = 0;
		while (tableStack.size() > 0) {
			Table currentTable = tableStack.pop();
			// processCount++;
			// System.out.println(processCount);
			if (!currentTable.isBrowsedTreeNode) {
				if (currentTable.parents != null) {
					boolean notBrowsedParentFound = false;
					for (Table tbl : currentTable.parents) {
						if (!tbl.isBrowsedTreeNode && tbl.parents != null
								&& !this.equals(tbl)
								&& !currentTable.equals(tbl)) {
							notBrowsedParentFound = true;
							if (tableStack.indexOf(tbl) == -1) {
								tableStack.push(tbl);
							}
						} else if (!tbl.isBrowsedTreeNode
								&& tbl.parents == null) {
							tbl
									.copyTableData(targetTables
											.findByName(tbl.name));
						}
					}
					if (!notBrowsedParentFound) {
						currentTable.copyTableData(targetTables
								.findByName(currentTable.name));
					}
				} else {
					currentTable.copyTableData(targetTables
							.findByName(currentTable.name));
				}
			}
		}
	}

	public String getRooTestIntegrationScript(String packageName) {
		return "test integration --entity " + packageName + "."
				+ Helper.convertToPascalName(this.name);
	}

	public String getRooScript(String packageName) {
		String script = "// ******TABLE: " + this.name + " ******\n";
		script += "entity --class " + packageName + "."
				+ Helper.convertToPascalName(this.name);
		Column pk = null;
		if (this.getPrimaryKeys().size() > 0) {
			pk = this.getPrimaryKeys().get(0);
			script += " --identifierField "
					+ Helper.convertToCamelName(pk.name)
					+ " --identifierColumn " + pk.name + " --identifierType "
					+ pk.getJavaType() + " --table " + this.name;
		}
		script += "\n";

		for (Column column : this.columns) {
			if (!column.equals(pk)) {
				script += "field ";
				// ++NguyenBS added
				if (column.referencedTableName == null
						|| column.referencedColumName == null) {
					// --NguyenBS added
					if (column.isNumericType())
						script += "number ";
					else if (column.isDateType())
						script += "date ";
					else
						script += "string ";
					script += "--fieldName "
							+ Helper.convertToCamelName(column.name) + " ";
					script += "--column " + column.name + " ";
					if (!column.isNullable)
						script += "--notNull ";

					if (column.isStringType() && column.characterMaxSize > 0)
						script += "--sizeMax " + column.characterMaxSize + " ";
					else {
						script += "--type " + column.getJavaType() + " ";

						if (column.isDoubleType()
								&& column.numericPrecision > 0)
							script += "--digitsInteger "
									+ column.numericPrecision + " ";

						if (column.isDoubleType() && column.numericScale > 0)
							script += "--digitsFraction " + column.numericScale
									+ " ";
					}

					if (column.comment != null && !"".equals(column.comment))
						script += "--comment \""
								+ Helper.getSqlEscapeString(column.comment)
								+ "\" ";
					// ++NguyenBS added
				} else {
					String fldName = Helper.convertToCamelName(column.name);
					if (fldName.endsWith("Id")) {
						fldName = fldName.substring(0, fldName.length() - 2);
					}
					script += "reference --fieldName " + fldName + " ";
					script += "--type "
							+ packageName
							+ "."
							+ Helper
									.convertToPascalName(column.referencedTableName)
							+ " ";

					script += "--joinColumnName " + column.name + " ";

					if (!column.isNullable)
						script += "--notNull ";

					if (column.comment != null && !"".equals(column.comment))
						script += "--comment \""
								+ Helper.getSqlEscapeString(column.comment)
								+ "\" ";
				}

				script += "\n";
			}

		}
		browsedTablesCount++;
		isBrowsedTreeNode = true;
		return script;
	}

	public Tables getChildren() {
		return children;
	}

	// --NguyenBS added

	public Table(String name, Schema schema) {
		this.name = name;
		this.schema = schema;
	}

	public List<Column> importColumns() {

		List<Column> listFields = new ArrayList<Column>();
		// System.out.println(this.name);
		try {
			ResultSet rs = this.schema
					.executeQuery("SELECT C.COLUMN_NAME,C.DATA_TYPE,C.IS_NULLABLE,C.CHARACTER_MAXIMUM_LENGTH,"
							// ++NguyenBS added
							+ "S.INDEX_NAME, S.SEQ_IN_INDEX,"
							+ "K.REFERENCED_TABLE_NAME,K.REFERENCED_COLUMN_NAME,K.CONSTRAINT_NAME,"
							+ "C.NUMERIC_PRECISION,C.NUMERIC_SCALE,C.COLUMN_COMMENT,C.COLUMN_TYPE,"
							+ "C.ORDINAL_POSITION,C.CHARACTER_SET_NAME,C.COLLATION_NAME,C.COLUMN_DEFAULT "
							// --NguyenBS added
							+ "FROM INFORMATION_SCHEMA.COLUMNS C "
							+ "LEFT JOIN (SELECT COLUMN_NAME,INDEX_NAME,SEQ_IN_INDEX "
							+ "FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_SCHEMA='"
							+ this.schema.name
							+ "' AND TABLE_NAME ='"
							+ this.name
							+ "') S ON S.COLUMN_NAME=C.COLUMN_NAME "
							// ++NguyenBS added
							+ "LEFT JOIN (SELECT COLUMN_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME,CONSTRAINT_NAME "
							+ "FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA='"
							+ this.schema.name
							+ "' AND TABLE_NAME ='"
							+ this.name
							+ "') K ON K.COLUMN_NAME=C.COLUMN_NAME "
							// --NguyenBS added
							+ "WHERE C.TABLE_SCHEMA='"
							+ this.schema.name
							+ "' AND C.TABLE_NAME ='"
							+ this.name
							+ "' GROUP BY C.COLUMN_NAME ORDER BY C.ORDINAL_POSITION");

			while (rs.next()) {
				Column col = new Column(rs.getString(1), rs.getString(2), rs
						.getBoolean(3), rs.getLong(4));
				col.indexName = rs.getString(5);
				col.seqInIndex = rs.getLong(6);
				col.referencedTableName = rs.getString(7);
				col.referencedColumName = rs.getString(8);
				col.constraintName = rs.getString(9);
				col.numericPrecision = rs.getLong(10);
				col.numericScale = rs.getLong(11);
				col.comment = rs.getString(12);
				col.columnType = rs.getString(13);
				col.ordinalPosition = rs.getLong(14);
				col.characterSetName = rs.getString(15);
				col.collationName = rs.getString(16);
				col.defaultValue = rs.getString(17);
				col.table = this;
				listFields.add(col);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.columns = listFields;
		return listFields;
	}

	public void updateTargetTable() throws SQLException {
		long[] idxs = new long[this.columns.size()];
		for (int i = 0; i < this.columns.size(); i++) {
			idxs[i] = i;// this.columns.get(i).ordinalPosition;
		}

		for (int i = 0; i < idxs.length; i++) {
			for (int j = i + 1; j < idxs.length; j++) {
				if (this.columns.get(j).ordinalPosition < this.columns.get(i).ordinalPosition) {
					long tmp = idxs[j];
					idxs[j] = idxs[i];
					idxs[i] = tmp;
				}
			}
		}

		String sql = "ALTER TABLE " + this.name + " ENGINE=" + this.engine
				+ ",";
		for (int i = 1; i < idxs.length; i++) {
			sql += "MODIFY COLUMN "
					+ this.columns.get((int) idxs[i]).getColumnSpec() + ",";
		}
		if (this.name.equalsIgnoreCase("project")) {
			System.out.println();
		}
		if (sql.endsWith(","))
			sql = sql.substring(0, sql.length() - 1);
		schema.executeUpdate(sql);
	}

	public void copyTableData(Table targetTable) {
		if (targetTable == null)
			return;
		String sql = "";

		for (Column col : this.columns) {
			if (targetTable.findColumnByName(col.name) != null) {
				sql += col.name + ",";
			}
		}
		if (sql.endsWith(","))
			sql = sql.substring(0, sql.length() - 1);

		sql = "INSERT INTO " + targetTable.schema.name + "." + targetTable.name
				+ "(" + sql + ") SELECT " + sql + " FROM " + this.schema.name
				+ "." + this.name;
		try {
			targetTable.schema.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

		browsedTablesCount++;
		isBrowsedTreeNode = true;
	}

	public void setSchema(Schema schema) {
		this.schema = schema;
	}

	public MasterTableMessage getMasterMessages(String columnPattern) {
		if (columnPattern == null)
			columnPattern = "code";
		String colName = null;
		MasterTableMessage message = new MasterTableMessage();
		for (Column col : this.columns) {
			if (col.name.matches(columnPattern)) {
				colName = col.name;
				break;
			}
		}
		if (colName != null) {
			ResultSet rs;
			try {
				rs = this.schema.executeQuery("SELECT " + colName + " FROM "
						+ this.name);
				while (rs.next()) {
					message.message += Helper.convertToPascalName(this.name)
							+ "." + rs.getString(1) + "=" + rs.getString(1)
							+ "\r\n";
					message.javaSource += "public static String "
							+ Helper.convertToCstyleConstantName(this.name)
							+ "_"
							+ Helper.convertToCstyleConstantName(rs
									.getString(1)) + " = \"" + rs.getString(1)
							+ "\";\r\n";
					message.asSource += "public static const "
							+ Helper.convertToCstyleConstantName(this.name)
							+ "_"
							+ Helper.convertToCstyleConstantName(rs
									.getString(1)) + ":String = \""
							+ rs.getString(1) + "\";\r\n";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return message;
	}
}
