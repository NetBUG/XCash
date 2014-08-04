class Store::RecipeDecorator < ApplicationDecorator
  delegate_all

  decorates_association :category
  decorates_association :components

  def name
    h.content_tag(:span, object.name, class: 'b-name')
  end

  def price
    if object.price.try(:>, 0.0)
      h.content_tag(:span, object.price, class: 'b-price')
    else
      h.content_tag(:span, I18n.t('recipes.show.free'), class: 'b-cost')
    end
  end

  def volume
    if object.volume.present?
      h.content_tag(:span, amount, class: 'b-volume')
    end
  end

  def component_list
    components = object.shown_constituents.pluck(:name)
    if components.any?
      h.content_tag(:span, components.to_sentence, class: 'b-components')
    end
  end
end
