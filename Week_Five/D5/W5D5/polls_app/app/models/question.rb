class Question

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    primary_key: :id,
    foreign_key: :response_id,
    class_name: :Reponse

end