# Code Book - Human Activity Recognition Using Smartphones

Este Code Book descreve os dados, as variáveis e as transformações realizadas para limpar os dados do conjunto original "UCI HAR Dataset".

## Identificadores
* **subject**: O ID do voluntário que realizou o teste (1 a 30).
* **activity**: O nome da atividade realizada pelo sujeito no momento da medição:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

## Variáveis de Sensores (Médias e Desvios Padrão)
As variáveis abaixo representam a média das medições originais agrupadas por sujeito e atividade. Elas foram extraídas do conjunto original por conterem "mean" (média) ou "std" (desvio padrão) em seus nomes.

**Observação sobre os nomes:**
* Prefixo **Time**: Indica sinais de domínio de tempo.
* Prefixo **Frequency**: Indica sinais de domínio de frequência.
* **Accelerometer**: Sinais vindos do acelerômetro.
* **Gyroscope**: Sinais vindos do giroscópio.
* **Magnitude**: Cálculo da magnitude desses sinais.

**Exemplos de colunas incluídas:**
* `TimeBodyAccelerometer.mean...X`
* `TimeBodyAccelerometer.std...Y`
* `FrequencyBodyGyroscope.mean...Z`
* *(E as demais 79 variáveis de média e desvio padrão extraídas)*

## Transformações Realizadas
1. **Fusão de dados**: Os conjuntos de treinamento (`train`) e teste (`test`) foram combinados em um único dataframe.
2. **Seleção de Colunas**: Apenas colunas contendo as strings `mean` ou `std` foram mantidas, além de `subject` e `code`.
3. **Rotulagem de Atividades**: Os códigos numéricos (1-6) na coluna `code` foram substituídos pelos nomes descritivos fornecidos no arquivo `activity_labels.txt`.
4. **Limpeza de Nomes**:
    * O prefixo `t` foi substituído por `Time`.
    * O prefixo `f` foi substituído por `Frequency`.
    * Abreviações como `Acc`, `Gyro` e `Mag` foram expandidas para `Accelerometer`, `Gyroscope` e `Magnitude`.
5. **Agrupamento**: O conjunto final foi agrupado por `subject` e `activity`, calculando-se a média de todas as outras variáveis para cada combinação.
