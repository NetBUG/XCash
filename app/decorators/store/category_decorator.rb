class Store::CategoryDecorator < ApplicationDecorator
  delegate_all

  decorates_association :children
  decorates_association :recipes

  def name
    h.content_tag(header_tag, object.name)
  end

  def header_tag
    if object.parent_id?
      :h3
    else
      :h2
    end
  end
end
