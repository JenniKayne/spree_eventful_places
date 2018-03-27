jQuery(document).on('ready page:change', function() {
    var datetimefields = jQuery('.datetimepicker');
    var lang = datetimefields.attr('lang') || datetimefields.parents('[lang]').attr('lang')
    datetimefields.each(function() {
      var date = new Date(this.value.substr(0, this.value.lastIndexOf(" ")));
      var month = ("0" + (date.getMonth() + 1)).slice(-2);
      var day = ("0" + date.getDate()).slice(-2);
      var hours = ("0" + date.getHours()).slice(-2);
      var minutes = ("0" + date.getMinutes()).slice(-2);
      $(this).datetimepicker({
        format: 'Y-m-d H:i:s',
        lang: lang,
        defaultDate: date.getFullYear() + '/' + month + '/' + day,
        defaultTime: hours + ':' + minutes
      });
    });
});
