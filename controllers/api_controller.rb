
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


get "/api/all_partners" do
  contributors = Contributor.all
  all_contributors = contributors.make_hash
  
  json all_contributors
end

#Not working and not sure why
get "/api/partner_assign" do
  search_partner = Partner.find_rows("partner", params["id"]) 
  assign_id = search_partner["assignment_id".to_i]
  find_assign = Assignment.find_rows_hash("id", assign_id)
  
  json find_assign
end


get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"]}

  json hash
end

#Getting errors for changing link and partner
get "/api/change_link" do
  @entry = Link.find_rows("assignment_id", params["id"])
  @entry.article_or_video =  params["article_or_video"]
  @entry.save

  json @entry
end

get "/api/change_partner" do
  @entry = Partner.find_rows("assignment_id", params["id"])
  @entry.partner = params["partner"]
  @entry.save
  
  json @entry
end


#Delete routes return objects not json, but do work
get "/api/delete_assign" do
  a = Assignment.find(params["id"].to_i) 
  a.delete
  
  json a
end

get "/api/delete_link" do
  l = Link.find(params["id"].to_i)
  l.delete
  
  json l
end

get "/api/delete_partner" do
  p = Partner.find(params["id"].to_i)
  p.delete
  
  json p
end

