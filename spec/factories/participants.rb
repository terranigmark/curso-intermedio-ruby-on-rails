FactoryBot.define do
  factory :participant do
    association :user
    trait :responsible do
      role { Participant::ROLES[:responsible] }
    end

    trait :follower do
      role { Participant::ROLES[:follower] }
    end

    after(:build) do |participant, _|
      participant.user.save
    end
  end
end
