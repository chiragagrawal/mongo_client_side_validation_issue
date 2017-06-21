class User
  include Mongoid::Document
  include Mongoid::Paperclip
  # include Paperclip::CanAttachFromRemoteUrl::Glue
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :notes, type: String
  field :password, type: String

  validates :first_name, presence: true
  has_mongoid_attached_file :avatar,
                            :path => ':rails_root/public/uploads/users/:id/:style.:extension',
                            :url  => "/uploads/users/:id/:style.:extension",
                            :styles => {
                                :original => ['1920x1680>', :jpg],
                                :small    => ['100x100#',   :jpg],
                                :medium   => ['250x250',    :jpg],
                                :large    => ['500x500>',   :jpg]
                            },
                            :convert_options => { :all => '-background white -flatten +matte' }

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment :avatar, dimensions: { width: 373, height: 200 }
end

