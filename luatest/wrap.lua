co=coroutine.wrap(function(a,b)
--      print("resume args:"..a..","..b)
--      yreturn=coroutine.yield()
      print("yreturn :"..yreturn)
end
)
print(type(co))
co(11,22)
co(33)
