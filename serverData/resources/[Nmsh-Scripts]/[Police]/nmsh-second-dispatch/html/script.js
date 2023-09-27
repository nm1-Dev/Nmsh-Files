const center_x = 117.3;
const center_y = 172.8;
const scale_x = 0.02072;
const scale_y = 0.0205;
const test = {};
const test2 = {};

var roninNumber

var assingTimeOutID = 0;
var createCalls;
var createCall2;
var createCall3;
var createCall4;
var coords;
var c2value;
var c3value;
var c4value;
var c5value;
var c6value;
var c7value;

var dblClick;

CUSTOM_CRS = L.extend({}, L.CRS.Simple, {
    projection: L.Projection.LonLat,
    scale: function(zoom) {

        return Math.pow(2, zoom);
    },
    zoom: function(sc) {

        return Math.log(sc) / 0.6931471805599453;
    },
	distance: function(pos1, pos2) {
        var x_difference = pos2.lng - pos1.lng;
        var y_difference = pos2.lat - pos1.lat;
        return Math.sqrt(x_difference * x_difference + y_difference * y_difference);
    },
	transformation: new L.Transformation(scale_x, center_x, -scale_y, center_y),
    infinite: true
});

var map = L.map('dispatch-map-container', {
    crs: CUSTOM_CRS,
    minZoom: 0,
    maxZoom: 5,
    center: [0, 0],
    zoom: 2,
    noWrap: true,
    continuousWorld: false,
    preferCanvas: true,
    center: [0, 0],
    zoom: 3,
});

var w = 1024;
var h = 1024;
var url = 'https://gta-assets.nopixel.net/images/dispatch-map.png';
var southWest = map.unproject([0, h], 3 - 1);
var northEast = map.unproject([w, 0], 3 - 1);
var bounds = new L.LatLngBounds(southWest, northEast);

L.imageOverlay(url, bounds).addTo(map);
map.setMaxBounds(bounds);

function GTAVConverter(x,y)
{
    var x = x - 19.726446;
    var y = y - 19.726446;

    return map.containerPointToLatLng(new L.Point(x+1440.45,y+127.45));
}

const DispatchPing = L.divIcon({
    html: '<i  class="fa fa-map-pin fa-2x"></i>',
    iconSize: [20, 20],
    className: 'map-icon map-icon-ping',
    offset: [-10, 0]
});
const DispatchCall = L.divIcon({
    html: '<i class="fa fa-car fa-2x"></i>',
    iconSize: [20, 20],
    className: 'map-icon map-icon-car',
    offset: [-10, 0]
});
const DispatchCallHeli = L.divIcon({
    html: '<i class="fa fa-helicopter fa-2x"></i>',
    iconSize: [20, 20],
    className: 'map-icon map-icon-car',
    offset: [-10, 0]
});
const DispatchCallMotor = L.divIcon({
    html: '<i class="fa fa-motorcycle fa-2x"></i>',
    iconSize: [20, 20],
    className: 'map-icon map-icon-car',
    offset: [-10, 0]
});
const DispatchCallBicycle = L.divIcon({
    html: '<i class="fa fa-bicycle fa-2x"></i>',
    iconSize: [20, 20],
    className: 'map-icon map-icon-car',
    offset: [-10, 0]
});
function discpatchMap(code, x,y){
    test[code] = L.marker([y,x], { icon: DispatchPing })
    test[code].bindTooltip(code,
        {
            direction: 'right',
            permanent: true,
            sticky: true,
            offset: [10, 0],
            opacity: 0.9,
            className: 'map-tooltip'
        });
    test[code].addTo(map)
}
function discpatchPersonMap(code, x,y,car){
    var dicpatchcallsal;

    if(car == "car"){
        dicpatchcallsal = DispatchCall;
    }
    if(car == "heli"){
        dicpatchcallsal = DispatchCallHeli;
    }
    if(car == "motor"){
        dicpatchcallsal = DispatchCallMotor;
    }
    if(car == "bicycle"){
        dicpatchcallsal = DispatchCallBicycle;
    }

    test2[code] = L.marker([y,x], { icon: dicpatchcallsal })
    test2[code].bindTooltip(code,
        {
            direction: 'right',
            permanent: true,
            sticky: true,
            offset: [10, 0],
            opacity: 0.9,
            className: 'map-tooltip'
        });
    test2[code].addTo(map)
}


// discpatchMap(-2027.34,325.0693);
function setCoords(x, y) {
    $.post('https://nmsh-second-dispatch/set-coords', JSON.stringify({
        x: x,
        y: y
    }));
}

