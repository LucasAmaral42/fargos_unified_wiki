# frozen_string_literal: true

require 'json'
require 'byebug'

MODS = %w[calamity dragon_ball_terraria shadows_of_abaddon thorium].freeze
types = []

MODS.each do |mod|
  File.readlines("public/jsonl/#{mod}_info.jsonl").each do |line|
    next if line.empty?

    json = JSON.parse(line)

    types << json['types'].map(&:strip)
    types.flatten!.uniq!
  end
end

puts types.count
print types
