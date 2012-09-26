module HasFile
  module ClassMethods
    def has_file(name)
      define_method name do |*args|
        retrieve_file name
      end

      define_method "#{name}=" do |file|
        assign_file name, file
      end

      define_method "#{name}?" do
        has_file? name
      end
    end
  end
end
