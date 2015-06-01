Feature: Article Resource - Citations (API)
  In order to maintain article content
  As a production system
  I need to be able to assign citations to the article via the resource api

  Scenario: POST the kitchen sink article
    Given I set header "Content-Type" with value "application/json"
    And I send a POST request to "api/article.json" with body:
      """
        {
          "title": "Bacterial regulation of colony development in the closest living relatives of animals",
          "impact-statement": "The chemical nature of RIF-1 may reveal a new class of bacterial signaling molecules.",
          "version": "1",
          "doi": "10.7554/eLife.00013",
          "publish": "1",
          "volume": "3",
          "article-id": "10.7554/eLife.00013",
          "article-version-id": "00013.1",
          "pub-date": "2014-02-28",
          "path": "content/3/e00013",
          "article-type": "research-article",
          "status": "VOR",
          "force": "1",
          "categories": {
            "display-channel": [
              "Research article"
            ],
            "heading": [
              "Cell biology",
              "Computer science"
            ]
          },
          "keywords": {
            "author-keywords": [
              "<italic>Salpingoeca rosetta</italic>",
              "Algoriphagus",
              "bacterial sulfonolipid",
              "multicellular development"
            ],
            "research-organism": [
              "Mouse",
              "<italic>C. elegans</italic>",
              "Other"
            ]
          },
          "contributors": [
            {
              "type": "author",
              "equal-contrib": "yes",
              "id": "author-23",
              "surname": "Alegado",
              "given-names": "Rosanna A",
              "suffix": "Jnr",
              "references": {
                "affiliation": [
                  "aff1",
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib"
                ],
                "funding": [
                  "par-1",
                  "par-2"
                ],
                "contribution": [
                  "con1"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa1"
                ],
                "related-object": [
                  "dataro1",
                  "dataro2"
                ]
              }
            },
            {
              "type": "author",
              "equal-contrib": "yes",
              "id": "author-17",
              "surname": "Brown",
              "given-names": "Laura W",
              "orcid": "http://orcid.org/0000-0002-7361-560X",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib"
                ],
                "funding": [
                  "par-1",
                  "par-3"
                ],
                "contribution": [
                  "con2"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-3",
              "surname": "Cao",
              "given-names": "Shugeng",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib2"
                ],
                "contribution": [
                  "con3"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-4",
              "surname": "Dermenjian",
              "given-names": "Renee Kathryn",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib2"
                ],
                "contribution": [
                  "con4"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa3"
                ]
              }
            },
            {
              "type": "author",
              "deceased": "yes",
              "id": "author-5",
              "surname": "Zuzow",
              "given-names": "Richard",
              "references": {
                "affiliation": [
                  "aff3"
                ],
                "contribution": [
                  "con5"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-6",
              "surname": "Fairclough",
              "given-names": "Stephen R",
              "references": {
                "affiliation": [
                  "aff1"
                ],
                "funding": [
                  "par-6"
                ],
                "contribution": [
                  "con6"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "id": "author-7",
              "surname": "Clardy",
              "given-names": "Jon",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "email": [
                  "cor1"
                ],
                "funding": [
                  "par-4",
                  "par-5"
                ],
                "contribution": [
                  "con7"
                ],
                "competing-interest": [
                  "conf1"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "id": "author-8",
              "surname": "King",
              "given-names": "Nicole",
              "references": {
                "affiliation": [
                  "aff1"
                ],
                "email": [
                  "cor2"
                ],
                "funding": [
                  "par-1",
                  "par-2",
                  "par-3",
                  "par-4",
                  "par-5"
                ],
                "contribution": [
                  "con8"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "group-author-key": "group-author-id1",
              "collab": "NISC Comparative Sequencing Program",
              "references": {
                "affiliation": [
                  "aff3"
                ],
                "email": [
                  "cor3"
                ],
                "funding": [
                  "par-7"
                ],
                "contribution": [
                  "con9"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "group-author-key": "group-author-id2",
              "collab": "eLife staff group"
            },
            {
              "type": "editor",
              "id": "author-10",
              "surname": "Sneden",
              "given-names": "Christopher",
              "role": "Reviewing editor",
              "affiliation": {
                "institution": "Pediatric Dengue Vaccine Initiative",
                "country": "United States"
              }
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Mullikin",
              "given-names": "Jim",
              "affiliation": {
                "institution": "Science Exchange, Palo Alto",
                "city": "California"
              }
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Mulvany",
              "given-names": "Ian"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Bloggs",
              "given-names": "J"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Dodd",
              "given-names": "Melissa"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Rogers",
              "given-names": "Fran"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Patterson",
              "given-names": "Mark"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Harrison",
              "given-names": "Melissa"
            }
          ],
          "referenced": {
            "equal-contrib": {
              "equal-contrib": "These authors contributed equally to this work",
              "equal-contrib2": "These authors contributed equally to this work"
            },
            "email": {
              "cor1": "jon_clardy@hms.harvard.edu",
              "cor2": "nking@berkeley.edu",
              "cor3": "mharrison@elifesciences.org"
            },
            "funding": {
              "par-1": {
                "id": "dx.doi.org/10.13039/100000011",
                "id-type": "FundRef",
                "institution": "Howard Hughes Medical Institute",
                "institution-type": "university"
              },
              "par-2": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "F32 GM086054"
              },
              "par-3": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "F32 GM089018"
              },
              "par-4": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "R01 GM086258"
              },
              "par-5": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "R01 GM099533"
              },
              "par-6": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "T32 HG00047"
              },
              "par-7": {
                "institution": "Laura and John Arnold Foundation",
                "institution-type": "university"
              }
            },
            "competing-interest": {
              "conf1": "JC: Reviewing editor, <italic>eLife</italic>.",
              "conf2": "The other authors declare that no competing interests exist."
            },
            "contribution": {
              "con1": "RAA, Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con2": "LWB, Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con3": "CS, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con4": "RKD, Acquisition of data, Analysis and interpretation of data",
              "con5": "RZ, Acquisition of data, Analysis and interpretation of data",
              "con6": "SRF, Acquisition of data, Analysis and interpretation of data",
              "con7": "JC, Conception and design, Analysis and interpretation of data, Drafting or revising the article",
              "con8": "NK, Conception and design, Analysis and interpretation of data, Drafting or revising the article",
              "con9": "NISC Comparative Sequencing Program: JM did X, IM did Y and JB did Z and Y"
            },
            "present-address": {
              "pa1": "Department of Wellcome Trust, Sanger Institute, London, United Kingdom",
              "pa2": "Department of Biological Chemistry and Molecular Pharmacology, Harvard Medical School, Boston, United States",
              "pa3": "eLife Sciences editorial Office, eLife Sciences, Cambridge, United Kingdom"
            },
            "affiliation": {
              "aff1": {
                "dept": "Department of Molecular and Cell Biology",
                "institution": "University of California, Berkeley",
                "city": "Berkeley",
                "country": "United States"
              },
              "aff2": {
                "dept": "Department of Biological Chemistry and Molecular Pharmacology",
                "institution": "Harvard Medical School",
                "city": "Boston",
                "country": "United States"
              },
              "aff3": {
                "dept": "Department of Biochemistry",
                "institution": "Stanford University School of Medicine",
                "city": "Stanford",
                "country": "United States"
              }
            },
            "related-object": {
              "dataro1": {
                "type": "generated-dataset",
                "source-id": "http://www.rcsb.org/pdb/explore/explore.do?structureId=3ANW",
                "source-id-type": "uri",
                "year": "2011",
                "source": "A protein complex essential initiation of DNA replication",
                "comment": "Publicly available at RCSB Protein Data Bank."
              },
              "dataro2": {
                "type": "generated-dataset",
                "source-id": "http://www.ncbi.nlm.nih.gov/sra/SRX528181",
                "source-id-type": "uri",
                "year": "2014",
                "source": "Data from: MicroRNAmediated repression of nonsense mRNAs",
                "comment": "Publicly available at NCBI Short Read Archive."
              },
              "dataro3": {
                "type": "existing-dataset",
                "source-id": "http://dx.doi.org/10.5061/dryad.mh2qf615",
                "source-id-type": "uri",
                "year": "2012",
                "source": "The evolution of experience-mediated plasticity in mate preference",
                "comment": "Available at Dryad Digital Repository under a CC0 Public Domain Dedication."
              }
            }
          },
          "related-articles": [
            {
              "type": "commentary",
              "href": "10.7554/eLife.00013"
            }
          ],
          "children": {
            "fragment": [
              {
                "type": "abstract",
                "doi": "10.7554/eLife.00013.001",
                "path": "content/3/e00013/abstract-1"
              },
              {
                "type": "abstract",
                "abstract-type": "executive-summary",
                "doi": "10.7554/eLife.00013.002",
                "path": "content/3/e00013/abstract-2"
              },
              {
                "type": "fig",
                "title": "Figure 1.",
                "doi": "10.7554/eLife.00013.003",
                "path": "content/3/e00013/F1",
                "children": {
                  "fragment": [
                    {
                      "type": "supplementary-material",
                      "title": "Figure 1—source data 1.",
                      "doi": "10.7554/eLife.00013.004",
                      "path": "content/3/e00013/F1/DC1"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 1—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.005",
                      "path": "content/3/e00013/F1/F2"
                    }
                  ]
                }
              },
              {
                "type": "media",
                "title": "Video 1.",
                "doi": "10.7554/eLife.00013.006",
                "path": "content/3/e00013/media-1"
              },
              {
                "type": "table-wrap",
                "title": "Table 1.",
                "doi": "10.7554/eLife.00013.007",
                "path": "content/3/e00013/T1",
                "children": {
                  "fragment": [
                    {
                      "type": "supplementary-material",
                      "title": "Table 1—source data 1.",
                      "doi": "10.7554/eLife.00013.008",
                      "path": "content/3/e00013/T1/DC2"
                    }
                  ]
                }
              },
              {
                "type": "boxed-text",
                "title": "Box 1.",
                "doi": "10.7554/eLife.00013.009",
                "path": "content/3/e00013/B1"
              },
              {
                "type": "fig",
                "title": "Figure 2.",
                "doi": "10.7554/eLife.00013.010",
                "path": "content/3/e00013/F3"
              },
              {
                "type": "table-wrap",
                "title": "Table 2.",
                "doi": "10.7554/eLife.00013.011",
                "path": "content/3/e00013/T2"
              },
              {
                "type": "fig",
                "title": "Figure 3.",
                "doi": "10.7554/eLife.00013.012",
                "path": "content/3/e00013/F4",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.013",
                      "path": "content/3/e00013/F4/F5"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 2.",
                      "doi": "10.7554/eLife.00013.014",
                      "path": "content/3/e00013/F4/F6"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 3.",
                      "doi": "10.7554/eLife.00013.015",
                      "path": "content/3/e00013/F4/F7"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 4.",
                      "doi": "10.7554/eLife.00013.016",
                      "path": "content/3/e00013/F4/F8"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 5.",
                      "doi": "10.7554/eLife.00013.017",
                      "path": "content/3/e00013/F4/F9"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 6.",
                      "doi": "10.7554/eLife.00013.018",
                      "path": "content/3/e00013/F4/F10"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 7.",
                      "doi": "10.7554/eLife.00013.019",
                      "path": "content/3/e00013/F4/F11"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 8.",
                      "doi": "10.7554/eLife.00013.020",
                      "path": "content/3/e00013/F4/F12"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 9.",
                      "doi": "10.7554/eLife.00013.021",
                      "path": "content/3/e00013/F4/F13"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 10.",
                      "doi": "10.7554/eLife.00013.022",
                      "path": "content/3/e00013/F4/F14"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 11.",
                      "doi": "10.7554/eLife.00013.023",
                      "path": "content/3/e00013/F4/F15"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 12.",
                      "doi": "10.7554/eLife.00013.024",
                      "path": "content/3/e00013/F4/F16"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 13.",
                      "doi": "10.7554/eLife.00013.025",
                      "path": "content/3/e00013/F4/F17"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 14.",
                      "doi": "10.7554/eLife.00013.026",
                      "path": "content/3/e00013/F4/F18"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 15.",
                      "doi": "10.7554/eLife.00013.027",
                      "path": "content/3/e00013/F4/F19"
                    }
                  ]
                }
              },
              {
                "type": "table-wrap",
                "title": "Table 3.",
                "doi": "10.7554/eLife.00013.028",
                "path": "content/3/e00013/T3"
              },
              {
                "type": "fig",
                "title": "Figure 4.",
                "doi": "10.7554/eLife.00013.029",
                "path": "content/3/e00013/F20",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Figure 4—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.030",
                      "path": "content/3/e00013/F20/F21"
                    }
                  ]
                }
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 1.",
                "doi": "10.7554/eLife.00013.031",
                "path": "content/3/e00013/DC3"
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 2.",
                "doi": "10.7554/eLife.00013.032",
                "path": "content/3/e00013/DC4"
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 3.",
                "doi": "10.7554/eLife.00013.033",
                "path": "content/3/e00013/DC5"
              },
              {
                "type": "fig",
                "title": "Appendix 1 Figure 1 8.",
                "doi": "10.7554/eLife.00013.034",
                "path": "content/3/e00013/F22"
              },
              {
                "type": "fig",
                "title": "Appendix 2 Figure 1",
                "doi": "10.7554/eLife.00013.035",
                "path": "content/3/e00013/F23"
              },
              {
                "type": "fig",
                "title": "Appendix 2 Figure 2",
                "doi": "10.7554/eLife.00013.036",
                "path": "content/3/e00013/F24"
              }
            ],
            "sub-article": [
              {
                "title": "Decision letter",
                "doi": "10.7554/eLife.00013.037",
                "path": "content/3/e00013/1",
                "contributors": [
                  {
                    "type": "editor",
                    "surname": "Sneden",
                    "given-names": "Christopher",
                    "role": "Reviewing editor",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  },
                  {
                    "type": "reviewer",
                    "id": "author-34",
                    "surname": "Harrison",
                    "given-names": "Melissa",
                    "role": "Reviewer",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  },
                  {
                    "type": "reviewer",
                    "id": "author-35",
                    "surname": "Roderick",
                    "given-names": "Sian",
                    "role": "Reviewer",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  }
                ]
              },
              {
                "title": "Author response",
                "doi": "10.7554/eLife.00013.037",
                "path": "content/3/e00013/2",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Author response image 1",
                      "doi": "10.7554/eLife.00013.038",
                      "path": "content/2/e00288/2/F25"
                    },
                    {
                      "type": "table-wrap",
                      "title": "Author response table 1.",
                      "doi": "10.7554/eLife.00013.039",
                      "path": "content/2/e00288/2/T4"
                    }
                  ]
                }
              }
            ]
          },
          "citations": {
            "bib1": {
              "publication-type": "book",
              "authors": [
                {
                  "group-type": "author",
                  "name": "WC Agosta"
                }
              ],
              "year": "1992",
              "source": "Chemical Communication",
              "publisher-loc": "New York",
              "publisher-name": "Scientific American Press"
            },
            "bib2": {
              "publication-type": "journal",
              "authors": [
                {
                  "group-type": "author",
                  "name": "I Ahmed"
                },
                {
                  "group-type": "author",
                  "name": "A Yokota"
                },
                {
                  "group-type": "author",
                  "name": "T Fujiwara"
                }
              ],
              "year": "1992",
              "title": "Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil",
              "source": "International journal of systematic and evolutionary microbiology",
              "volume": "57",
              "fpage": "986",
              "lpage": "92",
              "doi": "10.1099/ijs.0.64728-0"
            }
          }
        }
      """
    And the response code should be 200
    When I send a GET request to "api/article/00013.1.json"
    Then the response should contain json:
      """
        {
          "title": "Bacterial regulation of colony development in the closest living relatives of animals",
          "impact-statement": "The chemical nature of RIF-1 may reveal a new class of bacterial signaling molecules.",
          "version": "1",
          "doi": "10.7554/eLife.00013",
          "publish": "1",
          "volume": "3",
          "article-id": "10.7554/eLife.00013",
          "article-version-id": "00013.1",
          "pub-date": "2014-02-28",
          "path": "content/3/e00013",
          "article-type": "research-article",
          "status": "VOR",
          "categories": {
            "display-channel": [
              "Research article"
            ],
            "heading": [
              "Cell biology",
              "Computer science"
            ]
          },
          "keywords": {
            "author-keywords": [
              "<italic>Salpingoeca rosetta</italic>",
              "Algoriphagus",
              "bacterial sulfonolipid",
              "multicellular development"
            ],
            "research-organism": [
              "Mouse",
              "<italic>C. elegans</italic>",
              "Other"
            ]
          },
          "contributors": [
            {
              "type": "author",
              "equal-contrib": "yes",
              "id": "author-23",
              "surname": "Alegado",
              "given-names": "Rosanna A",
              "suffix": "Jnr",
              "references": {
                "affiliation": [
                  "aff1",
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib"
                ],
                "funding": [
                  "par-1",
                  "par-2"
                ],
                "contribution": [
                  "con1"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa1"
                ],
                "related-object": [
                  "dataro1",
                  "dataro2"
                ]
              }
            },
            {
              "type": "author",
              "equal-contrib": "yes",
              "id": "author-17",
              "surname": "Brown",
              "given-names": "Laura W",
              "orcid": "http://orcid.org/0000-0002-7361-560X",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib"
                ],
                "funding": [
                  "par-1",
                  "par-3"
                ],
                "contribution": [
                  "con2"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-3",
              "surname": "Cao",
              "given-names": "Shugeng",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib2"
                ],
                "contribution": [
                  "con3"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-4",
              "surname": "Dermenjian",
              "given-names": "Renee Kathryn",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "equal-contrib": [
                  "equal-contrib2"
                ],
                "contribution": [
                  "con4"
                ],
                "competing-interest": [
                  "conf2"
                ],
                "present-address": [
                  "pa3"
                ]
              }
            },
            {
              "type": "author",
              "deceased": "yes",
              "id": "author-5",
              "surname": "Zuzow",
              "given-names": "Richard",
              "references": {
                "affiliation": [
                  "aff3"
                ],
                "contribution": [
                  "con5"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "id": "author-6",
              "surname": "Fairclough",
              "given-names": "Stephen R",
              "references": {
                "affiliation": [
                  "aff1"
                ],
                "funding": [
                  "par-6"
                ],
                "contribution": [
                  "con6"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "id": "author-7",
              "surname": "Clardy",
              "given-names": "Jon",
              "references": {
                "affiliation": [
                  "aff2"
                ],
                "email": [
                  "cor1"
                ],
                "funding": [
                  "par-4",
                  "par-5"
                ],
                "contribution": [
                  "con7"
                ],
                "competing-interest": [
                  "conf1"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "id": "author-8",
              "surname": "King",
              "given-names": "Nicole",
              "references": {
                "affiliation": [
                  "aff1"
                ],
                "email": [
                  "cor2"
                ],
                "funding": [
                  "par-1",
                  "par-2",
                  "par-3",
                  "par-4",
                  "par-5"
                ],
                "contribution": [
                  "con8"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "group-author-key": "group-author-id1",
              "collab": "NISC Comparative Sequencing Program",
              "references": {
                "affiliation": [
                  "aff3"
                ],
                "email": [
                  "cor3"
                ],
                "funding": [
                  "par-7"
                ],
                "contribution": [
                  "con9"
                ],
                "competing-interest": [
                  "conf2"
                ]
              }
            },
            {
              "type": "author",
              "corresp": "yes",
              "group-author-key": "group-author-id2",
              "collab": "eLife staff group"
            },
            {
              "type": "editor",
              "id": "author-10",
              "surname": "Sneden",
              "given-names": "Christopher",
              "role": "Reviewing editor",
              "affiliation": {
                "institution": "Pediatric Dengue Vaccine Initiative",
                "country": "United States"
              }
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Mullikin",
              "given-names": "Jim",
              "affiliation": {
                "institution": "Science Exchange, Palo Alto",
                "city": "California"
              }
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Mulvany",
              "given-names": "Ian"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id1",
              "surname": "Bloggs",
              "given-names": "J"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Dodd",
              "given-names": "Melissa"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Rogers",
              "given-names": "Fran"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Patterson",
              "given-names": "Mark"
            },
            {
              "type": "author non-byline",
              "group-author-key": "group-author-id2",
              "surname": "Harrison",
              "given-names": "Melissa"
            }
          ],
          "referenced": {
            "equal-contrib": {
              "equal-contrib": "These authors contributed equally to this work",
              "equal-contrib2": "These authors contributed equally to this work"
            },
            "email": {
              "cor1": "jon_clardy@hms.harvard.edu",
              "cor2": "nking@berkeley.edu",
              "cor3": "mharrison@elifesciences.org"
            },
            "funding": {
              "par-1": {
                "id": "dx.doi.org/10.13039/100000011",
                "id-type": "FundRef",
                "institution": "Howard Hughes Medical Institute",
                "institution-type": "university"
              },
              "par-2": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "F32 GM086054"
              },
              "par-3": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "F32 GM089018"
              },
              "par-4": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "R01 GM086258"
              },
              "par-5": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "R01 GM099533"
              },
              "par-6": {
                "id": "dx.doi.org/10.13039/100000002",
                "id-type": "FundRef",
                "institution": "National Institutes of Health",
                "institution-type": "university",
                "award-id": "T32 HG00047"
              },
              "par-7": {
                "institution": "Laura and John Arnold Foundation",
                "institution-type": "university"
              }
            },
            "competing-interest": {
              "conf1": "JC: Reviewing editor, <italic>eLife</italic>.",
              "conf2": "The other authors declare that no competing interests exist."
            },
            "contribution": {
              "con1": "RAA, Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con2": "LWB, Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con3": "CS, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
              "con4": "RKD, Acquisition of data, Analysis and interpretation of data",
              "con5": "RZ, Acquisition of data, Analysis and interpretation of data",
              "con6": "SRF, Acquisition of data, Analysis and interpretation of data",
              "con7": "JC, Conception and design, Analysis and interpretation of data, Drafting or revising the article",
              "con8": "NK, Conception and design, Analysis and interpretation of data, Drafting or revising the article",
              "con9": "NISC Comparative Sequencing Program: JM did X, IM did Y and JB did Z and Y"
            },
            "present-address": {
              "pa1": "Department of Wellcome Trust, Sanger Institute, London, United Kingdom",
              "pa2": "Department of Biological Chemistry and Molecular Pharmacology, Harvard Medical School, Boston, United States",
              "pa3": "eLife Sciences editorial Office, eLife Sciences, Cambridge, United Kingdom"
            },
            "affiliation": {
              "aff1": {
                "dept": "Department of Molecular and Cell Biology",
                "institution": "University of California, Berkeley",
                "city": "Berkeley",
                "country": "United States"
              },
              "aff2": {
                "dept": "Department of Biological Chemistry and Molecular Pharmacology",
                "institution": "Harvard Medical School",
                "city": "Boston",
                "country": "United States"
              },
              "aff3": {
                "dept": "Department of Biochemistry",
                "institution": "Stanford University School of Medicine",
                "city": "Stanford",
                "country": "United States"
              }
            },
            "related-object": {
              "dataro1": {
                "type": "generated-dataset",
                "source-id": "http://www.rcsb.org/pdb/explore/explore.do?structureId=3ANW",
                "source-id-type": "uri",
                "year": "2011",
                "source": "A protein complex essential initiation of DNA replication",
                "comment": "Publicly available at RCSB Protein Data Bank."
              },
              "dataro2": {
                "type": "generated-dataset",
                "source-id": "http://www.ncbi.nlm.nih.gov/sra/SRX528181",
                "source-id-type": "uri",
                "year": "2014",
                "source": "Data from: MicroRNAmediated repression of nonsense mRNAs",
                "comment": "Publicly available at NCBI Short Read Archive."
              },
              "dataro3": {
                "type": "existing-dataset",
                "source-id": "http://dx.doi.org/10.5061/dryad.mh2qf615",
                "source-id-type": "uri",
                "year": "2012",
                "source": "The evolution of experience-mediated plasticity in mate preference",
                "comment": "Available at Dryad Digital Repository under a CC0 Public Domain Dedication."
              }
            }
          },
          "children": {
            "fragment": [
              {
                "type": "abstract",
                "title": "Abstract",
                "doi": "10.7554/eLife.00013.001",
                "path": "content/3/e00013/abstract-1"
              },
              {
                "type": "abstract",
                "title": "eLife digest",
                "abstract-type": "executive-summary",
                "doi": "10.7554/eLife.00013.002",
                "path": "content/3/e00013/abstract-2"
              },
              {
                "type": "fig",
                "title": "Figure 1.",
                "doi": "10.7554/eLife.00013.003",
                "path": "content/3/e00013/F1",
                "children": {
                  "fragment": [
                    {
                      "type": "supplementary-material",
                      "title": "Figure 1—source data 1.",
                      "doi": "10.7554/eLife.00013.004",
                      "path": "content/3/e00013/F1/DC1"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 1—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.005",
                      "path": "content/3/e00013/F1/F2"
                    }
                  ]
                }
              },
              {
                "type": "media",
                "title": "Video 1.",
                "doi": "10.7554/eLife.00013.006",
                "path": "content/3/e00013/media-1"
              },
              {
                "type": "table-wrap",
                "title": "Table 1.",
                "doi": "10.7554/eLife.00013.007",
                "path": "content/3/e00013/T1",
                "children": {
                  "fragment": [
                    {
                      "type": "supplementary-material",
                      "title": "Table 1—source data 1.",
                      "doi": "10.7554/eLife.00013.008",
                      "path": "content/3/e00013/T1/DC2"
                    }
                  ]
                }
              },
              {
                "type": "boxed-text",
                "title": "Box 1.",
                "doi": "10.7554/eLife.00013.009",
                "path": "content/3/e00013/B1"
              },
              {
                "type": "fig",
                "title": "Figure 2.",
                "doi": "10.7554/eLife.00013.010",
                "path": "content/3/e00013/F3"
              },
              {
                "type": "table-wrap",
                "title": "Table 2.",
                "doi": "10.7554/eLife.00013.011",
                "path": "content/3/e00013/T2"
              },
              {
                "type": "fig",
                "title": "Figure 3.",
                "doi": "10.7554/eLife.00013.012",
                "path": "content/3/e00013/F4",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.013",
                      "path": "content/3/e00013/F4/F5"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 2.",
                      "doi": "10.7554/eLife.00013.014",
                      "path": "content/3/e00013/F4/F6"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 3.",
                      "doi": "10.7554/eLife.00013.015",
                      "path": "content/3/e00013/F4/F7"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 4.",
                      "doi": "10.7554/eLife.00013.016",
                      "path": "content/3/e00013/F4/F8"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 5.",
                      "doi": "10.7554/eLife.00013.017",
                      "path": "content/3/e00013/F4/F9"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 6.",
                      "doi": "10.7554/eLife.00013.018",
                      "path": "content/3/e00013/F4/F10"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 7.",
                      "doi": "10.7554/eLife.00013.019",
                      "path": "content/3/e00013/F4/F11"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 8.",
                      "doi": "10.7554/eLife.00013.020",
                      "path": "content/3/e00013/F4/F12"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 9.",
                      "doi": "10.7554/eLife.00013.021",
                      "path": "content/3/e00013/F4/F13"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 10.",
                      "doi": "10.7554/eLife.00013.022",
                      "path": "content/3/e00013/F4/F14"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 11.",
                      "doi": "10.7554/eLife.00013.023",
                      "path": "content/3/e00013/F4/F15"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 12.",
                      "doi": "10.7554/eLife.00013.024",
                      "path": "content/3/e00013/F4/F16"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 13.",
                      "doi": "10.7554/eLife.00013.025",
                      "path": "content/3/e00013/F4/F17"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 14.",
                      "doi": "10.7554/eLife.00013.026",
                      "path": "content/3/e00013/F4/F18"
                    },
                    {
                      "type": "fig",
                      "title": "Figure 3—figure supplement 15.",
                      "doi": "10.7554/eLife.00013.027",
                      "path": "content/3/e00013/F4/F19"
                    }
                  ]
                }
              },
              {
                "type": "table-wrap",
                "title": "Table 3.",
                "doi": "10.7554/eLife.00013.028",
                "path": "content/3/e00013/T3"
              },
              {
                "type": "fig",
                "title": "Figure 4.",
                "doi": "10.7554/eLife.00013.029",
                "path": "content/3/e00013/F20",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Figure 4—figure supplement 1.",
                      "doi": "10.7554/eLife.00013.030",
                      "path": "content/3/e00013/F20/F21"
                    }
                  ]
                }
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 1.",
                "doi": "10.7554/eLife.00013.031",
                "path": "content/3/e00013/DC3"
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 2.",
                "doi": "10.7554/eLife.00013.032",
                "path": "content/3/e00013/DC4"
              },
              {
                "type": "supplementary-material",
                "title": "Supplementary file 3.",
                "doi": "10.7554/eLife.00013.033",
                "path": "content/3/e00013/DC5"
              },
              {
                "type": "fig",
                "title": "Appendix 1 Figure 1 8.",
                "doi": "10.7554/eLife.00013.034",
                "path": "content/3/e00013/F22"
              },
              {
                "type": "fig",
                "title": "Appendix 2 Figure 1",
                "doi": "10.7554/eLife.00013.035",
                "path": "content/3/e00013/F23"
              },
              {
                "type": "fig",
                "title": "Appendix 2 Figure 2",
                "doi": "10.7554/eLife.00013.036",
                "path": "content/3/e00013/F24"
              }
            ],
            "sub-article": [
              {
                "title": "Decision letter",
                "doi": "10.7554/eLife.00013.037",
                "path": "content/3/e00013/1",
                "contributors": [
                  {
                    "type": "editor",
                    "surname": "Sneden",
                    "given-names": "Christopher",
                    "role": "Reviewing editor",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  },
                  {
                    "type": "reviewer",
                    "id": "author-34",
                    "surname": "Harrison",
                    "given-names": "Melissa",
                    "role": "Reviewer",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  },
                  {
                    "type": "reviewer",
                    "id": "author-35",
                    "surname": "Roderick",
                    "given-names": "Sian",
                    "role": "Reviewer",
                    "affiliation": {
                      "institution": "Pediatric Dengue Vaccine Initiative",
                      "country": "United States"
                    }
                  }
                ]
              },
              {
                "title": "Author response",
                "doi": "10.7554/eLife.00013.037",
                "path": "content/3/e00013/2",
                "children": {
                  "fragment": [
                    {
                      "type": "fig",
                      "title": "Author response image 1",
                      "doi": "10.7554/eLife.00013.038",
                      "path": "content/2/e00288/2/F25"
                    },
                    {
                      "type": "table-wrap",
                      "title": "Author response table 1.",
                      "doi": "10.7554/eLife.00013.039",
                      "path": "content/2/e00288/2/T4"
                    }
                  ]
                }
              }
            ]
          },
          "citations": {
            "bib1": {
              "publication-type": "book",
              "authors": [
                {
                  "group-type": "author",
                  "name": "WC Agosta"
                }
              ],
              "year": "1992",
              "source": "Chemical Communication",
              "publisher-loc": "New York",
              "publisher-name": "Scientific American Press"
            },
            "bib2": {
              "publication-type": "journal",
              "authors": [
                {
                  "group-type": "author",
                  "name": "I Ahmed"
                },
                {
                  "group-type": "author",
                  "name": "A Yokota"
                },
                {
                  "group-type": "author",
                  "name": "T Fujiwara"
                }
              ],
              "year": "1992",
              "title": "Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil",
              "source": "International journal of systematic and evolutionary microbiology",
              "volume": "57",
              "fpage": "986",
              "lpage": "92",
              "doi": "10.1099/ijs.0.64728-0"
            }
          }
        }
      """
