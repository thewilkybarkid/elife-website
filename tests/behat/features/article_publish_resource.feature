@api
Feature: Article Publish Resource (API)
  In order to maintain article content
  As a production system
  I need to be able to easily publish or unpublish content

  Background:
    Given I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user

  Scenario Outline: Post content to site as published or unpublished - check user access
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05224",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "05224",
          "article-version-id": "05224.1",
          "pub-date": "1979-08-17",
          "path": "content/4/e05224",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "<publish>",
          "fragments": [
            {
              "type": "abstract",
              "doi": "10.7554/eLife.05224.001",
              "path": "content/4/e05224/abstract-1"
            },
            {
              "type": "abstract",
              "title": "eLife digest",
              "doi": "10.7554/eLife.05224.002",
              "path": "content/4/e05224/abstract-2"
            },
            {
              "type": "fig",
              "title": "Figure 1.",
              "doi": "10.7554/eLife.05224.003",
              "path": "content/4/e05224/F1",
              "fragments": [
                {
                  "type": "supplementary-material",
                  "title": "Figure 1—source data 1.",
                  "doi": "10.7554/eLife.05224.004",
                  "path": "content/4/e05224/F1/DC1"
                },
                {
                  "type": "fig",
                  "title": "Figure 1—figure supplement 1.",
                  "doi": "10.7554/eLife.05224.005",
                  "path": "content/4/e05224/F1/F2"
                }
              ]
            },
            {
              "type": "sub-article",
              "title": "Decision letter",
              "doi": "10.7554/eLife.05224.006",
              "path": "content/4/e05224/1",
              "contributors": [
                {
                  "type": "editor",
                  "surname": "Sneden",
                  "given-names": "Christopher",
                  "role": "Reviewing editor",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                },
                {
                  "type": "reviewer",
                  "id": "author-34",
                  "surname": "Harrison",
                  "given-names": "Melissa",
                  "role": "Reviewer",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                },
                {
                  "type": "reviewer",
                  "id": "author-35",
                  "surname": "Roderick",
                  "given-names": "Sian",
                  "role": "Reviewer",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                }
              ]
            },
            {
              "type": "sub-article",
              "title": "Author response",
              "doi": "10.7554/eLife.05224.007",
              "path": "content/4/e05224/2",
              "fragments": [
                {
                  "type": "fig",
                  "title": "Author response image 1",
                  "doi": "10.7554/eLife.05224.008",
                  "path": "content/4/e05224/2/F25"
                }
              ]
            }
          ]
        }
      """
    And the response code should be 200
    When I am logged in as a user with the "<permissions>" permissions
    And I am on "content/4/e05224"
    Then I should get a <response> HTTP response
    And I am on "content/4/e05224/abstract-1"
    And I should get a <response> HTTP response
    And I am on "content/4/e05224/2"
    And I should get a <response> HTTP response
    And I am on "content/4/e05224/2/F25"
    And I should get a <response> HTTP response

    Examples:
      | publish | response | permissions                                                                                                                          |
      | 0       | 404      | access administration menu,access content                                                                                            |
      | 1       | 200      | access administration menu,access content                                                                                            |
      | 0       | 200      | access administration menu,access content,view any unpublished elife_article_ver content,view any unpublished elife_fragment content |

  Scenario: Make content available for preview then publish
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05224",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "05224",
          "article-version-id": "05224.1",
          "pub-date": "1979-08-17",
          "path": "content/4/e05224",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "0",
          "fragments": [
            {
              "type": "abstract",
              "doi": "10.7554/eLife.05224.001",
              "path": "content/4/e05224/abstract-1"
            },
            {
              "type": "abstract",
              "title": "eLife digest",
              "doi": "10.7554/eLife.05224.002",
              "path": "content/4/e05224/abstract-2"
            },
            {
              "type": "fig",
              "title": "Figure 1.",
              "doi": "10.7554/eLife.05224.003",
              "path": "content/4/e05224/F1",
              "fragments": [
                {
                  "type": "supplementary-material",
                  "title": "Figure 1—source data 1.",
                  "doi": "10.7554/eLife.05224.004",
                  "path": "content/4/e05224/F1/DC1"
                },
                {
                  "type": "fig",
                  "title": "Figure 1—figure supplement 1.",
                  "doi": "10.7554/eLife.05224.005",
                  "path": "content/4/e05224/F1/F2"
                }
              ]
            },
            {
              "type": "sub-article",
              "title": "Decision letter",
              "doi": "10.7554/eLife.05224.006",
              "path": "content/4/e05224/1",
              "contributors": [
                {
                  "type": "editor",
                  "surname": "Sneden",
                  "given-names": "Christopher",
                  "role": "Reviewing editor",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                },
                {
                  "type": "reviewer",
                  "id": "author-34",
                  "surname": "Harrison",
                  "given-names": "Melissa",
                  "role": "Reviewer",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                },
                {
                  "type": "reviewer",
                  "id": "author-35",
                  "surname": "Roderick",
                  "given-names": "Sian",
                  "role": "Reviewer",
                  "affiliations": [
                    {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  ]
                }
              ]
            },
            {
              "type": "sub-article",
              "title": "Author response",
              "doi": "10.7554/eLife.05224.007",
              "path": "content/4/e05224/2",
              "fragments": [
                {
                  "type": "fig",
                  "title": "Author response image 1",
                  "doi": "10.7554/eLife.05224.008",
                  "path": "content/4/e05224/2/F25"
                }
              ]
            }
          ]
        }
      """
    And the response code should be 200
    And I am an anonymous user
    And I am on "content/4/e05224"
    And I should get a 404 HTTP response
    And I am on "content/4/e05224/abstract-1"
    And I should get a 404 HTTP response
    And I am on "content/4/e05224/2/F25"
    And I should get a 404 HTTP response
    And I am logged in as a user with the "access administration menu,access content,view any unpublished elife_article_ver content,view any unpublished elife_fragment content" permissions
    And I am on "content/4/e05224"
    And I should get a 200 HTTP response
    And I am on "content/4/e05224/abstract-1"
    And I should get a 200 HTTP response
    And I am on "content/4/e05224/2/F25"
    And I should get a 200 HTTP response
    When I send a PUT request to "api/publish/05224.1.json" with body:
      """
        {
          "publish": "1"
        }
      """
    And the response code should be 200
    And I am an anonymous user
    And I am on "content/4/e05224"
    Then I should get a 200 HTTP response

  Scenario: Make article available without publication date
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05224",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.1",
          "path": "content/4/e05224",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "1"
        }
      """
    And the response code should be 200
    When I go to "content/4/e05224"
    Then I should get a 200 HTTP response
    And I send a GET request to "api/article/05224.1.json"
    Then the response code should be 200
    And response should contain "pub-date"
    And response should contain "update"

  Scenario: Make article available for preview without publication date
    Given there is an article:
      """
        {
          "title": "VOR 05224",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.1",
          "path": "content/4/e05224",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "0"
        }
      """
    When I am an anonymous user
    And I go to "content/4/e05224"
    Then I should get a 404 HTTP response
    And I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I send a GET request to "api/article/05224.1.json"
    And the response code should be 200
    And response should not contain "pub-date"
    And response should not contain "update"

    Given I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I set header "Content-Type" with value "application/json"
    And I send a PUT request to "api/publish/05224.1.json" with body:
      """
        {
          "publish": "1"
        }
      """
    And the response code should be 200
    When I am an anonymous user
    And I go to "content/4/e05224"
    And I should get a 200 HTTP response
    And I send a GET request to "api/article/05224.1.json"
    Then the response code should be 200
    And response should contain "pub-date"
    And response should contain "update"

  Scenario: Preview and publish second version of article after first is published
    Given there is an article:
      """
        {
          "title": "VOR 05224v1",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.1",
          "path": "content/4/e05224v1",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "1",
          "pub-date": "2015-07-26"
        }
      """
    When I am an anonymous user
    And I go to "content/4/e05224v1"
    And I should get a 200 HTTP response
    And I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I send a GET request to "api/article/05224.1.json"
    Then the response code should be 200
    And response should contain "update"
    And the response should contain json:
      """
        {
          "pub-date": "2015-07-26"
        }
      """

    Given there is an article:
      """
        {
          "title": "VOR 05224v2",
          "version": "2",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.2",
          "path": "content/4/e05224v2",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "0"
        }
      """
    When I am an anonymous user
    And I go to "content/4/e05224v2"
    And I should get a 404 HTTP response
    And I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I send a GET request to "api/article/05224.2.json"
    Then the response code should be 200
    And response should not contain "update"
    And the response should contain json:
      """
        {
          "pub-date": "2015-07-26",
          "publish": "0"
        }
      """

    Given I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I set header "Content-Type" with value "application/json"
    And I send a PUT request to "api/publish/05224.2.json" with body:
      """
        {
          "publish": "1"
        }
      """
    And the response code should be 200
    And the response should contain json:
      """
        {
          "pub-date": "2015-07-26",
          "publish": "1"
        }
      """
    And response should contain "update"
    When I am an anonymous user
    And I go to "content/4/e05224v2"
    And I should get a 200 HTTP response
    And I am logged in as a user with the "eLife Article Publisher" role
    And I am authenticating as the Drupal user
    And I send a GET request to "api/article/05224.2.json"
    Then the response code should be 200
    And response should contain "update"
    And the response should contain json:
      """
        {
          "pub-date": "2015-07-26",
          "publish": "1"
        }
      """

  Scenario: Expect the pub-date and update date to be returned in publish request
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05224v1",
          "version": "1",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.1",
          "path": "content/4/e05224v1",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "1",
          "pub-date": "2015-07-26",
          "update": "2015-07-26"
        }
      """
    And the response code should be 200
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "VOR 05224v2",
          "version": "2",
          "doi": "10.7554/eLife.05224",
          "volume": "4",
          "elocation-id": "e05224",
          "article-id": "10.7554/eLife.05224",
          "article-version-id": "05224.2",
          "path": "content/4/e05224v2",
          "article-type": "research-article",
          "status": "VOR",
          "publish": "0",
          "pub-date": "2015-07-26",
          "update": "2015-07-27"
        }
      """
    And the response code should be 200
    When I send a PUT request to "api/publish/05224.2.json" with body:
      """
        {
          "publish": "1"
        }
      """
    And the response code should be 200
    Then the response should contain json:
      """
        {
          "publish": "1",
          "pub-date": "2015-07-26",
          "update": "2015-07-27"
        }
      """
