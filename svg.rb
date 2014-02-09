require 'net/http'
require 'rexml/document'
require 'json'

xml_data = File.read("/Users/kristaps/Desktop/Untitled-2.svg")

doc = REXML::Document.new(xml_data)

lines = []

doc.elements['svg'].elements.each do |elem|
  # puts elem.attributes['x1']
  lines << [elem.attributes['x1'].to_f, elem.attributes['y1'].to_f, elem.attributes['x2'].to_f, elem.attributes['y2'].to_f]
end

puts lines.to_json

File.open('lines.txt', 'w') { |file| file.write(lines.to_json) }