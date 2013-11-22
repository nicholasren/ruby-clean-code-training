require 'builder'

builder = Builder::XmlMarkup.new
builder.person do |b|
    b.name("juntao")
    b.address("Greenland")
end

p builder.build
