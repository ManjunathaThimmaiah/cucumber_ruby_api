Feature: Testing Wikimedia API

  @page_title
  Scenario: Search for a wiki page title
    When A search for pages containing for "sesame" is executed
    Then the response status should be 200
    And A page with the title "Sesame Street characters" is found

  @page_details
  Scenario: Validate wiki page details
    When A search for pages containing for "sesame" is executed
    Then the response status should be 200
    And A page with the title "Sesame Street characters" is found
    When The page details for "Sesame Street characters" are requested
    Then the response status should be 200
    And the timestamp should be greater than "2024-04-04"