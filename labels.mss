@text_font_transport: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_shield: 'PT Sans Bold', 'Unifont Medium';
@text_font_administrative: 'PT Sans Bold', 'Unifont Medium';
@text_font_city: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_parks: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_italic: 'PT Sans Italic', 'Unifont Medium';
@text_font_bold_italic: 'PT Sans Bold Italic', 'Unifont Medium';

@label_color_transport: #524c4c;
@label_color_shield: #fff;
@label_color_shield_fed: #333; // 80 K
@label_color_administrative: #2e2115; //
@label_color_city: #2e2115;

@text_font_size_xxsm: 12;
@text_font_size_xsm: 14;
@text_font_size_sm: 15;
@text_font_size_medium: 17;
@text_font_size_medium_plus: 18;
@text_font_size_large: 20;
@text_font_size_xlg: 24;
@text_font_size_xxlg: 34;

@text_character_spacing_sm: 0.7;
@text_character_spacing_md: 1.2;
@text_character_spacing_lg: 1.7;
@text_character_spacing_xlg: 2.2;

@text_font_halo_radius_xsm: 1;
@text_font_halo_radius_sm: 1.5;
@text_font_halo_radius_md: 1.75;
@text_font_halo_radius_large: 2;

@label_color_halo_low: fadeout(rgba(255,255,255,0.7), 30%);
@label_color_halo_high: fadeout(rgba(255,255,255,1), 30%);
@label_color_administrative_halo: fadeout(#fff, 30%);
@label_color_physical: #000;
@label_color_physical_halo: fadeout(@color_physical,30%);
@label_color_transport_halo: desaturate(#F7F7E6,50%);
@label_color_airport_halo: #f7f7e6;
@label_color_places_halo_low: fadeout(rgba(255,255,255, 1), 30%);
@label_color_places_halo_high: fadeout(rgba(255,255,255, 1), 30%);

@label_color_green_area: #374c30; 
@label_color_green_area_halo: #dee0be; // same as @color_physical, the land background
@label_color_water: darken(@color_water,20);
@label_color_water_halo: @color_water;

Map {
  font-directory: url("fonts/");
  buffer-size: 128;
}

#mountain_peaks_ne {
    [zoom>=6][comment =~'.*Highest.*'],
    [zoom>=6][comment =~'.*highest.*'],
    [zoom>=6][name =~'.*Vinson.*'],
    [zoom>=7][elevation>=2000],
    [zoom>=8][elevation>=1500],
    [zoom>=9][elevation>=1000],
    [zoom>=10][elevation>=500],
    [zoom>=11][elevation>0] {
      shield-name: [name] + '\n' + [elevation] + 'm';
      shield-face-name: @text_font_italic;
      shield-size: @text_font_size_xxsm;
      shield-file: url('icons/triangle-18.svg');
      shield-transform: scale(0.5,0.5);
      shield-unlock-image: true;
      shield-avoid-edges: true;
      shield-fill: @label_color_physical;
      shield-halo-fill: @label_color_physical_halo;
      shield-halo-radius: 1;
      shield-min-distance: 2;
      shield-placement-type: simple;
      shield-placements: 'NW,SE,N,S,E,W,NE,SW';
      shield-text-dy: 5;
      shield-text-dx: 5;
      shield-min-distance: 1000;
      shield-wrap-width: 80;
      shield-line-spacing: -2;

      [comment =~'.*Highest.*'],
      [comment =~'.*highest.*'],
      [name =~'.*Vinson.*'] {
        shield-file: url('icons/triangle-18.svg');
        shield-face-name: @text_font_bold_italic; // special call out to the tallest peaks on each continent!
        shield-transform: scale(0.65,0.65);
      }

      [zoom>=8] {
        shield-file: url('icons/triangle-18.svg');
        shield-size: @text_font_size_xsm;
      }

      [zoom>=10] {
        shield-file: url('icons/triangle-18.svg');
        shield-size: @text_font_size_sm;
        shield-transform: scale(0.8,0.8);
        shield-text-dy: 7;
        shield-text-dx: 7;
      }

      // replace McKinley with Denali (not the dryest solution but TileMill is being weird...)
      [zoom>=6][zoom<=18][name=~'.*McKinley'] {
          shield-name: "Denali" + '\n'  + [elevation] + 'm';
          shield-face-name: @text_font_bold_italic;
          shield-size: @text_font_size_xxsm;
          shield-file: url('icons/triangle-18.svg');
          shield-transform: scale(0.5,0.5);
          shield-unlock-image: true;
          shield-avoid-edges: true;
          shield-fill: @label_color_physical;
          shield-halo-fill: @label_color_physical_halo;
          shield-halo-radius: 1;
          shield-min-distance: 2;
          shield-placement-type: simple;
          shield-placements: 'NW,SE,N,S,E,W,NE,SW';
          shield-text-dy: 5;
          shield-text-dx: 5;
          shield-min-distance: 1000;
          shield-wrap-width: 30;
          shield-line-spacing: -2;

          [zoom>=8] {
            shield-size: @text_font_size_xsm;
          }

          [zoom>=10] {
            shield-size: @text_font_size_sm;
            shield-transform: scale(0.8,0.8);
            shield-text-dy: 7;
            shield-text-dx: 7;
          }
       }
    }
}

#minor_road_labels,
#major_road_labels,
{
  text-name: [name];
  text-face-name: @text_font_transport;
  text-placement: line;
  text-label-position-tolerance: 2;
  text-max-char-angle-delta: 20;
  text-min-path-length: 30;
  text-fill: #444;
  text-spacing: 256;
  text-min-distance: 5;
  text-character-spacing: @text_character_spacing_sm;
  text-avoid-edges: true;
  text-halo-fill: @label_color_transport_halo;
  text-halo-radius: @text_font_halo_radius_md;

  [kind='major_road'] {
    text-size: @text_font_size_xxsm;  
  }  

  [zoom>=13] {
    text-size: @text_font_size_xxsm;
    
    [kind='major_road'] {
      text-size: @text_font_size_xxsm * 1.2;  
    }
  }

  [zoom>=14] {
    text-min-distance: 10;
    text-size: @text_font_size_sm;
    text-character-spacing: @text_character_spacing_md;
    text-halo-radius: @text_font_halo_radius_large;
    
    [kind='major_road'] {
      text-size: @text_font_size_sm * 1.2;  
    }    
  }

  [zoom>=16]{
    text-min-distance: 100;
    text-character-spacing: @text_character_spacing_lg;
  }
}

#highway_shields {
  [zoom>=11],
  [highway='motorway'],
  [highway='trunk'],
  [highway='primary'] {
    [ref_length>0][ref_length<8] {
      // default rectangle shield
      shield-fill: @label_color_shield_fed;
      shield-transform: scale(1.1,1.1);
      shield-face-name: @text_font_shield;
      shield-name: [ref];
      shield-size: 10;
      shield-min-distance: 60;
      shield-spacing: 60;
      // half the width of the shield to prevent from wrapping
      shield-min-padding: 10;
      shield-file: url(shields/default-rg.svg);  

      [priority=4] {
        [ref_length>6][ref_length<8] {
          shield-file: url(shields/default-lg.svg);
        }
        [ref_length<=4][ref_length>=3] {
          shield-file: url(shields/default-sm.svg);
        }
        [ref_length<3][ref_length>0] {
          shield-file: url(shields/default-xsm.svg); 
        }
      }

      // hide state shields at lower zooms
      [zoom>=11][zoom<=12][highway='trunk'],
      [zoom>=11][zoom<=12][highway='primary'],
      [zoom>=11][zoom<=12][highway='secondary'],
      [zoom>=11][zoom<=12][highway='tertiary'] {
        shield-opacity: 0;
        shield-size: 0;
      }

      [ref=~'I \d+'] {
        shield-file: url(shields/interstate_2.svg);
        shield-transform: scale(0.033, 0.033);
        shield-fill: @label_color_shield;
        shield-size: 9;
        shield-name: "[ref].replace('I ', '')";

        [zoom>=13] {
          shield-size: 11;
          shield-transform: scale(0.038, 0.038);
          shield-min-distance: 65;
        }

        [zoom>=15] {
          shield-size: 13;
          shield-transform: scale(0.045, 0.045);
        }

        [zoom>=17] {
          shield-size: 15;
          shield-transform: scale(0.05, 0.05);
        }      
      }

      [ref=~'I \d{3,}'] {
        shield-file: url(shields/interstate_3.svg);
        shield-transform: scale(0.033, 0.033);
        shield-fill: @label_color_shield;
        shield-size: 9;
        shield-name: "[ref].replace('I ', '')";

        [zoom>=13] {
          shield-size: 11;
          shield-transform: scale(0.038, 0.038);
          shield-min-distance: 65;
        }

        [zoom>=15] {
          shield-size: 13;
          shield-transform: scale(0.045, 0.045);
        }

        [zoom>=17] {
          shield-size: 13;
          shield-transform: scale(0.05, 0.05);
        }         
      }

      [ref=~'US \d+'] {
        shield-file: url(shields/us.svg);
        shield-transform: scale(0.062, 0.062);
        shield-size: 10;
        shield-name: "[ref].replace('US ', '')";
        shield-fill: @label_color_shield_fed;
        shield-text-dy: 1;
        shield-character-spacing: -1;

        [zoom>=13] {
          shield-size: 12;
          shield-transform: scale(0.075, 0.075);
        }

        [zoom>=15] {
          shield-size: 14;
          shield-transform: scale(0.088, 0.088);
        }

        [zoom>=17] {
          shield-size: 16;
          shield-transform: scale(0.091, 0.091);
        }         
      }

      [ref=~'CA \d+'] {
        shield-file: url(shields/ca.svg);
        shield-fill: @label_color_shield;
        shield-transform: scale(0.052, 0.052);
        shield-size: 10;
        shield-name: "[ref].replace('CA ', '')";
        shield-dy: -2.5;
        shield-character-spacing: -1;

        [zoom>=11][zoom<=12][highway='trunk'],
        [zoom>=11][zoom<=12][highway='primary'],
        [zoom>=11][zoom<=12][highway='secondary'],
        [zoom>=11][zoom<=12][highway='tertiary'] {
          shield-opacity: 0;
          shield-size: 0;
        }     

        [zoom>=13] {
          shield-size: 12;
          shield-transform: scale(0.060, 0.060);
          shield-min-distance: 70;
        }

        [zoom>=14] {
          shield-min-distance: 80;
        }

        [zoom>=15] {
          shield-size: 14;
          shield-transform: scale(0.080, 0.080);
          shield-dy: -3.5;
        }

        [zoom>=17] {
          shield-size: 16;
          shield-transform: scale(0.090, 0.090);        
        }       
      }
    }
  }
}

