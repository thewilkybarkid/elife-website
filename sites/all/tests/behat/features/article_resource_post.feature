Feature: Article Resource - POST (API)
  In order to maintain article content
  As a production system
  I need to be able to post article content via the resource api

  Scenario: Post an article
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05227",
          "version": 1,
          "doi": "10.7554/eLife.05227",
          "article-id": "10.7554/eLife.05227",
          "apath": "05227",
          "pdate": "1979-08-17",
          "path": "content/4/e05227",
          "article-type": "research-article",
          "early": 0
        }
      """
    And the response code should be 200
    And I go to "content/4/e05227"
    Then I should see "VOR 05227" in the "h1" element

  Scenario Outline: Post an article with an invalid doi
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05227",
          "version": 1,
          "doi": "<invalid_doi>",
          "article-id": "10.7554/eLife.05227",
          "apath": "05227",
          "pdate": "1979-08-17",
          "path": "content/4/e05227",
          "article-type": "research-article",
          "early": 0
        }
      """
    And the response code should be 406
    And response should contain "Invalid value provided: doi"

    Examples:
      | invalid_doi |
      | invalid doi |
      | 10.7554/eLife.0522 |
