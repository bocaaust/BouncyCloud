    -- Bouncey Cloud
supportedOrientations(PORTRAIT)
displayMode(FULLSCREEN_NO_BUTTONS)
-- Use this function to perform your initial setup
function setup()
   -- recording = true
   -- recordcounter = os.time()
    bouncecord = {WIDTH/2,HEIGHT*5/4,0}
    soundnum = 0
    soundcheck = false
    soundcheck2 = true
 --   sound(DATA, "ZgBAZgAhdWFGLjRS/wv+va2h1j405G0+XQAOeDZABTg9WTN6")
    if soundint == nil then
        soundint = 0.
        soundtable = {}
        soundtable["Waveform"] = SOUND_SQUAREWAVE
        soundtable["AttackTime"] = 0.2
        soundtable["SustainTime"] = 0
        soundtable["SustainPunch"] = 0.62
      --  soundtable["DecayTime"] = 0.64
        soundtable["DecayTime"] = 0.15
        soundtable["StartFrequency"] = 0.88
        soundtable["MinimumFrequency"] = 0.0
        soundtable["Slide"] = 0.55
        soundtable["DeltaSlide"] = 0.56
        soundtable["VibratoDepth"] = 0.76
        soundtable["VibratoSpeed"] = 0.60
        soundtable["ChangeAmount"] = 0.14
        soundtable["ChangeSpeed"] = 0.74
        soundtable["SquareDuty"] = 0.14
        soundtable["DutySweep"] = 0.62
        soundtable["RepeatSpeed"] = 0.38
        soundtable["PhaserSweep"] = 0.48
        soundtable["LowPassFilterCutoff"] = 0.70
        soundtable["LowPassFilterCutoffSweep"] = 0.91
        soundtable["LowPassFilterResonance"] = 0.49
        soundtable["HighPassFilterCutoff"] = 0.66
        soundtable["HighPassFilterCutoffSweep"] = 0.50
        soundtable["Volume"] = 0.5
    end
    showAdFromBottom()
    shiftcounter = 1
    if music.name == nil then
      --  music("Dropbox:bounce_music",true)
        music("Dropbox:256_background_music_v2",true)
        music.volume = 0.5
        end
    xw = WIDTH/768.
   lr = -1
    
    -- font()
    original = vec2(0,0)
    --img=readImage("Documents:spark")
    parameter.integer("numSparks",10,500,10)
    parameter.number("damping",1.01,1.10,1.02)
    parameter.number("velocity",0.1,1,0.3)
    parameter.integer("MODE",1,3,1)--img,sq,circ
    parameter.boolean("constant",false)
    parameter.boolean("atTouch",true)
    parameter.boolean("Rebound",true)
    parameter.number("GRAVITY",0,5,0.47)
    parameter.integer("Xwind",-10,10,0)
    parameter.integer("Ywind",-10,10,0)
    explosions = {}
    lr2 = WIDTH
    blocks = {}
    distcent = WIDTH/8
    fallspeed = -80*xw
    start = false
    counter = 0
    counterint = 240
    score = 0

    bound = physics.body(EDGE,vec2(-1000,66),vec2(WIDTH+1000,66))
    bound.sensor = true
    bound.type = STATIC
    ballg = false
    tween(4,bouncecord,{WIDTH/2,HEIGHT/4+10*xw,250},tween.easing.bounce)
  --  intarr = {}
   -- x = 0
   -- while x <= WIDTH do
    --    int = math.random(25*xw,60*xw)
     --   x = x + int
    --    table.insert(intarr,int)
   -- end
end

