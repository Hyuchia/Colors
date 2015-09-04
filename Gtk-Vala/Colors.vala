public class Application : Gtk.Window {

	Gtk.Clipboard clipboard;
	bool hexadecimal = true;

	public Application () {

		// Prepare Gtk.Window:
		this.title = "Colors";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(800, 600);


		try{
			Gtk.Window.set_default_icon_from_file("colors.svg");
		}catch(Error e){
			stdout.printf("Unable to load icon");
		}

		Gtk.HeaderBar header = new Gtk.HeaderBar();
		header.set_title("Colors");
		header.set_subtitle("The last color palette you'll ever need");

		header.show_close_button = true;

		Gtk.RadioButton hexr = new Gtk.RadioButton (null);
		hexr.set_label ("Hex");

		Gtk.RadioButton rgbr = new Gtk.RadioButton.with_label_from_widget (hexr, "RGB");

		hexr.toggled.connect(hexToggled);

		header.add(hexr);
		header.add(rgbr);

		this.set_titlebar(header);

		// The Notebook:
		Gtk.Notebook notebook = new Gtk.Notebook ();
		this.add(notebook);

		clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD);
		ColorsPalette colours = new ColorsPalette();

		cPalette[] colourss = colours.getPalettes();

		foreach(cPalette c in colourss){
			Gtk.Label title = new Gtk.Label(c.name);
			Gtk.ScrolledWindow content= new Gtk.ScrolledWindow(null, null);
			content.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
			Gtk.FlowBox content2 = new Gtk.FlowBox();
			content2.set_selection_mode(Gtk.SelectionMode.NONE);
			content2.set_max_children_per_line(30);
			content2.set_valign(Gtk.Align.START);



			int i = 0;

			while(c.colors[i,0] != null){
				Gdk.RGBA color = Gdk.RGBA();
				color.parse(c.colors[i, 0]);

				Gtk.DrawingArea area = new Gtk.DrawingArea();
				area.set_size_request(40, 40);

				area.draw.connect ((context) => {
					// Get necessary data:
					int height = area.get_allocated_height ();
					int width = area.get_allocated_width ();

					context.rectangle(0, 0, width, height);
					Gdk.cairo_set_source_rgba (context, color);
					context.fill ();
					return true;
				});

				Gtk.Button button = new Gtk.Button();
				button.set_tooltip_text(c.colors[i, 0] + " - " + c.colors[i, 1]);
				button.add(area);
				string hex = c.colors[i, 0];
				string rgb = c.colors[i, 1];
				button.clicked.connect(() => { this.copy(hex, rgb); });
				content2.add(button);
				i++;
			}

			content.add(content2);
			notebook.append_page(content, title);
		}

	}

	void copy(string hex, string rgb){
		if(this.hexadecimal){
			clipboard.set_text(hex, -1);
			stdout.printf(hex);
		}else{
			clipboard.set_text(rgb, -1);
			stdout.printf(rgb);
		}

	}

	void hexToggled(){
		this.hexadecimal = this.hexadecimal ? false : true;
	}

	public static void main (string[] args) {
		Gtk.init (ref args);

		Application app = new Application ();
		app.show_all ();
		Gtk.main ();
	}
}
