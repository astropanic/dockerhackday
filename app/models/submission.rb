class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :language

  def available_languages
    %w(ruby go)
  end
end
