/* exported gapiLoaded */
/* exported gisLoaded */
/* exported handleAuthClick */
/* exported handleSignoutClick */

// TODO(developer): Set to client ID and API key from the Developer Console
const CLIENT_ID = '133975751666-6hnj740q7qa9pef4tgrtc5i6nhif5eis.apps.googleusercontent.com';
const API_KEY = 'AIzaSyAebEgcRugex4c_DH0B8HVeB0qwwpuA6DI';

// Discovery doc URL for APIs used by the quickstart
const DISCOVERY_DOC = 'https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest';

// Authorization scopes required by the API; multiple scopes can be
// included, separated by spaces.
const SCOPES = 'https://www.googleapis.com/auth/calendar.events';

let tokenClient;


/**
 * Callback after api.js is loaded.
 */
function gapiLoaded() {
    gapi.load('client', initializeGapiClient);
}

/**
 * Callback after the API client is loaded. Loads the
 * discovery doc to initialize the API.
 */
async function initializeGapiClient() {
    await gapi.client.init({
        apiKey: API_KEY,
        discoveryDocs: [DISCOVERY_DOC],
    });
    gapiInited = true;
    maybeEnableButtons();
}

/**
 * Callback after Google Identity Services are loaded.
 */
function gisLoaded() {
    tokenClient = google.accounts.oauth2.initTokenClient({
        client_id: CLIENT_ID,
        scope: SCOPES,
        callback: '', // defined later
    });
    gisInited = true;
    maybeEnableButtons();
}

/**
 * Enables user interaction after all libraries are loaded.
 */


/**
 *  Sign in the user upon button click.
 */
function handleAuthClick() {
    tokenClient.callback = async (resp) => {
        if (resp.error !== undefined) {
            throw (resp);
        }

        await insertSchoolEventToGoogleCalendar();
    };

    if (gapi.client.getToken() === null) {
        // Prompt the user to select a Google Account and ask for consent to share their data
        // when establishing a new session.
        tokenClient.requestAccessToken({ prompt: 'consent' });
    } else {
        // Skip display of account chooser and consent dialog for an existing session.
        tokenClient.requestAccessToken({ prompt: '' });
    }
}

/**
 *  Sign out the user upon button click.
 */

/**
 * Print the summary and start datetime/date of the next ten events in
 * the authorized user's calendar. If no events are found an
 * appropriate message is printed.
 */


async function insertSchoolEventToGoogleCalendar() {
    console.log(activityBeen.startTime.replace(" ", "T").replaceAll("/", "-"))
    console.log(activityBeen.endTime.replace(" ", "T").replaceAll("/", "-"))
    const event = {
        'summary': activityBeen.title,
        'location': `${activityBeen.place} ${activityBeen.address}`,
        'description': '來自好學生網站活動。',
        'start': {
            'dateTime': `${activityBeen.startTime.replace(" ", "T").replaceAll("/", "-")}:00+08:00`,
            'timeZone': 'Asia/Taipei'
        },
        'end': {
            'dateTime': `${activityBeen.endTime.replace(" ", "T").replaceAll("/", "-")}:00+08:00`,
            'timeZone': 'Asia/Taipei'
        },
        'recurrence': [
            'RRULE:FREQ=DAILY;COUNT=2'
        ],
        'reminders': {
            'useDefault': false,
            'overrides': [
                { 'method': 'email', 'minutes': 24 * 60 },
                { 'method': 'popup', 'minutes': 10 }
            ]
        }
    };

    const request = gapi.client.calendar.events.insert({
        'calendarId': 'primary',
        'resource': event
    });

    request.execute(function (resp) {
        console.log(resp);
        Swal.fire({
            icon: 'success',
            title: '加入成功',
            html: '已將活動加入Google行事曆中',
            width: "300px",
        })
    });
}