# First-Explorations
R code from our first data explorations

# some conclusions: 

After comparing the measurements of the sheets of paper with the measurements of the master card we came to the conclusion that changes in the printing and the position of the card on the sheet of paper influence the quality and accuracy of the desired color (i.e. the master card), however most of these differences are not visible to the human eye and therefore are not perceptible and do not affect the printing result. 

In the same way, each color card has a bar code that indicates in which part of the sheet this card was printed, in our analysis we found that there are differences in the printed colors depending on the place where the card was printed, these results are seen in the JND barplots per sheet. 

although we see a difference in the number of colors that are visibly different to the human eye, we can see that in all pocisisons the number of colors that are extremely different remains the same (red bars). this indicates that changes in pixel colors vary slightly between positions and do not affect the reading of the app to any small degree. 

out of the 64 pixels of the card one color is extremely
different compared to the master card, the pixel corresponds to the position in the (3,2). this pixel matches the light grey colour, is the lightest colour on the grey scale of the colour chart and has an average deltaE distance of 35 units. Despite this long deltaE distance the color cards are used indicating that this color does not affect the final pre-determined app color.

It seems that the app can calibrate the color cards according to their original position on the sheet of paper, and so perform the skin color predictions without errors. 

An additional analysis for the future would be to check whether the differences observed using deltaE and the JND scale are statistically significant and thus determine whether the printed color chart is in fact different from the master chart. 

### for the box plots
In the box plot we can deduce two things, the first is that most of the deltaE values per pixel are uniformly distributed, we see this in the box plots that have a symmetrical shape, meaning that the data are equally distributed on the mean, and we also find only a few outliers. 

Another interesting point is to look at the y-axis, the deltaE values where the box plots are located, here we see that most of them are near a delta E 2. This delta E is the JND measure we use to define if one color is different from another in this analysis and as the majority of deltaE pixels are close to this value, it is a good indicator of the print quality of each pixel. It is important to recall that this delta E shown on the box plot is the average delta E of that pixel on all 546 cards. 

### heatmap acctually image
this heatmap shows us with an intense red color the pixels (average of the deltaE pixel in the 546 cards) that are clearly different to the master card. only two pixels are. the other pixels are considered slightly different or not different from the master card. this is a good indication that the printing of the cards does not alter the printed colors significantly. 


