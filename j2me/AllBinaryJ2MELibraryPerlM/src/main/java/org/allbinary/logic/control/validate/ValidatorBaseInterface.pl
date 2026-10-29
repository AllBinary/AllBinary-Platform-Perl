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
package org::allbinary::logic::control::validate::ValidatorBaseInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isValid {
    my ($self) = @_;
    die "abstract method isValid";
}


sub validationInfo {
    my ($self) = @_;
    die "abstract method validationInfo";
}


sub toHashtable {
    my ($self) = @_;
    die "abstract method toHashtable";
}


sub toList {
    my ($self) = @_;
    die "abstract method toList";
}

use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;

1;

