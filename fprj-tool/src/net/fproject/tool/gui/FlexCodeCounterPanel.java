package net.fproject.tool.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JCheckBox;

@SuppressWarnings("serial")
public class FlexCodeCounterPanel extends JPanel implements ActionListener{
	private FprjToolApp app;
	private JButton btnRun;
	private IActionHelper helper;
	private JTextField txtSrcFolder;
	private JTextField txtOutputCsvFile;
	private JCheckBox cbxNoOutput;
	
	private JFileChooser fc;
	private JButton btnSrcFolderOpen;
	private JButton btnOutputCsvFileOpen;
	
	/**
	 * Create the panel.
	 */
	@SuppressWarnings("rawtypes")
	public FlexCodeCounterPanel(FprjToolApp app, Class helperFactory) {
		btnRun = new JButton("Run!");
		btnRun.setBounds(202, 241, 59, 25);
		add(btnRun);
		
		btnRun.addActionListener(this);
		setLayout(null);
		
		JLabel lblSrcFolder = new JLabel("Source Folder:");
		lblSrcFolder.setBounds(25, 91, 96, 16);
		add(lblSrcFolder);
		
		txtSrcFolder = new JTextField();
		txtSrcFolder.setColumns(10);
		txtSrcFolder.setBounds(154, 88, 343, 22);
		add(txtSrcFolder);
		
		JLabel lblOutputFile = new JLabel("Output CSV File:");
		lblOutputFile.setBounds(25, 132, 129, 16);
		add(lblOutputFile);
		
		txtOutputCsvFile = new JTextField();
		txtOutputCsvFile.setColumns(10);
		txtOutputCsvFile.setBounds(154, 129, 343, 22);
		add(txtOutputCsvFile);
		
		btnOutputCsvFileOpen = new JButton("...");
		btnOutputCsvFileOpen.setBounds(505, 128, 45, 25);
		btnOutputCsvFileOpen.addActionListener(this);
		add(btnOutputCsvFileOpen);
		
		btnSrcFolderOpen = new JButton("...");
		btnSrcFolderOpen.setBounds(505, 87, 45, 25);
		btnSrcFolderOpen.addActionListener(this);
		add(btnSrcFolderOpen);
		
		cbxNoOutput = new JCheckBox("Do not create output file");
		cbxNoOutput.setSelected(true);
		cbxNoOutput.setBounds(154, 171, 266, 25);
		add(cbxNoOutput);
		
		fc = new JFileChooser();
		
		this.app = app;
		try {
			this.helper = (IActionHelper)helperFactory.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		 //Handle input button action.
        if (e.getSource() == btnSrcFolderOpen) {
        	fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 
            int returnVal = fc.showOpenDialog(app);

            if (returnVal == JFileChooser.APPROVE_OPTION) {
                File file = fc.getSelectedFile();
                txtSrcFolder.setText(file.getPath());
                //This is where a real application would open the file.
                app.appendLog("Opening: " + file.getName() + "." + "\n");
            } else {
            	app.appendLog("Open command cancelled by user." + "\n");
            }

        //Handle output button action.
        } else if (e.getSource() == btnOutputCsvFileOpen) {
        	fc.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES); 
            int returnVal = fc.showSaveDialog(app);
            if (returnVal == JFileChooser.APPROVE_OPTION) {
                File file = fc.getSelectedFile();
                txtOutputCsvFile.setText(file.getPath());
                if(file.getPath() != null)
                	cbxNoOutput.setSelected(false);
                //This is where a real application would save the file.
                app.appendLog("Saving: " + file.getName() + "." + "\n");
            } else {
            	app.appendLog("Save command cancelled by user." + "\n");
            }
          //Handle output button action.
        } else if (e.getSource() == btnRun) {
        	helper.runAction(new FlexCodeCounterModel(txtSrcFolder.getText(), txtOutputCsvFile.getText(), cbxNoOutput.getModel().isSelected()));
        }
	}
}
