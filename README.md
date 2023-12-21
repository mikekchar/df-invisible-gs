# Invisible Dwarf Fortress Graphics Set

This is a development graphics set for classic Dwarf Fortress version 0.50. It
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

The data is now in a mod format (there are actually 8 mods).  I've left
some instructions on installing below.  Because classic has some base
tiles built into the game, the game is surprisingly playable simply with
these placeholders.  I think this is now good to go for a first build.
As such, I'm releasing version 0.01.

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

There are 8 mods:
  - invisible_building_graphics
  - invisible_creatures_graphics
  - invisible_descriptors_graphics
  - invisible_environment
  - invisible_interface
  - invisible_items_graphics
  - invisible_plants_graphics
  - invisible_world_map

These are located in the `mods` directory.  Each of these add the graphics
entries for the corresponding vanilla version.  Dwarf Fortress doesn't allow
a deep directory structure in mods, so I've opted to keep these all as separate
mods.  It will allow the player to select which of these they want to use,
which will allow them to mix and match with vanilla if they want.

To install, simply copy each of the folders into the `mods` directory at the top
level of your dwarf fortress installation.  If the `mods` directory doesn't exist,
you can simply create it.  Note that once you use create a world using a mod in the
game, it will *copy* the mod in the `data/installed_mods` directory.  If you update
the mod in the `mods` directory, you must also update it in the `data/installed_mods`
directory.

[Details on modding](https://bay12games.com/dwarves/modding_guide.html) are on
the Bay12 website. There is also a
[modding mega thread](http://www.bay12forums.com/smf/index.php?topic=180662.0)
on the Bay12 forums.

When using the mods, make sure to press the "Mods" button on the world creation
page so that the mods you want to use are actually used.

In terms of creating sprites, each sprite is a 32x32 block.  When you load up
the a png into a graphics editor you will see a grid of gray and magenta blocks.
Each of these blocks is 16x16 and so a full sprite will take up a 4 block square.
It's simply a matter of determining what you have to draw, and drawing it in
that square.

At some point in the future, I'll try to describe out to figure out what you
need to draw.

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

Note to self: [Phoebus Github Link](https://github.com/DFgraphics/Phoebus/tree/master)
This is a 16x16 pixel set, so it needs to be scaled.  Then all of the graphics
need to be copied to a different tile sheet.  Figuring out the mapping
might be slightly challenging, but maybe not that bad...

I've created an [issue](https://github.com/DFgraphics/Phoebus/issues/23) to see
if I can get the licensing a bit more clear.
