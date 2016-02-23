FactoryGirl.define do
  factory :recurrence do
    event_id 1
    start "2016-02-20"
    add_attribute :end, "2016-02-20"
    pattern "MyText"
  end
end
