# Data Preparation in ImageJ:
•	Circle all cells that you want to analyse, circle background, circle the cell with maximum intensity, circle the cell with minimum intensity.

•	Click on Measure and save the file as .csv. **NOTE** make sure your csv file has serial number of cells in column A and mean gray values in Column B  with the heading “Mean”.

•	Make separate .csv files for each of the slides that you want to analyse.

# What does this toolkit do?
This R toolkit takes mean gray values of cells (from multiple files) as input to calculate threshold and then analyse which cells are above this threshold value or “positive” for your stain. Briefly, the function normalizes the mean gray value of each cell in a section between the highest and lowest intensity cell for that section. The threshold used for scoring a neuron as positive for a stain is set as the normalized minimum gray value across all sections +2 times standard deviation. See the Analysis.xlsx file for sample calculations in excel. 
# How to use this toolkit? 
Function: IHCanalysis()
Filename: IHCanalysis.R
1.	Install R from https://cran.r-project.org/
2.	Open R interface  File  Change dir … : set to a folder where you will store function files and data files. You have to set this at the beginning of each session
3.	Copy and paste IHCanalysis.R and IHCthreshold.R files into the folder from step 2
4.	In the R interface: File  Source R code select a file from step 3, repeat for the other file
5.	Type: IHCanalysis() in the R console and follow along with the prompt
# Example run of the toolkit with files provided: 
> source("C:\\Users\\Sampurna\\Documents\\PhDYearOne\\R\\IHCthreshold.R")
> source("C:\\Users\\Sampurna\\Documents\\PhDYearOne\\R\\IHCanalysis.R")
> IHCanalysis()
Do you want to calculate threshold value?(y/n)y
[1] "*****Starting calculation of threshold value*****"

How many files do you want to analyse?3

Enter .csv filename (w/o etxn)#Slide1

Enter .csv filename (w/o etxn)#Slide2

Enter .csv filename (w/o etxn)#Slide3

Want to save .csv file with maximas and minimas?(y/n)y

Enter .csv output file name Max_min

[1] "The threshold value is 0.259638938647934"

How many files do you want to analyse with this threshold?3

Enter .csv filename (w/o etxn)#Slide1

Enter .csv filename (w/o etxn)#Slide2

Enter .csv filename (w/o etxn)#Slide3

NULL

# The output:
After executing the above lines, you will find three .csv files in your working directory: Slide1result.csv, Slide2result.csv, Slide3result.csv. Column A of these files contain serial numbers of the cells, Column B is the normalized mean gray value and Column C indicates whether the cell is positive (1) or negative (0) for that cell. There will also be a file named "Max_min.csv" where Column A is the serial number of the input file, Column B and Column C are the background subtracted maximum and minimum of that file and Column D is the normalized minimum values.

# Optional:
You can also calculate the threshold elsewhere and input that to analyse your files. To activate this function when the program asks "Do you want to calculate threshold (y/n)?" Press 'n' and enter threshold value manually when prompted. 
