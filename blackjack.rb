require './card'
require './deck'
require './player'

#ゲームの進行
def run_game

  #初期手札2枚の準備、手札公開、得点表示
  deck = Deck.new
  deck.shuffle
  player = Player.new
  player.first_draw(deck)
  player.score_count
  dealer = Dealer.new
  dealer.first_draw(deck)
  dealer.score_count
# プレイヤーのターン
while true do

  puts "さらにカードを引きますか？[Y/N]"
  puts "あなたの得点: #{player.score_count}"
  answer = gets.chomp.to_s
  puts "Answer: #{answer}"
  if answer == "Y" || answer == "y"
    player.draw(deck, player)
    unless burst?(player)
      exit
    end
    unless blackjack?(player)
      break
    end
  elsif answer == "N" || answer == "n"
    break
  else
    puts "無効な値です。もう一度入力してください"
  end
end

