class Patient < ActiveRecord::Base
  include PgSearch
  include CommonContent

  attr_reader :object_pronoun, :subject_pronoun, :possessive_pronoun

  scope :sorted, -> { order(last_name: :asc) }

  pg_search_scope :search,
    against: [:first_name, :last_name, :date_of_birth],
    using: {
      tsearch: { prefix: true }
    }

  self.per_page = 10

  has_one :gallery,
    inverse_of: :patient

  has_many :visits,
    inverse_of: :patient

  has_many :heart_imagings,
    dependent: :destroy
  has_many :vitals,
    dependent: :destroy

  has_many :symptoms,
    dependent: :destroy
  has_many :family_members,
    dependent: :destroy
  has_many :hospitalizations,
    dependent: :destroy
  has_many :tests,
    dependent: :destroy

  has_many :complications,
    dependent: :destroy
  has_many :diagnoses,
    dependent: :destroy
  has_many :medications,
    dependent: :destroy
  has_many :procedures,
    dependent: :destroy

  accepts_nested_attributes_for :gallery

  accepts_nested_attributes_for :vitals
  accepts_nested_attributes_for :complications
  accepts_nested_attributes_for :diagnoses
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :procedures
  accepts_nested_attributes_for :heart_imagings

  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests
  accepts_nested_attributes_for :family_members

  validates :first_name,
    presence: true,
    format: {
      with: /\A[a-zA-Z ']+\z/
    }
  validates :last_name,
    presence: true,
    format: {
      with: /\A[a-zA-Z ']+\z/
    }
  validates :address_line_1,
    presence: true
  validates :city,
    presence: true,
    format: {
      with: /\A[a-zA-Z ']+\z/
    }
  validates :state,
    presence: true,
    format: {
      with: /\A[a-zA-Z ']+\z/
    }
  validates :postal_code,
    presence: true,
    numericality: true
  validates :country,
    presence: true,
    format: {
      with: /\A[a-zA-Z ']+\z/
    }
  validates :sex,
    presence: true,
    inclusion: ['F', 'M', 'N']
  validates :deceased,
    inclusion: [true, false]
  validates :cause_of_death,
    format: {
      with: /\A[a-zA-Z ']+\z/
    },
    allow_nil: true,
    allow_blank: true
  validates :email,
    presence: true,
    format: {
      with: /.+@.+\..+/i
    }
  validates :phone_1,
    presence: true

  def self.perform_search(keyword)
    if keyword.present?
      Patient.search(keyword)
    else
      Patient.all
    end.sorted
  end

  def object_pronoun
    if self.sex == "F"
      return "her"
    elsif self.sex == "M"
      return "him"
    else
      return "them"
    end
  end

  def subject_pronoun
    if self.sex == "F"
      return "she"
    elsif self.sex == "M"
      return "he"
    else
      return "they"
    end
  end

  def possessive_pronoun
    if self.sex == "F"
      return "her"
    elsif self.sex == "M"
      return "his"
    else
      return "their"
    end
  end
end
