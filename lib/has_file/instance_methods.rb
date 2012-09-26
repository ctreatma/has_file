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
      if has_file(name)
        reader, writer = IO.pipe
        writer.write self.send("#{name}_file")
        writer.close
        reader
      end
    end

    def has_file?(name)
      !self.send("#{name}_file").nil?
    end
  end
end
