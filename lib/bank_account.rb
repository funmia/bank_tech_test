require_relative 'credit'
require_relative 'debit'
require_relative 'printer'

class BankAccount
  INITIAL_BALANCE = 0.0

  attr_reader :account_balance, :transactions, :credit_class, :debit_class

  def initialize(printer = Printer.new, credit_class = Credit, debit_class = Debit)
    @printer = printer
    @credit_class = credit_class
    @debit_class = debit_class
    @account_balance = INITIAL_BALANCE
    @created_at = Time.now
    @transactions = []
  end

  def make_deposit(amount)
    @account_balance += amount
    credit = credit_class.new(amount, account_balance)
    transactions << credit
  end

  def make_withdrawal(amount)
    @account_balance -= amount
    debit = debit_class.new(amount, account_balance)
    transactions << debit
  end

  def print_statement
    puts @printer.pretty_print(transactions)
  end
end
