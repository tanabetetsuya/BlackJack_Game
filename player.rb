#プレイヤークラス
class Player

  def initialize
    @hand = []
  end

  #　一枚引く
  def draw(deck, player)
    card = deck.draw_card
    @hands.push(card)
    puts "あなたが引いたカードは#{card.show}です"
    puts "-----あなたの手札-----"
    @hands.each_with_index do |hand, i|
      puts "[ #{hand.show} ]"
    end
    puts "--------------------"
  end