FactoryGirl.define do
  factory :event do
    title "MyString"
    start "2016-02-18 23:50:01"
    priority 1
    flag false
    imageURL "MyText"
    url "MyText"
    repeat 1
    typeOfDate 1
    add_attribute :end, "2016-02-18 23:50:01"
    userGroup 1
  end
end
