ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'CoreIssue_FGIDX1_Data1_3', FILENAME = N'P:\SQLDATA\CoreIssue\Index\CoreIssue_FGIDX1_Data1_3.ndf' , SIZE = 2097152KB , FILEGROWTH = 1048576KB ) TO FILEGROUP [FGIDX1];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'CoreIssue_FGIDX2_Data1_3', FILENAME = N'P:\SQLDATA\CoreIssue\Index\CoreIssue_FGIDX2_Data1_3.ndf' , SIZE = 2097152KB , FILEGROWTH = 1048576KB ) TO FILEGROUP [FGIDX2];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'CoreIssue_FGIDX3_Data1_3', FILENAME = N'P:\SQLDATA\CoreIssue\Index\CoreIssue_FGIDX3_Data1_3.ndf' , SIZE = 2097152KB , FILEGROWTH = 1048576KB ) TO FILEGROUP [FGIDX3];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'CoreIssue_FGIDX4_Data1_3', FILENAME = N'P:\SQLDATA\CoreIssue\Index\CoreIssue_FGIDX4_Data1_3.ndf' , SIZE = 2097152KB , FILEGROWTH = 1048576KB ) TO FILEGROUP [FGIDX4];
																																							 

ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_OLD_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_OLD_Data_2.ndf' , SIZE = 1048576KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_OLD];

ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_09_2021_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_09_2021_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_09_2021];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_10_2021_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_10_2021_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_10_2021];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_11_2021_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_11_2021_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_11_2021];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_12_2021_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_12_2021_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_12_2021];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_01_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_01_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_01_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_02_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_02_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_02_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_03_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_03_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_03_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_04_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_04_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_04_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_05_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_05_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_05_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_06_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_06_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_06_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_07_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_07_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_07_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_08_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_08_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_08_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_09_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_09_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_09_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_10_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_10_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_10_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_11_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_11_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_11_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_12_2022_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_12_2022_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_12_2022];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_01_2023_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_01_2023_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_01_2023];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_02_2023_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_02_2023_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_02_2023];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_03_2023_Data_2', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_03_2023_Data_2.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_03_2023];

ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202304_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202304_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_04];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202305_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202305_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_05];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202306_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202306_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_06];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202307_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202307_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_07];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202308_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202308_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_08];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202309_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202309_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_09];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202310_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202310_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_10];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202311_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202311_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2023_11];

ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202401_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202401_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2024_01];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202402_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202402_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2024_02];
ALTER DATABASE [CoreIssue] ADD FILE ( NAME = N'PROD_CI_202403_1', FILENAME = N'P:\SQLDATA\CoreIssue\Partition\PROD_CI_202403_1.ndf' , SIZE = 4194304KB , FILEGROWTH = 2097152KB ) TO FILEGROUP [FG_PROD_CI_2024_03];
