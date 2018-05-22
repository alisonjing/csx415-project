library('ProjectTemplate')
load.project()

library(tidyverse)
library(magrittr)

## read data
source('./src/0.read_data.R')

# Display the first six rows of the data
head(df)
summary(df)

# Convert month and day to numeric data type
df <- df %>%
  mutate(X = as.factor(X), Y=as.factor(Y), month=as.numeric(month), day=as.numeric(day), 
         FFMC=as.factor(FFMC), DMC=as.factor(DMC), DMC=as.factor(DMC), DC=as.factor(DC), ISI=as.factor(ISI),
         temp=as.factor(temp), RH=as.factor(RH), wind=as.factor(wind), rain=as.factor(rain)
         )

head(df)

## Relationship between X and burned area
p1 <- ggplot(data=df) + 
  geom_bar(aes(x = X, y = area),stat = 'identity') + 
  labs(x="X", y="Burn Area") + ggtitle('Relationship between X and AREA') + 
  theme_bw() 
plot(p1)

## Relationship betweeen Y and burned area
p2 <- ggplot(data=df) + 
  geom_bar(aes(x= Y, y = area), stat = 'identity') + 
  labs(x="Y", y="Burned Area") + 
  ggtitle('Relationship between Y and AREA') + theme_bw()
plot(p2)

## Relationship between MONTH and burned area
p3 <- ggplot(data=df) + 
  geom_col(mapping=aes(x=month, y=area)) + 
  labs(x="month", y="Burned Area") + 
  ggtitle('Relationship between Month and AREA ')
plot(p3)

## Relationship between DAY and burned area
p4 <- ggplot(data=df) + 
  geom_col(mapping=aes(x=day, y=area)) + 
  labs(x="day", y="Burned Area") + 
  ggtitle('Relationship between Day and AREA ')
plot(p4)

## Relationship between FFMC and burned area
p5 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=FFMC, y=area)) +
  labs(x="FFMC", y="Burned Area") + 
  ggtitle('Relationship between FFMC and Area')
plot(p5)

## Relationship between DMC and burned area
p6 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=DMC, y=area)) +
  labs(x="DMC", y="Burned Area") + 
  ggtitle('Relationship between DMC and Area')
plot(p6)

## Relationship between DC and burned AREA
p7 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=DC, y=area)) +
  labs(x="DC", y="Burned Area") + 
  ggtitle('Relationship between DC and Area')
plot(p7)

## Relationship between ISI and burned AREA
p8 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=ISI, y=area)) +
  labs(x="ISI", y="Burned Area") + 
  ggtitle('Relationship between ISI and Area')
plot(p8)

## Relationship between TEMPERATURE and burned AREA
p9 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=ISI, y=area)) +
  labs(x="Temperature", y="Burned Area") +
  ggtitle('Relationship between temperature and Area')
plot(p9)

df %>% 
  ggplot(aes(x=temp, y=DC, size=area, col=month))+ 
  geom_point()+ ylab('Drought Code')+ ggtitle('Temperature vs. Drought Code by Month and Area') 

## Relationship between Relative Humidity(RH) and burned AREA
p10 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=RH, y=area)) +
  labs(x="Relative Humidity", y="Burned Area") +
  ggtitle('Relationship between Relative Humidity(RH) and Area') + ylim(0, 2500)
plot(p10)

## Relationship between WIND and burned AREA
p11 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=wind, y=area)) +
  labs(x="Wind", y="Burned Area") +
  ggtitle('Relationship between Wind and Area') + ylim(0, 2000)
plot(p11)

## Relationship between RAIN and burned AREA
p12 <- ggplot(data=df) + 
  geom_col(mapping = aes(x=rain, y=area)) +
  labs(x="Rain", y="Burned Area") +
  ggtitle('Relationship between Rain and Area') + ylim(0, 2500)
plot(p12)

plot_p <- grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, ncol= 3)


# Relationship between RH, WIND, and burned AREA
df %>% 
  ggplot(aes(x=RH, y=area, col=wind))+ 
  geom_line()+ xlab('Relative Humidity')+ 
  ylab('burned area')+ ggtitle('Relative Humidity vs. Burn Area') 

# Relationship between FFMC, DMC, and burned AREA
df %>% 
  ggplot(aes(x=FFMC, y=area, col=DMC))+ 
  geom_line()+ xlab('FFMC ')+ 
  ylab('Burned Area')+ ggtitle('FFMC vs. Burn Area') 



