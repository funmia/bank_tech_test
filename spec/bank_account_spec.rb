require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }

  context "when creating a new account" do

    it "has an initial balance of zero" do
      expect(bank_account.get_balance).to equal(0.0)
    end

    it "has a date of creation" do
      expect(bank_account.date_created).to be
    end

    it "has no transactions" do
      expect(bank_account.transactions).to eq []
    end
  end

context "when making a deposit" do

  it "increases the balance by that amount" do
    expect{ bank_account.make_deposit(10.00)}.to change{bank_account.get_balance}.by(10.00)
  end
end
  it "creates a transaction" do
    expect{ bank_account.make_deposit(10.00)}.to change{bank_account.transactions.count}.by(1)
  end
end
