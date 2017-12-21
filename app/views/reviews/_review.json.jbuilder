json.extract! review, :id, :user_id, :abstract_doc_id, :originality, :expand, :impact, :methods, :clarity, :comments, :created_at, :updated_at
json.url review_url(review, format: :json)