function createblock()
   -- if lr then
    shiftcounter = shiftcounter + 1
    if shiftcounter%3 == 0 and distcent > -WIDTH/4 then
        distcent = distcent - WIDTH/16
        shiftcounter = 1
    end
    cords = {vec2(WIDTH/2+lr*distcent,HEIGHT),vec2(WIDTH/2+lr*distcent,HEIGHT+29*(WIDTH/2+distcent)/144*xw),vec2(lr2,HEIGHT+29*(WIDTH/2+distcent)/144*xw),vec2(lr2,HEIGHT)}
    lr = lr * -1
    if lr2 == WIDTH then 
        lr2 = 0
        else
        lr2 = WIDTH
    end
    table.insert(blocks, physics.body(POLYGON,cords[1],cords[2],cords[3],cords[4]))
    blocks[table.maxn(blocks)].gravityScale = 0
    blocks[table.maxn(blocks)].linearDamping = -1
    blocks[table.maxn(blocks)].linearVelocity = vec2(0,fallspeed)
    blocks[table.maxn(blocks)].restitution = 1
       -- else
        blocks[table.maxn(blocks)].angularDamping = 100
       -- end
end
-- This function gets called once every frame
function playmusic(index)
    if soundcheck then
 soundtable["StartFrequency"] = .9-index*.01
        else
        soundtable["StartFrequency"] = index*.01
        end
    sound(soundtable)
    if index == 60 then
    if soundcheck then
            soundcheck = false
            else
            soundcheck = true
        end
        end
end
function draw()
  --  if recording then
      --  recording = false
      --  startRecording()
   -- end
    --recordcounter = recordcounter + 1
   -- if os.difftime(os.time(),recordcounter) >= 30 then
     --   stopRecording()
    --end
    noStroke()
    if soundnum == 0 or soundnum == 120 then
    --sound(DATA, "ZgBAGQA/P1NyZGUAvq31Ofq0oT4G7x0/XgBhdUpaQiAkbhpA")
        end
    if soundnum == 60 then
    --sound(DATA, "ZgBAPgA9O09zYWcA/Lj2Owczlj56n+I+WwBjdUdZQSIncBo9")
      --  sound(DATA, "ZgBAQABFQkdALR4r6t6yOKYZAj04lCM/QQBZejtACywyOz5J")
        end
    if soundnum == 180 then
    --sound(DATA, "ZgBAUgA/P1NyZGUAvq31Ofq0oT4G7x0/XgBhdUpaQiAkbhpA")
      --  sound(DATA, "ZgBAfwAiQGFHQF4RB4tOPhTNtz4AhbG7ZgBVf0lAQEBGDxsT")
        end
    soundnum = soundnum + 1
    if soundnum == 240 then
        soundnum = 0
    end
  --  if soundint*10 == soundint*10. then
  --      if soundint == 30 or soundint == 60 or soundint == 90 or soundint == 120 or soundint == 150 or soundint == 180 or soundint == 210 or soundint == 240 then
   -- playmusic(soundint/3)
      --      end
   -- end
   -- soundint = soundint + 2
 --   if soundint > 270 then
       -- soundint = 0
       -- if soundcheck2 then
         --   soundcheck2 = false
       -- if soundcheck then
           -- soundcheck = false
           -- else
           -- soundcheck = true
       -- end
           -- else
           -- soundcheck2 = true end
   -- end
    gravity = vec2(0,-GRAVITY)
        wind = vec2(Xwind,Ywind)
        FPS=1/DeltaTime
        --for i =1, #explosions do
           -- explosions[i]:draw(gravity,wind)
       -- end
    -- This sets a dark background color 
    background(93, 146, 251, 255)
   -- fill(93, 146, 251, 209)
   -- rect(0,0,WIDTH,HEIGHT)
 -- rect(0,0,WIDTH,HEIGHT)
fill(63, 253, 0, 11)
    --font("AppleColorEmoji")
font("Unibody8Pro-Regular")
  --  x = 1
  --  y = 0
