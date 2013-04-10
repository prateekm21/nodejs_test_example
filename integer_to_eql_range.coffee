#
# input: 10 , 3
# output: [ [ 0, 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ], [ 10 ] ]
#
# input: 11 , 3
# output: [ [ 0, 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ], [ 10, 11 ] ]
#
# input: 12 , 3
# output: [ [ 0, 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]
#
# input: 6 , 2
# output: [ [ 0, 1, 2, 3 ], [ 4, 5, 6 ] ]



div = (total, split) ->
  avg   = Math.floor(total / split)
  out   = []
  first = 0
  last  = avg

  while first <= total#last <= total
    console.log("first: #{first} | last: #{last} | total: #{total}")
    if last >= total then (last = total)
    temp = []
    for i in [first..last]
      temp.push(i)
    out.push(temp.toString())  
    first = last+1  
    last += avg

  return out

total  = 20
split  = 3
result = div(total, split)

console.log(result)