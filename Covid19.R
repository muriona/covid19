library(reshape2)
library(ggplot2)
library(gridExtra) # for arranging plots
library(cowplot)
library(ggsci)
library(readxl)
library(RColorBrewer)
library(ggpmisc)
library(scales)
library(ggpubr)
library(Metrics)
library(readr)
library(dplyr)

#0. Importar dados do excel
COVID19 <- read_delim("~/Downloads/COVID19.csv", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

COVID19 %>% group_by(estado) %>% summarise(sum(casosNovos))

ggplot(data=COVID19, aes(x=data, y=casosAcumulados, color=regiao)) +
  geom_line(size=1)+ theme_bw()+ theme(legend.position="none")+ 
  labs(subtitle = "ICE - Historico vs Simulado")+ scale_y_continuous(labels = comma)+
  labs(y = "Veiculos (milhões)")+ labs(x='Year')
