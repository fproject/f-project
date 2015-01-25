package net.fproject.tool.spring;

import java.sql.DriverManager;

public class BackEnd {

	/**
	 * @param args
	 */
	public static String ipAddress = "10.16.47.146";
	private static final int MODE_GENERATE_ROO_SCRIPT = 0;
	private static final int MODE_UPDATE_ORDINAL_POSITION = 1;
	private static final int MODE_COPY_DATA = 2;
	private static final int MODE_GENERATE_MESSAGE = 3;	
	private static final int MODE_GENERATE_TEST_INTEGRATION = 4;
	private static final int MODE_HELP = 5;

	public static String username = "root";
	public static String password = "root";

	public static String tablePattern = "^mst.*";
	public static String columnPattern = "code";

	public static void main(String[] args) {
		int mode = getCommandLineParameters(args);

		if (mode == MODE_HELP) {
			displayHelp();
			return;
		}
		if (!getConnections(mode)) {
			System.out.println("Connection failed");
			return;
		}
		Tables allTables = new Tables();
		allTables.setSchema(Helper.schema());
		allTables.importTables();

		if (mode == MODE_UPDATE_ORDINAL_POSITION) {
			allTables.updateColumnOrdinalPositions();
		} else if (mode == MODE_GENERATE_MESSAGE) {
			allTables.generateMasterMessages(tablePattern, columnPattern);
		} else if (mode == MODE_COPY_DATA) {
			allTables.copyTableData();
		} else if (mode == MODE_GENERATE_ROO_SCRIPT) {
			allTables.generateRooScript();
		}else if (mode == MODE_GENERATE_TEST_INTEGRATION) {
			allTables.generateRooTestIntegrationScript();
		}
	}

	/**
	 * Get command line parameters
	 * @param args command line arguments list
	 * @return the process mode<br/>
	 * MODE_GENERATE_ROO_SCRIPT : Generate ROO Script<br/>
	 * MODE_UPDATE_ORDINAL_POSITION: Update ordinal position of
	 * all columns in all target tables according to the source tables<br/>
	 * MODE_COPY_DATA : Copy data from source schema to target schema<br/>
	 * MODE_GENERATE_MESSAGE : Generate Java and AS3 source code for 
	 * resource bundle key and corresponding constants <br/>
	 * MODE_HELP : Display help<br/>
	 */
	private static int getCommandLineParameters(String args[]) {
		int mode = MODE_GENERATE_ROO_SCRIPT;
		// NguyenBS edited
		// if (args.length > 1) {
		if (args.length > 0) {
			if (args[0].startsWith("/U") || args[0].startsWith("/u")) {
				mode = MODE_UPDATE_ORDINAL_POSITION;
			} else if (args[0].startsWith("/c") || args[0].startsWith("/C")) {
				mode = MODE_COPY_DATA;
			} else if (args[0].startsWith("/m") || args[0].startsWith("/M")) {
				mode = MODE_GENERATE_MESSAGE;
			} else if (args[0].startsWith("/t") || args[0].startsWith("/T")) {
				mode = MODE_GENERATE_TEST_INTEGRATION;
			} else if (args[0].startsWith("/r") || args[0].startsWith("/R")) {
				mode = MODE_GENERATE_ROO_SCRIPT;
			}

			for (int i = 0; i < args.length; i++) {
				if (args[i].startsWith("-sv:")) {
					ipAddress = args[i].substring(4);
				}
				if (args[i].startsWith("-db:")) {
					Helper.schema().name = args[i].substring(4);
				}
				if (args[i].startsWith("-tdb:")) {
					Helper.targetSchema().name = args[i].substring(5);
				}

				if (args[i].startsWith("-col:")) {
					columnPattern = args[i].substring(5);
				}

				if (args[i].startsWith("-tab:")) {
					tablePattern = args[i].substring(5);
				}

				if (args[i].startsWith("-un:")) {
					username = args[i].substring(4);
				}
				if (args[i].startsWith("-pw:")) {
					password = args[i].substring(4);
				}
				if (args[i].startsWith("-pk:")) {
					// NguyenBS edited
					// Naming convention: package name always be in lower-case
					// pk = args[i].substring(4);
					Helper.packageName = args[i].substring(4).toLowerCase();
				}
				if (args[i].equalsIgnoreCase("-h")
						|| args[i].equalsIgnoreCase("/h")) {
					mode = MODE_HELP;
				}
				if (!args[i].startsWith("-sv:") && !args[i].startsWith("-db:")
						&& !args[i].startsWith("-un:")
						&& !args[i].startsWith("-pw:")
						&& !args[i].startsWith("-pk:")
						&& !args[i].startsWith("-tdb:")
						&& mode != MODE_UPDATE_ORDINAL_POSITION
						&& mode != MODE_COPY_DATA
						&& mode != MODE_GENERATE_MESSAGE
						&& mode != MODE_GENERATE_TEST_INTEGRATION) {
					mode = MODE_HELP;
					break;
				}
			}

		} else {
			mode = MODE_HELP;
		}
		return mode;
	}

	private static void displayHelp() {
		String help = "FI2 Back-End Tool\r\nUsage:\r\n"
				+ "java -jar rst.jar [Parameters]\r\n"
				+ "or\r\njava -jar rst.jar /u [Parameters]\r\n\r\nParameters:\r\n"
				+ "\r\n-sv:<Server IP address>"
				+ "\r\n The server IP address"
				+ "\r\n-db:<Database schema name>"
				+ "\r\n The database schema name"
				+ "\r\n-tdb:<Target database schema name>"
				+ "\r\n The Target database schema name"
				+ "\r\n-un:<DB login>"
				+ "\r\n The DB login name"
				+ "\r\n-pw:<DB password>"
				+ "\r\n DB password"
				+ "\r\n-pk:<Package>"
				+ "\r\n The source code's root package name parameter for ROO"
				+ "\r\n-col:<Column name pattern>"
				+ "\r\n The column name regular expression used for searching"
				+ "\r\n-tab:<Table name pattern>"
				+ "\r\n The table name regular expression used for searching"
				+ "\r\n Update target database"
				+ "\r\n/c\r\n Copy table data from source to target database"
				+ "\r\n/m\r\n Generate master messages and constants defining source files."
				+ "\r\n/t\r\n Generate ROO script for test integration."
				+ "\r\n-h" + "\r\n/h" + "\r\n Help" 
				+ "\r\n/u\r\n Update ordinal position of table's columns in target database";
		System.out.println(help);
	}

	private static boolean getConnections(int mode) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			if (Helper.schema().name == null)
				Helper.schema().name = "fi2";
			Helper.connection = DriverManager.getConnection("jdbc:mysql://"
					+ ipAddress + "/" + Helper.schema().name, username,
					password);
			Helper.schema().statement = Helper.connection.createStatement();
			if ((mode == MODE_UPDATE_ORDINAL_POSITION || mode == MODE_COPY_DATA)
					&& Helper.targetSchema().name != null) {
				Helper.targetConnection = DriverManager.getConnection(
						"jdbc:mysql://" + ipAddress + "/"
								+ Helper.targetSchema().name, username,
						password);
				Helper.targetSchema().statement = Helper.targetConnection
						.createStatement();
				Helper.targetConnection.setAutoCommit(false);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
