# ---------------------------------------------------------------------
# Menu
# ---------------------------------------------------------------------
get "/home" do
  erb :"main/homepage"
end

get "/admin_choices" do
  erb :"main/admin"
end

get"/assignments/:option" do
  erb :"assignment_form"
end

get "/assignment/save" do
  #send params to database, insert new row
  #move to next step?
end

get "/resources/:option" do
  erb :"resource_form"
end


get "/rt/:option" do
  erb :"rt_form"
end


get "/rt_save" do
  #send params to database, insert new row
  erb
end

get "/rt_delete" do
  params["id"]
  #delete row where id 
  erb
end

get "/contributors/:option" do
  erb :"contributors_form"
end

get "/contributions/:option" do
  erb :"contributions_form"
end




