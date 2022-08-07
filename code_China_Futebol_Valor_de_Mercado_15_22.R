library(tidyverse)
library(showtext)
library(nflplotR)

times <- rep(c("Shanghai Port", "Shandong Taishan", "Guangzhou FC", "Beijing Guoan", "Shanghai Shenhua"), each = 8)
epoca <- c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022)
valor_mercado <- c(15.05, 65.53, 93.43, 74.73, 74.43, 110.35, 67.68, 24.98, 26.93, 40.50, 35.83, 30.45, 38.90, 46.40, 21.20, 16.63,
                   48.78, 75.23, 68.03, 51.05, 47.88, 92.63, 25.40, 3.86, 19.93, 30.05, 35.63, 43.55, 58.40, 77.23, 33.73, 9.88,
                   30.48, 33.98, 52.78, 36.18, 50.58, 42.23, 14.83, 9.50)

dfc <- data.frame(times, epoca, valor_mercado)

view(dfc)

font_add_google("Montserrat", "montserrat")
font_add_google("Josefin Sans", "josefinsans")
showtext.auto()
set.seed(123)

dfc %>% 
  ggplot(aes(x = epoca, y = valor_mercado, group = times, fill = times))+
  geom_bar(alpha = .75, stat = 'identity', position = 'dodge')+
  geom_text(aes(label = paste0("€", valor_mercado,"\nmilhões")), position = position_dodge(width = 0.9), vjust = -0.25, colour = "#5D0D10", family = "montserrat", size = 1.85, fontface = "bold",
            alpha = .9)+
  theme_minimal()+
  annotate(
    nflplotR::GeomFromPath,
    x = 2022.5, y = 117,
    path = "C:\\Users\\ritad\\Chinese_Super_League_Logo.png",
    width = 0.06
  )+
  annotate(
    nflplotR::GeomFromPath,
    x = 2015, y = 105,
    path = "C:\\Users\\ritad\\Beijing_Guoan_FC.png",
    width = 0.04
  )+
  annotate(
    nflplotR::GeomFromPath,
    x = 2015.5, y = 105,
    path = "C:\\Users\\ritad\\Guangzhou_Evergrande_Taobao_logo.png",
    width = 0.033)+
  annotate(
    nflplotR::GeomFromPath,
    x = 2016, y = 104,
    path = "C:\\Users\\ritad\\shandong-taishan-football.png",
    width = 0.033
  )+
  annotate(
    nflplotR::GeomFromPath,
    x = 2015, y = 88,
    path = "C:\\Users\\ritad\\Shanghai_Port_FC.png",
    width = 0.04)+
  annotate(
    nflplotR::GeomFromPath,
    x = 2015.5, y = 88,
    path = "C:\\Users\\ritad\\Shanghai_Shenhua_F.C.png",
    width = 0.04)+
  scale_x_continuous(breaks = seq(2015, 2022,1))+
  scale_y_continuous(breaks=seq(0,115, 20))+
  annotate("text", x = 2014.62, y = -1.8, label = "Beijing\nGuoan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.62, y = -1.8, label = "Beijing\nGuoan", size = 1.7,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2014.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.8, y = -1.8, label = "Guangzhou\nFC", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2022.0, y = -1.8, label = "Shandong\nTaishan", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.18, y = -1.8, label = "Shanghai\nPort", size = 1.8, color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2022.18, y = -1.8, label = "Shanghai\nPort", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2015.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2016.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2017.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2018.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2019.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2020.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2021.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  annotate("text", x = 2022.36, y = -1.8, label = "Shanghai\nShenhua", size = 1.8,  color = "#5D0D10", fontface = "bold", family = "josefinsans")+
  scale_fill_manual("legend", values = c("Beijing Guoan" = "#1CB368", "Guangzhou FC" = "#CF2526", "Shandong Taishan" = "#E94820", "Shanghai Port" = "#F0090B", 
                                         "Shanghai Shenhua" = "#115199"))+
  theme(
    legend.position = "none",
    plot.background = element_rect(fill = "#F2DFCE", color = "#F2DFCE"),
    panel.background = element_rect("#F2DFCE", color = "#F2DFCE"),
    panel.grid.minor = element_blank(),
    axis.text = element_text(colour = "#2F4858", family = "montserrat", size = 10, face = "bold"),
    axis.title.x = element_blank(),
    axis.title = element_text(size = 7, colour = "#5D0D10", face = "bold", family = "montserrat"),
    plot.title = element_text(size = 16, colour = "#5D0D10", family = "josefinsans", face = "bold"),
    plot.subtitle = element_text(size = 11, colour = "#5D0D10", family = "josefins", face = "bold"),
    plot.margin = unit(c(0,0,0,0), "cm"),
    plot.caption = element_text(size = 7, family = "josefinsans", colour = "#514438", hjust = c(0,0.95))  
    )+
  labs(title = "Comparação entre o valor de mercado das principais equipes chinesas entre 2015 e 2022",
       subtitle = "A ascensão e queda do futebol chinês se tornou visível ao longo dos últimos sete anos",
       caption = c("@rafaelf_lima", "Fonte: Transfermarkt"),
       y = "Valor em milhões (€)")

  
  
    