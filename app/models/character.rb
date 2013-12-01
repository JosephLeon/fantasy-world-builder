class Character < ActiveRecord::Base
  validates_presence_of :name, :career, :race, :attack, :defense, :armor,
                :weapon, :languages, :description

  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."

  validates_length_of :career,  :maximum => 128,
                                :too_long => "Can't be more than 128 characters."

  validates_numericality_of :level, :only_integer => true
  validates_numericality_of :gold, :only_integer => true

  validates_numericality_of :intelligence, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :patience, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :charisma, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :perception, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :strength, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :agility, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :constitution, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
  validates_numericality_of :endurance, :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :message => "Must be greater than 1."
end
