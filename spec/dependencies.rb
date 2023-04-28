# frozen_string_literal: true

require 'rspec'
require 'byebug'

# Require all files from 'lib' folder.
Dir['./../lib/*.rb'].sort.each { |file| require file }
