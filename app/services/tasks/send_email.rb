class Tasks::SendEmail
  def call(task)
    (task.participants + [task.owner]).each do |user|
      ParticipantMailer.with(user: user, task: task).new_task_email.deliver!
    end
    [true, 'successful']
  rescue => e
    Rails.logger.error e
    [false, 'failed']
  end
end
