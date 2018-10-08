require 'mtg_sdk'

module MTGSDKPrintable
  refine MTG::Card do
    def jp_name
      foreign_names.detect { |f| f.language == "Japanese" }.name
    end

    def to_s_jp
      text = <<~EOS
      #{@name} / #{jp_name} #{@mana_cost} #{@rarity}
      #{@type}
      #{@original_text}
      EOS
      text += "#{@power}/#{@toughness}\n" if @types.include?('Creature')
      text += @loyalty.to_s + "\n" if @types.include?('Planeswalker')
      text + "\n"
    end
  end

  refine MTG::Set do
    def to_s_jp
      "#{@code} : #{@name} - #{@release_date}"
    end

    def <=>(other)
      @release_date <=> other.release_date
    end
  end
end
