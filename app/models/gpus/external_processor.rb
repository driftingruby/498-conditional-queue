class Gpus::ExternalProcessor < Gpus::Base
  def self.execute(some_record)
    Rails.logger.info "✅ gpuexternal #{some_record}"
    sleep 5
    Rails.logger.info "🏁 gpuexternal #{some_record}"
  end
end
