$(function () {
    //調出考卷
    $('#paperbtn').click(function () {

        $.ajax({
            type: 'post',
            url: 'ExamMyMemRecordSe',
            dataType: 'json',
            success: function (data) {

                console.log(data);


                let thead =
                    "<th>卷名</th>" +
                    "<th>分數</th>" +
                    "<th>重考</th>" +
                    "<th>刪除</th>"

                $('#paperth').empty();
                $('#paperth').append(thead);

                $('#papertb').empty();
                for (var i = 0; i < data.length; i++) {
					console.log(data[i]);
                    let content =
                        "<tr>" +
                        "<td style='text-align:left'>" + data[i].examName + "</td>" +
                        "<td>" + data[i].examscore + "</td>" +
                        "<td><form  action='ReExam' method='post'>"+
                        "<button class='testAgain'>重考</button>" +
                        "<input type='hidden' name='examRecordId' value='"+data[i].examMemRecordId+"'> "+
                        "</form></td>"+
                        "<td style='display:none'>" + data[i].examMemRecordId + "</td>" +
                        "<td><button class='del'>Del</button></td>" +
                        "</tr>";
                    $('#papertb').append(content);

                }
            }, error: function (e) {
                console.log(e);
            }

        });

        $('#papertb').on('click', '.del', function () {

            $(this).closest('tr').remove();

            var Id = $(this).parent().prev().text();

            console.log('Id' + Id);

            var params = { "Id": "" + Id }

            $.ajax({
                type: 'post',
                url: 'ExamMyMemRecordDe',
                data: params,
                dataType: 'json',
                success: function (dataDe) {

                }, error: function (e) {

                }
            })
        })
		
		
//		$('#papertb').on('click', '.testAgain', function () {
//
//            var Id = $(this).parent().next().text();
//
//            console.log('examRecordId' + Id);
//
//            var params = { "examRecordId": "" + Id }
//
//            $.ajax({
//                type: 'post',
//                url: 'ReExam',
//                data: params,
//                dataType: 'json',
//                success: function (dataDe) {
//
//                }, error: function (e) {
//
//                }
//            })
//        })

    });

})
