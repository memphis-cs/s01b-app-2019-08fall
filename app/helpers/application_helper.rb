module ApplicationHelper

  def active_class(path)
    if request.path == path
      return 'active'
    else
      return ''
    end
  end

  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert alert-success",
      "error" => "alert alert-danger",
      "notice" => "alert alert-info",
      "alert" => "alert alert-danger",
      "warn" => "alert alert-warning"
    }
    bootstrap_alert_class[level]
  end
  
end
