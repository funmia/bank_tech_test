require 'printer'

describe Printer do
  let(:printer) { described_class.new }
  let(:credit) { double("Credit", amount: 10.0, date_created: "04/09/2017", current_balance: 10.0) }
  let(:debit) { double("Debit", amount: -5.0, date_created: "05/09/2017", current_balance: -5.0) }
  let(:transactions) { [credit, debit] }

  it "print a bank statement" do
    expect(printer.pretty_print(transactions)).to eq(" date       || credit || debit || balance \n 04/09/2017 || 10.0   || -     || 10.0 \n 05/09/2017 || -      || -5.0  || -5.0 \n")
  end
end
