class Participant < User
  def self.find_safely(request, participant_token)
    Participant.where(token: participant_token).first_or_initialize do |participant|
      Environment.create(user: participant, user_agent: request.env['HTTP_USER_AGENT'])
      # we aren't using the email field, but it should be unique
      # removing the email field seems ill-advised, as it limits future extensibility
      participant.email = participant_token
      participant.save(validate: false) if participant.new_record?
    end
  end
end
