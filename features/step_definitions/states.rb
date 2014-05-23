Then /^I should have (\d+) states available/ do | number |
  number_states = Spree::State.all.count
  assert_equal number.to_i, number_states
end

And /^they should be (\w+) and (\w+)/ do |state1, state2|
  states = Spree::State.all
  state1_found = false
  state2_found = false

  states.each do |state|
     if state.name == state1
       state1_found = true
     end

    if state.name == state2
      state2_found = true
    end

  end

  assert_equal true, state1_found
  assert_equal true, state2_found
end