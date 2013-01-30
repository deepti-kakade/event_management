module ApplicationHelper
  def resource_name
    :person
  end

  def resource
    @resource ||= Person.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:person]
  end


  def get_status_class(event)
    status = event.status
    case status
      when EVENT_STATUS[0]
        ""
      when EVENT_STATUS[1]
        "green"
      when EVENT_STATUS[2]
        "red"
    end
  end

  def get_status_image(event)
    status = event.status
    case status
      when EVENT_STATUS[0]
        "question-a"
      when EVENT_STATUS[1]
        "right-a"
      when EVENT_STATUS[2]
        "cross-a"
    end
  end
end
