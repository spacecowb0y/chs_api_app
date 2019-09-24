class LogEntryJob < ApplicationJob
  queue_as :critical

  def perform(reading)
    reading.save
  end
end
