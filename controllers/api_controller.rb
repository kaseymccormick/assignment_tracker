
get '/json/api' do
  json :foo => 'bar'
end

get "/api/assignments" do
  assign_list = Assignment.all

  @assign_array = []

  assign_list.each do |assign|
    @assign_array << assign.make_hash
  end

  json @assign_array

end

get "/api/assignments/:id" do
  # find all the resources with assignment_id
  resource = Resource.all_from_assignment(params["id"])

  # find all contributions with assignment id
  contrib = Contribution.all_from_contributions(params["id"])
  
  # find row in assignment table of id
  assign_data = Assignment.find(params["id"])
  resource_data = []
  contrib_data = []
  
  resource.each do |r|
    object = Resource.new(r)
    resource_data << object
  end
  
  contrib.each do |c|
    object = Contribution.new(c)
    contrib_data << object
  end
  
  @data_array = [] 
  @data_array << assign_data.make_hash
  
  resource_data.each do |data|
    @data_array << data.make_hash
  end

  contrib_data.each do |data|
    @data_array << data.make_hash
  end
    
  json @data_array
end


get "/api/resources" do
  resource_list = Resource.all
  
  @resource_array = []
  
  resource_list.each do |rec|
    @resource_array << rec.make_hash
  end
  
  json @resource_array
end

# find all assignments that contributor id has contributed to
get "/api/all_contributions/:id" do
    contrib = Contribution.assignments_with_contributor(params["id"])
  
    contrib_data = []

  
    contrib.each do |c|
      object = Contribution.new(c)
      contrib_data << object
    end
  
    @data_array = [] 

    contrib_data.each do |data|
      @data_array << data.make_hash
    end
    
    json @data_array
  end
  
get "/api/add_assign/:description/:git_repo" do
  @new_entry = Assignment.add({ "description" => params["description"], "git_repo" => params["git_repo"]})
  
  hash = {"description" => params["description"], "git_repo" => params["git_repo"]}

  json hash
end

#add resource type of an assignment 
get "/api/add_resource/:assignment_id/:rd_id" do
  #in resources table find
  entry = Resource.add({ "assignment_id" => params["assignment_id"], "rd_id" => params["rd_id"]} )
  @entry = entry.make_hash
  json @entry
end

#Add a contributor to an existing assignment
get "/api/add_contributor/:assignment_id/:contributor_id" do
  entry = Contribution.add({"assignment_id" => params["assignment_id"], "contributor_id" => params["contributor_id"]})
  @entry = entry.make_hash

  json @entry
end


# --------------------DELETIONS BELOW< bewARE

#deletes assignment returns assignments left... not sure what to return
get "/api/delete_assign/:id" do
  @delete_assignment = Assignment.find(params["id"].to_i) 
  
  Assignment.delete(params["id"].to_i) 
  
@deleted_a = @delete_assignment.make_hash

  json @deleted_a
end
CONNECTION.execute("CREATE TABLE IF NOT EXISTS resources (id INTEGER PRIMARY KEY, rd_id INTEGER, assignment_id INTEGER);")

# works but returns empty array :(
get "/api/delete_resource/:rd_id/:assignment_id" do
  @delete_resource = Resource.findcont(params["rd_id"], params["assignment_id"])

  Resource.self.deletecont(params["rd_id"], params["assignment_id"])

  @deleted_r = @delete_resource.make_hash
  
  json @deleted_r
end


# --------------------BOTH DELTE BOTH DONT RETURN THE THING NEEDED 
# get "/api/delete_contribution/:contributor_id/:assignment_id" do
#
#   @delete_contribution = Contribution.findcont(params["contributor_id"], params["assignment_id"])
#
#   Contribution.deletecont(params["contributor_id"].to_i, params["assignment_id"])
#
#   @deleted_contribution = @delete_contribution.make_hash
#
#       json @deleted_contribution
#
# end

# --------------------BOTH DELTE BOTH DONT RETURN THE THING NEEDED 

get "/api/delete_contribution/:contributor_id/:assignment_id" do
  delete_contribution = Contribution.findcont(params["contributor_id"], params["assignment_id"]) 

  Contribution.deletecont(params["contributor_id"].to_i, params["assignment_id"]) 

  
  @contribution_array = []
  binding.pry
  delete_contribution.each do |cont|
    @contribution_array << cont.make_hash
  end
  
  json @contribution_array
end


