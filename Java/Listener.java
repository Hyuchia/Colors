import java.awt.event.*;
import java.awt.datatransfer.*;
import java.awt.Toolkit;

public class Listener implements ActionListener {

    private String hex;
    private String rgb;
	private Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();

    public Listener(String hex, String rgb) {
        this.hex = hex;
        this.rgb = rgb;
    }

    public void actionPerformed(ActionEvent e) {
        System.out.println(this.hex);
        if(Colors.hexadecimal){
        	this.clipboard.setContents(new StringSelection(this.hex), null);
        }else{
        	this.clipboard.setContents(new StringSelection(this.rgb), null);
        }

    }
}
