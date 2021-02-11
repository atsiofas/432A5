#loading libraries, including the Biostrings package which allows us to 
#subset the DNA sequence string based on position 
library(BiocManager)
install("Biostrings")
library(rentrez)
library(Biostrings)

#retrieving the covid 19 genome sequence from NCBI database in fasta form
covid19 <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

#removing the header of the fasta sequence
covid19 <- sub(">.*genome", "", covid19)
#removing the newline characters
covid19<- c(gsub("\\n", "", covid19))
#changing the sequence into a subset-able object
covid19 <- DNAString(covid19)
#isolating the spike proten from the specified start and end sequence
Sprotein <- covid19[21563:25384]

#The spike protein sequence seems to be strongly conserved among many different SARS cov 2 
#strains identified all around the world. This is noticeable because in the blast search there
#is nearly 100 listed strains with a 100% match of the searched sequence. There are also high 
#alignment scores on the top 100 subject sequences and the alignment tab shows exact 1 to 1 
#matches of nearly every base pair (between our sequence base and the top results in the database)
#This is promising, indicating the vaccine therapy that targets this protein could protect against
#many of these strains