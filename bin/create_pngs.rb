# frozen_string_literal: true

INDENTATION = /^[ \t]+/.freeze

files = Dir.glob('invisible/**/tile_page_*')
lines = File.readlines(files.first)

pages = *(0..lines.size - 1).select { |i| lines[i].match('\[TILE_PAGE:') }
sizes = pages.map do |i|
  lines.drop(i + 1).find_index { |line| line.match(INDENTATION).nil? }
end
puts(pages.zip(sizes).map { |block| [lines[block.first], block.last] }.inspect)
