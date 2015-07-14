# ---------------------------------------------------------------------
# Menu
# ---------------------------------------------------------------------
get "/home" do
  erb :"main/homepage"
end      
get "view/all"     do
  erb :"allthings"
end
                                           
#start assignment                                                         
get"/assignments/:option" do                            
  erb :"assignment_form"                                 
end                                                      
                                                         
get "/assignment_save" do      
  Assignment.add({"description" => params["description"], "git_repo"=> params["git_repo"]})
  erb :"assignment_form" 
end 
                                                     
get "/assignment_delete" do                            
  Assignment.delete(params["id"])              
  erb :"assignment_form" 
end                                                      
                                                         
get "/assignment_edit" do         
  Assignment.revise(params["id"], params["description"], params["git_repo"])
  erb :"assignment_form" 
end             
#end assignment
                                         
#start resource                                                         
get "/resources/:option" do                              
  erb :"resource_form"                                   
end                                                      

get "/resource_save" do
  Resource.add({"rd_id" => params["rd_id"], "assignment_id"=> params["assignment_id"]})
  erb :"resource_form" 
end

get "/resource_delete" do
  Resource.delete(params["id"])              
    erb :"resource_form" 
end

get "/resource_edit" do
  Resource.revise(params["id"], params["rd_id"], params["assignment_id"])
  erb :"resource_form" 
end
#end resource

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

get "/contributor_save" do
  binding.pry
  Contributor.add({"name" => params["name"]})
  erb :"contributors_form"
end

get "/contributor_delete" do
  Contributor.delete(params["id"])   
  erb :"contributors_form"
end

get  "/contributor_edit" do  
  Contributor.revise(params["id"], params["name"])
  erb :"contributors_form"
end
   
#start of contributors                                                                      

get "/contributions/:option" do
  erb :"contributions_form"
end


get "/contributions_save" do
  Contribution.add({"contributor_id" => params["contributor_id"], "assignment_id"=> params["assignment_id"]})
   erb :"contributions_form"
end

get "/contributions_delete" do
  Contribution.deletecont(params["contributor_id"],params["assignment_id"])              
  erb :"contributions_form"
end
#end of contributors





