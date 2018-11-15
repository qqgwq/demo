class Account < ActiveRecord::Base
  def withdraw(amount)
    update(balance: balance - amount)
  end

  def desposit(amount)
    update(balance: balance + amount)
  end

  def transfer(recipient, amount)
    ActiveRecord::Base.transaction do
      withdraw(amount)
      recipient.desposit(amount)
    end
  end
end
