#Fonte: http://www.ensp.fiocruz.br/portal-ensp/informe/site/materia/detalhe/49189
library(ggplot2)

dados <- data.frame(tipo=c("Citam a instituição como orientadora dos métodos caseiros para prevenir o contágio",
                           "Difamam a reputação da presidente da Fundação", 
                           "Caluniam a instituição",
                           "Ensinam métodos caseiros para curar a Covid-19",
                           "Utilizam o nome da Fiocruz para arrecadações"), 
                    freq=c(455, 184, 180, 91, 91), 
                    porcentagem=c("45,5%", "18,4%", "18%", "9,1%", "9,1%"))

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )

pizza <- ggplot(dados, aes(x="",y=freq, fill=tipo))+
  geom_bar(width = 1,stat = "identity")+
  coord_polar("y", start = 0, direction = -1)

pizza+ scale_fill_brewer(palette="Dark2") +  blank_theme +
  theme(axis.text.x=element_blank()) +
  geom_text(aes(x = "", y = freq), 
            position = position_stack(vjust = 0.5),
            label = dados$porcentagem, data = dados, size=4) +
  labs(title = "Distribuição das Fake news relacionadas com a Fiocruz",
       subtitle = "Fonte: Informe ENSP")