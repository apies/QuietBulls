Post = require '../models/post'
util = require 'util'
#io = require 'io'
#stre

# Post model's CRUD controller.
module.exports = 

  # Lists all posts
  index: (req, res) ->
    console.log "posts index firing!!!"
    Post.find {}, (err, posts) ->
      console.log(posts.title for post in post)
      res.send posts
  
  #http://localhost:3000/posts/search/To%20See?labels=adventures
  search: (req, res) ->
    queryLabels = req.query.labels.split(",")
    Post.findWithLabels(req.params.baseLabel, queryLabels, (err, posts) ->
      res.send posts
    )

  #this works and is damn cool, going to use with socket.io and angular
  #http://localhost:3000/posts/streamSearch/To%20See?labels=adventures
  # streamSearch: (req, res) ->
  #   queryLabels = req.query.labels.split(",")
  #   queryLabels.push(req.params.baseLabel) if queryLabels
  #   postStream = Post.find({}).stream()
  #   #var head = {'Content-Type':'text/html; charset=UTF-8'}
  #   res.setHeader('Content-Type', 'text/plain')
  #   res.setHeader('Transfer-Encoding', 'chunked')

    
  #   postStream.on('data', (post) ->
  #     res.write("#{post.title}\n")
  #     console.log post.title
  #   ).on('error', (post) -> 
  #     console.log(post)
  #   ).on('close', () -> 
  #     console.log( 'closing!')
  #     res.end()
  #   )
    
      
        

      
  