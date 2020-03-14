class Response

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :question,
    primary_key: :id,
    foreign_key: :response_id,
    class_name: :Question

end