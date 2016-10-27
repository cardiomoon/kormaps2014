#'Korean administative area and code
#'
#'A dataset
#'
#'  @format A data.frame with 16 rows and 3 columns
#'  \describe{
#'     \item{code}{Korean administative area code}
#'     \item{name}{Korean administative area, level 1}
#'     \item{name2}{abbreviation of area}
#'}
"areacode"


#'New patients with tubeculsosis in South Korea
#'
#'A dataset
#'
#'  @format A long-form data.frame with 255 rows and 5 columns
#'  \describe{
#'     \item{name1}{abbreviation of area}
#'     \item{code}{Korean administative area code}
#'     \item{name}{Korean administative area, level 1}
#'     \item{year}{year}
#'     \item{NewPts}{Number of new patients}
#'}
"tbc"


#'Korean administative map data(2014) level 1
#'
#'A dataset
#'
#'  @format A data.frame with 8831 rows and 11 columns
#'  \describe{
#'     \item{id}{Korean administative area code}
#'     \item{long}{longitude}
#'     \item{lat}{latitude}
#'     \item{order}{An integer}
#'     \item{hole}{A logical}
#'     \item{piece}{Factor with 102 levels}
#'     \item{group}{Factor with 186 levels}
#'     \item{SP_ID}{shape id}
#'     \item{SIDO_CD}{sido code}
#'     \item{SIDO_NM}{sido name in euc-kr}
#'     \item{BASE_YEAR}{2014}
#'     \item{name}{name in utf-8}
#'     \item{name1}{name in euc-kr}
#'     \item{region}{Region}
#'     \item{code}{code}
#'}
"kormap1"

#'Korean administative map data(2014) level 2
#'
#'A dataset
#'
#'  @format A data.frame with 20397 rows and 11 columns
#'  \describe{
#'     \item{id}{Korean administative area code}
#'     \item{long}{longitude}
#'     \item{lat}{latitude}
#'     \item{order}{An integer}
#'     \item{hole}{A logical}
#'     \item{piece}{Factor with 37 levels}
#'     \item{group}{Factor with 401 levels}
#'     \item{SP_ID}{shape id}
#'     \item{base_year}{2014}
#'     \item{sigungu_cd}{sigungu code}
#'     \item{sigungu_name}{sigungu name in euc-kr}
#'     \item{FID}{An integer}
#'     \item{name}{name in utf-8}
#'     \item{name1}{name in euc-kr}
#'     \item{region}{Region}
#'     \item{code}{code}
#'}
"kormap2"

#'Korean administative map data(2014) level 3
#'
#'A dataset
#'
#'  @format A data.frame with 73474 rows and 11 columns
#'  \describe{
#'     \item{id}{Korean administative area code}
#'     \item{long}{longitude}
#'     \item{lat}{latitude}
#'     \item{order}{An integer}
#'     \item{hole}{A logical}
#'     \item{piece}{Factor with 11 levels}
#'     \item{group}{Factor with 3593 levels}
#'     \item{SP_ID}{shape id}
#'     \item{base_year}{2014}
#'     \item{adm_dr_cd}{dong name code}
#'     \item{adm_dr_nm}{dong name in euc-kr}
#'     \item{FID}{An integer}
#'     \item{name}{name in utf-8}
#'     \item{name1}{name in euc-kr}
#'     \item{region}{Region}
#'     \item{code}{code}
#'}
"kormap3"


#'Korean population census data(2015) level 1
#'
#' A dataset
#'
#'  @format A data.frame with 17 rows and 25 columns
"korpop1"


#'Korean population census data(2015) level 2
#'
#' A dataset
#'
#'  @format A data.frame with 306 rows and 25 columns
"korpop2"

#'Korean population census data(2015) level 3
#'
#' A dataset
#'
#'  @format A data.frame with 3492 rows and 25 columns
"korpop3"


