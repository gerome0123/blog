PaperTrail.config.track_associations = false

module PaperTrail
  class RecordTrail
    # Returns who creates the `@record`
    def creator
      versions.find_by(event: 'create').try(:whodunnit)
    end
  end
end
