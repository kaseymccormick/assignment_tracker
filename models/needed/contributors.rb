require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Contributor
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
 
  attr_accessor :id, :name
  
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @name = options["name"]
  end

  def self.deletecont(id, assignment_id)
    CONNECTION.execute("DELETE FROM contributors WHERE id = #{id} AND name = #{name}")
  end
  
end