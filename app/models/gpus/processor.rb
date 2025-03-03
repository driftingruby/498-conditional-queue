class Gpus::Processor < Gpus::Base
  def self.execute(some_record)
    Rails.logger.info "✅ gpu #{some_record}"
    sleep 5
    Rails.logger.info "🏁 gpu #{some_record}"
  end
end
