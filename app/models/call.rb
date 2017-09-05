class Call < ApplicationRecord
  belongs_to :circle
  has_many :call_supporters
  has_many :supporters, through: :call_supporters
  has_one :user, through: :circle
  has_one :fellowship, through: :circle

  # validate :message_length

  def self.test_call
    Call.boot_twilio
    @client.messages.create({
      :from => Rails.application.secrets.twilio_number,
      :to => '+12407316173',
      :body => "This is a DistressCall from Jason T. of SAA. Reach out to them at 240-731-6173."
      })
  end

  def send_call
    phone_numbers = self.circle.supporters.map{|supporter| "+1" +  supporter.phone.split('-').join('')}
    user = self.user
    fellowship = self.fellowship.name
    name = user.first_name
    # message = self.message
    if user.last_initial
      name = name + " " + user.last_initial
    end
    boot_twilio
    phone_numbers.each do |phone_number|
      @client.messages.create({
        :from => Rails.application.secrets.twilio_number,
        :to => phone_number,
        :body => "This is a DistressCall from #{name} of #{fellowship}. Reach out to them at #{user.phone}."
        })
    end
  end

 private
  def message_length
    if message.length > 140
      errors.add(:message, 'cannot be more than 140 characters.')
    end
  end

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end

# for message implimentation later: {message == nil ? '. ' : ': '}#{'"' + message + '"'}
