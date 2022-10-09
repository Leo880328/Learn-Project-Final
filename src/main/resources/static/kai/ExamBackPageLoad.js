
$().ready(
    function () {
        examQueryAll();


    }
)




function examQueryAll() {

    $.ajax({
        type: 'post',
        url: 'examQueryAll',
        dataType: 'json',
        success: function (data) {

            console.log(data);

            data.forEach(function (exam, index, array) {
                let table = $('.tb').DataTable();
                table.row.add(createExam(exam, index)).draw();
            });

        }, error: function (e) {
            console.log(e);
        }

    });

}


function createExam(exam, index) {
	var status = `${exam.examStatus}`;
	if( status == "0"){
		updateBtn=`<input type='submit' class='btn btn-danger' value='審查/更新'>`;
	} else {
		updateBtn=`<input type='submit' class='btn btn-success' value='更新'>`;
	};
	
	
    let examContent = [
        `${(index + 1)}`,
        `<img src="${exam.examPic}" width='100'>`,
        `${exam.subject.subjectName}`,
        `${exam.education.educationName}`,
        `${exam.examName}`,
        `${exam.stringDate}`,
        `${exam.member.name}`,
        `${exam.difficulty}`,
        `${exam.testNumber}`,
        `${exam.avgScore}`,
        // "<td style='display:none''>" + exam.examID + "</td>" ,


        `<button class='del btn btn-primary' 
        value="${exam.examID}" >Del</button>`,
		
        `<form action='examUpdate' method='post'>
        <input type='hidden' name='examId' value='${exam.examID}'>
        ${updateBtn}
        </form></td>`,

        `<td><form action='ExamEstaTest' method='post'>
        <input type='hidden' name='examId' value='${exam.examID}'>
        <input type='submit' class='btn btn-primary' value='考試'>
        </form></td>`
    ]

    return examContent;
}
$('.tb').on('click', '.del', function () {
    let id = this.value;

    var params = { "examId": `${id}` }
    console.log(params)
    console.log($(this).closest("tr"))
     $.ajax({
         type: 'post',
         url: 'ExamDe',
         data: params,
         dataType: 'json',
         success: function (dataDe) {
             let table = $('.tb').DataTable();
             table.row().delete();
         }, error: function (e) {
             alert(e);
         }
     })
    let table = $('.tb').DataTable();
    console.log(table)
    $(this).closest("tr").remove();
});



