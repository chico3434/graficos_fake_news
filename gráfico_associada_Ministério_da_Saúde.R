#Fonte: http://www.ensp.fiocruz.br/portal-ensp/informe/site/materia/detalhe/49189
library(ggplot2)

dados <- data.frame(tipo=c("Afirmam que as ações relacionadas à Covid-19 são estratégias políticas",
                           "Difamam o ministro e profissionais de saúde"),
                    freq=c(667, 333), 
                    porcentagem=c("66,7%", "33,3%"))

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
  labs(title = "Distribuição das Fake news associadas ao Ministério da Saúde",
       subtitle = "Fonte: Informe ENSP")