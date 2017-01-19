class ClientLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
  end
end

logfile = File.open("#{Rails.root}/log/client.log", 'a')
logfile.sync = true
CLIENT_LOGGER = ClientLogger.new(logfile)
