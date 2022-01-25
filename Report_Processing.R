library('readxl')
library('dplyr')
library("writexl")


#Get file from SP
setwd('C:/Users/RDINCHA/Desktop')
getwd()

raw_SP <- read_excel(file.choose())
SP <- as.data.frame(raw_SP)

#Filer the more actual ID's
SP <-SP[SP$ID > 45000, ] 

#Create an excel with the filtered ID's
write_xlsx(SP, "C:\\Users\\RDINCHA\\Desktop\\PA_SP_Modified.xlsx")

#Get file from late payments
setwd('C:/Users/RDINCHA/Desktop')
getwd()

raw_late <- read_excel(file.choose())
Late <- as.data.frame(raw_late)

# Replace column names
colnames(Late)[which(names(Late) == "SC - Additional Info")] <- "Category"
colnames(Late)[which(names(Late) == "Late / On Time")] <- "LateNoLate"

#Filter rows
Late2 <- subset(Late, LateNoLate == 'Late' & 
                  (Category == 'BAMA INVOICES' | Category == 'THROUGHPUT FEES')
                )

#Create an excel with the filtered ID's
write_xlsx(Late2, "C:\\Users\\RDINCHA\\Desktop\\Late_Payment_Modified.xlsx")





