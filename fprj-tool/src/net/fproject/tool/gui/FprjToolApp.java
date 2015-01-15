package net.fproject.tool.gui;

import javax.swing.ImageIcon;
import javax.swing.BorderFactory;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTextArea;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.Point;
import java.awt.Rectangle;
import java.io.PrintStream;

@SuppressWarnings("serial")
public class FprjToolApp extends JPanel {
	JTextArea log;
	JScrollPane logPane;
	JFrame frame;

	/** Creates the GUI shown inside the frame's content pane. */
	public FprjToolApp(JFrame frame) {
		super(new BorderLayout());
		this.frame = frame;

		//Create the components.
		log = new JTextArea(5,20);
		log.setMargin(new Insets(5,5,5,5));
        log.setEditable(false);
        
        logPane = new JScrollPane(log);
        
		JTabbedPane tabbedPane = new JTabbedPane();
		tabbedPane.addTab("FlexUnit Auto Wire", null,
				new FlexUnitAutoWirePanel(this, FlexUnitAutoWireHelper.class),
				"Some description"); //tooltip text
		tabbedPane.addTab("Flex Code Counter", null,
				new FlexCodeCounterPanel(this, FlexCodeCounterHelper.class),
				"Some description"); //tooltip text
		tabbedPane.addTab("HTML to ASDoc", null,
				new HtmlToASDocPanel(this, HtmlToASDocHelper.class),
				"Some description"); //tooltip text

		add(tabbedPane, BorderLayout.CENTER);
		add(logPane, BorderLayout.PAGE_END);
		log.setBorder(BorderFactory.createEmptyBorder(10,10,10,10));
		
		setPrintStreamCapturer();
	}

	/** Sets the text displayed at the bottom of the frame. */
	public void appendLog(String message) {
		log.append(message);
		log.setCaretPosition(log.getDocument().getLength());	
	}

	private void setPrintStreamCapturer()
	{
		 PrintStream ps = System.out;
         System.setOut(new PrintStream(new PrintStreamCapturer("STDOUT", this, ps)));
	}
	
	/** Returns an ImageIcon, or null if the path was invalid. */
	protected static ImageIcon createImageIcon(String path) {
		java.net.URL imgURL = FprjToolApp.class.getResource(path);
		if (imgURL != null) {
			return new ImageIcon(imgURL);
		} else {
			System.err.println("Couldn't find file: " + path);
			return null;
		}
	}

	/**
	 * Create the GUI and show it.  For thread safety,
	 * this method should be invoked from the
	 * event-dispatching thread.
	 */
	private static void createAndShowGUI() {
		//Create and set up the window.
		JFrame frame = new JFrame("F-Project Tool");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setMinimumSize(new Dimension(600, 480));
		frame.setBounds(new Rectangle(new Point(200, 200)));
		//Create and set up the content pane.
		FprjToolApp newContentPane = new FprjToolApp(frame);
		newContentPane.setOpaque(true); //content panes must be opaque
		frame.setContentPane(newContentPane);

		//Display the window.
		frame.pack();
		frame.setVisible(true);
	}

	public static void main(String[] args) {
		//Schedule a job for the event-dispatching thread:
		//creating and showing this application's GUI.
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createAndShowGUI();
			}
		});
	}
}
