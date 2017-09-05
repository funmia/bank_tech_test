require 'credit'

describe Credit do
  let(:credit) { described_class.new(10.00) }

  it "creates a credit" do
    expect(credit).to be_kind_of(Credit)
  end

  it "has a date" do
    expect(credit.date_created).to be
  end

  it "has an amount" do
    expect(credit.amount).to equal(10.00)
  end
end
