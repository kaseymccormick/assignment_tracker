require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/base"
require "sinatra/json"
require 'sinatra/cross_origin'
set :bind, '0.0.0.0'

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
require_relative "controllers/api_controller.rb"