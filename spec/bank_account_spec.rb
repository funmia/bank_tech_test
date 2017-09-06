require 'bank_account'

describe BankAccount do
  let(:printer) { double("Printer") }
  let(:credit_class) { double(:credit_class) }
  let(:debit_class) { double(:debit_class ) }
  let(:bank_account) { described_class.new(printer, credit_class, debit_class) }
  let(:credit) { double("Credit", amount: 10.0, date_created: "04/09/2017") }
  let(:debit) { double("Debit", amount: -5.0, date_created: "05/09/2017") }
  let(:credit_amount) { 15.00 }
  let(:debit_amount) { 10.00 }

  context "when creating a new account" do
    it "has an initial balance of zero" do
      expect(bank_account.account_balance).to equal(0.0)
    end

    it "has no transactions" do
      expect(bank_account.transactions).to eq []
    end
  end

  describe "make_deposit" do
    let(:current_balance) { 15.00 }

    context "when making a deposit" do
      before do
        allow(credit_class).to receive(:new).with(credit_amount, current_balance) { credit }
      end

      it "increases the balance by that amount" do
        expect { bank_account.make_deposit(credit_amount) }.to change { bank_account.account_balance }.by(15.00)
      end

      it "creates a transaction" do
        expect { bank_account.make_deposit(credit_amount) }.to change { bank_account.transactions.count }.by(1)
      end

      it "includes the credit transaction" do
        bank_account.make_deposit(credit_amount)
        expect(bank_account.transactions).to include( credit )
      end
    end
  end

  describe "make_withdrawal" do
    let(:increased_balance) { 15.00 }
    let(:current_balance) { 5.00 }

    context "when making a withdrawal" do
      before do
        allow(credit_class).to receive(:new).with(credit_amount, increased_balance)
        bank_account.make_deposit(credit_amount)
        allow(debit_class).to receive(:new).with(debit_amount, current_balance) { debit }
      end

      it "decreases the balance by that amount" do
        expect { bank_account.make_withdrawal(debit_amount) }.to change { bank_account.account_balance }.by(-10.00)
      end

      it "includes the debit transaction" do
        bank_account.make_withdrawal(debit_amount)
        expect(bank_account.transactions).to include( debit )
      end
    end
  end

  describe "sort_by_date" do
    it "sorts the transactions by date" do
      unsorted_transactions = [credit, debit]
      sorted_transactions = [debit, credit]
      expect(bank_account.sort_by_date(unsorted_transactions)).to eq(sorted_transactions)
    end
  end

  describe "print_statement" do
    it "prints a nicely formatted bank statement" do
      expect(printer).to receive(:pretty_print)
      bank_account.print_statement
    end
  end
end
