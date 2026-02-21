-- Exploratory Data Analysis 

Select *
From layoffs_staging2;

Select MAX(total_laid_off), MAX(percentage_laid_off)
From layoffs_staging2;

Select *
From layoffs_staging2
Where percentage_laid_off = 1
order by funds_raised_millions Desc;


Select Company, Sum(total_laid_off)
From layoffs_staging2
GROUP BY Company
Order By 2 Desc;


Select MIN(`date`), MAX(`date`)
From layoffs_staging2;


Select Industry, Sum(total_laid_off)
From layoffs_staging2
GROUP BY Industry
Order By 2 Desc;


Select Country, Sum(total_laid_off)
From layoffs_staging2
GROUP BY Country
Order By 2 Desc;

Select Year(`date`), Sum(total_laid_off)
From layoffs_staging2
GROUP BY Year(`date`)
Order By 1 Desc;


Select Stage, Sum(total_laid_off)
From layoffs_staging2
GROUP BY Stage
Order By 1 Desc;



With Rolling_Total AS
(
Select Substring(`date`,1,7) As `Month` , Sum(total_laid_off) As total_off
From layoffs_staging2
Where Substring(`date`,1,7) Is Not Null 
Group By Month
Order By 1 ASC
)	
Select `Month`, total_off
, Sum(total_off) Over(Order By `Month`) As Rolling_Total
From Rolling_Total
;


With Company_Year (company, Years, total_laid_off) As(
Select Company, Year(`date`), SUM(total_laid_off)
From layoffs_staging2 
Group By Company, Year(`date`)
), company_year_rank As 
(Select *, dense_rank() Over (Partition By Years Order By Total_laid_off DESC) As Ranking 
From Company_Year
Where Years Is Not Null 
Order By Ranking ASC 
)
Select *
From company_year_rank
Where Ranking <= 5
;

 

