class Expense
  attr_accessor :amount,:category,:date
  def initialize(amount,category,date)
    @amount=amount
    @category=category
    @date=date
  end
end