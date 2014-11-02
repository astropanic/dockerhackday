namespace :docker do
  desc 'my plugins rake task'
  task :run_submission => :environment do
    finished = false
    @submission = Submission.where(status: 'created').first
    container = Docker::Container.get(@submission.container_hash)
    container.start
    @submission.update_attribute(:status, 'started')
    while(!finished) do
      sleep(5)
      ids = Docker::Container.all.map &:id
      finished = !ids.include?(container.id)
    end
    @submission.update_attribute(:result, container.logs(stdout: 1))
    @submission.update_attribute(:status, 'done')
  end
end
