


library(WDI)
library(dplyr)
library(ggplot2)
WDIsearch("GDP")
WDIsearch("GDP")
gdp_data <- WDI::WDI(country = "CL", indicator = "NY.GDP.MKTP.CD", start = 2000, end = 2023)
gdp_data_clean <- gdp_data %>%
  filter(!is.na(NY.GDP.MKTP.CD)) %>%
  arrange(desc(NY.GDP.MKTP.CD))
ggplot(gdp_data_clean[gdp_data_clean$country == "United States", ], aes(x = year, y = NY.GDP.MKTP.CD)) +
  geom_line() +
  labs(title = "GDP", x = "Año", y = "GDP Dolars")
# Descargar datos de PIB per cápita (indicador: NY.GDP.PCAP.CD)
pib_data <- WDI::WDI(country = c("CL", "NZ"), indicator = "NY.GDP.PCAP.CD", start = 2001, end = 2019)
pib_data_clean <- pib_data %>%
  filter(!is.na(NY.GDP.PCAP.CD))


# Crear gráfico
ggplot(pib_data_clean, aes(x = year, y = NY.GDP.PCAP.CD, color = country)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + # Agregar línea de regresión lineal
  labs(title = "PIB per cápita de Chile y Nueva Zelanda (2001-2019)",
       x = "Año",
       y = "PIB per cápita (en dólares)") +
  theme_minimal()
