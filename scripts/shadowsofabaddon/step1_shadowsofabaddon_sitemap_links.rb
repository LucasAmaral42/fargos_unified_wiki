# frozen_string_literal: true

require 'mechanize'
require 'nokogiri'

agent = Mechanize.new

url = 'https://shadowsofabaddon.fandom.com/sitemap-newsitemapxml-NS_0-id-580-6230.xml'

agent.get url

xml = Nokogiri::XML(agent.page.body)
locs = xml.search('loc').map(&:text).reject do |loc|
  loc.match(%r{wiki/1\.|/dpl$}i)
end

file = File.open('public/jsonl/shadows_of_abaddon_links.jsonl', 'a')
locs.each do |link|
  file.write("#{link}\n")
end
