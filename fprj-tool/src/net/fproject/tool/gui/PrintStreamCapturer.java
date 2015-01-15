package net.fproject.tool.gui;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

public class PrintStreamCapturer extends OutputStream {
	private StringBuilder buffer;
    private String prefix;
    private FprjToolApp app;
    private PrintStream original;
    
    public PrintStreamCapturer(String prefix, FprjToolApp app, PrintStream original) {
        this.prefix = prefix;
        buffer = new StringBuilder(128);
        buffer.append("[").append(prefix).append("] ");
        this.original = original;
        this.app = app;
    }
    
	@Override
	public void write(int b) throws IOException {
		char c = (char) b;
        String value = Character.toString(c);
        buffer.append(value);
        if (value.equals("\n")) {
        	app.appendLog(buffer.toString());
            buffer.delete(0, buffer.length());
            buffer.append("[").append(prefix).append("] ");
        }
        original.print(c);
	}

}
