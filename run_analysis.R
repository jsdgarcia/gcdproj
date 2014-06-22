## Project
#setwd("/Users/joao/Desktop/Estudos/getdata/proj")

features <- read.table("./UCI_HAR_Dataset/features.txt")

test_compl <- read.table("./UCI_HAR_Dataset/test/X_test.txt", col.names = features$V2)
teca <- read.table("./UCI_HAR_Dataset/test/y_test.txt", col.names = "idactiv")
tecs <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", col.names = "idsubj")
test_compl$idactiv <- teca$idactiv
test_compl$idsubj <- tecs$idsubj


train_compl <- read.table("./UCI_HAR_Dataset/train/X_train.txt", col.names = features$V2)
trca <- read.table("./UCI_HAR_Dataset/train/y_train.txt", col.names = "idactiv")
trcs <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", col.names = "idsubj")
train_compl$idactiv <- trca$idactiv
train_compl$idsubj <- trcs$idsubj

total_compl <- rbind(test_compl,train_compl)

total_compl <- test_compl

cols_meanstd <- names(total_compl)
total_ss <- subset(total_compl, select = grepl(".mean[.]",cols_meanstd)|grepl(".std.",cols_meanstd)|grepl("idactiv",cols_meanstd)|grepl("idsubj",cols_meanstd))

dactiv <- read.table("./UCI_HAR_Dataset/activity_labels.txt", col.names = c("idactiv","act_description"))

total_ss <- merge(total_ss,dactiv,by="idactiv")


write.table(total_ss,file="data_set_1.txt")

total_ss_mean <- aggregate(total_ss[2:67], by=list(total_ss$idsubj,total_ss$idactiv,total_ss$act_description),FUN=mean, na.rm=TRUE)

write.table(total_ss_mean,file="data_set_agg.txt")
