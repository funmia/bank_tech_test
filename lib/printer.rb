class Printer

  def pretty_print(transactions)
    output = " date       || credit || debit || balance \n"
    transactions.each do |transaction|
      if transaction[:transaction].instance_of?(Credit)
        template = " %{date} || %{amount}   || -     || %{balance} \n"
        output += template % { date: transaction[:transaction].date_created, amount: transaction[:transaction].amount, balance: transaction[:balance] }
      else
        template = " %{date} || -      || %{amount}  || %{balance} \n"
        output += template % { date: transaction[:transaction].date_created, amount: transaction[:transaction].amount, balance: transaction[:balance] }
      end
    end
    output
  end
end
