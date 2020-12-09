json.success true
json.data do
  json.partial! 'postings/posting', posting: @posting
end
