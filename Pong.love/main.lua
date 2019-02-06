require("collide")


function love.load()
    math.randomseed(os.time())
    p={}
    p.x=300
    p.y=400
    p.w=150
    p.h=30
    p.speed=5
    p.draw=love.graphics
    p.score = 0

    b={}
    b.x=20
    b.y=20
    b.w=10
    b.h=10
    b.dirx=10
    b.diry=10
    b.speed=3
    b.draw=love.graphics
    b.randomloc=math.random(1, 2)

    sb={}
    sb.x=20
    sb.y=20
    sb.w=50
    sb.h=50

    sb.draw=love.graphics

end

function love.update()



    b.x=b.x+b.dirx
    b.y=b.y+b.diry


    if love.keyboard.isDown("left") then
        p.x = p.x - p.speed
      end
    if love.keyboard.isDown("right") then
        p.x = p.x + p.speed
    end

    if CheckCollision(p.x, p.y, p.w, p.h, b.x, b.y, b.w, b.h) then
        b.randomloc=math.random(1, 2)
            if b.randomloc == 1 then
                b.dirx = 10
            end
            if b.randomloc == 2 then
                b.dirx = -10
            end
        b.diry= -10
    end


        if b.x <= 0 then
            b.dirx = 10
        end
        if b.y <= 0 then
            b.diry=10
        end
        if b.x >= 800 then
            b.dirx =-10
        end
        if b.y >= 600 then
           b.diry = -10
           p.score=p.score - 1
        end

    
end

function love.draw()

    b.draw.rectangle("fill", b.x, b.y, b.w, b.h)
    b.draw.setColor(255, 255, 255)
    p.draw.rectangle("fill", p.x, p.y, p.w, p.h)
    p.draw.setColor(255, 255,255)
    sb.draw.rectangle("fill", sb.x, sb.y, sb.w, sb.y)

    if CheckCollision(b.x, b.y, b.w, b.h, sb.x, sb.y, sb.w, sb.h) then
        p.score=p.score+1
    end
    love.graphics.print("Score:", 0, 100)
    love.graphics.print(p.score, 40, 100)
end
