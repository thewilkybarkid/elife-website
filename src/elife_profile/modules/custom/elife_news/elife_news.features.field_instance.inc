<?php
/**
 * @file
 * elife_news.features.field_instance.inc
 */

/**
 * Implements hook_field_default_field_instances().
 */
function elife_news_field_default_field_instances() {
  $field_instances = array();

  // Exported field_instance:
  // 'node-elife_news_article-field_elife_n_attachments'.
  $field_instances['node-elife_news_article-field_elife_n_attachments'] = array(
    'bundle' => 'elife_news_article',
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'file',
        'settings' => array(),
        'type' => 'file_default',
        'weight' => 3,
      ),
      'elife_teaser_compact' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 3,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'node',
    'field_name' => 'field_elife_n_attachments',
    'label' => 'Attachments',
    'required' => 0,
    'settings' => array(
      'description_field' => 0,
      'file_directory' => 'news',
      'file_extensions' => 'pdf pptx',
      'max_filesize' => '',
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'file',
      'settings' => array(
        'caption_from_title' => 1,
        'insert' => 1,
        'insert_absolute' => 0,
        'insert_class' => '',
        'insert_default' => 'auto',
        'insert_styles' => array(
          'auto' => 'auto',
          'icon_link' => 0,
          'image' => 0,
          'image_elife_cover' => 0,
          'image_elife_cover_mcr' => 0,
          'image_elife_cover_sml' => 0,
          'image_elife_front_matter' => 0,
          'image_elife_hero_block' => 0,
          'image_elife_hero_block_teaser' => 0,
          'image_elife_person_profile' => 0,
          'image_elife_person_square' => 0,
          'image_elife_striking_image' => 0,
          'image_focal_point_preview' => 0,
          'image_large' => 0,
          'image_medium' => 0,
          'image_thumbnail' => 0,
          'link' => 0,
        ),
        'insert_width' => '',
        'progress_indicator' => 'throbber',
      ),
      'type' => 'file_generic',
      'weight' => 4,
    ),
  );

  // Exported field_instance: 'node-elife_news_article-field_elife_n_category'.
  $field_instances['node-elife_news_article-field_elife_n_category'] = array(
    'bundle' => 'elife_news_article',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'taxonomy',
        'settings' => array(),
        'type' => 'taxonomy_term_reference_link',
        'weight' => 1,
      ),
      'elife_teaser_compact' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 1,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 6,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'node',
    'field_name' => 'field_elife_n_category',
    'label' => 'Category',
    'required' => 0,
    'settings' => array(
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'options',
      'settings' => array(),
      'type' => 'options_buttons',
      'weight' => 2,
    ),
  );

  // Exported field_instance: 'node-elife_news_article-field_elife_n_images'.
  $field_instances['node-elife_news_article-field_elife_n_images'] = array(
    'bundle' => 'elife_news_article',
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'image',
        'settings' => array(
          'class' => '',
          'image_link' => '',
          'image_style' => '',
        ),
        'type' => 'image',
        'weight' => 2,
      ),
      'elife_teaser_compact' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 2,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'node',
    'field_name' => 'field_elife_n_images',
    'label' => 'Images',
    'required' => 0,
    'settings' => array(
      'alt_field' => 0,
      'default_image' => 0,
      'file_directory' => 'news',
      'file_extensions' => 'png gif jpg jpeg',
      'max_filesize' => '',
      'max_resolution' => '',
      'min_resolution' => '',
      'title_field' => 0,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'image',
      'settings' => array(
        'caption_from_title' => 1,
        'insert' => 1,
        'insert_absolute' => 0,
        'insert_class' => '',
        'insert_default' => 'auto',
        'insert_styles' => array(
          'auto' => 'auto',
          'icon_link' => 0,
          'image' => 0,
          'image_elife_cover' => 0,
          'image_elife_cover_mcr' => 0,
          'image_elife_cover_sml' => 0,
          'image_elife_front_matter' => 0,
          'image_elife_hero_block' => 0,
          'image_elife_hero_block_teaser' => 0,
          'image_elife_person_profile' => 0,
          'image_elife_person_square' => 0,
          'image_elife_striking_image' => 0,
          'image_focal_point_preview' => 0,
          'image_large' => 0,
          'image_medium' => 0,
          'image_thumbnail' => 0,
          'link' => 0,
        ),
        'insert_width' => '',
        'preview_image_style' => 'thumbnail',
        'progress_indicator' => 'throbber',
      ),
      'type' => 'image_image',
      'weight' => 3,
    ),
  );

  // Exported field_instance: 'node-elife_news_article-field_elife_n_text'.
  $field_instances['node-elife_news_article-field_elife_n_text'] = array(
    'bundle' => 'elife_news_article',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'hidden',
        'module' => 'text',
        'settings' => array(),
        'type' => 'text_default',
        'weight' => 0,
      ),
      'elife_teaser_compact' => array(
        'label' => 'hidden',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 10,
      ),
      'teaser' => array(
        'label' => 'hidden',
        'module' => 'smart_trim',
        'settings' => array(
          'more_link' => 0,
          'more_text' => 'Read more',
          'summary_handler' => 'full',
          'trim_class' => '',
          'trim_length' => 600,
          'trim_link' => 0,
          'trim_options' => array(
            'text' => 'text',
          ),
          'trim_preserve_tags' => '',
          'trim_style' => 'p',
          'trim_suffix' => '...',
          'trim_type' => 'chars',
        ),
        'type' => 'smart_trim_format',
        'weight' => 2,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'node',
    'field_name' => 'field_elife_n_text',
    'label' => 'Text',
    'required' => 1,
    'settings' => array(
      'better_formats' => array(
        'allowed_formats' => array(
          'elife_full_html' => 'elife_full_html',
          'plain_text' => 0,
        ),
        'allowed_formats_toggle' => 1,
        'default_order_toggle' => 0,
        'default_order_wrapper' => array(
          'formats' => array(
            'elife_full_html' => array(
              'weight' => 0,
            ),
            'plain_text' => array(
              'weight' => 10,
            ),
          ),
        ),
      ),
      'display_summary' => 1,
      'text_processing' => 1,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'text',
      'settings' => array(
        'label_help_description' => '',
        'rows' => 20,
        'summary_rows' => 5,
      ),
      'type' => 'text_textarea_with_summary',
      'weight' => 1,
    ),
  );

  // Exported field_instance: 'node-elife_news_article-field_elife_title'.
  $field_instances['node-elife_news_article-field_elife_title'] = array(
    'bundle' => 'elife_news_article',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'text',
        'settings' => array(),
        'type' => 'text_default',
        'weight' => 4,
      ),
      'elife_teaser_compact' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 4,
      ),
      'teaser' => array(
        'label' => 'hidden',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'node',
    'field_name' => 'field_elife_title',
    'label' => 'Title',
    'required' => 1,
    'settings' => array(
      'better_formats' => array(
        'allowed_formats' => array(
          'elife_full_html' => 0,
          'elife_house_style' => 'elife_house_style',
          'plain_text' => 0,
        ),
        'allowed_formats_toggle' => 1,
        'default_order_toggle' => 0,
        'default_order_wrapper' => array(
          'formats' => array(
            'elife_full_html' => array(
              'weight' => 0,
            ),
            'elife_house_style' => array(
              'weight' => 0,
            ),
            'plain_text' => array(
              'weight' => 10,
            ),
          ),
        ),
      ),
      'text_processing' => 1,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'text',
      'settings' => array(
        'label_help_description' => '',
        'size' => 60,
      ),
      'type' => 'text_textfield',
      'weight' => 0,
    ),
  );

  // Exported field_instance:
  // 'taxonomy_term-elife_n_category-field_elife_title'.
  $field_instances['taxonomy_term-elife_n_category-field_elife_title'] = array(
    'bundle' => 'elife_n_category',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => '',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'ds_extras_field_template' => '',
    'entity_type' => 'taxonomy_term',
    'field_name' => 'field_elife_title',
    'label' => 'Title',
    'required' => 1,
    'settings' => array(
      'better_formats' => array(
        'allowed_formats' => array(
          'elife_full_html' => 0,
          'elife_house_style' => 'elife_house_style',
          'plain_text' => 0,
        ),
        'allowed_formats_toggle' => 1,
        'default_order_toggle' => 0,
        'default_order_wrapper' => array(
          'formats' => array(
            'elife_full_html' => array(
              'weight' => 0,
            ),
            'elife_house_style' => array(
              'weight' => 0,
            ),
            'plain_text' => array(
              'weight' => 10,
            ),
          ),
        ),
      ),
      'text_processing' => 1,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'text',
      'settings' => array(
        'label_help_description' => '',
        'size' => 60,
      ),
      'type' => 'text_textfield',
      'weight' => -5,
    ),
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('Attachments');
  t('Category');
  t('Images');
  t('Text');
  t('Title');

  return $field_instances;
}
