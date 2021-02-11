#loading the rentrez package
library(rentrez)

#creating a vector with desired ncbi ids
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

#downlaoding the fasta versions of the specified ids in from "nuccore" database on NCBI
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#Splitting the three IDs into separate objects
Sequences <- strsplit(Bburg, split = "\n\n")

#converting Sequences object to a dataframe
Sequences<-unlist(Sequences)

#defining the header of each sequence
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
#defining the sequence
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
#creating a data frame with separate name and sequence columns
Sequences<-data.frame(Name=header,Sequence=seq)

#exporting the data frame
write.csv(Sequences, "Sequences.csv")
