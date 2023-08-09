function popupMsg(type, title, text, footer, link, linkTitle) {
    if(link != null && linkTitle != null) footerDescription = '<p><a href="'+link+'"><button type="button" class="btn btn-primary">'+linkTitle+'</button></a></p>';
    else footerDescription = null;
    Swal.fire({
        type: type,
        title: title,
        text: text,
        footer: footer + footerDescription
    }).then(function() {
        window.location = link;
    });
}

function popupMsg2(type, title, text, footer, link, linkTitle) {
    if(link != null && linkTitle != null) footerDescription = '<p><a href="'+link+'"><button type="button" class="btn btn-primary">'+linkTitle+'</button></a></p>';
    else footerDescription = null;
    Swal.fire({
        type: type,
        title: title,
        text: text,
        footer: footer + footerDescription
    });
}

function preview_image(event, b)
{
    var reader = new FileReader();
    reader.onload = function()
    {
        var output = document.getElementById(b);
        output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
}

function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    let user = getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            setCookie("username", user, 365);
        }
    }
}

$("#carian_produk").on("change", function() {
    var value = $("#carian_produk").val();
    var nilai = $('#search_terms [value="' + value + '"]').data('value');
    const myArray = nilai.split("|");
    tambahProduk(myArray[0], myArray[1], myArray[2], 1, myArray[4], myArray[5]);
});
$('#carian_produk').focus();
$(document).ready(function(){
    if( $('#myTable').length ) {
        $('#myTable').DataTable();
    }
    if( $('#example').length ) {
        var table = $('#example').DataTable({
            "columnDefs": [{
                "visible": false,
                "targets": 2
            }],
            "order": [
                [2, 'asc']
            ],
            "displayLength": 25,
            "drawCallback": function (settings) {
                var api = this.api();
                var rows = api.rows({
                    page: 'current'
                }).nodes();
                var last = null;
                api.column(2, {
                    page: 'current'
                }).data().each(function (group, i) {
                    if (last !== group) {
                        $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                        last = group;
                    }
                });
            }
        });
    }

    $('.buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel').addClass('btn btn-primary mr-1');
    $.urlParam = function (name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)')
            .exec(window.location.search);

        return (results !== null) ? results[1] || 0 : false;
    }
    $.urlParamAJAX = function (name, url) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)')
            .exec(url);

        return (results !== null) ? results[1] || 0 : false;
    }
});