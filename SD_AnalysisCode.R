
library(ggplot2)
library(dplyr)
library(tidyverse)
library(pilot)
library(hablar)
library(patchwork)
library(ggthemes)
library(extrafont)

sank <- read_csv("shinyDigitise_Analysis.csv") %>%
  janitor::clean_names() %>%
  filter(published == "Published") %>%
  filter(paper_type == "Meta-analysis")


g1<-ggplot(sank, aes(x = fct_rev(data_present), fill = data_present)) +
  geom_bar() +
  theme_pilot() + 
  theme(legend.position = "none",
        axis.title.x = element_blank()) +
  labs(x = "Answer", y = "Number") +
  scale_fill_manual(values = c("coral", "darkolivegreen4")) +
  ggtitle("Is the data open?")+
  theme(plot.title = element_text(size = 12, face = "bold")) +
  scale_y_continuous(limits = c(0, 60), breaks = seq(0, 60, by = 20))

g2<-ggplot(sank, aes(x = fct_rev(location_given), fill = location_given)) +
  geom_bar() +
  theme_pilot() + 
  theme(legend.position = "none",
        axis.title.x = element_blank()) +
  labs(x = "Answer", y = "Number") +
  scale_fill_manual(values = c("coral", "darkolivegreen4")) +
  ggtitle("Is the location of effect sizes given?")+
  theme(plot.title = element_text(size = 12, face = "bold"))+
  scale_y_continuous(limits = c(0, 60), breaks = seq(0, 60, by = 20))


g3<-ggplot(sank, aes(x = fct_rev(figures_present), fill = figures_present)) +
  geom_bar() +
  theme_pilot() + 
  theme(legend.position = "none") +
  labs(x = "Answer", y = "Number") +
  scale_fill_manual(values = c("coral", "darkolivegreen4")) +
  ggtitle("Are the extracted figures open?")+
  theme(plot.title = element_text(size = 12, face = "bold")) +
  scale_y_continuous(limits = c(0, 60), breaks = seq(0, 60, by = 20))


g4<-ggplot(sank, aes(x = fct_rev(caldat), fill = caldat)) +
  geom_bar() +
  theme_pilot() + 
  theme(legend.position = "none") +
  labs(x = "Answer", y = "Number") +
  scale_fill_manual(values = c("coral", "darkolivegreen4")) +
  ggtitle("Is a historical record present?") +
  theme(plot.title = element_text(size = 12, face = "bold")) +
  scale_y_continuous(limits = c(0, 60), breaks = seq(0, 60, by = 20))

layout <- 
  "AB
   CD"

g1+g2+g3+g4 + plot_layout(design = layout)

ggsave("bar.jpg", width = 8, height = 8, dpi = 600, device = "jpg")
