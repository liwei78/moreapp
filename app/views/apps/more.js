<% if @apps.blank? %>
$('#more_app_btn').hide();
<% else %>
$('<%= escape_javascript(render(:partial => "more_apps", :locals => {:apps => @apps, :div_id => @div_id})) %>').insertBefore('#more-apps-div')
$('#div_<%= @div_id %>').slideDown(3000);
$('#more_app_btn').attr('href', '<%= more_apps_path(:app_type => @app_type, :offset => @offset) %>');
<% if @apps.size < SITE_SETTINGS["each_show"] %>
$('#more_app_btn').hide();
<% end %>
<% end %>