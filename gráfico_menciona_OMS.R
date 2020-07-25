#Fonte: http://www.ensp.fiocruz.br/portal-ensp/informe/site/materia/detalhe/49189
library(ggplot2)

dados <- data.frame(tipo=c("Recomendam o uso da cloroquina no tratamento da Covid-19",
                           "São contra o uso de máscaras", 
                           "São contra o distanciamento social",
                           "Afirmam que as ações da instituição são estratégias políticas",
                           "Ensinam métodos caseiros para curar a Covid-19"),
                    freq=c(416, 250, 167, 83, 83), 
                    porcentagem=c("41,6%", "25%", "16,7%", "8,3%", "8,3%"))

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
  labs(title = "Distribuição das Fake news que mencionam a OMS",
       subtitle = "Fonte: Informe ENSP")