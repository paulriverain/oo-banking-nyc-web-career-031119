require_relative './bank_account.rb'
class Transfer
  # your code here
attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
   if sender.valid? == true && receiver.valid? == true
     true
   else
    false
   end
  end
  def execute_transaction
    if sender.valid? == true && @status =="pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
    if sender.valid? == false
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
     @status = "reversed"
   end
  end
end
