
Deface::Override.new( :virtual_path => 'spree/checkout/_payment',
                      :name => 'translate payment method',
                      :replace => 'div#payment-method-fields',
                      :text => "<p>
                                  <label>
                                      <input checked='checked' id='order_payments_attributes__payment_method_id_2' name='order[payments_attributes][][payment_method_id]' value='2' type='radio'><%= t('ecocity_payment_method') %>
                                  </label>
                                </p>" )