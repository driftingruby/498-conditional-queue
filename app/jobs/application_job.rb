class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  def gpu_queue_full?
    active_jobs = SolidQueue::ClaimedExecution
      .joins(:job)
      .where(solid_queue_jobs: { queue_name: "gpu" })
      .count

    active_jobs >= GPU_QUEUE_SIZE
  end
end
