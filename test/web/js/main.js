function AJAX_BOOM() {
    var f = new FormData();
    f.append("4457877484", "io988ufgty67785");
    var xmlhttp = new XMLHttpRequest();
    document.getElementById("res").innerHTML = "<i class=\"fa fa-spinner fa-spin\"></i>";
    xmlhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var myObj = this.responseText;
            var files = myObj.split(',');
            res = document.getElementById("res")//.innerHTML = myObj;
            res.innerHTML = "";
            for (i = 0; i < files.length - 1; i++) {
                res.innerHTML += "<tr><td>"+ files[i] + "</td><td><a class=\"download btn btn-primary\" href=\"download.jsp?fileName=" + files[i] + "\">download</a>&nbsp;" + "<button class=\"delete btn btn-primary\" onclick=\"del.call(this)\" id=\"" + files[i] + "\">delete</button></td></tr>";
            }
        }
        if(this.readyState === 4 && this.status === 402){
            console.log('LOGIN!');
        }
    };
    xmlhttp.open("POST", "http://localhost:8080/test/getfilenames.jsp", true);
    xmlhttp.send(f);
    return false;
}

var form = document.getElementById("form_1");

form.addEventListener('submit', function (ev) {

document.getElementById("response").innerHTML = "<i class=\"fa fa-spinner fa-spin\"></i>";
    var oOutput = document.getElementById("response"),
            oData = new FormData(form);

    oData.append("CustomField", "This is some extra data");

    var oReq = new XMLHttpRequest();
    oReq.open("POST", "./upload.jsp", true);
    oReq.onload = function (oEvent) {
        if (oReq.status == 200) {
            oOutput.innerHTML = "Uploaded!";
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file.<br \/>";
        }
        AJAX_BOOM();
    };

    oReq.send(oData);
    ev.preventDefault();
}, false);


var download = function () {
//                var ax_id = this.id.toString().trim();
    console.log(this.id.toString().trim());
    url = "download.jsp?fileName=" + this.id.toString().trim();
    var z = window.open(url);
    return false;
};

var del = function () {

    file = this.id;

    var oOutput = document.getElementById("response"),
            oData = new FormData();
    oData.append('fileName',file);
    oData.append("CustomField", "This is some extra data");

    var oReq = new XMLHttpRequest();
    oReq.open("POST", "./delete.jsp?"+"fileName="+file, true);
    oReq.onload = function (oEvent) {
        if (oReq.status === 200) {
            if (this.responseText.toString().trim() === "deleted") {
                oOutput.innerHTML = file + " deleted!";
            }
            else {
                oOutput.innerHTML = file+ " " + "ERROR SOMEWHERE!";
                console.log("ERR:"+this.responseText);
            }
            AJAX_BOOM();
        } 
        else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file.<br \/>";
        }
    };

    oReq.send();
//    ev.preventDefault();

    return false;

};

function LOCKER(){
    var lock = document.getElementById('l');
    flag = lock.innerHTML;
    if(flag === 'LOCK'){
        sent_flag = 'LOCK';
    }
    else{
        sent_flag = 'UNLOCK';
    }
    var oReq = new XMLHttpRequest();
    oReq.open("POST", "./lock_unlock.jsp?", true);
    oReq.onload = function (oEvent) {
        if (oReq.status === 200) {
                lock.innerHTML = this.responseText.toString().trim();
        } 
        else {
            document.getElementById('res').innerHTML = "Error " + oReq.status;
        }
    };

    oReq.send(sent_flag);

    return false;

}


var searchFiles = function () {

    fileName = document.getElementById("search").value;

    var oOutput = document.getElementById("response");

    var oReq = new XMLHttpRequest();
    oReq.open("POST", "./searchFile.jsp?"+"query="+fileName, true);
    oReq.onload = function (oEvent) {
        if (oReq.status === 200) {
            var myObj = this.responseText;
            var files = myObj.split(',');
            res = document.getElementById("res");//.innerHTML = myObj;
            res.innerHTML = "";
            for (i = 0; i < files.length - 1; i++) {
                res.innerHTML += "<tr><td>"+ files[i] + "</td><td><a class=\"download btn btn-primary\" href=\"download.jsp?fileName=" + files[i] + "\">download</a>&nbsp;" + "<button class=\"delete btn btn-primary\" onclick=\"del.call(this)\" id=\"" + files[i] + "\">delete</button></td></tr>";
            }
        } 
        else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file.<br \/>";
        }
    };
    oReq.send();
    return false;
};