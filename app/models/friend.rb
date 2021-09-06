class Friend < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :send_welcome_message

  def send_welcome_message
    tst = WelcomeMessageWorker.perform_async(self.first_name)
    puts "tst", tst

  end

  def self.search(first_name)
    Friend.where('lower(first_name) LIKE ?',"%#{first_name}%")
  end


  def the_name
    # some complex calculation

    puts "I am your Friend #{self.first_name}!"
  end
end
