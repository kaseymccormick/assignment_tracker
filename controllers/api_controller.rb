
get '/json/api' do
  json :foo => 'bar'
end

end
get "/api/assignments" do
  @assignments = Assignment.hash
  json @assignments
end

get "/api/assignments/:id" do
  assignment = Assignment.find(params['id'])
  @assignment = assignment.hash
  json @assignments
end