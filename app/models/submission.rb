class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :language

  def available_languages
    %w(ruby go)
  end

  def start_in_container!
  args = []
  input = File.readlines('tools/input.rb')
  input.each do |line|
  args << '-e' << line
  end
  container = Docker::Container.create({'Cmd' => ['ruby'] + args, 'Image' => 'ruby'})
  container.commit
  container.start
  update_attribute(:container_hash, container.id)
  #sleep(1)
  #puts container.logs(stdout: 1)
  end
end
