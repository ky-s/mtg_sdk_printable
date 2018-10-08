require 'mtg_sdk'
require_relative '../mtg_sdk_printable.rb'
require 'pp'

PACKS = 36

using MTGSDKPrintable

PACKS.times do
  booster_cards = MTG::Set.generate_booster('dom')
  booster_cards.group_by(&:rarity).each do |rarity, cards|
    puts "#{rarity}, #{cards.map(&:jp_name)}"
  end
  sleep 1
end
