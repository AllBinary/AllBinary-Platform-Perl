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
package org::allbinary::business::category::properties::root::RootCategoryPropertiesInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub setRootFilePath {
    my ($self, $value) = @_;
    die "abstract method setRootFilePath";
}


# throws Exception
sub getRootFilePath {
    my ($self) = @_;
    die "abstract method getRootFilePath";
}

use org::allbinary::logic::io::path::AbPath;

1;

