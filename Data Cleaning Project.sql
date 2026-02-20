-- Data Cleaning 

select * 
from layoffs;
 
-- 1. Remove Duplicates
-- 2. Standardize The Data
-- 3. Null Values Or Blank Values
-- 4. Remove Any Columns Or rows 

Create Table layoffs_staging 
Like layoffs;   

select * 
from layoffs_staging;
Insert layoffs_staging
select*
from layoffs;

Select *,
Row_Number() Over(
Partition By company, location, industry, total_laid_off, percentage_laid_off,`date`, stage, country, funds_raised_millions) As row_num
From layoffs_staging;

With duplicate_cte AS
(
Select *,
Row_Number() Over(
Partition By company, location, industry, total_laid_off, percentage_laid_off,`date`, stage, country, funds_raised_millions) As row_num
From layoffs_staging
)
select *
from duplicate_cte
Where row_num > 1;





CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * 
from layoffs_staging2;

Insert Into layoffs_staging2
Select *,
Row_Number() Over(
Partition By company, location, industry, total_laid_off, percentage_laid_off,`date`, stage, country, funds_raised_millions) As row_num
From layoffs_staging;

select * 
from layoffs_staging2;



-- standardizing data 

select company , trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select distinct country, trim(trailing '.' from country)
from layoffs_staging2 
order by 1;

select *
from layoffs_staging2 
where industry = 'crypto';



Update	layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%'
; 

Update	layoffs_staging2
set company = trim(trailing '.' from country)
where company like 'united states%';

-- the date is text changet to real date 

select `date`
from layoffs_staging2;


update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER Table layoffs_staging2
Modify `date` date;



select * 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null ;


delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null ;




select *
from layoffs_staging2
where industry is null
or industry = '';


select *
from layoffs_staging2
;


update layoffs_staging2
set industry = Null
Where industry = '';



select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2 
	on t1.company = t2.company 
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null ;


	
update layoffs_staging2 t1
join layoffs_staging2 t2 
    on t1.company = t2.company
    and t1.location = t2.location
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;




ALTER Table layoffs_staging2
drop column row_num;
	
    










