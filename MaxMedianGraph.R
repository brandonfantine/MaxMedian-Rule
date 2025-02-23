library("ggplot2")

# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , 
            rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
dim(condition)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")

year <- c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990,
          1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
          2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
          2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021)

weighted_ret <- c(1.27218390804598, 7.46759825327511, 7.65925925925926, 
                  1.53982300884956, 8.15151515151515, 2.68342857142857, 
                  2.68769953051643, 5.4, 4.86153846153846, 7.32710280373832, 
                  66.3, 14.9643010752688, 5.75636363636364, 1.78853801169591, 
                  5.14533333333333, 9.17062801932367, 4.23214285714286, 
                  2.32258064516129, 9.77076923076923, 4.21420118343195,
                  3.62385964912281, 5.44895591647332, 24.7594936708861, 
                  36.2633333333333, 6.35163127912999, 72.3939393939394, 
                  7.89067702552719, 9.52393272962484, 9.49875, 
                  9.45701357466063, 2.4989235737352, 7.55851063829787, 
                  5.80560782837787, 6.69847972972973, 1.00442922689976, 
                  7.43163538873995, 30.4592233009709, 5.96755162241888, 
                  4.67209507042254, 6.52971725331795, 1.01224092357783,
                  1.01749271137026)

sp500yearlydata <- c(0.025062583333333333, -0.003512833333333333, 
                     0.018150333333333327, 0.017268166666666668, 0.00613375, 
                     0.02396491666666667, 0.015193249999999998, 
                     0.008065333333333336, 0.013532999999999998, 
                     0.023568916666666665, -0.0013995, 
                     0.02347033333333333, 0.006425, 
                     0.008028916666666665, 0.0015516666666666673, 
                     0.02710916666666667, 0.018000999999999996, 
                     0.025402583333333336, 0.023479, 0.016917583333333337, 
                     -0.006268750000000001, -0.008986916666666666, 
                     -0.018624166666666664, 0.02172625, 0.008914, 
                     0.004475166666666666, 0.012333000000000002, 0.004998, 
                     -0.035293916666666675, 0.021627083333333335, 
                     0.013263083333333333, 0.0024491666666666655, 
                     0.01293975, 0.0240215, 0.010887583333333332, 
                     0.001922666666666666, 0.009724833333333334, 0.0167585, 
                     -0.002894416666666667, 0.023714500000000003, 0.01739075, 
                     0.02156066666666667)

finalmat <- c()
sp500condition <- c()
for(i in 1:42){
  finalmat <- c(finalmat, weighted_ret[i]/100, sp500yearlydata[i])
  sp500condition <- c(sp500condition, "MaxMedian", "S&P 500")
}

sp500data <- data.frame(year, finalmat, sp500condition)

View(sp500data)

ggplot(sp500data, aes(fill=sp500condition, x=year, y=finalmat)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(x="Year", y="Return") + ggtitle("MaxMedian vs. S&P 500 Returns")

tentwentydata <- c(.3626, .3626, 0.023470333)
date <- c(2003, 2003, 2003)
condition <- c("Ten Stocks", "Twenty Stocks", "S&P 500")
frame <- data.frame(date, tentwentydata, condition)

ggplot(frame, aes(fill=condition, x=date, y=tentwentydata)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(x="Year", y="Return") + 
  ggtitle("Top 10 Stocks vs. Top 20 Stocks vs.S&P 500 Returns in 2003")

