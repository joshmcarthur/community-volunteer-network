/* globals jQuery */
import 'selectize';

jQuery(document).on('document:ready turbolinks:load', () => {
  jQuery('[data-selectize]').each((_index, el) => {
    let $el = jQuery(el);
    let options = $el.data('selectize') || {};
    $el.selectize(options);
  });
});
