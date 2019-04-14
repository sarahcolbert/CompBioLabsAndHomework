
# Relationships between Breed, Temperament, and Guide Dog Success

## Introduction

My final project will aim to demonstrate computational methods learned in the course through analysis of public data available in the Dryad Digital Repository. The specific data set I have chosen to analyze, ["Effects of Maternal Investment, Temperament, and Cognition on Guide Dog Success"](chrome-extension://oemmndcbldboiebfnladdacbdfmadadm/https://pdfs.semanticscholar.org/68db/9acf2604a9ed1b8d770fe24508c88970ea07.pdf), allows for an interesting interpretation of animal behavior while also allowing me to do more research on a topic I am passionate about. From the years 2013-2016 I volunteered with a group called Guide Dogs for the Blind as a puppy raiser, which means I was responsible for raising guide dog puppies from the age of 2 months to ~16 months before they entered formal training. Of the three puppies I raised, one was accepted to the program as a successful breeder, the second was dropped and now lives life as a happy pet and the final dog was deemed unfit to guide but transferred to another program where he was successfully trained as a service dog for a veteran with PTSD. 

Through this project I hope to gain a better insight as to what kinds of behaviors increase/decrease the chance of success as a guide dog as well as if those behaviors show any relationship to other factors, particularly breed. The kinds of information that I can obtain from this analysis can hopefully offer me insight as a former puppy raiser as to what kinds of traits may have impacted the success of my puppies. My driving question for this project is: Do different breeds of guide dog program puppies affect behavior and ultimate success as a guide dog? 




<hr>

## Data Summary

### Study Goals
The goal of this study was to determine what, if any, factors can predict success as a guide dog. The study aimed to address the assertion that early life experiences, intelligence and behavior can be attributed to one's outcome of success, not just for dogs, but also other species like humans (Bray, Sammel, Cheney, Serpell & Seyfarth, 2017). Using guide dog program puppies as a "model" of sorts, the researchers wanted to determine the effects of maternal investment, specifically nursing behavior, and temperament on success. 

### Methodology
The researchers followed a group of guide dog program puppies from the nursing stage (~2 weeks) all the way up until they returned to the program for more formal guide dog training. To obtain the data on temperament and cognition, the researchers created eleven tasks for each dog to complete  and then measured several variables relating to the task. For example, one task involved isolating the dog in an empty room for two minutes. Variables included percentage of time spent near room exit, number of times the dog moved between quadrants in the room, percentage of time spent mobile and percentage of time spent vocalizing (Bray et al., 2017). Information on other tests and the variables associated with them can be found in table S2 of the paper's [supplemental information](chrome-extension://oemmndcbldboiebfnladdacbdfmadadm/https://www.pnas.org/content/pnas/suppl/2017/08/02/1704303114.DCSupplemental/pnas.201704303SI.pdf?targetid=nameddest%3DSTXT). 

### A Look at the Data Set
#### Format
 - Microsoft Excel spreadsheet
 - 5 spreadsheets total
 - 3 sheets of data
 - 2 sheets of data descriptions
#### Content
 - Puppy characteristics: failure or success, litter, sex, birth season, litter size, breed, test age
 - Z-scores for variable performance
 - Principal component scores for tasks derived from Z scores
 - Descriptions of variables and tasks
 
#### Size
- 108 KB
- 134 Rows (133 puppies)
- Number of columns varies for data sheet

#### Possible Problems
One concern with this data set is that one of the sheets of data does not come with a data description and from the supplement information meanings cannot be determined. However, I still have enough data with descriptions so I do not predict it to be a major problem. 

#### Biological Significance
The data I am analyzing will provide interesting information into how dog breed effects behavior differently. These conclusions can be used to do further research into what specifically about these breeds leads to the differences. Is it something about the genetics? Physiology? Maternal care? Not only is it important to look at effect of breed but also how certain behaviors associated with intelligence impact a dog's success. As mentioned earlier, the researchers believe this research can offer a broader representation of how an individual's intelligence impacts their possibility of success. 




<hr>

## Analysis

The first analysis I will perform will be a one way ANOVA test to determine if there is a statistical difference in the mean rate of success for each of the three dog breeds. From this data I will also create figures using ggplot which display the means of each breed's rate of success. A challenge with using the ANOVA test is that if it finds a group(s) to be statistically different it will not tell me which ones so I will then also have to use a least significant difference test. 

In the study the collected data is from they found tendency to vocalize when introduced to a novel object, ability to perform multi step problem solving and reaction to an umbrella opening to show correlation to a dog's success as a guide dog. These tests were performed across the board for all breeds so in my analysis I would like to break it up by breed to look at how the breeds' scores differ. From this information I will also create graphics using ggplot. 

I predict that a challenge will be finding packages/creating a function to perform the ANOVA test since it is not something I have done in R before. Another challenge will simply be organizing the data I have into a usable form because right now there is some missing data, some of it is spread across different sheets, and it will require a lot of subsetting.  





<hr>

## References 


Bray EE, Sammel MD, Cheney DL, Serpell JA, Seyfarth RM (2017) Effects of maternal investment, temperament, and cognition on guide dog success. Proceedings of the National Academy of Sciences of the United States of America 114(34): 9128-9133. [https://doi.org/10.1073/pnas.1704303114](https://doi.org/10.1073/pnas.1704303114)

Bray EE, Sammel MD, Cheney DL, Serpell JA, Seyfarth RM (2017) Data from: Effects of maternal investment, temperament, and cognition on guide dog success. Dryad Digital Repository. [https://doi.org/10.5061/dryad.50fj0](https://doi.org/10.5061/dryad.50fj0)
