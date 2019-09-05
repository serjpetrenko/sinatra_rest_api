# frozen_string_literal: true

require './config/boot'
require 'rubygems'

map('/api/v1/') { run SinatraApi }
