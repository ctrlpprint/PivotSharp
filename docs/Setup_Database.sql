GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/09/2024 11:17:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Country_Code] [nvarchar](3) NULL,
	[Country_Name] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Sub_Region] [nvarchar](255) NULL,
	[Intermediate_Region] [nvarchar](255) NULL,
	[Income_Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Happiness]    Script Date: 3/09/2024 11:17:43 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Happiness](
	[Country Code] [nvarchar](255) NULL,
	[Year] [int] NULL,
	[Happiness_Index] [decimal](38, 10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Population]    Script Date: 3/09/2024 11:17:43 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Population](
	[Country Code] [nvarchar](255) NULL,
	[Year] [int] NULL,
	[Population] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[World_Data]    Script Date: 3/09/2024 11:17:43 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[World_Data]
as

select		c.[Country_Code],
			c.[Country_Name],
			c.[Region],
			c.[Sub_Region],
			c.[Intermediate_Region],
			c.[Income_Group],
			coalesce(p.[Year], h.[Year]) [Year],
			p.[Population],
			h.[Happiness_Index]
from		[Countries] c
left join	[Population] p
	on		c.[Country_Code] = p.[Country Code]
left join	[Happiness] h
	on		c.Country_Code = h.[Country Code]
	and		p.[Year] = h.[Year]


GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AFG', N'Afghanistan', N'Asia', N'Southern Asia', NULL, N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ALA', N'Åland Islands', N'Europe', N'Northern Europe', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ALB', N'Albania', N'Europe', N'Southern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DZA', N'Algeria', N'Africa', N'Northern Africa', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ASM', N'American Samoa', N'Oceania', N'Polynesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AND', N'Andorra', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AGO', N'Angola', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AIA', N'Anguilla', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ATA', N'Antarctica', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ATG', N'Antigua and Barbuda', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ARG', N'Argentina', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ARM', N'Armenia', N'Asia', N'Western Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ABW', N'Aruba', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AUS', N'Australia', N'Oceania', N'Australia and New Zealand', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AUT', N'Austria', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'AZE', N'Azerbaijan', N'Asia', N'Western Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BHS', N'Bahamas', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BHR', N'Bahrain', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BGD', N'Bangladesh', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BRB', N'Barbados', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BLR', N'Belarus', N'Europe', N'Eastern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BEL', N'Belgium', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BLZ', N'Belize', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BEN', N'Benin', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BMU', N'Bermuda', N'Americas', N'Northern America', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BTN', N'Bhutan', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BOL', N'Bolivia, Plurinational State of', N'Americas', N'Latin America and the Caribbean', N'South America', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BES', N'Bonaire, Sint Eustatius and Saba', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BIH', N'Bosnia and Herzegovina', N'Europe', N'Southern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BWA', N'Botswana', N'Africa', N'Sub-Saharan Africa', N'Southern Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BVT', N'Bouvet Island', N'Americas', N'Latin America and the Caribbean', N'South America', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BRA', N'Brazil', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IOT', N'British Indian Ocean Territory', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BRN', N'Brunei Darussalam', N'Asia', N'South-eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BGR', N'Bulgaria', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BFA', N'Burkina Faso', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BDI', N'Burundi', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CPV', N'Cabo Verde', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KHM', N'Cambodia', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CMR', N'Cameroon', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CAN', N'Canada', N'Americas', N'Northern America', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CYM', N'Cayman Islands', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CAF', N'Central African Republic', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TCD', N'Chad', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CHL', N'Chile', N'Americas', N'Latin America and the Caribbean', N'South America', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CHN', N'China', N'Asia', N'Eastern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CXR', N'Christmas Island', N'Oceania', N'Australia and New Zealand', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CCK', N'Cocos (Keeling) Islands', N'Oceania', N'Australia and New Zealand', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'COL', N'Colombia', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'COM', N'Comoros', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'COG', N'Congo', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'COD', N'Congo, Democratic Republic of the', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'COK', N'Cook Islands', N'Oceania', N'Polynesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CRI', N'Costa Rica', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CIV', N'Côte d''Ivoire', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HRV', N'Croatia', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CUB', N'Cuba', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CUW', N'CuraÃ§ao', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CYP', N'Cyprus', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CZE', N'Czechia', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DNK', N'Denmark', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DJI', N'Djibouti', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DMA', N'Dominica', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DOM', N'Dominican Republic', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ECU', N'Ecuador', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'EGY', N'Egypt', N'Africa', N'Northern Africa', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SLV', N'El Salvador', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GNQ', N'Equatorial Guinea', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ERI', N'Eritrea', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'EST', N'Estonia', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SWZ', N'Eswatini', N'Africa', N'Sub-Saharan Africa', N'Southern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ETH', N'Ethiopia', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FLK', N'Falkland Islands (Malvinas)', N'Americas', N'Latin America and the Caribbean', N'South America', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FRO', N'Faroe Islands', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FJI', N'Fiji', N'Oceania', N'Melanesia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FIN', N'Finland', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FRA', N'France', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GUF', N'French Guiana', N'Americas', N'Latin America and the Caribbean', N'South America', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PYF', N'French Polynesia', N'Oceania', N'Polynesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ATF', N'French Southern Territories', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GAB', N'Gabon', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GMB', N'Gambia', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GEO', N'Georgia', N'Asia', N'Western Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'DEU', N'Germany', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GHA', N'Ghana', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GIB', N'Gibraltar', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GRC', N'Greece', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GRL', N'Greenland', N'Americas', N'Northern America', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GRD', N'Grenada', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GLP', N'Guadeloupe', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GUM', N'Guam', N'Oceania', N'Micronesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GTM', N'Guatemala', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GGY', N'Guernsey', N'Europe', N'Northern Europe', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GIN', N'Guinea', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GNB', N'Guinea-Bissau', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GUY', N'Guyana', N'Americas', N'Latin America and the Caribbean', N'South America', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HTI', N'Haiti', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HMD', N'Heard Island and McDonald Islands', N'Oceania', N'Australia and New Zealand', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VAT', N'Holy See', N'Europe', N'Southern Europe', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HND', N'Honduras', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HKG', N'Hong Kong', N'Asia', N'Eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'HUN', N'Hungary', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ISL', N'Iceland', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IND', N'India', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IDN', N'Indonesia', N'Asia', N'South-eastern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IRN', N'Iran, Islamic Republic of', N'Asia', N'Southern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IRQ', N'Iraq', N'Asia', N'Western Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IRL', N'Ireland', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'IMN', N'Isle of Man', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ISR', N'Israel', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ITA', N'Italy', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'JAM', N'Jamaica', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'JPN', N'Japan', N'Asia', N'Eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'JEY', N'Jersey', N'Europe', N'Northern Europe', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'JOR', N'Jordan', N'Asia', N'Western Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KAZ', N'Kazakhstan', N'Asia', N'Central Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KEN', N'Kenya', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KIR', N'Kiribati', N'Oceania', N'Micronesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PRK', N'Korea, Democratic People''s Republic of', N'Asia', N'Eastern Asia', NULL, N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KOR', N'Korea, Republic of', N'Asia', N'Eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KWT', N'Kuwait', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KGZ', N'Kyrgyzstan', N'Asia', N'Central Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LAO', N'Lao People''s Democratic Republic', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LVA', N'Latvia', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LBN', N'Lebanon', N'Asia', N'Western Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LSO', N'Lesotho', N'Africa', N'Sub-Saharan Africa', N'Southern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LBR', N'Liberia', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LBY', N'Libya', N'Africa', N'Northern Africa', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LIE', N'Liechtenstein', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LTU', N'Lithuania', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LUX', N'Luxembourg', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MAC', N'Macao', N'Asia', N'Eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MDG', N'Madagascar', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MWI', N'Malawi', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MYS', N'Malaysia', N'Asia', N'South-eastern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MDV', N'Maldives', N'Asia', N'Southern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MLI', N'Mali', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MLT', N'Malta', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MHL', N'Marshall Islands', N'Oceania', N'Micronesia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MTQ', N'Martinique', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MRT', N'Mauritania', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MUS', N'Mauritius', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MYT', N'Mayotte', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MEX', N'Mexico', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'FSM', N'Micronesia, Federated States of', N'Oceania', N'Micronesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MDA', N'Moldova, Republic of', N'Europe', N'Eastern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MCO', N'Monaco', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MNG', N'Mongolia', N'Asia', N'Eastern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MNE', N'Montenegro', N'Europe', N'Southern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MSR', N'Montserrat', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MAR', N'Morocco', N'Africa', N'Northern Africa', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MOZ', N'Mozambique', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MMR', N'Myanmar', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NAM', N'Namibia', N'Africa', N'Sub-Saharan Africa', N'Southern Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NRU', N'Nauru', N'Oceania', N'Micronesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NPL', N'Nepal', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NLD', N'Netherlands, Kingdom of the', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NCL', N'New Caledonia', N'Oceania', N'Melanesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NZL', N'New Zealand', N'Oceania', N'Australia and New Zealand', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NIC', N'Nicaragua', N'Americas', N'Latin America and the Caribbean', N'Central America', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NER', N'Niger', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NGA', N'Nigeria', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NIU', N'Niue', N'Oceania', N'Polynesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NFK', N'Norfolk Island', N'Oceania', N'Australia and New Zealand', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MKD', N'North Macedonia', N'Europe', N'Southern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MNP', N'Northern Mariana Islands', N'Oceania', N'Micronesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'NOR', N'Norway', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'OMN', N'Oman', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PAK', N'Pakistan', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PLW', N'Palau', N'Oceania', N'Micronesia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PSE', N'Palestine, State of', N'Asia', N'Western Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PAN', N'Panama', N'Americas', N'Latin America and the Caribbean', N'Central America', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PNG', N'Papua New Guinea', N'Oceania', N'Melanesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PRY', N'Paraguay', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PER', N'Peru', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PHL', N'Philippines', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PCN', N'Pitcairn', N'Oceania', N'Polynesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'POL', N'Poland', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PRT', N'Portugal', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'PRI', N'Puerto Rico', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'QAT', N'Qatar', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'REU', N'Réunion', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ROU', N'Romania', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'RUS', N'Russian Federation', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'RWA', N'Rwanda', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'BLM', N'Saint BarthÃ©lemy', N'Americas', N'Latin America and the Caribbean', N'Caribbean', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SHN', N'Saint Helena, Ascension and Tristan da Cunha', N'Africa', N'Sub-Saharan Africa', N'Western Africa', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'KNA', N'Saint Kitts and Nevis', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LCA', N'Saint Lucia', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'MAF', N'Saint Martin (French part)', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SPM', N'Saint Pierre and Miquelon', N'Americas', N'Northern America', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VCT', N'Saint Vincent and the Grenadines', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'WSM', N'Samoa', N'Oceania', N'Polynesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SMR', N'San Marino', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'STP', N'Sao Tome and Principe', N'Africa', N'Sub-Saharan Africa', N'Middle Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SAU', N'Saudi Arabia', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SEN', N'Senegal', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SRB', N'Serbia', N'Europe', N'Southern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SYC', N'Seychelles', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SLE', N'Sierra Leone', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SGP', N'Singapore', N'Asia', N'South-eastern Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SXM', N'Sint Maarten (Dutch part)', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SVK', N'Slovakia', N'Europe', N'Eastern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SVN', N'Slovenia', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SLB', N'Solomon Islands', N'Oceania', N'Melanesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SOM', N'Somalia', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ZAF', N'South Africa', N'Africa', N'Sub-Saharan Africa', N'Southern Africa', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SGS', N'South Georgia and the South Sandwich Islands', N'Americas', N'Latin America and the Caribbean', N'South America', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SSD', N'South Sudan', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ESP', N'Spain', N'Europe', N'Southern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'LKA', N'Sri Lanka', N'Asia', N'Southern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SDN', N'Sudan', N'Africa', N'Northern Africa', NULL, N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SUR', N'Suriname', N'Americas', N'Latin America and the Caribbean', N'South America', N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SJM', N'Svalbard and Jan Mayen', N'Europe', N'Northern Europe', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SWE', N'Sweden', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'CHE', N'Switzerland', N'Europe', N'Western Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'SYR', N'Syrian Arab Republic', N'Asia', N'Western Asia', NULL, N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TWN', N'Taiwan, Province of China', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TJK', N'Tajikistan', N'Asia', N'Central Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TZA', N'Tanzania, United Republic of', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'THA', N'Thailand', N'Asia', N'South-eastern Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TLS', N'Timor-Leste', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TGO', N'Togo', N'Africa', N'Sub-Saharan Africa', N'Western Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TKL', N'Tokelau', N'Oceania', N'Polynesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TON', N'Tonga', N'Oceania', N'Polynesia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TTO', N'Trinidad and Tobago', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TUN', N'Tunisia', N'Africa', N'Northern Africa', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TUR', N'Türkiye', N'Asia', N'Western Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TKM', N'Turkmenistan', N'Asia', N'Central Asia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TCA', N'Turks and Caicos Islands', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'TUV', N'Tuvalu', N'Oceania', N'Polynesia', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'UGA', N'Uganda', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'UKR', N'Ukraine', N'Europe', N'Eastern Europe', NULL, N'Upper middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ARE', N'United Arab Emirates', N'Asia', N'Western Asia', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'GBR', N'United Kingdom of Great Britain and Northern Ireland', N'Europe', N'Northern Europe', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'USA', N'United States of America', N'Americas', N'Northern America', NULL, N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'UMI', N'United States Minor Outlying Islands', N'Oceania', N'Micronesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'URY', N'Uruguay', N'Americas', N'Latin America and the Caribbean', N'South America', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'UZB', N'Uzbekistan', N'Asia', N'Central Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VUT', N'Vanuatu', N'Oceania', N'Melanesia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VEN', N'Venezuela, Bolivarian Republic of', N'Americas', N'Latin America and the Caribbean', N'South America', NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VNM', N'Viet Nam', N'Asia', N'South-eastern Asia', NULL, N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VGB', N'Virgin Islands (British)', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'VIR', N'Virgin Islands (U.S.)', N'Americas', N'Latin America and the Caribbean', N'Caribbean', N'High income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'WLF', N'Wallis and Futuna', N'Oceania', N'Polynesia', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ESH', N'Western Sahara', N'Africa', N'Northern Africa', NULL, NULL)
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'YEM', N'Yemen', N'Asia', N'Western Asia', NULL, N'Low income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ZMB', N'Zambia', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Countries] ([Country_Code], [Country_Name], [Region], [Sub_Region], [Intermediate_Region], [Income_Group]) VALUES (N'ZWE', N'Zimbabwe', N'Africa', N'Sub-Saharan Africa', N'Eastern Africa', N'Lower middle income')
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2010, CAST(4.7583808898 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2011, CAST(3.8317191600 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2012, CAST(3.7829375267 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2013, CAST(3.5721004009 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2014, CAST(3.1308956146 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2015, CAST(3.9828546047 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2016, CAST(4.2201685905 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2017, CAST(2.6617181301 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2018, CAST(2.6943032741 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2019, CAST(2.3750917911 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2021, CAST(2.4360344409 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2022, CAST(1.2812711000 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2023, CAST(1.4459085464 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AFG', 2024, CAST(1.7209999561 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2010, CAST(5.2689366340 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2011, CAST(5.8674216270 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2012, CAST(5.5101242065 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2013, CAST(4.5506477355 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2014, CAST(4.8137631416 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2015, CAST(4.6066508293 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2016, CAST(4.5111007690 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2017, CAST(4.6395483016 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2018, CAST(5.0044026374 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2019, CAST(4.9953179359 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2020, CAST(5.3649096488 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2021, CAST(5.2554817199 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2022, CAST(5.2122130393 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2023, CAST(5.4446907043 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ALB', 2024, CAST(5.3042001724 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2010, CAST(5.4635667800 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2011, CAST(5.3171944618 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2012, CAST(5.6045956611 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2014, CAST(6.3548984527 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2016, CAST(5.3408536911 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2017, CAST(5.2489123344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2018, CAST(5.0430860519 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2019, CAST(4.7446274757 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2020, CAST(5.4377551078 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2021, CAST(5.2170176506 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2022, CAST(5.5381722450 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DZA', 2024, CAST(5.3635001182 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AGO', 2011, CAST(5.5890007019 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AGO', 2012, CAST(4.3602499961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AGO', 2013, CAST(3.9371068477 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AGO', 2014, CAST(3.7948379516 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2010, CAST(6.4410672187 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2011, CAST(6.7758054733 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2012, CAST(6.4683871269 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2013, CAST(6.5822601318 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2014, CAST(6.6711144447 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2015, CAST(6.6971306800 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2016, CAST(6.4272212982 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2017, CAST(6.0393300056 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2018, CAST(5.7927966117 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2019, CAST(6.0855607986 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2020, CAST(5.9005670547 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2021, CAST(5.9082789421 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2022, CAST(6.2609934806 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2023, CAST(6.3932285308 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARG', 2024, CAST(6.1880998611 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2010, CAST(4.3678112030 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2011, CAST(4.2604913711 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2012, CAST(4.3197116851 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2013, CAST(4.2771911621 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2014, CAST(4.4530830383 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2015, CAST(4.3483195304 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2016, CAST(4.3254718780 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2017, CAST(4.2877364158 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2018, CAST(5.0624485015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2019, CAST(5.4880867004 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2021, CAST(5.3005685806 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2022, CAST(5.3819427490 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2023, CAST(5.6790900230 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARM', 2024, CAST(5.4548997879 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2010, CAST(7.4500470161 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2011, CAST(7.4056162834 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2012, CAST(7.1955857276 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2013, CAST(7.3641691207 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2014, CAST(7.2885503768 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2015, CAST(7.3090605735 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2016, CAST(7.2500801086 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2017, CAST(7.2570376396 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2018, CAST(7.1769933700 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2019, CAST(7.2339949607 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2020, CAST(7.1373677253 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2021, CAST(7.1115989685 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2022, CAST(7.0346961021 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2023, CAST(7.0245823860 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUS', 2024, CAST(7.0569000244 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2010, CAST(7.3026785850 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2011, CAST(7.4705128669 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2012, CAST(7.4006886482 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2013, CAST(7.4988026618 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2014, CAST(6.9499998092 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2015, CAST(7.0764470100 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2016, CAST(7.0480718612 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2017, CAST(7.2937278747 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2018, CAST(7.3960018157 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2019, CAST(7.1953611373 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2020, CAST(7.2134890556 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2021, CAST(7.0796408653 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2022, CAST(6.9989972114 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2023, CAST(6.6356639862 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AUT', 2024, CAST(6.9046998023 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2010, CAST(4.2186107635 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2011, CAST(4.6804695129 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2012, CAST(4.9107718467 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2013, CAST(5.4811782836 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2014, CAST(5.2515301704 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2015, CAST(5.1467747688 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2016, CAST(5.3038949966 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2017, CAST(5.1522793769 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2018, CAST(5.1679954528 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2019, CAST(5.1733894348 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2022, CAST(4.5762815475 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2023, CAST(5.2138948440 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'AZE', 2024, CAST(4.8934001922 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2010, CAST(5.9368691444 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2011, CAST(4.8239760398 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2012, CAST(5.0271868705 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2013, CAST(6.6897110939 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2014, CAST(6.1651339530 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2015, CAST(6.0073752403 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2016, CAST(6.1696734428 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2017, CAST(6.2273206710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2019, CAST(7.0980124473 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2020, CAST(6.1731758117 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2023, CAST(5.9590682983 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BHR', 2024, CAST(5.9590997695 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2010, CAST(4.8584814071 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2011, CAST(4.9856491088 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2012, CAST(4.7244439125 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2013, CAST(4.6601610183 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2014, CAST(4.6355648040 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2015, CAST(4.6334738731 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2016, CAST(4.5561408996 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2017, CAST(4.3097710609 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2018, CAST(4.4992170333 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2019, CAST(5.1142168045 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2020, CAST(5.2799868583 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2021, CAST(4.1233186721 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2022, CAST(3.4075322151 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2023, CAST(4.1135487556 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGD', 2024, CAST(3.8859000205 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2010, CAST(5.5259232521 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2011, CAST(5.2253079414 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2012, CAST(5.7490434646 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2013, CAST(5.8764662742 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2014, CAST(5.8124008178 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2015, CAST(5.7189078330 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2016, CAST(5.1778993606 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2017, CAST(5.5529150962 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2018, CAST(5.2337698936 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLR', 2019, CAST(5.8214530944 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2010, CAST(6.8535141944 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2011, CAST(7.1113638877 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2012, CAST(6.9351220130 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2013, CAST(7.1036610603 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2014, CAST(6.8553290367 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2015, CAST(6.9042191505 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2016, CAST(6.9489364624 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2017, CAST(6.9283475875 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2018, CAST(6.8921718597 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2019, CAST(6.7721381187 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2020, CAST(6.8387608528 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2021, CAST(6.8817563056 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2022, CAST(6.8568744659 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2023, CAST(6.9435987472 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEL', 2024, CAST(6.8941998481 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BLZ', 2014, CAST(5.9556465148 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2011, CAST(3.8702795505 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2012, CAST(3.1934688091 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2013, CAST(3.4794127941 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2014, CAST(3.3474192619 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2015, CAST(3.6246643066 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2016, CAST(4.0073575973 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2017, CAST(4.8531808853 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2018, CAST(5.8198270797 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2019, CAST(4.9763607978 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2020, CAST(4.4077458381 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2021, CAST(4.4934310913 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2022, CAST(4.2173256874 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2023, CAST(4.4198341369 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BEN', 2024, CAST(4.3773999214 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BTN', 2013, CAST(5.5690917968 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BTN', 2014, CAST(4.9385781288 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BTN', 2015, CAST(5.0821285247 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2010, CAST(5.7806200981 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2011, CAST(5.7788743972 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2012, CAST(6.0188946723 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2013, CAST(5.7674288749 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2014, CAST(5.8647985458 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2015, CAST(5.8343291282 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2016, CAST(5.7697234153 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2017, CAST(5.6505527496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2018, CAST(5.9157342910 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2019, CAST(5.6742706298 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2020, CAST(5.5592589378 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2021, CAST(5.5686240196 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2022, CAST(5.9288821220 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2023, CAST(5.8598861694 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BOL', 2024, CAST(5.7842998504 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2010, CAST(4.6685175895 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2011, CAST(4.9946708679 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2012, CAST(4.7731447219 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2013, CAST(5.1236643791 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2014, CAST(5.2489542961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2015, CAST(5.1171779632 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2016, CAST(5.1808652877 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2017, CAST(5.0899024009 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2018, CAST(5.8874011039 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2019, CAST(6.0155224800 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2020, CAST(5.5158162117 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2021, CAST(5.7488231658 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2022, CAST(5.8720550537 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2023, CAST(6.0085811614 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BIH', 2024, CAST(5.8769998550 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2010, CAST(3.5530202388 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2011, CAST(3.5199210643 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2012, CAST(4.8359389305 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2013, CAST(4.1282987594 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2014, CAST(4.0311970710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2015, CAST(3.7619647979 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2016, CAST(3.4989366531 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2017, CAST(3.5048811435 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2018, CAST(3.4613656997 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2019, CAST(3.4710848331 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2022, CAST(3.4352750778 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2023, CAST(3.3316478729 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BWA', 2024, CAST(3.3833999633 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2010, CAST(6.8373312950 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2011, CAST(7.0378165245 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2012, CAST(6.6600036621 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2013, CAST(7.1402826309 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2014, CAST(6.9809989929 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2015, CAST(6.5468969345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2016, CAST(6.3748173713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2017, CAST(6.3329291343 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2018, CAST(6.1909217834 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2019, CAST(6.4511489868 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2020, CAST(6.1097178459 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2021, CAST(6.0099534988 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2022, CAST(6.2570796012 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2023, CAST(6.5526909828 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BRA', 2024, CAST(6.2719998359 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2010, CAST(3.9122762680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2011, CAST(3.8753824234 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2012, CAST(4.2222971916 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2013, CAST(3.9930205345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2014, CAST(4.4384398460 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2015, CAST(4.8654012680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2016, CAST(4.8375606536 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2017, CAST(5.0969018936 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2018, CAST(5.0988135337 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2019, CAST(5.1084380149 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2020, CAST(5.5977230072 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2021, CAST(5.4216933250 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2022, CAST(5.3783488273 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2023, CAST(5.5895991325 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BGR', 2024, CAST(5.4626998901 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2010, CAST(4.0355606079 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2011, CAST(4.7853674888 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2012, CAST(3.9550080299 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2013, CAST(3.3259496688 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2014, CAST(3.4813477993 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2015, CAST(4.4189300537 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2016, CAST(4.2056345939 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2017, CAST(4.6468911170 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2018, CAST(4.9272360801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2019, CAST(4.7408928871 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2020, CAST(4.6396398544 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2021, CAST(4.6355085372 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2023, CAST(4.4622077941 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BFA', 2024, CAST(4.5479998588 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BDI', 2011, CAST(3.7058942317 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BDI', 2014, CAST(2.9045350551 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'BDI', 2018, CAST(3.7752830982 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2010, CAST(4.1410722732 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2011, CAST(4.1612253189 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2012, CAST(3.8987069129 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2013, CAST(3.6744668483 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2014, CAST(3.8833055496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2015, CAST(4.1621646881 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2016, CAST(4.4612593650 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2017, CAST(4.5858421325 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2018, CAST(5.1218376159 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2019, CAST(4.9982848167 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2020, CAST(4.3769850730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2021, CAST(4.5551414489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2022, CAST(4.2502808570 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2023, CAST(4.2213454246 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KHM', 2024, CAST(4.3407001495 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2010, CAST(4.5542569160 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2011, CAST(4.4338850975 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2012, CAST(4.2446341514 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2013, CAST(4.2710380554 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2014, CAST(4.2404413223 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2015, CAST(5.0379648208 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2016, CAST(4.8162322044 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2017, CAST(5.0740513801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2018, CAST(5.2507376670 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2019, CAST(4.9367375373 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2020, CAST(5.2410778999 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2021, CAST(4.9627475738 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2022, CAST(4.7124080657 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2023, CAST(4.9458470344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CMR', 2024, CAST(4.8744001388 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2010, CAST(7.6503462791 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2011, CAST(7.4260535240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2012, CAST(7.4151444435 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2013, CAST(7.5937938690 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2014, CAST(7.3042578697 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2015, CAST(7.4127726554 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2016, CAST(7.2448458671 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2017, CAST(7.4148683547 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2018, CAST(7.1754965782 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2019, CAST(7.1090764999 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2020, CAST(7.0249047279 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2021, CAST(6.9394354820 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2022, CAST(6.9179353713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2023, CAST(6.8412065505 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAN', 2024, CAST(6.8996000289 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAF', 2010, CAST(3.5678925514 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAF', 2011, CAST(3.6778264045 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAF', 2016, CAST(2.6930611133 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CAF', 2017, CAST(3.4758620262 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2010, CAST(3.7428710460 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2011, CAST(4.3934822082 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2012, CAST(4.0329747200 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2013, CAST(3.5076630115 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2014, CAST(3.4601829051 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2015, CAST(4.3226752281 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2016, CAST(4.0293502807 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2017, CAST(4.5589370727 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2018, CAST(4.4863252639 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2019, CAST(4.2507991790 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2022, CAST(4.3966460227 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2023, CAST(4.5440955162 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TCD', 2024, CAST(4.4713001251 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2010, CAST(6.6356558799 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2011, CAST(6.5263347625 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2012, CAST(6.5991287231 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2013, CAST(6.7401537895 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2014, CAST(6.8442382812 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2015, CAST(6.5327496528 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2016, CAST(6.5790562629 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2017, CAST(6.3201193809 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2018, CAST(6.4362206459 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2019, CAST(5.9422502517 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2020, CAST(6.1506428718 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2021, CAST(6.4356307983 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2022, CAST(6.4151988029 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2023, CAST(6.2298202514 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHL', 2024, CAST(6.3603000640 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2010, CAST(4.6527366638 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2011, CAST(5.0372076034 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2012, CAST(5.0949172973 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2013, CAST(5.2410902976 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2014, CAST(5.1956191062 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2015, CAST(5.3038778305 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2016, CAST(5.3249559402 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2017, CAST(5.0990614891 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2018, CAST(5.1314339637 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2019, CAST(5.1441202163 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2020, CAST(5.7710647583 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2021, CAST(5.8628644943 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2023, CAST(6.1447639465 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHN', 2024, CAST(5.9727001190 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2010, CAST(6.4081134796 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2011, CAST(6.4639525413 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2012, CAST(6.3748798370 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2013, CAST(6.6065506935 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2014, CAST(6.4487891197 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2015, CAST(6.3875718116 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2016, CAST(6.2337150573 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2017, CAST(6.1573419570 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2018, CAST(5.9835124015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2019, CAST(6.3502979278 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2020, CAST(5.7091751098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2021, CAST(5.2899584770 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2022, CAST(5.8917121887 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2023, CAST(5.9044041633 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COL', 2024, CAST(5.6950998306 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2010, CAST(3.8121910095 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2011, CAST(3.8384859561 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2012, CAST(3.9556403160 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2018, CAST(3.9728195667 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2019, CAST(4.6086163520 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2022, CAST(3.5452036857 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2023, CAST(3.5880563259 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COM', 2024, CAST(3.5662999153 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2011, CAST(4.5098242759 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2012, CAST(3.9193418025 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2013, CAST(3.9549505710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2014, CAST(4.0560126304 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2015, CAST(4.6908302307 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2016, CAST(4.1194934844 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2017, CAST(4.8839912414 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2018, CAST(5.4902143478 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2019, CAST(5.2126226425 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2020, CAST(5.0791392326 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2021, CAST(4.9205312728 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2022, CAST(5.8049187660 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2023, CAST(4.9537296295 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COG', 2024, CAST(5.2214999198 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2011, CAST(4.5169639587 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2012, CAST(4.6392273902 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2013, CAST(4.4974770545 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2014, CAST(4.4142999649 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2015, CAST(3.9027416706 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2016, CAST(4.5219354629 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2017, CAST(4.3110332489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2022, CAST(3.2071967124 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2023, CAST(3.3833975791 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'COD', 2024, CAST(3.2953999042 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2010, CAST(7.2710537910 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2011, CAST(7.2288885116 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2012, CAST(7.2722501754 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2013, CAST(7.1580004692 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2014, CAST(7.2470860481 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2015, CAST(6.8540043830 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2016, CAST(7.1356177330 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2017, CAST(7.2251815795 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2018, CAST(7.1410746574 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2019, CAST(6.9976186752 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2020, CAST(6.3384723663 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2021, CAST(6.4084482192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2022, CAST(7.0766582489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2023, CAST(7.3840689659 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CRI', 2024, CAST(6.9553999900 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2010, CAST(5.5955753326 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2011, CAST(5.3853726387 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2012, CAST(6.0276346206 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2013, CAST(5.8854627609 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2014, CAST(5.3806924819 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2015, CAST(5.2054381370 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2016, CAST(5.4168753623 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2017, CAST(5.3431658744 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2018, CAST(5.5362710952 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2019, CAST(5.6257438659 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2020, CAST(6.5079922676 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2021, CAST(6.2867903709 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2022, CAST(5.5786914825 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2023, CAST(5.9583787918 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HRV', 2024, CAST(5.9422998428 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2010, CAST(6.3865461349 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2011, CAST(6.6896085739 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2012, CAST(6.1805071830 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2013, CAST(5.4389524459 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2014, CAST(5.6271238327 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2015, CAST(5.4391613006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2016, CAST(5.7946186065 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2017, CAST(6.0620512962 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2018, CAST(6.2764430046 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2019, CAST(6.1368327140 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2020, CAST(6.2598104476 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2021, CAST(6.2692022323 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2022, CAST(5.8647565841 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2023, CAST(6.0705943107 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CYP', 2024, CAST(6.0680999755 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2010, CAST(6.2496175765 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2011, CAST(6.3314909934 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2012, CAST(6.3341493606 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2013, CAST(6.6976556777 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2014, CAST(6.4837298393 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2015, CAST(6.6080174446 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2016, CAST(6.7356271743 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2017, CAST(6.7895679473 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2018, CAST(7.0341653823 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2020, CAST(6.8970913887 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2021, CAST(6.9424967765 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2022, CAST(6.6950774192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2023, CAST(6.8270063400 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CZE', 2024, CAST(6.8218002319 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2010, CAST(7.7705154418 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2011, CAST(7.7882318496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2012, CAST(7.5199093818 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2013, CAST(7.5886068344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2014, CAST(7.5075592994 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2015, CAST(7.5144248008 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2016, CAST(7.5577826499 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2017, CAST(7.5937023162 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2018, CAST(7.6487855911 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2019, CAST(7.6930031776 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2020, CAST(7.5146312713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2021, CAST(7.6987471580 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2022, CAST(7.5449647903 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2023, CAST(7.5041928291 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DNK', 2024, CAST(7.5826997756 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DJI', 2010, CAST(5.0058107376 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DJI', 2011, CAST(4.3691935539 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2010, CAST(4.7350211143 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2011, CAST(5.3965353965 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2012, CAST(4.7533111572 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2013, CAST(5.0155153274 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2014, CAST(5.3873319625 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2015, CAST(5.0618624687 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2016, CAST(5.2386984825 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2017, CAST(5.6052026748 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2018, CAST(5.4332156181 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2019, CAST(6.0042371749 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2020, CAST(5.1684098243 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2021, CAST(6.0305371284 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2022, CAST(5.5184159278 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2023, CAST(5.9212622642 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DOM', 2024, CAST(5.8228001594 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2010, CAST(5.8380513191 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2011, CAST(5.7950882911 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2012, CAST(5.9607162475 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2013, CAST(6.0192060470 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2014, CAST(5.9458518028 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2015, CAST(5.9640750885 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2016, CAST(6.1154375076 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2017, CAST(5.8395185470 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2018, CAST(6.1280102729 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2019, CAST(5.8091311454 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2020, CAST(5.3544616699 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2021, CAST(5.4348721504 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2022, CAST(5.8871321678 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2023, CAST(5.8517537117 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ECU', 2024, CAST(5.7245001792 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2010, CAST(4.6689162254 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2011, CAST(4.1741585731 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2012, CAST(4.2041568756 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2013, CAST(3.5585203170 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2014, CAST(4.8850727081 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2015, CAST(4.7625384330 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2016, CAST(4.5567407608 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2017, CAST(3.9293441772 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2018, CAST(4.0054507255 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2019, CAST(4.3278317451 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2020, CAST(4.4723968505 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2021, CAST(4.0257477760 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2022, CAST(4.0235610008 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2023, CAST(3.8806402683 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EGY', 2024, CAST(3.9765999317 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2010, CAST(6.7399110794 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2011, CAST(4.7412948608 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2012, CAST(5.9343714714 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2013, CAST(6.3250632286 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2014, CAST(5.8565235137 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2015, CAST(6.0184960365 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2016, CAST(6.1398248672 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2017, CAST(6.3393182754 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2018, CAST(6.2411994934 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2019, CAST(6.4548206329 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2020, CAST(5.4619269371 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2021, CAST(6.4314470291 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2022, CAST(6.4921560287 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2023, CAST(6.4818468093 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLV', 2024, CAST(6.4686999320 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2011, CAST(5.4868197441 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2012, CAST(5.3639278411 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2013, CAST(5.3674459457 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2014, CAST(5.5559825897 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2015, CAST(5.6289086341 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2016, CAST(5.6496753692 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2017, CAST(5.9383959770 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2018, CAST(6.0913023948 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2019, CAST(6.0346412658 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2020, CAST(6.4525637626 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2021, CAST(6.5539155006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2022, CAST(6.3571143150 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2023, CAST(6.4298729896 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'EST', 2024, CAST(6.4477000236 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWZ', 2011, CAST(4.8670911788 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWZ', 2018, CAST(4.2115650177 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWZ', 2019, CAST(4.3961148262 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWZ', 2022, CAST(3.5020029544 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWZ', 2024, CAST(3.5020000934 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2012, CAST(4.5611686706 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2013, CAST(4.4448270797 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2014, CAST(4.5066466331 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2015, CAST(4.5731549263 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2016, CAST(4.2978487014 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2017, CAST(4.1803154945 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2018, CAST(4.3792624473 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2019, CAST(4.0995550155 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2020, CAST(4.5492196083 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2022, CAST(3.6280715465 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2023, CAST(4.0926485061 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ETH', 2024, CAST(3.8608999252 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2010, CAST(7.3932642936 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2011, CAST(7.3542251586 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2012, CAST(7.4202094078 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2013, CAST(7.4446358680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2014, CAST(7.3845710754 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2015, CAST(7.4479255676 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2016, CAST(7.6598434448 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2017, CAST(7.7882518768 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2018, CAST(7.8581070899 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2019, CAST(7.7803478240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2020, CAST(7.8893499374 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2021, CAST(7.7943778038 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2022, CAST(7.7289981842 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2023, CAST(7.6989293098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FIN', 2024, CAST(7.7406997680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2010, CAST(6.7979011535 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2011, CAST(6.9591851234 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2012, CAST(6.6493654251 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2013, CAST(6.6671214103 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2014, CAST(6.4668679237 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2015, CAST(6.3576250076 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2016, CAST(6.4752087593 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2017, CAST(6.6352224349 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2018, CAST(6.6659035682 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2019, CAST(6.6896443367 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2020, CAST(6.7141118049 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2021, CAST(6.6562066078 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2022, CAST(6.6138067245 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2023, CAST(6.5569214820 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'FRA', 2024, CAST(6.6090002059 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2011, CAST(4.2554006576 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2012, CAST(3.9720592498 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2013, CAST(3.8002870082 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2014, CAST(3.9180731773 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2015, CAST(4.6610126495 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2016, CAST(4.8317642211 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2017, CAST(4.7823829650 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2018, CAST(4.7830090522 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2019, CAST(4.9143934249 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2020, CAST(4.8865499496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2021, CAST(5.0754222869 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2022, CAST(5.1395006179 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2023, CAST(5.1041250228 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GAB', 2024, CAST(5.1062998771 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2017, CAST(4.1179389953 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2018, CAST(4.9220991134 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2019, CAST(5.1636271476 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2022, CAST(4.2794413566 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2023, CAST(4.6907634735 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GMB', 2024, CAST(4.4848999977 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2010, CAST(4.1018371582 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2011, CAST(4.2030305862 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2012, CAST(4.2544455528 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2013, CAST(4.3489208221 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2014, CAST(4.2875080108 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2015, CAST(4.1219406127 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2016, CAST(4.4483861923 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2017, CAST(4.4507746696 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2018, CAST(4.6590971946 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2019, CAST(4.8918356895 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2020, CAST(5.1231431961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2021, CAST(4.9112734794 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2022, CAST(5.2927551269 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2023, CAST(5.3506350517 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GEO', 2024, CAST(5.1847000122 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2010, CAST(6.7245311737 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2011, CAST(6.6213121414 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2012, CAST(6.7023620605 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2013, CAST(6.9651250839 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2014, CAST(6.9842143058 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2015, CAST(7.0371375083 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2016, CAST(6.8737630844 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2017, CAST(7.0743246078 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2018, CAST(7.1183643341 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2019, CAST(7.0354723930 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2020, CAST(7.3118977546 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2021, CAST(6.7545237541 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2022, CAST(6.6082067489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2023, CAST(6.7924904823 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'DEU', 2024, CAST(6.7185001373 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2010, CAST(4.6062517166 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2011, CAST(5.6081995964 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2012, CAST(5.0572619438 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2013, CAST(4.9650530815 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2014, CAST(3.8603510856 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2015, CAST(3.9859161376 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2016, CAST(4.5144114494 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2017, CAST(5.4813108444 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2018, CAST(5.0036931037 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2019, CAST(4.9668097496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2020, CAST(5.3194832801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2021, CAST(4.3779506683 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2022, CAST(4.1908545494 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2023, CAST(4.2984514236 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GHA', 2024, CAST(4.2894001007 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2010, CAST(5.8395586013 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2011, CAST(5.3720397949 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2012, CAST(5.0963540077 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2013, CAST(4.7202510833 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2014, CAST(4.7562370300 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2015, CAST(5.6225190162 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2016, CAST(5.3026194572 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2017, CAST(5.1482415199 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2018, CAST(5.4092893600 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2019, CAST(5.9521574974 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2020, CAST(5.7876157760 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2021, CAST(6.1042141914 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2022, CAST(5.9004592895 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2023, CAST(5.7960629463 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GRC', 2024, CAST(5.9335999488 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2010, CAST(6.2897486686 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2011, CAST(5.7433538436 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2012, CAST(5.8557171821 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2013, CAST(5.9846014976 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2014, CAST(6.5360307693 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2015, CAST(6.4649868011 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2016, CAST(6.3589162826 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2017, CAST(6.3251185417 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2018, CAST(6.6265916824 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2019, CAST(6.2621750831 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2022, CAST(6.1503314971 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2023, CAST(6.4212937355 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GTM', 2024, CAST(6.2870001792 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2011, CAST(4.0445694923 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2012, CAST(3.6515548229 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2013, CAST(3.9017930030 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2014, CAST(3.4124825000 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2015, CAST(3.5046935081 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2016, CAST(3.6028547286 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2017, CAST(4.8737225532 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2018, CAST(5.2522268295 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2019, CAST(4.7676844596 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2020, CAST(4.9721684455 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2021, CAST(4.9445395469 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2022, CAST(5.3174929618 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2023, CAST(4.8271799087 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GIN', 2024, CAST(5.0233001708 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2010, CAST(3.7659988403 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2011, CAST(4.8445739746 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2012, CAST(4.4134750366 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2013, CAST(4.6219620704 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2014, CAST(3.8887784481 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2015, CAST(3.5697624683 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2016, CAST(3.3523001670 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2017, CAST(3.8238656520 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HTI', 2018, CAST(3.6149280071 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2010, CAST(5.8661313056 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2011, CAST(4.9610314369 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2012, CAST(4.6022181510 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2013, CAST(4.7133584022 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2014, CAST(5.0557260513 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2015, CAST(4.8454365730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2016, CAST(5.6481547355 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2017, CAST(6.0199856758 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2018, CAST(5.9084239006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2019, CAST(5.9300513267 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2021, CAST(6.1136360168 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2022, CAST(5.9318037033 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2023, CAST(5.8605680465 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HND', 2024, CAST(5.9684000015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2010, CAST(5.6428346633 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2011, CAST(5.4740109443 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2012, CAST(5.4837646484 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2014, CAST(5.4580507278 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2016, CAST(5.4984207153 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2017, CAST(5.3624749183 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2019, CAST(5.6593170166 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2020, CAST(5.2953414916 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2021, CAST(5.3215508460 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2022, CAST(5.3112940788 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HKG', 2024, CAST(5.3164000511 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2010, CAST(4.7251324653 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2011, CAST(4.9176025390 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2012, CAST(4.6833581924 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2013, CAST(4.9144668579 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2014, CAST(5.1805634498 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2015, CAST(5.3443832397 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2016, CAST(5.4489016532 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2017, CAST(6.0650386810 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2018, CAST(5.9357709884 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2019, CAST(6.0002598762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2020, CAST(6.0380496978 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2021, CAST(6.2266478538 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2022, CAST(5.8611831665 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2023, CAST(5.9651780128 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'HUN', 2024, CAST(6.0169000625 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2012, CAST(7.5906600952 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2013, CAST(7.5013942718 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2015, CAST(7.4980707168 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2016, CAST(7.5100345611 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2017, CAST(7.4762139320 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2019, CAST(7.5325045585 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2020, CAST(7.5754895210 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2021, CAST(7.5646247863 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2022, CAST(7.4487943649 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2023, CAST(7.5616092681 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISL', 2024, CAST(7.5251002311 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2010, CAST(4.9892773628 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2011, CAST(4.6348714828 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2012, CAST(4.7201466560 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2013, CAST(4.4277887344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2014, CAST(4.4243793487 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2015, CAST(4.3420791625 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2016, CAST(4.1791772842 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2017, CAST(4.0461111068 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2018, CAST(3.8180687427 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2019, CAST(3.2487697601 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2020, CAST(4.2238655090 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2021, CAST(3.5582537651 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2022, CAST(3.9298162460 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2023, CAST(4.6760087013 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IND', 2024, CAST(4.0541000366 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2010, CAST(5.4572992324 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2011, CAST(5.1726083755 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2012, CAST(5.3677740097 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2013, CAST(5.2922377586 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2014, CAST(5.5973753929 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2015, CAST(5.0427999496 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2016, CAST(5.1363253593 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2017, CAST(5.0984015464 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2018, CAST(5.3402957916 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2019, CAST(5.3465127944 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2020, CAST(4.8281474113 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2021, CAST(5.4331731796 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2022, CAST(5.5846858024 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2023, CAST(5.6948695182 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IDN', 2024, CAST(5.5682997703 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2011, CAST(4.7675070762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2012, CAST(4.6089277267 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2013, CAST(5.1395792961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2014, CAST(4.6822242736 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2015, CAST(4.7499556541 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2016, CAST(4.6527309417 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2017, CAST(4.7167830467 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2018, CAST(4.2781176567 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2019, CAST(5.0061459541 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2020, CAST(4.8645281791 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2021, CAST(4.7878141403 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2022, CAST(4.9769954681 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2023, CAST(5.0042805671 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRN', 2024, CAST(4.9228000640 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2010, CAST(5.0654621124 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2011, CAST(4.7253661155 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2012, CAST(4.6595087051 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2013, CAST(4.7250170707 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2014, CAST(4.5415024757 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2015, CAST(4.4933772087 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2016, CAST(4.4125370979 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2017, CAST(4.4623990058 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2018, CAST(4.8864006996 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2020, CAST(4.7851653099 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2021, CAST(5.0936679840 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2022, CAST(4.9279956817 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2023, CAST(5.4753718376 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRQ', 2024, CAST(5.1659998893 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2010, CAST(7.2573895454 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2011, CAST(7.0069041252 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2012, CAST(6.9646453857 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2013, CAST(6.7600851058 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2014, CAST(7.0183792114 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2015, CAST(6.8301253318 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2016, CAST(7.0407314300 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2017, CAST(7.0601553916 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2018, CAST(6.9623355865 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2019, CAST(7.2548413276 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2020, CAST(7.0349307060 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2021, CAST(6.8276519775 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2022, CAST(6.8698639869 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2023, CAST(6.8165311813 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'IRL', 2024, CAST(6.8379998207 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2010, CAST(7.3589162826 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2011, CAST(7.4331479072 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2012, CAST(7.1108546257 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2013, CAST(7.3205633163 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2014, CAST(7.4005703926 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2015, CAST(7.0794110298 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2016, CAST(7.1590108871 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2017, CAST(7.3310360908 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2018, CAST(6.9271788597 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2019, CAST(7.3317799568 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2020, CAST(7.1949281692 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2021, CAST(7.5775279998 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2022, CAST(7.6623973846 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2023, CAST(6.7834024429 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ISR', 2024, CAST(7.3411002159 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2010, CAST(6.3542380332 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2011, CAST(6.0570864677 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2012, CAST(5.8393139839 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2013, CAST(6.0093736648 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2014, CAST(6.0265851020 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2015, CAST(5.8476839065 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2016, CAST(5.9545240402 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2017, CAST(6.1988701820 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2018, CAST(6.5165266990 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2019, CAST(6.4454169273 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2020, CAST(6.4883561134 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2021, CAST(6.4667448997 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2022, CAST(6.2584767341 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2023, CAST(6.2451119422 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ITA', 2024, CAST(6.3235001564 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2013, CAST(3.7393655776 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2014, CAST(3.5703685283 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2015, CAST(4.4450387954 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2016, CAST(4.5425457954 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2017, CAST(5.0377349853 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2018, CAST(5.2683749198 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2019, CAST(5.3920121192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2020, CAST(5.2565035820 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2021, CAST(5.0558066368 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2022, CAST(4.8486738204 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2023, CAST(5.3365855216 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CIV', 2024, CAST(5.0801000595 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2011, CAST(5.3744463920 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2013, CAST(5.7088866233 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2014, CAST(5.3105387687 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2017, CAST(5.8897590637 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2019, CAST(6.3092389106 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2020, CAST(5.4249906539 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2021, CAST(5.8137335777 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2022, CAST(5.8701891899 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JAM', 2024, CAST(5.8417000770 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2010, CAST(6.0567526817 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2011, CAST(6.2627935409 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2012, CAST(5.9682164192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2013, CAST(5.9593615531 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2014, CAST(5.9226207733 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2015, CAST(5.8796844482 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2016, CAST(5.9546508789 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2017, CAST(5.9106764793 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2018, CAST(5.7935752868 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2019, CAST(5.9080390930 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2020, CAST(6.1179633140 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2021, CAST(6.0913248062 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2022, CAST(6.1780099868 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2023, CAST(5.9101157188 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JPN', 2024, CAST(6.0598001480 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2010, CAST(5.5699424743 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2011, CAST(5.5393276214 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2012, CAST(5.1319961547 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2013, CAST(5.1719527244 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2014, CAST(5.3330216407 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2015, CAST(5.4045934677 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2016, CAST(5.2712845802 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2017, CAST(4.8080825805 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2018, CAST(4.6389336585 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2019, CAST(4.4525480270 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2020, CAST(4.0939917564 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2021, CAST(3.9091491699 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2022, CAST(4.3556065559 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2023, CAST(4.2920331954 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'JOR', 2024, CAST(4.1858000755 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2010, CAST(5.5142865180 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2011, CAST(5.7356629371 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2012, CAST(5.7594695091 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2013, CAST(5.8354830741 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2014, CAST(5.9700975418 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2015, CAST(5.9499950408 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2016, CAST(5.5335516929 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2017, CAST(5.8823513984 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2018, CAST(6.0076360702 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2019, CAST(6.2722682952 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2020, CAST(6.1682691574 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2021, CAST(6.2596340179 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2022, CAST(6.0062794685 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2023, CAST(6.2994327545 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KAZ', 2024, CAST(6.1875000000 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2010, CAST(4.2558593750 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2011, CAST(4.4053101539 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2012, CAST(4.5473351478 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2013, CAST(3.7953832149 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2014, CAST(4.9045796394 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2015, CAST(4.3576178550 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2016, CAST(4.3961277008 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2017, CAST(4.4756541252 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2018, CAST(4.6557025909 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2019, CAST(4.6188502311 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2020, CAST(4.5465841293 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2021, CAST(4.4645409584 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2022, CAST(4.4479465484 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2023, CAST(4.4962291717 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KEN', 2024, CAST(4.4696002006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2010, CAST(5.1766014099 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2011, CAST(4.8595018386 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2012, CAST(5.6395883560 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2013, CAST(6.1257581710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2014, CAST(5.0003752708 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2015, CAST(5.0774607658 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2016, CAST(5.7594122886 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2017, CAST(6.1491999626 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2018, CAST(6.3918256759 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2019, CAST(6.4251441955 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2020, CAST(6.2944140434 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2021, CAST(6.6484994888 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2022, CAST(6.1598534584 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2023, CAST(6.8777928352 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'XKX', 2024, CAST(6.5609998703 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2010, CAST(6.7981510162 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2011, CAST(6.3776993751 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2012, CAST(6.2210946083 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2013, CAST(6.4800310134 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2014, CAST(6.1801385879 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2015, CAST(6.1460318565 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2016, CAST(5.9471945762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2017, CAST(6.0939054489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2019, CAST(6.1061196327 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2022, CAST(6.7578291893 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2023, CAST(7.1302843093 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KWT', 2024, CAST(6.9513998031 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2010, CAST(4.9964108467 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2011, CAST(4.9210491180 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2012, CAST(5.2077856063 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2013, CAST(5.4024267196 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2014, CAST(5.2521929740 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2015, CAST(4.9053759574 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2016, CAST(4.8565340042 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2017, CAST(5.6295366287 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2018, CAST(5.2973833084 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2019, CAST(5.6852207183 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2020, CAST(6.2495861053 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2021, CAST(5.5636997222 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2022, CAST(5.6678409576 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2023, CAST(5.9095091819 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KGZ', 2024, CAST(5.7135000228 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2011, CAST(4.7037496566 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2012, CAST(4.8760848045 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2017, CAST(4.6231408119 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2018, CAST(4.8594021797 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2019, CAST(5.1968560218 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2020, CAST(5.2843909263 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2021, CAST(4.9265217781 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2022, CAST(4.9616565704 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2023, CAST(5.4863719940 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LAO', 2024, CAST(5.1388998031 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2011, CAST(4.9668116569 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2012, CAST(5.1250252723 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2013, CAST(5.0697703361 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2014, CAST(5.7291154861 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2015, CAST(5.8805975914 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2016, CAST(5.9404463768 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2017, CAST(5.9778175354 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2018, CAST(5.9011540412 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2019, CAST(5.9697537422 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2020, CAST(6.2290086746 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2021, CAST(6.3530907630 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2022, CAST(6.0548381805 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2023, CAST(6.2956447601 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LVA', 2024, CAST(6.2344999313 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2010, CAST(5.0318994522 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2011, CAST(5.1875715255 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2012, CAST(4.5725669860 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2013, CAST(4.9832887649 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2014, CAST(5.2330255508 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2015, CAST(5.1719713211 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2016, CAST(5.2707238197 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2017, CAST(5.1539897918 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2018, CAST(5.1671867370 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2019, CAST(4.0242195129 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2020, CAST(2.6337525844 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2021, CAST(2.1788094043 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2022, CAST(2.3524277210 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2023, CAST(3.5879082679 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBN', 2024, CAST(2.7065000534 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2011, CAST(4.8975148200 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2016, CAST(3.8082048892 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2017, CAST(3.7953007221 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2019, CAST(3.5117805004 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2022, CAST(3.1861624717 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LSO', 2024, CAST(3.1861999034 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2010, CAST(4.1960630416 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2014, CAST(4.5714192390 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2015, CAST(2.7015912532 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2016, CAST(3.3546760082 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2017, CAST(4.4244909286 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2018, CAST(4.1348528861 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2019, CAST(5.1214609146 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2022, CAST(4.0422601699 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2023, CAST(4.4939150810 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBR', 2024, CAST(4.2685999870 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2012, CAST(5.7543940544 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2015, CAST(5.6154046058 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2016, CAST(5.4335832595 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2017, CAST(5.6468524932 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2018, CAST(5.4939775466 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2019, CAST(5.3302221298 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2022, CAST(5.7602739334 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2023, CAST(5.9702887535 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LBY', 2024, CAST(5.8663001060 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2010, CAST(5.0658249855 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2011, CAST(5.4324374198 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2012, CAST(5.7710371017 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2013, CAST(5.5956892967 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2014, CAST(6.1257238388 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2015, CAST(5.7113780975 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2016, CAST(5.8655524253 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2017, CAST(6.2729406356 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2018, CAST(6.3088788986 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2019, CAST(6.0640978813 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2020, CAST(6.3913788795 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2021, CAST(6.8645725250 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2022, CAST(7.0375771522 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2023, CAST(6.5526542663 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LTU', 2024, CAST(6.8175001144 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2010, CAST(7.0972518920 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2011, CAST(7.1014003753 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2012, CAST(6.9640970230 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2013, CAST(7.1308093070 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2014, CAST(6.8911271095 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2015, CAST(6.7015714645 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2016, CAST(6.9673409461 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2017, CAST(7.0613808631 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2018, CAST(7.2426309585 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2019, CAST(7.4040155410 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2022, CAST(7.2279348373 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2023, CAST(7.0160622596 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LUX', 2024, CAST(7.1219000816 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2011, CAST(4.3814153671 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2012, CAST(3.5506095886 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2013, CAST(3.8156070709 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2014, CAST(3.6756269931 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2015, CAST(3.5925140380 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2016, CAST(3.6630859375 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2017, CAST(4.0786204338 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2018, CAST(4.0705866813 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2019, CAST(4.3390874862 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2022, CAST(4.0191340446 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2023, CAST(4.4330005645 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDG', 2024, CAST(4.2279000282 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2011, CAST(3.9460625648 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2012, CAST(4.2792696952 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2013, CAST(4.0350842475 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2014, CAST(4.5630803108 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2015, CAST(3.8676383495 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2016, CAST(3.4764926433 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2017, CAST(3.4168629646 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2018, CAST(3.3346335887 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2019, CAST(3.8691236972 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2021, CAST(3.6352832317 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2022, CAST(3.3555634021 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2023, CAST(3.2720918655 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MWI', 2024, CAST(3.4210000038 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2010, CAST(5.5802817344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2011, CAST(5.7863674163 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2012, CAST(5.9142837524 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2013, CAST(5.7701997756 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2014, CAST(5.9629216194 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2015, CAST(6.3221211433 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2018, CAST(5.3388175964 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2019, CAST(5.4279541969 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2020, CAST(6.0141987800 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2021, CAST(6.0103917121 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2022, CAST(6.0480065345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2023, CAST(5.8681020736 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MYS', 2024, CAST(5.9752001762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDV', 2018, CAST(5.1975746154 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2010, CAST(3.7623050212 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2011, CAST(4.6668329238 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2012, CAST(4.3130168914 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2013, CAST(3.6762771606 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2014, CAST(3.9747142791 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2015, CAST(4.5820984840 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2016, CAST(4.0160279273 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2017, CAST(4.7418503761 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2018, CAST(4.4157295227 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2019, CAST(4.9879918098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2020, CAST(4.2694735527 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2021, CAST(4.1130957603 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2022, CAST(4.2105479240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2023, CAST(4.3699760437 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLI', 2024, CAST(4.2319998741 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2010, CAST(5.7738747596 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2011, CAST(6.1547183990 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2012, CAST(5.9628720283 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2013, CAST(6.3799247741 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2014, CAST(6.4521179199 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2015, CAST(6.6133942604 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2016, CAST(6.5908422470 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2017, CAST(6.6756658554 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2018, CAST(6.9097108840 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2019, CAST(6.7329773902 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2020, CAST(6.1568226814 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2021, CAST(6.4437150955 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2022, CAST(6.2992382049 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2023, CAST(6.2948546409 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MLT', 2024, CAST(6.3457999229 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2010, CAST(4.7723069190 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2011, CAST(4.7848043441 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2012, CAST(4.6732039451 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2013, CAST(4.1990151405 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2014, CAST(4.4828052520 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2015, CAST(3.9226641654 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2016, CAST(4.4721493721 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2017, CAST(4.6781597137 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2018, CAST(4.3136153221 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2019, CAST(4.1526193618 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2022, CAST(4.7238688468 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2023, CAST(4.2920475006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MRT', 2024, CAST(4.5050997734 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2011, CAST(5.4770731925 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2014, CAST(5.6477799415 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2016, CAST(5.6100034713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2017, CAST(6.1741175651 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2018, CAST(5.8817405700 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2019, CAST(6.2411651611 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2020, CAST(6.0153002738 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2021, CAST(5.9491200447 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2022, CAST(5.7405009269 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2023, CAST(5.7591691017 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MUS', 2024, CAST(5.8164000511 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2010, CAST(6.8023886680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2011, CAST(6.9095153808 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2012, CAST(7.3201851844 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2013, CAST(7.4425463676 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2014, CAST(6.6798310279 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2015, CAST(6.2362871170 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2016, CAST(6.8241729736 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2017, CAST(6.4102993011 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2018, CAST(6.5495786666 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2019, CAST(6.4319453239 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2020, CAST(5.9642210006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2021, CAST(5.9907507896 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2022, CAST(7.0383687019 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2023, CAST(7.0057315826 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MEX', 2024, CAST(6.6779999732 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2010, CAST(5.5897364616 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2011, CAST(5.7922625541 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2012, CAST(5.9957127571 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2013, CAST(5.7560591697 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2014, CAST(5.9170584678 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2015, CAST(6.0174722671 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2016, CAST(5.5777840614 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2017, CAST(5.3255305290 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2018, CAST(5.6822772026 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2019, CAST(5.8034505844 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2020, CAST(5.8116288185 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2021, CAST(5.9590487480 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2022, CAST(5.6866116523 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2023, CAST(5.8013682365 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MDA', 2024, CAST(5.8158998489 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2010, CAST(4.5855236053 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2011, CAST(5.0311737060 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2012, CAST(4.8851504325 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2013, CAST(4.9129281044 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2014, CAST(4.8248348236 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2015, CAST(4.9827198982 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2016, CAST(5.0569996833 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2017, CAST(5.3338503837 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2018, CAST(5.4646229743 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2019, CAST(5.5629053115 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2020, CAST(6.0113649368 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2021, CAST(5.7210340499 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2022, CAST(5.7878303527 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2023, CAST(5.5796227455 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNG', 2024, CAST(5.6961998939 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2010, CAST(5.4550304412 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2011, CAST(5.2231168746 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2012, CAST(5.2187242507 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2013, CAST(5.0743417739 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2014, CAST(5.2827205657 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2015, CAST(5.1249213218 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2016, CAST(5.3040661811 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2017, CAST(5.6147985458 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2018, CAST(5.6501898765 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2019, CAST(5.3860249519 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2020, CAST(5.7221627235 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2022, CAST(5.6000432968 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2023, CAST(5.8130054473 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MNE', 2024, CAST(5.7069997787 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2010, CAST(4.3832473754 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2011, CAST(5.0849728584 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2012, CAST(4.9696564674 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2013, CAST(5.1421604156 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2015, CAST(5.1631569862 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2016, CAST(5.3863072395 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2017, CAST(5.3124828338 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2018, CAST(4.8967919349 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2019, CAST(5.0567517280 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2020, CAST(4.8026175498 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2021, CAST(5.3262486457 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2022, CAST(4.5960931777 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2023, CAST(4.4865140914 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MAR', 2024, CAST(4.7947001457 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2011, CAST(4.9711117744 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2015, CAST(4.5497674942 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2017, CAST(4.2798633575 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2018, CAST(4.6537137031 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2019, CAST(4.9321327209 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2021, CAST(5.1784868240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2022, CAST(4.7396774291 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2023, CAST(5.7044992446 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MOZ', 2024, CAST(5.2164001464 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2012, CAST(4.4389395713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2013, CAST(4.1756706237 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2014, CAST(4.7862472534 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2015, CAST(4.2238464355 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2016, CAST(4.6231198310 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2017, CAST(4.1543416976 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2018, CAST(4.4106330871 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2019, CAST(4.4342374801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2020, CAST(4.4313640594 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2021, CAST(4.3140397071 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2022, CAST(4.3590698242 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2023, CAST(4.3906335830 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MMR', 2024, CAST(4.3544998168 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2014, CAST(4.5739912986 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2017, CAST(4.4413061141 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2018, CAST(4.8340878486 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2019, CAST(4.4358110427 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2020, CAST(4.4510102272 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2021, CAST(4.4912071228 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2022, CAST(4.9489626884 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2023, CAST(5.0553216934 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NAM', 2024, CAST(4.8316998481 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2010, CAST(4.3496751785 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2011, CAST(3.8094446659 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2012, CAST(4.2332448959 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2013, CAST(4.6045765876 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2014, CAST(4.9750146865 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2015, CAST(4.8124365806 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2016, CAST(5.0995397567 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2017, CAST(4.7366924285 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2018, CAST(4.9100866317 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2019, CAST(5.4487247467 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2020, CAST(5.9824104309 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2021, CAST(4.6223001480 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2022, CAST(5.4741759300 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2023, CAST(5.3887081146 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NPL', 2024, CAST(5.1584000587 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2010, CAST(7.5018758773 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2011, CAST(7.5637979507 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2012, CAST(7.4707155227 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2013, CAST(7.4065504074 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2014, CAST(7.3211884498 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2015, CAST(7.3244371414 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2016, CAST(7.5408773422 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2017, CAST(7.4589653015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2018, CAST(7.4630970954 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2019, CAST(7.4252686500 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2020, CAST(7.5044479370 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2021, CAST(7.3141512870 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2022, CAST(7.3896360397 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2023, CAST(7.2547936439 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NLD', 2024, CAST(7.3193998336 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2010, CAST(7.2237563133 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2011, CAST(7.1906380653 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2012, CAST(7.2496299743 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2013, CAST(7.2801518440 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2014, CAST(7.3058924674 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2015, CAST(7.4181208610 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2016, CAST(7.2256879806 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2017, CAST(7.3271827697 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2018, CAST(7.3702859878 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2019, CAST(7.2051744461 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2020, CAST(7.2573819160 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2021, CAST(7.1367006301 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2022, CAST(6.9749865531 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2023, CAST(6.9759554862 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NZL', 2024, CAST(7.0292000770 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2010, CAST(5.6866993904 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2011, CAST(5.3857054710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2012, CAST(5.4480061531 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2013, CAST(5.7722749710 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2014, CAST(6.2752666473 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2015, CAST(5.9241127967 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2016, CAST(6.0127396583 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2017, CAST(6.4763565063 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2018, CAST(5.8189525604 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2019, CAST(6.1125450134 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2020, CAST(6.2868900299 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2021, CAST(6.0953488349 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2022, CAST(6.3922576904 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2023, CAST(6.3621249198 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NIC', 2024, CAST(6.2838997840 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2010, CAST(4.1010160446 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2011, CAST(4.5558295249 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2012, CAST(3.7980883121 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2013, CAST(3.7163298130 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2014, CAST(4.1809434890 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2015, CAST(3.6714537143 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2016, CAST(4.2346458435 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2017, CAST(4.6156735420 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2018, CAST(5.1640071868 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2019, CAST(5.0035443305 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2022, CAST(4.5013313293 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2023, CAST(4.6086578369 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NER', 2024, CAST(4.5563001632 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2010, CAST(4.7602758407 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2012, CAST(5.4929542541 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2013, CAST(4.8178687095 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2015, CAST(4.9329147338 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2016, CAST(5.2195677757 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2017, CAST(5.3219280242 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2018, CAST(5.2522883415 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2019, CAST(4.2664842605 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2020, CAST(5.5029482841 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2021, CAST(4.4792656898 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2022, CAST(5.2942471504 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2023, CAST(4.8689374923 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NGA', 2024, CAST(4.8807997703 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2010, CAST(4.1802020072 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2011, CAST(4.8981800079 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2012, CAST(4.6396474838 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2013, CAST(5.1861906051 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2014, CAST(5.2038259506 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2015, CAST(4.9755897521 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2016, CAST(5.3457460403 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2017, CAST(5.2338666915 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2018, CAST(5.2398347854 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2019, CAST(5.0154852867 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2020, CAST(5.0536642074 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2021, CAST(5.5347499847 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2022, CAST(5.1668815612 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2023, CAST(5.4030246734 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'MKD', 2024, CAST(5.3691000938 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2012, CAST(7.6782770156 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2014, CAST(7.4444708824 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2015, CAST(7.6034336090 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2016, CAST(7.5963315963 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2017, CAST(7.5787448883 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2018, CAST(7.4442620277 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2019, CAST(7.4421396255 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2020, CAST(7.2900323867 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2021, CAST(7.3615736961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2022, CAST(7.2946043014 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2023, CAST(7.2486753463 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'NOR', 2024, CAST(7.3017001152 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'OMN', 2011, CAST(6.8529820442 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2010, CAST(5.7861328125 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2011, CAST(5.2671861648 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2012, CAST(5.1315650939 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2013, CAST(5.1380825042 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2014, CAST(5.4356579780 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2015, CAST(4.8231949806 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2016, CAST(5.5485081672 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2017, CAST(5.8308706283 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2018, CAST(5.4715538024 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2019, CAST(4.4427175521 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2020, CAST(4.6239690780 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2021, CAST(4.4868345260 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2022, CAST(4.9306783676 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2023, CAST(4.5493144989 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAK', 2024, CAST(4.6567001342 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2010, CAST(7.3214673995 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2011, CAST(7.2480807304 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2012, CAST(6.8598356246 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2013, CAST(6.8664803504 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2014, CAST(6.6311712265 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2015, CAST(6.6055502891 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2016, CAST(6.1176381111 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2017, CAST(6.5676589012 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2018, CAST(6.2814340591 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2019, CAST(6.0859551429 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2021, CAST(6.5527787208 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2022, CAST(5.9793820381 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2023, CAST(6.5432896614 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PAN', 2024, CAST(6.3582000732 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2010, CAST(5.8411741256 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2011, CAST(5.6770806312 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2012, CAST(5.8200583457 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2013, CAST(5.9362406730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2014, CAST(5.1186418533 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2015, CAST(5.5597243309 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2016, CAST(5.8013801574 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2017, CAST(5.7132954597 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2019, CAST(5.6526255607 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2020, CAST(5.5012488365 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2021, CAST(5.5755352973 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2022, CAST(6.1376118659 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2023, CAST(6.2137885093 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRY', 2024, CAST(5.9765000343 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2010, CAST(5.6127853393 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2011, CAST(5.8924574851 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2012, CAST(5.8245573043 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2013, CAST(5.7825574874 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2014, CAST(5.8658156394 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2015, CAST(5.5772633552 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2016, CAST(5.7006287574 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2017, CAST(5.7109365463 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2018, CAST(5.6796612739 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2019, CAST(5.9993815422 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2020, CAST(4.9943790435 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2021, CAST(5.6943178176 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2022, CAST(5.8920688629 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2023, CAST(5.9356660842 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PER', 2024, CAST(5.8408999443 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2010, CAST(4.9415140151 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2011, CAST(4.9939565658 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2012, CAST(5.0019650459 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2013, CAST(4.9769253730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2014, CAST(5.3125500679 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2015, CAST(5.5474891662 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2016, CAST(5.4308328628 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2017, CAST(5.5942702293 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2018, CAST(5.8691725730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2019, CAST(6.2677450180 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2020, CAST(5.0795850753 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2021, CAST(5.9650578498 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2022, CAST(5.9949603080 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2023, CAST(6.1835117340 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PHL', 2024, CAST(6.0475997924 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2010, CAST(5.8870296478 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2011, CAST(5.6462049484 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2012, CAST(5.8759317398 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2013, CAST(5.7461318969 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2014, CAST(5.7502822875 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2015, CAST(6.0070219039 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2016, CAST(6.1620764732 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2017, CAST(6.2012681961 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2018, CAST(6.1114850044 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2019, CAST(6.2420940399 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2020, CAST(6.1394553184 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2021, CAST(5.9780688285 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2022, CAST(6.6662650108 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2023, CAST(6.6846528053 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'POL', 2024, CAST(6.4415001869 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2010, CAST(5.0945258140 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2011, CAST(5.2199978828 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2012, CAST(4.9939622879 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2013, CAST(5.1576881408 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2014, CAST(5.1269116401 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2015, CAST(5.0808663368 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2016, CAST(5.4466371536 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2017, CAST(5.7114992141 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2018, CAST(5.9198226928 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2019, CAST(6.0954732894 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2020, CAST(5.7677922248 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2021, CAST(6.1830143928 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2022, CAST(5.9525427818 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2023, CAST(5.9540109634 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PRT', 2024, CAST(6.0296001434 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'QAT', 2010, CAST(6.8496527671 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'QAT', 2011, CAST(6.5916042327 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'QAT', 2012, CAST(6.6112985610 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'QAT', 2015, CAST(6.3745293617 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2010, CAST(4.9091658592 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2011, CAST(5.0227575302 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2012, CAST(5.1668748855 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2013, CAST(5.0815844535 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2014, CAST(5.7268934249 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2015, CAST(5.7774910926 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2016, CAST(5.9688706398 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2017, CAST(6.0899047851 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2018, CAST(6.1508789062 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2019, CAST(6.1299424171 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2020, CAST(6.7851424217 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2021, CAST(6.5487256050 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2022, CAST(6.4369735717 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2023, CAST(6.4885897636 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ROU', 2024, CAST(6.4911999702 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2010, CAST(5.3847732543 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2011, CAST(5.3887662887 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2012, CAST(5.6207356452 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2013, CAST(5.5371775627 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2014, CAST(6.0369768142 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2015, CAST(5.9955387115 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2016, CAST(5.8549456596 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2017, CAST(5.5787429809 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2018, CAST(5.5135002136 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2019, CAST(5.4405236244 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2020, CAST(5.4952888488 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2021, CAST(5.4482612609 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2022, CAST(6.0440726280 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2023, CAST(5.8648123741 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RUS', 2024, CAST(5.7852997779 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2011, CAST(4.0974359512 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2012, CAST(3.3330478668 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2013, CAST(3.4663877487 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2014, CAST(3.5956783294 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2015, CAST(3.4831089973 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2016, CAST(3.3329899311 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2017, CAST(3.1083738803 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2018, CAST(3.5610466003 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'RWA', 2019, CAST(3.2681522369 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2010, CAST(6.3070983886 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2011, CAST(6.6997895240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2012, CAST(6.3963594436 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2013, CAST(6.4951329231 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2014, CAST(6.2783780097 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2015, CAST(6.3454918861 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2016, CAST(6.4739212989 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2017, CAST(6.2942824363 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2018, CAST(6.3563933372 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2019, CAST(6.5612473487 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2020, CAST(6.5595884323 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2021, CAST(6.4452943801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2022, CAST(6.3816103935 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2023, CAST(6.9533739089 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SAU', 2024, CAST(6.5935001373 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2010, CAST(4.3721561431 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2011, CAST(3.8342015743 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2012, CAST(3.6687369346 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2013, CAST(3.6473670005 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2014, CAST(4.3947772979 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2015, CAST(4.6170005798 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2016, CAST(4.5945339202 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2017, CAST(4.6830248832 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2018, CAST(4.7693772315 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2019, CAST(5.4887366294 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2020, CAST(4.7567734718 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2021, CAST(4.9028306007 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2022, CAST(4.9068198204 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2023, CAST(5.0927252769 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SEN', 2024, CAST(4.9685997962 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2010, CAST(4.4613041877 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2011, CAST(4.8151865005 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2012, CAST(5.1545219421 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2013, CAST(5.1018404960 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2014, CAST(5.1127285957 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2015, CAST(5.3176851272 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2016, CAST(5.7527546882 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2017, CAST(5.1220312118 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2018, CAST(5.9364933967 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2019, CAST(6.2414073944 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2020, CAST(6.0415463447 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2021, CAST(6.2452673912 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2022, CAST(6.5455875396 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2023, CAST(6.4410138130 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SRB', 2024, CAST(6.4107999801 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2010, CAST(4.1339559555 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2011, CAST(4.5016436576 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2013, CAST(4.5142912864 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2014, CAST(4.4999704360 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2015, CAST(4.9086179733 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2016, CAST(4.7329530715 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2017, CAST(4.0895624160 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2018, CAST(4.3056831359 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2019, CAST(3.4473814964 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2021, CAST(3.7142944335 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2022, CAST(2.5604295730 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2023, CAST(3.4665777683 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SLE', 2024, CAST(3.2451999187 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2010, CAST(6.5314016342 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2011, CAST(6.5610418319 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2013, CAST(6.5332069396 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2014, CAST(7.0623645782 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2015, CAST(6.6195249557 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2016, CAST(6.0334806442 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2017, CAST(6.3784379959 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2018, CAST(6.3745641708 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2019, CAST(6.3783597946 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2021, CAST(6.5867171287 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2022, CAST(6.3330459594 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2023, CAST(6.6539421081 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SGP', 2024, CAST(6.5227999687 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2010, CAST(6.0522232055 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2011, CAST(5.9450483322 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2012, CAST(5.9110593795 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2013, CAST(5.9365272521 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2014, CAST(6.1388731002 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2015, CAST(6.1620044708 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2016, CAST(5.9931631088 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2017, CAST(6.3655090332 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2018, CAST(6.2351107597 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2019, CAST(6.2434287071 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2020, CAST(6.5190982818 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2021, CAST(6.4185037612 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2022, CAST(6.0910820960 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2023, CAST(6.2605218887 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVK', 2024, CAST(6.2571001052 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2010, CAST(6.0825552940 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2011, CAST(6.0359640121 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2012, CAST(6.0628910064 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2013, CAST(5.9748888015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2014, CAST(5.6783952713 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2015, CAST(5.7406420707 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2016, CAST(5.9368214607 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2017, CAST(6.1668376922 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2018, CAST(6.2494192123 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2019, CAST(6.6652736663 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2020, CAST(6.4620761871 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2021, CAST(6.7612209320 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2022, CAST(6.7233977317 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2023, CAST(6.7457685470 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SVN', 2024, CAST(6.7432999610 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SOM', 2014, CAST(5.5282726287 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SOM', 2015, CAST(5.3536448478 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SOM', 2016, CAST(4.6679410934 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2010, CAST(4.6524286270 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2011, CAST(4.9305114746 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2012, CAST(5.1338877677 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2013, CAST(3.6607272624 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2014, CAST(4.8284564018 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2015, CAST(4.8873257637 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2016, CAST(4.7697396278 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2017, CAST(4.5136551856 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2018, CAST(4.8839221000 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2019, CAST(5.0348634719 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2020, CAST(4.9468007087 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2021, CAST(5.5986537933 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2022, CAST(5.5810303688 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2023, CAST(5.0757193565 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZAF', 2024, CAST(5.4219999313 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2010, CAST(6.1160244941 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2011, CAST(6.9465990066 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2012, CAST(6.0032868385 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2013, CAST(5.9588098526 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2014, CAST(5.8013253211 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2015, CAST(5.7802114486 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2016, CAST(5.9705643653 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2017, CAST(5.8738870620 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2018, CAST(5.8402314186 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2019, CAST(5.9028167724 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2020, CAST(5.7926955223 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2021, CAST(6.1127452850 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2022, CAST(5.9500136375 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2023, CAST(6.1119189262 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'KOR', 2024, CAST(6.0578999519 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SSD', 2014, CAST(3.8319923877 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SSD', 2015, CAST(4.0707712173 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SSD', 2016, CAST(2.8881123065 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SSD', 2017, CAST(2.8166224956 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2010, CAST(6.1882624626 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2011, CAST(6.5182490348 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2012, CAST(6.2906904220 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2013, CAST(6.1500272750 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2014, CAST(6.4564776420 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2015, CAST(6.3806633949 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2016, CAST(6.3186120986 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2017, CAST(6.2301731109 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2018, CAST(6.5133709907 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2019, CAST(6.4574494361 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2020, CAST(6.5021753311 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2021, CAST(6.4696111679 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2022, CAST(6.3369021415 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2023, CAST(6.4560332298 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ESP', 2024, CAST(6.4208998680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2010, CAST(3.9769051074 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2011, CAST(4.1805691719 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2012, CAST(4.2245931625 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2013, CAST(4.3646941184 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2014, CAST(4.2679328918 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2015, CAST(4.6116065979 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2017, CAST(4.3309454917 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2018, CAST(4.4350237846 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2019, CAST(4.2132992744 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2020, CAST(4.7784891128 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2021, CAST(4.1034469604 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2022, CAST(3.9848601818 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2023, CAST(3.6024549007 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'LKA', 2024, CAST(3.8980998992 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2010, CAST(4.7026038169 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2011, CAST(4.7512197494 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2012, CAST(4.6466083526 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2013, CAST(4.8440279960 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2014, CAST(4.7219381332 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2015, CAST(4.6952390670 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2016, CAST(4.9066181182 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2017, CAST(4.6281328201 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2018, CAST(4.5539216995 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2019, CAST(4.4825372695 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2022, CAST(4.9077601432 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2023, CAST(4.8511853218 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'PSE', 2024, CAST(4.8794999122 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SDN', 2010, CAST(4.4351596832 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SDN', 2011, CAST(4.3144564628 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SDN', 2012, CAST(4.5504994392 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SDN', 2014, CAST(4.1386728286 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SUR', 2012, CAST(6.2692866325 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2010, CAST(7.4960188865 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2011, CAST(7.3822321891 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2012, CAST(7.5601477622 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2013, CAST(7.4340105056 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2014, CAST(7.2391476631 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2015, CAST(7.2889223098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2016, CAST(7.3687443733 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2017, CAST(7.2868046760 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2018, CAST(7.3747920989 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2019, CAST(7.3980927467 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2020, CAST(7.3143410682 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2021, CAST(7.4392800331 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2022, CAST(7.4312143325 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2023, CAST(7.1607770919 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SWE', 2024, CAST(7.3440999984 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2012, CAST(7.7762088775 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2014, CAST(7.4928035736 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2015, CAST(7.5721368789 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2016, CAST(7.4585199356 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2017, CAST(7.4735932350 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2018, CAST(7.5085868835 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2019, CAST(7.6942210197 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2020, CAST(7.5084352493 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2021, CAST(7.3276724815 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2022, CAST(6.8838443756 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2023, CAST(6.9688329696 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'CHE', 2024, CAST(7.0602002143 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SYR', 2010, CAST(4.4647078514 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SYR', 2011, CAST(4.0378894805 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SYR', 2012, CAST(3.1644911766 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SYR', 2013, CAST(2.6875529289 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'SYR', 2015, CAST(3.4619128704 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2010, CAST(6.2285308837 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2011, CAST(6.3089151382 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2012, CAST(6.1259169578 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2013, CAST(6.3403444290 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2014, CAST(6.3634967803 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2015, CAST(6.4500880241 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2016, CAST(6.5128507614 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2017, CAST(6.3594508171 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2018, CAST(6.4670047760 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2019, CAST(6.5370898246 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2020, CAST(6.7510676383 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2021, CAST(6.2467441558 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2022, CAST(6.6071472167 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2023, CAST(6.6553516387 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TWN', 2024, CAST(6.5034999847 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2010, CAST(4.3806362152 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2011, CAST(4.2626714706 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2012, CAST(4.4965715408 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2013, CAST(4.9665212631 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2014, CAST(4.8961577415 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2015, CAST(5.1242108345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2016, CAST(5.1037211418 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2017, CAST(5.8292341232 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2018, CAST(5.4974689483 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2019, CAST(5.4640154838 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2020, CAST(5.3733987808 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2021, CAST(5.2868242263 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2022, CAST(5.1759152412 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2023, CAST(5.3794708251 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TJK', 2024, CAST(5.2807002067 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2010, CAST(3.2291290760 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2011, CAST(4.0735621452 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2012, CAST(4.0068974494 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2013, CAST(3.8523948192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2014, CAST(3.4832785129 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2015, CAST(3.6605973243 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2016, CAST(2.9027342796 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2017, CAST(3.3471212387 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2018, CAST(3.4450232982 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2019, CAST(3.6401548385 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2020, CAST(3.7856841087 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2021, CAST(3.6805679798 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2022, CAST(3.6158452033 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2023, CAST(4.0420284271 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TZA', 2024, CAST(3.7806000709 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2010, CAST(6.2167029380 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2011, CAST(6.6636090278 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2012, CAST(6.3002352714 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2013, CAST(6.2310247421 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2014, CAST(6.9854636192 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2015, CAST(6.2017626762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2016, CAST(6.0736398696 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2017, CAST(5.9388952255 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2018, CAST(6.0115618705 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2019, CAST(6.0221514701 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2020, CAST(5.8845443725 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2021, CAST(5.6380968093 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2022, CAST(6.0071172714 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2023, CAST(6.2823643684 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'THA', 2024, CAST(5.9760999679 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2011, CAST(2.9362208843 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2014, CAST(2.8389587402 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2015, CAST(3.7683019638 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2016, CAST(3.8785784244 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2017, CAST(4.3608050346 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2018, CAST(4.0228948593 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2019, CAST(4.1794939041 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2021, CAST(4.0365438461 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2022, CAST(4.2389822006 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2023, CAST(4.3649387359 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TGO', 2024, CAST(4.2140998840 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TTO', 2011, CAST(6.5187458992 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TTO', 2013, CAST(6.1677069664 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TTO', 2017, CAST(6.1918597221 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2010, CAST(5.1305208206 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2011, CAST(4.8764820098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2012, CAST(4.4635310173 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2013, CAST(5.2456049919 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2014, CAST(4.7635946273 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2015, CAST(5.1316118240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2016, CAST(4.5214533805 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2017, CAST(4.1243429183 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2018, CAST(4.7411322593 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2019, CAST(4.3154797554 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2020, CAST(4.7308111190 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2021, CAST(4.4994859695 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2022, CAST(4.2608680725 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2023, CAST(4.5051412582 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUN', 2024, CAST(4.4218001365 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2024, CAST(4.9752998352 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2010, CAST(5.4903473854 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2011, CAST(5.2719440460 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2012, CAST(5.3090763092 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2013, CAST(4.8881773948 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2014, CAST(5.5797944068 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2015, CAST(5.5144653320 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2016, CAST(5.3262219429 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2017, CAST(5.6072621345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2018, CAST(5.1856894493 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2019, CAST(4.8720736503 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2020, CAST(4.8615541458 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2021, CAST(4.3666396141 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2022, CAST(5.0934414863 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TUR', 2023, CAST(5.4627003669 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2011, CAST(5.7917547225 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2012, CAST(5.4638271331 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2013, CAST(5.3917627334 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2014, CAST(5.7873792648 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2015, CAST(5.7914600372 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2016, CAST(5.8870515823 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2017, CAST(5.2291488647 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2018, CAST(4.6206016540 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'TKM', 2019, CAST(5.4742999076 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2010, CAST(4.1928820610 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2011, CAST(4.8260011672 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2012, CAST(4.3092379570 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2013, CAST(3.7095787525 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2014, CAST(3.7699191570 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2015, CAST(4.2376866340 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2016, CAST(4.2332611083 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2017, CAST(4.0005168914 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2018, CAST(4.3217148780 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2019, CAST(4.9480514526 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2020, CAST(4.6409096717 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2021, CAST(4.2245335578 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2022, CAST(4.4246954917 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2023, CAST(4.4665188789 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UGA', 2024, CAST(4.3716998100 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2010, CAST(5.0575613975 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2011, CAST(5.0831327438 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2012, CAST(5.0303421020 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2013, CAST(4.7108025550 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2014, CAST(4.2973299026 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2015, CAST(3.9645428657 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2016, CAST(4.0286903381 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2017, CAST(4.3110671043 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2018, CAST(4.6619091033 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2019, CAST(4.7017621994 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2020, CAST(5.2696757316 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2021, CAST(5.3113551139 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2022, CAST(4.6374363899 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2023, CAST(4.6724448204 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UKR', 2024, CAST(4.8730001449 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2010, CAST(7.0974555015 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2011, CAST(7.1187014579 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2012, CAST(7.2177667617 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2013, CAST(6.6209511756 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2014, CAST(6.5398545265 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2015, CAST(6.5683975219 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2016, CAST(6.8309502601 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2017, CAST(7.0394196510 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2018, CAST(6.6037435531 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2019, CAST(6.7107825279 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2020, CAST(6.4583921432 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2021, CAST(6.7330675125 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2022, CAST(6.7376055717 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2023, CAST(6.7283840179 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ARE', 2024, CAST(6.7330999374 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2010, CAST(7.0293641090 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2011, CAST(6.8692488670 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2012, CAST(6.8807840347 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2013, CAST(6.9180550575 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2014, CAST(6.7581477165 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2015, CAST(6.5154452323 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2016, CAST(6.8242835998 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2017, CAST(7.1032733917 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2018, CAST(7.2334451675 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2019, CAST(7.1571512222 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2020, CAST(6.7981772422 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2021, CAST(6.8669619560 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2022, CAST(6.7217798233 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2023, CAST(6.6580429077 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'GBR', 2024, CAST(6.7490000724 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2010, CAST(7.1636161804 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2011, CAST(7.1151385307 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2012, CAST(7.0262269973 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2013, CAST(7.2492852210 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2014, CAST(7.1511144638 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2015, CAST(6.8639469146 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2016, CAST(6.8035998344 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2017, CAST(6.9917593002 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2018, CAST(6.8826847076 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2019, CAST(6.9437012672 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2020, CAST(7.0280880928 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2021, CAST(6.9590878486 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2022, CAST(6.6927900314 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2023, CAST(6.5208721160 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'USA', 2024, CAST(6.7248001098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2010, CAST(6.0620107650 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2011, CAST(6.5540471076 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2012, CAST(6.4497284889 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2013, CAST(6.4444646835 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2014, CAST(6.5614438056 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2015, CAST(6.6280803680 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2016, CAST(6.1714854240 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2017, CAST(6.3360099792 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2018, CAST(6.3717145919 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2019, CAST(6.6003370285 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2020, CAST(6.3096814155 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2021, CAST(6.5017004013 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2022, CAST(6.6708526611 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2023, CAST(6.6617217063 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'URY', 2024, CAST(6.6114997863 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2010, CAST(5.0953421592 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2011, CAST(5.7387442588 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2012, CAST(6.0193319320 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2013, CAST(5.9399862289 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2014, CAST(6.0492124557 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2015, CAST(5.9723644256 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2016, CAST(5.8925390243 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2017, CAST(6.4214477539 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2018, CAST(6.2054600715 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2019, CAST(6.1540493965 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2020, CAST(5.8419299125 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2021, CAST(6.1853079795 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2022, CAST(6.0162386894 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2023, CAST(6.3853607177 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'UZB', 2024, CAST(6.1950001716 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2010, CAST(7.4784545898 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2011, CAST(6.5797891616 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2012, CAST(7.0665774345 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2013, CAST(6.5527963638 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2014, CAST(6.1360964775 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2015, CAST(5.5688004493 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2016, CAST(4.0411148071 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2017, CAST(5.0707507133 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2018, CAST(5.0056633949 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2019, CAST(5.0808033943 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2020, CAST(4.5738296508 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2021, CAST(5.1075530052 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2022, CAST(5.9489922523 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2023, CAST(5.7653632164 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VEN', 2024, CAST(5.6066999435 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2010, CAST(5.2957806587 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2011, CAST(5.7673444747 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2012, CAST(5.5345697402 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2013, CAST(5.0226988792 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2014, CAST(5.0849232673 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2015, CAST(5.0763154029 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2016, CAST(5.0622673034 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2017, CAST(5.1752786636 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2018, CAST(5.2955470085 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2019, CAST(5.4674510955 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2020, CAST(5.4623417854 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2021, CAST(5.5402498245 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2022, CAST(6.2665085792 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2023, CAST(6.3251152038 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'VNM', 2024, CAST(6.0430002212 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2010, CAST(4.3503127098 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2011, CAST(3.7462556362 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2012, CAST(4.0606007575 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2013, CAST(4.2176785469 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2014, CAST(3.9679579734 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2015, CAST(2.9826738834 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2016, CAST(3.8256309032 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2017, CAST(3.2535600662 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2018, CAST(3.0575139522 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2019, CAST(4.1969127655 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2022, CAST(3.5903785228 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2023, CAST(3.5315735340 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'YEM', 2024, CAST(3.5610001087 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2011, CAST(4.9991135597 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2012, CAST(5.0133748054 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2013, CAST(5.2439956665 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2014, CAST(4.3458371162 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2015, CAST(4.8431644439 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2016, CAST(4.3475437164 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2017, CAST(3.9327774047 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2018, CAST(4.0414881706 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2019, CAST(3.3067965507 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2020, CAST(4.8379921913 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2021, CAST(3.0821549892 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2022, CAST(3.7280983924 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2023, CAST(3.6855680942 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZMB', 2024, CAST(3.5023999214 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2010, CAST(4.6815695762 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2011, CAST(4.8456416130 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2012, CAST(4.9551005363 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2013, CAST(4.6901879310 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2014, CAST(4.1844506263 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2015, CAST(3.7031912803 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2016, CAST(3.7354001998 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2017, CAST(3.6383001804 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2018, CAST(3.6164798736 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2019, CAST(2.6935231685 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2020, CAST(3.1598021984 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2021, CAST(3.1545782089 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2022, CAST(3.2962195873 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2023, CAST(3.5723862648 AS Decimal(38, 10)))
GO
INSERT [dbo].[Happiness] ([Country Code], [Year], [Happiness_Index]) VALUES (N'ZWE', 2024, CAST(3.3410999774 AS Decimal(38, 10)))
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2010, 100341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2011, 101288)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2012, 102112)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2013, 102880)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2014, 103594)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2015, 104257)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2016, 104874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2017, 105439)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2018, 105962)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2019, 106442)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2020, 106585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2021, 106537)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2022, 106445)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ABW', 2023, 106277)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2010, 523459657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2011, 537792950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2012, 552530654)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2013, 567892149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2014, 583651101)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2015, 600008424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2016, 616377605)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2017, 632746570)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2018, 649757148)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2019, 667242986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2020, 685112979)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2021, 702977106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2022, 720859132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFE', 2023, 739108306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2010, 28189672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2011, 29249157)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2012, 30466479)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2013, 31541209)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2014, 32716210)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2015, 33753499)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2016, 34636207)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2017, 35643418)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2018, 36686784)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2019, 37769499)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2020, 38972230)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2021, 40099462)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2022, 41128771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFG', 2023, 42239854)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2010, 356337762)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2011, 366489204)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2012, 376797999)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2013, 387204553)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2014, 397855507)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2015, 408690375)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2016, 419778384)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2017, 431138704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2018, 442646825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2019, 454306063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2020, 466189102)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2021, 478185907)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2022, 490330870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AFW', 2023, 502789511)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2010, 23364185)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2011, 24259111)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2012, 25188292)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2013, 26147002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2014, 27128337)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2015, 28127721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2016, 29154746)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2017, 30208628)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2018, 31273533)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2019, 32353588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2020, 33428486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2021, 34503774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2022, 35588987)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AGO', 2023, 36684202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2010, 2913021)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2011, 2905195)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2012, 2900401)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2013, 2895092)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2014, 2889104)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2015, 2880703)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2016, 2876101)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2017, 2873457)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2018, 2866376)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2019, 2854191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2020, 2837849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2021, 2811666)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2022, 2777689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ALB', 2023, 2745972)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2010, 71519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2011, 70567)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2012, 71013)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2013, 71367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2014, 71621)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2015, 71746)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2016, 72540)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2017, 73837)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2018, 75013)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2019, 76343)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2020, 77700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2021, 79034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2022, 79824)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AND', 2023, 80088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2010, 364427661)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2011, 372351065)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2012, 380383408)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2013, 389131555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2014, 397922915)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2015, 406501999)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2016, 415077960)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2017, 423664839)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2018, 432545676)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2019, 441467739)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2020, 449228296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2021, 456520777)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2022, 464684914)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARB', 2023, 473272080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2010, 8481771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2011, 8575205)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2012, 8664969)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2013, 8751847)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2014, 8835951)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2015, 8916899)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2016, 8994263)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2017, 9068296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2018, 9140169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2019, 9211657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2020, 9287289)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2021, 9365145)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2022, 9441129)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARE', 2023, 9516871)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2010, 40788453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2011, 41261490)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2012, 41733271)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2013, 42202935)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2014, 42669500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2015, 43131966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2016, 43590368)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2017, 44044811)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2018, 44494502)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2019, 44938712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2020, 45376763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2021, 45808747)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2022, 46234830)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARG', 2023, 46654581)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2010, 2946293)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2011, 2928976)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2012, 2914421)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2013, 2901385)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2014, 2889930)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2015, 2878595)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2016, 2865835)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2017, 2851923)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2018, 2836557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2019, 2820602)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2020, 2805608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2021, 2790974)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2022, 2780469)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ARM', 2023, 2777970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2010, 54849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2011, 54310)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2012, 53691)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2013, 52995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2014, 52217)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2015, 51368)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2016, 50448)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2017, 49463)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2018, 48424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2019, 47321)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2020, 46189)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2021, 45035)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2022, 44273)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ASM', 2023, 43914)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2010, 85695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2011, 86729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2012, 87674)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2013, 88497)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2014, 89236)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2015, 89941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2016, 90564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2017, 91119)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2018, 91626)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2019, 92117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2020, 92664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2021, 93219)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2022, 93763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ATG', 2023, 94298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2010, 22031750)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2011, 22340024)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2012, 22733465)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2013, 23128129)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2014, 23475686)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2015, 23815995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2016, 24190907)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2017, 24592588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2018, 24963258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2019, 25334826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2020, 25649248)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2021, 25685412)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2022, 26014399)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUS', 2023, 26638544)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2010, 8363404)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2011, 8391643)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2012, 8429991)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2013, 8479823)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2014, 8546356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2015, 8642699)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2016, 8736668)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2017, 8797566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2018, 8840521)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2019, 8879920)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2020, 8916864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2021, 8955797)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2022, 9041851)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AUT', 2023, 9132383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2010, 9054332)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2011, 9173082)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2012, 9295784)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2013, 9416801)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2014, 9535079)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2015, 9649341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2016, 9757812)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2017, 9854033)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2018, 9939771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2019, 10024283)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2020, 10093121)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2021, 10137750)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2022, 10141756)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'AZE', 2023, 10112555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2010, 9126605)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2011, 9455733)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2012, 9795479)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2013, 10149577)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2014, 10494913)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2015, 10727148)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2016, 10903327)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2017, 11155593)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2018, 11493472)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2019, 11874838)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2020, 12220227)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2021, 12551213)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2022, 12889576)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BDI', 2023, 13238559)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2010, 10895586)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2011, 11038264)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2012, 11106932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2013, 11159407)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2014, 11209057)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2015, 11274196)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2016, 11331422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2017, 11375158)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2018, 11427054)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2019, 11488980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2020, 11538604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2021, 11586195)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2022, 11685814)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEL', 2023, 11822592)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2010, 9445710)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2011, 9726380)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2012, 10014078)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2013, 10308730)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2014, 10614844)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2015, 10932783)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2016, 11260085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2017, 11596779)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2018, 11940683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2019, 12290444)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2020, 12643123)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2021, 12996895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2022, 13352864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BEN', 2023, 13712828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2010, 16116845)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2011, 16602651)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2012, 17113732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2013, 17636408)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2014, 18169842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2015, 18718019)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2016, 19275498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2017, 19835858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2018, 20392723)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2019, 20951639)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2020, 21522626)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2021, 22100683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2022, 22673762)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BFA', 2023, 23251485)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2010, 148391139)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2011, 150211005)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2012, 152090649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2013, 154030139)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2014, 155961299)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2015, 157830000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2016, 159784568)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2017, 161793964)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2018, 163683958)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2019, 165516222)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2020, 167420951)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2021, 169356251)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2022, 171186372)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGD', 2023, 172954319)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2010, 7395599)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2011, 7348328)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2012, 7305888)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2013, 7265115)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2014, 7223938)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2015, 7177991)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2016, 7127822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2017, 7075947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2018, 7025037)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2019, 6975761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2020, 6934015)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2021, 6877743)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2022, 6465097)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BGR', 2023, 6430370)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2010, 1213645)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2011, 1212077)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2012, 1224939)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2013, 1261673)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2014, 1311134)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2015, 1362142)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2016, 1409661)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2017, 1456834)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2018, 1487340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2019, 1494188)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2020, 1477469)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2021, 1463265)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2022, 1472233)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHR', 2023, 1485509)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2010, 373272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2011, 377950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2012, 382061)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2013, 385650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2014, 389131)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2015, 392697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2016, 395976)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2017, 399020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2018, 401906)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2019, 404557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2020, 406471)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2021, 407906)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2022, 409984)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BHS', 2023, 412623)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2010, 3811088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2011, 3743142)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2012, 3674374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2013, 3617559)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2014, 3571068)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2015, 3524324)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2016, 3480986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2017, 3440027)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2018, 3400129)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2019, 3360711)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2020, 3318407)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2021, 3270943)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2022, 3233526)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BIH', 2023, 3210847)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2010, 9483836)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2011, 9461643)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2012, 9446836)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2013, 9443211)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2014, 9448515)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2015, 9461076)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2016, 9469379)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2017, 9458989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2018, 9438785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2019, 9419758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2020, 9379952)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2021, 9302585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2022, 9228071)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLR', 2023, 9178298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2010, 322106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2011, 329538)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2012, 337059)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2013, 344688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2014, 352335)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2015, 359871)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2016, 367313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2017, 374693)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2018, 382066)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2019, 389095)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2020, 394921)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2021, 400031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2022, 405272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BLZ', 2023, 410825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2010, 65124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2011, 64564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2012, 64798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2013, 65001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2014, 65138)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2015, 65237)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2016, 64554)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2017, 63873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2018, 63918)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2019, 63911)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2020, 63893)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2021, 63764)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2022, 63595)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BMU', 2023, 63489)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2010, 10223270)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2011, 10396246)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2012, 10569697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2013, 10743349)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2014, 10916987)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2015, 11090085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2016, 11263015)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2017, 11435533)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2018, 11606905)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2019, 11777315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2020, 11936162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2021, 12079472)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2022, 12224110)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BOL', 2023, 12388571)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2010, 196353492)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2011, 198185302)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2012, 199977707)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2013, 201721767)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2014, 203459650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2015, 205188205)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2016, 206859578)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2017, 208504960)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2018, 210166592)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2019, 211782878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2020, 213196304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2021, 214326223)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2022, 215313498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRA', 2023, 216422446)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2010, 274711)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2011, 275486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2012, 276197)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2013, 276865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2014, 277493)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2015, 278083)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2016, 278649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2017, 279187)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2018, 279688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2019, 280180)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2020, 280693)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2021, 281200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2022, 281635)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRB', 2023, 281995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2010, 396053)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2011, 401506)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2012, 406634)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2013, 411702)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2014, 416656)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2015, 421437)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2016, 425994)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2017, 430276)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2018, 434274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2019, 438048)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2020, 441725)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2021, 445373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2022, 449002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BRN', 2023, 452524)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2010, 705516)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2011, 713331)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2012, 721145)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2013, 728889)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2014, 736357)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2015, 743274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2016, 749761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2017, 756121)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2018, 762096)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2019, 767459)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2020, 772506)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2021, 777486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2022, 782455)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BTN', 2023, 787424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2010, 2091664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2011, 2134037)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2012, 2175425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2013, 2217278)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2014, 2260376)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2015, 2305171)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2016, 2352416)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2017, 2401840)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2018, 2451409)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2019, 2499702)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2020, 2546402)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2021, 2588423)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2022, 2630296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'BWA', 2023, 2675352)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2010, 4660067)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2011, 4732022)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2012, 4773306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2013, 4802428)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2014, 4798734)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2015, 4819333)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2016, 4904177)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2017, 4996741)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2018, 5094780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2019, 5209324)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2020, 5343020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2021, 5457154)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2022, 5579144)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAF', 2023, 5742315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2010, 34005902)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2011, 34339221)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2012, 34713395)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2013, 35080992)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2014, 35434066)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2015, 35704498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2016, 36110803)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2017, 36545075)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2018, 37072620)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2019, 37618495)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2020, 38028638)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2021, 38239864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2022, 38939056)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CAN', 2023, 40097761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2010, 104421447)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2011, 104174038)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2012, 103935318)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2013, 103713726)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2014, 103496179)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2015, 103257886)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2016, 102994278)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2017, 102740078)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2018, 102538451)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2019, 102398537)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2020, 102180124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2021, 101413157)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2022, 100108262)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CEB', 2023, 100156608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2010, 7824909)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2011, 7912398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2012, 7996861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2013, 8089346)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2014, 8188649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2015, 8282396)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2016, 8373338)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2017, 8451840)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2018, 8514329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2019, 8575280)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2020, 8638167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2021, 8704546)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2022, 8775760)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHE', 2023, 8849852)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2010, 156933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2011, 157819)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2012, 158621)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2013, 159794)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2014, 160912)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2015, 162190)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2016, 163721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2017, 165215)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2018, 167259)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2019, 169410)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2020, 171113)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2021, 172683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2022, 174079)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHI', 2023, 175346)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2010, 17004162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2011, 17173573)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2012, 17341771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2013, 17509925)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2014, 17687108)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2015, 17870124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2016, 18083879)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2017, 18368577)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2018, 18701450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2019, 19039485)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2020, 19300315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2021, 19493184)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2022, 19603733)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHL', 2023, 19629590)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2010, 1337705000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2011, 1345035000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2012, 1354190000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2013, 1363240000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2014, 1371860000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2015, 1379860000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2016, 1387790000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2017, 1396215000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2018, 1402760000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2019, 1407745000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2020, 1411100000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2021, 1412360000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2022, 1412175000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CHN', 2023, 1410710000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2010, 21120042)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2011, 21562914)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2012, 22010712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2013, 22469268)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2014, 22995555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2015, 23596741)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2016, 24213622)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2017, 24848016)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2018, 25493988)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2019, 26147551)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2020, 26811790)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2021, 27478249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2022, 28160542)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CIV', 2023, 28873034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2010, 19878036)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2011, 20448873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2012, 21032684)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2013, 21632850)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2014, 22299585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2015, 23012646)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2016, 23711630)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2017, 24393181)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2018, 25076747)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2019, 25782341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2020, 26491087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2021, 27198628)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2022, 27914536)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CMR', 2023, 28647293)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2010, 66391257)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2011, 68654269)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2012, 70997870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2013, 73460021)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2014, 76035588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2015, 78656904)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2016, 81430977)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2017, 84283273)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2018, 87087355)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2019, 89906890)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2020, 92853164)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2021, 95894118)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2022, 99010212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COD', 2023, 102262808)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2010, 4437884)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2011, 4584216)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2012, 4713257)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2013, 4828066)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2014, 4944861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2015, 5064386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2016, 5186824)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2017, 5312340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2018, 5441062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2019, 5570733)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2020, 5702174)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2021, 5835806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2022, 5970424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COG', 2023, 6106869)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2010, 44816108)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2011, 45308899)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2012, 45782417)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2013, 46237930)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2014, 46677947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2015, 47119728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2016, 47625955)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2017, 48351671)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2018, 49276961)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2019, 50187406)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2020, 50930662)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2021, 51516562)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2022, 51874024)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COL', 2023, 52085168)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2010, 656024)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2011, 670071)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2012, 684553)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2013, 699393)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2014, 714612)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2015, 730216)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2016, 746232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2017, 761664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2018, 776313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2019, 790986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2020, 806166)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2021, 821625)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2022, 836774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'COM', 2023, 852075)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2010, 521212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2011, 527521)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2012, 533864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2013, 539940)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2014, 546076)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2015, 552166)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2016, 558394)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2017, 564954)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2018, 571202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2019, 577030)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2020, 582640)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2021, 587925)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2022, 593149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CPV', 2023, 598682)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2010, 4622252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2011, 4679926)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2012, 4736593)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2013, 4791535)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2014, 4844288)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2015, 4895242)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2016, 4945205)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2017, 4993842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2018, 5040734)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2019, 5084532)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2020, 5123105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2021, 5153957)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2022, 5180829)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CRI', 2023, 5212173)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2010, 2860236)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2011, 2878168)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2012, 2898802)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2013, 2922026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2014, 2945840)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2015, 2969980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2016, 2993247)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2017, 3016651)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2018, 3058106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2019, 3090374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2020, 3106185)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2021, 3128519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2022, 3147057)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CSS', 2023, 3167738)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2010, 11290417)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2011, 11298710)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2012, 11309290)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2013, 11321579)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2014, 11332026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2015, 11339894)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2016, 11342012)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2017, 11336405)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2018, 11328244)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2019, 11316697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2020, 11300698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2021, 11256372)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2022, 11212191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUB', 2023, 11194449)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2010, 148703)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2011, 150831)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2012, 152088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2013, 153822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2014, 155909)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2015, 157980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2016, 159664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2017, 160175)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2018, 159336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2019, 157441)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2020, 154947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2021, 152369)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2022, 149996)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CUW', 2023, 147862)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2010, 54074)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2011, 55492)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2012, 56860)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2013, 58212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2014, 59559)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2015, 60911)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2016, 62255)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2017, 63581)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2018, 64884)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2019, 66134)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2020, 67311)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2021, 68136)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2022, 68706)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYM', 2023, 69310)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2010, 1129686)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2011, 1145086)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2012, 1156556)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2013, 1166968)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2014, 1176995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2015, 1187280)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2016, 1197881)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2017, 1208523)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2018, 1218831)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2019, 1228836)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2020, 1237537)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2021, 1244188)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2022, 1251488)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CYP', 2023, 1260138)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2010, 10474410)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2011, 10496088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2012, 10510785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2013, 10514272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2014, 10525347)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2015, 10546059)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2016, 10566332)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2017, 10594438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2018, 10629928)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2019, 10671870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2020, 10697858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2021, 10505772)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2022, 10672118)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'CZE', 2023, 10873689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2010, 81776930)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2011, 80274983)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2012, 80425823)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2013, 80645605)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2014, 80982500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2015, 81686611)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2016, 82348669)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2017, 82657002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2018, 82905782)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2019, 83092962)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2020, 83160871)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2021, 83196078)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2022, 83797985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DEU', 2023, 84482267)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2010, 919199)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2011, 936811)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2012, 954297)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2013, 971753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2014, 989087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2015, 1006259)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2016, 1023261)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2017, 1040233)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2018, 1057198)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2019, 1073994)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2020, 1090156)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2021, 1105557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2022, 1120849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DJI', 2023, 1136455)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2010, 68755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2011, 68742)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2012, 68888)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2013, 68819)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2014, 69371)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2015, 70007)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2016, 70075)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2017, 70403)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2018, 70823)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2019, 71428)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2020, 71995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2021, 72412)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2022, 72737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DMA', 2023, 73040)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2010, 5547683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2011, 5570572)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2012, 5591572)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2013, 5614932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2014, 5643475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2015, 5683483)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2016, 5728010)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2017, 5764980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2018, 5793636)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2019, 5814422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2020, 5831404)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2021, 5856733)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2022, 5903037)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DNK', 2023, 5946952)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2010, 9775755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2011, 9903737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2012, 10030882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2013, 10157051)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2014, 10282115)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2015, 10405832)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2016, 10527592)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2017, 10647244)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2018, 10765531)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2019, 10881882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2020, 10999664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2021, 11117873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2022, 11228821)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DOM', 2023, 11332972)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2010, 35856344)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2011, 36543541)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2012, 37260563)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2013, 38000626)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2014, 38760168)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2015, 39543154)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2016, 40339329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2017, 41136546)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2018, 41927007)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2019, 42705368)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2020, 43451666)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2021, 44177969)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2022, 44903225)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'DZA', 2023, 45606480)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2010, 1969168373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2011, 1984249541)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2012, 2001246209)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2013, 2018050656)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2014, 2034247084)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2015, 2049740052)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2016, 2065155186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2017, 2080901482)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2018, 2094506990)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2019, 2106374009)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2020, 2116360715)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2021, 2123610397)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2022, 2129094071)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAP', 2023, 2133652241)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2010, 2946285613)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2011, 2991403487)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2012, 3035159632)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2013, 3078407213)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2014, 3121656203)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2015, 3165214886)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2016, 3208369547)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2017, 3250752755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2018, 3292896609)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2019, 3334561751)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2020, 3374383528)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2021, 3411268373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2022, 3447398652)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAR', 2023, 3486290439)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2010, 2210203758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2011, 2225992094)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2012, 2243776727)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2013, 2261274500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2014, 2278232287)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2015, 2294507020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2016, 2310721864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2017, 2327132966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2018, 2341383691)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2019, 2353856866)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2020, 2363934334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2021, 2370214403)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2022, 2375208613)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EAS', 2023, 2380601170)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2010, 228742156)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2011, 230906639)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2012, 232735642)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2013, 234709774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2014, 236718663)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2015, 238848390)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2016, 240976831)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2017, 243006453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2018, 245052675)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2019, 247195931)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2020, 248913167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2021, 250663105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2022, 246915820)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECA', 2023, 247474425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2010, 889077806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2011, 891273900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2012, 894705970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2013, 898764759)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2014, 902938502)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2015, 907094808)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2016, 911173722)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2017, 914748588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2018, 918181600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2019, 921212388)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2020, 923384672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2021, 924168763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2022, 920988359)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECS', 2023, 923929755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2010, 14989585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2011, 15237728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2012, 15483883)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2013, 15722989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2014, 15957994)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2015, 16195902)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2016, 16439585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2017, 16696944)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2018, 17015672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2019, 17343740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2020, 17588595)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2021, 17797737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2022, 18001000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ECU', 2023, 18190484)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2010, 87252413)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2011, 89200054)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2012, 91240376)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2013, 93377890)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2014, 95592324)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2015, 97723799)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2016, 99784030)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2017, 101789386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2018, 103740765)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2019, 105618671)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2020, 107465134)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2021, 109262178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2022, 110990103)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EGY', 2023, 112716598)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2010, 340467048)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2011, 339722971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2012, 340450693)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2013, 341584506)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2014, 342725321)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2015, 343718279)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2016, 344683796)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2017, 345370612)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2018, 346153001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2019, 346517987)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2020, 346961127)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2021, 346942960)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2022, 348331552)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EMU', 2023, 350357398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2010, 3147727)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2011, 3207570)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2012, 3252596)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2013, 3296367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2014, 3323425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2015, 3340006)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2016, 3365287)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2017, 3396933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2018, 3445374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2019, 3498818)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2020, 3555868)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2021, 3620312)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2022, 3684032)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ERI', 2023, 3748901)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2010, 46576897)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2011, 46742697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2012, 46773055)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2013, 46620045)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2014, 46480882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2015, 46444832)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2016, 46484062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2017, 46593236)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2018, 46797754)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2019, 47134837)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2020, 47365655)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2021, 47415794)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2022, 47778340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ESP', 2023, 48373336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2010, 1331475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2011, 1327439)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2012, 1322696)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2013, 1317997)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2014, 1314545)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2015, 1315407)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2016, 1315790)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2017, 1317384)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2018, 1321977)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2019, 1326898)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2020, 1329522)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2021, 1330932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2022, 1348840)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EST', 2023, 1366188)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2010, 89237791)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2011, 91817929)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2012, 94451280)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2013, 97084366)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2014, 99746766)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2015, 102471895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2016, 105293228)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2017, 108197950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2018, 111129438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2019, 114120594)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2020, 117190911)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2021, 120283026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2022, 123379924)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ETH', 2023, 126527060)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2010, 441552554)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2011, 440769682)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2012, 441419873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2013, 442496175)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2014, 443601373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2015, 444570054)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2016, 445515422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2017, 446215182)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2018, 447001100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2019, 447367191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2020, 447692315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2021, 447178093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2022, 447370551)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'EUU', 2023, 449476878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2010, 778734290)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2011, 797793348)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2012, 817412582)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2013, 837410155)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2014, 857018106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2015, 876449625)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2016, 896306261)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2017, 916477490)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2018, 936789597)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2019, 957873862)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2020, 979839336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2021, 1001870564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2022, 1019145355)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FCS', 2023, 1042703808)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2010, 5363352)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2011, 5388272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2012, 5413971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2013, 5438972)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2014, 5461512)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2015, 5479531)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2016, 5495303)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2017, 5508214)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2018, 5515525)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2019, 5521606)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2020, 5529543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2021, 5541017)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2022, 5556106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FIN', 2023, 5584264)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2010, 905169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2011, 908355)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2012, 911059)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2013, 913453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2014, 915560)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2015, 917200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2016, 918371)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2017, 919019)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2018, 918996)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2019, 918465)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2020, 920422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2021, 924610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2022, 929766)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FJI', 2023, 936375)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2010, 65030575)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2011, 65345233)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2012, 65662240)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2013, 66002289)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2014, 66312067)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2015, 66548272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2016, 66724104)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2017, 66918020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2018, 67158348)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2019, 67388001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2020, 67571107)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2021, 67764304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2022, 67971311)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRA', 2023, 68170228)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2010, 48410)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2011, 48386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2012, 48392)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2013, 48418)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2014, 48465)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2015, 48816)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2016, 49500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2017, 50230)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2018, 50955)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2019, 51681)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2020, 52415)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2021, 52889)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2022, 53090)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FRO', 2023, 53270)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2010, 107588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2011, 107887)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2012, 108232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2013, 108609)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2014, 109024)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2015, 109462)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2016, 109925)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2017, 110430)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2018, 110929)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2019, 111379)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2020, 112106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2021, 113131)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2022, 114164)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'FSM', 2023, 115224)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2010, 1711105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2011, 1772500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2012, 1836705)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2013, 1902226)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2014, 1966855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2015, 2028517)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2016, 2086206)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2017, 2140215)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2018, 2192012)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2019, 2242785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2020, 2292573)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2021, 2341179)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2022, 2388992)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GAB', 2023, 2436566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2010, 62766365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2011, 63258810)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2012, 63700215)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2013, 64128273)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2014, 64602298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2015, 65116219)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2016, 65611593)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2017, 66058859)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2018, 66460344)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2019, 66836327)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2020, 67081234)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2021, 67026292)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2022, 67791000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GBR', 2023, 68350000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2010, 3786695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2011, 3756441)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2012, 3728874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2013, 3717668)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2014, 3719414)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2015, 3725276)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2016, 3727505)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2017, 3728004)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2018, 3726549)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2019, 3720161)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2020, 3722716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2021, 3708610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2022, 3712502)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GEO', 2023, 3760365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2010, 25574719)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2011, 26205941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2012, 26858762)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2013, 27525597)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2014, 28196358)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2015, 28870939)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2016, 29554303)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2017, 30222262)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2018, 30870641)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2019, 31522290)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2020, 32180401)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2021, 32833031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2022, 33475870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GHA', 2023, 34121985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2010, 31262)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2011, 31701)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2012, 32160)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2013, 32411)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2014, 32452)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2015, 32520)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2016, 32565)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2017, 32602)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2018, 32648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2019, 32685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2020, 32709)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2021, 32669)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2022, 32649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIB', 2023, 32688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2010, 10270728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2011, 10527712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2012, 10788692)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2013, 11055430)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2014, 11333365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2015, 11625998)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2016, 11930985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2017, 12240789)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2018, 12554864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2019, 12877539)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2020, 13205153)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2021, 13531906)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2022, 13859341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GIN', 2023, 14190612)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2010, 1937275)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2011, 1998212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2012, 2061014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2013, 2124869)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2014, 2189019)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2015, 2253133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2016, 2317206)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2017, 2381182)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2018, 2444916)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2019, 2508883)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2020, 2573995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2021, 2639916)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2022, 2705992)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GMB', 2023, 2773168)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2010, 1567220)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2011, 1609017)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2012, 1652717)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2013, 1697753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2014, 1743309)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2015, 1788919)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2016, 1834552)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2017, 1879826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2018, 1924955)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2019, 1970457)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2020, 2015828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2021, 2060721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2022, 2105566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNB', 2023, 2150842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2010, 1094524)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2011, 1144588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2012, 1193636)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2013, 1243941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2014, 1295183)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2015, 1346973)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2016, 1398927)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2017, 1450694)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2018, 1502091)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2019, 1553031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2020, 1596049)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2021, 1634466)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2022, 1674908)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GNQ', 2023, 1714671)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2010, 11121341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2011, 11104899)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2012, 11045011)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2013, 10965211)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2014, 10892413)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2015, 10820883)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2016, 10775971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2017, 10754679)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2018, 10732882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2019, 10721582)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2020, 10698599)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2021, 10569207)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2022, 10426919)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRC', 2023, 10361295)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2010, 114039)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2011, 114918)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2012, 115912)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2013, 116945)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2014, 117972)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2015, 118980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2016, 119966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2017, 120921)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2018, 121838)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2019, 122724)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2020, 123663)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2021, 124610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2022, 125438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRD', 2023, 126183)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2010, 56905)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2011, 56890)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2012, 56810)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2013, 56483)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2014, 56295)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2015, 56114)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2016, 56186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2017, 56172)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2018, 56023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2019, 56225)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2020, 56367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2021, 56653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2022, 56661)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GRL', 2023, 56865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2010, 14259687)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2011, 14521515)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2012, 14781942)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2013, 15043981)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2014, 15306316)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2015, 15567419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2016, 15827690)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2017, 16087418)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2018, 16346950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2019, 16604026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2020, 16858333)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2021, 17109746)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2022, 17357886)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GTM', 2023, 17602431)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2010, 164905)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2011, 165649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2012, 166392)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2013, 167054)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2014, 167543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2015, 167978)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2016, 168346)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2017, 168606)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2018, 168678)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2019, 168624)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2020, 169231)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2021, 170534)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2022, 171774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUM', 2023, 172952)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2010, 747932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2011, 744230)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2012, 743966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2013, 747420)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2014, 751115)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2015, 755031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2016, 759087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2017, 763252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2018, 785514)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2019, 798753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2020, 797202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2021, 804567)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2022, 808726)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'GUY', 2023, 813834)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2010, 1330723736)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2011, 1335858758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2012, 1342743557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2013, 1349905020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2014, 1357161865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2015, 1364282269)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2016, 1371516373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2017, 1377929189)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2018, 1383955367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2019, 1389172209)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2020, 1393950970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2021, 1392964458)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2022, 1395940386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HIC', 2023, 1403021503)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2010, 7024200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2011, 7071600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2012, 7150100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2013, 7178900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2014, 7229500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2015, 7291300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2016, 7336600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2017, 7393200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2018, 7452600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2019, 7507900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2020, 7481000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2021, 7413100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2022, 7346100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HKG', 2023, 7536100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2010, 8450933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2011, 8622504)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2012, 8792367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2013, 8960657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2014, 9127846)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2015, 9294505)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2016, 9460798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2017, 9626842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2018, 9792850)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2019, 9958829)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2020, 10121763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2021, 10278345)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2022, 10432860)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HND', 2023, 10593798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2010, 630953183)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2011, 648927117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2012, 667520863)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2013, 686620331)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2014, 706617213)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2015, 727129254)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2016, 748356635)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2017, 770390212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2018, 792615894)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2019, 815100831)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2020, 838066650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2021, 861156745)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2022, 884288332)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HPC', 2023, 907995430)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2010, 4295427)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2011, 4280622)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2012, 4267558)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2013, 4255689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2014, 4238389)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2015, 4203604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2016, 4174349)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2017, 4124531)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2018, 4087843)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2019, 4065253)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2020, 4047680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2021, 3878981)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2022, 3855641)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HRV', 2023, 3853200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2010, 9842880)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2011, 9954312)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2012, 10108539)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2013, 10261206)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2014, 10412740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2015, 10563757)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2016, 10713849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2017, 10863543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2018, 11012421)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2019, 11160438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2020, 11306801)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2021, 11447569)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2022, 11584996)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HTI', 2023, 11724763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2010, 10000023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2011, 9971727)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2012, 9920362)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2013, 9893082)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2014, 9866468)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2015, 9843028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2016, 9814023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2017, 9787966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2018, 9775564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2019, 9771141)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2020, 9750149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2021, 9709891)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2022, 9643048)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'HUN', 2023, 9589872)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2010, 4424528755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2011, 4469961043)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2012, 4517846874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2013, 4566948798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2014, 4615651856)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2015, 4662836842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2016, 4708313438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2017, 4752675645)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2018, 4794094269)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2019, 4832585266)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2020, 4866828116)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2021, 4894666421)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2022, 4912348798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBD', 2023, 4937047867)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2010, 5838903143)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2011, 5917936328)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2012, 5998753810)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2013, 6079936045)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2014, 6160835364)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2015, 6240908648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2016, 6320624467)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2017, 6400602851)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2018, 6478776303)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2019, 6555193386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2020, 6628629499)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2021, 6696373761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2022, 6754104791)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IBT', 2023, 6819750360)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2010, 1414374388)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2011, 1447975285)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2012, 1480906936)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2013, 1512987247)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2014, 1545183508)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2015, 1578071806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2016, 1612311029)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2017, 1647927206)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2018, 1684682034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2019, 1722608120)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2020, 1761801383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2021, 1801707340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2022, 1841755993)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDA', 2023, 1882702493)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2010, 474626536)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2011, 486354807)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2012, 497317025)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2013, 507906365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2014, 518378284)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2015, 528669692)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2016, 538868249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2017, 549511044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2018, 560698093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2019, 572192040)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2020, 584212703)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2021, 596608333)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2022, 609342910)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDB', 2023, 622553200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2010, 244016173)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2011, 247099697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2012, 250222695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2013, 253275918)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2014, 256229761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2015, 259091970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2016, 261850182)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2017, 264498852)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2018, 267066843)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2019, 269582878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2020, 271857970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2021, 273753191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2022, 275501339)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDN', 2023, 277534122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2010, 939747852)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2011, 961620478)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2012, 983589911)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2013, 1005080882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2014, 1026805224)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2015, 1049402114)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2016, 1073442780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2017, 1098416162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2018, 1123983941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2019, 1150416080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2020, 1177588680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2021, 1205099007)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2022, 1232413083)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IDX', 2023, 1260149293)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2010, 83828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2011, 84350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2012, 84338)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2013, 84144)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2014, 83896)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2015, 83593)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2016, 83450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2017, 83580)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2018, 83775)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2019, 83933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2020, 84046)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2021, 84263)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2022, 84519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IMN', 2023, 84710)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2010, 1240613620)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2011, 1257621191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2012, 1274487215)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2013, 1291132063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2014, 1307246509)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2015, 1322866505)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2016, 1338636340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2017, 1354195680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2018, 1369003306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2019, 1383112050)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2020, 1396387127)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2021, 1407563842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2022, 1417173173)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IND', 2023, 1428627663)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2010, 4560155)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2011, 4580084)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2012, 4599533)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2013, 4623816)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2014, 4657740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2015, 4701957)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2016, 4755335)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2017, 4807388)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2018, 4867316)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2019, 4934340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2020, 4985382)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2021, 5033164)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2022, 5127170)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRL', 2023, 5262382)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2010, 75373855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2011, 76342971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2012, 77324451)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2013, 78458928)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2014, 79961672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2015, 81790841)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2016, 83306231)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2017, 84505076)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2018, 85617562)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2019, 86564202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2020, 87290193)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2021, 87923432)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2022, 88550570)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRN', 2023, 89172767)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2010, 31264875)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2011, 32378061)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2012, 33864447)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2013, 35481800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2014, 36746488)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2015, 37757813)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2016, 38697943)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2017, 39621162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2018, 40590700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2019, 41563520)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2020, 42556984)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2021, 43533592)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2022, 44496122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'IRQ', 2023, 45504560)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2010, 318041)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2011, 319014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2012, 320716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2013, 323764)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2014, 327386)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2015, 330815)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2016, 335439)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2017, 343400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2018, 352721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2019, 360563)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2020, 366463)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2021, 372520)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2022, 382003)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISL', 2023, 393600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2010, 7623600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2011, 7765800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2012, 7910500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2013, 8059500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2014, 8215700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2015, 8380100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2016, 8546000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2017, 8713300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2018, 8882800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2019, 9054000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2020, 9215100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2021, 9371400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2022, 9557500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ISR', 2023, 9756700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2010, 59277417)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2011, 59379449)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2012, 59539717)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2013, 60233948)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2014, 60789140)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2015, 60730582)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2016, 60627498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2017, 60536709)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2018, 60421760)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2019, 59729081)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2020, 59438851)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2021, 59133173)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2022, 58940425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ITA', 2023, 58761146)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2010, 2733896)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2011, 2746169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2012, 2759817)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2013, 2773129)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2014, 2784543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2015, 2794445)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2016, 2802695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2017, 2808376)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2018, 2811835)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2019, 2813773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2020, 2820436)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2021, 2827695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2022, 2827377)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JAM', 2023, 2825544)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2010, 6931258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2011, 7109980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2012, 7211863)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2013, 7694814)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2014, 8658026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2015, 9494246)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2016, 9964656)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2017, 10215381)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2018, 10459865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2019, 10698683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2020, 10928721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2021, 11148278)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2022, 11285869)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JOR', 2023, 11337052)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2010, 128070000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2011, 127833000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2012, 127629000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2013, 127445000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2014, 127276000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2015, 127141000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2016, 127076000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2017, 126972000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2018, 126811000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2019, 126633000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2020, 126261000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2021, 125681593)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2022, 125124989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'JPN', 2023, 124516650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2010, 16321872)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2011, 16557202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2012, 16792090)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2013, 17035551)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2014, 17288285)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2015, 17542806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2016, 17794055)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2017, 18037776)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2018, 18276452)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2019, 18513673)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2020, 18755666)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2021, 19191356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2022, 19634983)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KAZ', 2023, 19900177)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2010, 41517895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2011, 42635144)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2012, 43725806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2013, 44792368)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2014, 45831863)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2015, 46851488)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2016, 47894670)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2017, 48948137)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2018, 49953304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2019, 50951450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2020, 51985780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2021, 53005614)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2022, 54027487)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KEN', 2023, 55100586)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2010, 5447900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2011, 5514600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2012, 5607200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2013, 5719600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2014, 5835500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2015, 5956900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2016, 6079500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2017, 6198200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2018, 6322800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2019, 6456200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2020, 6579900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2021, 6773400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2022, 6974900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KGZ', 2023, 7100800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2010, 14363532)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2011, 14573885)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2012, 14786640)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2013, 14999683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2014, 15210817)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2015, 15417523)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2016, 15624584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2017, 15830689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2018, 16025238)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2019, 16207746)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2020, 16396860)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2021, 16589023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2022, 16767842)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KHM', 2023, 16944826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2010, 107995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2011, 109871)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2012, 111618)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2013, 113311)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2014, 114985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2015, 116707)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2016, 118513)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2017, 120362)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2018, 122261)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2019, 124241)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2020, 126463)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2021, 128874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2022, 131232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KIR', 2023, 133515)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2010, 47403)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2011, 47581)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2012, 47727)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2013, 47767)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2014, 47789)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2015, 47790)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2016, 47788)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2017, 47785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2018, 47761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2019, 47712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2020, 47642)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2021, 47606)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2022, 47657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KNA', 2023, 47755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2010, 49554112)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2011, 49936638)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2012, 50199853)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2013, 50428893)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2014, 50746659)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2015, 51014947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2016, 51217803)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2017, 51361911)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2018, 51585058)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2019, 51764822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2020, 51836239)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2021, 51769539)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2022, 51672569)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KOR', 2023, 51712619)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2010, 2943356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2011, 3143825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2012, 3394663)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2013, 3646518)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2014, 3761584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2015, 3908743)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2016, 4048085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2017, 4124904)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2018, 4317185)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2019, 4441100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2020, 4360444)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2021, 4250114)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2022, 4268873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'KWT', 2023, 4310108)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2010, 528978305)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2011, 535014773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2012, 541048298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2013, 546954103)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2014, 552781789)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2015, 558562792)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2016, 564377885)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2017, 570381211)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2018, 576620516)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2019, 582701622)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2020, 588011178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2021, 592503434)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2022, 596596955)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAC', 2023, 600825676)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2010, 6323418)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2011, 6416327)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2012, 6508803)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2013, 6600742)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2014, 6691454)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2015, 6787419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2016, 6891363)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2017, 6997917)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2018, 7105006)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2019, 7212053)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2020, 7319399)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2021, 7425057)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2022, 7529475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LAO', 2023, 7633779)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2010, 4995800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2011, 5045056)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2012, 5178337)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2013, 5678851)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2014, 6274342)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2015, 6398940)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2016, 6258619)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2017, 6109252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2018, 5950839)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2019, 5781907)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2020, 5662923)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2021, 5592631)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2022, 5489739)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBN', 2023, 5353930)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2010, 4019956)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2011, 4181150)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2012, 4331740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2013, 4427313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2014, 4519398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2015, 4612329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2016, 4706097)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2017, 4796631)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2018, 4889391)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2019, 4985289)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2020, 5087584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2021, 5193416)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2022, 5302681)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBR', 2023, 5418377)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2010, 6491988)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2011, 6188132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2012, 5869870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2013, 5985221)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2014, 6097764)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2015, 6192235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2016, 6282196)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2017, 6378261)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2018, 6477793)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2019, 6569088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2020, 6653942)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2021, 6735277)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2022, 6812341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LBY', 2023, 6888388)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2010, 170935)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2011, 172145)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2012, 173124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2013, 173978)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2014, 174804)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2015, 175623)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2016, 176413)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2017, 177163)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2018, 177888)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2019, 178583)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2020, 179237)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2021, 179651)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2022, 179857)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCA', 2023, 180251)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2010, 588873862)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2011, 595510008)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2012, 602139396)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2013, 608642242)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2014, 615046755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2015, 621390109)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2016, 627667493)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2017, 633795231)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2018, 639626265)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2019, 645293844)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2020, 650533026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2021, 654978670)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2022, 659306928)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LCN', 2023, 664155299)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2010, 842807198)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2011, 863421305)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2012, 884653995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2013, 906405074)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2014, 928661685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2015, 951184941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2016, 974516186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2017, 998532743)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2018, 1022731692)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2019, 1047426093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2020, 1072970944)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2021, 1098791080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2022, 1124396999)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LDC', 2023, 1150346774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2010, 510897321)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2011, 525506329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2012, 540002626)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2013, 553835758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2014, 567702296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2015, 582173028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2016, 597683499)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2017, 613946858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2018, 630865826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2019, 648755452)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2020, 667053670)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2021, 685250041)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2022, 703727949)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIC', 2023, 722984063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2010, 35926)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2011, 36189)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2012, 36505)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2013, 36806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2014, 37096)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2015, 37355)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2016, 37609)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2017, 37889)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2018, 38181)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2019, 38482)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2020, 38756)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2021, 39039)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2022, 39327)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LIE', 2023, 39584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2010, 20668557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2011, 20859743)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2012, 21017147)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2013, 21131756)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2014, 21239457)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2015, 21336697)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2016, 21425494)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2017, 21506813)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2018, 21670000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2019, 21803000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2020, 21919000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2021, 22156000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2022, 22181000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LKA', 2023, 22037000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2010, 2525974118)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2011, 2568598935)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2012, 2610684758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2013, 2653214685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2014, 2695950000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2015, 2737695800)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2016, 2779326476)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2017, 2821058566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2018, 2862391122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2019, 2903108878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2020, 2943860780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2021, 2983113040)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2022, 3020375650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMC', 2023, 3059564861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2010, 5610455957)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2011, 5689033832)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2012, 5769216950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2013, 5849715412)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2014, 5929949445)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2015, 6009439133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2016, 6088698400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2017, 6168617518)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2018, 6247396829)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2019, 6324580903)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2020, 6398830423)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2021, 6467799496)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2022, 6527353351)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LMY', 2023, 6593137026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2010, 2022747)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2011, 2037677)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2012, 2054718)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2013, 2073939)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2014, 2095242)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2015, 2118521)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2016, 2143872)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2017, 2170617)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2018, 2198017)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2019, 2225702)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2020, 2254100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2021, 2281454)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2022, 2305825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LSO', 2023, 2330318)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2010, 2182659481)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2011, 2196448219)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2012, 2212426916)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2013, 2228642364)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2014, 2244311001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2015, 2258792292)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2016, 2272847109)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2017, 2287248399)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2018, 2299720675)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2019, 2310338402)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2020, 2318233156)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2021, 2323185156)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2022, 2325328254)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTE', 2023, 2326833223)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2010, 3097282)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2011, 3028115)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2012, 2987773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2013, 2957689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2014, 2932367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2015, 2904910)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2016, 2868231)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2017, 2828403)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2018, 2801543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2019, 2794137)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2020, 2794885)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2021, 2800839)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2022, 2831639)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LTU', 2023, 2871897)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2010, 506953)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2011, 518347)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2012, 530946)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2013, 543360)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2014, 556319)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2015, 569604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2016, 582014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2017, 596336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2018, 607950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2019, 620001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2020, 630419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2021, 640064)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2022, 653103)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LUX', 2023, 668606)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2010, 2097555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2011, 2059709)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2012, 2034319)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2013, 2012647)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2014, 1993782)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2015, 1977527)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2016, 1959537)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2017, 1942248)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2018, 1927174)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2019, 1913822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2020, 1900449)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2021, 1884490)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2022, 1879383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'LVA', 2023, 1881750)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2010, 557297)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2011, 571003)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2012, 582766)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2013, 593374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2014, 604167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2015, 615239)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2016, 626688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2017, 638609)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2018, 650991)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2019, 663653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2020, 676283)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2021, 686607)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2022, 695168)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAC', 2023, 704149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2010, 36458)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2011, 36350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2012, 36026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2013, 35639)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2014, 35261)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2015, 35020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2016, 34811)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2017, 34496)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2018, 33852)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2019, 33121)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2020, 32553)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2021, 31948)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2022, 31791)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAF', 2023, 32077)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2010, 32464865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2011, 32903699)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2012, 33352169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2013, 33803527)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2014, 34248603)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2015, 34680458)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2016, 35107264)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2017, 35528115)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2018, 35927511)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2019, 36304408)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2020, 36688772)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2021, 37076584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2022, 37457971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MAR', 2023, 37840044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2010, 33178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2011, 33945)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2012, 34700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2013, 35425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2014, 36110)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2015, 36760)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2016, 37071)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2017, 37044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2018, 37029)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2019, 37034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2020, 36922)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2021, 36686)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2022, 36469)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MCO', 2023, 36297)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2010, 2862354)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2011, 2860699)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2012, 2860324)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2013, 2859558)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2014, 2857815)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2015, 2835978)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2016, 2803186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2017, 2755189)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2018, 2707203)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2019, 2664224)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2020, 2635130)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2021, 2595809)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2022, 2538894)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDA', 2023, 2486891)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2010, 21731053)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2011, 22348158)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2012, 22966240)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2013, 23588073)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2014, 24215976)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2015, 24850912)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2016, 25501941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2017, 26169542)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2018, 26846541)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2019, 27533134)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2020, 28225177)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2021, 28915653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2022, 29611714)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDG', 2023, 30325732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2010, 361575)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2011, 374440)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2012, 387539)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2013, 400728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2014, 416738)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2015, 435582)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2016, 454252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2017, 472442)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2018, 489758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2019, 504508)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2020, 514438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2021, 521457)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2022, 523787)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MDV', 2023, 521021)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2010, 397997557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2011, 406045323)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2012, 414117603)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2013, 422790409)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2014, 431664579)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2015, 440506473)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2016, 448917409)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2017, 456885486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2018, 465073490)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2019, 473201775)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2020, 479966649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2021, 486174763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2022, 493279469)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEA', 2023, 500787313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2010, 112532401)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2011, 114150481)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2012, 115755909)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2013, 117290686)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2014, 118755887)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2015, 120149897)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2016, 121519221)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2017, 122839258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2018, 124013861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2019, 125085311)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2020, 125998302)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2021, 126705138)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2022, 127504125)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MEX', 2023, 128455567)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2010, 53416)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2011, 52971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2012, 52203)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2013, 51352)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2014, 50419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2015, 49410)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2016, 48329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2017, 47187)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2018, 45989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2019, 44728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2020, 43413)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2021, 42050)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2022, 41569)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MHL', 2023, 41996)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2010, 5099558636)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2011, 5163527503)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2012, 5229214324)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2013, 5295879654)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2014, 5362247149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2015, 5427266105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2016, 5491014901)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2017, 5554670660)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2018, 5616531003)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2019, 5675825451)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2020, 5731776753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2021, 5782549455)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2022, 5823625402)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MIC', 2023, 5870152963)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2010, 1946298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2011, 1937398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2012, 1929821)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2013, 1922716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2014, 1917557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2015, 1912430)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2016, 1906313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2017, 1898657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2018, 1889051)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2019, 1876262)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2020, 1856124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2021, 1837114)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2022, 1831712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MKD', 2023, 1811980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2010, 15529181)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2011, 16039734)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2012, 16514687)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2013, 17004033)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2014, 17551814)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2015, 18112907)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2016, 18700106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2017, 19311355)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2018, 19934298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2019, 20567424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2020, 21224040)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2021, 21904983)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2022, 22593590)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLI', 2023, 23293698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2010, 414508)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2011, 416268)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2012, 420028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2013, 425967)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2014, 434558)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2015, 445053)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2016, 455356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2017, 467999)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2018, 484630)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2019, 504062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2020, 515332)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2021, 518536)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2022, 531113)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MLT', 2023, 553214)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2010, 49390988)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2011, 49794522)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2012, 50218185)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2013, 50648334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2014, 51072436)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2015, 51483949)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2016, 51892349)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2017, 52288341)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2018, 52666014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2019, 53040212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2020, 53423198)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2021, 53798084)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2022, 54179306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MMR', 2023, 54577997)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2010, 343313330)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2011, 349770162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2012, 356239722)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2013, 363310225)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2014, 370756356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2015, 378137339)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2016, 385054538)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2017, 391607422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2018, 398375344)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2019, 405259403)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2020, 411810124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2021, 418047201)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2022, 424328381)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNA', 2023, 430857111)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2010, 619428)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2011, 620079)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2012, 620601)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2013, 621207)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2014, 621810)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2015, 622159)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2016, 622303)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2017, 622373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2018, 622227)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2019, 622028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2020, 621306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2021, 619211)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2022, 617213)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNE', 2023, 616177)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2010, 2702520)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2011, 2743938)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2012, 2792349)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2013, 2845153)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2014, 2902823)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2015, 2964749)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2016, 3029555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2017, 3096030)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2018, 3163991)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2019, 3232430)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2020, 3294335)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2021, 3347782)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2022, 3398366)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNG', 2023, 3447157)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2010, 54087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2011, 52520)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2012, 52359)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2013, 52141)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2014, 51856)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2015, 51514)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2016, 51133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2017, 50729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2018, 50304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2019, 49858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2020, 49587)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2021, 49481)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2022, 49551)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MNP', 2023, 49796)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2010, 23073723)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2011, 23760421)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2012, 24487611)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2013, 25251731)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2014, 26038704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2015, 26843246)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2016, 27696493)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2017, 28569441)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2018, 29423878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2019, 30285595)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2020, 31178239)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2021, 32077072)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2022, 32969518)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MOZ', 2023, 33897354)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2010, 3419461)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2011, 3524249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2012, 3636113)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2013, 3742959)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2014, 3843174)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2015, 3946220)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2016, 4051890)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2017, 4160015)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2018, 4270712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2019, 4383849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2020, 4498604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2021, 4614974)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2022, 4736139)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MRT', 2023, 4862989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2010, 1250400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2011, 1252404)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2012, 1255882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2013, 1258927)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2014, 1261208)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2015, 1262879)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2016, 1263747)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2017, 1264887)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2018, 1265577)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2019, 1265985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2020, 1266014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2021, 1266334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2022, 1262523)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MUS', 2023, 1261041)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2010, 14718422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2011, 15146094)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2012, 15581251)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2013, 16024775)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2014, 16477966)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2015, 16938942)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2016, 17405624)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2017, 17881167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2018, 18367883)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2019, 18867337)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2020, 19377061)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2021, 19889742)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2022, 20405317)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MWI', 2023, 20931751)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2010, 28717731)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2011, 29184133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2012, 29660212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2013, 30134807)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2014, 30606459)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2015, 31068833)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2016, 31526418)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2017, 31975806)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2018, 32399271)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2019, 32804020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2020, 33199993)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2021, 33573874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2022, 33938221)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'MYS', 2023, 34308525)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2010, 343398169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2011, 345987266)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2012, 348655855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2013, 351205940)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2014, 353885533)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2015, 356508729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2016, 359247112)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2017, 361731076)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2018, 363974737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2019, 366012359)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2020, 369619464)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2021, 370352605)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2022, 372274062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAC', 2023, 375076145)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2010, 2099271)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2011, 2132340)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2012, 2167470)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2013, 2204510)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2014, 2243001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2015, 2282704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2016, 2323352)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2017, 2364534)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2018, 2405680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2019, 2446644)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2020, 2489098)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2021, 2530151)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2022, 2567012)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NAM', 2023, 2604172)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2010, 249750)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2011, 254350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2012, 259000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2013, 263650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2014, 268050)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2015, 269460)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2016, 270220)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2017, 270810)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2018, 271170)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2019, 271240)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2020, 271080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2021, 270390)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2022, 269215)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NCL', 2023, 267940)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2010, 16647543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2011, 17283112)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2012, 17954407)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2013, 18653199)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2014, 19372014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2015, 20128124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2016, 20921743)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2017, 21737922)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2018, 22577058)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2019, 23443393)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2020, 24333639)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2021, 25252722)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2022, 26207977)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NER', 2023, 27202843)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2010, 160952853)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2011, 165463745)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2012, 170075932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2013, 174726123)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2014, 179379016)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2015, 183995785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2016, 188666931)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2017, 193495907)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2018, 198387623)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2019, 203304492)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2020, 208327405)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2021, 213401323)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2022, 218541212)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NGA', 2023, 223804632)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2010, 5855734)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2011, 5942553)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2012, 6030607)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2013, 6119379)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2014, 6208676)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2015, 6298598)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2016, 6389235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2017, 6480532)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2018, 6572233)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2019, 6663924)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2020, 6755895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2021, 6850540)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2022, 6948392)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NIC', 2023, 7046310)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2010, 16615394)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2011, 16693074)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2012, 16754962)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2013, 16804432)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2014, 16865008)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2015, 16939923)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2016, 17030314)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2017, 17131296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2018, 17231624)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2019, 17344874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2020, 17441500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2021, 17533044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2022, 17700982)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NLD', 2023, 17879488)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2010, 4889252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2011, 4953088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2012, 5018573)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2013, 5079623)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2014, 5137232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2015, 5188607)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2016, 5234519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2017, 5276968)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2018, 5311916)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2019, 5347896)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2020, 5379475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2021, 5408320)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2022, 5457127)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NOR', 2023, 5519594)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2010, 27161567)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2011, 27266399)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2012, 27330694)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2013, 27381555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2014, 27462106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2015, 27610325)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2016, 27861186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2017, 28183426)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2018, 28506712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2019, 28832496)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2020, 29348627)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2021, 30034989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2022, 30547580)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NPL', 2023, 30896590)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2010, 10241)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2011, 10283)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2012, 10444)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2013, 10694)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2014, 10940)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2015, 11185)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2016, 11437)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2017, 11682)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2018, 11924)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2019, 12132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2020, 12315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2021, 12511)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2022, 12668)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NRU', 2023, 12780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2010, 4350700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2011, 4384000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2012, 4408100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2013, 4442100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2014, 4516500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2015, 4609400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2016, 4714100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2017, 4813600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2018, 4900600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2019, 4979200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2020, 5090200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2021, 5111300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2022, 5117200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'NZL', 2023, 5223100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2010, 1290949310)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2011, 1297593832)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2012, 1305512665)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2013, 1313642010)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2014, 1322072133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2015, 1330316951)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2016, 1338792226)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2017, 1346867182)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2018, 1354843844)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2019, 1362032167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2020, 1369502262)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2021, 1371972508)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2022, 1377465841)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OED', 2023, 1385005653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2010, 2881914)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2011, 3206870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2012, 3535579)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2013, 3816680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2014, 4009267)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2015, 4191776)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2016, 4398070)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2017, 4541854)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2018, 4601157)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2019, 4602768)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2020, 4543399)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2021, 4520471)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2022, 4576298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OMN', 2023, 4644384)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2010, 12328684)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2011, 12440374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2012, 12569929)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2013, 12725773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2014, 12900102)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2015, 13082531)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2016, 13258300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2017, 13439650)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2018, 13608679)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2019, 13751038)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2020, 13853034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2021, 13943732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2022, 14095313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'OSS', 2023, 14240737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2010, 194454498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2011, 198602738)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2012, 202205861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2013, 205337562)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2014, 208251628)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2015, 210969298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2016, 213524840)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2017, 216379655)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2018, 219731479)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2019, 223293280)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2020, 227196741)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2021, 231402117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2022, 235824862)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAK', 2023, 240485658)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2010, 3623617)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2011, 3688674)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2012, 3754862)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2013, 3821556)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2014, 3888793)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2015, 3957099)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2016, 4026336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2017, 4096063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2018, 4165255)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2019, 4232532)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2020, 4294396)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2021, 4351267)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2022, 4408581)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PAN', 2023, 4468087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2010, 29229572)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2011, 29477721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2012, 29749589)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2013, 30038809)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2014, 30353951)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2015, 30711863)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2016, 31132779)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2017, 31605486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2018, 32203944)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2019, 32824861)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2020, 33304756)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2021, 33715471)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2022, 34049588)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PER', 2023, 34352719)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2010, 94636700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2011, 96337913)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2012, 98032317)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2013, 99700107)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2014, 101325201)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2015, 103031365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2016, 104875266)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2017, 106738501)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2018, 108568836)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2019, 110380804)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2020, 112190977)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2021, 113880328)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2022, 115559009)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PHL', 2023, 117337368)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2010, 18540)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2011, 18240)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2012, 17946)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2013, 17805)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2014, 17796)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2015, 17794)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2016, 17816)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2017, 17837)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2018, 17864)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2019, 17916)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2020, 17972)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2021, 18024)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2022, 18055)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PLW', 2023, 18058)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2010, 7583269)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2011, 7806637)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2012, 8026545)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2013, 8245627)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2014, 8464153)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2015, 8682174)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2016, 8899169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2017, 9114796)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2018, 9329227)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2019, 9542486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2020, 9749640)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2021, 9949437)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2022, 10142619)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PNG', 2023, 10329931)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2010, 38042794)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2011, 38063255)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2012, 38063164)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2013, 38040196)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2014, 38011735)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2015, 37986412)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2016, 37970087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2017, 37974826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2018, 37974750)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2019, 37965475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2020, 37899070)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2021, 37747124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2022, 36821749)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'POL', 2023, 36685849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2010, 739525992)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2011, 761717101)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2012, 784822780)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2013, 808542070)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2014, 832469778)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2015, 856420253)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2016, 880891473)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2017, 905987912)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2018, 931467165)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2019, 957503246)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2020, 984213438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2021, 1011043183)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2022, 1038012552)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRE', 2023, 1065710613)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2010, 3721525)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2011, 3678732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2012, 3634488)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2013, 3593077)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2014, 3534874)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2015, 3473232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2016, 3406672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2017, 3325286)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2018, 3193354)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2019, 3193694)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2020, 3281557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2021, 3262693)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2022, 3220113)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRI', 2023, 3205691)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2010, 24686435)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2011, 24783789)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2012, 24887770)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2013, 25001819)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2014, 25126131)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2015, 25258015)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2016, 25389611)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2017, 25516321)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2018, 25638149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2019, 25755441)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2020, 25867467)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2021, 25971909)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2022, 26069416)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRK', 2023, 26160821)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2010, 10573100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2011, 10557560)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2012, 10514844)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2013, 10457295)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2014, 10401062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2015, 10358076)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2016, 10325452)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2017, 10300300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2018, 10283822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2019, 10286263)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2020, 10297081)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2021, 10361831)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2022, 10409704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRT', 2023, 10525347)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2010, 5768613)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2011, 5843939)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2012, 5923322)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2013, 6005652)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2014, 6090721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2015, 6177950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2016, 6266615)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2017, 6355404)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2018, 6443328)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2019, 6530026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2020, 6618695)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2021, 6703799)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2022, 6780744)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PRY', 2023, 6861524)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2010, 3786161)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2011, 3882986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2012, 3979998)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2013, 4076708)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2014, 4173398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2015, 4270092)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2016, 4367088)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2017, 4454805)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2018, 4569087)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2019, 4685306)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2020, 4803269)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2021, 4922749)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2022, 5043612)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSE', 2023, 5165775)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2010, 2301401)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2011, 2327284)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2012, 2353058)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2013, 2379069)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2014, 2405308)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2015, 2431426)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2016, 2457814)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2017, 2484263)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2018, 2510226)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2019, 2536070)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2020, 2566819)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2021, 2602173)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2022, 2639019)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PSS', 2023, 2677728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2010, 1075047440)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2011, 1077986944)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2012, 1082488131)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2013, 1087228563)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2014, 1092176251)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2015, 1097076319)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2016, 1102054942)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2017, 1106262382)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2018, 1110198958)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2019, 1113410921)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2020, 1117530670)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2021, 1116651310)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2022, 1114354147)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PST', 2023, 1119478514)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2010, 283788)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2011, 285265)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2012, 286584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2013, 288032)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2014, 289873)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2015, 291787)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2016, 293541)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2017, 295450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2018, 297606)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2019, 299717)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2020, 301920)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2021, 304032)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2022, 306279)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'PYF', 2023, 308872)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2010, 1713504)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2011, 1804171)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2012, 1905660)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2013, 2035501)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2014, 2214465)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2015, 2414573)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2016, 2595166)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2017, 2711755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2018, 2766732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2019, 2807235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2020, 2760385)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2021, 2688235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2022, 2695122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'QAT', 2023, 2716391)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2010, 20246871)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2011, 20147528)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2012, 20058035)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2013, 19983693)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2014, 19908979)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2015, 19815616)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2016, 19702267)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2017, 19588715)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2018, 19473970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2019, 19371648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2020, 19265250)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2021, 19122059)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2022, 19047009)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ROU', 2023, 19056116)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2010, 142849468)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2011, 143018195)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2012, 143378447)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2013, 143805638)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2014, 144237223)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2015, 144640716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2016, 145015460)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2017, 145293260)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2018, 145398106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2019, 145453291)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2020, 145245148)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2021, 144746762)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2022, 144236933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RUS', 2023, 143826130)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2010, 10309031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2011, 10576932)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2012, 10840334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2013, 11101350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2014, 11368451)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2015, 11642959)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2016, 11930899)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2017, 12230339)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2018, 12531808)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2019, 12835028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2020, 13146362)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2021, 13461888)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2022, 13776698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'RWA', 2023, 14094683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2010, 1660546144)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2011, 1684898004)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2012, 1708706729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2013, 1731683901)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2014, 1754030304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2015, 1775545180)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2016, 1797072648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2017, 1818931519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2018, 1840534093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2019, 1861598514)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2020, 1882531620)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2021, 1901911604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2022, 1919348000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAS', 2023, 1938549529)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2010, 29411929)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2011, 30150945)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2012, 30821543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2013, 31482498)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2014, 32125564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2015, 32749848)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2016, 33416270)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2017, 34193122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2018, 35018133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2019, 35827362)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2020, 35997107)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2021, 35950396)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2022, 36408820)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SAU', 2023, 36947025)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2010, 33739933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2011, 34419624)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2012, 35159792)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2013, 35990704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2014, 37003245)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2015, 38171178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2016, 39377169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2017, 40679828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2018, 41999059)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2019, 43232093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2020, 44440486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2021, 45657202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2022, 46874204)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SDN', 2023, 48109006)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2010, 12530121)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2011, 12875880)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2012, 13231833)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2013, 13595566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2014, 13970308)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2015, 14356181)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2016, 14751356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2017, 15157793)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2018, 15574909)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2019, 16000781)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2020, 16436120)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2021, 16876720)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2022, 17316449)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SEN', 2023, 17763163)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2010, 5076732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2011, 5183688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2012, 5312437)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2013, 5399162)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2014, 5469724)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2015, 5535002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2016, 5607283)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2017, 5612253)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2018, 5638676)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2019, 5703569)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2020, 5685807)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2021, 5453566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2022, 5637022)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SGP', 2023, 5917648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2010, 540394)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2011, 553721)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2012, 567763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2013, 582365)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2014, 597375)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2015, 612660)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2016, 628102)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2017, 643634)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2018, 659249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2019, 674993)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2020, 691191)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2021, 707851)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2022, 724273)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLB', 2023, 740424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2010, 6436698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2011, 6612385)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2012, 6788587)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2013, 6964859)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2014, 7140688)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2015, 7314773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2016, 7493913)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2017, 7677565)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2018, 7861281)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2019, 8046828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2020, 8233970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2021, 8420641)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2022, 8605718)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLE', 2023, 8791092)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2010, 6114034)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2011, 6137349)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2012, 6161289)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2013, 6185642)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2014, 6209526)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2015, 6231066)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2016, 6250510)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2017, 6266654)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2018, 6276342)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2019, 6280217)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2020, 6292731)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2021, 6314167)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2022, 6336392)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SLV', 2023, 6364943)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2010, 31608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2011, 32495)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2012, 33132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2013, 33285)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2014, 33389)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2015, 33570)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2016, 33834)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2017, 34056)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2018, 34156)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2019, 34178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2020, 34007)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2021, 33745)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2022, 33660)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SMR', 2023, 33642)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2010, 12026649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2011, 12216837)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2012, 12440326)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2013, 12852485)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2014, 13309235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2015, 13763906)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2016, 14292847)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2017, 14864221)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2018, 15411094)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2019, 15981300)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2020, 16537016)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2021, 17065581)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2022, 17597511)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SOM', 2023, 18143378)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2010, 7291436)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2011, 7234099)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2012, 7199077)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2013, 7164132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2014, 7130576)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2015, 7095383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2016, 7058322)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2017, 7020858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2018, 6982604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2019, 6945235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2020, 6899126)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2021, 6834326)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2022, 6664449)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SRB', 2023, 6618026)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2010, 879707649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2011, 904194713)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2012, 929240350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2013, 955006753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2014, 981415249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2015, 1008605380)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2016, 1036061312)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2017, 1063789431)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2018, 1092307211)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2019, 1121451424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2020, 1151203619)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2021, 1181063755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2022, 1211070124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSA', 2023, 1241778044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2010, 9714419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2011, 10243050)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2012, 10701604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2013, 11106031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2014, 11213284)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2015, 11194299)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2016, 11066105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2017, 10658226)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2018, 10395329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2019, 10447666)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2020, 10606227)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2021, 10748272)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2022, 10913164)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSD', 2023, 11088796)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2010, 879797419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2011, 904282154)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2012, 929328653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2013, 955096702)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2014, 981506608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2015, 1008698799)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2016, 1036155989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2017, 1063885274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2018, 1092403973)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2019, 1121549049)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2020, 1151302081)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2021, 1181163013)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2022, 1211190002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SSF', 2023, 1241897817)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2010, 17490321)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2011, 17645826)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2012, 17821789)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2013, 18026868)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2014, 18251250)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2015, 18483937)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2016, 18709361)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2017, 18940564)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2018, 19177011)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2019, 19377482)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2020, 19526038)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2021, 19674424)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2022, 19881389)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SST', 2023, 20086203)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2010, 182138)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2011, 186044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2012, 189924)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2013, 193757)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2014, 197497)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2015, 201124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2016, 204632)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2017, 208036)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2018, 211344)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2019, 214599)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2020, 218641)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2021, 223107)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2022, 227380)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'STP', 2023, 231856)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2010, 546080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2011, 552146)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2012, 558111)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2013, 563947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2014, 569682)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2015, 575475)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2016, 581453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2017, 587559)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2018, 593715)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2019, 600301)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2020, 607065)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2021, 612985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2022, 618040)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SUR', 2023, 623236)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2010, 5391428)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2011, 5398384)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2012, 5407579)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2013, 5413393)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2014, 5418649)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2015, 5423801)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2016, 5430798)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2017, 5439232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2018, 5446771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2019, 5454147)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2020, 5458827)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2021, 5447247)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2022, 5431752)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVK', 2023, 5426740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2010, 2048583)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2011, 2052843)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2012, 2057159)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2013, 2059953)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2014, 2061980)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2015, 2063531)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2016, 2065042)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2017, 2066388)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2018, 2073894)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2019, 2088385)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2020, 2102419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2021, 2108079)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2022, 2111986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SVN', 2023, 2120937)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2010, 9378126)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2011, 9449213)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2012, 9519374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2013, 9600379)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2014, 9696110)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2015, 9799186)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2016, 9923085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2017, 10057698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2018, 10175214)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2019, 10278887)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2020, 10353442)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2021, 10415811)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2022, 10486941)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWE', 2023, 10536632)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2010, 1099920)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2011, 1105371)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2012, 1111444)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2013, 1118319)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2014, 1125865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2015, 1133936)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2016, 1142524)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2017, 1151390)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2018, 1160428)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2019, 1169613)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2020, 1180655)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2021, 1192271)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2022, 1201670)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SWZ', 2023, 1210822)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2010, 34056)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2011, 33435)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2012, 34640)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2013, 36607)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2014, 37685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2015, 38825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2016, 38992)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2017, 38615)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2018, 38934)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2019, 39648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2020, 40350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2021, 40708)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2022, 40888)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SXM', 2023, 41163)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2010, 89770)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2011, 87441)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2012, 88303)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2013, 89949)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2014, 91359)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2015, 93419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2016, 94677)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2017, 95843)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2018, 96762)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2019, 97625)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2020, 98462)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2021, 99258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2022, 119878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYC', 2023, 119773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2010, 22337563)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2011, 22730733)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2012, 22605577)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2013, 21495821)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2014, 20072232)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2015, 19205178)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2016, 18964252)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2017, 18983373)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2018, 19333463)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2019, 20098251)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2020, 20772595)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2021, 21324367)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2022, 22125249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'SYR', 2023, 23227014)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2010, 29726)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2011, 30816)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2012, 32081)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2013, 33594)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2014, 34985)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2015, 36538)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2016, 38246)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2017, 39844)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2018, 41487)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2019, 43080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2020, 44276)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2021, 45114)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2022, 45703)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCA', 2023, 46062)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2010, 11894727)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2011, 12317730)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2012, 12754906)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2013, 13216766)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2014, 13697126)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2015, 14140274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2016, 14592585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2017, 15085884)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2018, 15604210)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2019, 16126866)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2020, 16644701)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2021, 17179740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2022, 17723315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TCD', 2023, 18278568)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2010, 1944510719)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2011, 1959494275)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2012, 1976386829)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2013, 1993077336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2014, 2009149689)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2015, 2024511016)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2016, 2039794828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2017, 2055414680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2018, 2068898629)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2019, 2080648616)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2020, 2090523535)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2021, 2097669023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2022, 2103055378)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEA', 2023, 2107522258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2010, 441572315)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2011, 443764567)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2012, 445808734)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2013, 448060105)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2014, 450338927)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2015, 452672729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2016, 454966816)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2017, 457063732)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2018, 459012381)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2019, 461027359)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2020, 462304330)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2021, 463035774)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2022, 457342249)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TEC', 2023, 457326090)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2010, 6571855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2011, 6748672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2012, 6926635)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2013, 7106229)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2014, 7288383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2015, 7473229)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2016, 7661354)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2017, 7852795)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2018, 8046679)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2019, 8243094)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2020, 8442580)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2021, 8644829)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2022, 8848699)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TGO', 2023, 9053799)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2010, 68270489)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2011, 68712846)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2012, 69157023)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2013, 69578602)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2014, 69960943)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2015, 70294397)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2016, 70607037)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2017, 70898202)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2018, 71127802)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2019, 71307763)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2020, 71475664)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2021, 71601103)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2022, 71697030)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'THA', 2023, 71801279)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2010, 7621779)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2011, 7784819)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2012, 7956382)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2013, 8136610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2014, 8326348)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2015, 8524063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2016, 8725318)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2017, 8925525)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2018, 9128132)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2019, 9337003)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2020, 9543207)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2021, 9750064)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2022, 9952787)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TJK', 2023, 10143543)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2010, 5267970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2011, 5360811)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2012, 5458682)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2013, 5560095)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2014, 5663152)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2015, 5766431)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2016, 5868561)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2017, 5968383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2018, 6065066)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2019, 6158420)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2020, 6250438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2021, 6341855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2022, 6430770)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TKM', 2023, 6516100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2010, 572949377)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2011, 579610152)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2012, 586263141)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2013, 592784484)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2014, 599226878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2015, 605613677)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2016, 611946736)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2017, 618155029)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2018, 624120970)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2019, 629795751)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2020, 634961078)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2021, 639469895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2022, 643884393)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLA', 2023, 648763330)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2010, 1088486)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2011, 1112976)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2012, 1137676)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2013, 1161555)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2014, 1184830)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2015, 1205813)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2016, 1224562)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2017, 1243235)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2018, 1261845)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2019, 1280438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2020, 1299995)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2021, 1320942)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2022, 1341296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TLS', 2023, 1360596)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2010, 339527169)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2011, 345887176)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2012, 352259724)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2013, 359233517)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2014, 366582958)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2015, 373867247)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2016, 380687450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2017, 387152617)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2018, 393806257)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2019, 400574097)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2020, 407006855)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2021, 413124452)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2022, 419284769)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TMN', 2023, 425691336)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2010, 107383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2011, 107611)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2012, 107502)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2013, 107089)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2014, 106626)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2015, 106122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2016, 105707)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2017, 105415)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2018, 105150)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2019, 104951)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2020, 105254)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2021, 106017)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2022, 106858)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TON', 2023, 107773)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2010, 1660546144)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2011, 1684898004)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2012, 1708706729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2013, 1731683901)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2014, 1754030304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2015, 1775545180)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2016, 1797072648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2017, 1818931519)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2018, 1840534093)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2019, 1861598514)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2020, 1882531620)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2021, 1901911604)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2022, 1919348000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSA', 2023, 1938549529)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2010, 879797419)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2011, 904282154)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2012, 929328653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2013, 955096702)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2014, 981506608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2015, 1008698799)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2016, 1036155989)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2017, 1063885274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2018, 1092403973)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2019, 1121549049)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2020, 1151302081)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2021, 1181163013)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2022, 1211190002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TSS', 2023, 1241897817)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2010, 1410296)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2011, 1420020)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2012, 1430377)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2013, 1440729)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2014, 1450661)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2015, 1460177)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2016, 1469330)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2017, 1478607)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2018, 1504709)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2019, 1519955)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2020, 1518147)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2021, 1525663)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2022, 1531044)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TTO', 2023, 1534937)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2010, 10895063)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2011, 11032528)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2012, 11174383)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2013, 11300284)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2014, 11428948)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2015, 11557779)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2016, 11685667)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2017, 11811443)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2018, 11933041)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2019, 12049314)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2020, 12161723)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2021, 12262946)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2022, 12356117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUN', 2023, 12458223)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2010, 73142150)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2011, 74223629)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2012, 75175827)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2013, 76147624)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2014, 77181884)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2015, 78218479)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2016, 79277962)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2017, 80312698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2018, 81407204)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2019, 82579440)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2020, 83384680)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2021, 84147318)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2022, 84979913)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUR', 2023, 85326000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2010, 10550)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2011, 10700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2012, 10854)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2013, 10918)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2014, 10899)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2015, 10877)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2016, 10852)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2017, 10828)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2018, 10865)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2019, 10956)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2020, 11069)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2021, 11204)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2022, 11312)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TUV', 2023, 11396)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2010, 45110527)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2011, 46416031)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2012, 47786137)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2013, 49253643)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2014, 50814552)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2015, 52542823)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2016, 54401802)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2017, 56267032)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2018, 58090443)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2019, 59872579)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2020, 61704518)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2021, 63588334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2022, 65497748)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'TZA', 2023, 67438106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2010, 32341728)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2011, 33295738)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2012, 34273295)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2013, 35273570)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2014, 36336539)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2015, 37477356)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2016, 38748299)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2017, 40127085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2018, 41515395)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2019, 42949080)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2020, 44404611)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2021, 45853778)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2022, 47249585)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UGA', 2023, 48582334)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2010, 45870741)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2011, 45706086)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2012, 45593342)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2013, 45489648)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2014, 45272155)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2015, 45167350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2016, 45038236)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2017, 44880758)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2018, 44690584)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2019, 44474512)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2020, 44207754)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2021, 43848986)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2022, 38000000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UKR', 2023, 37000000)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2010, 2573584518)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2011, 2594928568)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2012, 2618529566)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2013, 2642664969)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2014, 2666297149)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2015, 2689570305)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2016, 2711688425)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2017, 2733612094)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2018, 2754139881)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2019, 2772716573)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2020, 2787915973)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2021, 2799436415)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2022, 2803249752)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UMC', 2023, 2810588102)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2010, 3352651)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2011, 3361637)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2012, 3371133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2013, 3381180)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2014, 3391662)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2015, 3402818)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2016, 3413766)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2017, 3422200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2018, 3427042)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2019, 3428409)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2020, 3429086)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2021, 3426260)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2022, 3422794)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'URY', 2023, 3423108)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2010, 309327143)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2011, 311583481)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2012, 313877662)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2013, 316059947)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2014, 318386329)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2015, 320738994)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2016, 323071755)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2017, 325122128)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2018, 326838199)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2019, 328329953)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2020, 331526933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2021, 332048977)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2022, 333271411)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'USA', 2023, 334914895)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2010, 28562400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2011, 29339400)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2012, 29774500)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2013, 30243200)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2014, 30757700)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2015, 31298900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2016, 31847900)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2017, 32388600)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2018, 32956100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2019, 33580350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2020, 34232050)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2021, 34915100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2022, 35648100)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'UZB', 2023, 36412350)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2010, 109308)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2011, 108703)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2012, 108083)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2013, 107450)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2014, 106912)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2015, 106482)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2016, 105963)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2017, 105549)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2018, 105281)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2019, 104924)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2020, 104632)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2021, 104332)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2022, 103948)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VCT', 2023, 103698)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2010, 28715022)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2011, 29096159)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2012, 29470426)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2013, 29838021)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2014, 30193258)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2015, 30529716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2016, 30741464)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2017, 30563433)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2018, 29825653)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2019, 28971683)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2020, 28490453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2021, 28199867)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2022, 28301696)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VEN', 2023, 28838499)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2010, 27556)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2011, 27962)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2012, 28421)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2013, 28657)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2014, 28971)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2015, 29366)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2016, 29739)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2017, 30060)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2018, 30335)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2019, 30610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2020, 30910)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2021, 31122)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2022, 31305)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VGB', 2023, 31538)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2010, 108357)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2011, 108290)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2012, 108188)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2013, 108041)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2014, 107882)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2015, 107712)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2016, 107516)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2017, 107281)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2018, 107001)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2019, 106669)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2020, 106290)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2021, 105870)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2022, 105413)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VIR', 2023, 104917)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2010, 87411012)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2011, 88349117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2012, 89301326)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2013, 90267739)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2014, 91235504)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2015, 92191398)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2016, 93126529)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2017, 94033048)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2018, 94914330)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2019, 95776716)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2020, 96648685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2021, 97468029)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2022, 98186856)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VNM', 2023, 98858950)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2010, 245453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2011, 251294)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2012, 257313)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2013, 263534)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2014, 269927)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2015, 276438)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2016, 283218)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2017, 290239)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2018, 297298)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2019, 304404)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2020, 311685)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2021, 319137)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2022, 326740)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'VUT', 2023, 334506)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2010, 6969894715)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2011, 7053988749)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2012, 7141430933)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2013, 7229458453)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2014, 7317304568)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2015, 7404251118)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2016, 7490956237)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2017, 7577110140)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2018, 7661177849)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2019, 7742724795)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2020, 7821271846)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2021, 7888963821)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2022, 7951595433)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WLD', 2023, 8024997028)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2010, 194672)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2011, 196351)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2012, 198124)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2013, 199939)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2014, 201757)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2015, 203571)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2016, 205544)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2017, 207630)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2018, 209701)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2019, 211905)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2020, 214929)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2021, 218764)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2022, 222382)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'WSM', 2023, 225681)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2010, 1792563)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2011, 1799338)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2012, 1807106)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2013, 1818117)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2014, 1812771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2015, 1788196)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2016, 1777557)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2017, 1791003)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2018, 1797085)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2019, 1788878)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2020, 1790133)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2021, 1786038)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2022, 1768086)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'XKX', 2023, 1756374)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2010, 24743946)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2011, 25475610)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2012, 26223391)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2013, 26984002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2014, 27753304)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2015, 28516545)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2016, 29274002)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2017, 30034389)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2018, 30790513)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2019, 31546691)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2020, 32284046)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2021, 32981641)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2022, 33696614)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'YEM', 2023, 34449825)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2010, 51784921)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2011, 52443325)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2012, 53145033)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2013, 53873616)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2014, 54729551)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2015, 55876504)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2016, 56422274)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2017, 56641209)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2018, 57339635)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2019, 58087055)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2020, 58801927)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2021, 59392255)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2022, 59893885)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZAF', 2023, 60414495)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2010, 13792086)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2011, 14265814)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2012, 14744658)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2013, 15234976)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2014, 15737793)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2015, 16248230)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2016, 16767761)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2017, 17298054)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2018, 17835893)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2019, 18380477)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2020, 18927715)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2021, 19473125)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2022, 20017675)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZMB', 2023, 20569737)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2010, 12839771)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2011, 13025785)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2012, 13265331)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2013, 13555422)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2014, 13855753)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2015, 14154937)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2016, 14452704)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2017, 14751101)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2018, 15052184)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2019, 15354608)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2020, 15669666)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2021, 15993524)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2022, 16320537)
GO
INSERT [dbo].[Population] ([Country Code], [Year], [Population]) VALUES (N'ZWE', 2023, 16665409)
GO
