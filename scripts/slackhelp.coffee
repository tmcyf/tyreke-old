# Description:
#   Returns Slack help page.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot I need help -- Don't worry, <user>, I've got you covered : https://tmcyf.slack.com/getting-started/users
#   hubot <user> needs help or can't slack -- <user> - Here you go: https://tmcyf.slack.com/getting-started/users
#   hubot show <user> the ropes -- Here you go, <user>: https://tmcyf.slack.com/getting-started/users
#   hubot show me the help docs -- As you wish: https://tmcyf.slack.com/getting-started/users
#
# Author:
#   ivanvarghese

module.exports = (robot) ->

  robot.respond /(I need help)/i, (msg)->
    name = msg.message.user.name
    msg.send("Don't worry, " + name + ", I've got you covered: https://tmcyf.slack.com/getting-started/users")

  robot.respond /(show me the help docs)/i, (msg)->
    msg.send "As you wish: https://tmcyf.slack.com/getting-started/users"

  robot.respond /(.*)\b(needs help|can'?t slack)\b/i, (msg)->
    name = msg.match[1].trim()
    if name.length == 0
      msg.send "Who?"
    else
      msg.send(name + " - Here you go: https://tmcyf.slack.com/getting-started/users")

  robot.respond /(show)(.*)?(the ropes)/i, (msg)->
    name = msg.match[2].trim()
    if name.length == 0
      msg.send "Who?"
    else
      msg.send("Here you go, " + name + ": https://tmcyf.slack.com/getting-started/users")
