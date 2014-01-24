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
#   hubot I need help -- Here you go: https://tmcyf.slack.com/help
#   hubot <user> needs help or can't slack -- <user> - Here you go: https://tmcyf.slack.com/help
#   hubot show <user> the ropes -- Here you go, <user>: https://tmcyf.slack.com/help
#
# Author:
#   ivanvarghese

module.exports = (robot) ->

  robot.respond /(I need help)/i, (msg)->
    msg.send "Here you go: https://tmcyf.slack.com/help"

  robot.respond /(.*)\b(needs help|can'?t slack)\b/i, (msg)->
    name = msg.match[1].trim()
    if name.length == 0
      msg.send "Who?"
    else
      msg.send(name + " - Here you go: https://tmcyf.slack.com/help")

  robot.respond /(show)(.*)?(the ropes)/i, (msg)->
    name = msg.match[2].trim()
    if name.length == 0
      msg.send "Who?"
    else
      msg.send("Here you go, " + name + ": https://tmcyf.slack.com/help")
