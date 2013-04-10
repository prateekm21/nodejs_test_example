global._ = require('underscore')._

suite_title = ["HTTP Idempotent Messages", "HTTP Connect Messages"]
suite_title = ["suite-proto-http-suite-idempotent"]
suite = 'proto/http/suite/idempotent.rb'

s_title = _.find suite_title, (ech) ->
  #EG: temp = 'options' | if suite is 'proto/http/suite/options.rb'
  temp = _.last(suite.split("/")).split('.')[0]
  re   = new RegExp("\\b" + temp + "\\b", 'gi');
  return ech if ech.match(re)

console.log s_title  