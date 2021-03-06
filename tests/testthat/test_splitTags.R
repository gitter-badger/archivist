test_that("split*Repo does not react on errors as it should and works as it's made to", {
  # Creating example default repository
  exampleRepoDir <- tempfile()
  createEmptyRepo( exampleRepoDir, default = TRUE )
  aoptions('silent', TRUE)
  # what about empty repo
  expect_error(splitTagsLocal())
  
  # Adding new artifacts to repository
  # with not-friendly for this function Tags
  data(iris)
  iris -> d1
  saveToRepo(d1,
             userTags = c(":", "", "\n", "\t", "\\", "\\\\"),
             repoDir = exampleRepoDir )
  expect_equal(nrow(splitTagsLocal()), 14)
  
  expect_equal(names(splitTagsLocal()), c('artifact', 'tagKey',
                                          'tagValue', 'createdDate'))
  
  data(iris3)
  iris3 -> d2
  saveToRepo(d2)
  
  data(longley)
  longley -> d3
  saveToRepo(d3, userTags = 1:2)
  expect_error(splitTagsLocal(1:100))
  expect_equal(ncol(splitTagsLocal()), 4)
  
  deleteRepo(repoDir = exampleRepoDir, deleteRoot = TRUE)
})