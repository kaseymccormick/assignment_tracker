require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class ResourceCategory
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id 
  attr_accessor :catigory
  
  
  #initalize a new responder object
  def initialize(options={})
    @id = options["id"].to_i
    @catigory = options["catigory"]
  end

  def self.revise(id, catigory)
    CONNECTION.execute("UPDATE resource_categories SET catigory = '#{catigory}'WHERE id = #{id};")
  end
end