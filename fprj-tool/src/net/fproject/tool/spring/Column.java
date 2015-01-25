package net.fproject.tool.spring;

import java.util.HashMap;

public class Column {
	public String name;
	public String type;
	public String columnType;
	public boolean isNullable;
	public long characterMaxSize;
	public long numericPrecision;
	public long numericScale;
	public String comment;
	public String indexName;// preserved
	public long seqInIndex;// preserved
	public String referencedTableName;
	public String referencedColumName;
	public String constraintName;// preserved
	public String defaultValue;
	public String characterSetName;
	public String collationName;
	public long ordinalPosition;

	public Table table;

	private static HashMap<String, String> SQL_DATA_TYPES = initSqlTypes();
	private static final String NUMERIC_INTEGER = "Integer";
	private static final String NUMERIC_LONG = "Long";
	private static final String NUMERIC_DOUBLE = "Double";
	private static final String DATE_TIME = "Date Time";
	private static final String TEXT = "Text";
	private static final String MISC = "MISC";

	public boolean equals(Column col) {
		return this.name.equalsIgnoreCase(col.name);
	}

	private static HashMap<String, String> initSqlTypes() {
		HashMap<String, String> sqlTypes = new HashMap<String, String>();
		sqlTypes.put("bit", NUMERIC_INTEGER);
		sqlTypes.put("tinyint", NUMERIC_INTEGER);
		sqlTypes.put("smallint", NUMERIC_INTEGER);
		sqlTypes.put("mediumint", NUMERIC_INTEGER);
		sqlTypes.put("int", NUMERIC_INTEGER);
		sqlTypes.put("bigint", NUMERIC_LONG);
		sqlTypes.put("float", NUMERIC_DOUBLE);
		sqlTypes.put("double", NUMERIC_DOUBLE);
		sqlTypes.put("decimal", NUMERIC_DOUBLE);
		sqlTypes.put("date", DATE_TIME);
		sqlTypes.put("datetime", DATE_TIME);
		sqlTypes.put("timestamp", DATE_TIME);
		sqlTypes.put("time", DATE_TIME);
		sqlTypes.put("enum", MISC);
		sqlTypes.put("year", MISC);
		sqlTypes.put("set", MISC);
		sqlTypes.put("char", TEXT);
		sqlTypes.put("varchar", TEXT);
		sqlTypes.put("tinytext", TEXT);
		sqlTypes.put("text", TEXT);
		sqlTypes.put("blob", TEXT);
		sqlTypes.put("mediumtext", TEXT);
		sqlTypes.put("mediumblob", TEXT);
		sqlTypes.put("longtext", TEXT);
		sqlTypes.put("longblob", TEXT);
		return sqlTypes;
	}

	private String getTypeDivision() {
		return SQL_DATA_TYPES.get(this.type);
	}

	public Column(String name, String type, boolean isNull, long maxSize) {
		this.name = name.trim();
		this.type = type.trim();
		this.isNullable = isNull;
		this.characterMaxSize = maxSize;
	}

	public Column getPreviousOrdinalColumn() {
		if (this.ordinalPosition <= 1)
			return null;
		for (Column c : this.table.columns) {
			if (c.ordinalPosition == this.ordinalPosition - 1)
				return c;
		}
		return null;
	}

	public String getDefaultValueSpec() {
		if (defaultValue == null)
			return null;
		if (isStringType())
			return "'" + Helper.getSqlEscapeString(defaultValue) + "'";
		if (isDateType() && !defaultValue.matches("^[A-Za-z_]+$"))
			return "'" + Helper.getSqlEscapeString(defaultValue) + "'";
		return defaultValue;
	}

	public String getColumnSpec() {
		String spec = this.name
				+ " "
				+ this.columnType
				+ " "
				+ (this.isNullable ? "" : "NOT NULL ")
				+ (this.defaultValue == null ? "" : "DEFAULT "
						+ this.getDefaultValueSpec());
		Column preCol = this.getPreviousOrdinalColumn();
		if (preCol != null)
			spec += " AFTER " + preCol.name;
		return spec.trim();
	}

	public boolean isPrimaryKey() {
		return "PRIMARY".equalsIgnoreCase(constraintName);
	}

	public boolean isNumericType() {
		return NUMERIC_INTEGER.equals(this.getTypeDivision())
				|| NUMERIC_LONG.equals(this.getTypeDivision())
				|| NUMERIC_DOUBLE.equals(this.getTypeDivision());
	}

	public boolean isDateType() {
		return DATE_TIME.equals(this.getTypeDivision());
	}

	public boolean isIntergerType() {
		return NUMERIC_INTEGER.equals(this.getTypeDivision());
	}

	public boolean isLongType() {
		return NUMERIC_LONG.equals(this.getTypeDivision());
	}

	public boolean isDoubleType() {
		return NUMERIC_DOUBLE.equals(this.getTypeDivision());
	}

	public boolean isStringType() {
		return TEXT.equals(this.getTypeDivision())
				|| MISC.equals(this.getTypeDivision());
	}

	public String getJavaType() {
		if (this.isDateType())
			return "java.util.Date";
		else if (this.isIntergerType())
			return "java.lang.Integer";
		else if (this.isLongType())
			return "java.lang.Long";
		else if (this.isDoubleType())
			return "java.lang.Double";
		return "java.lang.String";
	}

}
