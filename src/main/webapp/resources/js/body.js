$(window).on('load resize', function() {
    var imgWidth = $('img').width();
    var imgHeight = $('img').height();
    var map = $('map');
    var areas = map.find('area');
    
    areas.each(function() {
      var coords = $(this).attr('coords').split(',');
      for (var i = 0; i < coords.length; i++) {
        coords[i] = Math.round((coords[i] / imgWidth) * 1000) / 10 + '%';
        i++;
        coords[i] = Math.round((coords[i] / imgHeight) * 1000) / 10 + '%';
      }
      $(this).attr('coords', coords.join(','));
    });
  });