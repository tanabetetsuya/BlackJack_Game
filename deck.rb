class Deck

  #Deck.newと同時にbuildメソッドが動き、52枚のカードを配列内に作成します
  def initialize
    @cards = []
    build
  end

  #山札作成
  def build
    for suit in ["♡", "♤", "♢", "♧"] do
      for number in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] do
        card = Card.new(suit, number)
        @cards << card
      end
    end
  end

  # 山札の上から一枚引く
  def draw_card
    # @cardsの配列から一番最後の要素を削除する。削除された要素はpopメソッドの戻り値として渡される。
    @cards.pop
  end