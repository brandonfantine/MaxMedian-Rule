dailyprice <- read.csv("S&P 500 daily prices.csv")

date <- dailyprice$datedate

ratios = list()
tickers = list()

#RUNTIME: O(5429700) - 6:11
#go through every stock
for(i in 1:length(dailyprice$Ticker)){
  #check the year
  if((unlist(strsplit(date[i], "-"))[1] == "2003")){
    #calculate ratios
    if(dailyprice$datedate[i] < dailyprice$datedate[i+1]){
      ratios <- append(ratios, (dailyprice$DlyPrc[i+1]/dailyprice$DlyPrc[i]))
      tickers <- append(tickers, dailyprice$Ticker[i+1])
    }
    else{
      next
    }
  }
}

medians <- list()

#RUNTIME O(500-550) - 0:17
for(tick in unique(cbind(tickers))){
  min_index <- min(which(cbind(tickers) %in% tick))
  max_index <- max(which(cbind(tickers) %in% tick))
  medians <- append(medians, median(unlist(ratios[min_index:max_index])))
}

ticker_median <- cbind(unlist(tickers), unlist(medians))
ordered_tm <- ticker_median[order(ticker_median[,2],decreasing=TRUE),]
c(ordered_tm[,1][1:10], ordered_tm[,2][1:10])
