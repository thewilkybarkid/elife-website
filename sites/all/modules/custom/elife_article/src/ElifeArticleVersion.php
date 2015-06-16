<?php

/**
 * @file
 * Contains \Drupal\elife_article\ElifeArticleVersion.
 */

namespace Drupal\elife_article;

use EntityFieldQuery;
use EntityDrupalWrapper;
use EntityListWrapper;
use RecursiveArrayIterator;
use RecursiveIteratorIterator;

class ElifeArticleVersion {

  const DOI_PREFIX = '10.7554/eLife.';

  /**
   * Verify that the article version id string is unique.
   *
   * @param string $article_version_id
   *   Article version id.
   * @param string $bundle
   *   Bundle/content type.
   *
   * @return bool
   *   TRUE if unique.
   */
  public static function uniqueArticleVersionId($article_version_id, $bundle = 'elife_article_ver') {
    $nid = self::fromIdentifier($article_version_id, FALSE, $bundle);

    if (!empty($nid)) {
      return FALSE;
    }

    return TRUE;
  }

  /**
   * Get POA from DOI.
   *
   * This will not return the POA for articles that are now VOR.
   *
   * @param string $doi
   *   Article version DOI.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   * @param int $limit
   *   Limit the number of articles returned.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function poaFromDoi($doi, $load = TRUE, $limit = 1) {
    $conditions = array(
      'field_elife_a_status' => 'POA',
    );

    return self::fromId($doi, $load, 'elife_article_ver', $conditions, $limit, 'field_elife_a_doi');
  }

  /**
   * Get the VOR from the DOI.
   *
   * @param string $doi
   *   Article version DOI.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function vorFromDoi($doi, $load = TRUE) {
    $conditions = array(
      'field_elife_a_status' => 'VOR',
    );

    return self::fromId($doi, $load, 'elife_article_ver', $conditions, 1, 'field_elife_a_doi');
  }

  /**
   * Get POA from article id.
   *
   * This will not return the POA for articles that are now VOR.
   *
   * @param string $article_id
   *   Article ID.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   * @param int $limit
   *   Limit the number of articles returned.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function poaFromId($article_id, $load = TRUE, $limit = 1) {
    $conditions = array(
      'field_elife_a_status' => 'POA',
    );

    return self::fromId($article_id, $load, 'elife_article_ver', $conditions, $limit);
  }

  /**
   * Get the vor from the article id.
   *
   * @param string $article_id
   *   Article ID.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function vorFromId($article_id, $load = TRUE) {
    $conditions = array(
      'field_elife_a_status' => 'VOR',
    );

    return self::fromId($article_id, $load, 'elife_article_ver', $conditions, 1);
  }

  /**
   * Retrieve the article node or node id from the article id.
   *
   * @param string $article_id
   *   Article ID.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   * @param string $bundle
   *   Bundle/content type.
   * @param array $conditions
   *   Array of conditions for sql query.
   * @param int $limit
   *   Limit the number of articles returned.
   * @param string $id_field
   *   Field of the identifier.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function fromId($article_id, $load = TRUE, $bundle = 'elife_article_ver', $conditions = array(), $limit = 0, $id_field = 'field_elife_a_article_id') {
    $id_query = new EntityFieldQuery();
    $id_query->entityCondition('entity_type', 'node');
    $id_query->entityCondition('bundle', $bundle);
    $id_query->fieldCondition($id_field, 'value', $article_id, '=');
    $id_query->fieldOrderBy('field_elife_a_status', 'value', 'DESC');
    $id_query->fieldOrderBy('field_elife_a_version', 'value', 'DESC');
    $id_query->fieldOrderBy('field_elife_a_update', 'value', 'DESC');

    if (!empty($conditions)) {
      foreach ($conditions as $field => $value) {
        $column = 'value';
        $operator = '=';
        if (is_array($value)) {
          $assert = $value[0];

          if (!empty($value[1])) {
            $column = $value[1];
          }
          if (!empty($value[2])) {
            $operator = $value[2];
          }
        }
        else {
          $assert = $value;
        }
        $id_query->fieldCondition($field, $column, $assert, $operator);
      }
    }

    if (!empty($limit)) {
      $id_query->range(0, $limit);
    }

    $ids = $id_query->execute();

    if (empty($ids['node'])) {
      return FALSE;
    }
    else {
      $nids = array_keys($ids['node']);

      if ($load) {
        $nodes = node_load_multiple($nids);
        if ($limit === 1) {
          return array_shift($nodes);
        }
        else {
          return $nodes;
        }
      }
      elseif ($limit === 1) {
        return array_shift($nids);
      }
      else {
        return $nids;
      }
    }
  }

  /**
   * Retrieve the article node or node id from the id.
   *
   * (default is article version id).
   *
   * @param string $id
   *   Identifier.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   * @param string $bundle
   *   Bundle/content type.
   * @param int $limit
   *   Limit the number of articles returned.
   * @param string $id_field
   *   Field of the identifier.
   *
   * @return bool|mixed
   *   Details of the articles that match criteria.
   */
  public static function fromIdentifier($id, $load = TRUE, $bundle = 'elife_article_ver', $limit = 1, $id_field = 'field_elife_a_article_version_id') {
    $id_query = new EntityFieldQuery();
    $id_query->entityCondition('entity_type', 'node');
    $id_query->fieldCondition($id_field, 'value', $id, '=');

    if (!empty($bundle)) {
      $id_query->entityCondition('bundle', $bundle);
    }

    if (!empty($limit)) {
      $id_query->range(0, $limit);
    }

    $ids = $id_query->execute();

    if (empty($ids['node'])) {
      return FALSE;
    }
    else {
      $nids = array_keys($ids['node']);

      if ($load) {
        $nodes = node_load_multiple($nids);
        if ($limit === 1) {
          return array_shift($nodes);
        }
        else {
          return $nodes;
        }
      }
      elseif ($limit === 1) {
        return array_shift($nids);
      }
      else {
        return $nids;
      }
    }
  }

