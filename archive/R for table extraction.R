library(docxtractr)
doc = read_docx("paper as word doc.docx")

#tb1 final:
tb1 = docx_extract_tbl(doc, tbl_number = 1)
names(tb1) = c("Sample", "Tot_Phen_Ind", "Col_Int_420_520",
               "Col_Int_420_520_620", "Hue", "Chem_Age_Ind")
tb1=as.data.frame(tb1)
tb1[,2:6] = apply(tb1[,2:6],2,as.numeric)
tb1

#tb2 final:
tb2 = docx_extract_tbl(doc, tbl_number = 2)
names(tb2) = c("Sample", "Tot_Anthocyans", "Tot_Anthocyanins",
               "Col_Anthocyanins", "Tot_Tannins")
tb2 = as.data.frame(tb2)
tb2[,2:5] = apply(tb2[,2:5],2,as.numeric)
tb2

# tb3 final:
tb3 = docx_extract_tbl(doc, tbl_number=5)
tb3 = as.data.frame(tb3)
tb3[,2:6] = apply(tb3[,2:6],2,as.numeric)
tb3

# tb4 final:
tb4a = docx_extract_tbl(doc,tbl_number = 6)
tb4b = docx_extract_tbl(doc, tbl_number = 7)
tb4 = rbind(tb4a, tb4b)
names(tb4) = c(names(tb4)[1:4], "MvGlAc", "DpGlCm", "PtGlCm", "PnGlCm",
               "MvGlCm", "MvGlCf")
tb4 = as.data.frame(tb4)
tb4[,2:10] = apply(tb4[,2:10],2,as.numeric)
tb4

# final table:
tbf = cbind(tb1,tb2[,-1],tb3[,-1],tb4[,-1])
write.csv(tbf, "extracted data.csv")
