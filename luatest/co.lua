function send (data)
    coroutine.yield(data)
end

function recv (prod)
    local res,data = coroutine.resume(prod)
    return data
end

-- 创建一个生产者协程
function producter ()
    return coroutine.create(function ()
        -- 循环从标准输入获取行数据
        while true do
        local data = io.read()
        send(data)
    end
    end)
end

-- 创建一个过滤器协程
function filter (prod)
    return coroutine.create(function ()
        -- 循环接收生产者传递的数据,并添加行号,在转发给消费者
        for line = 1,math.huge do
        local data = recv(prod)
        data = string.format("%d %s",line,data)
        send(data)
    end
    end)
end

function consumer (ft)
    -- 消费者循环接收数据并打印到标准输出
    while true do
        local data = recv(ft)
        io.write(data,"\n")
    end
end

consumer(filter(producter()))
