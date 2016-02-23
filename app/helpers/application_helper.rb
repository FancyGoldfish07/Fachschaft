module ApplicationHelper
  #Delete provides a button to delete something
  #boolean states if a configuration dialog is desired
  def button_to_delete(name, url, toConfirm)
    if toConfirm
      link_to name, url, :method => :delete, data: { confirm: 'Bist du sicher?' }, class: "btn btn-w-md btn-gap-v btn-danger"
    else
      link_to name, url, :method => :delete, class: "btn btn-w-md btn-gap-v btn-danger"
    end
  end

  #Default button
  def button_to_default(name,url)
    link_to name, url, class: "btn btn-w-md btn-gap-v btn-default"
  end

end
