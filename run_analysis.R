# 1. Preparação e Carga de Dados
library(dplyr)

# Se os arquivos não estiverem na pasta, o código de download que usamos antes entra aqui
# Mas como vejo "UCI HAR Dataset" na sua imagem, vamos direto para a leitura:

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# 2. Carregar e Unir Teste
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
test_data <- cbind(subject_test, y_test, x_test)

# 3. Carregar e Unir Treino (Train)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
train_data <- cbind(subject_train, y_train, x_train)

# 4. Fusão e Filtro de Média/Desvio Padrão
all_data <- rbind(train_data, test_data)
tidy_data <- all_data %>% 
  select(subject, code, contains("mean"), contains("std"))

# 5. Nomes Descritivos
tidy_data$code <- activities[tidy_data$code, 2]
names(tidy_data)[2] <- "activity"
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

# 6. Criar conjunto final de médias
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Gerar arquivo final
write.table(final_tidy_data, "Final_Tidy_Data.txt", row.name = FALSE)
