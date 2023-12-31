###################################################
# Created by Astrid Deschenes
# 2016-12-21
###################################################

###################################################
## Test the validateRunPermutation function
###################################################

METHYL_OBJ_FILE <- system.file("extdata", "methylObj_001.RDS",
                                package = "methylInheritance")

METHYL_OBJ <- readRDS(METHYL_OBJ_FILE)

###########################################################
## validateRunPermutation() function
###########################################################

## Test when methylKitData is a string
test.validateRunPermutation_methylKitData_number <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
            methylKitData = 33, outputDir = "info", runObservedAnalysis = TRUE,
            nbrPermutations = 2, nbrCores = 1, nbrCoresDiffMeth = 1,
            minReads = 10, minMethDiff = 10, qvalue = 0.05,
            maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
            tileSize = 1000, stepSize = 100, vSeed = 222,
            restartCalculation = FALSE, saveInfoByGeneration = FALSE),
            error=conditionMessage)

    exp <- paste0("methylKitData must be a list containing \"methylRawList\" ",
            "entries; each entry must contain all \"methylRaw\" objects ",
            "related to one generation")

    message <- paste0(" test.validateRunPermutation_methylKitData_number() ",
                "- Not valid methylKitData did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when methylKitData is a list of integers
test.validateRunPermutation_methylKitData_list_of_int <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = list(a=c(1,2), b=c(2,2)), type = "sites", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 2, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- paste0("methylKitData must be a list containing \"methylRawList\" ",
                  "entries; each entry must contain all \"methylRaw\" objects ",
                  "related to one generation")

    message <- paste0(" test.validateRunPermutation_methylKitData_list_of_int() ",
                      "- Not valid methylKitData did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when outputDir is a number
test.validateRunPermutation_outputDir_as_number <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "sites", outputDir = 33,
        runObservedAnalysis = TRUE,
        nbrPermutations = 2, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "output_dir must be a character string"

    message <- paste0(" test.validateRunPermutation_outputDir_as_number() ",
                      "- Not valid outputDir did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when runObservedAnalysis is a string
test.validateRunPermutation_runObservedAnalysis_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type="both", outputDir = "info",
        runObservedAnalysis = "allo",
        nbrPermutations = 2, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "runObservedAnalysis must be a logical"

    message <- paste0(" test.validateRunPermutation_runObservedAnalysis_string() ",
                      "- Not valid runObservedAnalysis did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when nbrPermutations is a string
test.validateRunPermutation_nbrPermutations_as_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  type = "sites", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = "TOTO", nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "nbrPermutations must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_nbrPermutations_as_string() ",
                      "- Not valid nbrPermutations did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when nbrCores is zero
test.validateRunPermutation_nbrCores_zero <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 0, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "nbrCores must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_nbrCores_zero() ",
                      "- Not valid nbrCores did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when nbrCores is a negative integer
test.validateRunPermutation_nbrCores_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = FALSE,
        nbrPermutations = 3, nbrCores = -1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "nbrCores must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_nbrCores_negative() ",
                      "- Not valid nbrCores did not generated expected message.")


    checkEquals(obs, exp, msg = message)
}

## Test when nbrCoresDiffMeth is zero
test.validateRunPermutation_nbrCoresDiffMeth_zero <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 0,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "nbrCoresDiffMeth must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_nbrCoresDiffMeth_zero() ",
                      "- Not valid nbrCoresDiffMeth did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when nbrCoresDiffMeth is a negative integer
test.validateRunPermutation_nbrCoresDiffMeth_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = -1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "nbrCoresDiffMeth must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_nbrCoresDiffMeth_negative() ",
                    "- Not valid nbrCoresDiffMeth did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minReads is zero
test.validateRunPermutation_minReads_zero <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 0, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minReads must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minReads_zero() ",
                    "- Not valid minReads did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minReads is negative
test.validateRunPermutation_minReads_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = -1, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minReads must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minReads_negative() ",
                    "- Not valid minReads did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minMethDiff is negative
test.validateRunPermutation_minMethDiff_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff =-0.1, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minMethDiff must be a positive double between [0,100]"

    message <- paste0(" test.validateRunPermutation_minMethDiff_negative() ",
                      "- Not valid minMethDiff did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}


## Test when minMethDiff is above 100
test.validateRunPermutation_minMethDiff_above_100 <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 100.1, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minMethDiff must be a positive double between [0,100]"

    message <- paste0(" test.validateRunPermutation_minMethDiff_above_100() ",
                      "- Not valid minMethDiff did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when qvalue is above 1
test.validateRunPermutation_qvalue_above_1 <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 1.01,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "qvalue must be a positive double between [0,1]"

    message <- paste0(" test.validateRunPermutation_qvalue_above_1() ",
                      "- Not valid qvalue did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when qvalue is negative
test.validateRunPermutation_qvalue_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = -0.01,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "qvalue must be a positive double between [0,1]"

    message <- paste0(" test.validateRunPermutation_qvalue_negative() ",
                      "- Not valid qvalue did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when maxPercReads is not a number
test.validateRunPermutation_maxPercReads_not_number <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = "lala", destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "maxPercReads must be a positive double between [0,100]"

    message <- paste0(" test.validateRunPermutation_maxPercReads_not_number() ",
                      "- Not valid maxPercReads did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when maxPercReads is above 100
test.validateRunPermutation_maxPercReads_above_100 <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 100.1, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "maxPercReads must be a positive double between [0,100]"

    message <- paste0(" test.validateRunPermutation_maxPercReads_above_100() ",
                      "- Not valid maxPercReads did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when maxPercReads is negative
test.validateRunPermutation_maxPercReads_negative <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = -0.1, destrand = TRUE, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "maxPercReads must be a positive double between [0,100]"

    message <- paste0(" test.validateRunPermutation_maxPercReads_negative() ",
                      "- Not valid maxPercReads did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}


## Test when destrand is a number
test.validateRunPermutation_destrand_number <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, type = "both", outputDir = "info",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = 20, minCovBasesForTiles = 2,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "destrand must be a logical"

    message <- paste0(" test.validateRunPermutation_destrand_number() ",
                      "- Not valid destrand did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}


## Test when minCovBasesForTiles is a string and type is both
test.validateRunPermutation_minCovBasesForTiles_string_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ, outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = "ici",
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minCovBasesForTiles must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minCovBasesForTiles_string_type_both() ",
                      "- Not valid minCovBasesForTiles did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minCovBasesForTiles is negative and type is both
test.validateRunPermutation_minCovBasesForTiles_negative_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = -1,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minCovBasesForTiles must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minCovBasesForTiles_negative_type_both() ",
                      "- Not valid minCovBasesForTiles did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minCovBasesForTiles is a string and type is tiles
test.validateRunPermutation_minCovBasesForTiles_string_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = "a",
        tileSize = 1000, stepSize = 100, vSeed = 222, restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minCovBasesForTiles must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minCovBasesForTiles_string_type_tiles() ",
                      "- Not valid minCovBasesForTiles did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when minCovBasesForTiles is negative and type is tiles
test.validateRunPermutation_minCovBasesForTiles_negative_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = -1,
        tileSize = 1000, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "minCovBasesForTiles must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minCovBasesForTiles_negative_type_tiles() ",
                      "- Not valid minCovBasesForTiles did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}


## Test when tileSize is a string and type is both
test.validateRunPermutation_tileSize_string_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = "yes", stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_minCovBasesForTiles_string_type_both() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when tileSize is zero and type is both
test.validateRunPermutation_tileSize_zero_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 0, stepSize = 100, vSeed = 222, restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_tileSize_zero_type_both() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when tileSize is negative and type is both
test.validateRunPermutation_tileSize_negative_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = -1, stepSize = 100, vSeed = 222, restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_tileSize_negative_type_both() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when tileSize is a string and type is tiles
test.validateRunPermutation_tileSize_string_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = "yes", stepSize = 100, vSeed = 222,
        restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_tileSize_string_type_tiles() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}


## Test when tileSize is zero and type is tiles
test.validateRunPermutation_tileSize_zero_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 0, stepSize = 100, vSeed = 222, restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_tileSize_zero_type_tiles() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when tileSize is negative and type is tiles
test.validateRunPermutation_tileSize_negative_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = -1, stepSize = 100, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "tileSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_tileSize_negative_type_tiles() ",
                      "- Not valid tileSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is a string and type is tiles
test.validateRunPermutation_stepSize_string_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = "one", vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSize_string_type_tiles() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is zero and type is tiles
test.validateRunPermutation_stepSizee_zero_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 0, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSizee_zero_type_tiles() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is negative and type is tiles
test.validateRunPermutation_stepSize_negative_type_tiles <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "tiles",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = -1, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSize_negative_type_tiles() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is a string and type is both
test.validateRunPermutation_stepSize_string_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "titi", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = "one", vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSize_string_type_both() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is zero and type is both
test.validateRunPermutation_stepSizee_zero_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "toto", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 0, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSizee_zero_type_both() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when stepSize is negative and type is both
test.validateRunPermutation_stepSize_negative_type_both <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "titi", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = -1, vSeed = 222,
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "stepSize must be a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_stepSize_negative_type_both() ",
                      "- Not valid stepSize did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when vSeed is a string
test.validateRunPermutation_vSeed_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "toto", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 100, vSeed = "222",
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "vSeed must be either -1 or a positive integer or numeric"

    message <- paste0(" test.validateRunPermutation_vSeed_string() ",
                      "- Not valid vSeed did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when vSeed is a string
test.validateRunPermutation_vSeed_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "fofo", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 100, vSeed = "33",
        restartCalculation = FALSE, saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "vSeed must be an integer or numeric"

    message <- paste0(" test.validateRunPermutation_vSeed_string() ",
                      "- Not valid vSeed did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when restartCalculation is a string
test.validateRunPermutation_restartCalculation_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "info", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 100, vSeed = 22,
        restartCalculation = "TRUE", saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- "restartCalculation must be a logical"

    message <- paste0(" test.validateRunPermutation_restartCalculation_string() ",
                      "- Not valid restartCalculation did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when saveInfoByGeneration is a string
test.validateRunPermutation_saveInfoByGeneration_string <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "file", type = "both",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = 10,
        tileSize = 10000, stepSize = 100, vSeed = 22,
        restartCalculation = TRUE, saveInfoByGeneration = "FALSE"),
        error=conditionMessage)

    exp <- "saveInfoByGeneration must be a logical"

    message <- paste0(" test.validateRunPermutation_saveInfoByGeneration_string() ",
                      "- Not valid saveInfoByGeneration did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}

## Test when all parameters valid
test.validateRunPermutation_all_valid_parameters_01 <- function() {
    obs <- tryCatch(methylInheritance:::validateRunPermutation(
        methylKitData = METHYL_OBJ,  outputDir = "TOTO", type = "sites",
        runObservedAnalysis = TRUE,
        nbrPermutations = 3, nbrCores = 1, nbrCoresDiffMeth = 1,
        minReads = 10, minMethDiff = 10, qvalue = 0.05,
        maxPercReads = 99.9, destrand = TRUE, minCovBasesForTiles = -3,
        tileSize = -1, stepSize = -2, vSeed = 22, restartCalculation = FALSE,
        saveInfoByGeneration = FALSE),
        error=conditionMessage)

    exp <- 0

    message <- paste0(" test.validateRunPermutation_all_valid_parameters_01() ",
                      "- All valid parameters did not generated expected message.")

    checkEquals(obs, exp, msg = message)
}
