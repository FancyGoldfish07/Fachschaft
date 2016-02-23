module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML

        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">

      <b>#{sentence}</b>
</div>
<div class="col-md-12">
      <ul>#{messages}</ul>
</div>
    </div>
</div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end