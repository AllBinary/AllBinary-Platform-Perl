#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::control::search::SearchData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $TOTAL_NUMBER_PAGES = "SEARCHDATA_TOTALNUMBEROFPAGES";
our $TOTAL_NUMBER_ITEMS_ON_THIS_PAGE = "SEARCHDATA_TOTALNUMBEROFITEMSONTHISPAGE";
our $TOTAL_NUMBER_ITEMS = "SEARCHDATA_TOTALNUMBEROFITEMS";
our $DEFAULT_PAGE_LENGTH = 10;
our $GENERATESTATICPAGES = "Generate Static Pages";
our $SEARCHBYSUMMARY = "Search By Summary";
our $SEARCHBYDESCRIPTION = "Search By Description";
our $SEARCHBYCATEGORY = "Search By Category";
our $SEARCHCATEGORIES = "Search Categories";
our $FILENAME = "SEARCHDATA_BASEFILENAME";
our $COLUMNNAME = "COLUMN_NAME";
our $COLUMNVALUE = "COLUMN_VALUE";
our $PARAMS = "SEARCHDATA_PARAMS";
our $LENGTH = "SEARCHDATA_LENGTH";
our $ORDER = "SEARCHDATA_ORDER";
our $PAGE = "SEARCHDATA_PAGE";
our $FIELDS = "SEARCHDATA_FIELDS";
our $FIELD = "SEARCHDATA_FIELD";
our $SORTBY = "SEARCHDATA_SORTBY";
our $TYPE = "SEARCHDATA_TYPE";
our $PAGE_INFO = "pageInfo";
our $SEARCH = "search";
our $MAKEPUBLIC = "Make Public";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

