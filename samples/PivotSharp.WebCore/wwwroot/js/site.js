// https://stackoverflow.com/questions/6396101/pure-javascript-send-post-data-without-a-form
window.post = function (url, data, requestVerificationToken) {
   return fetch(url, {
      method: "POST",
      headers: {
         'Content-Type': 'application/json',
         'RequestVerificationToken': requestVerificationToken
      },
      body: JSON.stringify(data)
   });
}
