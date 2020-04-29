var location_index = document.getElementById("location_index");
var input_lat = document.getElementById("lat");
var input_lng = document.getElementById("lng");
var start_index = document.getElementById("start_index");
var end_index = document.getElementById("end_index");
var distance = document.getElementById("distance");
var burgerButton = document.getElementById("burgerButton");

var map; //지도 정보
var markerArray = {
  //위치 선택시 들어갈 JSON
  array: [],
};
var markerInfo = []; //마크 정보
var polylineInfo = []; //선 정보
var burgerInfo = []; //햄버거 정보
var search = []; //지도 검색 마크
var index = 0;

var locations = [
  { place: "맘스터치", lat: 37.501625, lng: 127.026849 },
  { place: "버거킹", lat: 37.498872, lng: 127.027609 },
  { place: "맥도날드", lat: 37.49862, lng: 127.02875 },
  { place: "맘스터치", lat: 37.501625, lng: 127.026849 }, //처음과 마지막 장소의 선긋기 용
];

var image = "./image/hamburger.svg";
var burgerFlag = false;
var burgerPath;
var marker2;
var marker_re;
var infowindow3;

var currentBackLat;
var currentBackLng;

function location_back() {
  
  marker_re = new google.maps.Marker({
    position: { lat: currentBackLat, lng: currentBackLng },
    map: map,
  });
  var infowindow5 = new google.maps.InfoWindow({
    content: "현재 위치 "
  });
  infowindow5.open(map, marker_re);
  map.setCenter({lat:currentBackLat, lng:currentBackLng});
}


function burgerMarkers() {
  if (!burgerFlag) {
    burgerButton.value = "강남 햄버거집 hide";
    for (i = 0; i < locations.length; i++) {
      marker2 = new google.maps.Marker({
        id: i,
        icon: image,
        position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
        map: map,
      });
      infowindow3 = new google.maps.InfoWindow({
        content: "위치 : " + locations[i].place,
      });
      infowindow3.open(map, marker2);
      burgerInfo.push(marker2);
    }
    burgerPath = new google.maps.Polyline({
      path: locations,
      geodesic: true,
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2,
    });
    burgerPath.setMap(map);
    burgerFlag = true;
  } else {
    burgerButton.value = "강남 햄버거집 show";
    burgerPath.setMap(null);
    for (i = 0; i < locations.length; i++) {
      burgerInfo[i].setMap(null);
    }
    infowindow3.setMap(null);
    burgerInfo = [];
    burgerFlag = false;
  }
  map.setCenter({lat:locations[0].lat, lng:locations[0].lng});
}

function initMap() {
  window.navigator.geolocation.getCurrentPosition(current_position);
}

var current_marker;
var geocoder;
function current_position(position) {
  geocoder = new google.maps.Geocoder();

  var latlng = new google.maps.LatLng(
    position.coords.latitude,
    position.coords.longitude
  );

  var origin = {
    lat: position.coords.latitude,
    lng: position.coords.longitude,
  };
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,
    center: origin,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    mapTypeControl: true,
    navigationControlOptions: {
      style: google.maps.NavigationControlStyle.SMALL,
    },
  });

  var clickHandler = new ClickEventHandler(map, origin);

  current_marker = new google.maps.Marker({
    position: latlng,
    map: map,
    title: "You are here!",
  });

  var infowindow = new google.maps.InfoWindow({
    content: "현재위치",
  });
  infowindow.open(map, current_marker);
  location_index.value = "현재위치";
  input_lat.value = current_marker.position.lat();
  input_lng.value = current_marker.position.lng();
  currentBackLat = current_marker.position.lat();
  currentBackLng = current_marker.position.lng();

  current_marker.addListener("click", function () {
    var infowindow = new google.maps.InfoWindow({
      content: "현재위치",
    });
    infowindow.open(map, current_marker);
    location_index.value = "현재위치";
    input_lat.value = current_marker.position.lat();
    input_lng.value = current_marker.position.lng();
  }); //말풍선 on
}

var ClickEventHandler = function (map, origin) {
  this.origin = origin;
  this.map = map;
  this.map.addListener("click", this.handleClick.bind(this));
};

ClickEventHandler.prototype.handleClick = function (event) {
  placeMarker(map, event.latLng);

  location_index.value = markerArray.array[index].index;
  input_lat.value = event.latLng.lat();
  input_lng.value = event.latLng.lng();
  index += 1;
};

