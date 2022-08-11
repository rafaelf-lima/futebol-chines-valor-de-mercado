library(tidyverse)
library(worldfootballR)
library(janitor)
library(ggtext)
library(showtext)
library(data.table)
library(nflplotR)

csl <- tm_matchday_table(country_name="China", start_year="2021", matchday= seq(1:11)) %>% 
  clean_names()

view(csl)

csl_novo <- csl %>% 
  filter(matchday == 1) %>% 
  mutate(across(c(p, matchday, pts, w, d, l, gf, ga, g_diff),
                ~0)) %>% 
  arrange(squad) %>% 
  mutate(rk = row_number())

graf_csl <- rbind(csl_novo, csl)

graf_csl2 <- graf_csl %>% 
  rename(squad2 = squad)


font_add_google("Montserrat", "montserrat")
font_add_google("Josefin Sans", "josefinsans")
showtext_auto()
set.seed(123) 


equipes_csl <- c(`BJ Guoan` = "Beijing Guoan (8º)",
                 `CC Yatai` = "Changchun Yatai (13º)",
                  `CD Rongcheng` = "Chengdu Rongcheng (10º)",
                 `CZ Mighty Lions` = "Cangzhou Mighty Lions (14º)",
                  `DL Pro` = "Dalian Professional (15º)",
                 `GuaZ FC` = "Guangzhou FC (16º)",
                  `GZ City` = "Guangzhou City (18º)",
                 `HB FC` = "Hebei FC (17º)",
                  `HN S. Longmen` = "Henan Songshan Longmen (3º)",
                 `MZ Hakka` = "Meizhou Hakka (6º)",
                 `SD Taishan` = "Shandong Taishan (2º)",
                 `SH Port` = "Shanghai Port (7º)",
                 `SH Shenhua` = "Shanghai Shenhua (4º)",
                 `SZ FC` = "Shenzhen FC (9º)",
                 `TJ Jinmen Tiger` = "Tianjin Jinmen Tiger (11º)",
                 `WH Three Towns` = "Wuhan Three Towns (1º)",
                 `WH Yangtze` = "Wuhan Yangtze (12º)",
                 `ZJ FC` = "Zhejiang FC (5º)"
                 )


ggplot()+
  geom_line(data = graf_csl2, aes(x = matchday, y = pts, group = squad2), 
            colour = "#D19EA2", size = .3, alpha = 0.7)+
  geom_line(data = graf_csl, aes(x = matchday, y = pts, group = squad),
            color = "#5D0D10",
            size = .75)+
  annotate(
    nflplotR::GeomFromPath,
    x = 1.3, y = 26,
    path = "C:\\Users\\ritad\\Chinese_Super_League_Logo.png",
    width = 0.15
  )+
  scale_x_continuous(breaks = seq(0, 11,1))+
  facet_wrap(~ squad, labeller = as_labeller(equipes_csl), scales = "fixed")+
  theme_minimal()+
  labs(title= "Evolução da pontuação das equipes da Superliga Chinesa 2022 ao longo das onze rodadas",
       subtitle = "Depois de onze rodadas, o Wuhan Three Towns lidera de forma isolada, ao passo que os gigantes Shanghai Port e Guangzhou FC estão longe do topo",
       caption = c("@rafaelf_lima", "Inspiração: jvieroe (twitter.com/jvieroe)\nFonte: Transfermarkt"),
       y = "Pontos",
       x = "Rodadas")+
  theme(plot.background = element_rect(color = "#F2DFCE", fill = "#F2DFCE"),
        panel.background = element_rect(fill = "#F2DFCE", color = "#F2DFCE"),
        panel.grid.major = element_line(color = "#D0B9BD"),
        panel.grid.minor = element_blank(),
        plot.title = element_text(size = 16, colour = "#5D0D10", family = "josefinsans", face = "bold"),
        plot.subtitle = element_text(size = 11.5, colour = "#5D0D10", family = "josefinsans", face = "bold"),
        plot.margin = unit(c(0,0,0,0), "cm"),
        plot.caption = element_text(size = c(8.5, 10.7), family = "josefinsans", colour = "#514438", face = "bold", hjust = c(0,0.95)),
        axis.text = element_text(colour = "#2F4858", family = "montserrat", size = 7.3, face = "bold"),
        axis.title = element_text(size = 8, colour = "#5D0D10", face = "bold", family = "montserrat"),
        strip.text = element_text(colour = "#2F4858", family = "josefinsans", face = "bold", size = 9)
  )
  
