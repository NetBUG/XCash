class ApplicationDecorator < Draper::Decorator
  include Aepic::Concerns::Decorator

  delegate_all

  def timestamps
    "#{timestamp(object.created_at)}".tap do |timestamps|
      timestamps << " (#{timestamp(object.updated_at)})" if object.updated_at.try(:!=, object.created_at)
    end.html_safe
  end

  private

  def timestamp(time)
    helpers.content_tag(:time,
                        I18n.l(time, format: :short),
                        datetime: time.xmlschema,
                        title: I18n.l(time, format: :long)
    )
  end
end
