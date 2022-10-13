$(function () {

    console.log("fuck");
    console.log("${upBean.difficulty}");
    console.log("${examQues}");
    var test = "${examQuesNum}";

    for (var i = 0; i < test; i++) {
        console.log(i);
        console.log("${examQues.get({" + i + "}).quesAnswer}");

    }

    var subIdx = "${sessionScope.upBean.subject.subjectId}" - 1;
    console.log(subIdx);

    var eduIdx = "${sessionScope.upBean.education.educationId}" - 1;
    console.log(eduIdx);

    var diffArray = ["簡單", "中等", "困難"];
    var diffIdx = diffArray.indexOf("${sessionScope.upBean.difficulty}")

    var oselSub = document.getElementById("choSub"); //得到select的ID
    var optsSub = oselSub.getElementsByTagName("option");//得到陣列option
    optsSub[subIdx].selected = true;

    var oselEdu = document.getElementById("choEdu"); //得到select的ID
    var optsEdu = oselEdu.getElementsByTagName("option");//得到陣列option
    optsEdu[eduIdx].selected = true;

    var oselDiff = document.getElementById("choDiff"); //得到select的ID
    var optsDiff = oselDiff.getElementsByTagName("option");//得到陣列option
    optsDiff[diffIdx].selected = true;




});