#ne_110m_geography_marine_polys[zoom=2][scalerank=0][changed!=''],
#ne_110m_geography_marine_polys[zoom=3][changed!=''],
#ne_50m_geography_marine_polys[zoom=4][scalerank<4][changed!=''] {
    text-name: [name];
    
    [namealt!=''] {
      text-name: [name] + '\n(' + [namealt] + ')';
    }
    
    text-face-name: @text_font_bold_italic;
    text-wrap-width: 40;
    text-wrap-character: ' ';
    text-size: @text_font_size_sm;
    text-character-spacing: @text_character_spacing_xlg;
    text-align: center;

    text-fill: @label_color_water;
    text-halo-radius: @text_font_halo_radius_xsm;
    text-halo-fill: @label_color_water_halo;
    text-placement: interior;
}

#ne_50m_geography_marine_polys[zoom=5][scalerank<4][changed!=''],
#ne_10m_geography_marine_polys[zoom>=6][zoom<=8][scalerank<7][changed!='']
{
    text-name: [name];

    [namealt!=''] {
      text-name: [name] + '\n(' + [namealt] + ')';
    }

    [name = 'Hecate Straight'] {
      text-name: 'Hecate Strait' + [namealt]; // Becase we know namealt is empty
    }

    [name = 'Queen Charlotte Straight'] {
      text-name: 'Queen Charlotte Strait' + [namealt]; // Becase we know namealt is empty
    }

    text-face-name: @text_font_bold_italic;
    text-wrap-width: 50;
    text-size: @text_font_size_medium;
    text-character-spacing: @text_character_spacing_lg;
    text-fill: @label_color_water;
    text-halo-radius: @text_font_halo_radius_xsm;
    text-halo-fill: @label_color_water_halo;
    text-placement: interior;
    text-align: center;
}

