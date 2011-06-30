class LogActivityFilesGenerator < Rails::Generator::Base 
  def manifest 
    record do |m|
      m.file "recent_activities_helper.rb", "app/helpers/recent_activities_helper.rb"
      m.file "recent_activity.rb", "app/models/recent_activity.rb"
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => 'create_recent_activities'
    end 
  end
  
end