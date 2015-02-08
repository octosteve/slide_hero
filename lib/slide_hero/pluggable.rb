module SlideHero
  module Pluggable
    def create_plugs_for(*klasses)
      klasses.each do |klass|
        method_name = class_name_to_method_name(klass.name)
        fields = initialization_fields_from_class(klass)

        module_eval %{
          def #{method_name}(#{fields})
            points << #{klass}.new(#{fields}).compile
          end
        }
      end
    end

    def class_name_to_method_name(class_name)
      class_name.split("::")[-1].
        gsub(/([A-Z]\w*)([A-Z]\w*)/, '\1_\2').
        downcase
    end

    def initialization_fields_from_class(klass)
      fields = ""
      arguments = klass.instance_method(:initialize).parameters.to_h
      fields << "*args" if arguments.has_key?(:req) || arguments.has_key?(:opt)
      fields << ", **kwargs" if arguments.has_key?(:key)
      fields << ", &block" if arguments.has_key?(:block)
      fields
    end
  end
end
