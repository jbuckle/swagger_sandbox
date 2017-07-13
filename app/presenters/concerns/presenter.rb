module Concerns::Presenter
  extend ActiveSupport::Concern

  included do
    include Virtus.model(nullify_blank: true)
    include Grape::Entity::DSL

    def self.will_attribute(name, klass, description, opts = {})
      default_val = opts.delete :default_value
      default_val.present? ? attribute(name, klass, default: default_val) : attribute(name, klass)

      add_grape_exposures(name, klass, description, (opts[:grape_pass_through] || {}))
    end

    def self.build_entity_definition!
      klass = self
      klass.entity do
        klass.grape_exposures.each do |exposure_args|
          expose(*exposure_args)
        end
      end
    end

    private

      def self.grape_exposures
        @grape_exposure_options ||= []
      end

      def self.add_grape_exposures(name, klass, description, pass_through = {})
        @grape_exposure_options ||= []

        raise 'Must document all entity exposures' if description.blank?
        pass_through.merge!({ documentation: { type: klass, desc: description } })

        if (klass.is_a?(Array) && klass.length == 1) || klass.ancestors.include?(Presenter)
          presenter = klass.is_a?(Array) ? klass.first.entity : klass.entity
          opts = { using: presenter }.merge(pass_through)
        else
          opts = {}.merge(pass_through)
        end

        @grape_exposure_options << [name, opts]
      end
  end

end

