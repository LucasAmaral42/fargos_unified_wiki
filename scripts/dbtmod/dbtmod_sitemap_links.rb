# frozen_string_literal: true

require 'mechanize'
require 'nokogiri'

agent = Mechanize.new

url = 'https://dbtmod.fandom.com/sitemap-newsitemapxml-NS_0-id-19-1730.xml'

agent.get url

xml = Nokogiri::XML(agent.page.body)
locs = xml.search('loc').map(&:text).reject do |loc|
  loc.match(%r{wiki/V1\.|/dpl$|wiki/%E}i)
end

file = File.open('public/dbtmod_links.txt', 'a')
locs.each do |link|
  file.write("#{link}\n")
end
