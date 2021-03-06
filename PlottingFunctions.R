## Data Visualization
## First Project - Color Cards

lab.measure <- read.csv2("LabMeasurements-Color-Card.csv")
master.color <- read.csv2("MasterColorCard.csv") # CMYKS colors are in p1- p5 (neglect?)

# install.packages("plot3D")
# install.packages("rgl")
# install.packages("scatterplot3d")
library("scatterplot3d")
library(colorspace)
library("plot3D")
library("rgl")

# save L, a and b values from dataframe to vectors
solarLAB <- function(L,a,b) {
  # create new dataframe from L-a-b vectors
  solarized = structure(list(L, a, b), .Names = c("L", "a", "b"), row.names = c(NA,16), class = "data.frame")
  return(with(solarized, LAB(L, a, b))) 
}


# function to create a rgl plot3d comparing 2 Lab spaces
Lab.rgl <- function(master, lab) {
  par3d(windowRect = c(20, 30, 600, 600))
  # plot master card
  plot3d(master,
         #col = hex(solarLAB(master[,1],master[,2],master[,3]), fixup = TRUE),
         col = "red",
         pch = 16, 
         type = "h",
         grid=TRUE,
         box = FALSE,
         xlab = "L",
         ylab = "a",
         zlab = "b"
         )
  # plot picked card
  plot3d(lab,
         #col = hex(solarLAB(lab[,1],lab[,2],lab[,3]), fixup = TRUE),
         col = "blue",
         type = "h",
         add=TRUE
         )
  # draw lines between pairs
  segments3d(x = as.vector(t(cbind(master[,1], lab[,1]))),
             y = as.vector(t(cbind(master[,2], lab[,2]))),
             z = as.vector(t(cbind(master[,3], lab[,3])))
             )
  legend3d("topright", legend = paste(c('Master','Lab')), pch = 16, col = c("red","blue"), cex=1, inset=c(0.1))
  text3d(x= master,texts=c(1:64))
}
Lab.rgl(master.color[,9:11], card)


# function to create scatterplot3ds comparing master colors against 1 lab card
Lab.spl <- function(master, lab) {
  spl <- scatterplot3d(master, 
                       main="Master Color Card - Lab values",
                       #color = hex(solarLAB(master[,1],master[,2],master[,3]), fixup = TRUE),
                       color = "red",
                       pch = 16, 
                       type = "h",
                       grid=TRUE,
                       box=FALSE)
  spl$points3d(lab,
               #col = hex(solarLAB(lab[,1],lab[,2],lab[,3]), fixup = TRUE),
               col = "blue",
               pch = 15,
               type = "h")
  legend(spl$xyz.convert(20, 10, 70), 
         col= c("red","blue"), 
         bg="white", 
         lty=c(1,1), lwd=2, yjust=0, 
         legend = c("Master","Lab"), cex = 1.1)
  text(spl$xyz.convert(master), 
       labels = rownames(master),
       cex= 0.7, 
       #col = hex(solarizedLAB, fixup = TRUE),
       pos = 3) 
  segments(spl$xyz.convert(master)$x,spl$xyz.convert(master)$y,
           spl$xyz.convert(lab)$x,spl$xyz.convert(lab)$y,
           lwd=2,col=1)
  
}


# function to automatically generate a usable matrix of the respective card
chooseCard <- function(row) {
  return(matrix(as.matrix(lab.measure[row,3:194]),nrow=64,byrow=TRUE))
}

card <- chooseCard(47)
Lab.spl(master.color[,9:11], card)
Lab.rgl(master.color[,9:11], card)

# comparing p values of t.tests comparing master.color data to individual card data
pvalues <- {}
for (i in c(1:546)){
   test <- t.test(master.color[,9:11], chooseCard(i))
   pvalues[i] <- test$p.value
}
# visualizing the p values
hist(pvalues)
min(pvalues)
