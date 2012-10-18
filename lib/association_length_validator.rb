class AssociationLengthValidator < ActiveModel::Validations::LengthValidator

  def validate_each(record, attribute, value)
    value = value.reject(&:marked_for_destruction?)
    value = select_items(record, value, options[:select]) if options[:select]

    super(record, attribute, value)
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

end