#water-bodies-labels-low,
#water-bodies-labels-med,
#water-bodies-labels-high {
  [zoom=9][area>1000000000],
  [zoom=10][area>100000000],
  [zoom=11][area>25000000],
  [zoom=12][area>5000000],
  [zoom=13][area>2000000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: "[name]";
    text-face-name: @text_font_italic;
    text-placement: interior;
    text-max-char-angle-delta: 30;
    text-wrap-width: 40;
    text-halo-radius: @text_font_halo_radius_large;
    text-fill: @label_color_water;
    text-halo-fill: @label_color_water_halo;
    text-size: @text_font_size_xsm;

    [zoom>9][zoom<12] {
      text-spacing: 200;
      text-wrap-width: 50;
    }
    [zoom=12] {
      text-size: @text_font_size_xsm;
      text-spacing: 200;
      text-wrap-width: 70;
    }
    [zoom=13] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom=14] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom>=15] {
      text-size: @text_font_size_sm;
      text-spacing: 100;
      text-wrap-width: 40;
    }
  }
}

#green-areas-labels-low,
#green-areas-labels-med,
#green-areas-labels-high {
  [zoom=8][area>100000000],
  [zoom=9][area>100000000],
  [zoom=10][area>100000000],
  [zoom=11][area>5000000],
  [zoom=12][area>1000000],
  [zoom=13][area>400000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: [name];
    text-face-name: @text_font_parks;
    text-placement: interior;
    text-wrap-width: 96;
    text-wrap-before: true;
    text-line-spacing: -3;
    text-fill: @label_color_green_area;
    text-size: 15;

    [zoom>=8] {
      text-halo-fill: @label_color_green_area_halo;
      text-halo-radius: @text_font_halo_radius_sm;      
    }

    [zoom>=11] {
      text-fill: #586e50;
      text-halo-radius: @text_font_halo_radius_large;
    }

    [zoom>=15] {
      text-size: 20;
      text-line-spacing: -7;
    }
  }
}

