# 🎮 Analysing Customer Loyalty, Segmentation, and Sentiment for a Games Retailer
Exploratory and predictive data analysis project using Python (pandas, NumPy, scikit-learn, NLTK, TextBlob, Matplotlib, Seaborn) and R to identify the factors that drive customer loyalty, segment customers for targeted marketing, evaluate customer sentiment through natural language processing, and assess whether loyalty point accumulation can be predicted accurately.

---

## 📌 Executive Summary
This project analyses customer data from Turtle Games to identify the factors that drive customer loyalty, develop meaningful customer segments, evaluate customer sentiment through natural language processing, and assess whether loyalty point accumulation can be predicted accurately. The analysis found that remuneration and spending score were the strongest predictors of loyalty points, that five customer segments existed, with three having significant commercial importance, and that customer sentiment was generally neutral to positive. Based on these findings, the project recommends targeting high-earning, low-spending customers through tailored campaigns, enhancing the existing loyalty programme with spend-based rewards, and expanding customer data collection to improve future predictive modelling.

---

## 📁 Project Files
- `turtle_reviews.csv` — Original dataset
- `reviews_nec_col.csv` — Cleaned dataset used for exploratory data analysis in Python and R
- `Python Script.ipynb` — Data cleaning, exploratory analysis, predictive modelling, clustering, NLP, and visualisations
- `R Script.R` — Exploratory data analysis and multiple linear regression validation in R
- `Technical Report and Insights.pdf` — Business problem, methodology, insights, recommendations, and appendices

---

## ❓ Business Problem / Opportunity
Turtle Games is a global manufacturer and retailer of books, board games, video games, and toys. The organisation wants to better understand what drives customer loyalty, how customers can be segmented for more effective targeted marketing, whether customer reviews provide meaningful business insights, and whether customer loyalty point values can be predicted accurately. This project addresses these questions through a combination of exploratory data analysis, predictive modelling, customer segmentation, and natural language processing.

---

## 🔬 Methodology
- Imported and inspected customer review data using pandas and NumPy
- Removed unnecessary variables and prepared data for analysis in both Python and R
- Conducted exploratory data analysis using descriptive statistics, histograms, boxplots, scatterplots, and correlation analysis
- Applied linear regression and decision tree modelling to identify drivers of loyalty point accumulation
- Performed K-means clustering to identify naturally occurring customer segments using elbow and silhouette methods
- Conducted natural language processing using NLTK, TextBlob, and WordCloud for text cleaning, tokenisation, frequency analysis, and sentiment analysis
- Validated predictive capability using multiple linear regression in R
- Documented findings using Markdown and cross-validated key analyses between Python and R to improve reproducibility

---

## 🛠️ Tools and Skills Used
- Python: pandas, NumPy, scikit-learn, NLTK, TextBlob, WordCloud, Matplotlib, Seaborn
- R: tidyverse, dplyr, ggplot2, moments
- Jupyter Notebook: Data preparation, modelling, clustering, NLP, and visualisation
- Predictive Modelling: Linear regression, multiple linear regression, decision trees, and K-means clustering
- Natural Language Processing: Tokenisation, sentiment analysis, frequency analysis, and word clouds

---

## 📊 Insights

### Loyalty Point Drivers

Linear regression and decision tree analyses identified remuneration and spending score as the strongest predictors of loyalty point accumulation. Decision tree modelling indicated that these variables accounted for approximately 98% of model decision-making, whilst demographic characteristics contributed relatively little predictive value.

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/71973ef0-61fd-4a70-82dd-eab32835d253" />

Remuneration and spending score demonstrate substantially stronger relationships with loyalty point accumulation than demographic characteristics, suggesting that loyalty is driven more by customer value than customer profile.

---

### Customer Segmentation

Five customer segments were identified through K-means clustering. Three were considered commercially significant:

- Moderate earners and moderate spenders (largest segment)
- High earners and high spenders (highest-value segment)
- High earners and low spenders (greatest growth opportunity)

The latter segment represents customers with significant spending potential who may benefit from targeted interventions.

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/7a95ad69-b14a-43ed-a39d-834c02c33eab" />

---

### Customer Sentiment

Natural language processing identified generally neutral to positive customer sentiment. Reviews frequently referenced enjoyment, gameplay, and positive product experiences. Word frequency and sentiment analyses suggested that customers are largely satisfied with Turtle Games’s products and services.

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/9006ecb8-c95a-4462-bf6f-15499d5c53ba" />

---

### Loyalty Point Prediction

A multiple linear regression model using remuneration and spending score explained approximately 83% of variation in loyalty point values, demonstrating that customer loyalty behaviour can be predicted with a relatively high degree of accuracy. This suggests that future customer spending behaviour and loyalty programme engagement can be forecast with a relatively high degree of confidence.

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/8a367e60-c561-46cd-b446-e06d0c172728" />

---

## 🎯 Recommendations

Target high-earning, low-spending customers through tailored marketing campaigns and loyalty incentives to encourage greater spending.

Review and enhance the existing loyalty programme by introducing spend-based rewards aligned with observed customer behaviour.

Continue using customer reviews to support marketing and product development activities, whilst supplementing automated sentiment analysis with periodic manual review.

Expand customer data collection to improve future predictive modelling and explain variation in loyalty point accumulation not captured by existing variables.

Explore alternative predictive models and more advanced natural language processing techniques to improve sentiment classification and customer insight generation.
