/* globals jQuery */
import 'selectize';

jQuery(() => {
  jQuery('[data-selectize]').each((_index, el) => {
    let $el = jQuery(el);
    let options = $el.data('selectize') || {};
    $el.selectize(options);
  });
});