function placeMarker(map, location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    index: index,
    icon: {
      url: "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/wireless.svg",
      scaledSize: new google.maps.Size(50, 50),
    },
    // draggable: true,
    animation: google.maps.Animation.DROP,
  });

  markerInfo.push(marker);
  markerArray.array.push({
    index: index,
    lat: location.lat(),
    lng: location.lng(),
  });

  var infowindow = new google.maps.InfoWindow({
    content: "위치 : " + index,
    //  '<br>위도: ' + location.lat() + '<br>경도: ' + location.lng()
  });
  infowindow.open(map, marker);
  // marker.addListener('click', toggleBounce);
  marker.addListener("click", function () {
    var infowindow = new google.maps.InfoWindow({
      content: "위치 : " + marker.index,
    });
    infowindow.open(map, marker);
    location_index.value = marker.index;
    input_lat.value = location.lat();
    input_lng.value = location.lng();
  }); //말풍선 on
} //placeMarker()_end

var dis_burgerFlag = { start_Flag: false, end_Flag: false };
var dis_burgerStart = []; //순서= 위도, 경도
var dis_burgerEnd = []; //순서= 위도, 경도

var dis_flag = { start_flag: false, end_flag: false };
var dis_start = []; //순서= 위도, 경도
var dis_end = []; //순서= 위도, 경도
document.getElementById("dis_cal").onclick = function () {
  // 직선거리계산 버튼
  if (start_index.value === "현재위치") {
    //출발 : 현재위치 기준
    dis_flag.start_flag = true;
    dis_start[0] = current_marker.position.lat();
    dis_start[1] = current_marker.position.lng();

    if (end_index.value.length < 2) {
      for (var j = 0; j < markerArray.array.length; j++) {
        //현재위치 -> 인덱스
        if (markerArray.array[j].index == end_index.value) {
          dis_flag.end_flag = true;
          dis_end[0] = markerArray.array[j].lat;
          dis_end[1] = markerArray.array[j].lng;
          console.log(dis_flag.end_flag);
          break;
        }
      }
    } else {
      for (var i = 0; i < locations.length; i++) {
        //현재위치 -> 햄버거집
        if (locations[i].place == end_index.value) {
          dis_flag.end_flag = true;
          dis_end[0] = locations[i].lat;
          dis_end[1] = locations[i].lng;
          break;
        }
      }
    }
    if (dis_flag.start_flag == true && dis_flag.end_flag == true) {
      var flightPlanCoordinates = [
        {
          lat: dis_start[0],
          lng: dis_start[1],
        },
        { lat: dis_end[0], lng: dis_end[1] },
      ];

      var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: "#FF0000",
        strokeOpacity: 1.0,
        strokeWeight: 2,
      });
      polylineInfo.push(flightPath);
      flightPath.setMap(map);
      distance.value = calcDistance(
        dis_start[0],
        dis_start[1],
        dis_end[0],
        dis_end[1]
      );
    }
  } else if (start_index.value.length > 2 && end_index.value.length) {
    //햄버거집끼리만..

    for (var i = 0; i < locations.length; i++) {
      if (locations[i].place == start_index.value) {
        dis_burgerFlag.start_Flag = true;
        dis_burgerStart[0] = locations[i].lat;
        dis_burgerStart[1] = locations[i].lng;
        break;
      }
    }

    for (var i = 0; i < locations.length; i++) {
      if (locations[i].place == end_index.value) {
        dis_burgerFlag.end_Flag = true;
        dis_burgerEnd[0] = locations[i].lat;
        dis_burgerEnd[1] = locations[i].lng;
        break;
      }
    }

    if (dis_burgerFlag.start_Flag == true && dis_burgerFlag.end_Flag == true) {
      distance.value = calcDistance(
        dis_burgerStart[0],
        dis_burgerStart[1],
        dis_burgerEnd[0],
        dis_burgerEnd[1]
      );
    }
  } else if (start_index.value.length < 2 && end_index.value.length > 2) {
    //수동마커 - 햄버거집
    for (var i = 0; i < markerArray.array.length; i++) {
      if (markerArray.array[i].index == start_index.value) {
        dis_flag.start_flag = true;
        dis_start[0] = markerArray.array[i].lat;
        dis_start[1] = markerArray.array[i].lng;
        break;
      }
    }

    for (var i = 0; i < locations.length; i++) {
      if (locations[i].place == end_index.value) {
        dis_burgerFlag.end_Flag = true;
        dis_burgerEnd[0] = locations[i].lat;
        dis_burgerEnd[1] = locations[i].lng;
        break;
      }
    }

    if (dis_flag.start_flag == true && dis_burgerFlag.end_Flag) {
      var flightPlanCoordinates = [
        { lat: dis_start[0], lng: dis_start[1] },
        { lat: dis_burgerEnd[0], lng: dis_burgerEnd[1] },
      ];

      var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: "#FF0000",
        strokeOpacity: 1.0,
        strokeWeight: 2,
      });
      polylineInfo.push(flightPath);
      flightPath.setMap(map);
      distance.value = calcDistance(
        dis_start[0],
        dis_start[1],
        dis_burgerEnd[0],
        dis_burgerEnd[1]
      );
    }
  } else {
    //수동 마커끼리만..
    if (markerArray.array.length > 1) {
      //등록된 마커가 최소 2개이상일시
      for (var i = 0; i < markerArray.array.length; i++) {
        if (markerArray.array[i].index == start_index.value) {
          dis_flag.start_flag = true;
          dis_start[0] = markerArray.array[i].lat;
          dis_start[1] = markerArray.array[i].lng;
          break;
        }
      }

      for (var j = 0; j < markerArray.array.length; j++) {
        if (markerArray.array[j].index == end_index.value) {
          dis_flag.end_flag = true;
          dis_end[0] = markerArray.array[j].lat;
          dis_end[1] = markerArray.array[j].lng;
          break;
        }
      }

      if (dis_flag.start_flag == true && dis_flag.end_flag == true) {
        var flightPlanCoordinates = [
          { lat: dis_start[0], lng: dis_start[1] },
          { lat: dis_end[0], lng: dis_end[1] },
        ];

        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: "#FF0000",
          strokeOpacity: 1.0,
          strokeWeight: 2,
        });
        polylineInfo.push(flightPath);
        flightPath.setMap(map);
        distance.value = calcDistance(
          dis_start[0],
          dis_start[1],
          dis_end[0],
          dis_end[1]
        );
      }
    }
  }
};