#continents
{
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 32;
  text-size: 24;
  text-line-spacing: -12;
  text-fill: #2e2115;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
}

#admin1-labels {
  // [zoom>=4][scalerank<3],
  [zoom>=5][scalerank<=3][admin!='United States of America'][admin!='Canada'],
  [zoom>=6][scalerank<=5],
  [zoom>=7][scalerank>=6] {
    text-name: [name];
    text-transform: uppercase;
    text-face-name: @text_font_administrative;
    text-fill: #555; //@label_color_administrative;
    text-halo-fill: @label_color_halo_low;
    text-halo-radius: @text_font_halo_radius_sm;
    text-size: @text_font_size_sm * 0.8;
    text-wrap-width: 40;
    text-placement-type: simple;
    text-placements: 'E,N,W,S';
    text-allow-overlap: false;
    text-min-distance: 30;
    text-avoid-edges: true;
    text-min-padding: 5;

    [zoom>=5] {
     text-size: @text_font_size_xsm * 0.8;
     text-character-spacing: 0;
     text-min-distance: 30;
    }

    [zoom>=6] {
      text-size: @text_font_size_xsm * 0.8;
      text-character-spacing: 1;
    }

    [zoom>=7] {
      text-size: @text_font_size_sm * 0.8;
      text-character-spacing: 2;
    }
  }
}

#admin1-labels-50m-z4 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low; 
    text-name: "[label_z4]";
    text-size:  @text_font_size_xsm;
    text-character-spacing: 1;
}

#admin1-labels-50m-z5 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;    
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;
    // text-halo-comp-op: overlay; 
    text-halo-rasterizer: fast;
    text-name: "[label_z5]";
    text-size:  @text_font_size_sm;
    text-character-spacing: 1;
}

