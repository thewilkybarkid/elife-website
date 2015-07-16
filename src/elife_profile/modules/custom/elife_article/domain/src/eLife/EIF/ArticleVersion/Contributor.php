<?php

namespace eLife\EIF\ArticleVersion;

use JMS\Serializer\Annotation as Serializer;

abstract class Contributor {
  /**
   * @var string
   *
   * @Serializer\Type("string")
   */
  private $type;

  /**
   * @var string
   *
   * @Serializer\Type("string")
   */
  private $corresp = 'no';

  /**
   * @var string|null
   *
   * @Serializer\Type("string")
   */
  private $id;

  /**
   * @var string|null
   *
   * @Serializer\Type("string")
   * @Serializer\SerializedName("group-author-key")
   */
  private $group_author_key;

  /**
   * @var array
   *
   * @Serializer\Type("array<string,array<string>>")
   */
  private $references = array();

  /**
   * @param string $type
   * @param boolean $corresp
   * @param string|null $id
   * @param string $group_author_key
   * @param array $references
   */
  public function __construct(
    $type,
    $corresp,
    $id,
    $group_author_key,
    array $references
  ) {
    $this->type = (string) $type;
    $this->corresp = ($corresp ? 'yes' : 'no');
    $this->id = $id;
    $this->group_author_key = $group_author_key;
    $this->references = $references;
  }

  final public function getType() {
    return $this->type;
  }

  final public function isCorresp() {
    return $this->corresp === 'yes';
  }

  final public function getId() {
    return $this->id;
  }

  final public function getGroupAuthorKey() {
    return $this->group_author_key;
  }

  final public function getReferences() {
    return $this->references;
  }
}