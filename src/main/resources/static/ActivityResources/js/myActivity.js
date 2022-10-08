"use strict"


let activityStatusCode = [
  "待確認", "報名失敗", "報名成功"
]
let jquery = {
  effectiveAttendees: ".effectiveAttendees",
  AllAttendees: ".AllAttendees",
  readMoreEffectiveButton: ".readMoreEffectiveButton",
  readMoreAllButton: ".readMoreAllButton",

}
let effectiveAttendeesPage = {
  pageSize: 4,
  pageNo: 1,
  totalPages: 1
}
let AllAttendeesPage = {
  pageSize: 4,
  pageNo: 1
}
$().ready(
  // 取直並將ActivityBean送出等待回應
  function () {
    requestEffectiveAttendees();
    requestAllAttendees();
    listener()
  }
)
function listener() {
  $(jquery.readMoreEffectiveButton).click(() => {
    readMoreEffectiveAttendees()
  });

  $(jquery.readMoreAllButton).click(() => {
    readMoreAllAttendees()
  });
}

function requestEffectiveAttendees() {
  $.ajax({
    url: "myActivities/effective",
    method: "POST",
    dataType: "JSON",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(effectiveAttendeesPage),
    success: function (attendeesPageArray) {
      console.log(attendeesPageArray)
      attendeesPageArray.content.forEach(function (attendees, index, array) {
        $(jquery.effectiveAttendees).append(createEffectiveAttendeesInformation(attendees))
      });

      effectiveAttendeesPage.totalPages = attendeesPageArray.totalPages;
      if (effectiveAttendeesPage.pageNo < effectiveAttendeesPage.totalPages) {
        $(jquery.readMoreEffectiveButton).css('visibility', 'visible')
      } else {
        $(jquery.readMoreEffectiveButton).css('visibility', 'hidden')
      }
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  })
}
function createEffectiveAttendeesInformation(attendees) {
  let title = attendees.activity.title;
  let time = attendees.activity.startTime + "~" + attendees.activity.endTime;
  let place = attendees.activity.place;
  if (!place) {
    place = '線上'
  }
  let activityId = attendees.activity.id;
  let activityInformation =
    `
    <tr style="height: 50px;">
    <td class="u-border-1 u-border-grey-40 u-table-cell"><a href="Activity/${activityId}">${title}</a></td>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${time}</td>
    <td class="u-border-1 u-border-grey-40 u-table-cell">${place}</td>
    </tr>
  `
  return activityInformation
}
function readMoreEffectiveAttendees() {
  effectiveAttendeesPage.pageNo++;
  requestEffectiveAttendees();
}
//===================================================================================
function requestAllAttendees() {
  $.ajax({
    url: "myActivities/all",
    method: "POST",
    dataType: "JSON",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(AllAttendeesPage),
    success: function (attendeesPageArray) {
      console.log(attendeesPageArray)
      attendeesPageArray.content.forEach(function (attendees, index, array) {
        $(jquery.AllAttendees).append(createAllAttendeesInformation(attendees))
      });
      AllAttendeesPage.totalPages = attendeesPageArray.totalPages;
      if (AllAttendeesPage.pageNo < AllAttendeesPage.totalPages) {
        $(jquery.readMoreAllButton).css('visibility', 'visible')
      } else {
        $(jquery.readMoreAllButton).css('visibility', 'hidden')

      }
    },
    error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
  })
}
function createAllAttendeesInformation(attendees) {
  let title = attendees.activity.title;
  let time = attendees.activity.startTime + "~" + attendees.activity.endTime;
  let activityId = attendees.activity.id;
  let activityInformation =
    `
    <tr class="banner-content" style="height: 50px;">
      <td class="u-border-1 u-border-grey-40 u-table-cell"><a href="Activity/${activityId}">${title}</a></td>
      <td class="u-border-1 u-border-grey-40 u-table-cell">${time}</td>
      <td class="u-border-1 u-border-grey-40 u-table-cell">${activityStatusCode[attendees.statusCode]}</td>
      <td class="u-border-1 u-border-grey-40 u-table-cell">${attendees.requestTime}</td>
    </tr>
  `
  return activityInformation
}
function readMoreAllAttendees() {
  AllAttendeesPage.pageNo++;
  requestAllAttendees();
}
//===================================================================================
