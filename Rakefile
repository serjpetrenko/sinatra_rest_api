# frozen_string_literal: true

task :environment do
  ENV['RACK_ENV'] ||= 'development'
end

desc 'Starting api server using shotgun'
task shotgun: :environment do
  sh 'shotgun config.ru'
end

task shot: :shotgun
