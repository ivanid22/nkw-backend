json.id user_profile.id
json.name user_profile.name
json.location user_profile.location
json.user_id user_profile.user_id
if user_profile.avatar.attached?
  json.avatar url_for(user_profile.avatar)
else
  json.avatar ''
end