#' Change hangul code of colnames and columns of a given data.frame
#'
#' @param popdata A data.frame
#' @param from from A character string describing the current encoding.
#' @param to A character string describing the target encoding.
#' @param change.colnames If true, change the code of colnames of the given data.frame
#' @param cols A integer vector specify the columns to be converted
#' @export
#' @return A converted data.frame
#' @examples
#' changeCode(areacode,cols=2:3)
#'
changeCode=function(popdata,from="UTF-8",to="CP949",change.colnames=TRUE,cols=NULL){

        if(change.colnames){
                colnames(popdata)=iconv(colnames(popdata),from,to)
        }
        if(is.null(cols)) cols=1:ncol(popdata)
        for(i in 1:length(cols)){
                popdata[[cols[i]]]=iconv(popdata[[cols[i]]],from,to)
        }
        popdata
}

# escape_unicode_data=function(data,change.colnames=TRUE,cols=NULL){
#
#         if(change.colnames){
#                 colnames(data)=stringi::stri_escape_unicode(colnames(data))
#         }
#
#         if(is.null(cols)) cols=1:ncol(data)
#         for(i in 1:length(cols)){
#                 data[[cols[i]]]=stringi::stri_escape_unicode(data[[cols[i]]])
#         }
#         data
# }


# unescape_unicode_data=function(data,change.colnames=TRUE,cols=NULL){
#
#         if(change.colnames){
#                 colnames(data)=stringi::stri_unescape_unicode(colnames(data))
#         }
#
#         if(is.null(cols)) cols=1:ncol(data)
#         for(i in 1:length(cols)){
#                 data[[cols[i]]]=stringi::stri_unescape_unicode(data[[cols[i]]])
#         }
#         data
# }

# areacode
# areacode1=escape_unicode_data(areacode)
# areacode1
# areacode2=unescape_unicode_data(areacode1)
# areacode2
# require(ggplot2)
# require(moonBook2)
# ggChoropleth(areacode2,kormap1,"name",interactive=TRUE)
# ggChoropleth(areacode2,kormap1,"name")
# theme_set(theme_gray(base_family="NanumGothic"))
#
# str(kormap1)
# ggChoropleth
# map<-kormap1
# p<-ggplot(data=areacode,aes(map_id=code,fill=name))+
#         expand_limits(x=map$long,y=map$lat)+coord_map()+
#         geom_map(map=map,colour='black',size=0.1)
# p
#
# korpop2015_3new=escape_unicode_data(korpop2015_3)
# str(korpop2015_3new)
# kormap3=escape_unicode_data(kormap3)
# str(kormap2)
# kormap2=kormap2[-c(11,13)]
# kormap2
# kormap2=escape_unicode_data(kormap2)
# str(kormap1)
# kormap1=kormap1[-c(10,13)]
# kormap1
# kormap1=escape_unicode_data(kormap1)
# korpop2015_3=escape_unicode_data(korpop2015_3)
# korpop2015_2=escape_unicode_data(korpop2015_2)
# korpop2015_1=escape_unicode_data(korpop2015_1)
# areacode=escape_unicode_data(areacode)
# areacode
# str(kormap1)
# str(kormap2)
# str(kormap3)
# str(korpop2015_1)
# str(korpop2015_2)
# str(korpop2015_3)
#


# kormap1=readRDS("kormap1.RDS")
# kormap2=readRDS("kormap2.RDS")
# kormap3=readRDS("kormap3.RDS")
#
#
# devtools::use_data(areacode,overwrite=TRUE)
# devtools::use_data(kormap1,overwrite=TRUE)
# devtools::use_data(kormap2,overwrite=TRUE)
# devtools::use_data(kormap3,overwrite=TRUE)
# devtools::use_data(korpop1,overwrite=TRUE)
# devtools::use_data(korpop2,overwrite=TRUE)
# devtools::use_data(korpop3,overwrite=TRUE)


# unescape_all=function(){
#         areacode<<-unescape_unicode_data(areacode)
#         kormap1<<-unescape_unicode_data(kormap1)
#         kormap2<<-unescape_unicode_data(kormap2)
#         kormap3<<-unescape_unicode_data(kormap3)
#         korpop2015_1<<-unescape_unicode_data(korpop2015_1)
#         korpop2015_2<<-unescape_unicode_data(korpop2015_2)
#         korpop2015_3<<-unescape_unicode_data(korpop2015_3)
# }

# .onAttach<-function(libname, pkgname){
#         packageStartupMessage("Welcome to kormaps2014")
#         unescape_all()
# }
