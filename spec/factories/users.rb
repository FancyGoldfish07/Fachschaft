FactoryGirl.define do
  factory :user do
    email 'factoryGirl@fachschaft.de'
    username 'FactoryGirl'
    password '12345678'
    password_confirmation '12345678'
    end

    factory :fs_user do
      email 'info@fachschaft.de'
      username 'Test'
      password 'Test#Test'
      password_confirmation 'Test#Test'
      trait :fs do
        Role :fs
      end
    end

  #The specific roles
  trait :user do
    Role :user
  end

  trait :fs do
    Role :fs
  end

  trait :manager do
    Role :manager
  end

  trait :admin do
    Role :admin
  end
end