angular.module('app', ['minicolors', 'ui.bootstrap', 'hljs'])
.controller('ColorCtrl', function($scope) {
  $scope.colorInput = '#2c3338';
  $scope.colorInput_1 = '#ffffff';
  $scope.colorInput_2 = '#ff7510';
  $scope.colors = {
    primary: '',
    primaryLighten: '',
    primaryLighten2: '',
    primaryDarken: '',
    primaryDarken2: '',
    complement: '',
    complementLighten: '',
    complementLighten2: '',
    complementDarken: '',
    complementDarken2: ''
  };
  $scope.code = {
    scss: '',
    sass: '',
    less: '',
    css: ''
  };
  $scope.colorType = 'hex';
  $scope.hexCase = 'lower';

  $scope.$watch('colorInput', function() {
    $scope.updateColors();
  });

  $scope.getColor = function(element) {
    return $scope.convertColor(angular.element('.box.' + element).css('background-color'), 'rgb');
  }
  
  $scope.convertColor = function(color, colorType) {
    var convertedColor = color;
    if (colorType != $scope.colorType) {
      if (colorType == 'rgb') { convertedColor = $scope.rgb2hex(color); }
      if (colorType == 'hex') { convertedColor = $scope.hex2rgb(color); }
    }
    if ($scope.colorType == 'hex' && $scope.hexCase == 'upper') {
      convertedColor = convertedColor.toUpperCase();
    }
    return convertedColor;
  }
  
  $scope.toggleColorType = function() {
    $scope.colorType = ($scope.colorType == 'hex' ? 'rgb' : 'hex');
    $scope.updateColors();
  }
  
  $scope.toggleHexCase = function() {
    $scope.hexCase = ($scope.hexCase == 'lower' ? 'upper' : 'lower');
    $scope.updateColors();
  }
  
  $scope.rgb2hex = function(rgb) {
    rgb = /^rgb[a]?\(([\d]+)[ \n]*,[ \n]*([\d]+)[ \n]*,[ \n]*([\d]+)[ \n]*,?[ \n]*([.\d]+)?[ \n]*\)$/i.exec(rgb);
    var r = parseInt(rgb[1]),
        g = parseInt(rgb[2]),
        b = parseInt(rgb[3]);
    var componentToHex = function(c) {
      var hex = c.toString(16);
      return hex.length == 1 ? "0" + hex : hex;
    }
    return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
  };
  
  $scope.hex2rgb = function(hex) {
    hex = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    var r = parseInt(hex[1], 16),
        g = parseInt(hex[2], 16),
        b = parseInt(hex[3], 16);
    return 'rgb(' + r + ', ' + g + ', ' + b + ')';
  }
  
  $scope.updateColors = function() {
    $scope.colors.primary = $scope.convertColor($scope.colorInput, 'hex');
    
    $scope.code.scss = '$primary-color:             ' + $scope.colors.primary + ';\n$primary-lighten-color:     lighten($primary-color, 15%);\n$primary-lighten2-color:    lighten($primary-color, 25%);\n$primary-darken-color:      darken($primary-color, 15%);\n$primary-darken2-color:     darken($primary-color, 25%);\n$complement-color:          complement($primary-color);\n$complement-lighten-color:  lighten(complement($primary-color), 10%);\n$complement-lighten2-color: lighten(complement($primary-color), 15%);\n$complement-darken-color:   darken(complement($primary-color), 10%);\n$complement-darken2-color:  darken(complement($primary-color), 15%);\n.primary             { background: $primary-color;             }\n.primary-lighten     { background: $primary-lighten-color;     }\n.primary-lighten2    { background: $primary-lighten2-color;    }\n.primary-darken      { background: $primary-darken-color;      }\n.primary-darken2     { background: $primary-darken2-color;     }\n.complement          { background: $complement-color;          }\n.complement-lighten  { background: $complement-lighten-color;  }\n.complement-lighten2 { background: $complement-lighten2-color; }\n.complement-darken   { background: $complement-darken-color;   }\n.complement-darken2  { background: $complement-darken2-color;  }';
    var compiledCss = Sass.compile($scope.code.scss);
    
    angular.element('.styles').html(angular.element('<style type="text/css">' + compiledCss + '</style>'));
    
    $scope.colors = {
      primary: $scope.colors.primary,
      primaryLighten: $scope.getColor('primary-lighten'),
      primaryLighten2: $scope.getColor('primary-lighten2'),
      primaryDarken: $scope.getColor('primary-darken'),
      primaryDarken2: $scope.getColor('primary-darken2'),
      complement: $scope.getColor('complement'),
      complementLighten: $scope.getColor('complement-lighten'),
      complementLighten2: $scope.getColor('complement-lighten2'),
      complementDarken: $scope.getColor('complement-darken'),
      complementDarken2: $scope.getColor('complement-darken2')
    };
    
    $scope.code.sass = '$primary-color:             ' + $scope.colors.primary + '\n$primary-lighten-color:     lighten($primary-color, 15%)\n$primary-lighten2-color:    lighten($primary-color, 25%)\n$primary-darken-color:      darken($primary-color, 15%)\n$primary-darken2-color:     darken($primary-color, 25%)\n$complement-color:          complement($primary-color)\n$complement-lighten-color:  lighten(complement($primary-color), 10%)\n$complement-lighten2-color: lighten(complement($primary-color), 15%)\n$complement-darken-color:   darken(complement($primary-color), 10%)\n$complement-darken2-color:  darken(complement($primary-color), 15%)\n.primary\n  background: $primary-color\n.primary-lighten\n  background: $primary-lighten-color\n.primary-lighten2\n  background: $primary-lighten2-color\n.primary-darken\n  background: $primary-darken-color\n.primary-darken2\n  background: $primary-darken2-color\n.complement\n  background: $complement-color\n.complement-lighten\n  background: $complement-lighten-color\n.complement-lighten2\n  background: $complement-lighten2-color\n.complement-darken\n  background: $complement-darken-color\n.complement-darken2\n  background: $complement-darken2-color';
    $scope.code.less = '@primary-color:             ' + $scope.colors.primary + ';\n@primary-lighten-color:     lighten(@primary-color, 15%);\n@primary-lighten2-color:    lighten(@primary-color, 25%);\n@primary-darken-color:      darken(@primary-color, 15%);\n@primary-darken2-color:     darken(@primary-color, 25%);\n@complement-color:          spin(@primary-color, 180);\n@complement-lighten-color:  lighten(spin(@primary-color, 180), 10%);\n@complement-lighten2-color: lighten(spin(@primary-color, 180), 15%);\n@complement-darken-color:   darken(spin(@primary-color, 180), 10%);\n@complement-darken2-color:  darken(spin(@primary-color, 180), 15%);\n.primary             { background: @primary-color;             }\n.primary-lighten     { background: @primary-lighten-color;     }\n.primary-lighten2    { background: @primary-lighten2-color;    }\n.primary-darken      { background: @primary-darken-color;      }\n.primary-darken2     { background: @primary-darken2-color;     }\n.complement          { background: @complement-color;          }\n.complement-lighten  { background: @complement-lighten-color;  }\n.complement-lighten2 { background: @complement-lighten2-color; }\n.complement-darken   { background: @complement-darken-color;   }\n.complement-darken2  { background: @complement-darken2-color;  }';
    $scope.code.css = '.primary             { background: ' + $scope.colors.primary + '; }\n.primary-lighten     { background: ' + $scope.colors.primaryLighten + '; }\n.primary2-lighten    { background: ' + $scope.colors.primaryLighten2 + '; }\n.primary-darken      { background: ' + $scope.colors.primaryDarken + '; }\n.primary2-darken     { background: ' + $scope.colors.primaryDarken2 + '; }\n.complement          { background: ' + $scope.colors.complement + '; }\n.complement-lighten  { background: ' + $scope.colors.complementLighten + '; }\n.complement-lighten2 { background: ' + $scope.colors.complementLighten2 + '; }\n.complement-darken   { background: ' + $scope.colors.complementDarken + '; }\n.complement-darken2  { background: ' + $scope.colors.complementDarken2 + '; }';
  }
});