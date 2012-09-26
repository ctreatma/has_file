require 'has_file/class_methods'
require 'has_file/instance_methods'

module HasFile
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'HasFile' do
      ActiveRecord::Base.send :extend, HasFile::ClassMethods
      ActiveRecord::Base.send :include, HasFile::InstanceMethods
    end
  end
end
