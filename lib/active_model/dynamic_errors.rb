module ActiveModel
  class Errors
    alias_method :old_full_message, :full_message

    # Redefine the ActiveModel::Errors::full_message method:
    # 'Base' messages are handled as usual.
    # Non-base messages are prefixed with the attribute name as usual UNLESS
    # they begin with '^' in which case the attribute name is omitted.
    #     E.g. validates_acceptance_of :accepted_terms, :message => '^Please accept the terms of service'
    def full_message(attribute, message)
      return message[1..-1] if message[0] == "^"

      # use the default rails implementation
      old_full_message(attribute, message)
    end
  end
end
