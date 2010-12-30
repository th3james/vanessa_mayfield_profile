Feature: Manage pages
  In order to build and create the information on the site
  As the Site Admin
  I want to manage the information on the static pages

  Scenario: List existing pages in navigation
    Given the following pages exist:
      | title       |
      | "title_one" |
      | "title_two" |
    When I go to the home page
    Then I should see "title_one"
    And I should see "title_two"

  Scenario: View a page
    Given the following pages exist:
      | title           | body                |
      | "viewable page" | "hats am the best"  |
    When I go to the home page
    And I follow "viewable page"
    Then I should see "viewable page"
    And I should see "hats am the best"

  Scenario: Non logged in user should not see page admin
    When I go to the home page
    Then I should not see "logout"
    And I should not see "page admin"

  Scenario: Admin user should see page admin link
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    Then I should see "logout"
    And I should see "page admin"

  Scenario: Non logged in users should be unable to visit the page admin page
    When I go to the index page for pages
    Then I should see "Access denied!"

  Scenario: Admin user should be able to create new news posts
    Given the admin user exists
    And I am logged in as that user
    When I go to the home page
    And I follow "page admin"
    And I follow "New Page"
    And I fill in "Title" with "New Page"
    And I fill in "Body" with "Body of page"
    And I press "Create Page"
    Then I should see "Body of page"
    And I should see "New Page"
    And I should be on the show page for that page

  Scenario: Edit a page
    Given I have no pages
    And a page exists with title: "Old title", body: "hats"
    And the admin user exists
    And I am logged in as that user
    When I go to the index page for pages
    And I follow "Edit"
    And I fill in "Title" with "New Title"
    And I press "Update"
    Then I should see "New Title"
    Then I should not see "Old title"

  Scenario: Delete a page
    Given I have no pages
    And a page exists with title: "Post to delete"
    And the admin user exists
    And I am logged in as that user
    When I go to the index page for pages
    And I follow "Destroy"
    Then I should not see "Page to delete"

  Scenario: View a page as a user
    Given a page exists with title: "Super page", body: "The body"
    When I go to the show page for that page
    Then I should see "Super page"
    And I should see "The body"
    And I should not see "Edit"