// #admin1-labels-50m-z6 {
//     text-face-name: @text_font_administrative;
//     text-wrap-width: 80;
//     text-fill: @label_color_administrative;
//     text-halo-radius: @text_font_halo_radius_sm;
//     text-halo-fill: @label_color_halo_low; 
//     text-name: "[label_z6]";
//     text-size:  @text_font_size_medium;
//     text-character-spacing: 2;
// }

// #admin1-labels-50m-z7 {
//     text-face-name: @text_font_administrative;
//     text-wrap-width: 80;
//     text-fill: @label_color_administrative;
//     text-halo-radius: @text_font_halo_radius_sm;
//     text-halo-fill: @label_color_halo_low; 
//     text-name: "[label_z7]";
//     text-size:  @text_font_size_large;
//     text-character-spacing: 3;
// }

/* Admin 0 labels */

#admin0-labels-z3[longfrom>3] {
    text-name: "[shortname]";
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-wrap-width: 80;
    text-character-spacing: @text_character_spacing_sm;
    text-size: @text_font_size_medium_plus;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;     
    text-fill: @label_color_administrative;
    text-min-distance: 5;
}

#admin0-labels-z3[longfrom<=3] {
    text-name: "[name]";
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-size: @text_font_size_medium_plus;
    text-line-spacing: -8;
    text-wrap-width: 100;
    text-character-spacing: @text_character_spacing_sm;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;
    text-fill: @label_color_administrative;
}

#admin0-labels-z4 {
    text-name: [name];
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-wrap-width: 80;
    text-character-spacing: @text_character_spacing_lg;
    text-size: @text_font_size_large;
    text-min-distance: 15;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;     
    text-fill: @label_color_administrative;
}

#admin0-labels-z5 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-transform: uppercase;
  text-wrap-width: 80;
  text-character-spacing: @text_character_spacing_xlg;
  text-size: @text_font_size_xlg;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
  text-fill: @label_color_administrative;
}

#admin0-labels-z6 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-transform: uppercase;
  text-wrap-width: 80;
  text-character-spacing: @text_character_spacing_xlg;
  text-size: @text_font_size_xxlg;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
  text-fill: @label_color_administrative;
}

/* city labels - using hwy shields */
#aries-places-labels {
  [zoom=4][scalerank<5],
  [zoom=5][scalerank<6],
  [zoom=6][scalerank<7],
  [zoom=7][scalerank<8],
  [zoom=8][scalerank<9],
  [zoom=9][scalerank<9],
  [zoom=9][scalerank=9][population>=10000],
  [zoom=10][scalerank<10],
  [zoom=10][scalerank=10][population>=10000]{

    shield-file: url(shields/circle-12.svg);
    shield-fill: @label_color_city;
    shield-halo-fill: @label_color_halo_low;
    shield-halo-radius: @text_font_halo_radius_sm;
    shield-unlock-image: true;
    shield-avoid-edges: true;
    shield-transform: scale(0.5, 0.5);
    shield-face-name: @text_font_city;
    shield-name: [name];
    shield-min-distance: 2;
    shield-placement-type: simple;
    shield-placements: 'NE,SW,NW,SE,E,W';
    shield-text-dy: 3;
    shield-text-dx: 3;
    shield-min-distance: 40;
    shield-wrap-width: 30;
    shield-line-spacing: -7;

    [zoom>=5]{
      shield-size: @text_font_size_medium;

      [population>700000] {
        shield-size: @text_font_size_medium * 1.2;
        shield-text-dy: 5;
        shield-text-dx: 5;
      }

      [population>7000000] {
        shield-size: @text_font_size_medium * 1.4;
      }
    }

    [zoom>=8] {
      shield-line-spacing: -4;
      shield-halo-radius: @text_font_halo_radius_md;
      shield-transform: scale(0.75, 0.75);
      shield-text-dy: 5;
      shield-text-dx: 5;
    }

    [zoom>=10]{
      shield-size: @text_font_size_medium_plus;
      shield-halo-radius: @text_font_halo_radius_large;
      shield-halo-fill: @label_color_halo_high;
      shield-transform: scale(0.85, 0.85);
      shield-text-dy: 7;
      shield-text-dx: 7;

      [population>100000] {
        shield-size: @text_font_size_medium_plus * 1.2;
        shield-transform: scale(1, 1);
        shield-text-dy: 8;
        shield-text-dx: 8;
      }

      [population>700000] {
        shield-size: @text_font_size_medium_plus * 1.2;
      }

      [population>7000000] {
        shield-size: @text_font_size_medium_plus * 1.4;
      }
    }

  }

  // Switch to text symbolizer instead of shield
  [zoom>=11]{
    text-name: [name];
    text-face-name: @text_font_city;
    text-size: @text_font_size_medium_plus;
    text-fill:  @label_color_city;
    text-halo-fill: @label_color_halo_high;
    text-halo-radius: @text_font_halo_radius_large;
    text-avoid-edges: true;
    text-min-distance: 3;
    text-wrap-width: 20;
    text-line-spacing: -5;
    //text-placement-type: simple;
    //text-placements: 'NE,SW,NW,SE,E,W,N,S';

    [zoom>=11] {
      [population>100000] {
        text-size: @text_font_size_medium_plus * 1.2;
      }

      [population>700000] {
        text-size: @text_font_size_medium_plus * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_medium_plus * 1.4;
      }
    }

    [zoom>=12] {
      text-size: @text_font_size_large;

      [population>100000] {
        text-size: @text_font_size_large * 1.2;
      }

      [population>700000] {
        text-size: @text_font_size_large * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_large * 1.3;
      }
    }

  }
}

