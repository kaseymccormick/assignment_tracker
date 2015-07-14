require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Assignment
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :description, :git_repo
  
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @description = options["description"]
    @git_repo = options["git_repo"]
  end
  
  def self.revise(id, description, git_repo)
    CONNECTION.execute("UPDATE assignments SET description = '#{description}', git_repo = '#{git_repo}' WHERE id = #{id};")
  end
  

end