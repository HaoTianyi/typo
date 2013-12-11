Feature: Merge Articles
  As an admin
  In order put different articles into one
  I want to merge two articles

Background: users, blogs and comments have been add to the database

  Given the blog is set up

  Given the following users exist:
    | profile_id | name | login | password | email | state  | 
    | 11 | user1 | user1 | user1 | user1@gmail.com | active |
    | 12 | user2 | user2 | user2 | user2@gmail.com | active |

  Given the following articles exist:
    | id | title | author | user_id | body | allow_comments | published | published_at | state | type |
    | 3 | Hello Art! | user1 | 11 | helloo | true | true | 2013-11-11 00:00:00 | published | Article |
    | 4 | World Art! | user2 | 12 | worldo | true | true | 2013-11-11 00:01:00 | published | Article |

  Given the following comments exist:
    | id | type | author | body | article_id | user_id | created_at |
    | 15 | Comment | user1 | heloc | 3 | 11 | 2013-11-11 00:02:00 |
    | 16 | Comment | user1 | wordc | 4 | 11 | 2013-11-11 00:03:00 |

Scenario: A non-admin cannot merge articles
  When I go to the login page
  And I fill in "user_login" with "user1"
  And I fill in "user_password" with "user1"
  And I press "Login"
  And I should see "Welcome back"
  When I go to the edit page of article 4 for "user1"
  Then I should not see "Merge Articles"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I go to the edit page of article 3 for "admin"
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should be on the admin content page
  And I should see "You have successfully merged the articles."
  And I should see "Hello Art!"
  When I follow "Hello Art!"
  Then I should see "helloo"
  And I should see "worldo"

Scenario: When articles are merged, the merged article should have one author
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I go to the edit page of article 3 for "admin"
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should be on the admin content page
  And I should see "You have successfully merged the articles."
  And I should see "Hello Art!"
  #When I go to the show page of article 3 for "admin"
  Then I should see " user1"
  And I should not see " user2"

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I go to the edit page of article 3 for "admin"
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should be on the admin content page
  And I should see "You have successfully merged the articles."
  And I should see "Hello Art!"

Scenario: The title of the new article should be the title from either one of the merged articles
  When I go to the login page
  And I fill in "user_login" with "admin"
  And I fill in "user_password" with "aaaaaaaa"
  And I press "Login"
  Then I should see "Welcome back"
  When I go to the edit page of article 3 for "admin"
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should be on the admin content page
  And I should see "You have successfully merged the articles."
  And I should see "Hello Art!"
  Then I should see "Hello Art!"
  And I should not see "World Art!"


