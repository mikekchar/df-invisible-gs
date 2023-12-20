# Invisible Dwarf Fortress Graphics Set

This is development graphics set for classic Dwarf Fortress version 0.50. It
can not be used by players.  Its only purpose is to serve as a template for
future graphics set development.  The tiles it creates are semi-transparent
2x2 grids, 32 pixels on each side.  It makes a gray and magenta checkerboard
for each sprite. When you play the game, each sprite is that 2x2 checkerboard.
While it's not really playable, you can get a good idea of what you need to
do while you are developing a new graphics set

If you are a graphics set artist, you can use this project as a starting
point for a new graphics set.  I will do my best to reverse engineer
and document the file format and describe what you have to do for
each type of tile.

## Current Status

Suprisingly when used with classic, you can almost see what's going on.
The next step will be to try to convert this to a mod so that you simply
have to copy it to the mod directory.  Hopefully that will be easy to do.

Medium to Long term, I will probably try to investigate how feasible it
would be to write a script that converts a legacy graphics set, into
one that works tolerably well in 0.50.X.  I also have an idea to try
to make my own ASCII based graphics set.

## License

The original txt files were placed in the public domain (see readme.txt in the
invisible folder).  To the extent possible, I also put my work in this project
in the public domain.  I explicitly give permission to use any file in this
project for any purpose.

Alternatively, at your choice, you may use my modifications to this repository
under a CC0-1.0 licence (Creative Commons v1.0 Universal License).

## How Do I Use This?

TBD

## Unresolved questions

  - Should the top level directory be called `vanilla`?  How does this work?
  - Should I update the `ID` in the `info.txt` files?  Where are these
    referenced?
  - Can we set this up as a mod?

## TODO

See [To do and Change log file](TODO.md)

## Further project ideas

### Alternative ASCII graphics set.

The idea is to make PNGs containing the ASCII characters that would be
displayed in the ASCII version.  I'm not a fan of 0.50's ASCII display.  It's
too small for me to see when the menus are visible.  Also, I think there are
things that can be done to create an ASCII display that is nicer looking and
more interesting.

Potentially, I think the creation of the vast majority of the graphics set
could be scripted. Damnit, Jim!  I'm a programmer, not an artist!

### Convert a tileset to a graphics set

Once we have a script to make an ASCII graphics set, it should be relatively
easy to generate a graphics set using the glyphs in a tileset.  I'm not sure
how useful that would be, but it would be kind of cool.

### Convert a legacy graphics set to a 0.50.X graphics set.

This may actually be easier than doing an ASCII set.  I need to take a look at
how the legacy graphics sets are set up.  I suspect this will be unbelievably
popular so I should probably prioritise it.
