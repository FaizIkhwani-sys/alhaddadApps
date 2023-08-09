function addslashes(string) {
    return string.replace(/\\/g, '').
    replace(/\u0008/g, '').
    replace(/\t/g, '').
    replace(/\n/g, '').
    replace(/\f/g, '').
    replace(/\r/g, '').
    replace(/'/g, '').
    replace(/"/g, "\\'");
    replace(/\\/g, '');
}

function addslashes2(string) {
    return string.replace(/\\/g, '').
    replace(/\u0008/g, '').
    replace(/\t/g, '').
    replace(/\n/g, '').
    replace(/\f/g, '').
    replace(/\r/g, '').
    replace(/'/g, '"').
    replace(/\\/g, '');
}

function pilihanBayaran(data) {
    $('#paymentChannelContainer').html('');
    var selected;
    var htmlData = '';
    htmlData += '<span class="input-group-text fw-bold fs-5" id="basic-addon6">Cara Bayaran &nbsp;<i class="fa-solid fa-cash-register fa-2xl"></i></span>\n' +
                '<select id="paymentChannel" name="paymentChannel" class="form-control form-select terima-bayaran" required>\n';
    $.each(data['pilihan'], function(i, obj) {
        if(obj['id'] == 192) selected = "selected";
        else selected = "";
        htmlData += '<option value="'+obj['id']+'" '+selected+'>'+obj['pilihanLabel']+'</option>\n';
    });
    htmlData += '</select>\n';
    $('#paymentChannelContainer').show();
    $('#paymentChannelContainer').append(htmlData);
}

function lihatProduk(data) {
    $('#listProduk, #search_terms').html('');
    $.each(data['senaraiProduk'], function(i, obj) {
        var varianHarga = addslashes(obj['variansHarga']);
        if(varianHarga == "" || varianHarga == null || varianHarga == "null") varianHarga = 0;
        htmlData = '<div draggable="true" ondragstart="drag(event, \''+obj['id']+'\', \''+obj['name']+'\', \''+obj['harga']+'\', 1, '+obj['qahwa']+', \''+varianHarga+'\')" class="col-12 col-md-4">\n' +
            '        <div class="card card-product-grid" onclick="tambahProduk(\''+obj['id']+'\', \''+obj['name']+'\', \''+obj['harga']+'\', 1, '+obj['qahwa']+', \''+varianHarga+'\')">\n' +
            '            <a class="img-wrap p-2"> <img style="height: 128px; width: auto" class="img-fluid" src="https://alhaddad-admin.myrichappsproject.tk/uploads?maxSize2=128&file='+obj['image']+'" alt="'+obj['name']+'" /> </a>\n' +
            '            <div class="info-wrap">\n' +
            '                <h4 class="font-weight-bold">'+obj['name']+'</h4>\n' +
            '                <div class="price mt-1 font-weight-bold">RM'+obj['harga']+'</div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>';
        searchTerms = '<option data-value="'+obj['id']+'|'+obj['name']+'|'+obj['harga']+'|1|'+obj['qahwa']+'|'+varianHarga+'" value="'+obj['sku']+'"></option>';
        $('#listProduk').append(htmlData);
        $('#search_terms').append(searchTerms);
    });
}

function lihatProfil(data) {
    $('#custInfo').html('');
    $.each(data['getUserPoints'], function(i, obj) {
        point = 0;
        wallet = 0;
        if(obj['point'] != "") point = obj['point'];
        if(obj['wallet'] != "") wallet = obj['wallet'];
        if(obj['namaPenuh'] != "" && point != 0) $('#pointAda').show();
        else $('#pointAda').hide();
        if(obj['namaPenuh'] != "" && wallet != 0) $('#walletAda').show();
        else $('#walletAda').hide();
        htmlData = '<div class="col-12">' +
            '<div class="alert alert-success fw-bold" role="alert">' +
            '<h3>'+obj['namaPenuh']+'</h3>' +
            '<h3>Baki Point: RM '+point+'</h3>' +
            '<input type="hidden" id="profil_id" name="profil_id" value="'+obj['profil_id']+'">' +
            '</div></div>';
    });
    $('#custInfo').html(htmlData);
    $('#walletLabel').attr('max', wallet);
    $('#bakiPoint').val(point);
    $('#pointLabel').attr('max', point);
}

function simpanOrder(data, code) {
    if(code == 201) selfUpdate(null, 1, 'dynamic/numberReports', null, 'POST', 0);
    selfLoad('main.html', '#isi_utama', 0);
}

function updateReports(data) {
    $.each(data['numberReports'], function(i, obj) {
        $('#numberReports').html(obj['semua']);
        $('#allReports').html(obj['semua']);
        $('#qahwaReports').html(obj['qahwa']);
        $('#otherReports').html(obj['biasa']);
    });
}

function loadAPI(api, data, code) {
    if(api == 'dynamic/products') lihatProduk(data);
    else if(api == 'dynamic/getUserPoints') lihatProfil(data);
    else if(api == 'simpanOrder') simpanOrder(data, code);
    else if(api == 'dynamic/numberReports') updateReports(data);
    else if(api == 'dynamic/getPilihan/13') pilihanBayaran(data);
}