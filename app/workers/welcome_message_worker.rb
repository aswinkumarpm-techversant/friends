class WelcomeMessageWorker
  include Sidekiq::Worker

  def perform(first_name)
    puts "Hello #{first_name}, welcome to Guestbook!"

  end
end
