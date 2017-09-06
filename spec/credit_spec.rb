require 'credit'

describe Credit do
  let(:amount) { 10.00 }
  let(:current_balance) { 15.00 }
  let(:credit) { described_class.new(amount, current_balance) }

  it "creates a credit" do
    expect(credit).to be_kind_of(Credit)
  end

  it "has a date" do
    expect(credit.date_created).to be
  end

  it "has an amount" do
    expect(credit.amount).to equal(amount)
  end

  it "has the current balance" do
    expect(credit.current_balance).to equal(current_balance)
  end
end