#airports {  
  [zoom>=10] {
    text-name: [abbrev];
    text-face-name: @text_font_transport;
    text-fill: #444;
    text-size: @text_font_size_medium_plus;
    
    text-halo-fill: @label_color_airport_halo;
    text-halo-radius: @text_font_halo_radius_large;
    
    text-wrap-width: 128;
    text-dy: 14;  
  }

  [zoom>=13] {
    text-name: [name];
  }

  [zoom=14][natlscale>.04],
  [zoom=15][natlscale>.02],
  [zoom>=16][natlscale>.01]
  {
      text-dy: 20;
  }   

  [zoom=8][natlscale>2.3][type='major'],
  [zoom=9][natlscale>1.2][type='major'],
  [zoom=10][natlscale>0.57][type='major'],
  [zoom=11][natlscale>0.29][type='major'],
  [zoom=12][natlscale>0.29][type='major'],
  [zoom=13][natlscale>0.29][type='major']
  {
    point-file: url('icons/airport_major_l.png');
  }

  [zoom=14][natlscale>.29][type='major'],
  [zoom=15][natlscale>.29][type='major'],
  [zoom>=16][natlscale>.29][type='major']
  {
      point-file: url('icons/airport_major_xl.png');
  }

  [zoom=8][natlscale>2.3][type='small'],
  [zoom=9][natlscale>1.2][type='small'],
  [zoom=10][natlscale>.57][type='small'],
  [zoom=11][natlscale>.29][type='small'],
  [zoom=12][natlscale>.29][type='small'],
  [zoom=13][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_l.png');
  }

  [zoom=14][natlscale>.29][type='small'],
  [zoom=15][natlscale>.29][type='small'],
  [zoom>=16][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_xl.png');
  }

  [zoom=8][natlscale>2.3][type='military'],
  [zoom=9][natlscale>1.2][type='military'],
  [zoom=10][natlscale>.57][type='military'],
  [zoom=11][natlscale>.29][type='military'],
  [zoom=12][natlscale>.29][type='military'],
  [zoom=13][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_l.png');
  }

  [zoom=14][natlscale>.29][type='military'],
  [zoom=15][natlscale>.29][type='military'],
  [zoom>=16][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_xl.png');
  }

  [zoom=8][natlscale>2.3][type='spaceport'],
  [zoom=9][natlscale>1.2][type='spaceport'],
  [zoom=10][natlscale>.57][type='spaceport'],
  [zoom=11][natlscale>.29][type='spaceport'],
  [zoom=12][natlscale>.29][type='spaceport'],
  [zoom=13][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_l.png');
  }

  [zoom=14][natlscale>.29][type='spaceport'],
  [zoom=15][natlscale>.29][type='spaceport'],
  [zoom>=16][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_xl.png');
  }
}
