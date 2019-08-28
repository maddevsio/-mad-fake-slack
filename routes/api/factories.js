const responses = require('../responses');
const utils = require('./utils');
const faker = require('faker');
let generationId = 1;

function createMessageResponse({
  type,
  ts,
  text,
  channel,
  hideHeader
}, { user, team }) {
  const response = utils.copyObject(responses['chat.postMessage']);
  const msgTs = ts || utils.createTs(generationId);
  generationId += 1;
  response.ts = msgTs;
  response.channel = channel;

  const overrideProperties = {
    client_msg_id: faker.random.uuid(),
    text,
    type,
    user: user.id,
    team: team.id,
    user_team: team.id,
    source_team: team.id,
    channel,
    event_ts: msgTs,
    ts: msgTs,
    hideHeader
  };

  response.message = {
    ...response.message,
    ...overrideProperties
  };
  return response;
}

module.exports = {
  createMessageResponse
};
