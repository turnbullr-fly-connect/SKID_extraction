#Drawing out a list of SKIDs from a large table, in this case Fiona's PN glomerulus DA2 38886 BH re-randomised connections - Sheet1.csv, as of 15/11/18


setwd("~/Desktop")

  #Sets working directory as the desktop, where the .csv file is stored


list.files(pattern = "csv", full.names = T)
[1] "./Fiona's PN glomerulus DA2 38886 BH re-randomised connections - Sheet1.csv"

  #The only .csv file in the desktop at the time


da2 <- read.csv(file = "Fiona's PN glomerulus DA2 38886 BH re-randomised connections - Sheet1.csv", header = TRUE)
dim(da2)
[1] 1414   39

  #Fiona's PN glomerulus DA2 38886 BH re-randomised connections - Sheet1.csv, now called "da2", is a sheet with dimensions 1414x39


#I want to isolate all SKIDs for neurones traced by me - RGT

grepl("RGT", da2$Second.tracer)

  #Returns a TRUE/FALSE matrix, where TRUE is any cell in the "Second.tracer" column containing the string "RGT"


RGT_traced_neurones_full <- subset(da2, grepl("RGT", da2$Second.tracer))

  #Isolates rows from da2 which are TRUE for grepl("RGT", da2$Second.tracer), i.e. those with "RGT" in the Second.tracer column


RGT_traced_neurones_full_skids <- RGT_traced_neurones_full[29:30]

569                NA       1105308
570                NA       1703421
571                NA       8414264
597                NA       3966989
646           3966423            NA
688                NA       3125683
696                NA       1102353
704                NA       3958821
718                NA       5488325
719                NA       1101751
720                NA       3477461
736                NA       2400220
743           1703668            NA
849                NA       1706538
#etc.

  #The SKIDs are over two separate columns ("new.partner.skid" and "existing.skid"), so these are isolated.


skids <- c(RGT_traced_neurones_full_skids[[1]], RGT_traced_neurones_full_skids[[2]])
skids

[1]      NA      NA      NA      NA 3966423      NA      NA      NA      NA      NA      NA      NA 1703668      NA      NA      NA      NA      NA      NA      NA      NA 1703648      NA      NA      NA      NA
[27]      NA      NA      NA      NA      NA      NA      NA 1105308 1703421 8414264 3966989      NA 3125683 1102353 3958821 5488325 1101751 3477461 2400220      NA 1706538 1091983 1706774 5626657 1771341 1104156
[53] 1709487 1765477      NA  856322 1707578 5626657 3926693      NA 7474777 2435769 3896462 1705226 3063358      NA

  #The SKIDs are concatenated into a single vector


skids_not_NA <- subset(skids, !is.na(skids))

  # !is.na(skids) removes every "NA" value
  # "!" stands for "not"


skids_not_NA
[1] 3966423 1703668 1703648 1105308 1703421 8414264 3966989 3125683 1102353 3958821 5488325 1101751 3477461 2400220 1706538 1091983 1706774 5626657 1771341 1104156 1709487 1765477  856322 1707578 5626657 3926693
[27] 7474777 2435769 3896462 1705226 3063358

