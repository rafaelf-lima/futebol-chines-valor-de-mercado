library(tidyverse)
library(worldfootballR)
library(janitor)
library(ggtext)
library(showtext)
library(data.table)
library(nflplotR)

csl2019 <- tm_matchday_table(country_name="China", start_year="2018", matchday= seq(1:30)) %>% 
  clean_names()

view(csl2019)

csl2019_novo <- csl2019 %>% 
  filter(matchday == 1) %>% 
  mutate(across(c(p, matchday, pts, w, d, l, gf, ga, g_diff),
                ~0)) %>% 
  arrange(squad) %>% 
  mutate(rk = row_number())

graf_csl2019 <- rbind(csl2019_novo, csl2019)

graf_csl20192 <- graf_csl2019 %>% 
  rename(squad2 = squad)


font_add_google("Montserrat", "montserrat")
font_add_google("Josefin Sans", "josefinsans")
showtext_auto()
set.seed(123) 


equipes_csl2019 <- c(`BJ Guoan` = "Beijing Guoan (2º)",
                 `BJ Renhe` = "Beijing Renhe (16º)",
                 `CQ Dangdai Lif.` = "Chongqing Dangdai Lifan FC (10º)",
                 `DL Yifang` = "Dalian Yifang (9º)",
                 `GZ Evergrande` = "Guangzhou Evergrande (1º)",
                 `GZ R&F` = "Guangzhou R&F (12º)",
                 `HB CFFC` = "Hebei China Fortune (11º)",
                 `HN Jianye` = "Henan Construction (8º)",
                 `JS Suning` = "Jiangsu Juning (4º)",
                 `SD Luneng` = "Shandong Luneng (5º)",
                 `SH Shenhua` = "Shanghai Shenhua (13º)",
                 `SH SIPG` = "Shanghai SIPG (3º)",
                 `SZ FC` = "Shenzhen FC (15º)",
                 `TJ Teda` = "Tianjin Teda (7º)",
                 `TJ Tianhai` = "Tianjin Tianhai (14º)",
                 `WH Zall` = "Wuhan Zall (6º)"
)



ggplot()+
  geom_line(data = graf_csl20192, aes(x = matchday, y = pts, group = squad2), 
            colour = "#D19EA2", size = .3, alpha = 0.7)+
  geom_line(data = graf_csl2019, aes(x = matchday, y = pts, group = squad),
            color = "#5D0D10",
            size = .75)+
  scale_x_continuous(breaks = seq(0, 31,2))+
  scale_y_continuous(breaks = seq(0, 72, 8))+
  annotate(
    nflplotR::GeomFromPath,
    x = 3, y = 62,
    path = "C:\\Users\\ritad\\Chinese_Super_League_Logo.png",
    width = 0.15
  )+
  facet_wrap(~ squad, labeller = as_labeller(equipes_csl2019), scales = "fixed")+
  theme_minimal()+
  labs(title= "Evolução da pontuação das equipes da Superliga Chinesa 2019 ao longo das trinta rodadas",
       subtitle = "Em 2019, o Guangzhou Evergrande foi o campeão com 72 pontos",
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
