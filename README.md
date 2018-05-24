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

