class StationsMailer < ActionMailer::Base
  default from: "mailer@citistats.com"
  
  def new_station(station)
    @station = station
    mail(to: 'chrisheydt@gmail.com', subject: "New Citibike Station: #{@station.label}")
  end    
end
