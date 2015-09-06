import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Colors {

	//Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
	public static boolean hexadecimal = true;

	public void hexToggled(){
		this.hexadecimal = this.hexadecimal ? false : true;
	}

	public static void main (String[] args) {
		JFrame frame = new JFrame("Colors");

		frame.setSize(800, 600);

		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JTabbedPane tabs = new JTabbedPane();

		frame.add(tabs);

		ColorsPalette colours = new ColorsPalette();

		cPalette[] colourss = colours.getPalettes();

		for(cPalette c : colourss){
			JPanel parent = new JPanel();
			JPanel panel = new JPanel();
			panel.setLayout(new FlowLayout());


			for(int i = 0; i < c.colors.length; i++){
				JButton button = new JButton();
				button.setBackground(Color.decode(c.colors[i][0]));
				button.setPreferredSize(new Dimension(50, 50));
				button.setToolTipText(c.colors[i][0]+ " - " + c.colors[i][1]);
				button.addActionListener(new Listener(c.colors[i][0], c.colors[i][1]));
				panel.add(button);
			}

			JScrollPane scroll = new JScrollPane(panel,JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
            JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
            parent.add(scroll);
			tabs.addTab(c.name, panel);
		}
		frame.setVisible(true);

	}
}
