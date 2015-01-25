package net.fproject.tool.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JFileChooser;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;

@SuppressWarnings("serial")
public class FlexUnitAutoWirePanel extends JPanel implements ActionListener{
	private JTextField txtSourceFolder;
	private JTextField txtOutputScriptFolder;

	FprjToolApp app;
	JButton btnRun;
	IActionHelper helper;
	
	JFileChooser fc;
	JButton btnOpenSourceFolder;
	JButton btnOpenOutputFolder;
	
	/**
	 * Create the panel.
	 */
	@SuppressWarnings("rawtypes")
	public FlexUnitAutoWirePanel(FprjToolApp app, Class helperFactory) {
		setLayout(null);
		
		JLabel lblSourceFolder = new JLabel("Source Folder:");
		lblSourceFolder.setBounds(25, 88, 96, 16);
		add(lblSourceFolder);
		
		txtSourceFolder = new JTextField();
		txtSourceFolder.setBounds(154, 85, 343, 22);
		add(txtSourceFolder);
		txtSourceFolder.setColumns(10);
		
		JLabel lblOutputFolder = new JLabel("Script Output Folder:");
		lblOutputFolder.setBounds(25, 129, 129, 16);
		add(lblOutputFolder);
		
		txtOutputScriptFolder = new JTextField();
		txtOutputScriptFolder.setColumns(10);
		txtOutputScriptFolder.setBounds(154, 126, 343, 22);
		add(txtOutputScriptFolder);
		
		btnRun = new JButton("Run!");
		btnRun.setBounds(154, 212, 97, 25);
		add(btnRun);
		
		btnOpenSourceFolder = new JButton("...");
		btnOpenSourceFolder.setBounds(505, 84, 45, 25);
		btnOpenSourceFolder.addActionListener(this);
		add(btnOpenSourceFolder);
		
		btnOpenOutputFolder = new JButton("...");
		btnOpenOutputFolder.setBounds(505, 125, 45, 25);
		btnOpenOutputFolder.addActionListener(this);
		add(btnOpenOutputFolder);

		fc = new JFileChooser();
		fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 
		
		this.app = app;
		try {
			this.helper = (IActionHelper)helperFactory.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		btnRun.addActionListener(this);
	}
	
	public void actionPerformed(ActionEvent e) {

        //Handle input button action.
        if (e.getSource() == btnOpenSourceFolder) {
            int returnVal = fc.showOpenDialog(app);

            if (returnVal == JFileChooser.APPROVE_OPTION) {
                File file = fc.getSelectedFile();
                txtSourceFolder.setText(file.getPath());
                //This is where a real application would open the file.
                app.appendLog("Opening: " + file.getName() + "." + "\n");
            } else {
            	app.appendLog("Open command cancelled by user." + "\n");
            }

        //Handle output button action.
        } else if (e.getSource() == btnOpenOutputFolder) {
            int returnVal = fc.showSaveDialog(app);
            if (returnVal == JFileChooser.APPROVE_OPTION) {
                File file = fc.getSelectedFile();
                txtOutputScriptFolder.setText(file.getPath());
                //This is where a real application would save the file.
                app.appendLog("Saving: " + file.getName() + "." + "\n");
            } else {
            	app.appendLog("Save command cancelled by user." + "\n");
            }
          //Handle output button action.
        } else if (e.getSource() == btnRun) {
        	helper.runAction(new FlexUnitAutoWireModel(txtSourceFolder.getText(),txtOutputScriptFolder.getText()));
        }
    }
}
