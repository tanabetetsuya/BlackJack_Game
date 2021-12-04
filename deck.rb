class Deck

  #Deck.newと同時にbuildメソッドが動き、52枚のカードを配列内に作成します
  def initialize
    @cards = []
    build
  end

  # 山札の上から一枚引く
  def draw_card
    # @cardsの配列から一番最後の要素を削除する。削除された要素はpopメソッドの戻り値として渡される。
    @cards.pop
  end