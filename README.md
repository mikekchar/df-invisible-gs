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

  - [X] Copy initial txt files from the base game.
    - I decided to copy them from the premium version rather than the classic version.
      However, apart from a few trivial differences they are exactly the same anyway
      (tested in version 0.50.11).
  - [X] Write a README.
  - [X] Copy the graphics txt files.  I didn't copy those folders originally.
  - [X] Update all the info.txt to reflect that this is the "invisible" graphics set.
    - I gave myself "credit" even for things I don't intend to modify, just to mark
      this as a modified setup in the event of a bug showing up for Bay12.
  - [X] Add a license file that Github will recognise.
    - Unfortunately, there is no public domain option for Github.  Most countries
      don't allow putting work directly into the public domain, so I have also
      allowed people to choose to use my changes under a CC0-1.0 license. It's
      the best I can do.  I wish there was a better upstream license.
  - [X] Write a script that parses the `tile_page_*` files and produces transparent PNGs.
    - They should be the correct dimensions. I hope I can actually figure it
      out from this.  I don't really want to base it on dimensions of the actual PNGs
      as technically that might be a derived work.
    - [X] Find a tool that can produce a transparent PNG of a given dimension.
      - [ImageMagick can do it](https://superuser.com/questions/294943/is-there-a-utility-to-create-blank-images)
      - `convert -size 32x32 xc:transparent empty2.png`
    - [X] Write something that parses the `tile_page_*` files
      - It's going to have to be Ruby if I want to finish in a reasonable time XD
      - Create blocks of text starting with `^\[TILE_PAGE:` and everything indented from there.
        - Grab `FILE:(.+)`
        - Grab `TILE_DIM:(\d+):(\d+)`
        - Grab `PAGE_DIM_PIXELS:(\d+):(\d+)`
        - Grab `PAGE_DIM:(\d+):(\d+)`
      - [X] Add a bin file
      - [X] Recursively find all the `tile_page_*` files
        - First time I've used Dir.glob.  Nice.
      - [X] Open the first one and print all of the `TILE_PAGE` lines
      - [X] Find the size of each `TILE_PAGE` block
        - Just count down until you get a non-indented block
        - I'm so glad that I don't care about computational complexity :-)
      - [X] Get a list of all the file names (as unix filenames)
      - [X] Find all the dimensions
        - return "32x128" where 32 is x and 128 is y
    - [X] Calculate the dimensions and names of the files
    - [X] Generate the PNGs
  - [X] Copy the vanilla_music/objects txt files back from classic
    - But it seems like it is classic and premium are identical.
  - [X] Create `vanilla_descriptors_graphics/images/palettes.png`
    - There are 117 entries of colors and the PNG seems to be 18 pixels wide
      (for reasons unknown).
  - [ ] Go through each folder documenting how to determine what needs to be drawn.

## Further project ideas

### Alternative ASCII graphics set.

The idea is to make PNGs containing the ASCII characters that would be displayed in the ASCII
version.  I'm not a fan of 0.50's ASCII display.  It's too small for me to see when the
menus are visible.  Also, I think there are things that can be done to create an ASCII display
that is nicer looking and more interesting.

Potentially, I think the creation of the vast majority of the graphics set could be scripted.
Damnit, Jim!  I'm a programmer, not an artist!
