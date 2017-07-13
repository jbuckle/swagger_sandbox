class Presenter
  include Virtus.model(nullify_blank: true)
  include Grape::Entity::DSL

  # Takes a name and a class to create a Virtus attribute with.
  # Additionally takes an option hash, which takes a virtus_default
  # key that is used to populate default values
  #
  # The rest of the option hash is then passed straight through to
  # Grape when self.build_entity_definition! is called.
  def self.expose_typed_attribute(name, klass, opts = {})
    opts = opts.with_indifferent_access
    default_value = opts.delete :virtus_default

    virtus_opts = {}
    virtus_opts[:default] = default_value if default_value.present?

    add_grape_exposure_options(name, opts) if opts.any?

    attribute name, klass, virtus_opts
  end

  def self.build_entity_definition!
    entity do
      attribute_set.each do |attribute|
        expose attribute.name, (grape_exposure_options[attribute.name] || {})
      end
    end
  end

  private

    def self.grape_exposure_options
      @grape_exposure_options ||= {}
    end

    def self.add_grape_exposure_options(attribute_name, options)
      @grape_exposure_options ||= {}
      @grape_exposure_options[attribute_name] = options
    end
end
