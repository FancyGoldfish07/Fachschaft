module ApplicationHelper
  #Delete provides a button to delete something
  #boolean states if a configuration dialog is desired
  def button_to_delete(name, url, toConfirm)
    if toConfirm
      link_to name, url, :method => :delete, data: { confirm: 'Bist du sicher?' }, class: "btn btn-default"
    else
      link_to name, url, :method => :delete, class: "btn btn-default"
    end
  end

end