function calcDistance(lat1, lon1, lat2, lon2) {
  //직선 거리 계산 공식
  var EARTH_R, Rad, radLat1, radLat2, radDist;
  var distance, ret;

  EARTH_R = 6371000.0;
  Rad = Math.PI / 180;
  radLat1 = Rad * lat1;
  radLat2 = Rad * lat2;
  radDist = Rad * (lon1 - lon2);

  distance = Math.sin(radLat1) * Math.sin(radLat2);
  distance =
    distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
  ret = EARTH_R * Math.acos(distance);

  var rtn = Math.round(ret) + " m";

  return rtn;
}

// 클릭 마커 On/Off
function setMapOnAll(map) {
  for (var i = 0; i < markerInfo.length; i++) {
    markerInfo[i].setMap(map);
  }
}

// 선 마커 On/Off
function setMapOnAllPol(map) {
  for (var i = 0; i < polylineInfo.length; i++) {
    polylineInfo[i].setMap(map);
  }
}

// 주소검색 마커 On/Off
function setMapOnAllSer(map) {
  for (var i = 0; i < search.length; i++) {
    search[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
  setMapOnAllPol(null);
  setMapOnAllSer(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
  setMapOnAllPol(map);
  setMapOnAllSer(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markerInfo = [];
  polylineInfo = [];
  search = [];
  index = 0;
  markerArray.array = [];
  location_index.value = null;
  input_lat.value = null;
  input_lng.value = null;
  start_index.value = null;
  end_index.value = null;
  distance.value = null;
}

// submit 버튼 클릭 이벤트 실행
document.getElementById("submit").addEventListener("click", function () {
  console.log("submit 버튼 클릭 이벤트 실행");
  // 여기서 실행
  geocodeAddress(geocoder, map);
});

var image2 = "./image/home.svg";
function geocodeAddress(geocoder, resultMap) {
  //지도 검색(주소)
  console.log("geocodeAddress 함수 실행");

  var address = document.getElementById("address").value;

  geocoder.geocode({ address: address }, function (result, status) {
    if (status === "OK") {
      resultMap.setCenter(result[0].geometry.location);
      resultMap.setZoom(18);
      var marker = new google.maps.Marker({
        map: resultMap,
        icon: image2,
        position: result[0].geometry.location,
      });
      var infowindow = new google.maps.InfoWindow({
        content: "You Search!!",
      });
      infowindow.open(map, marker);
      location_index.value = "You Search!!";
      input_lat.value = marker.position.lat(); //위도
      input_lng.value = marker.position.lng(); //경도
      search.push(marker);

      marker.addListener("click", function () {
        var infowindow = new google.maps.InfoWindow({
          content: "You Search!!",
        });
        infowindow.open(map, marker);
        location_index.value = "You Search!!";
        input_lat.value = marker.position.lat();
        input_lng.value = marker.position.lng();
      }); //정보창 다시 뜸
    } else {
      alert("지오코드가 다음의 이유로 성공하지 못했습니다 : " + status);
    }
  });
}
