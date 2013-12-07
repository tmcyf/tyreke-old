# Description:
#   Hubot delivers a pic from Reddit's /r/cats frontpage
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   cats - Display the picture from /r/cats
#
# Author:
#   eliperkins

module.exports = (robot) ->
  robot.respond /cats/i, (msg) ->
    search = escape(msg.match[1])
    msg.http('http://www.reddit.com/r/cats.json')
      .get() (err, res, body) ->
        result = JSON.parse(body)

        if result.data.children.count <= 0
          msg.send "Couldn't find anything cute..."
          return

        urls = [ ]
        for child in result.data.children
          urls.push(child.data.url)

        rnd = Math.floor(Math.random()*urls.length)
        msg.send urls[rnd]
