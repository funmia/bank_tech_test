require_relative 'credit'

class BankAccount

INITIAL_BALANCE = 0.0

  attr_reader :transactions

  def initialize
    @balance = INITIAL_BALANCE
    @created_at = Time.now
    @transactions = []
  end

  def get_balance
    @balance
  end

  def date_created
    @created_at.strftime("Account was opened on %d/%m/%Y")
  end

  def make_deposit(amount)
    @balance += amount
    credit = Credit.new(amount)
    @transactions << {transaction: credit, balance: @balance}
  end
end
