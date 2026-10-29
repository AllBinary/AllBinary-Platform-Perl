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

# Java interface
package org::allbinary::business::category::store::theme::StoreThemeCategoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryInterface','org::allbinary::data::tables::TableMappingInterface','org::allbinary::logic::control::validate::ValidationInterface','org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface';



sub addTheme {
    my ($self, $themeValidation) = @_;
    die "abstract method addTheme";
}


sub getThemes {
    my ($self) = @_;
    die "abstract method getThemes";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::visual::theme::ThemeValidation;
use org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface;

1;

