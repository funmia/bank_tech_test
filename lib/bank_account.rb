class BankAccount

INITIAL_BALANCE = 0.0

  def initialize
    @balance = INITIAL_BALANCE
    @created_at = Time.now
  end

  def get_balance
    @balance
  end

  def date_created
    @created_at.strftime("Account was opened on %d/%m/%Y")
  end

end
