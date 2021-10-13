

-- Cleaning Data in SQL Queries
*/

select*
From PortfolioProject.dbo.nasvhouz



-- Standardizing Date Structure

Select SaleDateConverted, Convert(Date,SaleDate)
From PortfolioProject.dbo.nasvhouz

Update nasvhouz
set SaleDate = CONVERT(Date,SaleDate)

Alter Table nasvhouz
add SaleDateConverted Date;

update nasvhouz
set SaleDateConverted = Convert(Date,SaleDate)

-- Populate Property Address Data

Select *
From PortfolioProject.dbo.nasvhouz
-- Where PropertyAddress is null
order by ParcelID

Select *
From PortfolioProject.dbo.nasvhouz a
Join PortfolioProject.dbo.nasvhouz b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.nasvhouz a
Join PortfolioProject.dbo.nasvhouz b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.nasvhouz a
Join PortfolioProject.dbo.nasvhouz b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


-- Tidying up Address Column
Select PropertyAddress
From PortfolioProject.dbo.nasvhouz

Select 
SUBSTRING(PropertyAddress, 1, Charindex(',', PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, Charindex(',', PropertyAddress) + 1, Len(PropertyAddress)) as City

From PortfolioProject.dbo.nasvhouz

Alter Table nasvhouz
add PropertySplitAddress Nvarchar(255);

update nasvhouz
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, Charindex(',', PropertyAddress) -1)

Alter Table nasvhouz
add PropertySplitCity Nvarchar(255);

update nasvhouz
set PropertySplitCity = SUBSTRING(PropertyAddress, Charindex(',', PropertyAddress) + 1, Len(PropertyAddress))


Select*
From PortfolioProject.dbo.nasvhouz


Select owneraddress
From PortfolioProject.dbo.nasvhouz

Select
PARSENAME(Replace(Owneraddress, ',', '.'), 3) as Address,
PARSENAME(Replace(Owneraddress, ',', '.'), 2) as City,
PARSENAME(Replace(Owneraddress, ',', '.'), 1) as State
From PortfolioProject.dbo.nasvhouz

Alter Table nasvhouz
add OwnerSplitaddress Nvarchar(255);

update nasvhouz
set OwnerSplitAddress = PARSENAME(Replace(Owneraddress, ',', '.'), 3) 

Alter Table nasvhouz
add OwnerSplitCity Nvarchar(255);

update nasvhouz
set OwnerSplitCity = PARSENAME(Replace(Owneraddress, ',', '.'), 2) 

Alter Table nasvhouz
add OwnerSplitState Nvarchar(255);

update nasvhouz
set OwnerSplitState = PARSENAME(Replace(Owneraddress, ',', '.'), 1) 

-- Creating 'Sold as Vacant' data input consistency  

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject.dbo.nasvhouz
Group by SoldAsVacant 
Order by 2

Select SoldAsVacant
, Case When SoldAsVacant = 'Y' Then 'Yes'
	When SoldasVacant = 'N' then 'No'
	Else SoldAsVacant
	End
From PortfolioProject.dbo.nasvhouz

Update nasvhouz
Set SoldAsVacant = Case When SoldAsVacant = 'Y' Then 'Yes'
	When SoldasVacant = 'N' then 'No'
	Else SoldAsVacant
	End


	-- Removal of Duplicates
	With RowNumCTE As(
select*,
	ROW_Number() Over(
	Partition by parcelid, 
				 Propertyaddress,
				 SaleDate,
				 LegalReference
				 Order by 
					uniqueID
					) Row_num

From PortfolioProject.dbo.nasvhouz
--order by: ParcelID
)

Select*
From RownumCTE

Where Row_num > 1 
Order by PropertyAddress


----- Removal of unused Columns.

Alter Table PortfolioProject.dbo.nasvhouz
Drop Column ownerAddress, TaxDistrict, Propertyaddress, 

Select* 
From PortfolioProject.dbo.nasvhouz

Alter Table PortfolioProject.dbo.nasvhouz
Drop Column saledate