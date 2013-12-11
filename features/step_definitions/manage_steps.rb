Given /the following users exist/ do |table|
  table.hashes.each do |ele|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create!(ele)
  end
  #flunk "Unimplemented"
end

Given /the following articles exist/ do |table|
  table.hashes.each do |ele|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create!(ele)
  end
  #flunk "Unimplemented"
end

Given /the following comments exist/ do |table|
  table.hashes.each do |ele|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Comment.create!(ele)
  end
  #flunk "Unimplemented"
end

