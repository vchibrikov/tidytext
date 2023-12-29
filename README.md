# Tidytext Essential Training

This is a set of R scripts for performing sentiment analysis on a book text using the tidytext package in R. The code downloads the book "Pan Tadeusz" from the Gutenberg project and then performs sentiment analysis on the text.

# Requirements

The following packages are required to run the code:

- gutenbergr
- magrittr
- pacman
- rio
- tidytext
- tidyverse
- dplyr
- textdata

These packages can be installed using the pacman package in R.

# Usage

- Clone or download the repository to your local machine.
- Open the tidytext.R file in R or RStudio.
- Run the script.
- The script will download the text of "Pan Tadeusz" from the Gutenberg project, perform sentiment analysis on the text, and create two graphs of the sentiment analysis results. The graphs are saved as PNG files in the same directory as the script.

# Output

The one output image arrear as a word association plot of the text:
![Pan_Tadeusz_plot](https://github.com/vchibrikov/tidytext/assets/98614057/45fe1893-f213-4219-8318-bbab216f5509)

The other output is an image of sentiment score per text segment, in scale from -5 to 5, where -5 is sentiment with negative connotation, and 5 is sentiment with positive connotation:
![Pan_Tadeusz](https://github.com/vchibrikov/tidytext/assets/98614057/f749fe8f-2fb6-4652-ba8e-564301637051)

# License

This code is released under the MIT license.
