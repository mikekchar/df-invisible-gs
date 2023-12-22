# To Do and Change log

[The Change log](#Changelog) is at the bottom)

## TODO

  - [ ] Documentation
    - Try to document the process of building a graphics set using this as a
      base.

## Changelog

### Palette
Generate `palettes.png`

`palettes.png` is just a series of stripes of colors defined in the raws.  We
should just generate this from the raws.

The image itself seems to be 2 gradients, 9 pixels wide, side by side.
There are 117 lines, one for each DF color described in the raws.
The [actual color values](bin/colors.txt) are
[defined on the Wiki](https://dwarffortresswiki.org/index.php/Color#Color_tokens)
and I'll copy those values.  I'm not sure where they originally came from.

Neither of the gradients actually include the color in them.  They seem
to simply be gradients around that value.  They go from nearly black
to nearly white.  The one on the right is more saturated than the one
on the left.

I'm not going to try to duplicate this palette exactly.  That would
be potentially going to far.  Also, I'm not sure this is really a
great palette anyway :-)  I'll come up with my own gradients around
the specified color values in the raws.

I just realised what this comment means:

`Right now 255 colors maximum can be supported across all palettes.`

That means that I need to index all of the colors *across* all rows
so that I'm only using 255 colors.  *That's* why none of the colors
match.

There are 116 PALETTE_COLOR in the list. So generate all of the colors. Sort by
absolute value (R+G+B). Create a "distance" metric between 2 colors (the RGB
value of the brighter one minus the darker one). Create a function that
generates a new color half way between 2 other colors (Averaging each of R G
and B). For the next 139 colors, find the largest distance between 2 colors and
add a new color there. This will generate the palette of 255 colors.

Next, for each PALETTE_COLOR, convert the RGB to HSV.  Make a gradient of 9
colors keeping the Hue and Saturation constant.  For the left side gradient, go
from a value of 10 to a value of 80.  For the right side gradient, go from a
value of 20 to a value of 90.  Then for each of these pick the best fit from
the total palette with the criteria of value, hue, saturation in that order
(maybe weighting 10, 5 1???)

Creating a PNG can be done in Ruby with the chunky-png gem.  I didn't
really want to have dependencies, but it is what it is, I guess.  More
documentation writing for me!  I don't want to do this with ImageMagick
because that's going to be really expensive computationally.

Potentially if I'm going to move to chunky-png, I could refactor the
rest of the code to avoid using ImageMagick.

### Mods
  - [X] Move relevant folders to `mods` directory
  - [X] Update all the `info.txt` files to have correct IDs and versions
  - [X] Discover that you can only have mods that are one level deep
    - This means that we can't have `invisible/invisible_building_graphics`.
      We can only have `invisible_building_graphics` and `invisible_creatures_graphics`,
      etc as separate mods.  That's a bit of a pain, but it's the way it is.
      It means that for a full graphics set, you have to install 8 mods.
      On the plus side, though, it means you can easily swap out to vanilla if you
      want (and classic seems to ship vanilla map tiles, possibly accidentally).
  - [X] Remove `invisible` folder.
  - [X] Update `bin/create_pngs.rb` to work on the `mods` folder instead of the
        `invisible` folder.
  - [X] Write some documentation on how to use the mods
  - [X] Fix tiles so that they are actually square.
    - For some reason, the Y values are twice as big as they should be.
  - Also remember to tag this release as 0.01 so that we start tracking versions.
    I'm not sure if we should allow versions to drift, but at the moment I think
    it's best to keep them all lock step even if only one of them changes.  I
    may change my mind later.

### Checkerboards

  - [X] Make the tiles semi-transparent checkerboards
    - Thanks to Bumber for the suggestion!
    - The game is surprisingly playable just with this!!!

### Initial

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
