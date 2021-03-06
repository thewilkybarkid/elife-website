<?php
/**
 * @file
 * elife_annual_reports.default_field_validation_rules.inc
 */

/**
 * Implements hook_default_field_validation_rule().
 */
function elife_annual_reports_default_field_validation_rule() {
  $export = array();

  $rule = new stdClass();
  $rule->disabled = FALSE; /* Edit this to true to make a default rule disabled initially */
  $rule->api_version = 2;
  $rule->rulename = 'Embed HTTPS only';
  $rule->name = 'elife_ar_text_https';
  $rule->field_name = 'field_elife_ar_text';
  $rule->col = 'value';
  $rule->entity_type = 'node';
  $rule->bundle = 'elife_annual_report';
  $rule->validator = 'field_validation_regex_validator';
  $rule->settings = array(
    'data' => '^((?!src=("|\')http://).)*$',
    'bypass' => 0,
    'roles' => array(
      1 => 0,
      2 => 0,
      15 => 0,
      12 => 0,
      9 => 0,
    ),
    'errors' => 0,
    'condition' => 0,
    'condition_wrapper' => array(
      'condition_field' => '',
      'condition_operator' => 'equals',
      'condition_value' => '',
    ),
  );
  $rule->error_message = 'Embedded objects must be HTTPS';
  $export['elife_ar_text_https'] = $rule;

  return $export;
}
