class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  DEPARTMENT_OPTIONS = {
    "engineering" => "Engineering",
    "customer_experience" => "Customer Experience",
    "betterment_for_advisors" => "Betterment for Advisors",
    "betterment_for_business" => "Betterment for Business",
    "people" => "People",
    "marketing" => "Marketing",
    "operations" => "Operations",
    "finance" => "Finance",
    "design" => "Design",
    "legal_and_compliance" => "Legal & Compliance",
    "product" => "Product",
    "other" => "Other"
  }.freeze

  has_many :events, foreign_key: :creator_id

  validates :first_name, :last_name, :department, :started_on, :level, presence: true
end
