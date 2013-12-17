Feature: Merge Articles
  As an admin
  In order to look up articles in a category
  I want to manage categories

Background: The blog has been set up

  Given the blog is set up

Scenario: I can visit the category page
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  And I should see "Welcome back"
  When I follow "Categories"
  Then I should see "Categories"
  And I should see "Title"
  And I should see "Description"
  And I should see "Permalink"
  And I should see "Keywords"


Scenario: I can create a new category
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I follow "Categories"
  And I fill in "Name" with "name1"
  And I fill in "Keywords" with "keywords1"
  And I fill in "Description" with "discription1"
  And I press "Save"
  Then I should see "name1"
  When I follow "name1"
  And I should see "name1"
  And I should see "keywords1"
  And I should see "discription1"

Scenario: I can edit an existed category
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I follow "Categories"
  Then I should see "General"
  When I follow "General"
  And I fill in "Name" with "name1"
  And I fill in "Keywords" with "keywords1"
  And I fill in "Description" with "discription1"
  And I press "Save"
  Then I should see "name1"
  And I should not see "General"
  When I follow "name1"
  And I should see "name1"
  And I should see "keywords1"
  And I should see "discription1"


