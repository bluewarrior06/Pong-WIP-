function move(x, speed)

    if love.keyboard.isDown("left") then
        x = x + speed
    end
    if love.keyboard.isDown("right") then
        x = x - speed
    end
end
