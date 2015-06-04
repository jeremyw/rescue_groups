module RescueGroups
  module Relationable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def belongs_to(relationship)
        define_method relationship do
          model = instance_variable_get(:"@#{ relationship }")
          return model unless model.nil?

          relationship_id = self.send(:"#{ relationship }_id")

          unless relationship_id.nil?
            klass = ''
            relationship.to_s.split('_').each do |piece|
              klass += "#{ (piece[0].ord - 32).to_i.chr }#{ piece[1..-1] }"
            end

            klass = Object.const_get("RescueGroups::#{ klass }")
            self.send(:"#{ relationship }=", klass.find(relationship_id))
          end
        end

        define_method :"#{ relationship }=" do |value|
          instance_variable_set(:"@#{ relationship }", value)
        end

        define_method :"#{ relationship }_id" do
          instance_variable_get(:"@#{ relationship }_id")
        end

        define_method :"#{ relationship }_id=" do |value|
          instance_variable_set(:"@#{ relationship }_id", value)
        end
      end

      def has_many(relationship)
        define_method relationship do
          instance_variable_get(:"@#{ relationship }") || []
        end

        define_method :"#{ relationship }=" do |value|
          instance_variable_set(:"@#{ relationship }", value)
        end
      end
    end
  end
end
