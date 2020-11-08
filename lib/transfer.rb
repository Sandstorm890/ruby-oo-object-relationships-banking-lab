require "pry"


class Transfer
  
  attr_accessor :transfer, :sender, :receiver, :status, :pending, :amount

  def initialize(sender, receiver, transfer)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    
    if @status == "complete"
      nil
    else
      if @sender.balance > @transfer && @sender.status == "open" && @receiver.status == "open"
        @sender.balance -= 50
        @receiver.balance  += 50
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
        
      end
    end
  end
      
  def reverse_transfer
    if @status == "complete"
      @sender.balance += 50
      @receiver.balance  -= 50
      @status = "reversed"
      # binding.pry
    else
      nil
    end
  
  end
  
end
