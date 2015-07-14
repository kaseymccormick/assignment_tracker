require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Resource
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :rd_id, :assignment_id
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @rd_id = options["rd_id"]
    @assignment_id = options["assignment_id"]
  end
  
  def self.revise(id, rd_id, assignment_id)
    CONNECTION.execute("UPDATE resources SET rd_id = '#{rd_id}', assignment_id = '#{assignment_id}' WHERE id = #{id};")
  end
end