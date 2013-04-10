winston = require 'winston'
helper  = require '../src/lib/helper'

cb = (error, response) ->

FileTransport = new (winston.transports.File)(
  filename:  "/tmp/fuzztest-log-pm",
  timestamp: false,
);

test_log = new (winston.Logger)( 
  transports: [FileTransport],
  exitOnError = false
);

self  = this
start = 1
end   = 60 #1MIN = 60 | 2MIN = 120 .. etc

write = (s) =>
  setTimeout(( () =>
    console.log("#{s} ", helper.now_to_s())
    if s%2 is 0 then result = "pass" else result = "fail"
    test_log.log("info",
      s,
      {timestamp:helper.now_to_s(), result:result},
    )
    s++
    if s <= end
      write(s)
    else  
      search(s)
  ), 1000)


search = (i) =>
  options = {
      rows: 100000,
      order: 'asc'
      from:  helper.past_time(end),
      until: helper.now_to_s()
    };

  # Find items logged between now and pastime
  #
  test_log.query options, (err, results) =>
    if (err)
      throw err
    else
      console.log results
      console.log results.file.length


write(start)  


