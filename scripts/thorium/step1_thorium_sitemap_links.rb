# frozen_string_literal: true

require 'mechanize'
require 'nokogiri'

agent = Mechanize.new

url = 'https://thoriummod.fandom.com/sitemap-newsitemapxml-NS_0-id-341-20733.xml'

agent.get url

xml = Nokogiri::XML(agent.page.body)
locs = xml.search('loc').map(&:text).reject do |loc|
  loc.match(%r{wiki/1\.|/dpl$}i)
end

file = File.open('public/jsonl/thorium_links.jsonl', 'a')
locs.each do |link|
  file.write("#{link}\n")
end
