json.id posting.id
json.title posting.title
json.description posting.description
json.price posting.price
json.user_profile_id posting.user_profile_id
json.contact_email posting.contact_email if posting.contact_email.present?
json.contact_phone posting.contact_phone if posting.contact_phone.present?
json.favorites do
  json.array! posting.favorites do |favorite|
    json.posting_id favorite.posting_id
    json.user_profile_id favorite.user_profile_id
  end
end
json.created_at posting.created_at
json.updated_at posting.updated_at