comorbidities.icd10
===================

Comorbidities calculator for R using ICD-9 and ICD-10 based scores. Currently only icd-9 codes are implemented and tested.

Methods to categorize ICD-9-CM codes into sensible disease categories have
been developed and published by numerous authors.  Two of the most widely
used such methods are the Deyo adaptation of Charlson index and the
Elixhauser index.  This package has functions to categorize comorbidites
into the Deyo-Charlson index, the original Elixhauser index of 30
comorbidities, and the AHRQ comorbidity index (an update to the original
Elixhauser method).

This package consists of 3 functions: deyo, elixhauser, and ahrq.
The functions are very similar in that they each take as input a data frame
structured such that each row contains a list of ICD-9-CM codes (e.g.
discharge or admission diagnoses) attributed to a single patient. The
function goes from row to row comparing the ICD-9-CM codes a patient has
with the particular comorbidity index that function represents.  If a
patient has a diagnosis (as indicated by ICD-9-CM code) that is one of the
diagnoses in the paritcular index chosen, then the patient is considered to
have this diagnosis.  Regardless of how many different ICD-9-CM codes a
patient has corresponding to a particular comorbidity category, a
comorbidity is only counted once.

The value returned consists of a vector and one or two data frames. The
vector is the total comorbidity count, or in the case of the deyo()
function, the total Charlson score.  The functions elixhauser() and ahrq()
return one data frame.  Each row in the data frame is devoted to a
particular patient, and each column is a diagnosis.  The data frame codes a
0 if the patient does not have that diagnosis and 1 if the patient does have
that diagnosis. The deyo() function returns a second data frame, which codes
the point value of that particular diagnosis in the Charlson score rather
than a 1.

This package is a work upon Paul Gerrards original comorbidities package.