get '/age/edit' do
  erb :"ages/add_age_range_form"
end

get '/age/save' do

  Age.add(params)

  @new_range = true  
  #update the database then send them to
  erb :"ages/add_age_range_form"
  #so it acts like just reloaded page
end

get "/age/delete" do

  Age.delete(params["id"])  
  #update the database then send them to
  erb :"ages/add_age_range_form"
  #so it acts like just reloaded page
end