  /**
   * Retrieve the article collection node from the article-id.
   *
   * @param string $article_id
   *   Article Id.
   * @param bool $load
   *   Flag set to TRUE if we wish to load the article data.
   *
   * @return bool|mixed
   *   Details of the article collection entity.
   */
  public static function getArticle($article_id, $load = TRUE) {
    return self::fromIdentifier($article_id, $load, 'elife_article', 1, 'field_elife_a_article_id');
  }

  /**
   * Get path for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return string
   *   Content alias from article.
   */
  public static function getPath($article_version_id) {
    $article_nid = self::fromIdentifier($article_version_id, FALSE);
    return drupal_get_path_alias('node/' . $article_nid);
  }

  /**
   * Get categories for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Categories.
   */
  public static function getCategories($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $categories = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      /* @var EntityDrupalWrapper $category */
      foreach ($ewrapper->field_elife_a_category as $category) {
        $categories[$category->field_elife_category_type->value()][] = $category->name->value();
      }
    }

    return $categories;
  }

  /**
   * Get keywords for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Keywords.
   */
  public static function getKeywords($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $keywords = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      /* @var EntityDrupalWrapper $keyword */
      foreach ($ewrapper->field_elife_a_keyword as $keyword) {
        $value = $keyword->field_elife_a_full_title->value();
        $keywords[$keyword->field_elife_a_kwd_type->value()][] = $value['value'];
      }
    }

    return $keywords;
  }

  /**
   * Get article fragments and sub-articles for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Article sub-articles and fragments.
   */
  public static function getArticleFragmentsAndSubArticles($article_version_id) {
    $children = array();

    $fragments = self::getArticleFragments($article_version_id);
    if (!empty($fragments)) {
      $children = $fragments;
    }

    $subarticles = self::getArticleSubarticles($article_version_id);
    if (!empty($subarticles)) {
      $children = array_merge($children, $subarticles);
    }

    return $children;
  }

  /**
   * Get an array of DOIs for article child fragments.
   *
   * @param string $article_version_id
   *   Article version id.
   * @param array $exclude
   *   Array of dois to exclude.
   *
   * @return array
   *   Array of fragment dois.
   */
  public static function getArticleFragmentDois($article_version_id, $exclude = array()) {
    $children = self::getArticleFragmentsAndSubArticles($article_version_id);
    $dois = array();
    if (!empty($children)) {
      $dois = self::recursiveFind($children, 'doi', $exclude);
    }

    return $dois;
  }

  /**
   * Recursively find values that match the supplied key.
   *
   * @see http://stackoverflow.com/questions/3975585/search-for-a-key-in-an-array-recursivly
   *
   * @param array $array
   *   Array to search.
   * @param string $needle
   *   Key to find values of.
   * @param array $exclude
   *   Array of values to exclude.
   *
   * @return array
   *   Matched values.
   */
  public static function recursiveFind(array $array, $needle, $exclude = array()) {
    $iterator  = new RecursiveArrayIterator($array);
    $recursive = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
    $found = array();
    foreach ($recursive as $key => $value) {
      if ($key === $needle && !in_array($value, $exclude)) {
        array_push($found, $value);
      }
    }
    return $found;
  }

  /**
   * Get article fragments for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Fragments.
   */
  public static function getArticleFragments($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $fragments = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      if ($ewrapper->field_elife_a_fragments->value()) {
        $fragments = self::getChildFragments($ewrapper->field_elife_a_fragments);
      }
    }

    return $fragments;
  }

  /**
   * Get sub articles for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Subarticles.
   */
  public static function getArticleSubarticles($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $subarticles = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      if ($ewrapper->field_elife_a_fragments->value()) {

        $field_prefix = 'field_elife_a';
        $mappings = array(
          'title' => 'title',
          'doi' => $field_prefix . '_doi',
        );
        /* @var EntityDrupalWrapper $sub_wrapper */
        foreach ($ewrapper->field_elife_a_fragments as $sub_wrapper) {
          if ($sub_wrapper->getBundle() == 'elife_article_ver') {
            $subarticle = array();
            foreach ($mappings as $k => $field) {
              if ($value = $sub_wrapper->{$field}->value()) {
                $subarticle[$k] = $value;
              }
            }
            if ($path = drupal_get_path_alias('node/' . $sub_wrapper->nid->value())) {
              $subarticle['path'] = $path;
            }
            if ($sub_wrapper->field_elife_a_fragments->value()) {
              $subarticle['fragments'] = self::getChildFragments($sub_wrapper->field_elife_a_fragments);
            }
            if ($sub_wrapper->field_elife_a_contributors->value()) {
              $subarticle['contributors'] = self::getChildContributors($sub_wrapper->field_elife_a_contributors);
            }
            if (!empty($subarticle)) {
              $subarticle['type'] = 'sub-article';
              $subarticles[] = $subarticle;
            }
          }
        }
      }
    }

    return $subarticles;
  }

  /**
   * Get child fragments for supplied entity.
   *
   * @param EntityListWrapper $frag_list
   *   List of fragment entities.
   *
   * @return array
   *   Fragment data.
   */
  public static function getChildFragments(EntityListWrapper $frag_list) {
    $fragments = array();

    $field_prefix = 'field_elife_a';
    $mappings = array(
      'type' => $field_prefix . '_frag_type',
      'title' => 'title',
      'doi' => $field_prefix . '_doi',
    );
    /* @var EntityDrupalWrapper $frag_wrapper */
    foreach ($frag_list as $frag_wrapper) {
      if ($frag_wrapper->getBundle() == 'elife_fragment') {
        $fragment = array();
        foreach ($mappings as $k => $field) {
          if ($value = $frag_wrapper->{$field}->value()) {
            $fragment[$k] = $value;
          }
        }
        if ($path = drupal_get_path_alias('node/' . $frag_wrapper->nid->value())) {
          $fragment['path'] = $path;
        }
        if ($frag_wrapper->field_elife_a_fragments->value()) {
          $fragment['fragments'] = self::getChildFragments($frag_wrapper->field_elife_a_fragments);
        }
        if (!empty($fragment)) {
          $fragments[] = $fragment;
        }
      }
    }

    return $fragments;
  }

  /**
   * Get contributors for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Contributors.
   */
  public static function getContributors($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $contributors = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      if ($ewrapper->field_elife_a_contributors->value()) {
        $contributors = self::getChildContributors($ewrapper->field_elife_a_contributors);
      }
    }

    return $contributors;
  }

  /**
   * Get child fragments for supplied entity.
   *
   * @param EntityListWrapper $contrib_list
   *   List of contributor entities.
   *
   * @return array
   *   Contributor data.
   */
  public static function getChildContributors(EntityListWrapper $contrib_list) {
    $contributors = array();
    $field_prefix = 'field_elife_a';
    $mappings = array(
      'type' => $field_prefix . '_contrib_type',
      'id' => $field_prefix . '_author_id',
      'surname' => $field_prefix . '_surname',
      'given-names' => $field_prefix . '_fnames',
      'suffix' => $field_prefix . '_author_suffix',
      'orcid' => $field_prefix . '_orcid_id',
      'role' => $field_prefix . '_author_role',
      'group-author-key' => $field_prefix . '_group_author_key',
      'collab' => $field_prefix . '_collab',
    );
    /* @var EntityDrupalWrapper $contrib_wrapper */
    foreach ($contrib_list as $contrib_wrapper) {
      $contributor = array();
      $references = array();
      foreach ($mappings as $k => $field) {
        if ($value = $contrib_wrapper->{$field}->value()) {
          $contributor[$k] = $value;
        }
      }

      if ($value = $contrib_wrapper->{$field_prefix . '_equal_contrib'}->value()) {
        if (!empty($value)) {
          $contributor['equal-contrib'] = 'yes';
        }
      }

      if ($value = $contrib_wrapper->{$field_prefix . '_corresp'}->value()) {
        if (!empty($value)) {
          $contributor['corresp'] = 'yes';
        }
      }

      if ($value = $contrib_wrapper->{$field_prefix . '_deceased'}->value()) {
        if (!empty($value)) {
          $contributor['deceased'] = 'yes';
        }
      }

      $types = array(
        'basic' => $field_prefix . '_basic_ref_type',
        'fund' => 'funding',
        'aff' => 'affiliation',
        'rel' => 'related-object',
      );
      foreach ($types as $k => $t) {
        $field = 'field_elife_a_' . $k . '_ref_links';
        $type = $t;
        /* @var EntityDrupalWrapper $fc_wrapper */
        foreach ($contrib_wrapper->{$field} as $fc_wrapper) {
          if ($k == 'basic') {
            $type = $fc_wrapper->{$t}->value();
          }
          $references[$type][] = $fc_wrapper->field_elife_a_ref_key->value();
        }
      }
      $aff_mappings = array(
        'affiliation' => array(
          'dept' => $field_prefix . '_aff_dept',
          'institution' => $field_prefix . '_aff_inst',
          'city' => $field_prefix . '_aff_city',
          'country' => $field_prefix . '_aff_country',
        ),
      );
      foreach ($aff_mappings as $group => $fields) {
        foreach ($fields as $k => $field) {
          if ($value = $contrib_wrapper->{$field}->value()) {
            $contributor[$group][$k] = $value;
          }
        }
      }
      // @todo - elife - nlisgo - we need to be able to store and retrieve
      // multiple affiliations and funding groups directly with a contributor.
      if (!empty($contributor['affiliation'])) {
        $contributor['affiliations'] = array(
          $contributor['affiliation'],
        );
        unset($contributor['affiliation']);
      }
      if (!empty($contributor)) {
        if (!empty($references)) {
          $contributor['references'] = $references;
        }
        $contributors[] = $contributor;
      }
    }

    return $contributors;
  }

  /**
   * Get contributor reference links with item ids.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Contributor reference links.
   */
  public static function getContributorRefLinks($article_version_id) {
    return self::getContributorReferences($article_version_id, TRUE);
  }

  /**
   * Get related articles for supplied article id.
   *
   * @param string $article_id
   *   Article version id.
   *
   * @return array
   *   Related articles.
   */
  public static function getRelatedArticles($article_id) {
    $article = self::getArticle($article_id);
    $related_articles = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      /* @var EntityDrupalWrapper $fc_wrapper */
      foreach ($ewrapper->field_elife_a_related_articles as $fc_wrapper) {
        $related_article = array();
        if ($fc_wrapper->field_elife_a_rel_article_type->value()) {
          $related_article['type'] = $fc_wrapper->field_elife_a_rel_article_type->value();
        }
        if ($fc_wrapper->field_elife_a_doi->value()) {
          $related_article['href'] = $fc_wrapper->field_elife_a_doi->value();
        }
        if (!empty($related_article)) {
          $related_articles[] = $related_article;
        }
      }
    }

    return $related_articles;
  }

  /**
   * Get contributor references for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Contributor references.
   */
  public static function getContributorReferences($article_version_id, $simple = FALSE) {
    $article = self::fromIdentifier($article_version_id);
    $references = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      $field_ref_key = 'field_elife_a_ref_key';

      $field_basic_ref = 'field_elife_a_basic_ref';
      /* @var EntityDrupalWrapper $fc_wrapper */
      foreach ($ewrapper->{$field_basic_ref} as $fc_wrapper) {
        $key = $fc_wrapper->{$field_ref_key}->value();
        if ($simple) {
          $references[$fc_wrapper->{$field_basic_ref . '_type'}->value()][$key] = $fc_wrapper->item_id->value();
        }
        else {
          $references[$fc_wrapper->{$field_basic_ref . '_type'}->value()][$key] = $fc_wrapper->{$field_basic_ref . '_value'}->value();
        }
      }

      $field_fund_ref = 'field_elife_a_fund_ref';
      $type = 'funding';
      $mappings = array(
        'id' => $field_fund_ref . '_id',
        'id-type' => $field_fund_ref . '_id_type',
        'institution' => $field_fund_ref . '_inst',
        'award-id' => $field_fund_ref . '_award_id',
      );
      /* @var EntityDrupalWrapper $fc_wrapper */
      foreach ($ewrapper->{$field_fund_ref} as $fc_wrapper) {
        $key = $fc_wrapper->{$field_ref_key}->value();
        if ($simple) {
          $references[$type][$key] = $fc_wrapper->item_id->value();
        }
        else {
          $references[$type][$key] = array();
          foreach ($mappings as $k => $field) {
            if ($value = $fc_wrapper->{$field}->value()) {
              $references[$type][$key][$k] = $value;
            }
          }
        }
      }

      $field_aff_ref = 'field_elife_a_aff_ref';
      $type = 'affiliation';
      $mappings = array(
        'dept' => $field_aff_ref . '_dept',
        'institution' => $field_aff_ref . '_inst',
        'city' => $field_aff_ref . '_city',
        'country' => $field_aff_ref . '_country',
      );
      /* @var EntityDrupalWrapper $fc_wrapper */
      foreach ($ewrapper->{$field_aff_ref} as $fc_wrapper) {
        $key = $fc_wrapper->{$field_ref_key}->value();
        if ($simple) {
          $references[$type][$key] = $fc_wrapper->item_id->value();
        }
        else {
          $references[$type][$key] = array();
          foreach ($mappings as $k => $field) {
            if ($value = $fc_wrapper->{$field}->value()) {
              $references[$type][$key][$k] = $value;
            }
          }
        }
      }

      $field_rel_ref = 'field_elife_a_rel_ref';
      $type = 'related-object';
      $mappings = array();
      /* @var EntityDrupalWrapper $fc_wrapper */
      foreach ($ewrapper->{$field_rel_ref} as $fc_wrapper) {
        $key = $fc_wrapper->{$field_ref_key}->value();
        if ($simple) {
          $references[$type][$key] = $fc_wrapper->item_id->value();
        }
        else {
          $references[$type][$key] = array();
          foreach ($mappings as $k => $field) {
            if ($value = $fc_wrapper->{$field}->value()) {
              $references[$type][$key][$k] = $value;
            }
          }
        }
      }
    }

    return $references;
  }

  /**
   * Get citations for supplied article version id.
   *
   * @param string $article_version_id
   *   Article version id.
   *
   * @return array
   *   Citations.
   */
  public static function getCitations($article_version_id) {
    $article = self::fromIdentifier($article_version_id);
    $citations = array();

    /* @var EntityDrupalWrapper $ewrapper */
    if ($ewrapper = entity_metadata_wrapper('node', $article)) {
      $field_citations = 'field_elife_a_citations';
      $field_cit_prefix = 'field_elife_a_cit';
      $mappings = array(
        'id' => $field_cit_prefix . '_id',
        'year' => $field_cit_prefix . '_year',
        'title' => $field_cit_prefix . '_title',
        'source' => $field_cit_prefix . '_source',
        'doi' => $field_cit_prefix . '_doi',
      );
      /* @var EntityDrupalWrapper $cit_wrapper */
      foreach ($ewrapper->{$field_citations} as $cit_wrapper) {
        $citation = array();
        foreach ($mappings as $k => $field) {
          if ($value = $cit_wrapper->{$field}->value()) {
            $citation[$k] = $value;
          }
        }
        if (isset($citation['title']) && isset($citation['id']) && $citation['title'] == $citation['id']) {
          unset($citation['title']);
        }

        $author_mappings = array(
          'group-type' => $field_cit_prefix . '_author_group',
          'name' => $field_cit_prefix . '_author_name',
        );

        /* @var EntityDrupalWrapper $fc_wrapper */
        foreach ($cit_wrapper->{$field_cit_prefix . '_authors'} as $fc_wrapper) {
          $author = array();
          foreach ($author_mappings as $k => $field) {
            if ($value = $fc_wrapper->{$field}->value()) {
              $author[$k] = $value;
            }
          }
          if (!empty($author)) {
            $citation['authors'][] = $author;
          }
        }
        if (!empty($citation['id'])) {
          $id = $citation['id'];
          unset($citation['id']);
          $citations[$id] = $citation;
        }
      }
    }

    return $citations;
  }

  /**
   * Validate the doi string.
   *
   * @param string $doi
   *   DOI.
   *
   * @return bool
   *   TRUE if valid.
   */
  public static function validateDoi($doi) {
    $pattern = '/^' . preg_quote(self::DOI_PREFIX, '/') . '[0-9]{5}(\.[0-9]+)?$/';
    $match = preg_match($pattern, $doi);
    if (empty($match)) {
      return FALSE;
    }

    return TRUE;
  }

  /**
   * Clean the title.
   *
   * @param string $title
   *   Title to clean.
   *
   * @return string
   *   Clean title.
   */
  public static function cleanTitle($title) {
    $title = self::unicodeFix($title, 'replace');

    $title = trim($title);
    $title = strip_tags($title);
    $title = htmlspecialchars_decode($title);

    $title = str_replace("\n", ' ', $title);
    $title = str_replace("  ", ' ', $title);

    if (mb_strlen($title) > 255) {
      // @todo - elife - nlisgo - Trim on word boundary.
      $title = mb_substr($title, 0, 254) . '…';
    }
    return $title;
  }

  /**
   * Evaluates whether a string needs unicode replacement.
   *
   * This is useful for drupal titles, which can't store html.
   *
   * Some titles have 4 byte unicode chars. Need to make sure those get removed
   * because the load will crash because the title field encoding is utf8. For a
   * thorough explanation see below link.
   *
   * @see https://drupal.org/node/1314214
   * @see http://magp.ie/2011/01/06/remove-non-utf8-characters-from-string-with-php/
   *
   * @param string $string
   *   the text to evaluate
   * @param string $action
   *   whether to return a replaced string or just check if needed
   *
   * @return boolean/string
   *   returns either TRUE/FALSE on 'check' or modified string on 'replace'
   */
  public static function unicodeFix($string, $action = 'replace') {
    $pattern_2byte = '/[\x00-\x08\x10\x0B\x0C\x0E-\x19\x7F]|[\x00-\x7F][\x80-\xBF]+|([\xC0\xC1]|[\xF0-\xFF])[\x80-\xBF]*|[\xC2-\xDF]((?![\x80-\xBF])|[\x80-\xBF]{2,})|[\xE0-\xEF](([\x80-\xBF](?![\x80-\xBF]))|(?![\x80-\xBF]{2})|[\x80-\xBF]{3,})/S';

    $pattern_3byte = '/\xE0[\x80-\x9F][\x80-\xBF]|\xED[\xA0-\xBF][\x80-\xBF]/S';

    switch ($action) {
      case 'check':
        // Check for overly long 2 byte sequences, as well as characters above
        // U+10000.
        $two_byte = preg_match($pattern_2byte, $string);

        // Reject overly long 3 byte sequences and UTF-16 surrogates.
        $three_byte = preg_match($pattern_3byte, $string);

        $has_replacement = FALSE;
        if ($two_byte == 1 || $three_byte == 1) {
          $has_replacement = TRUE;
        }
        $output = $has_replacement;
        break;

      default:
        // Check for overly long 2 byte sequences, as well as characters above
        // U+10000 and replace with ?.
        $string = preg_replace($pattern_2byte, '?', $string);

        // Reject overly long 3 byte sequences and UTF-16 surrogates and replace
        // with ?.
        $output = preg_replace($pattern_3byte, '?', $string);
        break;
    }

    return $output;
  }

  /**
   * Process all unverified related articles.
   *
   * @return array
   *   Results of query
   *
   * @throws \EntityMetadataWrapperException
   */
  public static function processUnverifiedRelatedArticles() {
    $results = self::retrieveRelatedArticles(FALSE);

    if (!empty($results)) {
      foreach ($results as $item_id => $result) {
        if ($fc_item = field_collection_item_load($item_id)) {
          /* @var EntityDrupalWrapper $fc_wrapper */
          $fc_wrapper = entity_metadata_wrapper('field_collection_item', $fc_item);
          $fc_wrapper->field_elife_a_rel_article_ref->set($result->entity_id);
          $fc_wrapper->save();
        }
      }
    }

    return $results;
  }

  /**
   * Retrieve related articles.
   *
   * @param bool $verified
   *   Flag set to TRUE if we want verified only, FALSE if we want unverified.
   *
   * @return array
   *   Results of query
   *
   * @throws \EntityMetadataWrapperException
   */
  public static function retrieveRelatedArticles($verified = TRUE) {
    $results = array();

    $query = db_select('field_collection_item', 'fc');
    $query->condition('fc.field_name', 'field_elife_a_related_articles');
    $query->fields('fc', array('item_id'));
    $query->fields('ver', array('entity_id'));
    $query->leftJoin('field_data_field_elife_a_doi', 'doi', "doi.entity_type = 'field_collection_item' AND doi.entity_id = fc.item_id");
    $query->leftJoin('field_data_field_elife_a_rel_article_ref', 'ref', "ref.entity_type = 'field_collection_item' AND ref.entity_id = fc.item_id");
    $query->leftJoin('field_data_field_elife_a_doi', 'doi_dest', "doi_dest.entity_type = 'node' AND doi_dest.field_elife_a_doi_value = doi.field_elife_a_doi_value");
    $query->leftJoin('field_data_field_elife_a_versions', 'ver', 'ver.field_elife_a_versions_target_id = doi_dest.entity_id');

    if ($verified) {
      $query->where('ref.field_elife_a_rel_article_ref_target_id = ver.entity_id');
    }
    else {
      $db_or = db_or();
      $db_or->where('ref.field_elife_a_rel_article_ref_target_id != ver.entity_id');
      $db_or->isNull('ref.field_elife_a_rel_article_ref_target_id');
      $query->condition($db_or);
    }

    if ($query_results = $query->execute()->fetchAllAssoc('item_id')) {
      $results = $query_results;
    }

    return $results;
  }
}