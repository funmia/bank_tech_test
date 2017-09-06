require_relative 'credit'
require_relative 'debit'
require_relative 'printer'

class BankAccount
  INITIAL_BALANCE = 0.0

  attr_reader :transactions, :credit_class, :debit_class

  def initialize(printer = Printer.new, credit_class = Credit, debit_class = Debit)
    @printer = printer
    @credit_class = credit_class
    @debit_class = debit_class
    @balance = INITIAL_BALANCE
    @created_at = Time.now
    @transactions = []
  end

  def account_balance
    @balance
  end

  def make_deposit(amount)
    @balance += amount
    credit = credit_class.new(amount)
    @transactions << { transaction: credit, balance: @balance }
  end

  def make_withdrawal(amount)
    @balance -= amount
    debit = debit_class.new(amount)
    @transactions << { transaction: debit, balance: @balance }
  end

  def sort_by_date(transactions)
    sorted_transactions = transactions.sort_by { |transaction| transaction[:transaction].date_created }.reverse
    sorted_transactions
  end

  def print_statement
    puts @printer.pretty_print(sort_by_date(transactions))
  end
end
