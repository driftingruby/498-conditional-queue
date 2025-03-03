class ExpensiveBackgroundJob < ApplicationJob
  queue_as do
    gpu_queue_full? ? :gpuexternal : :gpu
  end

  def perform(some_record)
    if self.queue_name == "gpu"
      Gpus::Processor.execute(some_record)
    elsif self.queue_name == "gpuexternal"
      Gpus::ExternalProcessor.execute(some_record)
    end
  end
end
