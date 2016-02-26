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
  #Basically the same as button_to_delete, but without adding a class
  def link_to_delete(name, url, toConfirm)
    if toConfirm
      link_to name, url, :method => :delete, data: { confirm: 'Bist du sicher?' }
    else
      link_to name, url, :method => :delete
    end
  end
  #Default button
  def button_to_default(name,url)
    link_to name, url, class: "btn btn-w-md btn-gap-v btn-default"
  end
  def button_to_small(name,url)
    link_to name, url, class: "btn btn-default"
  end
  #Gives back a date in the German format
  def pretty_date(date)
date.strftime("%d.%m.%Y")
  end

end
