class Printer

  def pretty_print(transactions)
    output = " date       || credit || debit || balance \n"
    transactions.each do |transaction|
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
