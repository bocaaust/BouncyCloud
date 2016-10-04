--# Spark
Spark = class()

function Spark:init(x,y,c,t,size)
    if HEIGHT > 1000 then
        self.adheight = 66
        else
        self.adheight = 50
    end
    self.sparktable={}
    origin=vec2(WIDTH/2,HEIGHT)
    --self.texture = readImage("Project:spark")
    self.size = math.random(size-20,size+20)
    self.pos = vec2(x,y)
    local vel = vec2(0,self.size*velocity)
    self.velocity = vel:rotate(math.random(360))
    self.col = color(255, 253, 0, 255)
    self.alive = true
    self.angle = math.random(360)
    self.rotationdirection = math.random(-2,2)
    self.damping=damping
    self.type=MODE
end

function cullexplosions()
    for i=#explosions,1,-1 do
        if not explosions[i].alive then
            
            table.remove(explosions,i)
            
        end
    end
end

function Spark:draw(g,w)
    local _gravity = g or vec2(0,-1)
    local _wind = w or vec2(1,0)
    self:move(_gravity,_wind)
    pushMatrix()
    translate(self.pos.x,self.pos.y)
    rotate(self.angle)
    if self.type==1 then
        tint(self.col)
        fill(self.col)
        fontSize(self.size)
        font("AppleColorEmoji")
        text("⭐️",0,0)
         --sprite(self.texture,0,0, self.size)
        else
        fill(self.col)
        if self.type==2 then
            rectMode(CENTER)
        end
    end
    popMatrix()
end

function Spark:move(g,w)
    self.size = self.size / self.damping
    self.col.a = self.col.a /(self.damping)
    self.col.r = self.col.r / self.damping
    self.col.g = self.col.g / (self.damping^3)
    self.velocity = self.velocity / self.damping
    self.velocity = self.velocity + g
    self.pos = self.pos + self.velocity
    self.pos = self.pos + w
    self.pos = self.pos + g
    if self.col.a <= 100 then self.alive = false end
    self.angle = self.angle + self.rotationdirection*self.velocity:len()
    if Rebound then
        if self.pos.y<=self.adheight then self.velocity.y=math.max(self.velocity.y,-self.velocity.y)end
        if self.pos.y>=HEIGHT then self.velocity.y=math.min(self.velocity.y,-self.velocity.y)end
        if self.pos.x<=0 then self.velocity.x=math.max(self.velocity.x,-self.velocity.x)end
        if self.pos.x>=WIDTH then self.velocity.x=math.min(self.velocity.x,-self.velocity.x)end
    end
end

Sparks = class()

function Sparks:init(x,y,amount,col,img,size)
    self.alive = true
    self.sparktable={}
    for i = 1, amount do
        self.sparktable[i]=Spark(x,y,col or color(math.random(200,255), math.random(0,200), 0,255),img,size)
    end
    
end

function Sparks:draw(grav,wind)
    if self.sparktable ~= nil then
        for i = 1, #self.sparktable do
            self.sparktable[i]:draw(grav,wind)
        end
        local i = 1
        while i <= #self.sparktable do
            if not self.sparktable[i].alive then
                table.remove(self.sparktable,i)
                i = i - 1
            end
            i = i + 1
        end
        if #self.sparktable == 0 then self.alive = false end
    end
end