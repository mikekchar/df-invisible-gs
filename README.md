# Invisible Dwarf Fortress Graphics Set

This is development graphics set for classic Dwarf Fortress version 0.50. It
can not be used by players.  Its only purpose is to serve as a template for
future graphics set development.  All of the PNG files are completely
transparent. The intent is that the game will not crash, but that you won't be
able to see anything.

If you are a graphics set artist, you can use this project as a starting
point for a new graphics set.  I will do my best to reverse engineer
and document the file format and describe what you have to do for
each type of tile.

## Current Status

It seems to work (at least I could make a world and try to embark in it).
Next step is to start documenting what needs to go into all of the images.

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
