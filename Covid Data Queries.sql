select *
From PortfolioProject..CovidDeaths
Where continent is not null
order by 3,4

--select*
--From CovidVaccinations
--order by 3,4
--select data that we are going to be using*

Select Location, date,new_cases,total_deaths, population
From CovidDeaths
Where continent is not null
order by 1,2




-- Chance of dying if contracting covid in the united states?

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location like '%states%' and continent is not null
order by 1,2


-- 
-- What percentage of population got Covid?

Select Location, date, total_cases, population, (total_cases/population)*100 as PercentofPopulationInfected
From CovidDeaths
Where continent is not null
order by 1,2
-- Looking at countries with highest infection rate compared to population?

Select Location, Population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as    
   PercentofPopulationInfected
   From CovidDeaths
 Where continent is not null
   Group by location,population
   Order by PercentofPopulationInfected desc


-- What are countries with Highest Death count per population?

Select Location, Max(cast(Total_deaths as int)) as TotalDeathCount
   From PortfolioProject..CovidDeaths
Where continent is not null
   Group by location
   Order by TotalDeathCount desc

 -- 
 -- What Continentss have the highest death count per population?
 Select continent, Max(cast(Total_deaths as int)) as TotalDeathCount
   From PortfolioProject..CovidDeaths
Where continent is not null
   Group by location
   Order by TotalDeathCount desc

   -- Global Numbers

   Select  date, Sum(new_cases) as total_Global_cases, Sum(cast(new_deaths as int))  as total_Global_deaths, Sum(cast(New_deaths as Int))/Sum(new_cases)*100 as Total_death_Percentage--, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
Group by date
order by 1,2


---Vaccinations of total population vs population?

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, Sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) 
as Running_Vaccination_totals
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3

-- USE CTE (number of columns in CTE need to be the same as the number of colums in the parinthesis, also do not incldude order by in the parathises) 

With popvsvac (continent, location, date, population, new_vaccinations, Running_Vaccination_totals)
as 
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, Sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as Running_Vaccination_totals
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 
)
select *, (Running_Vaccination_totals/population)*100
From popvsvac

-- Temp Table
Drop Table if exists #Percentpopulationvaccinated
Create Table #Percentpopulationvaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
Running_Vaccination_totals numeric
)

-- What is the percentage of the population Vaccinated?
insert into #Percentpopulationvaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, Sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as Running_Vaccination_totals
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 

select *, (Running_Vaccination_totals/population)*100
From #Percentpopulationvaccinated

-- create a view to store data for later visualizations

Create view Percentpopulationvaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, Sum(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
dea.date) as Running_Vaccination_totals
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null 


Select*
from Percentpopulationvaccinated