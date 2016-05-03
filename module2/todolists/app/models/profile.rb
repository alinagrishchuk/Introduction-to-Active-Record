class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: ['male', 'female'] }
  validate :first_or_last_names_present
  validate :first_name_is_not_sue_for_male


  def first_or_last_names_present
    if !first_name and !last_name
      errors.add(:first_name, 'Must be present')
    end
  end

  def first_name_is_not_sue_for_male
    if gender == 'male' and first_name == 'Sue'
      errors.add(:first_name, 'Name cant be "Sue"')
    end
  end

  def self.get_all_profiles (min,max)
    Profile.where("birth_year BETWEEN ? AND ?", min,max).
        order(:birth_year)
  end
end
