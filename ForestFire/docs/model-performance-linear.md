---
title: "Linear Model on Firest Fires Analysis"
author: "Alison Jing Huang"
date: "4/21/2018"
output:
  pdf_document: default
  html_document: default
  word_document: default
---

After we conducted initial analysis on the dataset, the next step is to create a linear model on the first fires data. 

Recall earlier we have transform the raw datset to all numerical variables, and renamed it as `fires`.

```{r load_packages, warning=FALSE, message=FALSE, echo=FALSE}
attach(fires)
hist(area, 40)

```