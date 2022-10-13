$(function () {
    $("#resbtn").click(function () {

        var resultText = "";

        $.ajax({
            type: 'post',
            url: 'ExamMyMemSe',
            dataType: 'json',
            success: function (data) {

                console.log(data);

                var theadremain = $('k').text();
                console.log(theadremain);
                console.log(typeof (theadremain))

                let thead =
                    "<th id='k' class='thcs'>題目</th>" +
                    "<th class='thcs'>答案</th>" +
                    "<th class='thcs'>刪除</th>"

                $('#resth').empty();
                $('#resth').append(thead);

                $('#restb').empty();
                for (var i = 0; i < data.length; i++) {

                    var optContent = "";
                    if (data[i].examQues.quesAnswer == "A") {
                        optContent = data[i].examQues.optA;
                    } else if (data[i].examQues.quesAnswer == "B") {
                        optContent = data[i].examQues.optB;
                    } else if (data[i].examQues.quesAnswer == "C") {
                        optContent = data[i].examQues.optC;
                    } else {
                        optContent = data[i].examQues.optD;
                    }
                    console.log(optContent);

                    let content =

                        "<tr>" +

                        "<td style='text-align:left'>" + data[i].examQues.quesContent + "</td>" +
                        "<td style='display:none'>" + data[i].examReserveID + "</td>" +
                        //                             "<input type='hidden' id='k' value="+data[i].examReserveID+">"+
                        "<td><button class='ans'>答案</button></td>" +
                        "<td><button class='del'>刪除</button></td>" +
                        //                             "<td>" + data[i].examReserveID + "</td>" +
                        "</tr>" +
                        "<tr>" +
                        "<td style='display:none'>" + optContent + "</td>" +
                        "</tr>";

                    $('#restb').append(content);

                }
                console.log(resultText);
            }, error: function (e) {
                console.log(e);
            }

        });

        $('#restb').on('click', '.del', function () {

            $(this).closest('tr').remove();

            var Id = $(this).parent().prev().prev().text();


            var params = { "Id": "" + Id }

            $.ajax({
                type: 'post',
                url: 'ExamMyMemDe',
                data: params,
                dataType: 'json',
                success: function (dataDe) {

                }, error: function (e) {

                }
            })
        })

        $('#restb').on('click', '.ans', function () {

            var a = $(this).closest('tr').next().children('td');

            console.log(a.text());
            console.log(a.css("display"));


            if (a.css("display") == "none") {

                a.css("display", "block");

            } else if (a.css("display") == "block") {

                a.css("display", "none");

            }


        })


    });
	
	
});