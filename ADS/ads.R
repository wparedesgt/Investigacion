## Analisis de patrones por puntos espaciasles

library(ads)

data(Allogny)
allo.spp <- spp(Allogny$trees, mark=Allogny$status, window=Allogny$rect)
plot(allo.spp)


## Not run: rectangle of size [0,110] x [0,90]
wr<-swin(c(0,0,110,90))
area.swin(wr)
## Not run: circle with radius 50 centred on (55,45)
wc<-swin(c(55,45,50))
area.swin(wc)
## Not run: polygon (diamond shape)
t1 <- c(0,0,55,0,0,45)
t2 <- c(55,0,110,0,110,45)
t3 <- c(0,45,0,90,55,90)
t4 <- c(55,90,110,90,110,45)
wp <- swin(wr, rbind(t1,t2,t3,t4))
area.swin(wp)

data(BPoirier)
BP.spp <- spp(BPoirier$trees, mark=BPoirier$species, window=BPoirier$rect)
plot(BP.spp)

data(Couepia)
coca.spp <- spp(Couepia$trees, mark=Couepia$stage, window=Couepia$rect, triangles=Couepia$tri)
plot(coca.spp)


data(demopat)
demo.spp<-ppp2spp(demopat)
plot(demo.spp)



data(BPoirier)
BP <- BPoirier
## Not run: spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
swr <- spp(BP$trees, win=BP$rect)
dswr <- dval(swr,25,1,11,9)
summary(dswr)
plot(dswr)
## Not run: spatial point pattern in a circle with radius 50 centred on (55,45)
swc <- spp(BP$trees, win=c(55,45,45))
dswc <- dval(swc,25,1,9,9)
summary(dswc)
plot(dswc)
## Not run: spatial point pattern in a complex sampling window
swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1)
dswrt <- dval(swrt,25,1,11,9)
summary(dswrt)
plot(dswrt)



data(BPoirier)
BP <- BPoirier
## Not run: spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
#testing population independence hypothesis
k12swrm.pi <- k12fun(swrm, 25, 1, 500, marks=c("beech","oak"))
plot(k12swrm.pi)
#testing random labelling hypothesis
k12swrm.rl <- k12fun(swrm, 25, 1, 500, H0="rl", marks=c("beech","oak"))
plot(k12swrm.rl)
## Not run: spatial point pattern in a circle with radius 50 centred on (55,45)
swc <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
k12swc.pi <- k12fun(swc, 25, 1, 500, marks=c("beech","oak"))
plot(k12swc.pi)
## Not run: spatial point pattern in a complex sampling window
swrt.rl <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
k12swrt.rl <- k12fun(swrt.rl, 25, 1, 500, H0="rl",marks=c("beech","oak"))
plot(k12swrt.rl)
## Not run: testing population independence hypothesis requires minimizing the outer polygon
xr<-range(BP$tri3$ax,BP$tri3$bx,BP$tri3$cx)
yr<-range(BP$tri3$ay,BP$tri3$by,BP$tri3$cy)
rect.min<-swin(c(xr[1], yr[1], xr[2], yr[2]))
swrt.pi <- spp(BP$trees, window = rect.min, triangles = BP$tri3, marks=BP$species)
k12swrt.pi <- k12fun(swrt.pi, 25, 1, nsim = 500, marks = c("beech", "oak"))
plot(k12swrt.pi)



data(BPoirier)
BP <- BPoirier
## Not run: spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
k12vswrm <- k12val(swrm, 25, 1, marks=c("beech","oak"))
summary(k12vswrm)
plot(k12vswrm)
## Not run: spatial point pattern in a circle with radius 50 centred on (55,45)
swc <- spp(BP$trees, win=c(55,45,45), marks=BP$species)
k12vswc <- k12val(swc, 25, 1, marks=c("beech","oak"))
summary(k12vswc)
plot(k12vswc)
## Not run: spatial point pattern in a complex sampling window
swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$species)
k12vswrt <- k12val(swrt, 25, 1, marks=c("beech","oak"))
summary(k12vswrt)
plot(k12vswrt)


data(Paracou15)
P15<-Paracou15
## Not run: spatial point pattern in a rectangle sampling window of size 125 x 125
swmr <- spp(P15$trees, win = c(175, 175, 250, 250), marks = P15$species)
## Not run: testing the species equivalence hypothesis
kdswmr <- kdfun(swmr, dis = P15$spdist, 50, 2, 100)
## Not run: running more simulations is slow
kdswmr <- kdfun(swmr, dis = P15$spdist, 50, 2, 500)
plot(kdswmr)
## Not run: spatial point pattern in a circle with radius 50 centred on (125,125)
swmc <- spp(P15$trees, win = c(125,125,50), marks = P15$species)
kdswmc <- kdfun(swmc, dis = P15$spdist, 50, 2, 100)
## Not run: running more simulations is slow
kdswmc <- kdfun(swmc, dis = P15$spdist, 50, 2, 5000)
plot(kdswmc)
## Not run: spatial point pattern in a complex sampling window
swrt <- spp(P15$trees, win = c(125,125,250,250), tri = P15$tri, marks = P15$species)
kdswrt <- kdfun(swrt, dis = P15$spdist, 50, 2, 100)
## Not run: running simulations is slow
kdswrt <- kdfun(swrt, dis = P15$spdist, 50, 2, 500)
plot(kdswrt)


data(BPoirier)
BP <- BPoirier
## Not run: spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
swr <- spp(BP$trees, win=BP$rect)
kswr <- kfun(swr,25,1,500)
plot(kswr)
## Not run: spatial point pattern in a circle with radius 50 centred on (55,45)
swc <- spp(BP$trees, win=c(55,45,45))
kswc <- kfun(swc, 25, 1, 500)
plot(kswc)
## Not run: spatial point pattern in a complex sampling window
swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1)
kswrt <- kfun(swrt, 25, 1, 500)
plot(kswrt)


data(BPoirier)
BP <- BPoirier
## Not run: spatial point pattern in a rectangle sampling window of size [0,110] x [0,90]
swrm <- spp(BP$trees, win=BP$rect, marks=BP$dbh)
kmswrm <- kmfun(swrm, 25, 2, 500)
plot(kmswrm)
## Not run: spatial point pattern in a circle with radius 50 centred on (55,45)
swc <- spp(BP$trees, win=c(55,45,45), marks=BP$dbh)
kmswc <- kmfun(swc, 25, 2, 500)
plot(kmswc)
## Not run: spatial point pattern in a complex sampling window
swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri2, marks=BP$dbh)
kmswrt <- kmfun(swrt, 25, 2, 500)
plot(kmswrt)
