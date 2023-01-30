## Un paquete para la generación de métricas de error precisas, accesibles y adaptables para el desarrollo predicciones e inferencias de alta calidad. El nombre A3 (pronunciado "A-Cubed") proviene del combinación de las primeras letras de estos tres adjetivos primarios.

#El objetivo general de los resultados y las herramientas de este paquete es hacer que la evaluación precisa de los errores del modelo sea más accesible para un público más amplio. Además, este paquete proporciona un conjunto estandarizado de características de informes que crean resultados consistentes para prácticamente cualquier modelo predictivo. Esto facilita la comparación, por ejemplo, de un modelo de regresión lineal con técnicas más exóticas, como bosques aleatorios o máquinas de vectores de soporte.

#Los resultados estándar para cada modelo proporcionado por el paquete A3 incluyen:
#• Pendiente Media: Equivalente a un coeficiente de regresión lineal.
#• R2 con validación cruzada: Cálculo robusto de los valores de R2 (porcentaje de error cuadrático explicado por el modelo en comparación con el modelo nulo) que se ajustan por sobreajuste.
#• Valores de p: Cálculo robusto de valores de p que no requiere suposiciones paramétricas además de la independencia entre observaciones (que puede violarse si se compensa).

#Las funciones principales que se utilizarán son a3 para funciones de modelado arbitrario y a3.lm para modelos lineales. Este paquete también incluye print.A3 y plot.A3 para generar los resultados A3.

#Descripción

#Esta función calcula los resultados A3 para un algoritmo de construcción de modelo arbitrario (por ejemplo, regresiones lineales, máquinas de vectores de soporte o bosques aleatorios). Para los modelos de regresión lineal, puede usar la función de conveniencia a3.lm.

library(A3)

Ejemplos

## Standard linear regression results:
summary(lm(rating ~ ., attitude))
## A3 Results for a Linear Regression model:
# In practice, p.acc should be <= 0.01 in order
# to obtain finer grained p values.
a3(rating ~ ., attitude, lm, p.acc = 0.1)
## A3 Results for a Random Forest model:
# It is important to include the "+0" in the formula
# to eliminate the constant term.
require(randomForest)
a3(rating ~ .+0, attitude, randomForest, p.acc = 0.1)
# Set the ntrees argument of the randomForest function to 100
a3(rating ~ .+0, attitude, randomForest, p.acc = 0.1, model.args = list(ntree = 100))
# Speed up the calculation by doing 5-fold cross-validation.
# This is faster and more conservative (i.e. it should over-estimate error)
a3(rating ~ .+0, attitude, randomForest, n.folds = 5, p.acc = 0.1)
# Use Leave One Out Cross Validation. The least biased approach,
# but, for large data sets, potentially very slow.



# Calculate the A3 results assuming an auto-correlated set of observations.
# In usage p.acc should be <=0.01 in order to obtain more accurate p values.
a3.lm(rating ~ ., attitude, p.acc = 0.1,
      data.generating.fn = replicate(ncol(attitude), a3.gen.autocor))
## A general illustration:
# Take x as a sample set of observations for a feature
x <- c(0.349, 1.845, 2.287, 1.921, 0.803, 0.855, 2.368, 3.023, 2.102, 4.648)
# Generate three stochastic data series with the same autocorrelation properties as x
rand.x <- a3.gen.autocor(x, 3)
plot(x, type="l")
for(i in 1:3) lines(rand.x[[i]], lwd = 0.2)


## Standard linear regression results:
summary(lm(rating ~ ., attitude))
## A3 linear regression results:
# In practice, p.acc should be <= 0.01 in order
# to obtain fine grained p values.
a3.lm(rating ~ ., attitude, p.acc = 0.1)
# This is equivalent both to:
a3(rating ~ ., attitude, glm, model.args = list(family = gaussian), p.acc = 0.1)
# and also to:
a3(rating ~ ., attitude, lm, p.acc = 0.1)


require(randomForest)
data(housing)
x <- a3(MED.VALUE ~ NOX + PUPIL.TEACHER + ROOMS + AGE + HIGHWAY + 0,
        housing, randomForest, p.acc = NULL, n.folds = 2)
plotSlopes(x)
