#column names
feature <- c('feat.1', 'feat.2')
#row names
observation <- c('A', 'B', 'C', 'D', 'E')
#define a 5 x 2 matrix of raw values: 
mRaw <- matrix(c(1,2,2,1.5,1.5,-1.5,-2,-1,-2, 1.5),nrow = 5, byrow = TRUE)
#define a 5 x 2 matrix of origin values:
mOr <- matrix(c(0.5,1,1,0.5,0.5,-1,-0.5,-0.5,0,0.5),nrow = 5, byrow = TRUE)
#assign row and col names
dimnames(mRaw) <- list(observation, feature)
dimnames(mOr) <- list(observation, feature)
#calculate deviation from origin
mDevOr <- mRaw - mOr

#calculate norms
normDevOr <- apply(mDevOr, 1, function(x) {sqrt(sum(x^2))})
#create unit vectors (vectors / norms)
mUnit <- mDevOr / normDevOr
#create similarity matrix
mDevSim <- mUnit %*% t(mUnit)
#convert similarity to degrees
mDegrees <- round(acos(mDevSim) * 180 / pi,0)
mDegrees


