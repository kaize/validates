require 'active_model' # why i need do it?

autoload :EmailValidator, "email_validator"
autoload :ExistenceValidator, "existence_validator"
autoload :InnValidator, "inn_validator"
autoload :MoneyValidator, "money_validator"
autoload :SlugValidator, "slug_validator"
autoload :UrlValidator, "url_validator"
autoload :AssociationLengthValidator, "association_length_validator"


module Validates
end