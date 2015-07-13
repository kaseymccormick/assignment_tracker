# ---------------------------------------------------------------------
# Menu
# ---------------------------------------------------------------------
get "/home" do
  erb :"main/homepage"
end                                                      
                                                         
get"/assignments/:option" do                            
  erb :"assignment_form"                                 
end                                                      
                                                         
get "/assignment_save" do                                
  Assignment.add({"description" => params["description"], "git_repo"=> params["git_repo"]})
  erb :"main/homepage"                                                                  
end 
                                                     
get "/assignment_delete" do                            
  Assignment.delete(params["id"])              
  erb :"main/homepage"                                    
end                                                      
                                                         
get "/assignment_edit" do         
  binding.pry                       
  Assignment.revise(params["id"], params["description"], params["git_repo"])
    erb :"main/homepage"                   
end                                                      
                                                         
get "/resources/:option" do                              
  erb :"resource_form"                                   
end                                                      
                                                         
                                                         
get "/rc/:option" do                                     
  erb :"rc_form"                                         
end


get "/rc_save" do
  #send params to database, insert new row
  erb
end

get "/rc_delete" do
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

get "/contributions_save" do
  binding.pry
  Contribution.add({"contributor_id" => params["contributor_id"], "assignment_id"=> params["asignment_id"]})
   erb :"contributions_form"
end

get "contributions_delete" do
  Contribution.delete(params["contributor_id"],params["assignment_id"])              
  
end





