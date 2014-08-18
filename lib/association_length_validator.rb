# -*- coding: utf-8 -*-
class AssociationLengthValidator < ActiveModel::Validations::LengthValidator

  def validate_each(record, attribute, value)
    value = value.reject(&:marked_for_destruction?) if value.respond_to?(:reject)
    value = select_items(record, value, options[:select]) if options[:select]

    value = tokenize(value)
    value_length = value.respond_to?(:length) ? value.length : value.to_s.length
    errors_options = options.except(*RESERVED_OPTIONS)

    CHECKS.each do |key, validity_check|
      next unless check_value = options[key]

      check_value = evaluate_options_value record, check_value

      if !value.nil? || skip_nil_check?(key)
        next if value_length.send(validity_check, check_value)
      end

      errors_options[:count] = check_value

      default_message = options[MESSAGES[key]]
      errors_options[:message] ||= default_message if default_message

      record.errors.add(attribute, MESSAGES[key], errors_options)
    end
  end

  def check_validity!
    keys = CHECKS.keys & options.keys

    if keys.empty?
      raise ArgumentError, 'Range unspecified. Specify the :in, :within, :maximum, :minimum, or :is option.'
    end

    keys.each do |key|
      value = options[key]

      unless (value.is_a?(Integer) && value >= 0) || value == Float::INFINITY ||
        value.is_a?(Proc) || value.is_a?(Symbol) || value.is_a?(String)
        raise ArgumentError, ":#{key} must be a nonnegative Integer or Infinity, or String, Symbol or Proc"
      end
    end
  end

  private

  def select_items(record, items, select_expr)
    case select_expr
    when Symbol, String
      if record.respond_to?(select_expr)
        record.send(select_expr, items)
      else
        raise ArgumentError, "Missing instance method #{record.class.name}##{select_expr}"
      end
    when Proc
      items.select(&select_expr)
    else
      items
    end
  end

  def evaluate_options_value(record, check_value)
    case check_value
    when Symbol, String
      if record.respond_to?(check_value)
        record.send(check_value)
      else
        raise ArgumentError, "Missing instance method #{record.class.name}##{check_value}"
      end
    when Proc
      raise ArgumentError, "Invalid arity: may be zero or one arguments. Current arguments count: #{check_value.arity}" if check_value.arity > 1

      if check_value.arity == 1
        check_value.call(record)
      else
        check_value.call
      end
    else
      check_value
    end
  end
end
