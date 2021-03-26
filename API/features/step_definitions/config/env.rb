require 'rspec'
require 'faraday'

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENV['AMBIENTE']}.yml")