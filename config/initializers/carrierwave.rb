CarrierWave.configure do |config|

  config.storage              = :grid_fs
  config.grid_fs_access_url   = "/images"

  if Rails.env.production?
    config.grid_fs_database   = ENV['MONGOID_DATABASE']
    config.grid_fs_host       = ENV['MONGOID_HOST']
    config.grid_fs_port       = ENV['MONGOID_PORT']
    config.grid_fs_username   = ENV['MONGOID_USERNAME']
    config.grid_fs_password   = ENV['MONGOID_PASSWORD']
  else
    config.grid_fs_database     = Mongoid.database.name
    config.grid_fs_host         = Mongoid.database.connection.primary_pool.host
    config.grid_fs_port         = Mongoid.database.connection.primary_pool.port
    config.grid_fs_username     = Mongoid.database.connection.auths[0]['username']
    config.grid_fs_password     = Mongoid.database.connection.auths[0]['password']
  end

end