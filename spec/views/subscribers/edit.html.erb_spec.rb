require 'rails_helper'

RSpec.describe "subscribers/edit", type: :view do
  before(:each) do
    @subscriber = assign(:subscriber, Subscriber.create!(
      :email => "MyString"
    ))
  end

  it "renders the edit subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscriber_path(@subscriber), "post" do

      assert_select "input#subscriber_email[name=?]", "subscriber[email]"
    end
  end
end
