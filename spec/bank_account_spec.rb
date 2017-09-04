require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }

  context "when creating a new account" do

    it "has an initial balance of zero" do
      expect(bank_account.get_balance).to equal(0)
    end
  end 
end
