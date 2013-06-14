request = require 'supertest'
Post = require process.cwd() + '/.app/models/post'
path = require 'path'
fs = require 'fs'

describe 'Post Migrations for Tests', ->

  it "shoudl pull some posts from Mongo", (done) ->
    Post.find({}).limit(77).exec( (err, posts)->
      posts.length.should.eql(77)
      done()
    )

  it "should be able to find the fixtures path", (done) ->
    fixturesPath = path.resolve("#{process.cwd()}/test/fixtures")
    fixturesPath.should.eql("/home/pies/NodeProjects/QuietHorses/test/fixtures")
    done()

  xit "should be able to write some posts to a file", (done) ->
    Post.find({}).limit(77).exec( (err, posts)->
      fixturesPath = path.resolve("#{process.cwd()}/test/fixtures")
      console.log("Migrating Posts!!#{posts}")
      fs.writeFile("#{fixturesPath}/all_posts.json", JSON.stringify(posts), (err) ->
        throw err if err
        console.log('json fixture saved!!\n')
      )
      posts.length.should.eql(77)
      done()
    )
  it "should be able to read from the big JSON dump file", (done) ->
    fixturesPath = path.resolve("#{process.cwd()}/test/fixtures")
    posts_fixtures = require("#{fixturesPath}/all_posts.json")
    posts_fixtures.length.should.eql(77)
    #console.log posts_fixtures
    done()
