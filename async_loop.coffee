
Async = require 'async'
Step = require 'step'


flag = false
arr  = [1, 2, 3, 4]

fn_array = for id in arr
  do (id) ->
    fn_handle = (callback) ->
      console.log "id is #{id}"
      callback(null, "result: " + id)

console.dir(fn_array)
console.log("before executing an array of functions")

Async.series(fn_array, (err, results) ->
  console.log "after executing an array of functions...."
  console.dir results
  flag = true
)
console.log "== The End ==\n" if flag
 

arr = [1,2,3]
count = 1

fn_run = (ech, cb) ->
  Step(
    () ->
      step_callback = this
      console.log("Step-1")
      step_callback(null,ech)
      return
    , (error, data) ->
      step_callback = this
      console.log("Step-2")
      if count is arr.length then step_callback(null,{each: ech,a: "apple"}) else step_callback(null,{each: ech,b: "banana"})
      return
    , (error, data) ->
      console.log("Count: #{count} Step-3\n")
      count += 1
      this(null, true)
    , (error, data) ->
      console.log("Count: #{count} Final step\n\n")  
      if count isnt 2 then cb() else cb("finished")
  )
  return

fn_last_callback = (err) ->
  console.log("\nerr: #{err} => count in end: #{count}") if count isnt arr.length


Async.forEachSeries arr, fn_run, fn_last_callback