class Credit
  attr_reader :amount, :current_balance

  def initialize(amount, current_balance)
    @amount = amount
    @current_balance = current_balance
    @created_at = Time.now
  end

  def date_created
    @created_at.strftime("%d/%m/%Y")
  end
end