--while x <= table.maxn(intarr) do
       -- int = intarr[x]
       -- fontSize(int)
      --  while y < HEIGHT do
       --     y = y + int
        --    text("01",int,y)
      --  end
       -- y = 0
      --  x = x + 1
   -- end
    gravity = vec3(Gravity.x,-1,0)
    physics.gravity(gravity)
    -- This sets the line thickness
    strokeWidth(5)
    if start then
        if score < 10 then
         fontSize(600*xw)
            else
            fontSize(400*xw)
            end
       -- font("Futura-CondensedMedium")
    font("Unibody8Pro-Bold")
    fill(167, 191, 212, 187)
    --if start then
    --temp = "HIGHSCORE:  "..math.tointeger((readLocalData("highscore",0)))
   -- else
    --temp = score
    --end
    text(score,WIDTH/2,HEIGHT/2)
        fill(0, 0, 0, 0)
    counter = counter + 1
    if counter == counterint then
            counter = 0
        createblock()
    end
        if ball.x > WIDTH+ball.radius then
            ball.x = WIDTH+ball.radius
            ball:applyForce(vec2(-900*xw,100*xw))
            elseif ball.x < 0-ball.radius then
            ball.x = 0-ball.radius
            ball:applyForce(vec2(900*xw,100*xw))
        end
        if ball.y > HEIGHT+ball.radius then
            ball.y = HEIGHT+ball.radius
            ball:applyForce(vec2(0*xw,-900*xw))
        end
        for i,body in ipairs(blocks) do
        pushMatrix()
        translate(body.x, body.y)
        rotate(body.angle)
    
        if body.type == STATIC then
            stroke(255,255,255,255)
        elseif body.type == DYNAMIC then
            stroke(150,255,150,255)
                tint(150,255,150,255)
        end
    
        if body.shapeType == POLYGON then
            strokeWidth(0)
            local points = body.points
           -- for j = 1,#points do
              --  a = points[j]
              --  b = points[(j % #points)+1]
               -- line(a.x, a.y, b.x, b.y)
           -- end
                spriteMode(CORNERS)
                tint(255, 255, 255, 255)
                sprite("Project:block",points[1].x,points[1].y,points[3].x,points[3].y)
                spriteMode(CENTER)
        end
        popMatrix()
    end 
            pushMatrix()
        translate(ball.x, ball.y)
        rotate(ball.angle)
            strokeWidth(3.0*xw)
        if ballg then
            stroke(13, 212, 185, 255)
            tint(13, 212, 185, 255)
        end
           -- line(0,0,body.radius-3,0)            
            --ellipse(0,0,ball.radius*2)
        sprite("Project:cloud",0,0,ball.radius*2)
            popMatrix()
        else
        tint(255, 255, 255, bouncecord[3])
        --sprite()


       -- sprite("Project:title",WIDTH/4+50*xw,HEIGHT/8*7,WIDTH/2+80*xw)
        tint(255, 255, 255, 255)
        --sprite("Project:cloud",bouncecord[1],bouncecord[2],WIDTH/2,WIDTH/2)
        sprite("Project:backboard2",WIDTH/2,HEIGHT*2/3-50*xw,WIDTH*7/8+80*xw,HEIGHT/4+100*xw)
        fill(0, 0, 0, 255)
        fontSize(25*xw)
        text("HIGHSCORE: "..math.tointeger((readLocalData("highscore",0))),WIDTH*3/4+20*xw,HEIGHT*7/8)
        --text(math.tointeger((readLocalData("highscore",0))),WIDTH*3/4+80*xw,HEIGHT*7/8)
        fontSize(45*xw)
        text("tap to start",WIDTH/2,HEIGHT*3/4)
        fontSize(17*xw)
        text("tilt device to move the cloud",WIDTH/2,(HEIGHT*3/4)-100*xw)
        text("the goal is to keep the cloud on the screen",WIDTH/2,HEIGHT*3/4-220*xw)  
        fill(13, 212, 185, 255)
        text("touch the screen during gameplay to double gravity",WIDTH/2,HEIGHT*3/4-160*xw)
        sprite("Project:block",WIDTH/2,0,WIDTH,HEIGHT/4-5*xw)
    end
    --if Sparks.size ~= nil then
    --Sparks:draw()
        --end
end

function touched(touch)
    if not start then
        --explosions[#explosions+1] = Sparks(CurrentTouch.x,CurrentTouch.y,30,col,nil,30)
        start = true
        ball = physics.body(CIRCLE,HEIGHT/32)
        ball.restitution = 2
        ball.gravityScale = 1
        ball.interpolate = true
        ball.x = WIDTH/4
        ball.y = HEIGHT/16*15+30*xw
       -- sound(SOUND_POWERUP, 33285)
 sound(SOUND_RANDOM, 33291)
      sound(SOUND_RANDOM, 33291)
        
        table.insert(blocks, physics.body(POLYGON,vec2(0,0),vec2(WIDTH,0),vec2(WIDTH,29*(WIDTH/2+distcent)/144*xw),vec2(0,29*(WIDTH/2+distcent)/144*xw)))
        blocks[table.maxn(blocks)].gravityScale = 0
        blocks[table.maxn(blocks)].angularDamping = 100
        blocks[table.maxn(blocks)].restitution = 1
        blocks[table.maxn(blocks)].linearDamping = -1
        blocks[table.maxn(blocks)].linearVelocity = vec2(0,-80)
        table.insert(blocks, physics.body(POLYGON,vec2(WIDTH/2-distcent,HEIGHT/2),vec2(WIDTH,HEIGHT/2),vec2(WIDTH,HEIGHT/2+29*(WIDTH/2+distcent)/144*xw),vec2(WIDTH/2-distcent,HEIGHT/2+29*(WIDTH/2+distcent)/144*xw)))
        blocks[table.maxn(blocks)].angularDamping = 100
        blocks[table.maxn(blocks)].linearDamping = -1
        blocks[table.maxn(blocks)].gravityScale = 0
        blocks[table.maxn(blocks)].restitution = 1
        blocks[table.maxn(blocks)].linearVelocity = vec2(0,-80)
        table.insert(blocks, physics.body(POLYGON,vec2(WIDTH/2+distcent,HEIGHT/4*3),vec2(0,HEIGHT/4*3),vec2(0,3*HEIGHT/4+29*(WIDTH/2+distcent)/144*xw),vec2(WIDTH/2+distcent,HEIGHT/4*3+29*(WIDTH/2+distcent)/144*xw)))
        blocks[table.maxn(blocks)].angularDamping = 100
        blocks[table.maxn(blocks)].linearDamping = -1
        blocks[table.maxn(blocks)].gravityScale = 0
        blocks[table.maxn(blocks)].restitution = 1
        blocks[table.maxn(blocks)].linearVelocity = vec2(0,-80)
        createblock()
        else
        if touch.state == ENDED then
            ball.gravityScale = 1
            ballg = false
        else
            ballg = 2
        ball.gravityScale = 2
            --if counter%30== 0 then
            --sound(SOUND_SHOOT, 8444)
              --  end
            end
    end
end

function collide(contact)
    if contact.bodyA == bound or contact.bodyB == bound then
        if contact.state == ENDED then
        flag = true
        for i, body in ipairs(blocks) do
            if body == contact.bodyA then
                body:destroy()
                table.remove(blocks,i)
                flag = false
                break
                elseif contact.bodyB == body then
                body:destroy()
                flag = false
                table.remove(blocks,i)
                break
            end
        end
            
        if flag then
                for i,body in ipairs(blocks) do
                    body:destroy()
                end
               -- sound(SOUND_EXPLODE, 21508)
                --sound(SOUND_EXPLODE, 21508)
                --sound(SOUND_EXPLODE, 21508)
                sound(SOUND_RANDOM, 2630)
                --sound(SOUND_RANDOM, 2634)
                sound(SOUND_RANDOM, 2634)
                if readLocalData("highscore",0) < score then
                    saveLocalData("highscore",score)
                    if gamecenter.enabled() then
                        gamecenter.submitScore(score)
                    end
                end
                ball:destroy()
            setup()
        end
            end
        elseif contact.bodyA == ball or contact.bodyB == ball then
        if contact.state == BEGAN then
            sound(SOUND_EXPLODE, 28966)
            -- sound(SOUND_EXPLODE, 28966)
            -- sound(SOUND_EXPLODE, 28966)
           -- sound(SOUND_JUMP, 40951)
            --sound(SOUND_JUMP, 40951)
            sound(SOUND_RANDOM, 40952)
        score = score + 1
            original.x = contact.position.x
                    original.y = contact.position.y
                    --explosions[#explosions+1] = Sparks(original.x,original.y,numSparks,col,nil,30)
    end
        end
end

