# -*- coding: utf-8 -*-
require 'rubygems'
ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/boot', __FILE__)

APP_PATH = File.expand_path('../../config/application', __FILE__)
require APP_PATH
Rails.application.require_environment!

require 'twitter/json_stream'
OAUTH = HashWithIndifferentAccess.new(YAML.load_file(File.expand_path('../../config/oauth.yml', __FILE__)))


