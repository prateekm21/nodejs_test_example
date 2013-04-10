global._ = require('underscore')._

a = [1,2,3,4,5,6,7]

@test = (num) ->
  return num * 2

_.map a, (ech) =>
  console.log @test(ech)

console.log("==done==")  



