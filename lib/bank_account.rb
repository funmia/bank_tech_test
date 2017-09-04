require_relative 'credit'
require_relative 'debit'

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

  def make_withdrawal(amount)
    @balance -= amount
    debit = Debit.new(amount)
    @transactions << {transaction: debit, balance: @balance}
  end
end
