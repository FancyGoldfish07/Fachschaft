FactoryGirl.define do
  factory :occurrence do
    title "MyString"
    start "2016-02-24 02:59:54"
    priority 1
    flag false
    imageUrl "MyText"
    url "MyText"
    add_attribute :end, "2016-02-24 02:59:54"
    ort "MyText"
    description "MyText"
  end
end
