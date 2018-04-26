---
title: "Homework- Simple Analysis on Forest Fire Dataset"
author: "Alison Jing Huang"
date: "4/21/2018"
output:
  html_document: default
  pdf_document: default
  word_document: default
---


### Asset List Requirement:

Document for yourself a list of assets (ASSETS.md) that specifies all assets that are needed. This should include

  * inputs: data and code (not documented elsewhere, you do not need to document intermediate code and data that fall into the ProjectTemplate or drake process flow, since we know how that works!)
  * outputs: plots, files, documents, produced by the analysis

The list of assets should not be onerous. It should contain a name, path to where the assets can be found, and a short description. This purpose of the assetlist two-fold:

1. It focuses you on what you need to produce. This is not necessarily always clear when you start and almost never clear for large projects that blend data from many different sources).

2. It documents (for future-you) where things are coming from you are producing and what is important.<br/><br/>


##### Continously updating below contents:

### Inputs: 
**Path** is saved in  **data/forestfires.csv**. It's downloaded from http://archive.ics.uci.edu/ml/datasets/Forest+Fires

### Outputs:
Most of the documents are saved in **ForestFire/reports**. It contains the following reports(in markdown format):

1. **FPS-Predicting Burn Areas of Forest Fires.Rmd**: This is the formal problem statement of this project. It details the background, and project timeline of studying the forest fires dataset of Northern Portugal.

2. **InitialAnalysis.RMD**:  It provides the initial analysis of the dataset including a closer look of each variables and identify them by either as Categorical or Continuous. 

    - provides a summary of the dataset, and some initial plot.
    
    - normalizes the dataset by transforming Month and Day columnsinto numerical data types. 
    
    - concludes the relevant variables associates with response variable - burned **area** using KMO Test of       Exploratory Factor Analysis.

3. **InitialAnalysis_Updated.Rmd**:  This is an update/continuation of **InitialAnalysis.Rmd** markdown document.It completes the Exploratory Factor Analysis with correlation calculation in *tabular* form.

    - includes a Scree Test plot using `nFactors` R package determining # of factors to extract. The result gives 3.
    
    - Eigenvalues and explained Variance plot
    
    - 3 Factor Loading plot to group variables. Based on this plot, I can associate DC, DMC, and wind on **Factor 1**
    X and Y on **Factor 2** and FFMC and ISI on **Factor 3**.
    
    - Generate a reduced Correlation Matrix (heatmap) to visualize the strong loading and on which factors each variable loads.
    
4. **model-performance-linear.Rmd**: This illustrates the linear model between the resposible variable- *area* in response to other factors. 

    - Histogram of the ratio of area to frequency
    
    - Histrogram of log(area+1) (to test original research paper's idea of using ln(y+1))
    
    - boxplot of forest fire area for different X's
    
    - boxplot of forest fire area for different Y's
    - boxplot of forest fire area for different months
    
    - boxplot of forest fire area for different seasons (first convert months to seasons then plot)
    
    - linear gression model
    
5. **model-performance-svm.Rmd**: This illustrates the support vector machines model for forest fire prediction

6. **model-performance-decisiontrees.Rmd** : evaluation of decision tree model







