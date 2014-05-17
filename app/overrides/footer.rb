
# Remove Powered by Spree
#Deface::Override.new( :virtual_path => 'spree/shared/_footer',
#                      :name => 'remove_footer',
#                      :remove => '#footer[data-hook]' )

Deface::Override.new( :virtual_path => 'spree/shared/_footer',
                      :name => 'remove_footer',
                      :replace => 'p',
                      :text => "<%= t('power_by') %>" )