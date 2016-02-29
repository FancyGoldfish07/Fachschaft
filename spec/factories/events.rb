FactoryGirl.define do
  factory :event do
    title "MyString"
    start "2016-03-22 01:44:20"
    priority 1
    flag false
    imageURL "MyText"
    url "MyText"
    add_attribute :end, "2016-03-28 01:44:20"
    ort "MyText"
    description "MyText"
  end
end
