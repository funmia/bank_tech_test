class Printer

  def sort_by_date(transactions)
    sorted_transactions = transactions.sort_by { |transaction| transaction.date_created }.reverse
    sorted_transactions
  end

  def pretty_print(transactions)
    output = " date       || credit || debit || balance \n"
    sort_by_date(transactions).each do |transaction|
      if transaction.amount > 0
        template = " %{date} || %{amount}   || -     || %{balance} \n"
        output += template % { date: transaction.date_created, amount: transaction.amount, balance: transaction.current_balance }
      else
        template = " %{date} || -      || %{amount}  || %{balance} \n"
        output += template % { date: transaction.date_created, amount: transaction.amount, balance: transaction.current_balance }
      end
    end
    output
  end

end
