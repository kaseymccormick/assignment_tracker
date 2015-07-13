require "pry"
require "sinatra"
require "sinatra/reloader"

#sql/ database
require "sqlite3"
require_relative "database_setup.rb"

#models
require_relative "models/needed/assignments.rb"
require_relative "models/needed/contributions.rb"
require_relative "models/needed/resource_catigories.rb"
require_relative "models/needed/resources.rb"
require_relative "models/needed/contributors.rb"

#controllers
require_relative "controllers/main.rb"
require_relative "controllers/assignments.rb"
require_relative "controllers/contributors.rb"
require_relative "controllers/contributions.rb"
require_relative "controllers/resource_types.rb"
require_relative "controllers/resources.rb"
require_relative "controllers/timeframes.rb"