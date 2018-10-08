require 'mtg_sdk'
require_relative '../mtg_sdk_printable'
require 'pp'

using MTGSDKPrintable

cards = MTG::Card.where(set: 'grn').all
puts cards.map(&:to_s_jp)