$(document).ready(function() {
	window.addEventListener('message', function(event){
		if (event.data.action == "open") {
            table = event.data.table;
            myCode = event.data.player_code;
            myName = event.data.player_name;


            for (var k in test) {
                test[k].remove(map);
            }

            $(".mesai-personel").parent('div').html("");
            $('.mesai-notify-main').attr('saveattr', "1");
            $('.police-list').html("");
            $('.police-list').html("");

            $('.out-dispatch-notifys').html("");
            $('.dispatch-menu').html("");
            $('.marked-notify-main').html("");


            $('.mesai-allah-yok').html(createTablePolice(table));
            
            createTablePolice2(table);

            ilkSilme();
            
            $('.police-list').html(createPolice(table));

            outAc();
            $('.called-list-inner').html(createPolice3(table));


            
            $('.called-list-inner').prepend(`
            <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button set-gps" tabindex="-1" role="option" aria-disabled="false" data-value="10">
            Set GPS Location<span class="MuiTouchRipple-root">
            </span></li>`)
            $('.set-gps').click(function() {
                $.post('https://nmsh-second-dispatch/set-coords', JSON.stringify({
                    number: roninNumber
                }));
                $('.called-list').fadeOut();
                assing();
            })
            $('.set-gps-location').click(function() {
                $.post('https://nmsh-second-dispatch/set-coords', JSON.stringify({
                    number: roninNumber
                }));

                $('.assign-list').fadeOut();
                assing();
            })
            $('.called-list-inner').append(`
            <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button dismiss-pingg" tabindex="-1" role="option" aria-disabled="false" data-value="10">
            Dismiss Call (From Map)<span class="MuiTouchRipple-root">
            </span></li>`)
        
            
            assignButtons();
            removeItem();
            mesaiHold();
            vehiclesClick();
            cureungotunu();
		}

        if (event.data.action == "map") {
            mapAc();
		}

        if (event.data.action == "remove-ping") {
            test[event.data.number].remove(map);
		}

        if (event.data.action == "create_dispatch-menu") {

            if (event.data.mod == "normal") {
                createNotifyAction2(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();
                discpatchMap(`${event.data.code}`, event.data.coordx, event.data.coordy);
            } else if (event.data.mod == "vehicle") {
                createNotifyAction2(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time, event.data.car, event.data.plate, event.data.color, "A");
                console.log(event.data.car, event.data.plate, event.data.color)
                discpatchMap(`${event.data.code}`, event.data.coordx, event.data.coordy);
                assing();
            } else if (event.data.mod == "custom") {
                createNotifyAction2(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();
                discpatchMap(`${event.data.code}`, event.data.coordx, event.data.coordy);
            } else if (event.data.mod == "create_call") {
                createNotifyAction2Mod2(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();
            } else if (event.data.mod == "dismiss_call") {
                createNotifyAction2Mod3(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();

            } else if (event.data.mod == "police") {
                createNotifyAction2police(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();
                discpatchMap(`${event.data.code}`, event.data.coordx, event.data.coordy);
            }

		}

        if (event.data.action == "update-html") {
            
            if (event.data.code) {
                $(".mesai-personel").parent('div').html("");


                $('.mesai-allah-yok').append(event.data.code);
                $('.mesai-notify-main').each(function(){
                    var check = $.trim($(this).text())
                    if(check == ""){
                        $(this).remove();
                    }
                })
            }
    
            // $(`.mesai-notify-main[saveattr = "1"]`).remove();
		}

        if (event.data.action == "update-coord") {

            if (test2[event.data.code] == null ) {
                discpatchPersonMap(event.data.code, event.data.x,event.data.y, event.data.vehicle);
            } else {
                test2[event.data.code].remove(map);
                discpatchPersonMap(event.data.code, event.data.x,event.data.y, event.data.vehicle);
            }
		}

        if (event.data.action == "add-dispatch") {
            if (event.data.mod == "normal") {
                createNotifyAction(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();
            } else if (event.data.mod == "vehicle") {
                createNotifyAction(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time, event.data.car, event.data.plate, event.data.carColor, "A");
                assing();

            } else if (event.data.mod == "police") {
                createNotifyActionpolice(event.data.coordx, event.data.coordy, event.data.code, event.data.code1, event.data.alertname, event.data.street, event.data.time);
                assing();

                // police versiyonu
            }
        }

        if (event.data.action == "close") {
            $.post('https://nmsh-second-dispatch/close', JSON.stringify({}));
            outKapa();
		}

        if (event.data.action == "close-callsign") {

            $.post('https://nmsh-second-dispatch/close-callsign', JSON.stringify({}));
            outKapa();
		}

        if (event.data.action == "close-force") {
            outKapa();
		}

        if (event.data.action == "deleteallah") {
            test2[event.data.player_code].remove(map);
		}

        if (event.data.action == "create_call") {
            $('.assign-list').fadeOut();

            $('.marked-notify-main').prepend(event.data.call);

            var valueOfHTML = $('.dispatch-menu').html();

            var lastPrint = valueOfHTML.replace(event.data.html, "");
            // console.log(lastPrint)
            $('.dispatch-menu').html(`${lastPrint}`);

            
            if($(`.called[x="${event.data.c3value}"]`).length == 3 && $(`.called[y="${event.data.c4value}"]`).length == 3){
                $(`.called[x="${event.data.c3value}"]:nth-child(2)`).remove();
                $(`.called[x="${event.data.c3value}"]:nth-child(3)`).remove();
            }
            if($(`.called[x="${event.data.c3value}"]`).length == 2 && $(`.called[y="${event.data.c4value}"]`).length == 2){
                $(`.called[x="${event.data.c3value}"]:nth-child(2)`).remove();
                $(`.called[x="${event.data.c3value}"]:nth-child(3)`).remove();
            }
            $('.notify-border').each(function(){
                var check = $(this).html()
                if(check == ""){
                    $(this).remove();
                }
            })

            // var osruk = event.data.html;
            // osruk.remove();
            assing();
        }
        
        $('.create-call').click(function() {
            $.post('https://nmsh-second-dispatch/create_call', JSON.stringify({
                number: roninNumber
            }));
        })

        // if (event.data.action == "dismiss_call-2") { 

        //     // console.log(lastPrint)
        //     $('.dispatch-menu').html(`${lastPrint}`);

            
        //     if($(`.called[x="${event.data.c3value}"]`).length == 3 && $(`.called[y="${event.data.c4value}"]`).length == 3){
        //         $(`.called[x="${event.data.c3value}"]:nth-child(2)`).remove();
        //         $(`.called[x="${event.data.c3value}"]:nth-child(3)`).remove();
        //     }
        //     if($(`.called[x="${event.data.c3value}"]`).length == 2 && $(`.called[y="${event.data.c4value}"]`).length == 2){
        //         $(`.called[x="${event.data.c3value}"]:nth-child(2)`).remove();
        //         $(`.called[x="${event.data.c3value}"]:nth-child(3)`).remove();
        //     }
        //     $('.notify-border').each(function(){
        //         var check = $(this).html()
        //         if(check == ""){
        //             $(this).remove();
        //         }
        //     })

        //     console.log("dismis atim")

        //     createCall3 = $('.notify-border');
            
        //     createCall3.addClass('dismissed');
        //     $('.called-list').fadeOut();
        // }

        $('.dismiss-pingg').click(function() {
            console.log("dismis atıom")
            createCall3.addClass('dismissed');
            $('.called-list').fadeOut();
            $.post('https://nmsh-second-dispatch/dismiss_call-2', JSON.stringify({
                number: roninNumber
            }));
        })

        if (event.data.action == "remove-call") { 

            $('.dismiss-list').fadeOut();
            createCall4 = $('.notify-border');
            var number = Number($.trim(createCall4.children('div').first().children('div').children('div').first().text()))
            test[number].remove(map);
            createCall4.remove();
        }

        if (event.data.action == "remove-call-2") {
            createCall2 = $('.notify-border');
            var number = Number($.trim(createCall2.children('div').first().children('div').children('div').first().text()))
            test[number].remove(map);
            createCall2.remove();
            $('.assign-list').fadeOut();
        }

        if (event.data.action == "add_police-assign") { 
            var esekcure = event.data.allah;
            asignosurukcureniyecalismioallahinisikiyimyeterhayatimisikiyimya(esekcure);
        }

        if (event.data.action == "delete_police-assign") { 

            var callCame2 = $('.call-came');

            var numberOfPolice = Number($.trim(callCame2.parent('div').children('p').text()).slice(9).slice(0,1))-1;
            callCame2.parent('div').children('p').html("Police: (" + numberOfPolice + ")")
            callCame2.remove();
            
            $('.remove-list').fadeOut();
        }

        // if (event.data.action == "add") {
        //     table = event.data.table;

        //     $('.mesai-allah-yok').append(policeCreat2(event.data.code, event.data.vehicle));
        //     $('.police-list').append(createPolice(event.data.code));

        //     removeItem();
        //     mesaiHold();
        //     mesaiHold();
        //     removeItem();
        //     cureungotunu();
		// }
	})

	document.onkeyup = function (data) {
		if ( data.which == 27 ) { //esc
		  $.post('https://nmsh-second-dispatch/close', JSON.stringify({}));
		  outKapa();
		}
	};
	
    // Create Dispatch
    function createNotify(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        var html = "";
        var carCheck;
        if (car == "" || car == undefined) {
            carCheck = "";
        } else {
            carCheck = `<div class="notify-divs">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `<div class="notify-main-container-inner" number="${greenNumber}">
			<div class="notify-border notify-animate" aria-controls="ping-menu-263" aria-haspopup="true" x="${coordx}" y="${coordy}">
			   <div class="notify-divs">
				  <div class="notify-header">
					 <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
					 <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
					 <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
				  </div>
				  <div class="notify-header-icon gps-icon">
					 <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
				  </div>
			   </div>
			   <div class="notify-divs">
				  <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			   </div>
			   ${carCheck}
			   <div class="notify-divs">
				  <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			   </div>
			</div>
		 </div>`
         setTimeout(function () {
            $(`.notify-main-container-inner[number="${greenNumber}"`).css('animation', 'notifyRevers 0.5s');
            setTimeout(function(){
                $(`.notify-main-container-inner[number="${greenNumber}"`).remove();
            },490)
         },5000)
        return html;
    }

    function createNotify2(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        var html = "";
        var carCheck;
        if (car == "" || car == undefined) {
            carCheck = "";
        } else {
            carCheck = `<div class="notify-divs">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `<div class="notify-main-container-inner" number="${greenNumber}">
			<div class="notify-border notify-animate" aria-controls="ping-menu-263" aria-haspopup="true"  x="${coordx}" y="${coordy}" style="background-color: rgba(120, 15, 0, 0.824); border-right: rgb(231,55,24)">
			   <div class="notify-divs">
				  <div class="notify-header">
					 <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
					 <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
					 <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
				  </div>
				  <div class="notify-header-icon gps-icon">
					 <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
				  </div>
			   </div>
			   <div class="notify-divs">
				  <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			   </div>
			   ${carCheck}
			   <div class="notify-divs">
				  <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			   </div>
			</div>
		 </div>`
         setTimeout(function () {
            $(`.notify-main-container-inner[number="${greenNumber}"`).css('animation', 'notifyRevers 0.5s');
            setTimeout(function(){
                $(`.notify-main-container-inner[number="${greenNumber}"`).remove();
            },490)
         },5000)
        return html;
    }

    function createMenuNotifypolice(coordx, coordy ,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        var html = "";
        var carCheck;
        if (car == "" || car == undefined) {
            carCheck = "";
        } else {
            carCheck = `<div class="notify-divs">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `<div class="notify-border" aria-controls="ping-menu-263" aria-haspopup="true" x="${coordx}" y="${coordy}" style="background-color: rgba(120, 15, 0, 0.824); border-right: rgb(231,55,24)">
			<div class="notify-divs">
			   <div class="notify-header">
				  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
				  <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
			   </div>
			   <div class="notify-header-icon gps-icon">
				  <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
			   </div>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			</div>
		 </div>`
        return html;
    }

    function createMenuNotify(coordx, coordy ,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {

        console.log(car, plate, carColor, vehicleClass)
        var html = "";
        var carCheck = "";

        html += `<div class="notify-border" aria-controls="ping-menu-263" aria-haspopup="true" x="${coordx}" y="${coordy}">
			<div class="notify-divs">
			   <div class="notify-header">
				  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
				  <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
			   </div>
			   <div class="notify-header-icon gps-icon">
				  <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
			   </div>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			</div>
		`

        if (car) {
            html += `<div class="notify-divs">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `</div>`
        return html;
    }

    function createMenuNotifyMod2(coordx, coordy ,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        var html = "";
        var carCheck;
        if (car == "" || car == undefined) {
            carCheck = "";
        } else {
            carCheck = `<div class="notify-divs called">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `<div class="notify-border called" aria-controls="ping-menu-263" aria-haspopup="true" x="${coordx}" y="${coordy}">
			<div class="notify-divs">
			   <div class="notify-header">
				  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
				  <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
			   </div>
			   <div class="notify-header-icon gps-icon">
				  <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
			   </div>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			</div>
            <div class="yonlendirme-div">
               <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Police: (0)
            </div>
		 </div> `
        return html;
    }

    function createMenuNotifyMod3(coordx, coordy ,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        var html = "";
        var carCheck;
        if (car == "" || car == undefined) {
            carCheck = "";
        } else {
            carCheck = `<div class="notify-divs called dismissed">
				<i class="fa-solid fa-car-side fa-w-20 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${car}</p>
				<i class="fa-solid fa-closed-captioning fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${plate}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-palette fa-w-16 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${carColor}</p>
			 </div>
			 <div class="notify-divs">
				<i class="fa-solid fa-sticky-note fa-w-14 fa-fw"></i>
				<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Vehicle's Class: ${vehicleClass}</p>
			 </div>`
        }
        html += `<div class="notify-border called dismissed" aria-controls="ping-menu-263" aria-haspopup="true" x="${coordx}" y="${coordy}">
			<div class="notify-divs">
			   <div class="notify-header">
				  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall"><span class="MuiChip-label MuiChip-labelSmall">${greenNumber}</span></div>
				  <div class="MuiChip-root MuiChip-colorSecondary MuiChip-sizeSmall" style="margin-left: 8px;"><span class="MuiChip-label MuiChip-labelSmall">${orangeNumber}</span></div>
				  <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="margin-left: 8px;">${crimeName}</p>
			   </div>
			   <div class="notify-header-icon gps-icon">
				  <i class="fa-solid fa-map-marker-alt fa-w-12 fa-fw fa-2x"></i>
			   </div>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-globe-europe fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${address}</p>
			</div>
			<div class="notify-divs">
			   <i class="fa-solid fa-clock fa-w-16 fa-fw"></i>
			   <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">${time}</p>
			</div>
            <div class="yonlendirme-div">
               <p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Police: (0)
            </div>
		 </div> `
        return html;
    }

    function createNotifyAction(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.out-dispatch-notifys').prepend(createNotify(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }

    function createNotifyActionpolice(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.out-dispatch-notifys').prepend(createNotify2(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }

    function createNotifyAction2(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.dispatch-menu').prepend(createMenuNotify(coordx, coordy,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }

    function createNotifyAction2police(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.dispatch-menu').prepend(createMenuNotifypolice(coordx, coordy,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }

    function createNotifyAction2Mod2(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.marked-notify-main').prepend(createMenuNotifyMod2(coordx, coordy,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }
    function createNotifyAction2Mod3(coordx, coordy, greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass) {
        $('.marked-notify-main').prepend(createMenuNotifyMod3(coordx, coordy,greenNumber, orangeNumber, crimeName, address, time, car, plate, carColor, vehicleClass));
    }

    $('.double-click button').click(function() {
        $('.double-click button').removeClass('checked-btn');
        $(this).addClass('checked-btn');
    })

    function createTab() {
        var html = "";
        html +=
            `<div class="double-click">
        <button>Vehicle: Helicopter</button><br>
        <button>Vehicle: Motorbike</button><br>
        <button>Operating Under: 344</button>
    </div>`
        return html;
    }

    function removeItem() {
        $('.dispatch-name').dblclick(function(e) {
            dblClick = $(this);
            var that = $(this).parent('div');
            var numberCheck = $(this).parent('div').parent('div').children('div').length;
            var general = $(this).parent('div').parent('div').parent('div');
            e.preventDefault();
            $('.remove-list .MuiPaper-rounded').css('position', 'absolute');
            $('.remove-list .MuiPaper-rounded').css('top', e.pageY);
            $('.remove-list .MuiPaper-rounded').css('left', e.pageX);
            $('.remove-list').fadeIn();
            $('.menu-close-click').click(function() {
                $('.remove-list').fadeOut();
            })
            $('.MuiListItem-button').click(function() {
                $('.remove-list').fadeOut();
            })
        });
    }
    removeItem();

    $('body').mousedown(function(event) {
        switch (event.which) {
            case 1:
                $('.gps-click').fadeOut();
                setTimeout(function() {
                    $('.gps-click').remove();
                }, 200)
                $('.double-click').fadeOut();
                setTimeout(function() {
                    $('.double-click').remove();
                }, 200)
                setTimeout(function() {
                    $('.called-div-click').remove();
                }, 200)
                setTimeout(function() {
                    $('.right-click-div-click').remove();
                }, 200)
                break;
        }
    });

    var timeoutId = 0;

    function asdas(e) {
        e.preventDefault();
        $('.charges-menu .MuiPaper-rounded').css('position', 'absolute');
        $('.charges-menu .MuiPaper-rounded').css('top', e.pageY);
        $('.charges-menu .MuiPaper-rounded').css('left', e.pageX);
        $('.charges-menu').fadeIn();
        $('.remove-list').hide();
    }
    var policeName;
    var value;
    var holdedCon;

    function mesaiHold() {
        $('.mesai-personel').on('mousedown', function(e) {
            holdedCon = $(this);
            var that = $(this);
            var first;
            var second;
            var third;
            var svg = $(this).parent('div').parent('div').children('.mesai-icon-heli').children('i');
            var check1 = svg.hasClass('fa-helicopter');
            var check2 = svg.hasClass('fa-car-side');
            var check3 = svg.hasClass('fa-bicycle');
            var check4 = svg.hasClass('fa-motorcycle');
            if (check1 == true) {
                first = "Car"
                second = "Motorbike"
                third = "Bicycle"
            }
            if (check2 == true) {
                first = "Helicopter"
                second = "Motorbike"
                third = "Bicycle"
            }
            if (check3 == true) {
                first = "Car"
                second = "Helicopter"
                third = "Motorbike"
            }
            if (check4 == true) {
                first = "Car"
                second = "Helicopter"
                third = "Bicycle"
            }
            timeoutId = setTimeout(function() {
                value = that.parent('div').children('div').length;
                policeName = that.children('div').children('span').html();

                vehicles(first, second, third)
                asdas(e);
                $('.menu-close-click').click(function() {
                    $('.charges-menu').fadeOut();
                })
                $('.MuiListItem-button').click(function() {
                    $('.charges-menu').fadeOut();
                })
            }, 500);
        }).on('mouseup mouseleave', function() {
            clearTimeout(timeoutId);
        });
    }

    mesaiHold()
    // Police Create

    function createPolice(result) {
        var html = "";
        for(var k in result) {
                html +=
                `<li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button operator-tasima" tabindex="-1" role="option" aria-disabled="false" data-value="10">
            Operating Under: ${result[k].code}<span class="MuiTouchRipple-root" name="${result[k].code}">
            </span></li>`
        }
        return html;
    }
    

    function createTablePolice(result) {
        var html = "";
        for(var k in result) {
            if (result[k].whounder == false) {
                html += `
                <div class="mesai-notify-main" saveattr="${result[k].save}">
                <div class="mesai-icon-heli">
                   <i class="fa-solid ${result[k].vehicle} fa-w-20 fa-fw fa-lg"></i>
                </div>
                <div>
                   <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true" check="${result[k].code}">
                      <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who">${result[k].code}</span></div>
                   </div>
                </div>
              </div>`
           }
        }
        return html;
    }


    // $('.police-list').html(createPolice(policeTable.policeTables));

    // $('.mesai-allah-yok').append(createTablePolice(policeTable.policeTables))

    removeItem();
    mesaiHold();
    vehiclesClick();
    // Callsign
    function callSign(text) {
        $('.user-who').text(`${text}`);
    }


    // Vehicle
    function vehicles(first, second, third) {
        $('.vehicles').remove()
        $('.police-list').prepend(`
        <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button vehicles" carhash="${first}" tabindex="-1" role="option" aria-disabled="false" data-value="10">Vehicle: ${first}<span class="MuiTouchRipple-root"></span></li>
        <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button vehicles" carhash="${second}" tabindex="-1" role="option" aria-disabled="false" data-value="25">Vehicle: ${second}<span class="MuiTouchRipple-root"></span></li>
        <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button vehicles" carhash="${third}" tabindex="-1" role="option" aria-disabled="false" data-value="50">Vehicle: ${third}<span class="MuiTouchRipple-root"></span></li>
        `)
        vehiclesClick()
    }

    // function createTablePolice(k) {
    //     var html = "";
        // for(var k in result) {
        //     console.log(k, result[k]);
        //  }
    //         html += `
    //         <div class="mesai-notify-main">
    //         <div class="mesai-icon-heli">
    //            <i class="fa-solid fa-car-side fa-w-20 fa-fw fa-lg"></i>
    //         </div>
    //         <div>
    //            <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true">
    //               <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who">${k}</span></div>
    //            </div>
    //         </div>
    //      </div>`
    //     return html;
    // }

    // Police Creat Function
    function policeCreat(code, icon) {
        var html = "";
            html +=
            `<div class="mesai-notify-main">
            <div class="mesai-icon-heli">
               <i class="fa-solid ${icon} fa-w-20 fa-fw fa-lg"></i>
            </div>
            <div>
               <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true">
                  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who">${code}</span></div>
               </div>
            </div>
        </div>`
        return html;
    }

    function policeCreat2(name, icon) {
        var html = "";
            html +=
            `<div class="mesai-notify-main">
            <div class="mesai-icon-heli">
               <i class="fa-solid ${icon} fa-w-20 fa-fw fa-lg"></i>
            </div>
            <div>
               <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true">
                  <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who">${name}</span></div>
               </div>
            </div>
        </div>`
        return html;
    }

    function vehiclesClick() {
        $('.vehicles').click(function() {
            icon = $(this).attr('carhash');
            if (icon == 'Car') {
                icon = "fa-car-side"
            } else
            if (icon == 'Helicopter') {
                icon = "fa-helicopter"
            } else
            if (icon == "Motorbike") {
                icon = "fa-motorcycle"
            } else
            if (icon == "Bicycle") {
                icon = "fa-bicycle"
            }
            if (value == 1) {
                console.log("table dışındasın");
                holdedCon.parent('div').parent('div').remove();
               
                $('.mesai-allah-yok').append(policeCreat2(policeName, icon));
                removeItem()
                mesaiHold()
                $.post('https://nmsh-second-dispatch/change-vehicle', JSON.stringify({
                    name: policeName,
                    icon: icon
                }));
                
            } else {
                var remove = $.trim(holdedCon.text())
                console.log(remove);
                console.log("table içindesin");
                holdedCon.remove();
                $('.mesai-allah-yok').append(policeCreat2(policeName, icon));

                $('.mesai-persone').each(function(){
                    var value = $.trim($(this).text());
                })

                $.post('https://nmsh-second-dispatch/table_ayril', JSON.stringify({
                    name: remove
                }));

                removeItem()
                mesaiHold()
                $.post('https://nmsh-second-dispatch/change-vehicle', JSON.stringify({
                    name: remove,
                    icon: icon
                }));
            }
        })
    }

    // Almez
    function createPolice2(polices = []) {
        var html = "";
        for (var i = 0; i < polices.length; i++) {
            html +=
                `<li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button assing-buttons" tabindex="-1" role="option" aria-disabled="false" data-value="10">
            ${polices[i].id}<span class="MuiTouchRipple-root" name="${polices[i].name}">
            </span></li>`
        }
        return html;
    }

    function createPolice3(result) {
        var html = "";
        for(var k in result) {
            html +=
                `<li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button assing-buttons" tabindex="-1" role="option" aria-disabled="false" data-value="10">
            ${result[k].code}<span class="MuiTouchRipple-root" name="${result[k].code}">
            </span></li>`
        }
        return html;
    }
    
    // $('.called-list-inner').html(createPolice2(policeTable.policeTables));
    $('.called-list-inner').prepend(`
    <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button set-gps" tabindex="-1" role="option" aria-disabled="false" data-value="10">
    Set GPS Location<span class="MuiTouchRipple-root">
    </span></li>`)
    $('.called-list-inner').append(`
    <li class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button dismiss-pingg" tabindex="-1" role="option" aria-disabled="false" data-value="10">
    Dismiss Call (From Map)<span class="MuiTouchRipple-root">
    </span></li>`)

    function assingList(e) {
        e.preventDefault();
        $('.assign-list .MuiPaper-rounded').css('position', 'absolute');
        $('.assign-list .MuiPaper-rounded').css('top', e.pageY);
        $('.assign-list .MuiPaper-rounded').css('left', e.pageX - 100);
        $('.assign-list').fadeIn();
    }

    function calledList(e) {
        e.preventDefault();
        $('.called-list .MuiPaper-rounded').css('position', 'absolute');
        $('.called-list .MuiPaper-rounded').css('top', e.pageY);
        $('.called-list .MuiPaper-rounded').css('left', e.pageX - 100);
        $('.called-list').fadeIn();
    }

    function dismissList(e) {
        e.preventDefault();
        $('.dismiss-list .MuiPaper-rounded').css('position', 'absolute');
        $('.dismiss-list .MuiPaper-rounded').css('top', e.pageY);
        $('.dismiss-list .MuiPaper-rounded').css('left', e.pageX - 100);
        $('.dismiss-list').fadeIn();
    }

    $('.create-call').click(function() {
        createCall2.remove();
        $('.assign-list').fadeOut();
        $('.marked-notify-main').prepend(createCalls);
        assing();
    })

    $('.dismiss-ping').click(function() {
        createCall2.remove();
        $('.assign-list').fadeOut();

        $.post('https://nmsh-second-dispatch/dismiss_call-1', JSON.stringify({
            number: roninNumber
        }));
    })

    function assing() {
        $('.notify-border').on('mousedown', function(e) {
            roninNumber = Number($.trim($(this).children('div').first().children('div').first().children('div').first().children('span').text()))
            console.log(roninNumber)
            var check = $(this).hasClass('called');
            var check2 = $(this).hasClass('dismissed')
            coords = [ Number($(this).attr("x")), Number($(this).attr("y")) ];
            

            if (check == false) {
                createCall2 = $(this);
                createCalls = $(this).html();
                createCalls = `<div class="notify-border called" aria-haspopup="true" x="${coords[0]}" y="${coords[1]}">${createCalls}
            <div class="yonlendirme-div"><p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary" style="word-break: break-word;">Police: (0)</p>
            </div></div>`
                
                assingTimeOutID = setTimeout(function() {
                    assingList(e);
                    $('.asssing-close-click').click(function() {
                        $('.assign-list').fadeOut();
                    })
                    $('.asssing-close-click').click(function() {
                        $('.assign-list').fadeOut();
                    })
                }, 100);
            } else {
                if (check2 == true) {
                    createCall4 = $(this);
                    assingTimeOutID = setTimeout(function() {
                        dismissList(e);
                        $('.asssing-close-click').click(function() {
                            $('.dismiss-list').fadeOut();
                        })
                        $('.asssing-close-click').click(function() {
                            $('.dismiss-list').fadeOut();
                        })
                    }, 100);
                } else {
                    createCall3 = $(this);
                    assingTimeOutID = setTimeout(function() {
                        calledList(e);
                        $('.asssing-close-click').click(function() {
                            $('.called-list').fadeOut();
                        })
                        $('.asssing-close-click').click(function() {
                            $('.called-list').fadeOut();
                        })
                    }, 100);
                }
            }
        }).on('mouseup mouseleave', function() {
            clearTimeout(assingTimeOutID);
        });
    }

    assing();



    $('.dismiss-ping').click(function() {

        var number = Number($.trim(createCall2.children('div').first().children('div').children('div').first().text()))
        test[number].remove(map);
        createCall2.remove();
        $('.assign-list').fadeOut();
    })

    $('.set-gps').click(function() {
        $.post('https://nmsh-second-dispatch/set-coords', JSON.stringify({
                    number: roninNumber
        }));
        $('.assign-list').fadeOut();
        assing();
    })

    function assignButtons(){
        $('.assing-buttons').click(function() {
            $.post('https://nmsh-second-dispatch/add_police-assign', JSON.stringify({
                ronin: '.assing-buttons'
            }));
        })
    }

    function asignosurukcureniyecalismioallahinisikiyimyeterhayatimisikiyimya(sa) {
        var text = $.trim($(sa).text());
            text = text.split(" ", 1);
            var textS = $.trim($(sa).text()).split(" ", 1)[0];
    
            $(`
                <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name call-came ${text}"><span class="MuiChip-label MuiChip-labelSmall user-who">${text}</span></div>
               `).insertAfter($(createCall3.children('.yonlendirme-div').children('.MuiTypography-root').first()))
               callCameRemove()

               $('.call-came').each(function() {
                if ($.trim($(sa).text()) == textS) {
                    var checkID = $(sa).attr('class').slice(76);
                    if ($(`.${checkID}`).length == 2) {
                        $(sa).remove();
                    }
                } else {}
            })

            createCall3.children('.yonlendirme-div').children('.MuiTypography-root').first().html(`Police: (${createCall3.children('.yonlendirme-div').children('.MuiChip-root').length})`)
    }
    assignButtons();


    $('.crate-dismiss').click(function() {
        $('.dismiss-list').fadeOut();
        createCall4.removeClass('dismissed')
        $.post('https://nmsh-second-dispatch/create_call-2', JSON.stringify({
            number: roninNumber
        }));
    })

    $('.remove-dismis-ping').click(function() {
        $('.dismiss-list').fadeOut();
        createCall4.remove();
        $.post('https://nmsh-second-dispatch/remove-call', JSON.stringify({
            number: roninNumber
        }));
    })

    // Table Edi

    function createOwner(result) {
        var html = '';
        for(var k in result) {
            if (result[k].owner) {
                html += `
                <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true">
                <div class="MuiChip-root MuiChip-colorPrimary 
                MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who"
                >${result[k].owner}</span></div>
                </div>
                `
            }
        }
        return html;
    }

    function cureungotunu() {
        // var allsiz = createOwner(table);
        // console.log(allsiz);
        // if (allsiz) {
        //     $('.mesai-personel').remove();
        //     $('.mesai-personel').append(createOwner(table));
        // }

        $('.remove-unit').click(function() {

            var player = $.trim(dblClick.text());
            var numbercheck = dblClick.parent('div').parent('div').children('.mesai-personel').length;
            console.log(numbercheck)
            if(numbercheck == 1){
                dblClick.parent('div').parent('div').parent('div').remove();
            } else{
                dblClick.parent('div').remove();
            }

            $.post('https://nmsh-second-dispatch/delete', JSON.stringify({
                name: player
            }));
            
            test2[player].remove(map);
        });

        $('.operator-tasima').click(function() {
            var text = $.trim($(this).text()).slice(17);
            var owner = text
            $('.mesai-personel').each(function() {
                if ($.trim($(this).text()) == text) {
                    var innerText = holdedCon.text();
                    var length = holdedCon.parent('div');
                    holdedCon.remove();
                    if (length.children().length == 0) {
                        length.parent('div').remove();
                    }

                    $(this).parent('div').append(`
                    <div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true">
                    <div class="MuiChip-root MuiChip-colorPrimary 
                    MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who"
                    >${innerText}</span></div>
                    </div>
                    `)

                    var player = policeName



                    if (owner == player) {
                        
                        $.post('https://nmsh-second-dispatch/delete', JSON.stringify({
                            name: player
                        }));
                        
                        test2[player].remove(map);

                    } else {
                        $.post('https://nmsh-second-dispatch/under-police', JSON.stringify({
                            player: player,
                            owner: owner
                        }));
                    }


                    // console.log($.trim(innerText));
                    mesaiHold();
                    removeItem();
                    
                    mesaiHold();
                    mesaiHold();
                    cureungotunu();
                }
            })
        })
    }

    cureungotunu();

    var callCame;
    function callCameRemove(){
        $('.call-came').dblclick(function(e){
            callCame = $(this);
            $('.remove-list .MuiPaper-rounded').css('position', 'absolute');
            $('.remove-list .MuiPaper-rounded').css('top', e.pageY);
            $('.remove-list .MuiPaper-rounded').css('left', e.pageX - 100);
            $('.remove-list').fadeIn();
            $('.menu-close-click').click(function(){
                $('.remove-list').fadeOut();
            })

            $('.remove-list .MuiPaper-rounded ul li').click(function(){
                $.post('https://nmsh-second-dispatch/delete_police-assign', JSON.stringify({
                    ronin: callCame
                }));
            })
        })
    }

    // Açılma Function
    function outAc() {
        $('.out-dispatch-notifys').hide();
        $('.dispatch-inside').show();
    }
    function outKapa() {
        $('.out-dispatch-notifys').show();
        $('.dispatch-inside').hide();
    }
    // outKapa()

    // Map Kapama Açma
    function mapAc(){
        var check = $('#dispatch-map-container').css('display');
        if(check == 'block'){
            $('#dispatch-map-container').hide();
        } else {
            $('#dispatch-map-container').show();
        }
    }

    // Save
    function save(){
        var save = $('.mesai-allah-yok').html()
        
        $.post('https://nmsh-second-dispatch/save', JSON.stringify({
            html: save
        }));

        return save;
    }

    function cikan(x) {
        
        $('.mesai-personel').each(function() {
            var check = $.trim($(this).text());
            if(check == x){
                test2[x].remove(map);
                console.log($(this).parent('div').html());
                $(this).parent('div').parent('div').remove();
                save();
            }
        })
    }


    function createTablePolice2(result) {
        var html = "";
        for(var k in result) {
            if (result[k].aktif == true) {
                html += 
                `<div class="mesai-personel" aria-controls="primary-unit-menu-12" aria-haspopup="true" check="${result[k].code}">
                    <div class="MuiChip-root MuiChip-colorPrimary MuiChip-sizeSmall dispatch-name"><span class="MuiChip-label MuiChip-labelSmall user-who">${result[k].code}</span></div>
                </div>`

                $('.user-who').each(function () {
                    var check = $.trim($(this).text());
                    if(check == result[k].whounder){
                        console.log("anan")
                        console.log(html)
                        $(this).parent('div').parent('div').parent('div').append(html);
                    }
                })
            }
        }
    }

    function ilkSilme(){
        $('.mesai-personel').each(function(){
            var check = $(this).attr('check');
            if($(`.mesai-personel[check="${check}"]`).length > 1){
                $(`.mesai-personel[check="${check}"]`).first().remove();
            }
        })
    }

    $('.leaflet-bottom').remove();
});