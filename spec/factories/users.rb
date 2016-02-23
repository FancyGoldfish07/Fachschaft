FactoryGirl.define do
  factory :user do
    email 'admin@example.com'
    password 'Test#Test'
    password_confirmation 'Test#Test'

    factory :fs_user do
      email 'user@example.com'
      password 'Test#Test'
      password_confirmation 'Test#Test'
      trait :fs do
        role :fs
      end
    end

  end
  #The specific roles
  trait :user do
    role :user
  end
  trait :fs do
    role :fs
  end

  trait :manager do
    role :manager
  end

  trait :admin do
    role :admin
  end


end