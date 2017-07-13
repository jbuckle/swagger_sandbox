class Presenter
  include Virtus.model(nullify_blank: true)

  def self.will_attribute(name, klass, description, opts = {})
    raise 'Must document all entity exposures' if description.blank?

    default_val = opts.delete :default_value
    default_val.present? ? attribute(name, klass, default: default_val) : attribute(name, klass)

    # Do some extra processing of Array[SomePresenter] klasses to ensure that Swagger
    # documentation generates correctly
    #
    # Must indicate that we are 'using' the singular entity (SomePresenter) while also
    # passing an is_array: true flag into the documentation hash
    multi_valued = klass.is_a?(Array)
    klass = klass.first if multi_valued

    # Build documentation hash.  Account for fact that is_array: true must be passed
    # for Swagger documentation of arrays to be generated correctly
    documentation = { documentation: { type: klass, desc: description }}
    documentation[:documentation].merge!({ is_array: true }) if multi_valued

    pass_through = opts[:grape_pass_through] || {}
    pass_through.merge! documentation

    pass_through.merge!({ using: klass.entity }) if klass.ancestors.include?(Grape::Entity::DSL)

    entity { expose name, pass_through }
  end
end
