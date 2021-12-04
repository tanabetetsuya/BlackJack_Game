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

  #得点計算
  def　score_count
    score = 0
    @hands.each do |hand|
      score += hand.to_i
    end
    return score
  end

  #最初のドローおよび手札公開
  def first_draw(deck)
    2.times do
      card = deck.draw_card
      @hands.push(card)
    end

    puts "------あなたの手札-------"
    @hands.each_with_index do |hand, i|
      puts "#{i}枚目: #{hand.show}"
    end
    puts "-----------------------"
  end
end

class Dealer

  def initialize
    @dealer_hands = []
  end

  def draw(deck, player)
    card = deck.draw_card
    @dealer_hands.push(card)
    puts "ディーラーはカードを引きました"
  end

  def score_count
    score = 0
    @dealer.each do |hand|
      score += hand.to_i
    end
    return score
  end
  
  def first_draw(deck)
    2.times do 
      card = deck.draw_card
      @dealer_hands.push(card)
    end

    puts "-------ディーラーの手札--------"
    puts "１枚目: #{@dealer_hands.first.show}"
    puts "2枚目: 伏せられている"
    puts "----------------------------"
  end
end
