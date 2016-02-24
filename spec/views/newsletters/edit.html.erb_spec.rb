require 'rails_helper'

RSpec.describe "newsletters/edit", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :subject => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "input#newsletter_subject[name=?]", "newsletter[subject]"

      assert_select "textarea#newsletter_description[name=?]", "newsletter[description]"
    end
  end
end
