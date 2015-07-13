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
  Assignment.revise(params["id"], params["description"], params["git_repo"])
    erb :"main/homepage"                   
end                                                      
                                                         
get "/resources/:option" do                              
  erb :"resource_form"                                   
end                                                      

# resource catigories
get "/rc/:option" do                                     
  erb :"rc_form"                                         
end


get "/rt_save" do
  ResourceCategory.add({"catigory" => params["catigory"]})
  erb :"rc_form"  
end

get "/rt_delete" do
  ResourceCategory.delete(params["id"])   
  erb :"rc_form" 
end

get  "/rt_edit" do  
  ResourceCategory.revise(params["id"], params["catigory"])
  erb :"rc_form" 
end

# end of resource catigories
                                                                      
get "/contributors/:option" do
  erb :"contributors_form"
end

get "/contributions/:option" do
  erb :"contributions_form"
end

get "/contributions_save" do
  binding.pry
  Contribution.add({"contributor_id" => params["contributor_id"], "assignment_id"=> params["assignment_id"]})
   erb :"contributions_form"
end

get "/contributions_delete" do
  Contribution.deletecont(params["contributor_id"],params["assignment_id"])              
  erb :"contributions_form"
end





