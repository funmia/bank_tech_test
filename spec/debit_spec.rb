require 'debit'

describe Debit do
  let(:amount) { 5.00 }
  let(:current_balance) { 5.00 }
  let(:debit) { described_class.new(amount, current_balance) }

  it "creates a debit" do
    expect(debit).to be_kind_of(Debit)
  end

  it "has a date" do
    expect(debit.date_created).to be
  end

  it "has an amount" do
    expect(debit.amount).to equal(-5.00)
  end

  it "has the current balance" do
    expect(debit.current_balance).to equal(current_balance)
  end
end
