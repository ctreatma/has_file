module HasFile
  module InstanceMethods
    def assign_file(name, file)
      write_attribute "#{name}_file", file.read

      if self.respond_to? "#{name}_file_name"
        write_attribute "#{name}_file_name", file.original_filename
      end

      if self.respond_to? "#{name}_content_type"
        write_attribute "#{name}_content_type", file.content_type.to_s.strip
      end
    end

    def retrieve_file(name)
      # TODO: Is there a way to do this w/out writing a temp file?
    end

    def has_file?(name)
      # TODO
    end
  end
end
