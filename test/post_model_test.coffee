request = require 'supertest'

Post = require process.cwd() + '/.app/models/post'
app = require process.cwd() + '/.app'
app.settings.env = 'test'


postOne = {
  "title":"SomeTitle",
  "content":"body of post",
  "url":"some url",
  "labels": ["ToEat", "adventures", "pizza"]
}

postTwo = {
  "title":"Another title",
  "content":"another body of post",
  "url":"some another url"
  "labels": ["ToEat", "adventures", "chicken"]
}

logSave = ( error, model) ->
  if error
    console.log("something went wrong#{error}")
  else
    console.log("model saved!:#{model}")


createPostFixtures = (done) ->
  new Post(postOne).save(logSave)
  new Post(postTwo).save(logSave)
  done()


# cleanDB = (done) ->
#   Post.remove {}, ->
#     done()

describe 'Post', ->
  #before cleanDB
  #before createPostFixtures
  
  post_id = null

  it "should have a class method to search for by labels", (done) ->
    Post.findWithLabels("To See", ["adventures"], (error, posts) ->
      #console.log("RESULT!!!!#{posts}")
      posts.length.should.eql(3)
      done()
    )

  # it "should search for labels using an array instead of a splat", (done) ->
  #   labels = ["To See", "adventures"]
  #   Post.findWithLabels("To See", ["adventures"], (error, posts) ->
  #     #console.log("RESULT!!!!#{posts}")
  #     posts.length.should.eql(3)
  #     done()
  #   )
    
