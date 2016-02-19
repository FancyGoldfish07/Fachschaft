require 'rails_helper'

RSpec.describe "subscribers/new", type: :view do
  before(:each) do
    assign(:subscriber, Subscriber.new(
      :email => "MyString"
    ))
  end

  it "renders new subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscribers_path, "post" do

      assert_select "input#subscriber_email[name=?]", "subscriber[email]"
    end
  end
end
