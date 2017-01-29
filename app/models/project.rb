class Project < ApplicationRecord
  def to_param
    name.parameterize
  end

  validates :name,
            presence: true,
            uniqueness: true

  validates :github,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\A[\w\-]+\z/i}

  validates :store,
            format: {with: /\A(([ ]*)|(http[s]?:\/\/)?[\w\-.]+\.[\w]{2,5}[\/\w-]*)\z/}

  validates :desc,
            presence: true,
            length: {maximum: 256}

  validates :content,
            presence: true

  has_many :project_tags, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
end
