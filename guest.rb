class Guest

  attr_reader :name, :funds

  def initialize(name, funds)
    @name = name
    @funds = funds
  end

  def pays_tab(amount)
    @funds -= amount
  end

end
