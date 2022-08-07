library(tidyverse)
library(ggtext)
library(showtext)
library(png)
library(patchwork)
library(nflplotR)

equipes <- rep(c("Shanghai Port", "Al-Hilal"), each = 8)
ano <- c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022)
valor <- c(15.05, 65.53, 93.43, 74.73, 74.43, 110.35, 67.68, 24.98, 16.48, 27.80, 28.08, 60.75, 48.45, 65.68, 62.38, 60.70)


df <- data.frame(equipes, ano, valor)


font_add_google("Montserrat", "montserrat")
font_add_google("Josefin Sans", "josefinsans")
showtext_auto()
set.seed(123)




df %>% 
  ggplot(aes(x = ano, y = valor, group = equipes, fill = equipes))+
  geom_bar(position = 'dodge', stat = 'identity',  alpha = 0.75)+
  geom_text(aes(label = paste0(valor,"\nmilhões (€)")), position=position_dodge(width=0.9), vjust=-0.25, colour = "#5D0D10", family = "montserrat", size = 2.4, fontface = "bold",
            alpha = .7)+
  theme_minimal()+
  annotate(
    nflplotR::GeomFromPath,
    x = 2015.4, y = 105,
    path = "C:\\Users\\ritad\\Shanghai_Port_FC.png",
    width = 0.06)+
  annotate(
    nflplotR::GeomFromPath,
    x = 2014.7, y = 105,
    path = "C:\\Users\\ritad\\Al-Hilal_Saudi_Football_Club.png",
    width = 0.05)+
  scale_x_continuous(breaks=seq(2015,2022,1))+
  scale_y_continuous(breaks = seq(0, 130, 20))+
  annotate("text", x = 2014.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.76, y = -2, label = "Al-Hilal", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2022.2, y = -3.3, label = "Shanghai\nPort", 
           size = 3, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  
  labs(title = "Comparação entre as equipes Shanghai Port (China) e Al-Hilal (Arábia Saudita) entre 2015 e 2022",
       subtitle = "Antes potência asiática no futebol, a China vem perdendo atratividade e dinheiro, ao passo que a Arábia Saudita iniciou um projeto de investimento local\n",
       caption = c("@rafaelf_lima", "Fonte: Transfermarkt"),
       x = "Temporada",
       y = "Valor em milhões (€)")+ 
  scale_fill_manual("legend", values = c("Shanghai Port" = "#F0090B", "Al-Hilal" = "#00008b"))+
  theme(
    legend.position = "none",
    plot.background = element_rect(fill = "#F2DFCE", color = "#F2DFCE"),
    panel.background =element_rect(fill = "#F2DFCE", color = "#F2DFCE"),
    panel.grid.minor = element_blank(),
    axis.text = element_text(colour = "#2F4858", family = "montserrat", size = 10, face = "bold"),
    axis.title.x = element_blank(),
    axis.title = element_text(size = 7, colour = "#5D0D10", face = "bold", family = "montserrat"),
    plot.title = element_text(size = 16, colour = "#5D0D10", family = "josefinsans", face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 11, colour = "#5D0D10", family = "josefinsans", face = "bold"),
    plot.margin = unit(c(0,0,0,0), "cm"),
    plot.caption = element_text(size = 7, family = "josefinsans", colour = "#514438", hjust = c(0, 0.95))
  )




