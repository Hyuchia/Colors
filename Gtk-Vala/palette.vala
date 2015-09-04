public struct cPalette {
    public string name;
    public string[,] colors;

	public cPalette (string name, string[,] colors) {
		this.name = name;
		this.colors = colors;
	}
}
