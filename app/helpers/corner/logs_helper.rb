module Corner::LogsHelper
  Date::DATE_FORMATS[:calendar_date] = lambda do |date|
    date.strftime("#{Date::DAYS_INTO_WEEK.key(date.days_to_week_start).to_s.capitalize}, \
    %B %e %Y");
  end
  
  def generate_log_path(log)
    if log.present?
      log_params = { year: log.log_date.year.to_s, 
                 month: log.log_date.month.to_s,
                 day: log.log_date.day.to_s }
      log_path = corner_logs_path(log_params) 
    else
      log_path = new_corner_log_path
    end
    log_path
  end
  
  def generate_log_path_for_today
    log = Corner::Log.find_by(log_date: Time.zone.today)
    generate_log_path(log)
  end
end
