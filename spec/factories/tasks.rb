FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Tarea #{n}" }
    sequence(:description) { |n| "Descripcion #{n}" }
    due_date { Date.today + 15.days }
    category
    association :owner, factory: :user

    factory :task_with_participants do
      transient do
        participants_count { 5 }
      end

      after(:build) do |task, evaluator|
        task.participating_users = build_list(
          :participant,
          evaluator.participants_count,
          task: task,
          role: 1
        )
        task.category.save
        task.owner.save
      end
    end
  end
end
