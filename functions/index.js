/* eslint-disable require-jsdoc */
/* eslint-disable max-len */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const {WebhookClient} = require("dialogflow-fulfillment");
admin.initializeApp();

const db = admin.firestore();

exports.dialogflowFirebaseFulfillment = functions.https.onRequest((request, response) => {
  const agent = new WebhookClient({request, response});

  // Extract userId from the request
  const userId = request.body.originalDetectIntentRequest.payload.userId ||
  "default_user";

  function handleCollectFullName(agent) {
    const fullname = agent.parameters.fullname;
    const nameRegex = /^[A-Za-z\s]+$/;
    if (!fullname || !nameRegex.test(fullname)) {
      agent.add("Sorry, I didn't get your full name. Could you please repeat it?");
      return;
    }

    const partialData = {fullname, timestamp: admin.firestore.FieldValue.serverTimestamp()};
    return updateFirestore(partialData, userId, agent);
  }

  function handleCollectUsername(agent) {
    const username = agent.parameters.username;
    if (!username) {
      agent.add("Sorry, I didn't get your username. Could you please repeat it?");
      return;
    }

    const partialData = {username, timestamp: admin.firestore.FieldValue.serverTimestamp()};
    return updateFirestore(partialData, userId, agent);
  }

  function handleCollectDOB(agent) {
    const dateOfBirth = agent.parameters.date;
    if (!dateOfBirth) {
      agent.add("Sorry, I didn't get your date of birth. Please enter it in YYYY-MM-DD format.");
      return;
    }

    const partialData = {dateOfBirth, timestamp: admin.firestore.FieldValue.serverTimestamp()};
    return updateFirestore(partialData, userId, agent);
  }

  function updateFirestore(partialData, userId, agent) {
    return db.collection("user_response")
        .doc(userId)
        .set(partialData, {merge: true})
        .then(() => {
          console.log("Partial user response written to Firestore.");

          return db.collection("user_response").doc(userId).get();
        })
        .then((docSnapshot) => {
          if (docSnapshot.exists) {
            const data = docSnapshot.data();

            if (data.fullname && data.username && data.dateOfBirth) {
              return db.collection("user_responses")
                  .doc(userId)
                  .set(data, {merge: true})
                  .then(() => {
                    return db.collection("user_response").doc(userId).delete();
                  })
                  .then(() => {
                    response.status(200).send("User stored successfully.");
                  });
            } else {
              // agent.add("Awaiting more information.");
              console.log("Awaiting more information.");
            }
          } else {
            response.status(500).send("Error retrieving temporary data.");
          }
        })
        .catch((error) => {
          console.error("Error writing to Firestore: ", error);
          response.status(500).send("Error storing user response.");
        });
  }

  const intentMap = new Map();
  intentMap.set("CollectFullName", handleCollectFullName);
  intentMap.set("CollectUsername", handleCollectUsername);
  intentMap.set("CollectDOB", handleCollectDOB);

  agent.handleRequest(intentMap);
});
