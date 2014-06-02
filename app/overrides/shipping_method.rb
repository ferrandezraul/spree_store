
Deface::Override.new( :virtual_path => 'spree/checkout/_delivery',
                      :name => 'translate shipping method',
                      :replace => 'span.rate-name',
                      :text => "<%= t('ecocity_shipping_method') %>" )
