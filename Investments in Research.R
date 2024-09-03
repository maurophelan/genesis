library(WDI)
library(dplyr)
library(ggplot2)

inversiones_data <- WDI::WDI(country = c("CL", "NZ", "HR"), indicator = "NE.GDI.TOTL.ZS", start = 2001, end = 2019)
# Limpiar los datos
inversiones_data_clean <- inversiones_data %>%
  filter(!is.na(NE.GDI.TOTL.ZS))
ggplot(inversiones_data_clean, aes(x = year, y = NE.GDI.TOTL.ZS, color = country)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + # Agregar línea de regresión lineal
  labs(title = "Inversiones como porcentaje del PIB en Chile, Nueva Zelanda y Croacia (2001-2019)",
       x = "Año",
       y = "Inversión (% del PIB)") +
  theme_minimal()


################# Inversión en ciencia y tecnología #############

# ciencia y tecnología (indicador: GB.XPD.RSDV.GD.ZS)
investigacion_data <- WDI::WDI(country = c("CL", "NZ", "HR"), indicator = "GB.XPD.RSDV.GD.ZS", start = 2001, end = 2019)
# Limpiar los datos
investigacion_data_clean <- investigacion_data %>%
  filter(!is.na(GB.XPD.RSDV.GD.ZS))
# Crear gráfico de regresión lineal
ggplot(investigacion_data_clean, aes(x = year, y = GB.XPD.RSDV.GD.ZS, color = country)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + # Agregar línea de regresión lineal
  labs(title = "Inversión en Ciencia y Tecnología como porcentaje del PIB en Chile, Nueva Zelanda y Croacia (2001-2019)",
       x = "Año",
       y = "Inversión en Ciencia y Tecnología (% del PIB)") +
  theme_minimal()
