request = require 'supertest'

Post = require process.cwd() + '/.app/models/post'
app = require process.cwd() + '/.app'


postOne = {
  "title":"SomeTitle",
  "content":"body of post",
  "url":"some url",
  "labels": ["ToEat", "adventures"]
}

postTwo = {
  "title":"Another title",
  "content":"another body of post",
  "url":"some another url"
  "labels": ["ToEat", "adventures"]
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

  it "should be searched for by labels", (done) ->
    #new Post(postTwo).save(logSave)
    #new Post(postOne).save(logSave)
    request(app).get("/posts/search/ToEat?labels=adventures").expect( 200, (err, res) ->
      res.body[0].should.include(postOne)
      res.body.length.should.eql(2)
      res.body[1].should.include(postTwo)
      done()
    )

  # it "should be STREAMED searched for by labels", (done) ->
  #   request(app).get("/posts/streamSearch/ToEat?labels=adventures").expect( 200, (err, res) ->
  #     # res.body[0].should.include(postOne)
  #     # res.body.length.should.eql(2)
  #     # res.body[1].should.include(postTwo)
  #     console.log "can i see this here????"
  #     done()
  #   )
      
 
      