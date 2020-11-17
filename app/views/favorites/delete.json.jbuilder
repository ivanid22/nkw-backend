json.success true
json.data do
  json.partial! 'favorites/favorite', favorite: @favorite
end