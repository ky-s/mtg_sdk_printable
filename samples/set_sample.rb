require 'mtg_sdk'
require_relative '../mtg_sdk_printable'
require 'pp'


using MTGSDKPrintable

sets = MTG::Set.all
puts sets.sort_by(&:release_date).map(&:to_s_jp)
