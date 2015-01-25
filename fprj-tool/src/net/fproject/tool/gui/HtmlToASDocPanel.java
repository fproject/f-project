package net.fproject.tool.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class HtmlToASDocPanel extends JPanel implements ActionListener{
	FprjToolApp app;
	JButton btnRun;
	IActionHelper helper;

	private JTextField txtHtmlFolder;
	private JTextField txtExampleFolder;

	JFileChooser fc;
	JButton btnOpenHtmlFolder;
	JButton btnOpenExampleFolder;
	private JLabel lblTheOutputAsdoc;

	/**
	 * Create the panel.
	 */
	@SuppressWarnings("rawtypes")
	public HtmlToASDocPanel(FprjToolApp app, Class helperFactory) {
		setLayout(null);

		JLabel lblHtmlFolder = new JLabel("HTML Folder:");
		lblHtmlFolder.setBounds(25, 88, 96, 16);
		add(lblHtmlFolder);

		txtHtmlFolder = new JTextField();
		txtHtmlFolder.setBounds(154, 85, 343, 22);
		add(txtHtmlFolder);
		txtHtmlFolder.setColumns(10);

		JLabel lblOutputFolder = new JLabel("Example Folder:");
		lblOutputFolder.setBounds(25, 129, 129, 16);
		add(lblOutputFolder);

		txtExampleFolder = new JTextField();
		txtExampleFolder.setColumns(10);
		txtExampleFolder.setBounds(154, 126, 343, 22);
		add(txtExampleFolder);

		btnRun = new JButton("Run!");
		btnRun.setBounds(154, 212, 97, 25);
		add(btnRun);

		btnOpenHtmlFolder = new JButton("...");
		btnOpenHtmlFolder.setBounds(505, 84, 45, 25);
		btnOpenHtmlFolder.addActionListener(this);
		add(btnOpenHtmlFolder);

		btnOpenExampleFolder = new JButton("...");
		btnOpenExampleFolder.setBounds(505, 125, 45, 25);
		btnOpenExampleFolder.addActionListener(this);
		add(btnOpenExampleFolder);

		fc = new JFileChooser();
		fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 

		this.app = app;
		try {
			this.helper = (IActionHelper)helperFactory.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		btnRun.addActionListener(this);
		
		lblTheOutputAsdoc = new JLabel("Note: The output ASDoc classes are put directly to HTML folder!");
		lblTheOutputAsdoc.setBounds(25, 271, 423, 16);
		add(lblTheOutputAsdoc);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		//Handle input button action.
		if (e.getSource() == btnOpenHtmlFolder) {
			int returnVal = fc.showOpenDialog(app);

			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				txtHtmlFolder.setText(file.getPath());
				//This is where a real application would open the file.
				app.appendLog("Opening: " + file.getName() + "." + "\n");
			} else {
				app.appendLog("Open command cancelled by user." + "\n");
			}

			//Handle output button action.
		} else if (e.getSource() == btnOpenExampleFolder) {
			int returnVal = fc.showSaveDialog(app);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				txtExampleFolder.setText(file.getPath());
				//This is where a real application would save the file.
				app.appendLog("Saving: " + file.getName() + "." + "\n");
			} else {
				app.appendLog("Save command cancelled by user." + "\n");
			}
			//Handle output button action.
		} else if (e.getSource() == btnRun) {
			helper.runAction(new HtmlToASDocModel(txtHtmlFolder.getText(),txtExampleFolder.getText()));
		}
	}
}
