FactoryGirl.define do
  factory :user do
    email 'user@fachschaft.de'
    username 'user'
    password '12345678'
    password_confirmation '12345678'
    end

    factory :fs_user, class: User do
      email 'fs_user@fachschaft.de'
      username 'fs_user'
      password '12345678'
      password_confirmation '12345678'
      after(:create) {|user| user.add_role("Fachschaftler")}
    end

  factory :manager, class: User do
    email 'manager@fachschaft.de'
    username 'manager'
    password '12345678'
    password_confirmation '12345678'
    after(:create) {|user| user.add_role("Manager")}
  end

  factory :admin, class: User do
    email 'admin@fachschaft.de'
    username 'admin'
    password '12345678'
    password_confirmation '12345678'
    after(:create) {|user| user.add_role("Admin")}
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