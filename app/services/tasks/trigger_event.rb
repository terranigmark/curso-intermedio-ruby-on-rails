class Tasks::TriggerEvent
  def call(task, event)
    task.send "#{event}!"
    [true, 'successful']
  rescue => e
    Rails.logger.error e
    [false, 'failed']
  end
end
