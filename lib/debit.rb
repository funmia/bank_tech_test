class Debit
  attr_reader :amount

  def initialize(amount)
    @amount = amount
    @created_at = Time.now
  end

  def date_created
    @created_at.strftime("%d/%m/%Y")
  end
end
