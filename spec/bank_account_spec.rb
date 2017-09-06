require 'bank_account'

describe BankAccount do
  let(:printer) { double("Printer") }
  let(:credit_class) { double(:credit_class) }
  let(:debit_class) { double(:debit_class ) }
  let(:bank_account) { described_class.new(printer, credit_class, debit_class) }
  let(:credit) { double("Credit", amount: 10.0, date_created: "04/09/2017") }
  let(:debit) { double("Debit", amount: -5.0, date_created: "05/09/2017") }

  context "when creating a new account" do

    it "has an initial balance of zero" do
      expect(bank_account.account_balance).to equal(0.0)
    end

    it "has no transactions" do
      expect(bank_account.transactions).to eq []
    end
  end

  context "when making a deposit" do
    before do
      allow(credit_class).to receive(:new).with(10.00)
    end

    it "increases the balance by that amount" do
      expect { bank_account.make_deposit(10.00) }.to change { bank_account.account_balance }.by(10.00)
    end

    it "creates a transaction" do
      expect { bank_account.make_deposit(10.00) }.to change { bank_account.transactions.count }.by(1)
    end
  end

  context "when making a withdrawal" do
    before do
      allow(credit_class).to receive(:new).with(15.00)
      bank_account.make_deposit(15.00)
      allow(debit_class).to receive(:new).with(10.00)
    end

    it "decreases the balance by that amount" do
      expect { bank_account.make_withdrawal(10.00) }.to change { bank_account.account_balance }.by(-10.00)
    end

    it "has a new balance" do
      bank_account.make_withdrawal(10.00)
      expect(bank_account.account_balance).to equal(5.00)
    end
  end

  describe "sort_by_date" do
    it "sorts the transactions by date" do
      transactions = [{ transaction: credit, balance: 10.0 }, { transaction: debit, balance: 5.0 }]
      expect(bank_account.sort_by_date(transactions)).to eq([{ transaction: debit, balance: 5.0 }, { transaction: credit, balance: 10.0 }])
    end
  end

  describe "print_statement" do
    it "prints a nicely formatted bank statement" do
      expect(printer).to receive(:pretty_print)
      bank_account.print_statement
    end
  end
end
