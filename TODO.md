# To Do and Change log

[The Change log](#Changelog) is at the bottom)

## TODO

  - [ ] Convert to a mod
    - Ideally this would be installable as a mod
    - Additionally add some instructions on how to install the mod
      into classic DF (is it just copying it?)
  - [ ] Generate `palettes.png`
    - `palettes.png` is just a series of stripes of colors defined
      in the raws.  We should just generate this from the raws.
  - [ ] Documentation
    - Try to document the process of building a graphics set using this as a
      base.

## Changelog

## Checkerboards

  - [X] Make the tiles semi-transparent checkerboards
    - Thanks to Bumber for the suggestion!
    - The game is surprisingly playable just with this!!!

## Initial

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
