class Participant < User
  def self.find_safely(participant_token)
    Participant.where(token: participant_token).first_or_initialize do |participant|
      # we aren't using the email field, but it should be unique
      # removing the email field seems ill-advised, as it limits future extensibility
      participant.email = participant_token
      participant.save(validate: false) if participant.new_record?
    end
  end
end
