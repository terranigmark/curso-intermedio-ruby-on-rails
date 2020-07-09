module TasksHelper
  def available_events_for(task)
    task.aasm.permitted_transitions.map { |t| t[:event] }
  end
end
