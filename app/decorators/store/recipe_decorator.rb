class Store::RecipeDecorator < ApplicationDecorator
  delegate_all

  decorates_association :category
  decorates_association :components

  def html_name
    h.content_tag(:span, object.name, class: 'b-name')
  end

  def html_price
    if object.price.try(:>, 0.0)
      h.content_tag(:span, object.price, class: 'b-price')
    else
      h.content_tag(:span, I18n.t('recipes.show.free'), class: 'b-cost')
    end
  end

  def html_volume
    if object.volume.present?
      h.content_tag(:span, (amount * 1000).round().to_s + " ml", class: 'b-volume')
    end
  end

  def html_component_list
    components = object.shown_constituents.pluck(:name)
    if components.any?
      h.content_tag(:span, components.to_sentence, class: 'b-components')
    end
  end
end
