function AJAX_BOOM() {
    var f = new FormData();
    f.append("4457877484", "io988ufgty67785");
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var myObj = this.responseText;
            var files = myObj.split(',');
            res = document.getElementById("res")//.innerHTML = myObj;
            res.innerHTML = "";
            for (i = 0; i < files.length - 1; i++) {
                res.innerHTML += files[i] + ": <button class=\"download\" onclick=\"download.call(this)\" id=\"" + files[i] + "\">download</button>" + "<button class=\"delete\" onclick=\"del.call(this)\" id=\"" + files[i] + "\">delete</button><br>";
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

    var oOutput = document.getElementById("res"),
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
    };

    oReq.send(oData);
    ev.preventDefault();
}, false);


var download = function () {
//                var ax_id = this.id.toString().trim();
    console.log(this.id.toString().trim());
    url = "http://localhost:8080/test/download.jsp?fileName=" + this.id.toString().trim();
    var z = window.open(url);
    return false;
}

var del = function () {

    file = this.id;

    var oOutput = document.getElementById("res"),
            oData = new FormData();
    oData.append('fileName',file);
    oData.append("CustomField", "This is some extra data");

    var oReq = new XMLHttpRequest();
    oReq.open("POST", "./delete.jsp?"+"fileName="+file, true);
    oReq.onload = function (oEvent) {
        if (oReq.status == 200) {
            if (this.responseText.toString().trim() == "deleted") {
                oOutput.innerHTML = file + " deleted!";
            }
            else {
                oOutput.innerHTML = file+ " " + "ERROR SOMEWHERE!";
                console.log("ERR:"+this.responseText);
            }
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
    if(flag === 'START'){
        sent_flag = 'START';
    }
    else{
        sent_flag = 'STOP';
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