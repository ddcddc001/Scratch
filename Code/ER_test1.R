

setwd('D:/Cat/Projects/Home experiments/Entity Resolution/C_test data')
rm(list=ls())

library(igraph)
library(visNetwork)


# df1 <- read.csv('citeseer-mrdm05_sample1.csv', header=T, stringsAsFactors = F)
# df2 <- read.csv('citeseer-mrdm05.csv', header=T, stringsAsFactors = F)
# 
# df <- merge(df1, df2, by='paper_id')
# write.csv(df, 'citeseer-mrdm05_sample1_merge.csv', row.names=F)



df_p <- read.csv('citeseer-mrdm05_sample1_merge_processed_2.csv', header=T, stringsAsFactors = F)

df_p_sele1 <- df_p[,c('full_author.x', 'full_author.y_p')]
colnames(df_p_sele1) <- c('feature1', 'feature2')

df_p_sele2 <- df_p[,c('full_author.x', 'title.y_p')]
colnames(df_p_sele2) <- c('feature1', 'feature2')

# df_p_sele3 <- df_p[,c('full_author.y_p', 'title.y_p')]
# colnames(df_p_sele3) <- c('feature1', 'feature2')

df_p_sele <- rbind(df_p_sele1, df_p_sele2)
df_p_sele <- df_p_sele[!(df_p_sele$feature1==df_p_sele$feature2),]
df_p_sele <- unique(df_p_sele)

df_p_sele$feature1 <- trimws(df_p_sele$feature1)
df_p_sele$feature2 <- trimws(df_p_sele$feature2)

mt1 <- cbind(df_p_sele$feature1, df_p_sele$feature2)
g1 <- graph_from_edgelist(mt1, directed=F)

vnames <- V(g1)$name

# nodes connect to both entities under investigation
df_p_sele_ent1 <- df_p_sele[df_p_sele$feature1=='Sukoya Tawaratsumida',]
df_p_sele_ent2 <- df_p_sele[df_p_sele$feature1=='S. Tawaratsumida',]
df_ent1_ent2 <- merge(df_p_sele_ent1, df_p_sele_ent2, by='feature2')

df_ent1_only <- df_p_sele_ent1[!(df_p_sele_ent1$feature2 %in% df_ent1_ent2$feature2),]
df_ent2_only <- df_p_sele_ent2[!(df_p_sele_ent2$feature2 %in% df_ent1_ent2$feature2),]

ul <- 1

# ent1 linked only
nr1 <- nrow(df_ent1_only)
if(nr1>0){
  coord_1 <- data.frame(name=df_ent1_only$feature2, xposi=rep(1*ul-1,nr1), yposi=0.5+seq(nr1))
}else{
  coord_1 <- data.frame(name=character(0), xposi=integer(0), yposi=integer(0))
  # colnames(coord_1) <- c('name', 'xposi', 'yposi')
}
  
# ent1
coord_2 <- data.frame(name=c(df_ent1_ent2$feature1.x[1]), xposi=2*ul-1, yposi=c(1))

# ent1 & ent2 linked
nr3 <- nrow(df_ent1_ent2)
if(nr3>0){
  coord_3 <- data.frame(name=df_ent1_ent2$feature2, xposi=rep(3*ul, nr3), yposi=0.5+seq(nr3))
}else{
  coord_3 <- data.frame()
  colnames(coord_3) <- c('name', 'xposi', 'yposi')
}
  
  
# ent2
coord_4 <- data.frame(name=c(df_ent1_ent2$feature1.y[1]), xposi=4*ul+1, yposi=c(1))

# ent2 linked only
nr5 <- nrow(df_ent2_only)
if(nr5>0){
  coord_5 <- data.frame(name=df_ent2_only$feature2, xposi=rep(5*ul+1, nr5), yposi=0.5+seq(nr5))
}else{
  coord_5 <- data.frame()
  colnames(coord_5) <- c('name', 'xposi', 'yposi')
}

coord <- rbind(coord_1, coord_2, coord_3, coord_4, coord_5)

# align coord with nodes index
dfnode <- data.frame(name=vnames)
coord_align <- merge(dfnode, coord, by='name', all.x=TRUE, sort=FALSE)

coordmx <- cbind(coord_align$xposi, coord_align$yposi)

V(g1)$label.cex=0.8
V(g1)$color <- ifelse(V(g1)$name %in% c('S. Tawaratsumida', 'Sukoya Tawaratsumida'), 'pink', 'lightblue')
plot.igraph(g1, layout=coordmx, vertex.color=V(g1)$color, vertex.frame.color='lightblue', label.font=20)
# plot.igraph(g1, layout=coordmx, vertex.color='lightblue', vertex.frame.color='lightblue', label.font=20)







# # visIgraph(g1)
# vg1 <- toVisNetworkData(g1)
# visNetwork(nodes=vg1$nodes, edges=vg1$edges)
# visPhysics(visNetwork(nodes=vg1$nodes, edges=vg1$edges),stabilization =TRUE)




# ls1 <- c(1,1,2,2,3,3,4,4,5,5)
# ls2 <- c(1,2,1,2,1,2,1,2,1,2)
# 
# mx1 <- t(rbind(ls1, ls2))
# 
# plot(g1, layout=mx1)
# 
# 
# 
# layout.reingold.tilford(g1) 
# 
# plot.igraph(g1)
# 
# visIgraph(g1)





