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

    # ディーラーのターン
    while true do 
      if dealer.score_count < 17
        dealer.draw(deck, dealer)
      else
        break
      end
    end

  judge(player, dealer)

end

#勝敗判定
def judge(player, dealer)
  player_score = player.score_count
  dealer_score = dealer.score_count

  puts "-----あなたの得点-----"
  puts "#{player_score}"
  puts "-----ディーラーの得点-----"
  puts "#{dealer_score}"
  
  puts
  if dealer.score_count == player_score
    puts "引き分け"
  elsif player_score == 21
    puts "ブラックジャック！\nあなたの勝ちです!"
  elsif dealer_score == 21
    puts "ディーラーのブラックジャック!\nあなたの負けです..."
  elsif dealer_score > 21
    puts "ディーラーはバーストしました。"
    puts "あなたの勝ちです!"
  elsif dealer_score > player_score
    puts "あなたの負けです..."
  elsif dealer_score < player_score
    puts "あなたの勝ちです!"
  end
end

#バーストしたか
def burst?(player)
  if player.score_count <= 21
    return true
  else
    puts "あなたの得点: #{player.score_count}"
    puts "バーストしました。あなたの負けです。"
    return false
  end
end

#ブラックジャックしたか
def blackjack?(player)
  if player.score_count == 21
    return false
  else
    return true
  end 
end

puts "--------------------------"
puts "ブラックジャックへようこそ！"
puts "--------------------------"
puts run_game


