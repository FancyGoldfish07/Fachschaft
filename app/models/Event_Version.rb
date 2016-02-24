#Event versioning for event model
class EventVersion < PaperTrail::Version
  belongs_to :author, class_name: 'User',
             foreign_key: 'user_id'
  belongs_to :admin,  class_name: 'User',
                    foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'
  self.table_name = :event_versions

  self.sequence_name = :event_versions_id_seq
end