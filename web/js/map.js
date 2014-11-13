$(document).ready(function(){
  initialize();
})

styles = [
{
  "featureType": "water",
  "elementType": "geometry",
  "stylers": [
  {
    "color": "#c8bca6"
  }
  ]
},{
  "featureType": "water",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "weight": 1.5
  },
  {
    "saturation": -80
  },
  {
    "lightness": -10
  }
  ]
},{
  "featureType": "transit",
  "elementType": "labels",
  "stylers": [
  {
    "color": "#594c37"
  },
  {
    "weight": 0.2
  }
  ]
},{
  "featureType": "road.highway",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#dbb46b"
  }
  ]
},{
  "featureType": "road.highway",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "color": "#ddb471"
  },
  {
    "weight": 1
  }
  ]
},{
  "featureType": "road.highway",
  "elementType": "labels.icon",
  "stylers": [
  {
    "visibility": "simplified"
  },
  {
    "saturation": -80
  }
  ]
},{
  "featureType": "road.arterial",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#f7dda3"
  }
  ]
},{
  "featureType": "road.local",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#e4e2dd"
  }
  ]
},{
  "featureType": "landscape.natural",
  "stylers": [
  {
    "weight": 7.7
  },
  {
    "saturation": -80
  }
  ]
},{
  "featureType": "road.arterial",
  "elementType": "labels.text",
  "stylers": [
  {
    "saturation": -40
  },
  {
    "lightness": 10
  }
  ]
},{
  "featureType": "road",
  "elementType": "labels",
  "stylers": [
  {
    "saturation": -80
  }
  ]
},{
  "featureType": "poi.park",
  "stylers": [
  {
    "saturation": -80
  }
  ]
}
]
//Inicjacja mapy google
function initialize() {
  var markers = [];
  var contentString = [];
  var infowindow = [];
  
  //Centra biurowe
  var object1 = {
    'name' : 'Centrum Biurowe Hossa',
    'address': 'Gdynia ul. Władysława IV 43',
    'lat' : 54.512333,
    'lng' : 18.538101,
    'image': '/images/pin-pink.png'
  }
  
  var object2 = {
    'name' : 'Centrum Biurowe Heweliusza',
    'address': 'Gdańsk ul.Heweliusza 9',
    'lat' : 54.356334,
    'lng' : 18.64978,
    'image': '/images/pin-pink.png'
  }
  
  var object3 = {
    'name' : 'Centrum Biurowe Gnilna',
    'address': 'Gdańsk ul. Gnilna 2',
    'lat' : 54.357150,
    'lng' : 18.649428,
    'image': '/images/pin-pink.png'
  }
  
  var object4 = {
    'name' : 'Centrum Biurowe Omega',
    'address': 'Gdańska ul. Norwida 2',
    'lat' : 54.384056,
    'lng' : 18.592273,
    'image': '/images/pin-pink.png'
  }
  
  var object5 = {
    'name' : 'Centrum Biurowe Gamma',
    'address': 'Gdańska ul. Norwida 4',
    'lat' : 54.383760,
    'lng' : 18.591634,
    'image': '/images/pin-pink.png'
  }
  
  var object6 = {
    'name' : 'Centrum Biurowe Grunwaldzka 184-190',
    'address': 'Gdańska al. Grunwaldzka 184',
    'lat' : 54.385287,
    'lng' : 18.593303,
    'image': '/images/pin-pink.png'
  }
  
  //Wspólnoty mieszkanowe
  var object7 = {
    'name' : 'Garnizon Lofty&Apartamenty',
    'address': 'Gdańsk Słonimskiego 1-9',
    'lat' : 54.384144,
    'lng' : 18.590669,
    'image': '/images/pin-green.png'
  }
  
  var object8 = {
    'name' : 'Centralpark Apartamenty',
    'address': 'Gdańskie Piecewska',
    'lat' : 54.359326,
    'lng' : 18.581254,
    'image': '/images/pin-green.png'
  }
  
  //Pozostałe - inne
  var object9 = {
    'name' : 'Hotel Longstay',
    'address': '',
    'lat' : 54.505947,
    'lng' : 18.545583,
    'image': '/images/pin-purpure.png'
  }
  
  var object10 = {
    'name' : 'Centrum Handlowo Usługowe Gdynia Zachód',
    'address': '',
    'lat' : 54.496745,
    'lng' : 18.43849,
    'image': '/images/pin-purpure.png'
  }
  
  var objects = {
    '1':object1, 
    '2':object2,
    '3':object3,
    '4':object4,
    '5':object5,
    '6':object6,
    '7':object7,
    '8':object8,
    '9':object9,
    '10':object10
  };
  
  //Mała mapa
  if($("#maps").width() < 500 || $("#maps").height() < 300){
    var mapOptions = {
      center: new google.maps.LatLng(54.441408, 18.56019),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: styles
    };
  }
  //Duża mapa
  else{
    var mapOptions = {
      center: new google.maps.LatLng(54.441419, 18.560524),
      zoom: 11,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: styles
    };
  }
  
  var map = new google.maps.Map(document.getElementById("maps"), mapOptions);
  
  for(var i in objects){
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(objects[i].lat,objects[i].lng),
      title: objects[i].name,
      icon: objects[i].image
    });
    markers.push(marker);
  
    contentString[i] = 
    '<div id="info_content">'+
    '<div id="info_body">'+
    '<p><b>'+
    objects[i].name
    +'</b></p>'+
    '<p>'+
    objects[i].address
    +'</p>'+
    '</div>'+
    '</div>';
    
    infowindow[i] = new google.maps.InfoWindow({
      content: contentString[i]
    });
  }

  var mcOptions = {
    gridSize: 50, 
    maxZoom: 15, 
    styles: [{
      url: '/images/pin-grup.png',
      height: 51,
      width: 42,
      anchor: [12, 0],
      textColor: '#fff',
      textSize: 12
    }]
  };
var markerCluster = new MarkerClusterer(map, markers, mcOptions);
  
google.maps.event.addListener(markers[0], 'click', function() {
  infowindow[1].open(map,markers[0]);
});
  
google.maps.event.addListener(markers[1], 'click', function() {
  infowindow[2].open(map,markers[1]);
});
  
google.maps.event.addListener(markers[2], 'click', function() {
  infowindow[3].open(map,markers[2]);
});
  
google.maps.event.addListener(markers[3], 'click', function() {
  infowindow[4].open(map,markers[3]);
});
  
google.maps.event.addListener(markers[4], 'click', function() {
  infowindow[5].open(map,markers[4]);
});
  
google.maps.event.addListener(markers[5], 'click', function() {
  infowindow[6].open(map,markers[5]);
});
  
google.maps.event.addListener(markers[6], 'click', function() {
  infowindow[7].open(map,markers[6]);
});
  
google.maps.event.addListener(markers[7], 'click', function() {
  infowindow[8].open(map,markers[7]);
});
  
google.maps.event.addListener(markers[8], 'click', function() {
  infowindow[9].open(map,markers[8]);
});
  
google.maps.event.addListener(markers[9], 'click', function() {
  infowindow[10].open(map,markers[9]);
});
}