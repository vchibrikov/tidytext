# tidytext essential training


#installing essential packages
pacman::p_load(
  gutenbergr,
  magrittr,
  pacman, 
  rio,
  tidytext,
  tidyverse, 
  dplyr, 
  textdata)

# downloading book from Gutenberg ########################
my_mirror <- "http://mirrors.xmission.com/gutenberg/"                             #download book from mirror
data.pan.tadeusz <- gutenberg_download(28240, mirror = my_mirror) %>% as_tibble() #downloading "Pan Tadeusz"

data.pan.tadeusz %<>%
  mutate(line = row_number()) %>% #adding line numbers for further text separation
  select(-gutenberg_id)     #deleting book id 

pan.tadeusz.words <- data.pan.tadeusz %>%
  unnest_tokens(word, text)     #breaking lines into words

# calculation of sentiment frequencies #################
# Sentiment frequencies come from AFINN lexicon,
# which scores words in scale from -5 (most negative)
# to _5 (most positive)

pan.tadeusz.freq.score <- pan.tadeusz.words %>%
  inner_join(get_sentiments(lexicon = "afinn")) %>%
  group_by(value) %>%
  summarize(n = n())

# graph score frequencies ###########
pan.tadeusz.freq.score %>%
  ggplot(aes(value, n)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks  = seq(-5, 5, by = 1)) +
  ggtitle("Pan Tadeusz: Sentiment Scores by Words") +
  xlab("Sentiment Score") +
  ylab("Frequency") +
  theme_classic()

# sentiments by groups of lines ##########
pan.tadeusz.freq.score.group <- pan.tadeusz.words %>%
  inner_join(get_sentiments(lexicon = "afinn")) %>%
  group_by(section = line %/% 100) %>%
  summarize(score = mean(value))
  
#plot scores by group
pan.tadeusz.freq.score.group %>%
  ggplot(aes(section, score)) +
  geom_hline(yintercept = 0, col = "black") +
  geom_line(col = "grey") +
  geom_smooth(method = loess, col = "grey40") +
  ggtitle("Pan Tadeusz: Sentiment Scores by Sections") +
  xlab("Section (100 lines each)") +
  ylab("Sentiment Score") +
  theme_classic()

ggsave("Pan_Tadeusz.png", width = 30, height = 20, units = "cm", dpi = 600)




  
  

