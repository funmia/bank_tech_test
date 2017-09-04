require 'debit'

describe Debit do
  let(:debit) { described_class.new(-10.00) }

  it "creates a debit" do
    expect(debit).to be_kind_of(Debit)
  end

  it "has a date and amount" do
    expect(debit.date_created).to be
    expect(debit.amount).to equal(-10.00)
  end
end
