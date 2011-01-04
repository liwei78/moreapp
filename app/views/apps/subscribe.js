<% if @email.save %>
  $('#subscribe_error').hide();
  $('#subscribe_success').show();
<% else %>
  $('#subscribe_error').show();
  $('#subscribe_success').hide();
<% end %>