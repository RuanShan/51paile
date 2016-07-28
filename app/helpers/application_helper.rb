module ApplicationHelper

  def datetimepicker_field_value(datetime)
    unless datetime.blank?
      l(datetime, format: Spree.t('datetime_picker.format', default: '%Y/%m/%d'))
    else
      nil
    end
  end
end
