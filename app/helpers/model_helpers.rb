module ModelHelpers
#Those go here, because anything else would be considered bad practice I have learned
  #Gives back a date in the German format
  def pretty_date(date)
    date.strftime("%d.%m.%Y")
  end
  #Gives back a date and a time in a pretty format
  def pretty_datetime(datetime)
    datetime.strftime("%d.%m.%Y um %H:%M Uhr")
  end
end