require 'docker'
require './config/initializers/docker.rb'
args = []
input = File.readlines('input.rb')
input.each do |line|
  args << '-e' << line
end
container = Docker::Container.create({'Cmd' => ['ruby'] + args, 'Image' => 'ruby'})
container.commit
container.start
sleep(1)
puts container.logs(stdout: 1)
