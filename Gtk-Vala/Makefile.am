# The actual runnable program is set to the SCRIPTS primitive.
# # Prefix bin_ tells where to copy this
bin_PROGRAMS = Colors
Colors_CFLAGS = $(gtk_CFLAGS)
Colors_LDADD = $(gtk_LIBS)
Colors_VALAFLAGS = --pkg gtk+-3.0
Colors_SOURCES = \
	Colors.vala \
	colorsPalette.vala \
	palette.vala

desktopdir = $(datadir)/applications
desktop_DATA = \
	Colors.desktop
