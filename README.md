# Getting-and-Cleaning-Data-Project
Projeto final do curso Getting and Cleaning Data - Johns Hopkins University (Coursera)

Introdução: Script em R para tratamento de dados referente ao acelerômetro do Samsung Galaxy S, parte final do curso Getting-and-Cleaning-Data-Project.

Arquivos do Repositório:

run_analysis.R: O script que realiza toda a limpeza (desde o download até a exportação do arquivo final).

Final_Tidy_Data.txt: O resultado final da média das variáveis por sujeito e atividade.

CodeBook.md: Descrição das variáveis e transformações.

Procedimentos do Script:
1. Preparação e Carga de Dados
Uso da lib: library(dplyr)

2. Faz o download do arquivo na SandBox e realiza a leitura

3. Faz o carregamento e uni os 'Teste'

4. Carrega e Uni os dados do Treino (Train)

5. Faz a Junção e o Filtro de Média/Desvio Padrão com uso do rbind

6. Ajusta os nomes das colunas utilizando gsub

7. Cria o conjunto final de médias, utilizando group_by e summarise

8. Gerar arquivo final
write.table(final_tidy_data, "Final_Tidy_Data.txt", row.name = FALSE)
