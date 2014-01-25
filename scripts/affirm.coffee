# Description:
#   Affirms the user.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   am i right - hubot responds
#
# Author:
#   ivanvarghese

responses = [
  "dude, totally!",
  "when are you not?",
  "I can't really say.",
  "Of course you're right!"
]

module.exports = (robot) ->
  robot.hear /\b(am i right|right tyreke)(.*)(?:)?\b/i, (msg)->
    msg.send msg.random responses
