$ ->
  x = -> $('<h2>Express Coffee Template 1.4</h2>').prependTo('.right')
  setTimeout x, 500
  handlePosts = 
    onData: ((data)-> console.log(data))
    onError:  ((e)-> console.log("error!:#{e}"))
    onEnd: (()-> console.log("end of data"))
  $("#getPosts").click( () ->
    Streamable.get("/posts/streamSearch/To%20See?labels=adventures", handlePosts)
  )

