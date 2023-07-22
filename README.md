# Google Data Analytics Capstone Project
## Cyclistic-bike-share-analysis
---

## Background
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

---

## 1. Ask

***Business Question:***

How do annual members and casual riders use Cyclistic bikes differently?

***Key Stakeholders:***

* Lily Moreno
* Cyclistic marketing analytics team
* Cyclistic executive team

***Business Task:***

Use the data to explore and gain insights on how annual members and casual riders use bikes differently. From trends and insights, assist the team to implement marketing strategies aimed at converting casual riders into annual members.

---

## 2. Prepare

The data include information about Cyclistic's historical trip and customers' patterns in bike usage. It is obtained between quarter 2(2019),quarter 3(2019),quarter 4(2019) and quarter 1 2020 (12 months).

---

## 3. Process

Due to large amount of data and flexbility of R language, I will process the data with R Studio and Excel to work with the data more efficiently. This will be applied to data cleaning, analysis, and visualization.

### Data Preparation

* Libraries: tidyverse, lubridate, ggplot2
* Data are stored in CSV format and imported separately by months
* Checked data columns for name consistencies
* 4 quarters of data are merged into a single dataframe

### Date Cleaning

* Created additional columns (date, month, day, year, and day of week) for data analysis
* Removed bad data
* Converted the ride length column into numeric
* Removed and filtered the data so that it does not include values with negative or zero ride lengths

---

## 4. Analyze

The analyze phase will explore the question "How do annual members and casual riders use Cyclistic bikes differently?" by performing descriptive statistical analysis and aggregating the data with group by to extract trends from bike users.

### Descriptive analysis

* Calculated the mean, median, min, and max on ride length column
* For each member types, I explored the average, min, and max ride length

## 5. Share
After analyzing the data, I visualize the data with pie chart and bar graphs to discern the differences in bike patterns visually between member and casual riders. Data visualization is a powerful tool to draw insights quickly



* *Overall, there are more casual riders than annual member (81% vs. 19%).*



## 6. Act

### Conclusion
After analyzing and visualizing the data, some major findings that I found were larger percentage of casual riders than annual member,  popularity in bike usage during summer and fall, and higher average ride duration for casual riders.

### Recommendations

* Due to high popularity in bike usage throughout the summer and early fall, it would be a good idea to launch a **incentive campaign** to maintain or increase bike usage
* Casual riders spend more time in riding bike, therefore providing some kind of **discounts or promotions** for electric bike would help them save some time
* Launch **marketing campaign** that target the benefits of converting into annual membership for casual riders through advertisements, emails, and brochures








