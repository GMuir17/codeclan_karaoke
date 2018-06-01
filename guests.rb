class Guest


  attr_reader(:name, :wallet)

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def remove_money(money)
    @wallet -= money
  end


end
