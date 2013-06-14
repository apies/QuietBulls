mongoose = require 'mongoose'

# Post model
Post = new mongoose.Schema(
  title: String
  content: String
  url: String
  replies_cont: Number
  labels: Array
)

Post.statics.findWithLabels = (firstLabel, otherLabels, callback) ->
  queryLabels = [firstLabel].concat(otherLabels)
  @where('labels').all(queryLabels).exec(callback)

module.exports = mongoose.model 'Post', Post