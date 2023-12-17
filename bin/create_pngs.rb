# frozen_string_literal: true

# Code for parsing tile page files
class TilePage
  INDENTATION = /^[ \t]+/.freeze
  TILE_PAGE = /\[TILE_PAGE:(.+)\]/.freeze
  FILE = /\[FILE:(.+)\]/.freeze
  TILE_DIM = /\[TILE_DIM:(\d+):(\d+)\]/.freeze
  PAGE_DIM = /\[PAGE_DIM:(\d+):(\d+)\]/.freeze
  PAGE_DIM_PIXELS = /\[PAGE_DIM_PIXELS:(\d+):(\d+)\]/.freeze

  def self.filenames
    Dir.glob('invisible/**/tile_page_*')
  end

  def self.indeces(lines)
    (0..lines.size - 1).select { |i| lines[i].match(TILE_PAGE) }
  end

  def self.sizes(lines, indeces)
    indeces.map do |i|
      lines.drop(i + 1).find_index { |line| line.match(INDENTATION).nil? } || lines.size - i - 1
    end
  end

  def self.read_pages(filename)
    lines = File.readlines(filename)

    pages = indeces(lines)
    page_sizes = sizes(lines, pages)
    pages.zip(page_sizes).map { |pos| lines.slice(pos.first, pos.last + 1) }
  end

  def self.parse_file(filename)
    read_pages(filename).map { |lines| parse(lines) }
  end

  # Returns the result of applying an element to block if the result is truthy.
  # If there are no such elements, returns nil.
  def self.map_first(arr, &block)
    arr.each do |x|
      result = block.call(x)
      return result if result
    end
    nil
  end

  def self.name(lines)
    match = map_first(lines) { |line| line.match(TILE_PAGE) }
    match.captures[0] unless match.nil?
  end

  def self.file(lines)
    match = map_first(lines) { |line| line.match(FILE) }
    match.captures[0] unless match.nil?
  end

  def self.tile_dimensions(lines)
    match = map_first(lines) { |line| line.match(TILE_DIM) }
    [match.captures[0].to_i, match.captures[1].to_i] unless match.nil?
  end

  def self.page_dimensions(lines)
    match = map_first(lines) { |line| line.match(PAGE_DIM) }
    [match.captures[0].to_i, match.captures[1].to_i] unless match.nil?
  end

  def self.pixel_dimensions(lines)
    match = map_first(lines) { |line| line.match(PAGE_DIM_PIXELS) }
    [match.captures[0].to_i, match.captures[1].to_i] unless match.nil?
  end

  def self.parse(lines)
    {
      page: name(lines),
      file: file(lines),
      tile_dimensions: tile_dimensions(lines),
      page_dimensions: page_dimensions(lines),
      pixel_dimensions: pixel_dimensions(lines)
    }
  end
end

filename = TilePage.filenames.first
pages = TilePage.parse_file(filename)
pp pages
