require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Contribution
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
 
  attr_accessor :contributor_id, :assignment_id
  
  
  #initalize a new responder object
  def initialize(options={})
    @contributor_id = options["contributor_id"].to_i
    @assignment_id = options["assignment_id"].to_i
  end

  def delete(contributor_id, assignment_id)
        CONNECTION.execute("DELETE FROM assignments WHERE contributor_id = #{contributor_id} AND assignment_id = #{assignment_id}")

end