
def minimum_amount_added_to_cart?

  unless amount > 99
    errors.add(:base, Spree.t(:minimum_amount_of_hundred_euros)) and return false
  end

end

Spree::Order.state_machine.before_transition :from => :cart, :do => :minimum_amount_added_to_cart?
Spree::Order.state_machine.before_transition :to => :delivery, :do => :minimum_amount_added_to_cart?



