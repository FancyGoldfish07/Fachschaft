#Event versioning for event model
class EventVersion < PaperTrail::Version
  after_initialize :set_defaults
  belongs_to :author, class_name: 'User',
             foreign_key: 'user_id'
  belongs_to :admin,  class_name: 'User',
                    foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'
  #The state this version is in
  enum state: [:unsubmitted, :submitted, :reviewed, :rejected, :submitted]
  self.table_name = :event_versions

  self.sequence_name = :event_versions_id_seq
  #Changes the state of the version based on the user
  def changeState(user)
 if user.current_role == Role.Fachschaft || user.current_role == Role.Admin
   if self.unsubmitted

   end
 end
  end
  private
  #Sets the defaults
  def set_defaults
    if self.state.blank?
      self.state ||= :unubmitted
    end
  end
end